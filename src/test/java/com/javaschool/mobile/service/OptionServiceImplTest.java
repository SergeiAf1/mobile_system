package com.javaschool.mobile.service;

import com.javaschool.mobile.dao.OptionDAO;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.exceptions.IncompatibleOptionsException;
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
class OptionServiceImplTest {

    @Mock
    private OptionDAO optionDAO;

    @InjectMocks
    private OptionServiceImpl optionService;

    private Option option;
    private Option option2;
    private List<Option> optionList;
    private List<Option> dependent;
    private List<Option> incompatible;

    @BeforeEach
    public void setup() {
        option = new Option();
        option2 = new Option();
        option.setId(1);
        option2.setId(2);
        option.setName("o1");
        option2.setName("o2");
        optionList = new ArrayList<>();
        optionList.add(option);
        optionList.add(option2);
        dependent = new ArrayList<>();
        incompatible = new ArrayList<>();
    }

    @Test
    void getAllOptions() {
        when(optionDAO.findAll()).thenReturn(optionList);
        List<Option> found = optionService.getAllOptions();
        assertEquals(optionList, found);
    }

    @Test
    void saveOptionShouldThrowException() {
        dependent.add(option);
        incompatible.add(option);
        option2.setDependentOptions(dependent);
        option2.setIncompatibleOptions(incompatible);
        assertThrows(IncompatibleOptionsException.class, () -> optionService.saveOption(option2));
    }

    @Test
    void shouldGetOptionById() {
        when(optionDAO.findById(option.getId())).thenReturn(ofNullable(option));
        Option found = optionService.getOptionById(option.getId());
        assertEquals(option, found);
    }

    @Test
    void shouldNotGetOptionById() {
        when(optionDAO.findById(option2.getId())).thenReturn(ofNullable(option));
        Option found = optionService.getOptionById(option2.getId());
        assertNotEquals(option2, found);
    }

    @Test
    void shouldGetOptionByName() {
        when(optionDAO.findOptionByName(option.getName())).thenReturn(option);
        Option found = optionService.getOptionByName(option.getName());
        assertEquals(option, found);
    }

    @Test
    void shouldNotGetOptionByName() {
        when(optionDAO.findOptionByName(option2.getName())).thenReturn(option);
        Option found = optionService.getOptionByName(option2.getName());
        assertNotEquals(option2, found);
    }
}