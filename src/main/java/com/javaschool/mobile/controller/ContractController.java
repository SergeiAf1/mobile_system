package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.ContractDto;
import com.javaschool.mobile.service.ContractService;
import com.javaschool.mobile.service.Mappers.ContractMapper;
import com.javaschool.mobile.service.Mappers.TariffMapper;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class ContractController {

    private final ContractService contractService;

    private final TariffService tariffService;

    private final OptionService optionService;

    private final UserService userService;

    private final ContractMapper contractMapper;
    private final TariffMapper tariffMapper;
    private final UserMapper userMapper;

    public ContractController(ContractService contractService, TariffService tariffService, OptionService optionService, UserService userService, ContractMapper contractMapper, TariffMapper tariffMapper, UserMapper userMapper) {
        this.contractService = contractService;
        this.tariffService = tariffService;
        this.optionService = optionService;
        this.userService = userService;
        this.contractMapper = contractMapper;
        this.tariffMapper = tariffMapper;
        this.userMapper = userMapper;
    }

    @RequestMapping("/users/phoneNumber")
    public String findContractByPhoneNumber(@RequestParam("phoneNumber") Long phoneNumber, Model model){
        var user = userMapper.toDto(userService.getUserByPhoneNumber(phoneNumber));
        var users = new ArrayList<>();
        users.add(user);
        model.addAttribute("users",users);
        return "users";
    }
    @GetMapping("/contracts")
    public String allContracts(Model model){
        var contracts = contractService.getAllContracts()
                .stream()
                .map(contractMapper::toDto)
                .collect(Collectors.toList());
        model.addAttribute("contracts", contracts);
        return "contracts";
    }
    @RequestMapping("/add/contracts")
    public String addNewContract(Model model){
        model.addAttribute("contract", new ContractDto());
        model.addAttribute("tariffs", tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .collect(Collectors.toList())
        );
        model.addAttribute("users", userService.getAllUsers()
                .stream()
                .map(userMapper::toDto)
                .collect(Collectors.toList())
        );
        return "contracts-info";
    }
    @PostMapping("/save/contracts")
    public String saveContract(@ModelAttribute("contract") ContractDto contract) {
        contractService.saveContract(contractMapper.toEntity(contract));
        return "redirect:/admin/contracts";
    }
    @RequestMapping ("/update/contracts")
    public String updateContract(@RequestParam("contract_id") int contract_id, Model model){
        model.addAttribute("contract", contractMapper.toDto(contractService.findContractById(contract_id)));
        model.addAttribute("tariffs", tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .collect(Collectors.toList())
        );
        model.addAttribute("users", userService.getAllUsers()
                .stream()
                .map(userMapper::toDto)
                .collect(Collectors.toList())
        );
        return "contracts-info";
    }
}
