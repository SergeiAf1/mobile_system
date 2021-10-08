package com.javaschool.mobile.service;

import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.entity.User;

import java.util.List;

public interface UserService {
    List<UserDto> getAllUserDto();
}
