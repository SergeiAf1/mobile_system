package com.javaschool.mobile.dto;

import java.util.List;

public class ContractDto {

    private int id;

    private Long phoneNumber;

    private Boolean enabled;

    private Boolean blockedByUser = false;

    private String tariffName;

    private List<String> options;

    private String userEmail;

    public ContractDto() {
    }

    public ContractDto(int id, Long phoneNumber, Boolean enabled, Boolean blockedByUser, String tariffName, List<String> options, String userEmail) {
        this.id = id;
        this.phoneNumber = phoneNumber;
        this.enabled = enabled;
        this.tariffName = tariffName;
        this.options = options;
        this.userEmail = userEmail;
        this.blockedByUser = blockedByUser;
    }

    public Boolean getBlockedByUser() {
        return blockedByUser;
    }

    public void setBlockedByUser(Boolean blockedByUser) {
        this.blockedByUser = blockedByUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getTariffName() {
        return tariffName;
    }

    public void setTariffName(String tariffName) {
        this.tariffName = tariffName;
    }

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
