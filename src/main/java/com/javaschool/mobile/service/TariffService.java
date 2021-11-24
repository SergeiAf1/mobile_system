package com.javaschool.mobile.service;

import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;

import java.util.List;


public interface TariffService {
    Tariff findById(int id);
    List<Tariff> getAllTariffs();
    void saveTariff(Tariff tariff);
    void deleteTariff(int id);
    Tariff findByName(String name);
    List<Tariff> getAvailableTariffs();

}
