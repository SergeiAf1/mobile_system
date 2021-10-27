package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.OptionDto;
import com.javaschool.mobile.service.Mappers.OptionMapper;
import com.javaschool.mobile.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class OptionsController {

    private final OptionService optionService;

    private final OptionMapper optionMapper;

    @Autowired
    public OptionsController(OptionService optionService, OptionMapper optionMapper) {
        this.optionService = optionService;
        this.optionMapper = optionMapper;
    }

    @GetMapping("/options")
    public String showAllOptions(Model model) {
        var options = optionService.getAllOptions()
                .stream()
                .map(optionMapper::toDto)
                .collect(Collectors.toList());
        model.addAttribute("options", options);
        return "options";
    }

    @PostMapping("/save/options")
    public String saveOption(@ModelAttribute("option") OptionDto option) {
        optionService.saveOption(optionMapper.toEntity(option));
        return "redirect:/admin/options";
    }

    @RequestMapping("/add/options")
    public String addNewOption(Model model) {
        var option = new OptionDto();
        model.addAttribute("option", option);
        return "options-info";
    }

    @RequestMapping("/update/options")
    public String updateOption(@RequestParam("optionId") int optionId, Model model) {
        var option = optionMapper.toDto(optionService.getOptionById(optionId));
        model.addAttribute("option", option);
        return "options-info";
    }

}
