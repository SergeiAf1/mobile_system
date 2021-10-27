package com.javaschool.mobile.dto;


import com.javaschool.mobile.entity.Contract;

import java.sql.Date;
import java.util.List;

public class UserDto {

    private int id;

    private String name;

    private String surname;

    private Date birthDate;

    private String passport;

    private String email;

    private String password;

    private Boolean enabled;

    private String address;

    private List<ContractDto> contracts;

    private String role;

    public UserDto() {
    }

    public UserDto(int id, String name, String surname, Date birthDate, String passport, String email, String password, Boolean enabled, String address, List<ContractDto> contracts, String role) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.birthDate = birthDate;
        this.passport = passport;
        this.email = email;
        this.password = password;
        this.enabled = enabled;
        this.address = address;
        this.contracts = contracts;
        this.role = role;
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<ContractDto> getContracts() {
        return contracts;
    }

    public void setContracts(List<ContractDto> contracts) {
        this.contracts = contracts;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
