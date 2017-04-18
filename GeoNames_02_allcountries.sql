-- ---------------------------------------------------------------------------------
-- Lionel Villard
-- 2017-04-15
-- Set up table for all genames info
-- Time : 5 min

-- ---------------------------------------------------------------------------------
-- download.geonames.org/export/dump/allCountries.zip
-- DROP DATABASE IF EXISTS `geonames`; 
-- CREATE DATABASE `geonames` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE  `geonames`;

-- ---------------------------------------------------------------------------------
-- DROP TABLE SECTION
-- 
DROP TABLE IF EXISTS `geo_allcountries`;
-- ---------------------------------------------------------------------------------
-- CREATE TABLE SECTION
-- 

CREATE TABLE `geo_allcountries` (
    `geonameid` INT(11) NOT NULL,
    `name` VARCHAR(200) DEFAULT NULL,
    `asciiname` VARCHAR(200) DEFAULT NULL,
    `alternatenames` VARCHAR(4000) DEFAULT NULL,
    `latitude` DECIMAL(10 , 7 ) DEFAULT NULL,
    `longitude` DECIMAL(10 , 7 ) DEFAULT NULL,
    `fclass` CHAR(1) DEFAULT NULL,
    `fcode` VARCHAR(10) DEFAULT NULL,
    `country` VARCHAR(2) DEFAULT NULL,
    `cc2` VARCHAR(60) DEFAULT NULL,
    `admin1` VARCHAR(20) DEFAULT NULL,
    `admin2` VARCHAR(80) DEFAULT NULL,
    `admin3` VARCHAR(20) DEFAULT NULL,
    `admin4` VARCHAR(20) DEFAULT NULL,
    `population` INT(11) DEFAULT NULL,
    `elevation` INT(11) DEFAULT NULL,
    `gtopo30` INT(11) DEFAULT NULL,
    `timezone` VARCHAR(40) DEFAULT NULL,
    `moddate` DATE DEFAULT NULL,
    PRIMARY KEY (`geonameid`),
    KEY `name` (`name`),
    KEY `asciiname` (`asciiname`),
    KEY `latitude` (`latitude`),
    KEY `longitude` (`longitude`),
    KEY `fclass` (`fclass`),
    KEY `fcode` (`fcode`),
    KEY `country` (`country`),
    KEY `cc2` (`cc2`),
    KEY `admin1` (`admin1`),
    KEY `population` (`population`),
    KEY `elevation` (`elevation`),
    KEY `timezone` (`timezone`)
) ENGINE=MYISAM DEFAULT CHARSET=UTF8 COLLATE UTF8_UNICODE_CI;

-- ---------------------------------------------------------------------------------
-- TIME OPTIMISATION DISABLE KEYS
-- 

ALTER TABLE `geo_allcountries` DISABLE KEYS;

-- ---------------------------------------------------------------------------------
-- INSERT Section
-- 

LOAD DATA LOCAL INFILE '......\\GeoNames\\allCountries\\allCountries.txt'
INTO TABLE `geo_allcountries`
CHARACTER SET 'UTF8';

-- ---------------------------------------------------------------------------------
-- Adding variables
-- 

ALTER TABLE `geo_allcountries` 
ADD COLUMN `fclasscode` CHAR(7) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL AFTER `fcode`;

UPDATE `geo_allcountries` 
SET 
    `fclasscode` = CONCAT(`fclass`, '.', `fcode`);

UPDATE `geo_allcountries` 
SET  `fclasscode` = ''
WHERE
    `fclasscode` NOT REGEXP '[A-Z]{1}.[A-Z]{1,5}';
	
ALTER TABLE `geo_allcountries` ADD INDEX `fclasscode` (`fclasscode` ASC);

-- ---------------------------------------------------------------------------------
-- ENABLE KEYS Section
-- 

ALTER TABLE `geo_allcountries` ENABLE KEYS;