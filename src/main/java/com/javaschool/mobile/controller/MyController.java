package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class MyController {

    private final TariffService tariffService;

    private final UserService userService;

    public MyController(TariffService tariffService, UserService userService) {
        this.tariffService = tariffService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String login() {
        return "redirect:login";
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        var users = userService.getAllUserDto();
        model.addAttribute("users",users);
        return "admin";
    }

    @GetMapping("/user/tariffs/{id}")
    public String getAllTariffs(@PathVariable int id, Model model){
        Tariff tariff=tariffService.findById(id);
        String tariffName = tariff.getTariffName();
        model.addAttribute("tariffName", tariffName);
        return "user";
    }

    @GetMapping("/user")
    public String getAllTariffs(Model model){
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "user";
    }


}
