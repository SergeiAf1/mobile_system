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
@RequestMapping("/admins")
public class TariffController {

    private final TariffService tariffService;
    private final OptionService optionService;

    public TariffController(TariffService tariffService, OptionService optionService) {
        this.tariffService = tariffService;
        this.optionService = optionService;
    }

    @GetMapping("/tariffs")
    public String getAllTariffs(Model model){
        List<Tariff> tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "tariffs";
    }
    @GetMapping("/tariffs/{tariff_id}")
    public String getTariffById(@PathVariable int tariff_id, Model model){
        var tariff = tariffService.findById(tariff_id);
        model.addAttribute("tariff", tariff);
        return "tariffs";
    }

    @PostMapping("/tariffs")
    public String saveTariff(@ModelAttribute("tariff") Tariff tariff) {
        tariffService.saveTariff(tariff);
        return "redirect:/admins/tariffs";
    }

    @PutMapping("/tariffs")
    public String updateTariff(@RequestParam("tariffId") int tariffId, Model model){
        Tariff tariff= tariffService.findById(tariffId);
        List<Option> options = tariff.getOptions();
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariff-info";
    }

    @DeleteMapping("/tariffs")
    public String deleteTariff(@RequestParam("tariffId") int id){
        tariffService.deleteTariff(id);
        return "redirect:/admin/tariffs";
    }
}
