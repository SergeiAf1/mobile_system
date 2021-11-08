package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.OptionDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OptionServiceImpl implements OptionService {

    private final OptionDAO optionDAO;

    @Autowired
    public OptionServiceImpl(OptionDAO optionDAO) {
        this.optionDAO = optionDAO;
    }

    public List<Option> getAllOptions() {
        return optionDAO.findAll();
    }

    @Override
    public void saveOption(Option option) {
        var con =  option.getDependentOptions()
                .stream()
                .anyMatch(option1 -> option.getIncompatibleOptions().contains(option1));
        if(con){
            throw new IncompatibleOptionsException("You can't choose the same option in Dependent and Incompatible options");
        } else optionDAO.save(option);
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

}
