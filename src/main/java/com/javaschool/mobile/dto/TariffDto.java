package com.javaschool.mobile.dto;

import java.util.List;

public class TariffDto {

    private int id;

    private String tariffName;

    private  int price;

    private Boolean enabled;

    private List<String> options;

    public TariffDto() {
    }

    public TariffDto(int id, String tariffName, int price, Boolean enabled, List<String> options) {
        this.id = id;
        this.tariffName = tariffName;
        this.price = price;
        this.enabled = enabled;
        this.options = options;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTariffName() {
        return tariffName;
    }

    public void setTariffName(String tariffName) {
        this.tariffName = tariffName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }
}
