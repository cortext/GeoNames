-- ---------------------------------------------------------------------------------
-- Lionel Villard
-- 23/01/2016
-- Time : 5 min

-- DROP DATABASE IF EXISTS `geonames`; 
-- CREATE DATABASE `geonames` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- download.geonames.org/export/dump/cities1000.zip
-- download.geonames.org/export/dump/cities5000.zip
-- download.geonames.org/export/dump/cities15000.zip
-- download.geonames.org/export/dump/featureCodes_en.txt
-- download.geonames.org/export/dump/countryInfo.txt
-- download.geonames.org/export/dump/admin1CodesASCII.txt
-- download.geonames.org/export/dump/admin2Codes.txt
-- download.geonames.org/export/zip/allCountries.zip
-- download.geonames.org/export/dump/hierarchy.zip

USE  `geonames`;

-- ---------------------------------------------------------------------------------
-- DROP TABLE SECTION
-- 
DROP TABLE IF EXISTS `geo_01cities1000`;
DROP TABLE IF EXISTS `geo_02cities5000`;
DROP TABLE IF EXISTS `geo_03cities15000`;
DROP TABLE IF EXISTS `geo_featurecodes`;
DROP TABLE IF EXISTS `geo_countryinfo`;
DROP TABLE IF EXISTS `geo_continentcodes`;
DROP TABLE IF EXISTS `geo_admin1codesascii`;
DROP TABLE IF EXISTS `geo_admin2codes`;
DROP TABLE IF EXISTS `geo_postalcodes`;
DROP TABLE IF EXISTS `geo_hierarchy`;

-- ---------------------------------------------------------------------------------
-- CREATE TABLE SECTION
-- 

CREATE TABLE `geo_01cities1000` (
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
)  ENGINE=MYISAM DEFAULT CHARSET=UTF8 COLLATE UTF8_UNICODE_CI;

CREATE TABLE `geo_02cities5000` (
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
)  ENGINE=MYISAM DEFAULT CHARSET=UTF8 COLLATE UTF8_UNICODE_CI;

CREATE TABLE `geo_03cities15000` (
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
)  ENGINE=MYISAM DEFAULT CHARSET=UTF8 COLLATE UTF8_UNICODE_CI;

