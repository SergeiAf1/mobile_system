package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientDAO extends JpaRepository<Client,Integer> {
}
