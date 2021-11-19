package com.javaschool.mobile.controller;

import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.TariffService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class MyRestController {

    private final TariffService tariffService;

    public MyRestController(TariffService tariffService) {
        this.tariffService = tariffService;
    }

    @GetMapping("/tariffs")
    public List<Tariff> getAll() {
        return tariffService.getAvailableTariffs();
    }
}
