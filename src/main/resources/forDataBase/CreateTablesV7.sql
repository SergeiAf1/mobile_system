-- -----------------------------------------------------
-- Schema javaschool
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `javaschool` ;

-- -----------------------------------------------------
-- Schema javaschool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `javaschool` DEFAULT CHARACTER SET utf8 ;
USE `javaschool` ;

-- -----------------------------------------------------
-- Table `javaschool`.`options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`options` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`options` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL unique,
    `price` INT NULL DEFAULT 0,
    `connection_price` INT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `javaschool`.`tariff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`tariff` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`tariff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL unique,
  `price` INT NULL default 0,
  `enabled` TINYINT DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `javaschool`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`users` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `surname` VARCHAR(45) NOT NULL,
    `passport` VARCHAR(10) NULL DEFAULT 0,
    `email` VARCHAR(45) NOT NULL UNIQUE,
    `birth_date` DATE NULL,
    `password` VARCHAR(45) NULL DEFAULT 'user',
    `address` VARCHAR(225) NULL DEFAULT '',
    `enabled` TINYINT DEFAULT 1 NULL,
    `authority` VARCHAR(45) DEFAULT 'ROLE_USER' null,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `javaschool`.`contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`contract` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`contract` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tariff_id` INT NULL,
    `user_id` INT NULL,
    `phone_number` BIGINT NOT NULL UNIQUE,
    `enabled` TINYINT DEFAULT 1 NULL,
    `blocked_by_user` TINYINT DEFAULT 0 NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`tariff_id`)
        REFERENCES `javaschool`.`tariff` (`id`),
    FOREIGN KEY (`user_id`)
        REFERENCES `javaschool`.`users` (`id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `javaschool`.`tariff_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`tariff-options` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`tariff_options` (
    `tariff_id` INT NOT NULL,
    `option_id` INT NOT NULL,
    PRIMARY KEY (`tariff_id` , `option_id`),
    FOREIGN KEY (`option_id`)
        REFERENCES `javaschool`.`options` (`id`),
    FOREIGN KEY (`tariff_id`)
        REFERENCES `javaschool`.`tariff` (`id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `javaschool`.`contract_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`contract_options` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`contract_options` (
    `contract_id` INT NOT NULL,
    `option_id` INT NOT NULL,
    PRIMARY KEY (`contract_id` , `option_id`),
    FOREIGN KEY (`contract_id`)
        REFERENCES `javaschool`.`contract` (`id`),
    FOREIGN KEY (`option_id`)
        REFERENCES `javaschool`.`options` (`id`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `javaschool`.`dependent_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`dependent_options` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`dependent_options` (
    `option_id` INT NOT NULL,
    `dependent_option_id` INT NOT NULL,
    PRIMARY KEY (`option_id` , `dependent_option_id`),
    FOREIGN KEY (`option_id`)
        REFERENCES `javaschool`.`options` (`id`),
    FOREIGN KEY (`dependent_option_id`)
        REFERENCES `javaschool`.`options` (`id`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `javaschool`.`incompatible_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javaschool`.`incompatible_options` ;

CREATE TABLE IF NOT EXISTS `javaschool`.`incompatible_options` (
    `option_id` INT NOT NULL,
    `incompatible_option_id` INT NOT NULL,
    PRIMARY KEY (`option_id` , `incompatible_option_id`),
    FOREIGN KEY (`option_id`)
        REFERENCES `javaschool`.`options` (`id`),
    FOREIGN KEY (`incompatible_option_id`)
        REFERENCES `javaschool`.`options` (`id`)
)  ENGINE=INNODB;