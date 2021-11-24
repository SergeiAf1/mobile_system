package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.ContractDAO;
import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static java.util.Optional.ofNullable;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class ContractServiceImplTest {

    @Mock
    private ContractDAO contractDAO;

    @InjectMocks
    private ContractServiceImpl contractService;

    private Contract contract;
    private Contract contract2;
    private List<Contract> contractList;
    private Option option;
    private Option option2;
    private List<Option> optionList;
    private List<Option> incompatible;
    private Tariff tariff;

    @BeforeEach
    public void setup() {
        contract = new Contract(9009000000L, true);
        contract2 = new Contract(9001000000L, true);
        contract.setId(1);
        contract2.setId(2);
        contractList = new ArrayList<>();
        contractList.add(contract);
        contractList.add(contract2);
        option = new Option();
        option2 = new Option();
        optionList = new ArrayList<>();
        incompatible = new ArrayList<>();
        tariff = new Tariff();
    }

    @Test
    void getAllContracts() {
        when(contractDAO.findAll()).thenReturn(contractList);
        List<Contract> found = contractService.getAllContracts();
        assertEquals(contractList, found);
    }

    @Test
    void shouldFindContractById() {
        when(contractDAO.findById(contract.getId())).thenReturn(ofNullable(contract));
        Contract found = contractService.findContractById(contract.getId());
        assertEquals(contract, found);
    }

    @Test
    void shouldNotFindContractById() {
        when(contractDAO.findById(contract.getId())).thenReturn(ofNullable(contract2));
        Contract found = contractService.findContractById(contract.getId());
        assertNotEquals(contract, found);
    }

    @Test
    void saveContractShouldThrowIncompatibleOptionsException() {
        incompatible.add(option2);
        option.setIncompatibleOptions(incompatible);
        option2.setIncompatibleOptions(new ArrayList<>());
        optionList.add(option);
        optionList.add(option2);
        tariff.setOptions(optionList);
        contract.setTariff(tariff);
        contract.setOptions(optionList);
        assertThrows(IncompatibleOptionsException.class, () -> contractService.saveContract(contract));
    }

    @Test
    void findContractByPhoneNumber() {
        when(contractDAO.findByPhoneNumber(contract.getPhoneNumber())).thenReturn(contract);
        Contract found = contractService.findContractByPhoneNumber(contract.getPhoneNumber());
        assertEquals(contract, found);
    }
}