package com.javaschool.mobile.dto;

import com.javaschool.mobile.entity.Contract;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

public class UserDto {

    @NotBlank
    @Size(min = 2, max = 25)
    private String name;
    @NotBlank
    @Size(min = 2, max = 25)
    private String surName;
    @Email
    @NotBlank
    private String email;

    private List<Contract> contracts;

    private Boolean enabled;

    public String getName() {
        return name;
    }

    public void addContract(Contract contract) {
        if (contracts == null) {
            contracts = new ArrayList<>();
        }
        contracts.add(contract);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surName) {
        this.surName = surName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public UserDto(String name, String surName, String email, List<Contract> contracts, Boolean enabled) {
        this.name = name;
        this.surName = surName;
        this.email = email;
        this.contracts = contracts;
        this.enabled = enabled;
    }

    public UserDto() {
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "name='" + name + '\'' +
                ", surName='" + surName + '\'' +
                ", email='" + email + '\'' +
                ", contracts=" + contracts +
                ", enabled=" + enabled +
                '}';
    }
}
