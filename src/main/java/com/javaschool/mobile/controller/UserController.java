package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.service.ContractService;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class UserController {

    private final UserService userService;

    private final ContractService contractService;

    private final UserMapper userMapper;

    public UserController(UserService userService, ContractService contractService, UserMapper userMapper) {
        this.userService = userService;
        this.contractService = contractService;
        this.userMapper = userMapper;
    }

    @RequestMapping("/add/users")
    public String addNewUser(Model model) {
        model.addAttribute("user", new UserDto());
        return "user-info";
    }

    @RequestMapping("/save/users")
    public String saveUser(@ModelAttribute("user") UserDto user) {
        userService.saveUser(userMapper.toEntity(user));
        return "redirect:/admin/users";
    }

    @RequestMapping("/update/users")
    public String updateUser(@RequestParam("user_id") int user_id, Model model) {
        model.addAttribute("user", userMapper.toDto(userService.getUserById(user_id)));
        return "user-info";
    }

    @RequestMapping("/users/email")
    public String findContractByPhoneNumber(@RequestParam("email") String email, Model model){
        var user = userMapper.toDto(userService.getUserByEmail(email));
        var users = new ArrayList<>();
        users.add(user);
        model.addAttribute("users",users);
        model.addAttribute("search",email);
        return "users";
    }

}
