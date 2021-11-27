package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.ContractDAO;
import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class ContractServiceImpl implements ContractService {

    private final static Logger LOGGER = Logger.getLogger(ContractServiceImpl.class);

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
    @Transactional
    public void saveContract(Contract contract) {

        var contractOptions = contract.getOptions().stream()
                .filter(option -> contract.getTariff().getOptions().contains(option))
                .collect(Collectors.toList());

        var onlyIncompatibleOptions = new ArrayList<Option>();

        contractOptions.stream()
                .filter(option -> option.getIncompatibleOptions().size() > 0)
                .forEach(option -> onlyIncompatibleOptions.addAll(option.getIncompatibleOptions()));

        var incompatibleOptionsWithoutDuplicate = onlyIncompatibleOptions.stream()
                .distinct()
                .collect(Collectors.toList());

        for (Option option1 : incompatibleOptionsWithoutDuplicate) {
            if (contractOptions.contains(option1)) {
                throw new IncompatibleOptionsException("Option " + option1.getName()
                        + " is incompatible with other chosen Option.");
            }
        }

        var onlyDependentOptions = new ArrayList<Option>();

        contractOptions.stream()
                .filter(option -> option.getDependentOptions().size() > 0)
                .forEach(option -> onlyDependentOptions.addAll(option.getDependentOptions()));

        onlyDependentOptions.stream()
                .distinct()
                .filter(option2 -> !contractOptions.contains(option2))
                .forEach(contractOptions::add);

        contract.setOptions(contractOptions);
        contractDAO.save(contract);
        LOGGER.info("Contract with id = " + contract.getId() + " was saved");
    }
//    @Override
//    public void saveContract(Contract contract) {
//
//        var contractOptions = contract.getOptions().stream()
//                .filter(option -> contract.getTariff().getOptions().contains(option))
//                .collect(Collectors.toList());
//
//        var onlyDependentOptions = new ArrayList<Option>();
//
//        contractOptions.stream()
//                .filter(option -> option.getDependentOptions().size() > 0)
//                .forEach(option -> onlyDependentOptions.addAll(option.getDependentOptions()));
//
////        var onlyWithDependent = contractOptions.stream()
////                .filter(option -> option.getDependentOptions().size() > 0)
////                .collect(Collectors.toList());
////        for (Option option : onlyWithDependent) {
////            onlyDependentOptions.addAll(option.getDependentOptions());
////        }
////        var dependentWithoutDuplicate = onlyDependentOptions.stream().distinct()
////                .filter(option2 -> !contractOptions.contains(option2))
////                .collect(Collectors.toList());
////        for (Option opt : dependentWithoutDuplicate) {
////            contractOptions.add(opt);
////        }
//        onlyDependentOptions.stream()
//                .distinct()
//                .filter(option2 -> !contractOptions.contains(option2))
//                .forEach(contractOptions::add);
//
//        contract.setOptions(contractOptions);
//        contractDAO.save(contract);
//    }

    @Override
    public void deleteContract(int id) {
        contractDAO.deleteById(id);
    }

    @Override
    public Contract findContractByPhoneNumber(Long phoneNumber) {
        if (contractDAO.findByPhoneNumber(phoneNumber) == null) {
            LOGGER.info("Contract with phoneNumber = " + phoneNumber + " not found");
            return null;
        }
        LOGGER.info("Contract with phoneNumber = " + phoneNumber + " was found");
        return contractDAO.findByPhoneNumber(phoneNumber);
    }

    @Override
    @Transactional
    public void blockByUser(int id) {
        Contract contract = contractDAO.findById(id).orElse(null);
        if (contract != null) {
            contract.setBlockedByUser(true);
            contractDAO.save(contract);
            LOGGER.info("User has blocked contract with id = " + id);
        }
    }

    @Override
    @Transactional
    public void unBlockByUser(int id) {
        Contract contract = contractDAO.findById(id).orElse(null);
        if (contract != null) {
            contract.setBlockedByUser(false);
            contractDAO.save(contract);
            LOGGER.info("User has unblocked contract with id = " + id);
        }
    }

    @Override
    public Contract createNewContract() {
        Long phone;
        var list = contractDAO.findAll();
        if (list.isEmpty()) {
            phone = 9001000000L;
        } else {
            phone = list.get(list.size() - 1).getPhoneNumber();
        }
        phone++;
        Contract contract = new Contract();
        contract.setEnabled(false);
        contract.setPhoneNumber(phone);
        return contract;
    }

    @Override
    public List<Contract> getFreeContracts() {
        return contractDAO.findAll()
                .stream()
                .filter(contract -> contract.getUser() == null)
                .limit(15)
                .collect(Collectors.toList());
    }

}
