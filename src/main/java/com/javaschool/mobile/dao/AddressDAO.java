package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressDAO extends JpaRepository<Address,Integer> {
}
