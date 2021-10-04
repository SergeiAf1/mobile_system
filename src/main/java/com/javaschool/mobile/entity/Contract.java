package com.javaschool.mobile.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "contract")
public class Contract {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)    //? type?
    @JoinColumn(name = "tariff_id")
    private Tariff tariff;

    @Column(name = "phone_number")
    private Long phoneNumber;

    @Column(name = "is_blocked")
    private Boolean isBlocked;

    @ManyToMany(cascade = CascadeType.ALL)           // type?
    @JoinTable(name = "contract_tariff_options"
            ,joinColumns = @JoinColumn(name = "contract_id")
            ,inverseJoinColumns = @JoinColumn(name = "tariff_options_id"))
    private List<Option> options;


    public Contract() {
    }

    public void addOptionsToContract(Option option){
        if(options == null){
            options = new ArrayList<>();
        }
        options.add(option);
    }

    public Contract(Long phoneNumber, Boolean isBlocked) {
        this.phoneNumber = phoneNumber;
        this.isBlocked = isBlocked;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", phoneNumber=" + phoneNumber +
                ", isBlocked=" + isBlocked +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Tariff getTariff() {
        return tariff;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getBlocked() {
        return isBlocked;
    }

    public void setBlocked(Boolean blocked) {
        isBlocked = blocked;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }
}
