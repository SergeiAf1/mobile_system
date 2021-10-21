package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.User;
import com.javaschool.mobile.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/add/users")
    public String addNewUser(Model model){
        model.addAttribute("user", new User());
        return "user-info";
    }

    @RequestMapping("/save/users")
    public String saveUser(@ModelAttribute("user") User user){
        userService.saveUser(user);
        return "redirect:/admin/users";
    }

    @RequestMapping("/update/users")
    public String updateUser(@RequestParam("user_id") int user_id , Model model){
        model.addAttribute("user", userService.getUserById(user_id));
        return "user-info";
    }



}
