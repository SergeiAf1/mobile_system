package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.service.OptionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class OptionsController {

    private final OptionService optionService;

    public OptionsController(OptionService optionService) {
        this.optionService = optionService;
    }

    @GetMapping("/options")
    public String showAllOptions(Model model){
        var options = optionService.getAllOptions();
        model.addAttribute("options", options);
        return "options";
    }
    @PostMapping("/save/options")
    public String saveOption(@ModelAttribute("option") Option option) {
        optionService.saveOption(option);
        return "redirect:/admin/options";
    }
    @RequestMapping("/add/options")
    public String addNewOption(Model model) {
        var option = new Option();
        model.addAttribute("option", option);
        return "options-info";
    }

    @RequestMapping ("/update/options")
    public String updateOption(@RequestParam("optionId") int optionId, Model model){
        var option = optionService.getOptionById(optionId);
        model.addAttribute("option", option);
        return "options-info";
    }

}
