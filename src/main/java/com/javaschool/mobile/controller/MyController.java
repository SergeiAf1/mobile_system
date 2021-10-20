package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.User;
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

    private final UserMapper userMapper;

    public MyController(TariffService tariffService, UserService userService, UserMapper userMapper) {
        this.tariffService = tariffService;
        this.userService = userService;
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
        User user = userService.getUserByEmail(currentPrincipalName);
        var tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        model.addAttribute("user",user);
        return "user";
    }

    @GetMapping("/admin/users")
    public String getAllUsers(Model model) {
        var users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @RequestMapping("/user/change")
    public String changeEmailOrPassword(@RequestParam("user_id") int user_id, Model model){
        var user = userService.getUserById(user_id);
        model.addAttribute("user", user);
        return "user-change";
    }



}
