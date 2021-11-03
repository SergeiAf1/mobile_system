package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.ContractDto;
import com.javaschool.mobile.dto.TariffDto;
import com.javaschool.mobile.service.ContractService;
import com.javaschool.mobile.service.Mappers.ContractMapper;
import com.javaschool.mobile.service.Mappers.OptionMapper;
import com.javaschool.mobile.service.Mappers.TariffMapper;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;


@Controller
public class MyController {

    private final TariffService tariffService;
    private final UserService userService;
    private final ContractService contractService;
    private final OptionService optionService;
    private final UserMapper userMapper;
    private final TariffMapper tariffMapper;
    private final OptionMapper optionMapper;
    private final ContractMapper contractMapper;

    public MyController(TariffService tariffService, UserService userService, ContractService contractService, OptionService optionService, UserMapper userMapper, TariffMapper tariffMapper, OptionMapper optionMapper, ContractMapper contractMapper) {
        this.tariffService = tariffService;
        this.userService = userService;
        this.contractService = contractService;
        this.optionService = optionService;
        this.userMapper = userMapper;
        this.tariffMapper = tariffMapper;
        this.optionMapper = optionMapper;
        this.contractMapper = contractMapper;
    }

    @GetMapping("/")
    public String login() {
        return "redirect:login";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admins";
    }

    @GetMapping("/user")
    public String getAllTariffs(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        model.addAttribute("user", userMapper.toDto(userService.getUserByEmail(currentPrincipalName)));
        return "user";
    }

    @GetMapping("/admin/users")
    public String getAllUsers(Model model) {
        var users = userService.getAllUsers()
                .stream()
                .map(userMapper::toDto)
                .collect(Collectors.toList());
        model.addAttribute("users", users);
        return "users";
    }

    @RequestMapping("/user/update/tariffs")
    public String updateUserContract(@RequestParam("contract_id") int contract_id, Model model) {
        model.addAttribute("contract", contractMapper.toDto(contractService.findContractById(contract_id)));
        var tariffs = tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .filter(TariffDto::getEnabled)
                .collect(Collectors.toList());
        model.addAttribute("tariffs", tariffs);
        return "contract-info";
    }

    @PostMapping("/user/save/contracts")
    public String saveUserContract(@ModelAttribute("contract") ContractDto contract) {
        contractService.saveContract(contractMapper.toEntity(contract));
        return "redirect:/user";
    }

    @RequestMapping("/user/update/options")
    public String updateUserOptions(@RequestParam("contract_id") int contract_id, Model model) {
        model.addAttribute("contract", contractMapper.toDto(contractService.findContractById(contract_id)));
        model.addAttribute("options", contractService.findContractById(contract_id).getTariff().getOptions()
                .stream()
                .map(optionMapper::toDto)
                .collect(Collectors.toList())
        );
        return "option-info";
    }

    @RequestMapping("/user/tariffs")
    public String showAllTariffsAndOptions(Model model) {
        model.addAttribute("tariffs", tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .filter(TariffDto::getEnabled)
                .collect(Collectors.toList())
        );
        model.addAttribute("oldtariffs", tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .filter(t -> !t.getEnabled())
                .collect(Collectors.toList())
        );
        model.addAttribute("options", optionService.getAllOptions()
                .stream()
                .map(optionMapper::toDto)
                .collect(Collectors.toList())
        );
        return "all-tariffs";
    }

    @RequestMapping("/user/blockContracts/{contract_id}")
    public String blockContractByUser(@PathVariable("contract_id") int contract_id){
        contractService.blockByUser(contract_id);
        return "redirect:/user";
    }

    @RequestMapping("/user/unblockContracts/{contract_id}")
    public String unBlockContractByUser(@PathVariable("contract_id") int contract_id){
        contractService.unBlockByUser(contract_id);
        return "redirect:/user";
    }


}
