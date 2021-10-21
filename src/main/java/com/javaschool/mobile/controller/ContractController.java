package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.ContractService;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class ContractController {

    private final ContractService contractService;

    private final TariffService tariffService;

    private final OptionService optionService;

    public ContractController(ContractService contractService, TariffService tariffService, OptionService optionService) {
        this.contractService = contractService;
        this.tariffService = tariffService;
        this.optionService = optionService;
    }

    @RequestMapping("/contracts/phoneNumber")
    public String findContractByPhoneNumber(@RequestParam("phone") Long phone, Model model){
        var contract = contractService.findContractByPhoneNumber(phone);
        var options = contract.getOptions();
        model.addAttribute("contract",contract);
        model.addAttribute("options",options);
        return "contract";
    }
    @GetMapping("/contracts")
    public String allContracts(Model model){
        var contracts = contractService.getAllContracts();
        model.addAttribute("contracts", contracts);
        return "contracts";
    }
    @RequestMapping("/add/contracts")
    public String addNewContract(Model model){
        var contract = new Contract();
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("contract", contract);
        model.addAttribute("tariffs", tariffs);
        return "contracts-info";
    }
    @PostMapping("/save/contracts")
    public String saveContract(@ModelAttribute("contract") Contract contract) {
        contractService.saveContract(contract);
        return "redirect:/admin/contracts";
    }
    @RequestMapping ("/update/contracts")
    public String updateContract(@RequestParam("contract_id") int contract_id, Model model){
        var contract = contractService.findContractById(contract_id);
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("contract", contract);
        model.addAttribute("tariffs", tariffs);
        return "contracts-info";
    }
}
