package com.javaschool.mobile.service;

import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.entity.User;

import java.util.List;

public interface UserService {
    List<User> getAllUsers();
    User getUserById(int id);
    void saveUser(User user);
    void deleteUser(int id);
	User getUserByEmail(String email);
}
