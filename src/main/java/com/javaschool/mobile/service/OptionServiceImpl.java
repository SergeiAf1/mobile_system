package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.OptionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OptionServiceImpl implements OptionService{
    @Autowired
    private OptionDAO optionDAO;
}
