-- MySQL Script generated by MySQL Workbench
-- Tue Oct 11 22:56:05 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ej1tp4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ej1tp4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ej1tp4` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `ej1tp4` ;

-- -----------------------------------------------------
-- Table `ej1tp4`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`ALUMNO` (
  `Cod_Matrícula` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `DNI` INT NULL,
  `FechaNacimiento` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Matrícula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`CURSO` (
  `Cod_Curso` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`PROFESOR` (
  `Id_Profesor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Especialidad` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `CURSO_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`Id_Profesor`, `CURSO_Cod_Curso`),
  INDEX `fk_PROFESOR_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESOR_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `ej1tp4`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`ALUMNO_has_CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`ALUMNO_has_CURSO` (
  `ALUMNO_Cod_Matrícula` INT NOT NULL,
  `CURSO_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`ALUMNO_Cod_Matrícula`, `CURSO_Cod_Curso`),
  INDEX `fk_ALUMNO_has_CURSO_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  INDEX `fk_ALUMNO_has_CURSO_ALUMNO1_idx` (`ALUMNO_Cod_Matrícula` ASC) VISIBLE,
  CONSTRAINT `fk_ALUMNO_has_CURSO_ALUMNO1`
    FOREIGN KEY (`ALUMNO_Cod_Matrícula`)
    REFERENCES `ej1tp4`.`ALUMNO` (`Cod_Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALUMNO_has_CURSO_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `ej1tp4`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`CURSO_has_PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`CURSO_has_PROFESOR` (
  `CURSO_Cod_Curso` INT NOT NULL,
  `PROFESOR_Id_Profesor` INT NOT NULL,
  `PROFESOR_CURSO_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`CURSO_Cod_Curso`, `PROFESOR_Id_Profesor`, `PROFESOR_CURSO_Cod_Curso`),
  INDEX `fk_CURSO_has_PROFESOR_PROFESOR1_idx` (`PROFESOR_Id_Profesor` ASC, `PROFESOR_CURSO_Cod_Curso` ASC) VISIBLE,
  INDEX `fk_CURSO_has_PROFESOR_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_CURSO_has_PROFESOR_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `ej1tp4`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURSO_has_PROFESOR_PROFESOR1`
    FOREIGN KEY (`PROFESOR_Id_Profesor` , `PROFESOR_CURSO_Cod_Curso`)
    REFERENCES `ej1tp4`.`PROFESOR` (`Id_Profesor` , `CURSO_Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`PAIS` (
  `ID_Pais` INT NOT NULL,
  `Nombre_Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`PROVINCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`PROVINCIA` (
  `ID_Provincia` INT NOT NULL,
  `Nombre_Provincia` VARCHAR(45) NULL,
  `PAIS_ID_Pais` INT NOT NULL,
  PRIMARY KEY (`ID_Provincia`),
  INDEX `fk_PROVINCIA_PAIS1_idx` (`PAIS_ID_Pais` ASC) VISIBLE,
  CONSTRAINT `fk_PROVINCIA_PAIS1`
    FOREIGN KEY (`PAIS_ID_Pais`)
    REFERENCES `ej1tp4`.`PAIS` (`ID_Pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`LOCALIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`LOCALIDAD` (
  `Código_Localidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Código_Postal` INT NULL,
  `PROVINCIA_ID_Provincia` INT NOT NULL,
  PRIMARY KEY (`Código_Localidad`),
  INDEX `fk_LOCALIDAD_PROVINCIA1_idx` (`PROVINCIA_ID_Provincia` ASC) VISIBLE,
  CONSTRAINT `fk_LOCALIDAD_PROVINCIA1`
    FOREIGN KEY (`PROVINCIA_ID_Provincia`)
    REFERENCES `ej1tp4`.`PROVINCIA` (`ID_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`coche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`coche` (
  `Matricula_coche` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `precio_hora` DECIMAL NULL,
  `litros_gasolina` DECIMAL NULL,
  PRIMARY KEY (`Matricula_coche`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`reservas` (
  `idreservas` INT NOT NULL,
  `fecha de inicio` DATE NULL,
  `fecha final` DATE NULL,
  `precio total` DECIMAL NULL,
  `coche_Matricula_coche` INT NOT NULL,
  PRIMARY KEY (`idreservas`),
  INDEX `fk_reservas_coche1_idx` (`coche_Matricula_coche` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_coche1`
    FOREIGN KEY (`coche_Matricula_coche`)
    REFERENCES `ej1tp4`.`coche` (`Matricula_coche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`cliente_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`cliente_copy1` (
  `ID_cliente` INT NOT NULL,
  `DNI` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Teléfono` INT NULL,
  `diercción` VARCHAR(45) NULL,
  `reservas_idreservas` INT NOT NULL,
  PRIMARY KEY (`ID_cliente`),
  INDEX `fk_cliente_reservas1_idx` (`reservas_idreservas` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_reservas10`
    FOREIGN KEY (`reservas_idreservas`)
    REFERENCES `ej1tp4`.`reservas` (`idreservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ej1tp4`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ej1tp4`.`cliente` (
  `ID_cliente` INT NOT NULL,
  `DNI` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Teléfono` INT NULL,
  `diercción` VARCHAR(45) NULL,
  `reservas_idreservas` INT NOT NULL,
  `cliente_copy1_ID_cliente` INT NOT NULL,
  PRIMARY KEY (`ID_cliente`),
  INDEX `fk_cliente_reservas1_idx` (`reservas_idreservas` ASC) VISIBLE,
  INDEX `fk_cliente_cliente_copy11_idx` (`cliente_copy1_ID_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_reservas1`
    FOREIGN KEY (`reservas_idreservas`)
    REFERENCES `ej1tp4`.`reservas` (`idreservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_cliente_copy11`
    FOREIGN KEY (`cliente_copy1_ID_cliente`)
    REFERENCES `ej1tp4`.`cliente_copy1` (`ID_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
