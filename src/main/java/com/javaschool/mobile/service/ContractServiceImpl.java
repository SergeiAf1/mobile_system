package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.ContractDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ContractServiceImpl implements ContractService{

    private final ContractDAO contractDAO;

    @Autowired
    public ContractServiceImpl(ContractDAO contractDAO) {
        this.contractDAO = contractDAO;
    }
}
