package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.OptionDto;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.exceptions.AlreadyExistsException;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
import com.javaschool.mobile.service.Mappers.OptionMapper;
import com.javaschool.mobile.service.OptionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class OptionsController {

    private final static Logger LOGGER = Logger.getLogger(OptionsController.class);

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
    public String saveOption(@ModelAttribute("option") OptionDto option, Model model) {
        try {
            optionService.saveOption(optionMapper.toEntity(option));
            return "redirect:/admin/options";
        } catch (AlreadyExistsException e){
            LOGGER.error("Exception " + e.getMessage());
            model.addAttribute("message",e.getMessage());
            model.addAttribute("redirect","/admin/add/options");
            return "exists-exception";
        } catch (IncompatibleOptionsException e) {
            LOGGER.error("Exception " + e.getMessage());
            model.addAttribute("message",e.getMessage());
            model.addAttribute("redirect","/admin/dependencies?optionId=" + option.getId());
            return "incompatible-exception";
        }

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

    @RequestMapping("/dependencies")
    public String dependency(@RequestParam("optionId") int optionId, Model model){
        var option = optionMapper.toDto(optionService.getOptionById(optionId));
        model.addAttribute("option",option);
        model.addAttribute("optionList",optionService.getAllOptions().stream().map(Option::getName).filter(s -> !s.equals(option.getName())).collect(Collectors.toList()));
        return "option-dependency";
    }
}
