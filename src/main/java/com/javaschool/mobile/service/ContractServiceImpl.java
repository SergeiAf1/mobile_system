package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.ContractDAO;
import com.javaschool.mobile.entity.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ContractServiceImpl implements ContractService {

    private final ContractDAO contractDAO;

    @Autowired
    public ContractServiceImpl(ContractDAO contractDAO) {
        this.contractDAO = contractDAO;
    }


    @Override
    public List<Contract> getAllContracts() {
        return contractDAO.findAll();
    }

    @Override
    public Contract findContractById(int id) {
        return contractDAO.findById(id).orElse(null);
    }

    @Override
    public void saveContract(Contract contract) {
        contractDAO.save(contract);
    }

    @Override
    public void deleteContract(int id) {
        contractDAO.deleteById(id);
    }

    @Override
    public Contract findContractByPhoneNumber(Long phoneNumber) {
        if(contractDAO.findByPhoneNumber(phoneNumber) == null){
            return null;
        }
        return contractDAO.findByPhoneNumber(phoneNumber);
    }

    @Override
    public void blockByUser(int id) {
        Contract contract = contractDAO.findById(id).orElse(null);
        contract.setBlockedByUser(true);
        contractDAO.save(contract);
    }

    @Override
    public void unBlockByUser(int id) {
        Contract contract = contractDAO.findById(id).orElse(null);
        contract.setBlockedByUser(false);
        contractDAO.save(contract);
    }
}
