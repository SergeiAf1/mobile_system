package com.javaschool.mobile.entity;

import javax.persistence.*;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "tariff")
public class Tariff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String tariffName;

    @Column(name = "price")
    private  int price;

    @Column(name = "enabled")
    private Boolean enabled;

    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)            // type?
    @JoinTable(name = "tariff_options"
            , joinColumns = @JoinColumn(name = "tariff_id")
            , inverseJoinColumns = @JoinColumn(name = "option_id"))
    private List<Option> options;

    public Tariff() {
    }

    public void addOptionToTariff(Option option){
        if(options == null){
            options = new ArrayList<>();
        }
        if(!(options.contains(option))){
            options.add(option);
        }
    }

    public Tariff(String tariffName, int price, Boolean enabled, List<Option> options) {
        this.tariffName = tariffName;
        this.price = price;
        this.enabled = enabled;
        this.options = options;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public Tariff(String tariffName, int price) {
        this.tariffName = tariffName;
        this.price = price;
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

    @Override
    public String toString() {
        return "Tariff{" +
                "tariffName='" + tariffName + '\'' +
                ", price=" + price +
                '}';
    }

}
