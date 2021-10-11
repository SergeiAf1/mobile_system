package com.javaschool.mobile.service;

import com.javaschool.mobile.entity.Option;

import java.util.List;

public interface OptionService {
    List<Option> getAllOptions();
    void saveOption(Option option);
    void deleteOption(int id);
    Option getOptionById(int id);
}
