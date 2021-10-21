package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.User;
import com.javaschool.mobile.service.ContractService;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class MyController {

    private final TariffService tariffService;

    private final UserService userService;

    private final ContractService contractService;

    private final UserMapper userMapper;

    public MyController(TariffService tariffService, UserService userService, ContractService contractService, UserMapper userMapper) {
        this.tariffService = tariffService;
        this.userService = userService;
        this.contractService = contractService;
        this.userMapper = userMapper;
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
        model.addAttribute("tariffs", tariffService.getAllTariffs());
        model.addAttribute("user",userService.getUserByEmail(currentPrincipalName));
        return "user";
    }

    @GetMapping("/admin/users")
    public String getAllUsers(Model model) {
        var users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

//    @RequestMapping("/user/change")
//    public String changeEmailOrPassword(@RequestParam("user_id") int user_id, Model model){
//        model.addAttribute("user", userService.getUserById(user_id));
//        return "user-change";
//    }
    @RequestMapping("/user/update/contract")
    public String updateUserContract(@RequestParam("contract_id") int contract_id, Model model){
        model.addAttribute("contract", contractService.findContractById(contract_id));
        model.addAttribute("tariffs", tariffService.getAllTariffs());
        return "contract-info";
    }
    @PostMapping("/user/save/contracts")
    public String saveUserContract(@ModelAttribute("contract") Contract contract) {
        contractService.saveContract(contract);
        return "redirect:/user";
    }

    @RequestMapping("/user/update/options")
    public String updateUserOptions(@RequestParam("contract_id") int contract_id, Model model){
        model.addAttribute("contract", contractService.findContractById(contract_id));
        model.addAttribute("options",contractService.findContractById(contract_id).getTariff().getOptions());
        return "option-info";
    }




}
