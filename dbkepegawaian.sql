-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dbkepegawaian
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diklat`
--

DROP TABLE IF EXISTS `diklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diklat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `jamlat` int(11) DEFAULT NULL,
  `thn_anggaran` int(11) DEFAULT NULL,
  `narasumber` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diklat`
--

LOCK TABLES `diklat` WRITE;
/*!40000 ALTER TABLE `diklat` DISABLE KEYS */;
INSERT INTO `diklat` VALUES (1,'Pemrograman Web Dinamis','PHP,MySQL,MVC,YiiFramework','2019-07-01','2019-07-12',108,2019,'Dr. Khamami ','2019-07-09 12:00:09','2019-07-09 12:00:09',1,1),(2,'Keamanan Jaringan','Cyber Security, Linux','2019-07-01','2019-07-05',54,2019,'Dr. Yan ','2019-07-09 12:01:16','2019-07-09 12:01:16',1,1);
/*!40000 ALTER TABLE `diklat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisi`
--

DROP TABLE IF EXISTS `divisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `pejabat` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_UNIQUE` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisi`
--

LOCK TABLES `divisi` WRITE;
/*!40000 ALTER TABLE `divisi` DISABLE KEYS */;
INSERT INTO `divisi` VALUES (1,'SETJEN','Sekretariat Jenderal Kemenkeu','Lapangan Banteng','Ahmad Budiman','2019-07-09 11:50:03','2019-07-09 11:50:03',1,1),(2,'DJPK','Direktorat Jenderal Perimbangan Keuangan','Sawah Besar','Ariana Gulma','2019-07-09 11:51:05','2019-07-09 11:51:05',1,1);
/*!40000 ALTER TABLE `divisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jatah_cuti`
--

DROP TABLE IF EXISTS `jatah_cuti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jatah_cuti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tahun` int(11) DEFAULT NULL,
  `sisa_cuti` int(11) DEFAULT NULL,
  `pegawai_nip` varchar(15) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jatah_cuti_pegawai1_idx` (`pegawai_nip`),
  CONSTRAINT `fk_jatah_cuti_pegawai1` FOREIGN KEY (`pegawai_nip`) REFERENCES `pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jatah_cuti`
--

LOCK TABLES `jatah_cuti` WRITE;
/*!40000 ALTER TABLE `jatah_cuti` DISABLE KEYS */;
INSERT INTO `jatah_cuti` VALUES (1,2019,12,'15123131322',NULL,NULL,NULL,NULL),(2,2019,12,'151231323232',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jatah_cuti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kehadiran`
--

DROP TABLE IF EXISTS `kehadiran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kehadiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` varchar(4) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jam_masuk` time DEFAULT NULL,
  `tgl_pulang` date DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pegawai_nip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kehadiran_pegawai1_idx` (`pegawai_nip`),
  CONSTRAINT `fk_kehadiran_pegawai1` FOREIGN KEY (`pegawai_nip`) REFERENCES `pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kehadiran`
--

LOCK TABLES `kehadiran` WRITE;
/*!40000 ALTER TABLE `kehadiran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kehadiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `nip` varchar(15) NOT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `tmp_lahir` varchar(45) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `divisi_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`nip`),
  KEY `fk_pegawai_divisi1_idx` (`divisi_id`),
  CONSTRAINT `fk_pegawai_divisi1` FOREIGN KEY (`divisi_id`) REFERENCES `divisi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES ('15123131322','2001','Dimyati Hasan','Depok','1978-10-11','L','0813231322','Depok Timur',1,'2019-07-09 11:52:50','2019-07-09 11:52:50',1,1),('151231323232','2011','Fathin Arafa','Depok','1983-02-20','P','08423231322','Beji',2,'2019-07-09 11:53:46','2019-07-09 11:53:46',1,1);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai_diklat`
--

DROP TABLE IF EXISTS `pegawai_diklat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai_diklat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai` double DEFAULT NULL,
  `kelulusan` varchar(30) DEFAULT NULL,
  `diklat_id` int(11) NOT NULL,
  `pegawai_nip` varchar(15) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pegawai_diklat_diklat1_idx` (`diklat_id`),
  KEY `fk_pegawai_diklat_pegawai1_idx` (`pegawai_nip`),
  CONSTRAINT `fk_pegawai_diklat_diklat1` FOREIGN KEY (`diklat_id`) REFERENCES `diklat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pegawai_diklat_pegawai1` FOREIGN KEY (`pegawai_nip`) REFERENCES `pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai_diklat`
--

LOCK TABLES `pegawai_diklat` WRITE;
/*!40000 ALTER TABLE `pegawai_diklat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegawai_diklat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengajuan_cuti`
--

DROP TABLE IF EXISTS `pengajuan_cuti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengajuan_cuti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lama` int(11) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `lokasi_cuti` varchar(45) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `pegawai_nip` varchar(15) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pengajuan_cuti_pegawai_idx` (`pegawai_nip`),
  CONSTRAINT `fk_pengajuan_cuti_pegawai` FOREIGN KEY (`pegawai_nip`) REFERENCES `pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengajuan_cuti`
--

LOCK TABLES `pengajuan_cuti` WRITE;
/*!40000 ALTER TABLE `pengajuan_cuti` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengajuan_cuti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-09 12:02:04
