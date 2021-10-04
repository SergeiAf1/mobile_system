package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.Contract;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContractDAO extends JpaRepository<Contract,Integer> {
}
