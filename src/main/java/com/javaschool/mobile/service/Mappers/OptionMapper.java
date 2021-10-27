package com.javaschool.mobile.service.Mappers;

import com.javaschool.mobile.dto.OptionDto;
import com.javaschool.mobile.entity.Option;
import org.springframework.stereotype.Component;

@Component
public class OptionMapper {

    public Option toEntity(OptionDto optionDto){
        var option = new Option();
        option.setId(optionDto.getId());
        option.setName(optionDto.getName());
        option.setPrice(optionDto.getPrice());
        option.setConnectionPrice(optionDto.getConnectionPrice());
        return option;
    }

    public OptionDto toDto(Option option){
        var optionDto = new OptionDto();
        optionDto.setId(option.getId());
        optionDto.setName(option.getName());
        optionDto.setPrice(option.getPrice());
        optionDto.setConnectionPrice(option.getConnectionPrice());
        return optionDto;
    }
}
