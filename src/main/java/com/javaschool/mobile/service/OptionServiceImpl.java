package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.OptionDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.exceptions.AlreadyExistsException;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeoutException;

@Service
public class OptionServiceImpl implements OptionService {

    private final static Logger LOGGER = Logger.getLogger(OptionServiceImpl.class);

    private final OptionDAO optionDAO;

    private final MQService mqService;

    @Autowired
    public OptionServiceImpl(OptionDAO optionDAO, MQService mqService) {
        this.optionDAO = optionDAO;
        this.mqService = mqService;
    }

    public List<Option> getAllOptions() {
        return optionDAO.findAll();
    }

    @Override
    @Transactional
    public void saveOption(Option option) {
        if (option.getId() == 0) {
            boolean result = optionDAO.findAll().stream()
                    .anyMatch(option1 -> option.getName().equals(option1.getName()));
            if(result){
                throw new AlreadyExistsException("Option with name = '" + option.getName() + "' already exists");
            }
        }
        var con = option.getDependentOptions()
                .stream()
                .anyMatch(option1 -> option.getIncompatibleOptions().contains(option1));
        if (con) {
            throw new IncompatibleOptionsException("You can't choose the same option in Dependent and Incompatible options");
        } else optionDAO.save(option);

        LOGGER.info("Option " + option.getName() + " was saved");

        sendMessage("Option " + option.getName() + " was saved");
    }

    @Override
    public void deleteOption(int id) {
        optionDAO.deleteById(id);
    }

    @Override
    public Option getOptionById(int id) {
        return optionDAO.findById(id).orElse(null);
    }

    @Override
    public Option getOptionByName(String name) {
        return optionDAO.findOptionByName(name);
    }

    private void sendMessage(String message) {
        try {
            mqService.sendMessage(message);
        } catch (IOException | TimeoutException e) {
            LOGGER.warn("Couldn't send message. " + e.getMessage());
        }
    }

}
