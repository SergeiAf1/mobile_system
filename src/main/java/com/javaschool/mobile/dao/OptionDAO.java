package com.javaschool.mobile.dao;

import com.javaschool.mobile.entity.Option;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OptionDAO extends JpaRepository<Option,Integer> {
    Option findOptionByName(String name);
}
