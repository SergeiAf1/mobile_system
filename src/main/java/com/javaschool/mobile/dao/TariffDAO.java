package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.Tariff;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TariffDAO extends JpaRepository<Tariff,Integer> {
    Tariff findTariffByTariffName(String name);
}
