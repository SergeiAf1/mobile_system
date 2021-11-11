package com.javaschool.mobile;

import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MobileSystemApplication {

    private final static Logger LOGGER = Logger.getLogger(MobileSystemApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(MobileSystemApplication.class, args);

        LOGGER.info("App started");
    }

}
