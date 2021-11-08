package com.javaschool.mobile.service.Mappers;


import com.javaschool.mobile.dto.UserDto;
import com.javaschool.mobile.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class UserMapper {

    private final ContractMapper contractMapper;

    @Autowired
    public UserMapper(ContractMapper contractMapper) {
        this.contractMapper = contractMapper;
    }

    public UserDto toDto(User user) {
        if(user == null){
            return null;
        }
        var userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setName(user.getName());
        userDto.setSurname(user.getSurname());
        userDto.setEmail(user.getEmail());
        userDto.setAddress(user.getAddress());
        userDto.setPassport(user.getPassport());
        userDto.setPassword(user.getPassword());
        userDto.setBirthDate(user.getBirthDate());
        userDto.setEnabled(user.getEnabled());
        userDto.setRole(user.getRole());
        if (user.getContracts() == null) {
            userDto.setContracts(null);
        } else {
            userDto.setContracts(user.getContracts()
                    .stream()
                    .map(contractMapper::toDto)
                    .collect(Collectors.toList())
            );
        }
        return userDto;
    }

    public User toEntity(UserDto userdto) {
        if(userdto == null){
            return null;
        }
        var user = new User();
        user.setId(userdto.getId());
        user.setName(userdto.getName());
        user.setSurname(userdto.getSurname());
        user.setEmail(userdto.getEmail());
        user.setAddress(userdto.getAddress());
        user.setPassport(userdto.getPassport());
        user.setPassword(userdto.getPassword());
        user.setBirthDate(userdto.getBirthDate());
        user.setEnabled(userdto.getEnabled());
        user.setRole(userdto.getRole());
        if (userdto.getContracts() == null) {
            user.setContracts(null);
        } else {
            user.setContracts(userdto.getContracts()
                    .stream()
                    .map(contractMapper::toEntity)
                    .collect(Collectors.toList())
            );
        }
        return user;
    }

}
