-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Vert: localhost
-- Generert den: 11. Feb, 2009 10:57 AM
-- Tjenerversjon: 5.1.30
-- PHP-Versjon: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `airdog`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `aasykdom`
--

CREATE TABLE IF NOT EXISTS `aasykdom` (
  `veId` varchar(4) NOT NULL,
  `aaId` varchar(7) NOT NULL,
  `diagnoseKode` int(1) NOT NULL,
  `idmerkeKode` int(1) NOT NULL,
  `lidelseKode` int(1) NOT NULL,
  `sekHoyreKode` int(1) NOT NULL,
  `sekVenstreKode` int(1) NOT NULL,
  `endretAv` varchar(32) NOT NULL,
  `regAv` varchar(32) NOT NULL,
  `avlestAv` varchar(32) NOT NULL,
  `betaling` int(1) NOT NULL,
  `diagnose` varchar(6) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `idFeil` varchar(6) NOT NULL,
  `idMerket` varchar(1) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `lidelse` varchar(1) NOT NULL,
  `peId` varchar(7) NOT NULL,
  `purring` varchar(20) NOT NULL,
  `raseId` int(3) NOT NULL,
  `retur` varchar(20) NOT NULL,
  `sekHoyre` varchar(16) NOT NULL,
  `sekVenstre` varchar(16) NOT NULL,
  `sendes` varchar(20) NOT NULL,
  `avlestDato` date NOT NULL,
  `rontgenDato` date NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `aasykdom`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `eier`
--

CREATE TABLE IF NOT EXISTS `eier` (
  `eier` varchar(64) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `raseId` int(3) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `eier`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `fugl`
--

CREATE TABLE IF NOT EXISTS `fugl` (
  `proveNr` varchar(8) NOT NULL,
  `proveDato` date NOT NULL,
  `partiNr` varchar(3) NOT NULL,
  `klasse` int(1) NOT NULL,
  `dommerId1` varchar(7) NOT NULL,
  `dommerId2` varchar(7) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `slippTid` int(2) NOT NULL,
  `egneStand` int(1) NOT NULL,
  `egneStokk` int(1) NOT NULL,
  `tomStand` int(1) NOT NULL,
  `makkerStand` int(1) NOT NULL,
  `makkerStokk` int(1) NOT NULL,
  `jaktlyst` int(1) NOT NULL,
  `fart` int(1) NOT NULL,
  `stil` int(1) NOT NULL,
  `selvstendighet` int(1) NOT NULL,
  `bredde` int(1) NOT NULL,
  `reviering` int(1) NOT NULL,
  `samarbeid` int(1) NOT NULL,
  `presUpresis` int(1) NOT NULL,
  `presNoeUpresis` int(1) NOT NULL,
  `presPresis` int(1) NOT NULL,
  `reisNekter` int(1) NOT NULL,
  `reisNoelende` int(1) NOT NULL,
  `reisVillig` int(1) NOT NULL,
  `reisDjerv` int(1) NOT NULL,
  `sokStjeler` int(1) NOT NULL,
  `sokSpontant` int(1) NOT NULL,
  `appIkkeGodkjent` int(1) NOT NULL,
  `appGodkjent` int(1) NOT NULL,
  `rappInnkalt` int(1) NOT NULL,
  `rappSpont` int(1) NOT NULL,
  `premiegrad` int(1) NOT NULL,
  `certifikat` int(1) NOT NULL,
  `regAv` varchar(32) NOT NULL,
  `regDato` date NOT NULL,
  `raseId` int(3) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `fugl`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `hdsykdom`
--

CREATE TABLE IF NOT EXISTS `hdsykdom` (
  `avlestAv` varchar(16) NOT NULL,
  `betaling` int(1) NOT NULL,
  `diagnose` varchar(3) NOT NULL,
  `diagnoseKode` int(1) NOT NULL,
  `endretAv` varchar(16) NOT NULL,
  `hofteDyId` varchar(7) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `idmerket` varchar(1) NOT NULL,
  `idmerketKode` varchar(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `lidelse` varchar(1) NOT NULL,
  `lidelseKode` int(1) NOT NULL,
  `personId` varchar(7) NOT NULL,
  `raseId` int(3) NOT NULL,
  `registrertAv` varchar(16) NOT NULL,
  `sekHoyre` varchar(20) NOT NULL,
  `sekHoyreKode` int(1) NOT NULL,
  `sekVenstre` varchar(20) NOT NULL,
  `sekVenstreKode` int(1) NOT NULL,
  `sendes` varchar(20) NOT NULL,
  `veterinerId` varchar(4) NOT NULL,
  `rontgenDato` date NOT NULL,
  `avlestDato` date NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `hdsykdom`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `hund`
--

CREATE TABLE IF NOT EXISTS `hund` (
  `raseId` int(3) NOT NULL,
  `kullId` varchar(6) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `tittel` varchar(64) NOT NULL,
  `navn` varchar(64) NOT NULL,
  `hundFarId` varchar(9) NOT NULL,
  `hundMorId` varchar(9) NOT NULL,
  `idNr` varchar(7) NOT NULL,
  `farge` varchar(32) NOT NULL,
  `fargeVariant` varchar(32) NOT NULL,
  `oyesykdom` varchar(16) NOT NULL,
  `hoftesykdom` varchar(1) NOT NULL,
  `haarlag` varchar(16) NOT NULL,
  `idMerke` varchar(1) NOT NULL,
  `kjonn` varchar(1) NOT NULL,
  `eierId` varchar(7) NOT NULL,
  `endretAv` varchar(16) NOT NULL,
  `endretDato` date NOT NULL,
  `regDato` date NOT NULL,
  `storrelse` varchar(16) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `hund`
--

INSERT INTO `hund` (`raseId`, `kullId`, `hundId`, `tittel`, `navn`, `hundFarId`, `hundMorId`, `idNr`, `farge`, `fargeVariant`, `oyesykdom`, `hoftesykdom`, `haarlag`, `idMerke`, `kjonn`, `eierId`, `endretAv`, `endretDato`, `regDato`, `storrelse`, `manueltEndretAv`, `manueltEndretDato`) VALUES
(348, 'kullid', 'enFar', 'tittel', 'Far til en hund', 'far', 'mor', '12432', 'grønn', 'blå', '', '', '', '', 'H', 'eierId', '', '0000-00-00', '0000-00-00', '', '', '0000-00-00'),
(348, 'kullid', 'hundid', 'tittel', 'navn og sånt', 'enFar', 'enMor', '12432', 'grønn', 'blå', '', '', '', '', 'H', 'eierId', '', '0000-00-00', '0000-00-00', '', '', '0000-00-00'),
(348, 'kullid', 'enMor', 'tittel', 'mor sitt navn', 'far', 'mor', '12432', 'grønn', 'blå', '', '', '', '', 'H', 'eierId', '', '0000-00-00', '0000-00-00', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `kull`
--

CREATE TABLE IF NOT EXISTS `kull` (
  `kullId` varchar(6) NOT NULL,
  `hundIdFar` varchar(9) NOT NULL,
  `hundIdMor` varchar(9) NOT NULL,
  `oppdretterId` varchar(7) NOT NULL,
  `endretDato` date NOT NULL,
  `fodt` date NOT NULL,
  `raseId` int(3) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `kull`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `oppdrett`
--

CREATE TABLE IF NOT EXISTS `oppdrett` (
  `kullId` varchar(6) NOT NULL,
  `oppdretter` varchar(64) NOT NULL,
  `raseId` int(3) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `oppdrett`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `oyesykdom`
--

CREATE TABLE IF NOT EXISTS `oyesykdom` (
  `oyId` varchar(7) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `veterinerId` varchar(4) NOT NULL,
  `oyeVeteriner` varchar(2) NOT NULL,
  `lystDato` date NOT NULL,
  `idmerketKode` varchar(1) NOT NULL,
  `idmerket` int(1) NOT NULL,
  `idfeil` varchar(20) NOT NULL,
  `raseId` int(3) NOT NULL,
  `sendtEierDato` date NOT NULL,
  `longAnnet` varchar(20) NOT NULL,
  `diagnoseKode1` varchar(20) NOT NULL,
  `diagnoseGrad1` varchar(20) NOT NULL,
  `diagnoseKode2` varchar(20) NOT NULL,
  `diagnoseGrad2` varchar(20) NOT NULL,
  `diagnoseKode3` varchar(20) NOT NULL,
  `diagnoseGrad3` varchar(20) NOT NULL,
  `regAv` varchar(16) NOT NULL,
  `regDato` date NOT NULL,
  `endretAv` varchar(16) NOT NULL,
  `endretDato` date NOT NULL,
  `personId` varchar(7) NOT NULL,
  `sendtVetDato` date NOT NULL,
  `sendtKlubbDato` date NOT NULL,
  `longAnnet1` varchar(20) NOT NULL,
  `longAnnet2` varchar(20) NOT NULL,
  `inaktiv` varchar(1) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `oyesykdom`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `personId` varchar(7) NOT NULL,
  `navn` varchar(64) NOT NULL,
  `adresse1` varchar(64) NOT NULL,
  `adresse2` varchar(64) NOT NULL,
  `adresse3` varchar(64) NOT NULL,
  `postNr` varchar(4) NOT NULL,
  `landkode` varchar(1) NOT NULL,
  `raseId` int(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `telefon1` varchar(16) NOT NULL,
  `endretDato` date NOT NULL,
  `regDato` date NOT NULL,
  `fodt` date NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `person`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `premie`
--

CREATE TABLE IF NOT EXISTS `premie` (
  `doId` varchar(6) NOT NULL,
  `utstillingId` varchar(6) NOT NULL,
  `hundId` varchar(9) NOT NULL,
  `katalogNr` int(3) NOT NULL,
  `personIdDommer` varchar(7) NOT NULL,
  `klasse` varchar(1) NOT NULL,
  `kjonn` varchar(1) NOT NULL,
  `raseId` int(3) NOT NULL,
  `IM` int(1) NOT NULL,
  `KIP` int(1) NOT NULL,
  `JK` int(1) NOT NULL,
  `JKK` int(1) NOT NULL,
  `UK` int(1) NOT NULL,
  `UKK` int(1) NOT NULL,
  `BK` int(1) NOT NULL,
  `BKK` int(1) NOT NULL,
  `AK` int(1) NOT NULL,
  `AKK` int(1) NOT NULL,
  `VK` int(1) NOT NULL,
  `CHK` int(1) NOT NULL,
  `CHKK` int(1) NOT NULL,
  `VTK` int(1) NOT NULL,
  `VTKK` int(1) NOT NULL,
  `HP` int(1) NOT NULL,
  `CK` int(1) NOT NULL,
  `CC` int(1) NOT NULL,
  `CA` int(1) NOT NULL,
  `BIK` int(1) NOT NULL,
  `BIR` int(1) NOT NULL,
  `BIM` int(1) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `premie`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstilling`
--

CREATE TABLE IF NOT EXISTS `utstilling` (
  `utstillingId` varchar(6) NOT NULL,
  `klasseId` varchar(6) NOT NULL,
  `personId` varchar(7) NOT NULL,
  `regDato` date NOT NULL,
  `regAv` varchar(16) NOT NULL,
  `navn` varchar(64) NOT NULL,
  `adresse1` varchar(64) NOT NULL,
  `adresse2` varchar(64) NOT NULL,
  `postNr` varchar(4) NOT NULL,
  `spesialAdresse` varchar(64) NOT NULL,
  `utstillingDato` date NOT NULL,
  `utstillingSted` varchar(64) NOT NULL,
  `arrangorNavn1` varchar(64) NOT NULL,
  `arrangorNavn2` varchar(64) NOT NULL,
  `overfortDato` date NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `utstilling`
--


-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `veteriner`
--

CREATE TABLE IF NOT EXISTS `veteriner` (
  `veterinerId` varchar(5) NOT NULL,
  `personId` varchar(7) NOT NULL,
  `adresse1` varchar(64) NOT NULL,
  `adresse2` varchar(64) NOT NULL,
  `adresse3` varchar(64) NOT NULL,
  `postNr` varchar(4) NOT NULL,
  `telefon` varchar(16) NOT NULL,
  `telefax` varchar(16) NOT NULL,
  `klinikkNavn` varchar(64) NOT NULL,
  `regDato` date NOT NULL,
  `regAv` varchar(16) NOT NULL,
  `endretAv` varchar(16) NOT NULL,
  `manueltEndretAv` varchar(20) NOT NULL,
  `manueltEndretDato` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `veteriner`
--

