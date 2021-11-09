package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TariffServiceImpl implements TariffService {

    private final TariffDAO tariffDAO;

    @Autowired
    public TariffServiceImpl(TariffDAO tariffDAO) {
        this.tariffDAO = tariffDAO;
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
    }

    @Override
    public void deleteTariff(int id) {
        tariffDAO.deleteById(id);
    }

    @Override
    public Tariff findByName(String name) {
        return tariffDAO.findTariffByTariffName(name);
    }

}
