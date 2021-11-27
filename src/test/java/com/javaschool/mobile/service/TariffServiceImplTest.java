package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.TariffDAO;
import com.javaschool.mobile.entity.Tariff;
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
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

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

    @BeforeEach
    public void setup() {
        tariff = new Tariff();
        tariff.setId(1);
        tariff.setTariffName("firstTariff");
        tariff2 = new Tariff();
        tariff2.setId(2);
        tariff2.setTariffName("secondTariff");
        tariffList = new ArrayList<>();
        tariffList.add(tariff);
        tariffList.add(tariff2);
    }

    @Test
    void shouldFindById() {
        when(tariffDAO.findById(1)).thenReturn(ofNullable(tariff));
        Tariff foundTariff = tariffService.findById(1);
        assertEquals(tariff, foundTariff);
    }

    @Test
    void shouldNotFindById() {
        when(tariffDAO.findById(1)).thenReturn(ofNullable(tariff));
        Tariff foundTariff = tariffService.findById(1);
        assertNotEquals(tariff2, foundTariff);
    }

    @Test
    void shouldFindByName() {
        when(tariffDAO.findTariffByTariffName(tariff.getTariffName())).thenReturn(tariff);
        Tariff foundTariff = tariffService.findByName("firstTariff");
        assertEquals(tariff, foundTariff);
    }

    @Test
    void shouldNotFindByName() {
        when(tariffDAO.findTariffByTariffName("secondTariff")).thenReturn(tariff);
        Tariff foundTariff = tariffService.findByName("secondTariff");
        assertNotEquals(tariff2, foundTariff);
    }

    @Test
    void shouldFindAll() {
        when(tariffDAO.findAll()).thenReturn(tariffList);
        List<Tariff> found = tariffService.getAllTariffs();
        assertEquals(tariffList, found);
    }
}