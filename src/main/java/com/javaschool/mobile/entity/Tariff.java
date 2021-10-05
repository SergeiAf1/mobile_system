package com.javaschool.mobile.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

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

    @ManyToMany(cascade = CascadeType.ALL)            // type?
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
        options.add(option);
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
                "id=" + id +
                ", tariffName='" + tariffName + '\'' +
                ", price=" + price +
                '}';
    }
}
