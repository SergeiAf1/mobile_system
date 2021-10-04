package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.ClientDAO;
import com.javaschool.mobile.entity.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService{
    @Autowired
    private ClientDAO clientDAO;
}
