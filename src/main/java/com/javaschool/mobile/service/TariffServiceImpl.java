package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TariffServiceImpl implements TariffService{
    @Autowired
    private TariffDAO tariffDAO;
}
