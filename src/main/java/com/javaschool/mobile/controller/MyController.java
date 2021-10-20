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

    @GetMapping("/admin")
    public String admin() {
        return "admins";
    }

    @GetMapping("/user")
    public String getAllTariffs(Model model) {
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "user";
    }

    @GetMapping("/admin/users")
    public String getAllUsers(Model model) {
        var users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }


}
