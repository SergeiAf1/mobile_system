package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.TariffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class MyController {

    @Autowired
    private TariffService tariffService;

    @GetMapping("/")
    public String login() {
        return "redirect:login";
    }
    @GetMapping("/user")
    public String user() {
        return "user";
    }
    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }

    @GetMapping("/user/tariffs/{id}")
    public String getAllTariffs(@PathVariable int id, Model model){
        Tariff tariff=tariffService.findById(id);
        String tariffName = tariff.getTariffName();
        model.addAttribute("tariffName", tariffName);
        return "user";
    }


}
