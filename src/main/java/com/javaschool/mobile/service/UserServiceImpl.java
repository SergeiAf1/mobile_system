package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.UserDAO;
import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;

    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public List<User> getAllUsers() {
        return userDAO.findAll();
    }

    @Override
    public User getUserById(int id) {
        return userDAO.findById(id).orElse(null);
    }

    @Override
    public void saveUser(User user) {
        userDAO.save(user);
    }

    @Override
    public void deleteUser(int id) {
        userDAO.deleteById(id);
    }

    @Override
    public User getUserByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    @Override
    public List<String> getUsersDeprecatedTariffs(User user) {
        return user.getContracts().stream().map(Contract::getTariff).filter(tariff -> !tariff.getEnabled()).map(Tariff::getTariffName).collect(Collectors.toList());
    }
}
