package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Address;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.AddressService;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;


@Controller
public class MyController {

    private final TariffService tariffService;

    private final UserService userService;

    private final AddressService addressService;

    private final UserMapper userMapper;

    public MyController(TariffService tariffService, UserService userService, AddressService addressService, UserMapper userMapper) {
        this.tariffService = tariffService;
        this.userService = userService;
        this.addressService = addressService;
        this.userMapper = userMapper;
    }

    @GetMapping("/")
    public String login() {
        return "redirect:login";
    }

    @GetMapping("/admins")
    public String admin(Model model) {
        var use = userService.getAllUsers();
        var users = use.stream().map(userMapper::mapToUserDto).collect(Collectors.toList());
        model.addAttribute("users",users);
        return "admin";
    }

    @GetMapping("/users/tariffs/{id}")
    public String getAllTariffs(@PathVariable int id, Model model){
        Tariff tariff=tariffService.findById(id);
        String tariffName = tariff.getTariffName();
        model.addAttribute("tariffName", tariffName);
        return "user";
    }
    @GetMapping("/users/addresses/{id}")
    public String getAddress(@PathVariable int id, Model model){
        Address address = addressService.getAddressById(id);
        model.addAttribute("address", address);
        return "user";
    }

    @GetMapping("/users")
    public String getAllTariffs(Model model){
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "user";
    }


}
