package com.javaschool.mobile.dto;

public class OptionDto {

    private int id;

    private String name;

    private int price;

    private int connectionPrice;

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
