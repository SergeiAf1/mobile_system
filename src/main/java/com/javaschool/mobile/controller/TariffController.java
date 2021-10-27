package com.javaschool.mobile.controller;

import com.javaschool.mobile.dto.TariffDto;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.service.Mappers.TariffMapper;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class TariffController {

    private final TariffService tariffService;
    private final OptionService optionService;
    private final TariffMapper tariffMapper;

    public TariffController(TariffService tariffService, OptionService optionService, TariffMapper tariffMapper) {
        this.tariffService = tariffService;
        this.optionService = optionService;
        this.tariffMapper = tariffMapper;
    }

    @GetMapping("/tariffs")
    public String getAllTariffs(Model model) {
        List<TariffDto> tariffs = tariffService.getAllTariffs()
                .stream()
                .map(tariffMapper::toDto)
                .collect(Collectors.toList())
                ;
        model.addAttribute("tariffs", tariffs);
        return "tariffs";
    }

    @PostMapping("/save/tariffs")
    public String saveTariff(@ModelAttribute("tariff") TariffDto tariff) {
        tariffService.saveTariff(tariffMapper.toEntity(tariff));
        return "redirect:/admin/tariffs";
    }

    @RequestMapping("/update/tariffs")
    public String updateTariff(@RequestParam("tariff_id") int id, Model model) {
        var tariff = tariffMapper.toDto(tariffService.findById(id));
        var options = optionService.getAllOptions()
                .stream()
                .map(Option::getName)
                .collect(Collectors.toList())
                ;
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariffs-info";
    }

    @RequestMapping("/add/tariffs")
    public String addNewTariff(Model model) {
        var tariff = new TariffDto();
        var options = optionService.getAllOptions()
                .stream()
                .map(Option::getName)
                .collect(Collectors.toList())
                ;
        tariff.setOptions(options);
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariffs-info";
    }

}
