package com.javaschool.mobile.service;


import com.javaschool.mobile.entity.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> getAllContracts();
    Contract findContractById(int id);
    void saveContract(Contract contract);
    void deleteContract(int id);
    Contract findContractByPhoneNumber(Long phoneNumber);
    void blockByUser(int id);
    void unBlockByUser(int id);

}
