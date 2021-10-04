package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.AddressDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService{
    @Autowired
    private AddressDAO addressDAO;

}
