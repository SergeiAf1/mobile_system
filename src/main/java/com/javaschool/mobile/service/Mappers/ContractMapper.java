package com.javaschool.mobile.service.Mappers;

import com.javaschool.mobile.dto.ContractDto;
import com.javaschool.mobile.entity.Contract;
import com.javaschool.mobile.entity.Option;
import com.javaschool.mobile.service.OptionService;
import com.javaschool.mobile.service.TariffService;
import com.javaschool.mobile.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class ContractMapper {

    private final TariffService tariffService;
    private final OptionService optionService;
    private final UserService userService;

    @Autowired
    public ContractMapper(TariffService tariffService, OptionService optionService, UserService userService) {
        this.tariffService = tariffService;
        this.optionService = optionService;
        this.userService = userService;
    }


    public ContractDto toDto(Contract contract) {
        var contractDto = new ContractDto();
        contractDto.setId(contract.getId());
        contractDto.setPhoneNumber(contract.getPhoneNumber());
        contractDto.setEnabled(contract.getEnabled());
        contractDto.setBlockedByUser(contract.getBlockedByUser());
        if (contract.getTariff() == null) {
            contractDto.setTariffName(null);
        } else contractDto.setTariffName(contract.getTariff().getTariffName());
        if (contract.getOptions() == null) {
            contractDto.setOptions(null);
        } else {
            contractDto.setOptions(contract.getOptions()
                    .stream()
                    .map(Option::getName)
                    .collect(Collectors.toList())
            );
        }
        if (contract.getUser() == null) {
            contractDto.setUserEmail(null);
        } else {
            contractDto.setUserEmail(contract.getUser().getEmail());
        }
        return contractDto;
    }

    public Contract toEntity(ContractDto contractDto) {
        var contract = new Contract();
        contract.setId(contractDto.getId());
        contract.setPhoneNumber(contractDto.getPhoneNumber());
        contract.setEnabled(contractDto.getEnabled());
        contract.setBlockedByUser(contractDto.getBlockedByUser());
        if (contractDto.getTariffName() == null) {
            contract.setTariff(null);
        } else {
            contract.setTariff(tariffService.findByName(contractDto.getTariffName()));
        }
        if (contractDto.getOptions() == null) {
            contract.setOptions(null);
        } else {
            contract.setOptions(contractDto.getOptions()
                    .stream()
                    .map(optionService::getOptionByName)
                    .collect(Collectors.toList())
            );
        }
        if (contractDto.getUserEmail() == null) {
            contract.setUser(null);
        } else {
            contract.setUser(userService.getUserByEmail(contractDto.getUserEmail()));
        }
        return contract;
    }
}
