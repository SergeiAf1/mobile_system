package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;

@Service
public class TariffServiceImpl implements TariffService {

    private final static Logger LOGGER = Logger.getLogger(TariffServiceImpl.class);

    private final TariffDAO tariffDAO;
    private final MQService mqService;

    @Autowired
    public TariffServiceImpl(TariffDAO tariffDAO, MQService mqService) {
        this.tariffDAO = tariffDAO;
        this.mqService = mqService;
    }

    @Override
    public Tariff findById(int id) {
        return tariffDAO.findById(id).orElse(null);
    }

    @Override
    public List<Tariff> getAllTariffs() {
        return tariffDAO.findAll();
    }

    @Override
    @Transactional
    public void saveTariff(Tariff tariff) {

        var tariffOptions = tariff.getOptions();

        var onlyDependentOptions = new ArrayList<Option>();

        tariff.getOptions().stream()
                .filter(option -> option.getDependentOptions().size() > 0)
                .forEach(option -> onlyDependentOptions.addAll(option.getDependentOptions()));

        onlyDependentOptions.stream()
                .distinct()
                .filter(option -> !tariffOptions.contains(option))
                .forEach(tariffOptions::add);

        tariff.setOptions(tariffOptions);
        tariffDAO.save(tariff);
        LOGGER.info("Tariff " + tariff.getTariffName() + " was saved");
        sendMessage("Tariff " + tariff.getTariffName() + " was saved");
    }

    @Override
    @Transactional
    public void deleteTariff(int id) {
        tariffDAO.deleteById(id);
    }

    @Override
    public Tariff findByName(String name) {
        return tariffDAO.findTariffByTariffName(name);
    }

    @Override
    public List<Tariff> getAvailableTariffs() {
        return tariffDAO.findAll()
                .stream()
                .filter(Tariff::getEnabled)
                .collect(Collectors.toList());
    }

    private void sendMessage(String message) {
        try {
            mqService.sendMessage(message);
        } catch (IOException | TimeoutException e) {
            LOGGER.warn("Couldn't send message. " + e.getMessage());
        }
    }

}
