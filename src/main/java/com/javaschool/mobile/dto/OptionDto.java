package com.javaschool.mobile.dto;

import java.util.ArrayList;
import java.util.List;

public class OptionDto {

    private int id;

    private String name;

    private int price;

    private int connectionPrice;

    private List<String> dependentOptions = new ArrayList<>();

    private List<String> incompatibleOptions = new ArrayList<>();

    public OptionDto() {
    }

    public OptionDto(int id, String name, int price, int connectionPrice) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.connectionPrice = connectionPrice;
    }

    public int getId() {
        return id;
    }

    public List<String> getDependentOptions() {
        return dependentOptions;
    }

    public void setDependentOptions(List<String> dependentOptions) {
        this.dependentOptions = dependentOptions;
    }

    public List<String> getIncompatibleOptions() {
        return incompatibleOptions;
    }

    public void setIncompatibleOptions(List<String> incompatibleOptions) {
        this.incompatibleOptions = incompatibleOptions;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getConnectionPrice() {
        return connectionPrice;
    }

    public void setConnectionPrice(int connectionPrice) {
        this.connectionPrice = connectionPrice;
    }
}
