package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.UserDAO;
import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.service.Mappers.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserDAO userDAO, UserMapper userMapper) {
        this.userDAO = userDAO;
        this.userMapper = userMapper;
    }

    @Override
    public List<UserDto> getAllUserDto() {
        var users = userDAO.findAll();
        return users.stream().map(userMapper::mapToUserDto)
                .collect(Collectors.toList());
    }
}
