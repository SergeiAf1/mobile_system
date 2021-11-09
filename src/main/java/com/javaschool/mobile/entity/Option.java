package com.javaschool.mobile.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "options")
public class Option {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private int price;

    @Column(name = "connection_price")
    private int connectionPrice;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "dependent_options"
            , joinColumns = @JoinColumn(name = "option_id")
            , inverseJoinColumns = @JoinColumn(name = "dependent_option_id"))
    private List<Option> dependentOptions;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "incompatible_options"
            , joinColumns = @JoinColumn(name = "option_id")
            , inverseJoinColumns = @JoinColumn(name = "incompatible_option_id"))
    private List<Option> incompatibleOptions;

    public Option() {
    }

    public Option(String name, int price, int connectionPrice) {
        this.name = name;
        this.price = price;
        this.connectionPrice = connectionPrice;
    }

    public List<Option> getDependentOptions() {
        return dependentOptions;
    }

    public void setDependentOptions(List<Option> dependentOptions) {
        this.dependentOptions = dependentOptions;
    }

    public List<Option> getIncompatibleOptions() {
        return incompatibleOptions;
    }

    public void setIncompatibleOptions(List<Option> incompatibleOptions) {
        this.incompatibleOptions = incompatibleOptions;
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

    @Override
    public String toString() {
        return "Option{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", connectionPrice=" + connectionPrice +
                '}';
    }
}
