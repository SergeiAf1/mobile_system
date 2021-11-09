package com.javaschool.mobile.service.Mappers;

import com.javaschool.mobile.dto.OptionDto;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.service.OptionService;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class OptionMapper {

    private final OptionService optionService;

    public OptionMapper(OptionService optionService) {
        this.optionService = optionService;
    }

    public Option toEntity(OptionDto optionDto) {
        if (optionDto == null) {
            return null;
        }
        var option = new Option();
        option.setId(optionDto.getId());
        option.setName(optionDto.getName());
        option.setPrice(optionDto.getPrice());
        option.setConnectionPrice(optionDto.getConnectionPrice());
        if (optionDto.getDependentOptions() == null) {
            option.setDependentOptions(null);
        } else {
            option.setDependentOptions(optionDto.getDependentOptions()
                    .stream()
                    .map(optionService::getOptionByName)
                    .collect(Collectors.toList())
            );
        }
        if (optionDto.getIncompatibleOptions() == null) {
            option.setIncompatibleOptions(null);
        } else {
            option.setIncompatibleOptions(optionDto.getIncompatibleOptions()
                    .stream()
                    .map(optionService::getOptionByName)
                    .collect(Collectors.toList()));
        }
        return option;
    }

    public OptionDto toDto(Option option) {
        if (option == null) {
            return null;
        }
        var optionDto = new OptionDto();
        optionDto.setId(option.getId());
        optionDto.setName(option.getName());
        optionDto.setPrice(option.getPrice());
        optionDto.setConnectionPrice(option.getConnectionPrice());
        optionDto.setDependentOptions(option.getDependentOptions()
                .stream()
                .map(Option::getName)
                .collect(Collectors.toList())
        );
        optionDto.setIncompatibleOptions(option.getIncompatibleOptions()
                .stream()
                .map(Option::getName)
                .collect(Collectors.toList())
        );
        return optionDto;
    }
}
