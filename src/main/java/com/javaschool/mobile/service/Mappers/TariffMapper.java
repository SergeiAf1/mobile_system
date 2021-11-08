package com.javaschool.mobile.service.Mappers;

import com.javaschool.mobile.dto.TariffDto;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.entity.Tariff;
import com.javaschool.mobile.service.OptionService;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class TariffMapper {

    private final OptionService optionService;

    public TariffMapper(OptionService optionService) {
        this.optionService = optionService;
    }

    public TariffDto toDto(Tariff tariff) {
        if(tariff == null){
            return null;
        }
        TariffDto tariffDto = new TariffDto();
        tariffDto.setId(tariff.getId());
        tariffDto.setTariffName(tariff.getTariffName());
        tariffDto.setPrice(tariff.getPrice());
        tariffDto.setEnabled(tariff.getEnabled());
        if (tariff.getOptions() == null) {
            tariffDto.setOptions(null);
        } else {
            tariffDto.setOptions(tariff.getOptions()
                    .stream()
                    .map(Option::getName)
                    .collect(Collectors.toList())
            );
        }
        return tariffDto;
    }

    public Tariff toEntity(TariffDto tariffDto) {
        if(tariffDto == null){
            return null;
        }
        Tariff tariff = new Tariff();
        tariff.setId(tariffDto.getId());
        tariff.setTariffName(tariffDto.getTariffName());
        tariff.setPrice(tariffDto.getPrice());
        tariff.setEnabled(tariffDto.getEnabled());
        if (tariffDto.getOptions() == null) {
            tariff.setOptions(null);
        } else {
            tariff.setOptions(tariffDto.getOptions()
                    .stream()
                    .map(optionService::getOptionByName)
                    .collect(Collectors.toList())
            );
        }
        return tariff;
    }
}
