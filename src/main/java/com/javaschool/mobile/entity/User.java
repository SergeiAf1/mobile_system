package com.javaschool.mobile.entity;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    @NotBlank
    @Size(min = 2, max = 25)
    private String name;

    @Column(name = "surname")
    @NotBlank
    @Size(min = 2, max = 25)
    private String surname;

    @Column(name = "birth_date")
    private Date birthDate;

    @Column(name = "passport")
    private String passport;

    @Column(name = "email")
    @Email
    @NotBlank
    private String email;

    @Column(name = "password")
    @NotBlank
    @Size(min = 3, max = 50)
    private String password;

    @Column(name = "enabled")
    private Boolean enabled;

    @Column(name = "address")
    private String address;

    @OneToMany(cascade = CascadeType.ALL)   // type?
    @JoinColumn(name = "user_id")
    private List<Contract> contracts;

    @Column(name = "authority")
    private String role;

    public User() {
    }

    public void addContract(Contract contract){
        if(contracts == null){
            contracts = new ArrayList<>();
        }
        contracts.add(contract);
    }

    public User(String name, String surname, Date birthDate, String passport, String email, String password, Boolean enabled, String address) {
        this.name = name;
        this.surname = surname;
        this.birthDate = birthDate;
        this.passport = passport;
        this.email = email;
        this.password = password;
        this.enabled = enabled;
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", birthDate=" + birthDate +
                ", passport=" + passport +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", contracts=" + contracts +
                '}';
    }
}