CREATE TABLE `geo_featurecodes` (
  `code` char(7) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  KEY `code` (`code`),
  KEY `name` (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_countryinfo` (
  `iso_alpha2` char(2) DEFAULT NULL,
  `iso_alpha3` char(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `fips_code` varchar(3) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `capital` varchar(200) DEFAULT NULL,
  `areainsqkm` double DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `continent` char(2) DEFAULT NULL,
  `tld` char(3) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currencyName` char(20) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  `postalCodeFormat` varchar(100) DEFAULT NULL,
  `postalCodeRegex` varchar(255) DEFAULT NULL,
  `languages` varchar(200) DEFAULT NULL,
  `geonameId` int(11) DEFAULT NULL,
  `neighbours` char(100) DEFAULT NULL,
  `equivalentFipsCode` char(10) DEFAULT NULL,
  KEY `iso_alpha2` (`iso_alpha2`),
  KEY `iso_alpha3` (`iso_alpha3`),
  KEY `iso_numeric` (`iso_numeric`),
  KEY `fips_code` (`fips_code`),
  KEY `name` (`name`), 
  KEY `geonameid` (`geonameId`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_continentcodes` (
  `code` char(2) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`),
  KEY `geonameid` (`geonameid`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_admin1codesascii` (
  `code` char(15) DEFAULT NULL,
  `name` text,
  `nameAscii` text,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`(20)),
  KEY `nameAscii` (`nameAscii`(20)),
  KEY `geonameid` (`geonameid`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_admin2codes` (
  `code` char(15) DEFAULT NULL,
  `name` text,
  `nameAscii` text,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`(80)),
  KEY `nameAscii` (`nameAscii`(80)),
  KEY `geonameid` (`geonameid`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_postalcodes` (
  `country` char(2) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `name` varchar(180) DEFAULT NULL,
  `admin1_name` varchar(100) DEFAULT NULL,
  `admin1_code` varchar(20) DEFAULT NULL,
  `admin2_name` varchar(100) DEFAULT NULL,
  `admin2_code` varchar(20) DEFAULT NULL,
  `admin3_name` varchar(100) DEFAULT NULL,
  `admin3_code` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `accuracy` tinyint(2) DEFAULT NULL,
  KEY `admin1_code` (`admin1_code`),
  KEY `country` (`country`),
  KEY `name` (`name`),
  KEY `postal_code` (`postal_code`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `admin1_name` (`admin1_name`),
  KEY `admin1_code_2` (`admin1_code`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `geo_hierarchy` (
  `parentId` int(11) DEFAULT NULL,
  `childId` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  KEY `parentId` (`parentId`),
  KEY `childId` (`childId`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

-- ---------------------------------------------------------------------------------
-- TIME OPTIMISATION DISABLE KEYS;
-- 

ALTER TABLE `geo_01cities1000` DISABLE KEYS;
ALTER TABLE `geo_02cities5000` DISABLE KEYS;
ALTER TABLE `geo_03cities15000` DISABLE KEYS;
ALTER TABLE `geo_featurecodes` DISABLE KEYS;
ALTER TABLE `geo_countryinfo` DISABLE KEYS;
ALTER TABLE `geo_continentcodes` DISABLE KEYS;
ALTER TABLE `geo_admin1codesascii` DISABLE KEYS;
ALTER TABLE `geo_admin2codes` DISABLE KEYS;
ALTER TABLE `geo_postalcodes` DISABLE KEYS;
ALTER TABLE `geo_hierarchy` DISABLE KEYS;

-- ---------------------------------------------------------------------------------
-- LOAD DATA / INSERT INTO
-- 

LOAD DATA LOCAL INFILE '...\\GeoNames\\cities1000.txt'
INTO TABLE `geo_01cities1000`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\cities5000.txt'
INTO TABLE `geo_02cities5000`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\cities15000.txt'
INTO TABLE `geo_03cities15000`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\countryInfo.txt'
INTO TABLE `geo_countryinfo`
CHARACTER SET 'UTF8'
IGNORE 51 LINES;

LOAD DATA LOCAL INFILE '...\\GeoNames\\featureCodes_en.txt'
INTO TABLE `geo_featurecodes`
CHARACTER SET 'UTF8';

INSERT INTO `geo_continentcodes` VALUES ('AF','Africa',6255146),('AS','Asia',6255147),('EU','Europe',6255148),('NA','North America',6255149),('OC','Oceania',6255151),('SA','South America',6255150),('AN','Antarctica',6255152);

LOAD DATA LOCAL INFILE '...\\GeoNames\\admin1CodesASCII.txt'
INTO TABLE `geo_admin1codesascii`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\admin2Codes.txt'
INTO TABLE `geo_admin2codes`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\PostalCodes\\allCountries.txt'
INTO TABLE `geo_postalcodes`
CHARACTER SET 'UTF8';

LOAD DATA LOCAL INFILE '...\\GeoNames\\hierarchy.txt'
INTO TABLE `geo_hierarchy`
CHARACTER SET 'UTF8';

-- ---------------------------------------------------------------------------------
-- ENABLE KEYS
-- 

ALTER TABLE `geo_01cities1000` ENABLE KEYS;
ALTER TABLE `geo_02cities5000` ENABLE KEYS;
ALTER TABLE `geo_03cities15000` ENABLE KEYS;
ALTER TABLE `geo_featurecodes` ENABLE KEYS;
ALTER TABLE `geo_countryinfo` ENABLE KEYS;
ALTER TABLE `geo_continentcodes` ENABLE KEYS;
ALTER TABLE `geo_admin1codesascii` ENABLE KEYS;
ALTER TABLE `geo_admin2codes` ENABLE KEYS;
ALTER TABLE `geo_postalcodes` ENABLE KEYS;
ALTER TABLE `geo_hierarchy` ENABLE KEYS;