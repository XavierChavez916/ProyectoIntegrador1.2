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
  `idProvincia` INT NOT NULL,
  `nombreProvincia` VARCHAR(45) NULL,
  `idPais` VARCHAR(15) NOT NULL,
  `poblacion` INT NULL,
  `area` INT NULL,
  `longitud` INT NULL,
  `latitud` INT NULL,
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
  `idCanton` INT NOT NULL,
  `nombreCanton` VARCHAR(45) NULL,
  `idProvincia` INT NOT NULL,
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
  `idParroquia` INT NOT NULL,
  `nombreParroquia` VARCHAR(45) NULL,
  `idCanton` INT NOT NULL,
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
  `telf1` VARCHAR(11) NULL,
  `telf2` VARCHAR(12) NULL,
  `email` VARCHAR(30) NULL,
  `web` VARCHAR(60) NULL,
  `nombreComercial` VARCHAR(30) NULL,
  `totalTrabajador` INT NULL,
  `direccion` VARCHAR(50) NULL,
  `referenciaDireccion` VARCHAR(50) NULL,
  `idParroquia` INT NOT NULL,
  `actividad` VARCHAR(45) NULL,
  `clasificacion` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
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
  `nombrePersona` VARCHAR(30) NULL,
  `nacionalidad` VARCHAR(30) NULL,
  `email` VARCHAR(30) NULL,
  `emisionLicencia` DATETIME NULL,
  `idCanton` INT NOT NULL,
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
  `ventaTotal` INT NULL,
  `anio` VARCHAR(4) NULL,
  `idProvincia` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Ventas_Provincias1_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Provincias1`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `Comerciales`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comerciales`.`Ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Comerciales`.`Ventas` ;

CREATE TABLE IF NOT EXISTS `Comerciales`.`Ventas` (
  `idVenta` INT NOT NULL,
  `ventaTotal` INT NULL,
  `anio` VARCHAR(4) NULL,
  `idProvincia` INT NOT NULL,
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

LOAD DATA LOCAL INFILE '/Users/xavierchavez/Desktop/UTPL/ProyectoIntegrador/ProyectoIntegrador1.2/BasedeDatos/DatosFinales/Paises.csv'
INTO TABLE Paises
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

