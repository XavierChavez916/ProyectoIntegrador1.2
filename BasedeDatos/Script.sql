-- MySQL Script generated by MySQL Workbench
-- Sun Jul 17 19:19:28 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Comerciales
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Comerciales` ;

-- -----------------------------------------------------
-- Schema Comerciales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Comerciales` DEFAULT CHARACTER SET utf8 ;
USE `Comerciales` ;

-- -----------------------------------------------------
-- Table `Comerciales`.`Paises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Paises` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Paises` (
  `idPais` VARCHAR(15) NOT NULL,
  `nombrePais` VARCHAR(45) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Provincias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Provincias` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Provincias` (
  `idProvincia` VARCHAR(10) NOT NULL,
  `nombreProvincia` VARCHAR(50) NULL,
  `idPais` VARCHAR(15) NOT NULL,
  `poblacion` INT NULL,
  PRIMARY KEY (`idProvincia`),
  INDEX `fk_Provincias_Paises1_idx` (`idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Provincias_Paises1`
    FOREIGN KEY (`idPais`)
    REFERENCES `Comerciales`.`Paises` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Cantones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Cantones` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Cantones` (
  `idCanton` VARCHAR(10) NOT NULL,
  `nombreCanton` VARCHAR(45) NULL,
  `idProvincia` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCanton`),
  INDEX `idProvincia_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `idProvincia`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `Comerciales`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Parroquias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Parroquias` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Parroquias` (
	`idParroquia` VARCHAR(10) NOT NULL,
	`nombreParroquia` VARCHAR(100) NULL,
	`idCanton` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idParroquia`),
  INDEX `idCanton_idx` (`idCanton` ASC) VISIBLE,
  CONSTRAINT `idCanton`
    FOREIGN KEY (`idCanton`)
    REFERENCES `Comerciales`.`Cantones` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Comerciales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Comerciales` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Comerciales` (
  `idComercial` INT NOT NULL,
  `telf1` VARCHAR(15) NULL,
  `telf2` VARCHAR(15) NULL,
  `email` VARCHAR(100) NULL,
  `web` VARCHAR(100) NULL,
  `nombreComercial` VARCHAR(100) NULL,
  `direccion` VARCHAR(500) NULL,
  `referenciaDireccion` VARCHAR(2000) NULL,
  `idParroquia` VARCHAR(10) NOT NULL,
  `actividad` VARCHAR(50) NULL,
  `clasificacion` VARCHAR(50) NULL,
  `categoria` VARCHAR(100) NULL,
  PRIMARY KEY (`idComercial`),
  INDEX `fk_Comerciales_Parroquias1_idx` (`idParroquia` ASC) VISIBLE,
  CONSTRAINT `fk_Comerciales_Parroquias1`
    FOREIGN KEY (`idParroquia`)
    REFERENCES `Comerciales`.`Parroquias` (`idParroquia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Personal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Personal` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Personal` (
  `idPersonal` INT NOT NULL,
  `nombrePersona` VARCHAR(100) NULL,
  `nacionalidad` VARCHAR(50) NULL,
  `email` VARCHAR(100) NULL,
  `emisionLicencia` DATETIME NULL,
  `idCanton` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idPersonal`),
  INDEX `fk_Personal_Cantones1_idx` (`idCanton` ASC) VISIBLE,
  CONSTRAINT `fk_Personal_Cantones1`
    FOREIGN KEY (`idCanton`)
    REFERENCES `Comerciales`.`Cantones` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Ventas` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Ventas` (
  `idVenta` INT NOT NULL,
  `ventaTotal` BIGINT NULL,
  `anio` VARCHAR(4) NULL,
  `idProvincia` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Ventas_Provincias1_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Provincias1`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `Comerciales`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- INSERTS 

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Paises.csv'
INTO TABLE Paises
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Provincias.csv'
INTO TABLE Provincias
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Cantones.csv'
INTO TABLE Cantones
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Parroquias.csv'
INTO TABLE Parroquias
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Comerciales.csv'
INTO TABLE Comerciales
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Personal.csv'
INTO TABLE Personal
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/jonathanerazoborrero/Desktop/Universidad/ciclo 4/Proyecto Integrador/Base de Datos/Ventas.csv'
INTO TABLE Ventas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
