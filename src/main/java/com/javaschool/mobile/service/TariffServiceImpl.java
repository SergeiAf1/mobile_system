package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Tariff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TariffServiceImpl implements TariffService {

    private final TariffDAO tariffDAO;

    @Autowired
    public TariffServiceImpl(TariffDAO tariffDAO) {
        this.tariffDAO = tariffDAO;
    }

    @Override
    public Tariff findById(int id) {
        return tariffDAO.findById(id).get();
    }
}
