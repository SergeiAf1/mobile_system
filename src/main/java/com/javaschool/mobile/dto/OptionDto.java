package com.javaschool.mobile.dto;

import java.util.Set;

public class OptionDto {

    private int id;

    private String name;

    private int price;

    private int connectionPrice;

    private Set<String> dependentOptions;

    private Set<String> incompatibleOptions;

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

    public Set<String> getDependentOptions() {
        return dependentOptions;
    }

    public void setDependentOptions(Set<String> dependentOptions) {
        this.dependentOptions = dependentOptions;
    }

    public Set<String> getIncompatibleOptions() {
        return incompatibleOptions;
    }

    public void setIncompatibleOptions(Set<String> incompatibleOptions) {
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
