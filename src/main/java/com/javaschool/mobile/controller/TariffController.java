package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class TariffController {

    private final TariffService tariffService;
    private final OptionService optionService;

    public TariffController(TariffService tariffService, OptionService optionService) {
        this.tariffService = tariffService;
        this.optionService = optionService;
    }

    @GetMapping("/tariffs")
    public String getAllTariffs(Model model) {
        List<Tariff> tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "tariffs";
    }

    @PostMapping("/save/tariffs")
    public String saveTariff(@ModelAttribute("tariff") Tariff tariff) {
        tariffService.saveTariff(tariff);
        return "redirect:/admin/tariffs";
    }

    @RequestMapping("/update/tariffs")
    public String updateTariff(@RequestParam("tariff_id") int id, Model model) {
        var tariff = tariffService.findById(id);
        var options = optionService.getAllOptions();
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariffs-info";
    }

    @RequestMapping("/add/tariffs")
    public String addNewTariff(Model model) {
        var tariff = new Tariff();
        var options = optionService.getAllOptions();
        tariff.setOptions(options);
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariffs-info";
    }

}
