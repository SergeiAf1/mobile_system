package com.javaschool.mobile.service.Mappers;


import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.entity.User;

public class UserMapper {

    public UserDto mapToUserDto(User user){
        var userDto = new UserDto();
        userDto.setName(user.getName());
        userDto.setSurName(user.getSurname());
        userDto.setEmail(user.getEmail());
        userDto.setContracts(user.getContracts());
        userDto.setEnabled(user.getEnabled());
        return userDto;
    }
    public User mapToUser(UserDto userDto){
        var user = new User();
        user.setName(userDto.getName());
        user.setSurname(userDto.getSurName());
        user.setEmail(userDto.getEmail());
        user.setContracts(userDto.getContracts());
        user.setEnabled(userDto.getEnabled());
        return user;
    }
}
