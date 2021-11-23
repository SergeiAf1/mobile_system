package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Tariff;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class TariffServiceImplTest {

    @Mock
    private TariffDAO tariffDAO;

    @InjectMocks
    private TariffServiceImpl tariffService;

    private Tariff tariff;
    private Tariff tariff2;
    private List<Tariff> tariffList;


    @Test
    void findById() {
    }

    @Test
    void saveTariff() {
    }

    @Test
    void deleteTariff() {
    }

    @Test
    void findByName() {
    }
}