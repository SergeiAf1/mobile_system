package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.UserDAO;
import com.javaschool.mobile.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static java.util.Optional.ofNullable;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class UserServiceImplTest {

    @Mock
    private UserDAO userDAO;

    @InjectMocks
    private UserServiceImpl userService;

    private User user;
    private User user2;
    private List<User> userList;

    @BeforeEach
    public void setup() {
        user = new User();
        user2 = new User();
        userList = new ArrayList<>();
        user.setId(1);
        user2.setId(2);
        userList.add(user);
        userList.add(user2);
        user.setEmail("user@mail");
    }

    @Test
    void shouldGetAllUsers() {
        when(userDAO.findAll()).thenReturn(userList);
        List<User> found = userService.getAllUsers();
        assertEquals(userList, found);
    }

    @Test
    void shouldGetUserById() {
        when(userDAO.findById(user.getId())).thenReturn(ofNullable(user));
        User found = userService.getUserById(user.getId());
        assertEquals(user, found);
    }

    @Test
    void shouldNotGetUserById() {
        when(userDAO.findById(user.getId())).thenReturn(ofNullable(user2));
        User found = userService.getUserById(user.getId());
        assertNotEquals(user, found);
    }


    @Test
    void shouldGetUserByEmail() {
        when(userDAO.findByEmail(user.getEmail())).thenReturn(user);
        User found = userService.getUserByEmail(user.getEmail());
        assertEquals(user, found);
    }

    @Test
    void shouldNotGetUserByEmail() {
        when(userDAO.findByEmail(user.getEmail())).thenReturn(user2);
        User found = userService.getUserByEmail(user.getEmail());
        assertNotEquals(user, found);
    }

}