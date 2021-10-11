package com.javaschool.mobile.service;

import com.javaschool.mobile.entity.Address;

import java.util.List;

public interface AddressService {

    Address getAddressById(int id);
    void saveAddress(Address address);
    void deleteAddress(int id);
    List<Address> getAllAddresses();
}
