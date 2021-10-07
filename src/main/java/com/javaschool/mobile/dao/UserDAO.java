package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User,Integer> {
}
