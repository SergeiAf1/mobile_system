package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.exceptions.AlreadyExistsException;
import com.javaschool.mobile.service.Mappers.UserMapper;
import com.javaschool.mobile.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class UserController {

    private final static Logger LOGGER = Logger.getLogger(UserController.class);

    private final UserService userService;

    private final UserMapper userMapper;

    public UserController(UserService userService, UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        var users = userService.getAllUsers()
                .stream()
                .map(userMapper::toDto)
                .collect(Collectors.toList());
        model.addAttribute("users", users);
        return "users";
    }

    @RequestMapping("/add/users")
    public String addNewUser(Model model) {
        model.addAttribute("user", new UserDto());
        return "user-info";
    }

    @RequestMapping("/save/users")
    public String saveUser(@ModelAttribute("user") UserDto user, Model model) {
        try {
            userService.saveUser(userMapper.toEntity(user));
            return "redirect:/admin/users";
        } catch (AlreadyExistsException e) {
            LOGGER.error("Exception " + e.getMessage());
            model.addAttribute("message",e.getMessage());
            model.addAttribute("redirect","/admin/add/users");
            return "exists-exception";
        }
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
