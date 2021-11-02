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

    @Column(name = "enabled")
    private Boolean enabled;

    @Column(name = "blocked_by_user")
    private Boolean blockedByUser = false;

    @ManyToOne(cascade = CascadeType.ALL , fetch = FetchType.EAGER )
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToMany(cascade = CascadeType.ALL)           // type?
    @JoinTable(name = "contract_options"
            ,joinColumns = @JoinColumn(name = "contract_id")
            ,inverseJoinColumns = @JoinColumn(name = "option_id"))
    private List<Option> options;


    public Contract() {
    }

    public void addOptionsToContract(Option option){
        if(options == null){
            options = new ArrayList<>();
        }
        options.add(option);
    }

    public Contract(Long phoneNumber, Boolean enabled) {
        this.phoneNumber = phoneNumber;
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", phoneNumber=" + phoneNumber +
                ", enabled=" + enabled +
                '}';
    }

    public Boolean getBlockedByUser() {
        return blockedByUser;
    }

    public void setBlockedByUser(Boolean blockedByUser) {
        this.blockedByUser = blockedByUser;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
