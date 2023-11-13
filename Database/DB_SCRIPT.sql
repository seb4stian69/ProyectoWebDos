-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ChanoClothes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ChanoClothes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ChanoClothes` ;
USE `ChanoClothes` ;

-- -----------------------------------------------------
-- Table `ChanoClothes`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`Usuarios` (
  `_id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  `primer_nombre` VARCHAR(45) NOT NULL,
  `segundo_nombre` VARCHAR(45) NULL,
  `primer_apellido` VARCHAR(45) NOT NULL,
  `segundo_apellido` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`_id`))
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`Roles` (
  `_id` VARCHAR(100) NOT NULL,
  `tipo` ENUM('cliente', 'admin', 'gerente', 'serviciocliente') NOT NULL,
  `Usuarios__id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_Roles_Usuarios1_idx` (`Usuarios__id` ASC) VISIBLE,
  CONSTRAINT `fk_Roles_Usuarios1`
    FOREIGN KEY (`Usuarios__id`)
    REFERENCES `ChanoClothes`.`Usuarios` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`Productos` (
  `_id` VARCHAR(100) NOT NULL,
  `precio` FLOAT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `valor_compra` FLOAT NOT NULL,
  `valor_venta` FLOAT NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`_id`))
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`MetodoPagoCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`MetodoPagoCompra` (
  `_id` VARCHAR(100) NOT NULL,
  `medio` ENUM('TDebito', 'TCredito', 'Efectivo', 'Transferencia') NOT NULL,
  `detalles` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`_id`))
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`Facturas` (
  `_id` VARCHAR(100) NOT NULL,
  `fecha` DATE NOT NULL,
  `estado` ENUM('EnProceso', 'Cancelado', 'Entregado') NOT NULL,
  `Usuarios__id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  `MetodoPagoCompra__id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_Facturas_Usuarios1_idx` (`Usuarios__id` ASC) VISIBLE,
  INDEX `fk_Facturas_MetodoPagoCompra1_idx` (`MetodoPagoCompra__id` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Usuarios1`
    FOREIGN KEY (`Usuarios__id`)
    REFERENCES `ChanoClothes`.`Usuarios` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facturas_MetodoPagoCompra1`
    FOREIGN KEY (`MetodoPagoCompra__id`)
    REFERENCES `ChanoClothes`.`MetodoPagoCompra` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`DetallesFactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`DetallesFactura` (
  `_id` VARCHAR(100) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` FLOAT NOT NULL,
  `subtotal` FLOAT NOT NULL,
  `Facturas__id` VARCHAR(100) NOT NULL,
  `Productos__id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`_id`, `Facturas__id`),
  INDEX `fk_DetallesFactura_Facturas1_idx` (`Facturas__id` ASC) VISIBLE,
  INDEX `fk_DetallesFactura_Productos1_idx` (`Productos__id` ASC) VISIBLE,
  CONSTRAINT `fk_DetallesFactura_Facturas1`
    FOREIGN KEY (`Facturas__id`)
    REFERENCES `ChanoClothes`.`Facturas` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesFactura_Productos1`
    FOREIGN KEY (`Productos__id`)
    REFERENCES `ChanoClothes`.`Productos` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`Credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`Credenciales` (
  `_id` VARCHAR(100) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL UNIQUE,
  `contrasena` VARCHAR(45) NOT NULL,
  `Usuarios__id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_Credenciales_Usuarios1_idx` (`Usuarios__id` ASC) VISIBLE,
  CONSTRAINT `fk_Credenciales_Usuarios1`
    FOREIGN KEY (`Usuarios__id`)
    REFERENCES `ChanoClothes`.`Usuarios` (`_id`) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `ChanoClothes`.`PQRSUsuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChanoClothes`.`PQRSUsuarios` (
  `_id` VARCHAR(100) NOT NULL,
  `log` VARCHAR(100) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `Usuarios__id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_PQRSUsuarios_Usuarios1_idx` (`Usuarios__id` ASC) VISIBLE,
  CONSTRAINT `fk_PQRSUsuarios_Usuarios1`
    FOREIGN KEY (`Usuarios__id`)
    REFERENCES `ChanoClothes`.`Usuarios` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- -----------------------------------------------------
-- Table `ChanoClothes`.`CarritoCompras`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ChanoClothes`.`CarritoCompras` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `Productos__id` VARCHAR(100) NOT NULL,
  `Usuarios__id` VARCHAR(15) CHARACTER SET 'big5' NOT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_CarritoCompras_Productos1_idx` (`Productos__id` ASC) VISIBLE,
  INDEX `fk_CarritoCompras_Usuarios1_idx` (`Usuarios__id` ASC) VISIBLE,
  CONSTRAINT `fk_CarritoCompras_Productos1`
    FOREIGN KEY (`Productos__id`)
    REFERENCES `ChanoClothes`.`Productos` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CarritoCompras_Usuarios1`
    FOREIGN KEY (`Usuarios__id`)
    REFERENCES `ChanoClothes`.`Usuarios` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
