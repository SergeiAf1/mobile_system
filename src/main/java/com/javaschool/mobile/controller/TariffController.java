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
public class TariffController {

    private final TariffService tariffService;
    private final OptionService optionService;

    public TariffController(TariffService tariffService, OptionService optionService) {
        this.tariffService = tariffService;
        this.optionService = optionService;
    }

    @GetMapping("/admin/tariffs")
    public String getAllTariffs(Model model){
        List<Tariff> tariffs = tariffService.getAllTariffs();
        model.addAttribute("tariffs", tariffs);
        return "tariffs";
    }

    @PostMapping("/saveTariff")
    public String saveTariff(@ModelAttribute("tariff") Tariff tariff) {
        tariffService.saveTariff(tariff);
        return "redirect:/admin/tariffs";
    }

    @RequestMapping("/admin/updateInfo")
    public String updateEmployee(@RequestParam("tariffId") int tariffId, Model model){
        Tariff tariff= tariffService.findById(tariffId);
        List<Option> options = tariff.getOptions();
        model.addAttribute("tariff", tariff);
        model.addAttribute("options", options);
        return "tariff-info";
    }

    @RequestMapping("/admin/addNewTariff")
    public String addNewTariff(Model model){
        Tariff tariff = new Tariff();
        List<Option> optionsList = optionService.getAllOptions();
        model.addAttribute("tariff", tariff);
        model.addAttribute("optionsList",optionsList);
        return "tariff-info";
    }
    @RequestMapping("/admin/saveTariff")
    public String saveEmployee(@ModelAttribute("tariff") Tariff tariff) {
        tariffService.saveTariff(tariff);
        return "redirect:/admin/tariffs";
    }

    @RequestMapping("/deleteTariff")
    public String deleteTariff(@RequestParam("tariffId") int id){
        tariffService.deleteTariff(id);
        return "redirect:/admin/tariffs";
    }
}
