package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.AddressDAO;
import com.javaschool.mobile.entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    private final AddressDAO addressDAO;

    @Autowired
    public AddressServiceImpl(AddressDAO addressDAO) {
        this.addressDAO = addressDAO;
    }

    @Override
    public Address getAddressById(int id) {
        return addressDAO.findById(id).orElse(null);
    }

    @Override
    public void saveAddress(Address address) {
        addressDAO.save(address);
    }

    @Override
    public void deleteAddress(int id) {
        addressDAO.deleteById(id);
    }

    @Override
    public List<Address> getAllAddresses() {
        return addressDAO.findAll();
    }
}
