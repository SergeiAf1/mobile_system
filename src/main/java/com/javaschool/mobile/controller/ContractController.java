package com.javaschool.mobile.controller;

import com.javaschool.mobile.service.ContractService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ContractController {

    private final ContractService contractService;

    public ContractController(ContractService contractService) {
        this.contractService = contractService;
    }

    @GetMapping("/contracts/{phoneNumber}")
    public String findContractByPhoneNumber(@PathVariable Long phoneNumber, Model model){
        var contract = contractService.findContractByPhoneNumber(phoneNumber);
        var options = contract.getOptions();
        model.addAttribute("contract",contract);
        model.addAttribute("options",options);
        return "contract";
    }
}
