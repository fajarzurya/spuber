-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2018 at 04:18 PM
-- Server version: 5.6.20-log
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spuber`
--

-- --------------------------------------------------------

--
-- Table structure for table `akademik_konsentrasi`
--

CREATE TABLE IF NOT EXISTS `akademik_konsentrasi` (
`konsentrasi_id` int(11) NOT NULL,
  `nama_konsentrasi` varchar(100) NOT NULL,
  `ketua` varchar(50) NOT NULL,
  `jenjang` varchar(3) NOT NULL COMMENT '1=D1,2=D2,3=D3,4=D4',
  `jml_semester` int(11) NOT NULL,
  `kode_nomor` varchar(20) NOT NULL,
  `gelar` varchar(40) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `akademik_konsentrasi`
--

INSERT INTO `akademik_konsentrasi` (`konsentrasi_id`, `nama_konsentrasi`, `ketua`, `jenjang`, `jml_semester`, `kode_nomor`, `gelar`, `prodi_id`) VALUES
(5, 'A', 'Sri Ratnawati, S.Pd', '0', 0, '0', '0', 3),
(18, 'B', '', 'd1', 1, '', '', 3),
(19, 'C', '', 'd1', 1, '', '', 3),
(20, 'D', '', 'd1', 1, '', '', 3),
(21, 'E', '', 'd1', 1, '', '', 3),
(22, 'F', '', 'd1', 1, '', '', 3),
(23, 'G', '', 'd1', 1, '', '', 3),
(24, 'H', '', 'd1', 1, '', '', 3),
(25, 'A', '', 'd1', 1, '', '', 2),
(26, 'B', '', 'd1', 1, '', '', 2),
(27, 'C', '', 'd1', 1, '', '', 2),
(28, 'D', '', 'd1', 1, '', '', 2),
(29, 'E', '', 'd1', 1, '', '', 2),
(30, 'F', '', 'd1', 1, '', '', 2),
(31, 'G', '', 'd1', 1, '', '', 2),
(32, 'A', '', 'd1', 1, '', '', 1),
(33, 'B', '', 'd1', 1, '', '', 1),
(34, 'C', '', 'd1', 1, '', '', 1),
(35, 'D', '', 'd1', 1, '', '', 1),
(36, 'E', '', 'd1', 1, '', '', 1),
(37, 'F', '', 'd1', 1, '', '', 1),
(38, 'G', '', 'd1', 1, '', '', 1),
(40, 'H', '', 'd1', 1, '', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `akademik_prodi`
--

CREATE TABLE IF NOT EXISTS `akademik_prodi` (
`prodi_id` int(11) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `ketua` varchar(70) NOT NULL,
  `no_izin` varchar(40) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=aktif ,2=g aktif'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `akademik_prodi`
--

INSERT INTO `akademik_prodi` (`prodi_id`, `nama_prodi`, `ketua`, `no_izin`, `status`) VALUES
(1, 'Kelas 7', '0', '0', 1),
(2, 'Kelas 8', '', '', 1),
(3, 'Kelas 9', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `akademik_tahun_akademik`
--

CREATE TABLE IF NOT EXISTS `akademik_tahun_akademik` (
`tahun_akademik_id` int(11) NOT NULL,
  `keterangan` varchar(15) NOT NULL,
  `batas_registrasi` date NOT NULL,
  `status` enum('n','y') NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `akademik_tahun_akademik`
--

INSERT INTO `akademik_tahun_akademik` (`tahun_akademik_id`, `keterangan`, `batas_registrasi`, `status`, `tahun`) VALUES
(1, '20141', '2014-09-06', 'n', 2014),
(6, '20142', '2014-09-25', 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_agama`
--

CREATE TABLE IF NOT EXISTS `app_agama` (
  `agama_id` int(11) NOT NULL,
  `keterangan` varchar(15) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `app_agama`
--

INSERT INTO `app_agama` (`agama_id`, `keterangan`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Katolik'),
(4, 'Budha'),
(5, 'Hindu');

-- --------------------------------------------------------

--
-- Table structure for table `app_dosen`
--

CREATE TABLE IF NOT EXISTS `app_dosen` (
`dosen_id` int(11) NOT NULL,
  `nama_lengkap` varchar(70) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `nip` varchar(22) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender` enum('1','2') NOT NULL,
  `agama_id` int(1) NOT NULL,
  `status_kawin` int(1) NOT NULL COMMENT '1=kawin ,2=belum kawin',
  `gelar_pendidikan` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `app_dosen`
--

INSERT INTO `app_dosen` (`dosen_id`, `nama_lengkap`, `nidn`, `nip`, `no_ktp`, `tempat_lahir`, `tanggal_lahir`, `gender`, `agama_id`, `status_kawin`, `gelar_pendidikan`, `alamat`, `hp`, `email`, `prodi_id`) VALUES
(1, 'nuris akbar sst', '748343', '196105041987032002', '43434', 'langsa', '2014-03-06', '1', 1, 1, 'sst', 'dsdsd', '081212123454', 'nu@gmail.com', 6),
(6, 'Dr. Ciek Juliati Hisyam, MM.,M.Si', '', '196204121987032001', '', '', '0000-00-00', '1', 1, 1, '', '', '089690987654', 'saidatunnafsiah@gmail.com', 6),
(7, 'Dr. Etin Solihatin, M.Pd.', '', '196601011989032003', '', '', '0000-00-00', '1', 1, 1, '', '', '089690987654', 'sampleemail@gmail.com', 6),
(8, 'Alex Iskandar, Drs.,M.Pd.', '0423085601', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(11, 'Indra Hermawan, SE.', '0403077902', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(17, 'Anton Gultom, SST.,M.Pd.', '0420075701', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(18, 'Berayan Munthe, MT.', '0426055402', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(19, 'Rahmat Kuswandy, Drs.', '0412034601', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(20, 'Chrestian Maxi Adri Mamesah', '0424035101', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(21, 'Ahadiat, SST.,M.Pd.', '0423065703', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(22, 'Rahmat Gunawan, SST.,M.Pd.', '0416056602', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(23, 'Hernawati, M.Si.', '0403027206', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(24, 'Darsono, M.T.', '0413016101', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(25, 'Sutandi, M.Pd.', '0402037305', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(26, 'Sueb, Drs.,M.Si.,M.Pd.', '0025035803', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(27, 'Theresia Florens Meliala, SST.,M.Pd.', '0419108101', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(28, 'Dini Arianti, ST.', '0401097702', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(29, 'Dadan Saeful Ramdhan, SST', '', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(30, 'Ganar Afin Nendriyawan, SST', '', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(31, 'Dian Rosdiana, SST', '', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(32, 'Riri Damayanti Apnena, SST', '', '', '', '', '0000-00-00', '1', 0, 0, '', '', '', '', 6),
(33, 'sample dosen', '2323', '444444', '', 'langsa', '2014-08-23', '1', 1, 1, '', 'sample alamat', '085654987654', 'nuris.akbar@gmail.com', 0),
(34, 'not set', '', '', '', '', '0000-00-00', '', 0, 0, '', '', '', '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `app_hari`
--

CREATE TABLE IF NOT EXISTS `app_hari` (
`hari_id` int(11) NOT NULL,
  `hari` varchar(15) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `app_hari`
--

INSERT INTO `app_hari` (`hari_id`, `hari`) VALUES
(0, 'not set'),
(1, 'senin'),
(2, 'selasa'),
(3, 'rabu'),
(4, 'kamis'),
(5, 'jumat'),
(6, 'sabtu'),
(7, 'minggu');

-- --------------------------------------------------------

--
-- Table structure for table `app_kelas`
--

CREATE TABLE IF NOT EXISTS `app_kelas` (
  `kelas_id` int(11) NOT NULL,
  `keterangan` varchar(15) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `app_kelas`
--

INSERT INTO `app_kelas` (`kelas_id`, `keterangan`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F'),
(7, 'G'),
(8, 'H');

-- --------------------------------------------------------

--
-- Table structure for table `app_pekerjaan`
--

CREATE TABLE IF NOT EXISTS `app_pekerjaan` (
  `pekerjaan_id` varchar(2) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_pekerjaan`
--

INSERT INTO `app_pekerjaan` (`pekerjaan_id`, `keterangan`) VALUES
('01', 'tidak bekerja'),
('02', 'nelayan'),
('03', 'petani'),
('04', 'peternak'),
('05', 'PNS/ TNI/ Polri'),
('06', 'Karyawan Swasta'),
('07', 'Pedagang Kecil'),
('08', 'Pedagang Besar'),
('09', 'Wiraswasta'),
('10', 'Wirausaha'),
('11', 'buruh'),
('12', 'pensiunan'),
('13', 'Guru'),
('99', 'lainya');

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
`id_users` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` int(1) NOT NULL COMMENT '1=admin ,2=pihak jurusan ,3=pegawai ,4=mahasiswa',
  `keterangan` varchar(5) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id_users`, `username`, `nama`, `password`, `level`, `keterangan`, `last_login`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '', '2018-07-31 21:03:35'),
(8, 'bendahara', '', 'e10adc3949ba59abbe56e057f20f883e', 2, '1', '2018-07-31 21:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(11),
(11),
(11);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_biaya_kuliah`
--

CREATE TABLE IF NOT EXISTS `keuangan_biaya_kuliah` (
`biaya_kuliah_id` int(11) NOT NULL,
  `jenis_bayar_id` int(3) NOT NULL,
  `prodi_id` int(3) NOT NULL,
  `konsentrasi_id` int(3) NOT NULL,
  `angkatan_id` int(3) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `keuangan_biaya_kuliah`
--

INSERT INTO `keuangan_biaya_kuliah` (`biaya_kuliah_id`, `jenis_bayar_id`, `prodi_id`, `konsentrasi_id`, `angkatan_id`, `jumlah`) VALUES
(1, 1, 1, 0, 3, 200000),
(2, 2, 1, 0, 3, 675000),
(16, 4, 1, 0, 3, 2500000),
(17, 5, 1, 0, 3, 140000),
(18, 6, 1, 0, 3, 140000),
(19, 7, 1, 0, 3, 1900000),
(20, 8, 1, 0, 3, 0),
(42, 1, 1, 0, 7, 0),
(43, 2, 1, 0, 7, 0),
(44, 4, 1, 0, 7, 0),
(45, 5, 1, 0, 7, 0),
(46, 6, 1, 0, 7, 0),
(47, 7, 1, 0, 7, 0),
(48, 8, 1, 0, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_jenis_bayar`
--

CREATE TABLE IF NOT EXISTS `keuangan_jenis_bayar` (
`jenis_bayar_id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `keuangan_jenis_bayar`
--

INSERT INTO `keuangan_jenis_bayar` (`jenis_bayar_id`, `keterangan`) VALUES
(1, 'SPP'),
(2, 'BUKU'),
(4, 'DPP+UNAS'),
(5, 'UTS'),
(6, 'UAS');

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_pembayaran`
--

CREATE TABLE IF NOT EXISTS `keuangan_pembayaran` (
`pembayaran_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `no_bayar` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_pembayaran_detail`
--

CREATE TABLE IF NOT EXISTS `keuangan_pembayaran_detail` (
`pembayara_detail_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nim` varchar(11) NOT NULL,
  `jenis_bayar_id` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `keuangan_pembayaran_detail`
--

INSERT INTO `keuangan_pembayaran_detail` (`pembayara_detail_id`, `tanggal`, `nim`, `jenis_bayar_id`, `id_users`, `jumlah`, `semester`) VALUES
(13, '2014-06-04 14:03:51', 'TI102134', 1, 1, 400000, 0),
(14, '2014-06-04 14:07:16', 'TI102134', 3, 1, 3400000, 1),
(15, '2014-06-04 14:07:37', 'TI102134', 3, 1, 3400000, 2),
(16, '2014-06-04 14:07:49', 'TI102134', 2, 1, 150000, 0),
(17, '2014-06-14 10:09:00', 'KA131002', 3, 1, 3400000, 1),
(18, '2014-06-14 10:09:37', 'KA131002', 3, 1, 3400000, 2),
(19, '2014-06-14 14:57:34', 'ti102134', 10, 1, 100000, 0),
(20, '2018-01-09 12:19:39', 'KA131002', 3, 1, 500000, 3),
(21, '2018-01-09 12:20:30', 'KA131002', 9, 1, 100000, 0),
(23, '2018-07-01 11:34:27', '2048', 4, 1, 1000000, 0),
(29, '2018-07-21 20:46:55', '2048', 2, 1, 200000, 0),
(30, '2018-07-21 20:48:12', '2048', 7, 1, 100000, 0),
(31, '2018-07-25 12:51:02', '2048', 1, 1, 200000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_transaksi`
--

CREATE TABLE IF NOT EXISTS `keuangan_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nim` varchar(8) NOT NULL,
  `biaya_kuliah_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `added_by` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT 'L=lunas ,1= cicilan ke 1 ,2=cicilan ke 2, 3=cicilan ke 3'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mainmenu`
--

CREATE TABLE IF NOT EXISTS `mainmenu` (
`id_mainmenu` int(11) NOT NULL,
  `nama_mainmenu` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `aktif` enum('y','t') NOT NULL,
  `link` varchar(50) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1= admin,2=jurusan,3 dosen'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `mainmenu`
--

INSERT INTO `mainmenu` (`id_mainmenu`, `nama_mainmenu`, `icon`, `aktif`, `link`, `level`) VALUES
(26, 'master data', 'fa fa-bar-chart-o', 'y', '#', 1),
(29, 'keuangan', 'fa fa-money', 'y', '#', 1),
(31, 'master data', 'fa fa-group', 'y', '#', 2),
(40, 'biodata', 'fa fa-user', 'y', 'users/account', 3),
(41, 'keuangan', 'fa fa-money', 'y', '#', 2),
(42, 'setting', 'fa fa-qrcode', 'y', '#', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `outbox`
--

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`) VALUES
('2014-05-12 09:23:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 46, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:23:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 45, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:23:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 44, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:23:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 42, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:23:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 43, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:23:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 41, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:24:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 47, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-12 09:24:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 48, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-22 03:14:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah -500000', 49, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2014-05-22 03:14:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 4750000', 50, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris'),
('2018-01-09 07:28:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '082121473036', 'Default_No_Compression', NULL, -1, 'Biaya Tunggakan Keuangan anak anda adalah 11600000', 51, 'false', -1, 'keuangan', '0000-00-00 00:00:00', 'default', 'Nuris');

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE IF NOT EXISTS `pbk` (
`ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `Name` text NOT NULL,
`ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '0',
  `Signal` int(11) NOT NULL DEFAULT '0',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('keuangan', '2014-05-12 01:27:43', '2014-05-11 23:20:24', '2014-05-12 01:27:53', 'yes', 'yes', '354058180822796', 'Gammu 1.28.90, Windows Server 2007, GCC 4.4, MinGW 3.13', 0, 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2014-04-27 23:08:17', '0000-00-00 00:00:00', '2014-04-27 23:08:17', NULL, '00740065007300740069006E006700200073006D0073002000700065007200740061006D0061', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'testing sms pertama', 1, 'testingSMS', 1, 'SendingOKNoReport', -1, 19, 255, 'Gammu 1.28.90'),
('2014-04-27 23:26:31', '0000-00-00 00:00:00', '2014-04-27 23:26:31', NULL, '007400650073007400200073006D00730020006B0065006400750061', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'test sms kedua', 2, 'testingSMS', 1, 'SendingError', -1, -1, 255, 'nuris'),
('2014-04-27 23:28:50', '0000-00-00 00:00:00', '2014-04-27 23:28:50', NULL, '006800680068006800680068', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hhhhhh', 8, 'testingSMS', 1, 'SendingOKNoReport', -1, 20, 255, 'Gammu 1.28.90'),
('2014-04-27 23:28:53', '0000-00-00 00:00:00', '2014-04-27 23:28:53', NULL, '00680061006C006C006F0020006E0075007200690073', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hallo nuris', 3, 'testingSMS', 1, 'SendingOKNoReport', -1, 21, 255, 'Gammu'),
('2014-04-27 23:28:56', '0000-00-00 00:00:00', '2014-04-27 23:28:56', NULL, '00680061006C006C006F0020006E0075007200690073', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hallo nuris', 4, 'testingSMS', 1, 'SendingOKNoReport', -1, 22, 255, 'Gammu'),
('2014-04-27 23:29:00', '0000-00-00 00:00:00', '2014-04-27 23:29:00', NULL, '0068006100690020006E007500720069007300200061006B006200610072', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hai nuris akbar', 5, 'testingSMS', 1, 'SendingOKNoReport', -1, 23, 255, 'Gammu 1.28.90'),
('2014-04-27 23:29:03', '0000-00-00 00:00:00', '2014-04-27 23:29:03', NULL, '0068006100690020006E007500720069007300200061006B0062006100720032', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hai nuris akbar2', 6, 'testingSMS', 1, 'SendingOKNoReport', -1, 24, 255, 'Gammu 1.28.90'),
('2014-04-27 23:29:06', '0000-00-00 00:00:00', '2014-04-27 23:29:06', NULL, '00630063006300630063', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'ccccc', 7, 'testingSMS', 1, 'SendingOKNoReport', -1, 25, 255, 'Gammu 1.28.90'),
('2014-04-27 23:29:09', '0000-00-00 00:00:00', '2014-04-27 23:29:09', NULL, '006B006B006B006B006B', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'kkkkk', 9, 'testingSMS', 1, 'SendingOKNoReport', -1, 26, 255, 'Gammu 1.28.90'),
('2014-04-27 23:45:17', '0000-00-00 00:00:00', '2014-04-27 23:45:17', NULL, '0063006F006200610020006B006900720069006D0020006400610072006900200063006F0064006500690067006E0069007400650072', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'coba kirim dari codeigniter', 10, 'testingSMS', 1, 'SendingOKNoReport', -1, 27, 255, 'Gammu 1.28.90'),
('2014-04-27 23:45:21', '0000-00-00 00:00:00', '2014-04-27 23:45:21', NULL, '0063006F006200610020006B006900720069006D0020006400610072006900200063006F0064006500690067006E00690074006500720020006B0065006400750061', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'coba kirim dari codeigniter kedua', 11, 'testingSMS', 1, 'SendingOKNoReport', -1, 28, 255, 'Gammu 1.28.90'),
('2014-04-27 23:45:56', '0000-00-00 00:00:00', '2014-04-27 23:45:56', NULL, '0063006F006200610020006B006900720069006D0020006400610072006900200063006F0064006500690067006E00690074006500720020006B00650074006900670061', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'coba kirim dari codeigniter ketiga', 12, 'testingSMS', 1, 'SendingOKNoReport', -1, 29, 255, 'Gammu 1.28.90'),
('2014-04-27 23:49:01', '0000-00-00 00:00:00', '2014-04-27 23:49:01', NULL, '006800610069002000620072006F', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'hai bro', 13, 'testingSMS', 1, 'SendingOKNoReport', -1, 30, 255, 'Gammu 1.28.90'),
('2014-04-28 00:30:10', '0000-00-00 00:00:00', '2014-04-28 00:30:10', NULL, '0057006500620020006F006600200049006E0066006F0072006D006100740069006F006E002000530079007300740065006D0020006F006600200041006B006100640065006D00690063002000500072006F006700720061006D00200053007400750064007900200049006E0073007400720075006D0065006E0074006100740069006F006E000D000A00200020002000200020002000200020002000200020002000200020002000200061006E006400200045006C0065006300740072006F006E006900630073002000680061007600650020006200650065006E002000640065007300690067006E0065006400200061006E0064002000630061006E0020006200650020006100630063006500730073006500640020007400680072006F00750067006800200069006E007400650072', '082121473036', 'Default_No_Compression', '0500038C0301', '+6289644000001', -1, 'Web of Information System of Akademic Program Study Instrumentation\r\n                and Electronics have been designed and can be accessed through inter', 15, 'testingSMS', 1, 'SendingOKNoReport', -1, 31, 255, 'Gammu'),
('2014-04-28 00:30:14', '0000-00-00 00:00:00', '2014-04-28 00:30:14', NULL, '006E00650074002E0020004200790020007700650062000D000A002000200020002000200020002000200020002000200020002000200020002000740068006500200061006C006C00200069006E0066006F0072006D006100740069006F006E002000610062006F007500740020006B006E006F007700610062006C006500200061006B006100640065006D00690063002E000D000A0020002000200020002000200020002000200020002000200020002000200020005700650062002000640065007300690067006E0065006400200072006500700072006500730065006E0074002000640079006E0061006D00690063002000770065006200200073006F00200074006800610074002000630061006E0020006D0061006B0065002000610020006300680061006E0067006500200064', '082121473036', 'Default_No_Compression', '0500038C0302', '+6289644000001', -1, 'net. By web\r\n                the all information about knowable akademic.\r\n                Web designed represent dynamic web so that can make a change d', 15, 'testingSMS', 2, 'SendingOKNoReport', -1, 32, 255, 'Gammu'),
('2014-04-28 00:30:16', '0000-00-00 00:00:00', '2014-04-28 00:30:16', NULL, '006100740061002000610074002E', '082121473036', 'Default_No_Compression', '0500038C0303', '+6289644000001', -1, 'ata at.', 15, 'testingSMS', 3, 'SendingOKNoReport', -1, 33, 255, 'Gammu'),
('2014-05-11 09:21:47', '0000-00-00 00:00:00', '2014-05-11 09:21:47', NULL, '0067006600670066006700660067', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'gfgfgfg', 23, 'keuangan', 1, 'SendingOKNoReport', -1, 134, 255, 'Gammu 1.28.90'),
('2014-05-11 23:20:58', '0000-00-00 00:00:00', '2014-05-11 23:20:58', NULL, '0074006500730020006B006900720069006D00200073006D0073', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'tes kirim sms', 36, 'keuangan', 1, 'SendingOKNoReport', -1, 160, 255, 'Gammu 1.28.90'),
('2014-05-11 23:25:35', '0000-00-00 00:00:00', '2014-05-11 23:25:35', NULL, '00420069006100790061002000540075006E006700670061006B0061006E0020004B006500750061006E00670061006E00200061006E0061006B00200061006E006400610020006100640061006C0061006800200033003500300030003000300030', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'Biaya Tunggakan Keuangan anak anda adalah 3500000', 40, 'keuangan', 1, 'SendingOKNoReport', -1, 161, 255, 'Nuris'),
('2014-05-11 23:25:38', '0000-00-00 00:00:00', '2014-05-11 23:25:38', NULL, '00420069006100790061002000540075006E006700670061006B0061006E0020004B006500750061006E00670061006E00200061006E0061006B00200061006E006400610020006100640061006C0061006800200031003400300030003000300030', '082121473036', 'Default_No_Compression', '', '+6289644000001', -1, 'Biaya Tunggakan Keuangan anak anda adalah 1400000', 39, 'keuangan', 1, 'SendingOKNoReport', -1, 162, 255, 'Nuris');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL,
  `nama_kampus` varchar(160) NOT NULL,
  `alamat_kampus` text NOT NULL,
  `telpon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `nama_kampus`, `alamat_kampus`, `telpon`) VALUES
(1, 'SMP SEPULUH NOPEMBER', 'SIDOARJO', '031861010');

-- --------------------------------------------------------

--
-- Table structure for table `student_angkatan`
--

CREATE TABLE IF NOT EXISTS `student_angkatan` (
`angkatan_id` int(11) NOT NULL,
  `keterangan` varchar(15) NOT NULL,
  `aktif` varchar(1) NOT NULL COMMENT 'y = aktif dan n = tidak'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `student_angkatan`
--

INSERT INTO `student_angkatan` (`angkatan_id`, `keterangan`, `aktif`) VALUES
(3, '2017-2018', 'y'),
(7, '2018-2019', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `student_siswa`
--

CREATE TABLE IF NOT EXISTS `student_siswa` (
`siswa_id` int(11) NOT NULL,
  `nim` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `prodi_id` int(2) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `angkatan_id` int(4) NOT NULL COMMENT 'tahun akademik ketika masuk',
  `alamat` text NOT NULL,
  `semester` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `agama_id` int(11) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `no_hp_ortu` varchar(12) NOT NULL,
  `pekerjaan_id_ibu` int(11) NOT NULL,
  `pekerjaan_id_ayah` int(11) NOT NULL,
  `alamat_ayah` text NOT NULL,
  `alamat_ibu` text NOT NULL,
  `penghasilan_ayah` int(11) NOT NULL,
  `penghasilan_ibu` int(11) NOT NULL,
  `semester_aktif` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=276 ;

--
-- Dumping data for table `student_siswa`
--

INSERT INTO `student_siswa` (`siswa_id`, `nim`, `nama`, `prodi_id`, `kelas_id`, `angkatan_id`, `alamat`, `semester`, `gender`, `agama_id`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `no_hp_ortu`, `pekerjaan_id_ibu`, `pekerjaan_id_ayah`, `alamat_ayah`, `alamat_ibu`, `penghasilan_ayah`, `penghasilan_ibu`, `semester_aktif`) VALUES
(1, '2046', 'ABID MUNSHIF RAFI', 1, 1, 3, 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IRMA ISNAINI', 'BINTANG HERMAWAN', '085655366741', 1, 6, 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 0, 0, 0),
(2, '2047', 'ADAM SETYA PRATAMA', 1, 1, 3, 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NATALIA DINIK DEWAYANI', 'SETIYO WAHYUDI', '85101294041', 1, 6, 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 0, 0, 0),
(3, '2048', 'AHILLAH HALIMATUS HAWA', 1, 1, 3, 'PERUM GRAHA POS PROPERINDO CA-08 ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'EVI ANDRIANI', 'DHANI WIBOWO, SE', '85231848468', 1, 5, 'PERUM GRAHA POS PROPERINDO CA-08 ', 'PERUM GRAHA POS PROPERINDO CA-08 ', 0, 0, 0),
(4, '2049', 'AIDIN FERARISTA ZAKARIYAH', 1, 1, 3, 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'WIWIT WIDOWATI', 'RUDY HARTONO', '8123524515', 1, 6, 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 0, 0, 0),
(5, '2050', 'ALFITRAH ARDANA PUTRA', 1, 1, 3, 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NURHAYANI', 'R. IRWAN SATRIO', '8135711746', 1, 99, 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(6, '2051', 'AMELIA', 1, 1, 3, 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'MAIMUNA', 'SANIAN', '8785391477', 1, 9, 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, 0, 0),
(7, '2052', 'ANISA NABILA SAVITRI', 1, 1, 3, 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'EMI SUSIAM', 'SHOLIKIN SOFYAN', '82234440468', 1, 9, 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 0, 0, 0),
(8, '2053', 'ARVA SATRIA PUTRA NUGRAHA', 1, 1, 3, 'NATURA RESIDENCE A8-3 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MARTINI', 'DASA HARI NUGRAHA', '8123497080', 1, 6, 'NATURA RESIDENCE A8-3 SIDOARJO', 'NATURA RESIDENCE A8-3 SIDOARJO', 0, 0, 0),
(9, '2054', 'AVREL MAULANA PUTRA PURWOKO', 1, 1, 3, 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ISNANI', 'PURWOKO', '87702884156', 1, 6, 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 0, 0, 0),
(10, '2055', 'CANTICCA NOVIANA', 1, 1, 3, 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, '2', 2, 'Sidoarjo', '0000-00-00', 'ANNA FITRIA', 'ANTOK ARIYANTO', '82230886174', 1, 9, 'GAJAH MAGERSARI 16/05 SIDOARJO', 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, 0, 0),
(11, '2056', 'DEWI SUKMA FII AMANILLAH', 1, 1, 3, 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SRI ANDAYANI', 'MAHMUDI', '8563063147', 1, 9, 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 0, 0, 0),
(12, '2057', 'DWITA AYU NIRMALA ', 1, 1, 3, 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'AYUTIK', 'EDI SUDARWANTO', '89674180352', 1, 6, 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 0, 0, 0),
(13, '2058', 'FAIZ AGENG PRATAMA', 1, 1, 3, 'PANDEAN 05/01 BANJARKEMANTREN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HENI SOELISTIYOWATI', 'RIFA''I', '81330167691', 1, 6, 'PANDEAN 05/01 BANJARKEMANTREN', 'PANDEAN 05/01 BANJARKEMANTREN', 0, 0, 0),
(14, '2059', 'FERRARI SHEVKIANO DJAMIR', 1, 1, 3, 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IRA KUSUMA DEWI', 'JULIANDRE CHANIAGO', '81216798089', 1, 9, 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 0, 0, 0),
(15, '2060', 'HYMTA ALEXANDER NUGRAHA KADANG', 1, 1, 3, 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'OKTAVIA MAHARANI', 'NICOLAS KADANG', '81357222458', 1, 6, 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 0, 0, 0),
(16, '2061', 'JASSON HOSHI MACHIDA', 1, 1, 3, 'KEBOAN SIKEP 05/01 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IDA ULFAH', 'BAMBANG HARMINTO MACHIDA', '85954407963', 1, 6, 'KEBOAN SIKEP 05/01 GEDANGAN', 'KEBOAN SIKEP 05/01 GEDANGAN', 0, 0, 0),
(17, '2062', 'KEZIA YOUAN VEBRINA', 1, 1, 3, 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'YULI RAHMAWATI', 'YOHANES SUPRIYANTO', '85606591415', 1, 6, 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 0, 0, 0),
(18, '2063', 'M. FAVIAN FARHAN', 1, 1, 3, 'PONDOK JATI DE-17 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPRIYATININGSIH', 'INDRA YUDHANA', '031-8073648', 1, 6, 'PONDOK JATI DE-17 SIDOARJO', 'PONDOK JATI DE-17 SIDOARJO', 0, 0, 0),
(19, '2064', 'MAULANA AKBAR RASYID', 1, 1, 3, 'PURI SURYA JAYA 12/39 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NUR ZAKIYAH', 'YUSUF  ', '85231862531', 1, 6, 'PURI SURYA JAYA 12/39 GEDANGAN', 'PURI SURYA JAYA 12/39 GEDANGAN', 0, 0, 0),
(20, '2065', 'MIRNA MEITA RAHMAWATI', 1, 1, 3, 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'KATINAH', 'EDY SAMPURNO', '85708074694', 1, 6, 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 0, 0, 0),
(21, '2066', 'MOCHAMAD SURYA PRATAMA', 1, 1, 3, 'SIDOKEPUNG 08/02 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NISFUL LAILI', 'SUTRISNO ', '87703077236', 1, 6, 'SIDOKEPUNG 08/02 BUDURAN', 'SIDOKEPUNG 08/02 BUDURAN', 0, 0, 0),
(22, '2067', 'MOHAMMAD REZA SETIAWAN', 1, 1, 3, 'KARANGBONG 02/03 NO.414 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'KHOLIFAH', 'CHOIRUL ANWAR', '83830359312', 1, 9, 'KARANGBONG 02/03 NO.414 GEDANGAN', 'KARANGBONG 02/03 NO.414 GEDANGAN', 0, 0, 0),
(23, '2068', 'MUHAMMAD ALFIDIAN AQILAMIR', 1, 1, 3, 'BCF Jl.SEKAWAN HARUM B.20', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NOVA MAHENDRA MISDIANA', 'FITHER SANI', '81358000097', 1, 9, 'BCF Jl.SEKAWAN HARUM B.20', 'BCF Jl.SEKAWAN HARUM B.20', 0, 0, 0),
(24, '2069', 'MUHAMMAD HAIKAL WAHYU PUTRA', 1, 1, 3, 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'YULI ANDRIANI', 'WAHYU SHALEHIN AL ANSHARI', '8125134605', 1, 6, 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 0, 0, 0),
(25, '2070', 'NANDA AGUNG SETIAWAN', 1, 1, 3, 'PANDEAN 10/01 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SRI ANDAYANI', 'ANDRI SETIAWAN', '81335628844', 1, 8, 'PANDEAN 10/01 BUDURAN', 'PANDEAN 10/01 BUDURAN', 0, 0, 0),
(26, '2071', 'NARULITA ELANIA FATIHAH', 1, 1, 3, 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'PURYANI', 'CANDRA ALI LESMANA', '', 1, 10, 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 0, 0, 0),
(27, '2072', 'NOFITA MAULIDIYAH', 1, 1, 3, 'Jl. SRUNI 03/01 No.142 GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'WELAS ASIH', 'AFFANDI (Alm)', '85730032152', 1, 6, 'Jl. SRUNI 03/01 No.142 GEDANGAN', 'Jl. SRUNI 03/01 No.142 GEDANGAN', 0, 0, 0),
(28, '2073', 'NUR LAILATUN NASFIYAH ', 1, 1, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUYATI', 'SOFA HADI MUDZAKKIR', '85646527616', 1, 6, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(29, '2074', 'RACHMADANI NOVYA SRY REJEKY', 1, 1, 3, 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUMARNI', 'ADI MULYA ', '81357382702', 1, 6, 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 0, 0, 0),
(30, '2075', 'RANGGA OCTADHIO PRATAMA', 1, 1, 3, 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'WARIH ANTARI', 'ISMAWAN', '82230570205', 1, 6, 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 0, 0, 0),
(31, '2076', 'RENDY WAHYU PRATAMA', 1, 1, 3, 'BANJARKEMANTREN 04/04 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DWI RETNOWATI', 'IMAM ROEKAN', '85645458700', 1, 6, 'BANJARKEMANTREN 04/04 BUDURAN', 'BANJARKEMANTREN 04/04 BUDURAN', 0, 0, 0),
(32, '2077', 'REYHAN RAHADIAN', 1, 1, 3, 'PONDOK JATI BLOK T-24 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'Dra. UMI NURHAYATI', 'Ir. KRESNO DIPOYONO', '81216284242', 1, 12, 'PONDOK JATI BLOK T-24 SIDOARJO', 'PONDOK JATI BLOK T-24 SIDOARJO', 0, 0, 0),
(33, '2078', 'RISKI FEBRIAN CHANDRA', 1, 1, 3, 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISWI ESTU RETNANINGRUM', 'DEDY CHANDRA', '82254226222', 1, 6, 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 0, 0, 0),
(34, '2079', 'SALMAN ALFARISI ', 1, 1, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MARIYATUL QIPTIYAH', 'MUJALAL', '-', 1, 9, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(35, '2080', 'SEPTIAN SURYA ADITYA', 1, 1, 3, 'BANJARPOH 14/06 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NGATILAH', 'MUKIJAM', '', 1, 6, 'BANJARPOH 14/06 BUDURAN', 'BANJARPOH 14/06 BUDURAN', 0, 0, 0),
(36, '2081', 'SYAHFRI ILHAM SETIAWAN', 1, 1, 3, 'KEBOANSIKEP 04/04 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SOFIA YULIATI', 'DONNY YUDA SETIAWAN', '81231742991', 1, 9, 'KEBOANSIKEP 04/04 GEDANGAN', 'KEBOANSIKEP 04/04 GEDANGAN', 0, 0, 0),
(37, '2082', 'VALDANOGA PONGSIRANTE RERUNG', 1, 1, 3, 'PERUM KEMIRI INDAH BLOK C5/12', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'ISWAHYUNI', 'VICTOR RERUNG', '82293040477', 1, 9, 'PERUM KEMIRI INDAH BLOK C5/12', 'PERUM KEMIRI INDAH BLOK C5/12', 0, 0, 0),
(38, '2083', 'YASIER ARAFAT', 1, 1, 3, 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPRAPTI', 'ACH.SAAD', '82140107998', 1, 6, 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 0, 0, 0),
(39, '2084', 'ZAHWA MAHARANI PUTRI', 1, 1, 3, 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YANI NURHAYATI', 'NUGROHO SETYO WIBOWO ', '031-8050061', 1, 6, 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 0, 0, 0),
(40, '02085', 'ABIYOSO SYAM PAMUNGKAS SETIAWAN', 1, 2, 3, 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'PAULA KOMALASARI', 'DIDY SETIAWAN', '082140964046', 1, 10, 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 0, 0, 0),
(41, '02086', 'ADELINE AUREL YAFI SEPTANIA', 1, 2, 3, 'PERUM MAGERSARI Z18 33/07 SDA', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'Dra. TITIK SETIYAWATI', 'Ir. G. SOEMARSONO', '081332354821', 1, 5, 'PERUM MAGERSARI Z18 33/07 SDA', 'PERUM MAGERSARI Z18 33/07 SDA', 0, 0, 0),
(42, '02087', 'AHKAM MAULANA IHYAUDDIN ', 1, 2, 3, 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DIAH MUTIASARI', 'IWAN IHYAUDDIN', '081231500182', 1, 10, 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 0, 0, 0),
(43, '02088', 'AJENG PURTIVIKASRI', 1, 2, 3, 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YULIATI', 'Ir. BAMBANG PURNOMO', '081233423380', 1, 12, 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 0, 0, 0),
(44, '02089', 'ALIF NAUFAL FAKHRI SARYUANSAH', 1, 2, 3, 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'YUNI ANDAYANI', 'SARWI EDI', '081554157843', 1, 9, 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 0, 0, 0),
(45, '02090', 'AMELIYA SEPFING', 1, 2, 3, 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NURYANAH', 'YOHANIS SUTANTO', '085852998341', 1, 7, 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 0, 0, 0),
(46, '02091', 'ANNAS HENDRIAN MAULANA', 1, 2, 3, 'SUKOREJO 10/03 BUDURAN', 0, '1', 1, 'MALANG', '0000-00-00', 'IMA TATIK MURIYANTI', 'KARIYONO', '085648721212', 1, 6, 'SUKOREJO 10/03 BUDURAN', 'SUKOREJO 10/03 BUDURAN', 0, 0, 0),
(47, '02092', 'ARVIEN SAVA NAYAKA ANANTA FIRMANSYAH', 1, 2, 3, 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'AFIF ROHMANIYATI', 'TITO RIZKY FIRMANSYAH', '085732799889', 1, 6, 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 0, 0, 0),
(48, '02093', 'AYU DEWI SETYOWATI', 1, 2, 3, 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SOEMARSIH', 'SAMALI', '085791214045', 1, 11, 'GAJAH MAGERSARI 13/04 SIDOARJO', 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, 0, 0),
(49, '02094', 'CHALITA DHUHA WISESA', 1, 2, 3, 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'WIDIARTIN', 'AMARUDIN DJOKO SUSENO', '081233846421', 1, 10, 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 0, 0, 0),
(50, '02095', 'DIAN ARDIANSYAH', 1, 2, 3, 'JL PASAR BUDURAN 10/04 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISWATI', 'DONI SUDIWUL', '081330002599', 1, 7, 'JL PASAR BUDURAN 10/04 BUDURAN', 'JL PASAR BUDURAN 10/04 BUDURAN', 0, 0, 0),
(51, '02096', 'ELENA ZVONAREVA SALENUSSA', 1, 2, 3, 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'IKHA RINA YULIYANTI', 'NICOLAS SALENUSSA', '082232171623', 1, 5, 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 0, 0, 0),
(52, '02097', 'FAJAR NUR ASHFIYA''', 1, 2, 3, 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 0, '1', 1, 'NGANJUK', '0000-00-00', 'RO''IKHATUL JANNAH', 'ABDUL WAHIB', '081235651950', 1, 10, 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 0, 0, 0),
(53, '02098', 'FARHAN RADITYA SUHENDRO', 1, 2, 3, 'PONDOK JATI AL-22 SIDOARJO', 0, '1', 1, 'JAKARTA', '0000-00-00', 'HENNY WIBOWO', 'SUHENDRO DWI CAHYONO', '081311302816', 1, 5, 'PONDOK JATI AL-22 SIDOARJO', 'PONDOK JATI AL-22 SIDOARJO', 0, 0, 0),
(54, '02099', 'FIFIN AULIA ALFIANTI', 1, 2, 3, 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUSIANA', 'MOCHAMMAD ROEM', '0818322668', 1, 9, 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 0, 0, 0),
(55, '02100', 'GIBRAN AQSHA HENDRAWAN', 1, 2, 3, 'Jl. SURABAYAN 1 NO.25 SURABAYA', 0, '1', 1, 'SURABAYA', '0000-00-00', 'RATNA PUSPITASARI', 'RISQKI HENDRAWAN', '081330613357', 1, 6, 'Jl. SURABAYAN 1 NO.25 SURABAYA', 'Jl. SURABAYAN 1 NO.25 SURABAYA', 0, 0, 0),
(56, '02101', 'ILHAM AKBARIZKY', 1, 2, 3, 'DS. SURUH 11/03 SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MAROTIN', 'SUPENI', '', 1, 6, 'DS. SURUH 11/03 SUKODONO', 'DS. SURUH 11/03 SUKODONO', 0, 0, 0),
(57, '02102', 'JERICO PUTRA PRADANA', 1, 2, 3, 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'TANTI KUSUMA WARDANY', 'EKO DESIANTO', '082231113643', 1, 6, 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 0, 0, 0),
(58, '02103', 'KHISBUL ANWAR', 1, 2, 3, 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HERMIN', 'KHAMAMI', '085648925315', 1, 9, 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 0, 0, 0),
(59, '02104', 'M. MAULANA ROZAQ', 1, 2, 3, 'ENTALSEWU 13/04 BUDURAN', 0, '1', 1, 'BLORA', '0000-00-00', 'SRI WAHYU EKO PRATIWI', 'PURWANTORO', '088977730722', 1, 6, 'ENTALSEWU 13/04 BUDURAN', 'ENTALSEWU 13/04 BUDURAN', 0, 0, 0),
(60, '02105', 'MAULANA EKA PRATAMA', 1, 2, 3, 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LILIK KASIANI', 'DAHIRUN', '081285927477', 1, 6, 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 0, 0, 0),
(61, '02106', 'MOCH GALANG JALU CANTONA', 1, 2, 3, 'SRUNI 14/03 GEDANGAN', 0, '1', 1, 'JEMBER', '0000-00-00', 'MUSRIYATUN', 'MOCH TRIYONO', '085797140082', 1, 9, 'SRUNI 14/03 GEDANGAN', 'SRUNI 14/03 GEDANGAN', 0, 0, 0),
(62, '02107', 'MOCHAMMAD ADITYA FAIZ PRATAMA', 1, 2, 3, 'SIDOKERTO 01/04 NO.19 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'TASRIFAH', 'SUSILO', '085645218562', 1, 6, 'SIDOKERTO 01/04 NO.19 BUDURAN', 'SIDOKERTO 01/04 NO.19 BUDURAN', 0, 0, 0),
(63, '02108', 'MOHAMMAD RIZKI FEBRIANTO', 1, 2, 3, 'BLURU KIDUL 04/13 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPIYATI TRININGRUM', 'EFENDI', '085258322017', 1, 6, 'BLURU KIDUL 04/13 SIDOARJO', 'BLURU KIDUL 04/13 SIDOARJO', 0, 0, 0),
(64, '02109', 'MUHAMMAD ALLYA NOER MUZAMIL', 1, 2, 3, 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 0, '1', 1, 'LAMONGAN', '0000-00-00', 'MILA', 'MAJID SANTOSO', '082301972279', 1, 9, 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 0, 0, 0),
(65, '02110', 'MUHAMMAD IRFAN', 1, 2, 3, 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 0, '1', 1, 'PADANG', '0000-00-00', 'YANTI RUDIANA', 'MUHAMMAD GUNTUR', '', 1, 9, 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(66, '02111', 'NADHIL PRATAMA', 1, 2, 3, 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 0, '1', 1, 'JOMBANG', '0000-00-00', 'ENDAH JUNIATI', 'NURSYAM', '081357361036', 1, 5, 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 0, 0, 0),
(67, '02112', 'NATASYA SHALSABILLA', 1, 2, 3, 'PERUM BLURU PERMAI Ci/04', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'FETIKA ARISANDI', 'HERDI ARLIYANTO', '0318065017', 1, 9, 'PERUM BLURU PERMAI Ci/04', 'PERUM BLURU PERMAI Ci/04', 0, 0, 0),
(68, '02113', 'NOVA LABITA FERNANDA', 1, 2, 3, 'KEBOAN ANOM 01/01 GEDANGAN', 0, '2', 1, 'KEDIRI', '0000-00-00', 'ASTUTIK SETIONINGRUM', 'EDI SUYETNO', '081232679762', 1, 6, 'KEBOAN ANOM 01/01 GEDANGAN', 'KEBOAN ANOM 01/01 GEDANGAN', 0, 0, 0),
(69, '02114', 'OZZY FITSANDY', 1, 2, 3, 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SURATMI', 'MIATMO SUPRAPTO', '082230342441', 1, 6, 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(70, '02115', 'RAHMA AULIA FIRDAUS', 1, 2, 3, 'Jl. JENGGOLO III/55A PUCANG ', 0, '1', 1, 'DENPASAR', '0000-00-00', 'ANIS MUYASAROH', 'ENDRI SETYAWAN', '081249306820', 1, 9, 'Jl. JENGGOLO III/55A PUCANG ', 'Jl. JENGGOLO III/55A PUCANG ', 0, 0, 0),
(71, '02116', 'RASHYNTA YULIANDA BRELIANA', 1, 2, 3, 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'UPIK WATI', 'BENI SUSANTO', '081217017241', 1, 9, 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 0, 0, 0),
(72, '02117', 'RENO ADITYA NASA SAPUTRA', 1, 2, 3, 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 0, '1', 1, 'TULUNGAGUNG', '0000-00-00', 'NUR AISYAH', 'EKO SUMONO', '081357917007', 1, 9, 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 0, 0, 0),
(73, '02118', 'RIZKY DWIMANDA PUTRA', 1, 2, 3, 'SUKODONO TOWN HOUSE BLOK D/12 A', 0, '1', 1, 'CIREBON', '0000-00-00', 'LINDA MAYASARI', 'LUKMANSYAH', '082232319144', 1, 6, 'SUKODONO TOWN HOUSE BLOK D/12 A', 'SUKODONO TOWN HOUSE BLOK D/12 A', 0, 0, 0),
(74, '02119', 'SAMUDERA AHMAD', 1, 2, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DEWI ASLAMIYAH', 'AKAT', '081230399554', 1, 6, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(75, '02120', 'SEPTYA ANJAR ALYANDARI KOENTJORO', 1, 2, 3, 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'RITA SRI WEDARI', 'R. SOELOKOENTJORO', '087754262979', 1, 6, 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 0, 0, 0),
(76, '02121', 'SYAHRANI ANGELA DELLA VIDA', 1, 2, 3, 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'ISNAINI BS SISTHA', 'SULISTIAWAN', '085645983953', 1, 9, 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 0, 0, 0),
(77, '02122', 'VIOLA DIAH AYU ILHAM LAFITRI', 1, 2, 3, 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YENNY NUR KUMALA', 'MOCH ILHAM', '082132319569', 1, 5, 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 0, 0, 0),
(78, '02123', 'YOGARAKSA ARIADI WICAKSANA', 1, 2, 3, 'BLURU KIDUL 01/08 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LUSIARINI', 'DIDIK SUPRIYADI', '087856674588', 1, 6, 'BLURU KIDUL 01/08 SIDOARJO', 'BLURU KIDUL 01/08 SIDOARJO', 0, 0, 0),
(79, '02124', 'ACHMAD ALDY ARIAJI', 1, 3, 3, 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'UMI MUJAYAHAH', 'RIAJI', '081330951359', 1, 10, 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 0, 0, 0),
(80, '02125', 'ADINDA PUTRI AYUNDA PUSPITASARI ', 1, 3, 3, 'DS. PRUMPON 08/02 SURUH SUKODONO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'VIVA YULI ASTUTIK', 'EKO SETYAWAN', '081334188385', 1, 5, 'DS. PRUMPON 08/02 SURUH SUKODONO', 'DS. PRUMPON 08/02 SURUH SUKODONO', 0, 0, 0),
(81, '02126', 'AHMAD ALI ASY SYAWOI', 1, 3, 3, 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HARYUDIAH RASDIAHYU', 'HERLAN SUDARTO', '081252719926', 1, 10, 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 0, 0, 0),
(82, '02127', 'AKHMAD FATHONI ALI', 1, 3, 3, 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DYAH FITRHRI RAHAYU', 'ALI MACHFUD', '081333242006', 1, 12, 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 0, 0, 0),
(83, '02128', 'ALVIA NATASYA AGUSTIN', 1, 3, 3, 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SITI ROMLAH', 'IMAM SYAFII', '081242959487', 1, 9, 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 0, 0, 0),
(84, '02129', 'ANANDYA PUTRI YUNIARTI', 1, 3, 3, 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUCI HARINI', 'HERU PURNOMO', '085785646535', 1, 7, 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 0, 0, 0),
(85, '02130', 'ANNISA RAMADHANI EFENDI', 1, 3, 3, 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'FENY TRISSIE INDRIANI', 'KOESNOE EFENDI', '081216277768', 1, 6, 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 0, 0, 0),
(86, '02131', 'ASYAM ERLANGGA PUTRA DWIYONO', 1, 3, 3, 'PERUM SUKODONO PERMAI BLOK H NO 05', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NENNY IRAWATI', 'CATUR DARYONO', '081231203378', 1, 6, 'PERUM SUKODONO PERMAI BLOK H NO 05', 'PERUM SUKODONO PERMAI BLOK H NO 05', 0, 0, 0),
(87, '02132', 'BAGUS ARDHI NUGROHO', 1, 3, 3, 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ANI SETYANINGSIH', 'ANDHIK', '085731330122', 1, 11, 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 0, 0, 0),
(88, '02133', 'CHLARISSA MAHARANI', 1, 3, 3, 'KARANGBONG 05/01 GEDANGAN', 0, '2', 1, 'KEDIRI', '0000-00-00', 'ANDAYANI', 'SUGIANTO', '082234643922', 1, 10, 'KARANGBONG 05/01 GEDANGAN', 'KARANGBONG 05/01 GEDANGAN', 0, 0, 0),
(89, '02134', 'DIAZ YUFI AGATHA', 1, 3, 3, 'PANDEMONEGORO 01/01 SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ANGELINA NATALIA', 'LAGA FIRMANA', '085856084733', 1, 7, 'PANDEMONEGORO 01/01 SUKODONO', 'PANDEMONEGORO 01/01 SUKODONO', 0, 0, 0),
(90, '02135', 'ELSHADAH HELENA PATRICIA', 1, 3, 3, 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 0, '2', 2, 'SURABAYA', '0000-00-00', 'ELLY ERNA SIHOMBING', 'ESRON HUTABALIAN', '081232046208', 1, 5, 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 0, 0, 0),
(91, '02136', 'FARADINA AUREL DEVANY', 1, 3, 3, 'Jl. R.K JIMAT 02/06 GEDANGAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'DWI ADJENG AMBARINI', 'NOVI YUDI ANTO', '085732565589', 1, 10, 'Jl. R.K JIMAT 02/06 GEDANGAN', 'Jl. R.K JIMAT 02/06 GEDANGAN', 0, 0, 0),
(92, '02137', 'FERDIAN DWIPUTRA PANGESTU', 1, 3, 3, 'PONDOK JATI BLOK BU-02 SIDOARJO', 0, '1', 1, 'SUKABUMI', '0000-00-00', 'SURYANAH', 'BAMBANG MUJIONO', '081235778322', 1, 5, 'PONDOK JATI BLOK BU-02 SIDOARJO', 'PONDOK JATI BLOK BU-02 SIDOARJO', 0, 0, 0),
(93, '02138', 'FIRJATULLAH', 1, 3, 3, 'SIWALANKERTO TENGAH No.236 SURABAYA', 0, '1', 1, 'SURABAYA', '0000-00-00', 'PURWATININGSIH', 'HENDRA PRASETIA', '081330047569', 1, 9, 'SIWALANKERTO TENGAH No.236 SURABAYA', 'SIWALANKERTO TENGAH No.236 SURABAYA', 0, 0, 0),
(94, '02139', 'GILANG SETYA PUTRA PRATAMA', 1, 3, 3, 'DS. SIDOKEPUNG 14/03 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SULISTYOWATI', 'SUHARTO ', '08977337579', 1, 6, 'DS. SIDOKEPUNG 14/03 BUDURAN', 'DS. SIDOKEPUNG 14/03 BUDURAN', 0, 0, 0),
(95, '02140', 'IMELDA ARUM CAHYANI', 1, 3, 3, 'ENTAL SEWU 14/04 BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', '', 'DIDIK SUPRIYADI', '089534200000', 1, 6, 'ENTAL SEWU 14/04 BUDURAN', 'ENTAL SEWU 14/04 BUDURAN', 0, 0, 0),
(96, '02141', 'JULIANA ANGELINA', 1, 3, 3, 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 0, '2', 2, 'SURABAYA', '0000-00-00', 'SUTIAH', 'BUDI MARIJONO', '083876309454', 1, 6, 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 0, 0, 0),
(97, '02142', 'KYKA CLEODIO RIZQOLLAH ANDRIYANTO', 1, 3, 3, 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISKA MERINA ', 'LESKY NOVI DWI. A.', '085230606373', 1, 9, 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 0, 0, 0),
(98, '02143', 'M. RIZKY IMANUHAN', 1, 3, 3, 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'PUJI RAHAYU', 'TIRSAN', '081333080822', 1, 6, 'GAJAH MAGERSARI 16/05 SIDOARJO', 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, 0, 0),
(99, '02144', 'MAULIDA ALFANDA SARI', 1, 3, 3, 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 0, '2', 1, 'MALANG', '0000-00-00', 'BELADONA ENDAH RUMANTI S', 'SUHARYONO', '081334418477', 1, 6, 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 0, 0, 0),
(100, '02145', 'MOCH. DWI ANDIKA', 1, 3, 3, 'SIDOPURNO RT 18 RW 04', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YATIM SULISTYOWATI', 'MOCH. AMIRUL MUKMININ', '082337561095', 1, 9, 'SIDOPURNO RT 18 RW 04', 'SIDOPURNO RT 18 RW 04', 0, 0, 0),
(101, '02146', 'MOCHAMMAD ANDRE PRATAMA', 1, 3, 3, 'Jl. JAMBU 378 14/03 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'KOMARO', 'MOCH. ROCHIM', '082234062474', 1, 6, 'Jl. JAMBU 378 14/03 SIDOARJO', 'Jl. JAMBU 378 14/03 SIDOARJO', 0, 0, 0),
(102, '02147', 'MUCHAMMAD YOGI RAMADHANA', 1, 3, 3, 'SIDOKEPUNG 12/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'UMI KHASANAH', 'MUHAMMAD MUHAIMIN ', '081213916883', 1, 6, 'SIDOKEPUNG 12/03 BUDURAN', 'SIDOKEPUNG 12/03 BUDURAN', 0, 0, 0),
(103, '02148', 'MUHAMMAD ANNAS SHOLIKIN', 1, 3, 3, 'ENTALSEWU 11/03 BUDURAN', 0, '1', 1, 'PONOROGO', '0000-00-00', 'NAWIYAH', 'MUJIANTO', '085785642592', 1, 9, 'ENTALSEWU 11/03 BUDURAN', 'ENTALSEWU 11/03 BUDURAN', 0, 0, 0),
(104, '02149', 'MUHAMMAD NUR WAHYU ILLAHI', 1, 3, 3, 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI AMINAH', 'KUSWANTORO', '085257408847', 1, 9, 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(105, '02150', 'NADIA PUTRI ANDINI ', 1, 3, 3, 'KEBOAN ANOM RT 04/ RW 05', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'YULIANI', 'YADI SUPRIYONO', '', 1, 5, 'KEBOAN ANOM RT 04/ RW 05', 'KEBOAN ANOM RT 04/ RW 05', 0, 0, 0),
(106, '02151', 'NAUFAL EKA PRASETYA', 1, 3, 3, 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LILIK STYOWATI', 'BAMBANG SUPRAPTO', '082140462796', 1, 9, 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 0, 0, 0),
(107, '02152', 'NOVAL ERFENDI', 1, 3, 3, 'PERUM GRAND ROSE REGENCY BLOK C-34', 0, '1', 1, 'SURABAYA', '0000-00-00', 'ERNI WAHYUDI', 'AGUS EFFENDIK', '083849836308', 1, 6, 'PERUM GRAND ROSE REGENCY BLOK C-34', 'PERUM GRAND ROSE REGENCY BLOK C-34', 0, 0, 0),
(108, '02153', 'PRAMESWARI DEWI SEPTA ARUM', 1, 3, 3, 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 0, '2', 1, 'SURABAYA', '0000-00-00', 'DIAN KUMALA DEWI', 'EDY PURNOMO', '081331113986', 1, 6, 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 0, 0, 0),
(109, '02154', 'RAHMADITYA VIRMANSYAH', 1, 3, 3, 'KEBOAN SIKEP 06/03 GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YULI RUSTAMI', 'TEGUH SUBAGYO', '085730534449', 1, 9, 'KEBOAN SIKEP 06/03 GEDANGAN', 'KEBOAN SIKEP 06/03 GEDANGAN', 0, 0, 0),
(110, '02155', 'RAYNALD RAZANZA', 1, 3, 3, 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 0, '1', 1, 'BANDUNG', '0000-00-00', 'KIKI JAMILATUL FARIDAH', 'SUMARTONO', '0811277017', 1, 9, 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 0, 0, 0),
(111, '02156', 'REVA MAY ASANDI', 1, 3, 3, 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'ASISATUL YULIASIH', 'SUWANDI', '087851638531', 1, 9, 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 0, 0, 0),
(112, '02157', 'RIZQI ANDRIYAN NUR RAMADAN', 1, 3, 3, 'TEBEL TIMUR 06/06 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'PARNIATI', 'SUDIBYO', '085732457346', 1, 6, 'TEBEL TIMUR 06/06 GEDANGAN', 'TEBEL TIMUR 06/06 GEDANGAN', 0, 0, 0),
(113, '02158', 'SANIYYAH ARUN CLARINTA', 1, 3, 3, 'Jl. JAMBU 17/03 SRUNI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'TITIN SUHARTATIK', 'NUR AFFANDI', '085733733019', 1, 6, 'Jl. JAMBU 17/03 SRUNI', 'Jl. JAMBU 17/03 SRUNI', 0, 0, 0),
(114, '02159', 'SHERINATA IQSTI SOUDYAH', 1, 3, 3, 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'RETNO DYAH PRATIWI', 'JUNI IRWANTO', '083830656244', 1, 6, 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 0, 0, 0),
(115, '02160', 'SYAHREZA GIBRAN ARRAFI', 1, 3, 3, 'PURI TERATAI BLOK E-10', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MUJI ASTUTIK', 'SUNARSO', '085100995463', 1, 9, 'PURI TERATAI BLOK E-10', 'PURI TERATAI BLOK E-10', 0, 0, 0),
(116, '02161', 'WENDY OKTAVIANA PUTRI', 1, 3, 3, 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 0, '2', 1, 'PASURUAN', '0000-00-00', 'SUTIYAH', 'RATNAYUDI', '085335682208', 1, 5, 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 0, 0, 0),
(117, '02162', 'YOGI ASWA SAPUTRA', 1, 3, 3, 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 0, '1', 1, 'KEDIRI', '0000-00-00', 'SITI MASLIKAH', 'SUPRAPTO (ALM)', '082337492228', 1, 6, 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 0, 0, 0),
(118, '02163', 'ACHMAD DHYMAS VEBRYANTO', 1, 4, 3, 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'MISTIYAH', 'JUMADI', '', 1, 99, 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 0, 0, 0),
(119, '02164', 'ADITA MAULINA', 1, 4, 3, 'RANGKAH KIDUL 08/02 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'CHUSNUL FADILAH', 'ADI PURWANTO', '082231244291', 1, 6, 'RANGKAH KIDUL 08/02 SIDOARJO', 'RANGKAH KIDUL 08/02 SIDOARJO', 0, 0, 0),
(120, '02165', 'AHMAD FADHIL PURNAMA', 1, 4, 3, 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUPRAPTI', 'HADI DWIYONO EDY P', '081333684860', 1, 6, 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 0, 0, 0),
(121, '02166', 'ALDI RAMADHANI', 1, 4, 3, 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'PUDJI WIRANAWATI', 'SUPRIJADI', '083849601690', 1, 6, 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 0, 0, 0),
(122, '02167', 'ALVIRA RAHMADINA', 1, 4, 3, 'Jl. RADEN PATAH NO.109 SIDOARJO', 0, '2', 1, 'TULUNGAGUNG', '0000-00-00', 'WIHARTINI', 'ARIEF RAHCMAN', '085730559970', 1, 6, 'Jl. RADEN PATAH NO.109 SIDOARJO', 'Jl. RADEN PATAH NO.109 SIDOARJO', 0, 0, 0),
(123, '02168', 'ALYA RAMADHANI', 1, 4, 3, '0', 0, '2', 1, '', '0000-00-00', '', '', '', 1, 6, '', '', 0, 0, 0),
(124, '02169', 'ANANTA ALICIA INDIE', 1, 4, 3, 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 0, '2', 1, 'MALANG', '0000-00-00', 'INE SISWARINI', 'SUPRIYADI', '08123252147', 1, 6, 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 0, 0, 0),
(125, '02170', 'ANYA TIRANA DEWANTI MAYANANDA', 1, 4, 3, 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SULIKAH YUNIARTI', 'MOENDJARI', '08213128110', 1, 6, 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 0, 0, 0),
(126, '02171', 'AULIA PUTRI MAYORI', 1, 4, 3, 'PERUM GEBANG RAYA AG-14 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUMARTINI', 'IMAM BASORI', '081252305559', 1, 10, 'PERUM GEBANG RAYA AG-14 SIDOARJO', 'PERUM GEBANG RAYA AG-14 SIDOARJO', 0, 0, 0),
(127, '02172', 'BAYU MAULA ISTIGHFARI', 1, 4, 3, 'PERUM MAGERSARI PERMAI BLOK I-15', 0, '1', 1, 'SURABAYA', '0000-00-00', 'RETNO WULANDARI', 'ISROFIK SUGIANTO', '081235904400', 1, 6, 'PERUM MAGERSARI PERMAI BLOK I-15', 'PERUM MAGERSARI PERMAI BLOK I-15', 0, 0, 0),
(128, '02173', 'CINDY PUTRI AISYAH', 1, 4, 3, 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ERNAWATI PRIANTINI', 'SUHARSONO', '081331904039', 1, 6, 'GAJAH MAGERSARI 13/04 SIDOARJO', 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, 0, 0),
(129, '02174', 'DIMAS ADITYA ANANSYAH', 1, 4, 3, 'DSN KALAK 15/04 PAGERWOJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RATNAWATI', 'MUCH. SININ', '083854619929', 1, 6, 'DSN KALAK 15/04 PAGERWOJO', 'DSN KALAK 15/04 PAGERWOJO', 0, 0, 0),
(130, '02175', 'ERVINA NIRMALASARI', 1, 4, 3, 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ERDINA KALSUM', 'WINARNO', '082335181888', 1, 7, 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 0, 0, 0),
(131, '02176', 'FARHAN ZAHRIZAL', 1, 4, 3, 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 0, '1', 1, 'SURAKARTA', '0000-00-00', 'DWI WAHYUNI', 'ZAHRI SURYA', '081915309184', 1, 6, 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 0, 0, 0),
(132, '02177', 'FRISKA PUTRI MEILYASARI HANAFI', 1, 4, 3, 'PERUM JENGGOLO ASRI BLOK Q/7', 0, '2', 1, 'SURABAYA', '0000-00-00', 'FIROELLY NURIAH SOEBAGIO', 'MOCH. SYAIFUL HANAFI', '', 1, 6, 'PERUM JENGGOLO ASRI BLOK Q/7', 'PERUM JENGGOLO ASRI BLOK Q/7', 0, 0, 0),
(133, '02178', 'HARLITA PUTRI FATIKHA SARI', 1, 4, 3, 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'HARTATIK', 'HARIANTO', '081235624112', 1, 6, 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 0, 0, 0),
(134, '02179', 'IQBAL RAUL MU''IZUDDIN', 1, 4, 3, 'PENCANTINGAN 04/12 SEKARDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'IDA NURYANI', 'SETYO WIBOWO', '081231275700', 1, 9, 'PENCANTINGAN 04/12 SEKARDANGAN', 'PENCANTINGAN 04/12 SEKARDANGAN', 0, 0, 0),
(135, '02180', 'JUVENTINI INDAR PARAWANGSA', 1, 4, 3, 'GEDANGAN GG MERPATI 02/01 NO.27', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'WANTI SULIKAH', 'YEPI ASKARI', '085708074694', 1, 6, 'GEDANGAN GG MERPATI 02/01 NO.27', 'GEDANGAN GG MERPATI 02/01 NO.27', 0, 0, 0),
(136, '02181', 'LAURA BONITA', 1, 4, 3, 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'SOELASTRI', 'ARIA CAKRA WIBAWA', '081332236257', 1, 5, 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 0, 0, 0),
(137, '02182', 'MAHADHIKA SUKMANAWATI', 1, 4, 3, 'KOMPLEK TNI AL BIII/47 TEBEL ', 0, '1', 1, 'SURABAYA', '0000-00-00', 'SINTA WATI', 'SUKADI', '081330043094', 1, 5, 'KOMPLEK TNI AL BIII/47 TEBEL ', 'KOMPLEK TNI AL BIII/47 TEBEL ', 0, 0, 0),
(138, '02183', 'MAWAR MAUDI HIKMAH ALFIRA', 1, 4, 3, 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 0, '2', 1, 'KEDIRI', '0000-00-00', 'SRI ERNAWATI', 'IMRON MUAFENDI', '085859067891', 1, 6, 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 0, 0, 0),
(139, '02184', 'MOCH. FATUR ANGGA PRATAMA', 1, 4, 3, 'DUKUH TENGAH RT.04/01 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'KHOLIFATURROHMA', 'ISMAIL', '085733018709', 1, 6, 'DUKUH TENGAH RT.04/01 BUDURAN', 'DUKUH TENGAH RT.04/01 BUDURAN', 0, 0, 0),
(140, '02185', 'MOCHAMMAD FARHAN AZIZ', 1, 4, 3, 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RIFDA MAYLANA', 'EDHY BUDI JATMIKO', '081234300622', 1, 9, 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 0, 0, 0),
(141, '02186', 'MUH. WILDAN AKBAR', 1, 4, 3, 'SIDOKERTO 56 02/01 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'Ir. Rr. SRI RAHAYU RETNANINGSIH', 'Drs. MANSUR, M.Pd', '082143568103', 1, 13, 'SIDOKERTO 56 02/01 BUDURAN', 'SIDOKERTO 56 02/01 BUDURAN', 0, 0, 0),
(142, '02187', 'MUHAMMAD ATHA RASYID', 1, 4, 3, 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'DYLLA ARDYAHRINI', 'SUPRIYONO', '085645384964', 1, 5, 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 0, 0, 0),
(143, '02188', 'MUHAMMAD RAFFY DIAN HERMAWAN', 1, 4, 3, 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 0, '1', 1, 'BOJONEGORO', '0000-00-00', 'DWI ANITA', 'AGUS GATOT HERMAWAN', '081331507456', 1, 9, 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 0, 0, 0),
(144, '02189', 'NAILUL MAGHFIROH', 1, 4, 3, 'Jl. RANDU ASRI 09/03 PAGERWOJO', 0, '2', 1, 'GRESIK', '0000-00-00', 'SRI TUTIK', 'KHOTIB', '085105248462', 1, 9, 'Jl. RANDU ASRI 09/03 PAGERWOJO', 'Jl. RANDU ASRI 09/03 PAGERWOJO', 0, 0, 0),
(145, '02190', 'NAUFAL ERA SETYAWAN', 1, 4, 3, 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NIKMAH', 'GATOT DADIK HARTONO', '082231377562', 1, 6, 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 0, 0, 0),
(146, '02191', 'NOVITA FITRIANI', 1, 4, 3, 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUWARSI', 'SUPRIYADI', '082142528264', 1, 6, 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(147, '02192', 'PUTRI ELFRIDA NGESTIORINI', 1, 4, 3, 'PERUM BLURU PERMAI ED/17 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ROSIANA ARIYANI', 'TRI NURCAHYO', '082257478184', 1, 6, 'PERUM BLURU PERMAI ED/17 SIDOARJO', 'PERUM BLURU PERMAI ED/17 SIDOARJO', 0, 0, 0),
(148, '02193', 'RAMA ADITYA PUTRA WARDOYO', 1, 4, 3, 'JL. SONO INDAH BUDURAN SIDOARJO', 0, '1', 1, 'MOJOKERTO', '0000-00-00', 'RETNO SANTI UTAMI', 'MARDOYO', '082159813376', 1, 6, 'JL. SONO INDAH BUDURAN SIDOARJO', 'JL. SONO INDAH BUDURAN SIDOARJO', 0, 0, 0),
(149, '02194', 'REBECCA ALEXANDRA NAYARA', 1, 4, 3, 'PERUMDA JENGGOLO 1 BLOK E NO.7', 0, '2', 1, 'SURABAYA', '0000-00-00', 'ANGGUN MESSAYU RATNA CITRA', 'FATHUR ROCHAM ', '081230006065', 1, 6, 'PERUMDA JENGGOLO 1 BLOK E NO.7', 'PERUMDA JENGGOLO 1 BLOK E NO.7', 0, 0, 0),
(150, '02195', 'REVALINDRA HAWA WANANDRIYA', 1, 4, 3, 'PERUM BLURU PERMAI HX-20 SIDOARJO', 0, '2', 1, 'MAGETAN', '0000-00-00', 'HARIYATI', 'WAWAN HADI PRIYANTO', '085707182153', 1, 6, 'PERUM BLURU PERMAI HX-20 SIDOARJO', 'PERUM BLURU PERMAI HX-20 SIDOARJO', 0, 0, 0),
(151, '02196', 'RIZQINA NAZWA TIUR APRILIYA', 1, 4, 3, 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IKA APRILIYANTI', 'MUHAMAD MUFRODI', '085730027608', 1, 6, 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 0, 0, 0),
(152, '02197', 'SATRIA NANDA YULIANSYAH', 1, 4, 3, 'KWADENGAN 02/01 LEMAHPUTRO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'BINTI ALKANA SARI', 'KARIADI', '081332069354', 1, 9, 'KWADENGAN 02/01 LEMAHPUTRO', 'KWADENGAN 02/01 LEMAHPUTRO', 0, 0, 0),
(153, '02198', 'SHEVA RIZQ ATHALLAH', 1, 4, 3, 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SRI HARYATI', 'KHALIMI', '085648585513', 1, 6, 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 0, 0, 0),
(154, '02199', 'TIGRIS WIRYA NANDITA', 1, 4, 3, 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 0, '1', 1, 'MADIUN', '0000-00-00', 'SUSIYAM', 'MARIKA LISTYA', '085231861758', 1, 9, 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 0, 0, 0),
(155, '02200', 'WILDAN MAULANA ISHOM PUTRA', 1, 4, 3, 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NUR KUSUMA DEWI', 'RENY I''TISHOM', '08121644432', 1, 9, 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 0, 0, 0),
(156, '02201', 'ZUHAY LAILATUS SARIFAH', 1, 4, 3, 'KLOPO SEPULUH 05/01 SUKODONO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'LAILATUL QODRIYAH', 'ULIL AMROZIK', '082233743699', 1, 6, 'KLOPO SEPULUH 05/01 SUKODONO', 'KLOPO SEPULUH 05/01 SUKODONO', 0, 0, 0),
(157, '02202', 'ACHMAD FAIZ AFRIYANTO', 1, 5, 3, 'ANGGASWANGI 05/03', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SRI UTAMI', 'SYAIFUL HARIYANTO', '085850261142', 1, 6, 'ANGGASWANGI 05/03', 'ANGGASWANGI 05/03', 0, 0, 0),
(158, '02203', 'ADITYA ANANTA PUTRA SUHERMANTO', 1, 5, 3, 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'WIWIN MARDIANA', 'ONNY SUHERMANTO', '082245561567', 1, 6, 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 0, 0, 0),
(159, '02204', 'AHMAD HARDANI', 1, 5, 3, 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'HARTATIK', 'CHOIRIL ANWAR', '081216348585', 1, 9, 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 0, 0, 0),
(160, '02205', 'ALDY YONANDA', 1, 5, 3, 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YANI MARYANI', 'AGUS YULIANTO', '081703587897', 1, 6, 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 0, 0, 0),
(161, '02206', 'ALVIVATURROHMAH', 1, 5, 3, 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 0, '2', 1, 'MALANG', '0000-00-00', 'LISTINAWATI', 'ROBIL', '0', 1, 6, 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 0, 0, 0),
(162, '02207', 'ANDRI DWI CAHYONO', 1, 5, 3, 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YUTI PURBADINENGTIAS', 'SOFIONO', '081330620068', 1, 9, 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 0, 0, 0),
(163, '02208', 'ARDHYA RIZKY AYU PALUPI', 1, 5, 3, 'GADING FAJAR I A1/3 BUDURAN', 0, '2', 1, 'MALANG', '0000-00-00', 'RENNY SUS DANARYANTI', 'BASUKI SURYANDORO', '08999880001', 1, 9, 'GADING FAJAR I A1/3 BUDURAN', 'GADING FAJAR I A1/3 BUDURAN', 0, 0, 0),
(164, '02209', 'AULIA RISKA SALSABILA', 1, 5, 3, 'BULUSIDOKARE 03/01 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ELIYAH ROMZAH', 'BAMBANG HENDRO WIKIYONO', '085649416519', 1, 5, 'BULUSIDOKARE 03/01 SIDOARJO', 'BULUSIDOKARE 03/01 SIDOARJO', 0, 0, 0),
(165, '02210', 'BAGAS FIRMAN AGFANSYAH', 1, 5, 3, 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 0, '1', 1, 'JEMBER', '0000-00-00', 'NANIK IKE YULIANTI', 'YUDI AMIARTO', '081331160983', 1, 9, 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 0, 0, 0),
(166, '02211', 'BETRAND ZICO LUCKYANTO', 1, 5, 3, 'GADING KIRANA ESTATE BLOK L/10', 0, '1', 1, 'JAKARTA', '0000-00-00', 'NURHAYATI', 'YUNUS RENGGANA', '081298275500', 1, 6, 'GADING KIRANA ESTATE BLOK L/10', 'GADING KIRANA ESTATE BLOK L/10', 0, 0, 0),
(167, '02212', 'CINTA ANGELITA ANASTASYA PUTRI', 1, 5, 3, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, '2', 2, 'SIDOARJO', '0000-00-00', 'CHAYYUL KOYYUM', 'ARI TRI SUSANTO', '081234420389', 1, 9, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, 0, 0),
(168, '02213', 'DIVA LAPIRSA AYU NAYLA', 1, 5, 3, 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'NOVA DIANA SARI, S.Pd', 'BUDI SETIONO, SH', '082234104199', 1, 99, 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 0, 0, 0),
(169, '02214', 'ESA ALLIANT', 1, 5, 3, 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'BOJONEGORO', '0000-00-00', 'SITI KHOLIPAH', 'AGUS SUPRIANTO', '085748115681', 1, 12, 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(170, '02215', 'FATHUR RACHMAN HAKIM', 1, 5, 3, 'Ds. MLATEN 26/06 SIDOKEPUNG', 0, '1', 1, 'BANYUWANGI', '0000-00-00', 'RUKIATI', 'SUGIONO', '082115854800', 1, 6, 'Ds. MLATEN 26/06 SIDOKEPUNG', 'Ds. MLATEN 26/06 SIDOKEPUNG', 0, 0, 0),
(171, '02216', 'GABRIEL FEBRIAN ARYA WIDODIK', 1, 5, 3, 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 0, '1', 3, 'SIDOARJO', '0000-00-00', 'IRENE CATUR RINI WIDYA R', 'V. SONY WIDODIK', '083830083676', 1, 6, 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 0, 0, 0),
(172, '02217', 'HERY INDRAWAN', 1, 5, 3, 'TEBEL TIMUR 02/07 GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUMINI', 'ACH. NUR MUSA (Alm)', '085230769889', 1, 6, 'TEBEL TIMUR 02/07 GEDANGAN', 'TEBEL TIMUR 02/07 GEDANGAN', 0, 0, 0),
(173, '02218', 'ISMI RAHMAWATI PASHA SANJAYA', 1, 5, 3, 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NILA SETYA WATI', 'ROMI DHIMAS SANJAYA', '081230753022', 1, 6, 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 0, 0, 0),
(174, '02219', 'KAMILIYA RUVIANTI', 1, 5, 3, 'Jl. RAYA PECANTINGAN SEKARDANGAN', 0, '2', 1, 'SURABAYA', '0000-00-00', 'YUVI SANTIKO', 'RUSDIYANTO', '082281808376', 1, 5, 'Jl. RAYA PECANTINGAN SEKARDANGAN', 'Jl. RAYA PECANTINGAN SEKARDANGAN', 0, 0, 0),
(175, '02220', 'LENY CAHYA NINGTIAS', 1, 5, 3, 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'LULUK STIALIS STIANINGSIH', 'SUJIONO', '081234425117', 1, 9, 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 0, 0, 0),
(176, '02221', 'MARCHEL STEVE FERNANDO SONDANG', 1, 5, 3, 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 0, '1', 2, 'SIDOARJO', '0000-00-00', 'BUDI SRI WINARSIH', 'JUNIMUS SONDANG', '082330852133', 1, 5, 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 0, 0, 0),
(177, '02222', 'MAYZENDHY PUTRA ARINDA', 1, 5, 3, 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RINDAYANI', 'AGUNG SETIYO HARIONO', '087702881280', 1, 6, 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 0, 0, 0),
(178, '02223', 'MOCH. RISKY DIAN FERDIANSYAH', 1, 5, 3, 'Jl. JENGGOLO III 13/03 PUCANG', 0, '1', 1, 'LAMONGAN', '0000-00-00', 'UMI HANIK', 'SUTAJI', '089667833245', 1, 9, 'Jl. JENGGOLO III 13/03 PUCANG', 'Jl. JENGGOLO III 13/03 PUCANG', 0, 0, 0),
(179, '02224', 'MOHAMMAD AFANDI', 1, 5, 3, 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI WELAS ATI', 'TASMUN', '082132262142', 1, 6, 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 0, 0, 0),
(180, '02225', 'MUHAMMAD ADITYA ROMADHON', 1, 5, 3, 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'PARYANTI', 'HERU PITONO', '081330566680', 1, 9, 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 0, 0, 0),
(181, '02226', 'MUHAMMAD BRILLIAN FERDIYANSAH', 1, 5, 3, 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 0, '1', 1, 'JOMBANG', '0000-00-00', 'NURHANI MULYATI', 'USMAN', '081330766101', 1, 6, 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 0, 0, 0),
(182, '02227', 'MUHAMMAD RISKY ARIYANTO PUTRA', 1, 5, 3, 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SOEHARTININGTYAS', 'INDRIJANTO', '083854453510', 1, 6, 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 0, 0, 0),
(183, '02228', 'NABILAH ARDELIA ARIANTO', 1, 5, 3, 'PAGERWOJO 15/04 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'RISALATUN NISA', 'NANANG ARIANTO', '081216537778', 1, 6, 'PAGERWOJO 15/04 BUDURAN', 'PAGERWOJO 15/04 BUDURAN', 0, 0, 0);
INSERT INTO `student_siswa` (`siswa_id`, `nim`, `nama`, `prodi_id`, `kelas_id`, `angkatan_id`, `alamat`, `semester`, `gender`, `agama_id`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `no_hp_ortu`, `pekerjaan_id_ibu`, `pekerjaan_id_ayah`, `alamat_ayah`, `alamat_ibu`, `penghasilan_ayah`, `penghasilan_ibu`, `semester_aktif`) VALUES
(184, '02229', 'NAYLA KIRANA MAHESWARI', 1, 5, 3, 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 0, '2', 1, 'MALANG', '0000-00-00', 'FEBRIANA SETIA MAHARANI', 'DADONG WAHYU PURNOMO', '081330607077', 1, 6, 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 0, 0, 0),
(185, '02230', 'NUR AZIZAH', 1, 5, 3, 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'INDRIANI', 'NANANG KOSIM', '085234395169', 1, 6, 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 0, 0, 0),
(186, '02231', 'PUTRI PUSPITA ILLIYIL', 1, 5, 3, 'BANJARKEMANTREN 10/02 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'YAYUK SULISWARI', 'TONI SETIAWAN (Alm)', '', 1, 6, 'BANJARKEMANTREN 10/02 BUDURAN', 'BANJARKEMANTREN 10/02 BUDURAN', 0, 0, 0),
(187, '02232', 'RAMA DINATA PHINASTIKA', 1, 5, 3, 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUSNAENI', 'DIDIK SUDARSONO', '085102760466', 1, 6, 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 0, 0, 0),
(188, '02233', 'REFINA EKA SAPUTRI', 1, 5, 3, 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IDA INDAYATI', 'IWAN SEPARTU', '085732093155', 1, 6, 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 0, 0, 0),
(189, '02234', 'REZA CHOIRUDIN DIVASYA', 1, 5, 3, 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI MUARIFAH', 'SUGENG BUDI HARIJOTO', '081216811137', 1, 5, 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 0, 0, 0),
(190, '02235', 'ROINALDO', 1, 5, 3, 'ENTALSEWU 10/03 BUDURAN', 0, '1', 1, 'TUBAN', '0000-00-00', 'SULASTRI', 'PURWANTO', '089534056633', 1, 11, 'ENTALSEWU 10/03 BUDURAN', 'ENTALSEWU 10/03 BUDURAN', 0, 0, 0),
(191, '02236', 'SATRIO ADITYA SAPUTRA', 1, 5, 3, 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUMIATIN', 'MANGUN', '', 1, 9, 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(192, '02237', 'SILFIA AINUR ROCHMA', 1, 5, 3, 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUSI TRI RACHMAWATI', 'MOCH. KHOTIM DL GHOZI', '081246403885', 1, 7, 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 0, 0, 0),
(193, '02238', 'TIARA VANEZA ANGELINA', 1, 5, 3, 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ANIK WIJAYA WARAS', 'HENDRA L', '081357805190', 1, 6, 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(194, '02239', 'YUDARSONO', 1, 5, 3, 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 0, '1', 1, 'NGAWI', '0000-00-00', 'SUPITRIANI', 'SIPITUNG', '081216348319', 1, 9, 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 0, 0, 0),
(195, '02240', 'ZULFIKA NAULA SHAFA', 1, 5, 3, 'Jl. ERLANGGA 18/06 CELEP', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'MAZRO''ATUL ILMIYAH', 'ABDUL ADHIM', '087854023300', 1, 9, 'Jl. ERLANGGA 18/06 CELEP', 'Jl. ERLANGGA 18/06 CELEP', 0, 0, 0),
(196, '03000', 'BELLA SEPTYA PUTRI YAHYA', 1, 5, 3, 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SRI RAHAYU', '-', '-', 1, 6, 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 0, 0, 0),
(197, '02241', 'ACHMAD MAULANA RASYID', 1, 6, 3, 'Jl. PEPELEGI INDAH BLOK A/13 WARU', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'LASTARININGSIH', 'ANDIE RUSTANTO', '081331140904', 1, 6, 'Jl. PEPELEGI INDAH BLOK A/13 WARU', 'Jl. PEPELEGI INDAH BLOK A/13 WARU', 0, 0, 0),
(198, '02242', 'ADITYA NOVAL PRATAMA', 1, 6, 3, 'PERUM GRAHA KUNCARA C18 RT.12 RW.04, KEMIRI-BUDURAN', 0, '1', 1, 'TUBAN', '0000-00-00', 'NUR HASANAH', 'SUPRAYITNO', '089653387621', 1, 9, 'PERUM GRAHA KUNCARA C18 RT.12 RW.04, KEMIRI-BUDURAN', 'PERUM GRAHA KUNCARA C18 RT.12 RW.04, KEMIRI-BUDURAN', 0, 0, 0),
(199, '02243', 'AHMAD SEPTIYAN SAPUTRA', 1, 6, 3, 'SRUNI JL.MANGGA RT.03/01 GEDANGAN-SIDOARJO', 0, '1', 1, 'BLORA', '0000-00-00', 'PASRI', 'ZAINUDIN', '081332251562', 1, 6, 'SRUNI JL.MANGGA RT.03/01 GEDANGAN-SIDOARJO', 'SRUNI JL.MANGGA RT.03/01 GEDANGAN-SIDOARJO', 0, 0, 0),
(200, '02244', 'ALEXANDER DICKO ONASIS', 1, 6, 3, 'PERUM MUTIARA CITRA ASRI P1-05 ', 0, '1', 3, 'SURABAYA', '0000-00-00', 'PATRICIA DINA NATUWESSY', 'ONASIS RUDY WIJAYA', '089538444485', 1, 6, 'PERUM MUTIARA CITRA ASRI P1-05 ', 'PERUM MUTIARA CITRA ASRI P1-05 ', 0, 0, 0),
(201, '02245', 'AMANDA RAFINA MODESTY', 1, 6, 3, 'PERUM BCF Jl.SEKAWAN MOLEK J.B-29', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'CHOLIFAH UMRO', 'YUSUF RONI', '085231628888', 1, 6, 'PERUM BCF Jl.SEKAWAN MOLEK J.B-29', 'PERUM BCF Jl.SEKAWAN MOLEK J.B-29', 0, 0, 0),
(202, '02246', 'ANDRYATAMA RAMADHANI SUGIANTO', 1, 6, 3, 'KEBOAN SIKEP 06/03 GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'DAMI HARIYATI', 'SUGIANTO', '082330273503', 1, 6, 'KEBOAN SIKEP 06/03 GEDANGAN', 'KEBOAN SIKEP 06/03 GEDANGAN', 0, 0, 0),
(203, '02247', 'ARDI RAMADHANI', 1, 6, 3, 'PERUM PURI SEJAHTERA BLOK T3 NO.28 RT.32 RW.04 JUMPUT REJO SUKODONO-SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NUR HAYATI', 'ISMAIL', '081553011161', 1, 6, 'PERUM PURI SEJAHTERA BLOK T3 NO.28 RT.32 RW.04 JUMPUT REJO SUKODONO-SIDOARJO', 'PERUM PURI SEJAHTERA BLOK T3 NO.28 RT.32 RW.04 JUMPUT REJO SUKODONO-SIDOARJO', 0, 0, 0),
(204, '02248', 'AVIF WILDAN CAHYO', 1, 6, 3, 'PERUM BLURU PERMAI BLOK-CD 11 RT.03 RW.10 BLURU KIDUL SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'MARIYAMA', 'AKHMAD MARZUKI', '081216781329', 1, 6, 'PERUM BLURU PERMAI BLOK-CD 11 RT.03 RW.10 BLURU KIDUL SIDOARJO', 'PERUM BLURU PERMAI BLOK-CD 11 RT.03 RW.10 BLURU KIDUL SIDOARJO', 0, 0, 0),
(205, '02249', 'BILKIS PANDORA SALSABILA', 1, 6, 3, 'PERI TERATAI BLOK JA-32 05/08 SIDOARJO', 0, '2', 1, 'PASURUAN', '0000-00-00', 'YULI ISMAWATI', 'AGUS NOVENDRAYANTO', '081230064050', 1, 6, 'PERI TERATAI BLOK JA-32 05/08 SIDOARJO', 'PERI TERATAI BLOK JA-32 05/08 SIDOARJO', 0, 0, 0),
(206, '02250', 'DANIEL NOVLAND', 1, 6, 3, 'DIAN REGENCY SUKODONO ANUGERAH III/25 RT.63 RW.14 KEBON AGUNG, SUKODONO-SIDOARJO', 0, '1', 2, 'SIDOARJO', '0000-00-00', 'DHIMAS DESTYA UTAMININGTYAS', 'DJOKO NOFTANTO', '031-99036363', 1, 9, 'DIAN REGENCY SUKODONO ANUGERAH III/25 RT.63 RW.14 KEBON AGUNG, SUKODONO-SIDOARJO', 'DIAN REGENCY SUKODONO ANUGERAH III/25 RT.63 RW.14 KEBON AGUNG, SUKODONO-SIDOARJO', 0, 0, 0),
(207, '02251', 'DWI CHANDRA ARDI SYAHPUTRA', 1, 6, 3, 'Jl. JENGGOLO 3 NO.63 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'BIBIT SUPRIATIN', 'NUR ARBA''A YUSRON', '081235117555', 1, 6, 'Jl. JENGGOLO 3 NO.63 SIDOARJO', 'Jl. JENGGOLO 3 NO.63 SIDOARJO', 0, 0, 0),
(208, '02252', 'EVERT NATHAN DE''FLEA', 1, 6, 3, 'PONDOK JATI 2 BLOK-AT RT.31 RW.07 PAGERWOJO BUDURAN-SIDOARJO', 0, '1', 2, 'SIDOARJO', '0000-00-00', 'CRISTY KARNADI', 'BAGUS PAMUNGKAS', '081290307880', 1, 9, 'PONDOK JATI 2 BLOK-AT RT.31 RW.07 PAGERWOJO BUDURAN-SIDOARJO', 'PONDOK JATI 2 BLOK-AT RT.31 RW.07 PAGERWOJO BUDURAN-SIDOARJO', 0, 0, 0),
(209, '02253', 'FAWASS AYDHIN HILMY RAFFA', 1, 6, 3, 'PERUM JADE VILLE SIDOKEPUNG, BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'ENY SULISTYOWATI', 'ALIM SUDARMANTO', '082330735375', 1, 6, 'PERUM JADE VILLE SIDOKEPUNG, BUDURAN-SIDOARJO', 'PERUM JADE VILLE SIDOKEPUNG, BUDURAN-SIDOARJO', 0, 0, 0),
(210, '02254', 'GALIH SATRIA DHARMAWAN', 1, 6, 3, 'PERUM CITRA SURYA MAS BLOK G/20 RT.39 RW.10 JUMPUTREJO SUKODONO', 0, '1', 1, 'BOJONEGORO', '0000-00-00', 'MYLINA SARI DEWI', 'BUDI HARTADI', '081141614810', 1, 6, 'PERUM CITRA SURYA MAS BLOK G/20 RT.39 RW.10 JUMPUTREJO SUKODONO', 'PERUM CITRA SURYA MAS BLOK G/20 RT.39 RW.10 JUMPUTREJO SUKODONO', 0, 0, 0),
(211, '02255', 'HILWA RAISA SOCHEH', 1, 6, 3, 'KUPANG KIDUL 01/04 JABON', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IIN ZAINAH AUDAH', 'SOCHEH CHUSNAN ', '081234534975', 1, 6, 'KUPANG KIDUL 01/04 JABON', 'KUPANG KIDUL 01/04 JABON', 0, 0, 0),
(212, '02256', 'JAQLYN ANGELICA TANIA', 1, 6, 3, 'KAHURIPAN NIRWANA AA1-3A 10 RT.01/10 JATI SIDOARJO', 0, '2', 2, 'SIDOARJO', '0000-00-00', 'SULASTRI', 'KASIYANTO', '081944994403', 1, 6, 'KAHURIPAN NIRWANA AA1-3A 10 RT.01/10 JATI SIDOARJO', 'KAHURIPAN NIRWANA AA1-3A 10 RT.01/10 JATI SIDOARJO', 0, 0, 0),
(213, '02257', 'KARTIKA DEWI MASITHA', 1, 6, 3, 'KEMIRI RT.02 RW.01 DS KEMIRI-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'MENTIK DWI ASTUTIK', 'DYAN SIGIT HINDRIYONO', '081703048404', 1, 6, 'KEMIRI RT.02 RW.01 DS KEMIRI-SIDOARJO', 'KEMIRI RT.02 RW.01 DS KEMIRI-SIDOARJO', 0, 0, 0),
(214, '02258', 'LUH PUTU RESTIANA WULANDARI', 1, 6, 3, 'Jl. BALAI DESA GG V NO.40 01/02 TEBEL BARAT', 0, '2', 5, 'SIDOARJO', '0000-00-00', 'DESAK NYOMAN PRIMAYANTI', 'I NYOMAN BUDI WIJANA', '081230812579', 1, 6, 'Jl. BALAI DESA GG V NO.40 01/02 TEBEL BARAT', 'Jl. BALAI DESA GG V NO.40 01/02 TEBEL BARAT', 0, 0, 0),
(215, '02259', 'MARIA DWI SUCIATI', 1, 6, 3, 'SLAUTAN 16/03 NO.27 SIDOKUMPUL ', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'HERNI RIWAYATI', 'SUPRIYANTO', '081216253893', 1, 6, 'SLAUTAN 16/03 NO.27 SIDOKUMPUL ', 'SLAUTAN 16/03 NO.27 SIDOKUMPUL ', 0, 0, 0),
(216, '02260', 'MICHELLIA IKA ANGGREANI', 1, 6, 3, 'PERUM GADING KIRANA ESTATE D12A', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'YUNI KRISTIANI', 'ACHMAD YANI', '089699254857', 1, 6, 'PERUM GADING KIRANA ESTATE D12A', 'PERUM GADING KIRANA ESTATE D12A', 0, 0, 0),
(217, '02261', 'MOCH. YANUAR', 1, 6, 3, 'BANJAR KEMANTREN RT/07/02 JAMBE BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI FAT''AH', 'MOCH. IMRON', '081216514733', 1, 66, 'BANJAR KEMANTREN RT/07/02 JAMBE BUDURAN', 'BANJAR KEMANTREN RT/07/02 JAMBE BUDURAN', 0, 0, 0),
(218, '02262', 'MOHAMMAD FAISAL ARDIANSYAH', 1, 6, 3, 'KEMIRI 5/2 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'KHOIROTIN', 'MUSAFAK', '085843463927', 1, 6, 'KEMIRI 5/2 SIDOARJO', 'KEMIRI 5/2 SIDOARJO', 0, 0, 0),
(219, '02263', 'MUHAMMAD AGUNG RIZKIANTO', 1, 6, 3, 'KARANGGAYAM GG PELABUHAN NO.11 17/04 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SHOLICHATUL MU''AWANAH', 'MULYONO', '081216595340', 1, 9, 'KARANGGAYAM GG PELABUHAN NO.11 17/04 SIDOARJO', 'KARANGGAYAM GG PELABUHAN NO.11 17/04 SIDOARJO', 0, 0, 0),
(220, '02264', 'MUHAMMAD FARHAN', 1, 6, 3, 'BLURU KIDUL 01/03 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'JAMINAH', 'MUJIONO', '081330728300', 1, 8, 'BLURU KIDUL 01/03 SIDOARJO', 'BLURU KIDUL 01/03 SIDOARJO', 0, 0, 0),
(221, '02265', 'MUHAMMAD SYARIPUDIN HIDAYATULLOH', 1, 6, 3, 'Jl. SENTANA GG V 10/05 TEBEL ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'ISRORI HINDUN', 'HERI SUBAGIYO', '081553957602', 1, 6, 'Jl. SENTANA GG V 10/05 TEBEL ', 'Jl. SENTANA GG V 10/05 TEBEL ', 0, 0, 0),
(222, '02266', 'NANDA DWI KUMARA', 1, 6, 3, 'PAGERWOJO 15/04 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'NURUL CHONISAH', 'DWI YUDIKARTO', '082281115711', 1, 6, 'PAGERWOJO 15/04 BUDURAN', 'PAGERWOJO 15/04 BUDURAN', 0, 0, 0),
(223, '02267', 'NILAM CAHYANI PUTRI SURYONO', 1, 6, 3, 'SUMBEREJO RT.13 RW.03 WONOAYU SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SRI WAHYUNI', 'JOKO SURYONO', '081217117544', 1, 5, 'SUMBEREJO RT.13 RW.03 WONOAYU SIDOARJO', 'SUMBEREJO RT.13 RW.03 WONOAYU SIDOARJO', 0, 0, 0),
(224, '02268', 'NUR GIGIH DI SURYA', 1, 6, 3, 'BANJARSARI 08/02 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YUNI MURTI ASTUTIK', 'NUR KOMARI', '082243854429', 1, 5, 'BANJARSARI 08/02 BUDURAN', 'BANJARSARI 08/02 BUDURAN', 0, 0, 0),
(225, '02269', 'RACHEL CICILIA PUTRI DWINOV', 1, 6, 3, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, '2', 2, 'SURABAYA', '0000-00-00', 'WORO NATALIA', 'ISWANTO', '081234420389', 1, 9, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, 0, 0),
(226, '02270', 'RANGGA DWI MARDIANSYAH', 1, 6, 3, 'PERUM MUTIARA RESIDENCE DI-21 RT.02 RW.09 ANGGASWANGI SUKODONO-SIDOARJO', 0, '1', 1, 'DENPASAR', '0000-00-00', 'RATNA KAMAN INDRA', 'AGUS SAIFUL ANAM', '08885261436', 1, 6, 'PERUM MUTIARA RESIDENCE DI-21 RT.02 RW.09 ANGGASWANGI SUKODONO-SIDOARJO', 'PERUM MUTIARA RESIDENCE DI-21 RT.02 RW.09 ANGGASWANGI SUKODONO-SIDOARJO', 0, 0, 0),
(227, '02271', 'REFRILDA DINI IVANTI', 1, 6, 3, 'PAGERWOJO 14/04 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ISTIAWATI', 'SUYANTO', '085785487673', 1, 6, 'PAGERWOJO 14/04 BUDURAN', 'PAGERWOJO 14/04 BUDURAN', 0, 0, 0),
(228, '02272', 'REZA RADITYA PRATAMA', 1, 6, 3, 'BUMI SUKO INDAH B3-12 ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'NENNY NURHAYATI', 'HERWANUDIN', '082231361583', 1, 6, 'BUMI SUKO INDAH B3-12 ', 'BUMI SUKO INDAH B3-12 ', 0, 0, 0),
(229, '02273', 'RYAN AFFANDI', 1, 6, 3, 'SIDOKEPUNG Rt 29 Rw 02 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'ASTUTIK', 'KUSNINDAR', '081235069576', 1, 9, 'SIDOKEPUNG Rt 29 Rw 02 BUDURAN', 'SIDOKEPUNG Rt 29 Rw 02 BUDURAN', 0, 0, 0),
(230, '02274', 'SAFIRA PUTERI FARILIA', 1, 6, 3, 'PERUM SURYA REGENCY 07/11', 0, '2', 1, 'SUMENEP', '0000-00-00', 'YULIA SARASWATI', 'YONO SAFARI', '085648642711', 1, 6, 'PERUM SURYA REGENCY 07/11', 'PERUM SURYA REGENCY 07/11', 0, 0, 0),
(231, '02275', 'SEKAR AYU ASMAUL KHUSNAH', 1, 6, 3, 'JL PAHLAWAN II 02/10 GEDANGAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'WIWIEN ASMAUL KHUSNAH', 'MOCHAMAD MOSLICH (ALM)', '08175179630', 1, 9, 'JL PAHLAWAN II 02/10 GEDANGAN', 'JL PAHLAWAN II 02/10 GEDANGAN', 0, 0, 0),
(232, '02276', 'TALITHA AUREL', 1, 6, 3, 'PURI SURYA JAYA SIDNEY GARDEN L9/05 RT.02 RW.07 PUNGGUL GEDANGAN SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'HENDRIYANI', 'ENDY AUGUST', '081331060083', 1, 6, 'PURI SURYA JAYA SIDNEY GARDEN L9/05 RT.02 RW.07 PUNGGUL GEDANGAN SIDOARJO', 'PURI SURYA JAYA SIDNEY GARDEN L9/05 RT.02 RW.07 PUNGGUL GEDANGAN SIDOARJO', 0, 0, 0),
(233, '02277', 'YANUAR TRI PRASETYA', 1, 6, 3, 'PERUM MAGERSARI BLOK.AO MAGERSARI-SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'HANAKATI', 'AGUS SUROSO', '085100945447', 1, 6, 'PERUM MAGERSARI BLOK.AO MAGERSARI-SIDOARJO', 'PERUM MAGERSARI BLOK.AO MAGERSARI-SIDOARJO', 0, 0, 0),
(234, '02278', 'ZAHRA SAFI RAMADHANI', 1, 6, 3, 'PERUM KARANG INDAH BLOK B NO.11 KARANGBONG, GEDANGAN-SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'MISNI PUJI ASTUTI', 'KHOIRUL HUDA', '082257080564', 1, 6, 'PERUM KARANG INDAH BLOK B NO.11 KARANGBONG, GEDANGAN-SIDOARJO', 'PERUM KARANG INDAH BLOK B NO.11 KARANGBONG, GEDANGAN-SIDOARJO', 0, 0, 0),
(235, '02279', 'ZULFIKAR AMROH', 1, 6, 3, 'KARANGBONG RT 03 RW 02', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'MU''ALLAFAH', 'BUDI ERMAWAN', '082244685594', 1, 6, 'KARANGBONG RT 03 RW 02', 'KARANGBONG RT 03 RW 02', 0, 0, 0),
(236, '02280', 'ADAM GASSYA JOEWORO', 1, 7, 3, 'TAMAN HEDONA REGENCY B2-2 14/06 PRASUNG BUDURAN', 0, '1', 1, 'MALANG', '0000-00-00', 'SITI CHOTIJAH MEGA L', 'JB SUSILO', '082245426344', 1, 9, 'TAMAN HEDONA REGENCY B2-2 14/06 PRASUNG BUDURAN', 'TAMAN HEDONA REGENCY B2-2 14/06 PRASUNG BUDURAN', 0, 0, 0),
(237, '02281', 'AFRIZA EKA RISKY FIRGIANSYAH', 1, 7, 3, 'SIWALANPANJI 13/04 BUDURAN', 0, '1', 1, 'SURABAYA', '0000-00-00', 'MAGHFIROTUN NASUKHA', 'BAMBANG SUGIANTO', '08155177015', 1, 6, 'SIWALANPANJI 13/04 BUDURAN', 'SIWALANPANJI 13/04 BUDURAN', 0, 0, 0),
(238, '02282', 'AHMAD ALDI FIRMANSYAH NASUTION', 1, 7, 3, 'PERUM GEBANG RAYA BLOK AF20 RT22 RW06', 0, '1', 1, 'DEPOK', '0000-00-00', 'LATIFAH', 'BISMAR NASUTION', '087851570243', 1, 6, 'PERUM GEBANG RAYA BLOK AF20 RT22 RW06', 'PERUM GEBANG RAYA BLOK AF20 RT22 RW06', 0, 0, 0),
(239, '02283', 'AHMAD WIRA BAGASKARA', 1, 7, 3, 'JL.JENGGOLO IV  NO.16 PUCANG-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'WINARNI', 'RYAN FADRIE', '085731222498', 1, 5, 'JL.JENGGOLO IV  NO.16 PUCANG-SIDOARJO', 'JL.JENGGOLO IV  NO.16 PUCANG-SIDOARJO', 0, 0, 0),
(240, '02284', 'ALFAN SHAHAL', 1, 7, 3, 'Jl. JENGGOLO 1 PUCANG', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'AMINAH', 'SABAR', '085733118502', 1, 6, 'Jl. JENGGOLO 1 PUCANG', 'Jl. JENGGOLO 1 PUCANG', 0, 0, 0),
(241, '02285', 'AMANDA SITI RAHMA', 1, 7, 3, 'SUKODONO DIAN REGENCY A-6 NO.22 KEBON AGUNG SUKODONO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'RR GIYANTI NURDRIYANINGTYAS', 'MUHAMMAD HAJAR SUBEKTI', '085816693422', 1, 6, 'SUKODONO DIAN REGENCY A-6 NO.22 KEBON AGUNG SUKODONO', 'SUKODONO DIAN REGENCY A-6 NO.22 KEBON AGUNG SUKODONO', 0, 0, 0),
(242, '02286', 'ANGELA APRILIA', 1, 7, 3, 'PERUM GRAHA KUNCARA BLOK F-30 KEMIRI', 0, '2', 2, 'SIDOARJO', '0000-00-00', 'MAY ISANA', 'SUGENG ICHWANTO', '085101490636', 1, 6, 'PERUM GRAHA KUNCARA BLOK F-30 KEMIRI', 'PERUM GRAHA KUNCARA BLOK F-30 KEMIRI', 0, 0, 0),
(243, '02287', 'ARDY PRAMUDYA SAPUTRA', 1, 7, 3, 'KLANGGRI 01/06 SIDOKERTO BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'TATIK SUGIYANTI', 'DIDIK SUGIANTO (Alm)', '082257255940', 1, 5, 'KLANGGRI 01/06 SIDOKERTO BUDURAN', 'KLANGGRI 01/06 SIDOKERTO BUDURAN', 0, 0, 0),
(244, '02288', 'ARVIANSYAH DWI PUTRA', 1, 7, 3, 'PERUM GRIYA PERSADA ASRI BLOK ME No.1 SIDODADI', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'ROSITA', 'PARVIDIA HADIANSYAH', '081357931675', 1, 6, 'PERUM GRIYA PERSADA ASRI BLOK ME No.1 SIDODADI', 'PERUM GRIYA PERSADA ASRI BLOK ME No.1 SIDODADI', 0, 0, 0),
(245, '02289', 'AVIRA DIAN NOVITA', 1, 7, 3, 'GAJAH MAGERSARI RT.20 RW.06 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'INDAH SUSANTI', 'FAQIANTO', '085706345773', 1, 6, 'GAJAH MAGERSARI RT.20 RW.06 SIDOARJO', 'GAJAH MAGERSARI RT.20 RW.06 SIDOARJO', 0, 0, 0),
(246, '02290', 'BINTANG AZZAHRA PUTRI SISWANTO', 1, 7, 3, 'WAHYU TAMAN SARIROGO AH/15 SUMPUT ', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'LAURETTA ARITONANG', 'HERI SISWANTO', '081217784448', 1, 6, 'WAHYU TAMAN SARIROGO AH/15 SUMPUT ', 'WAHYU TAMAN SARIROGO AH/15 SUMPUT ', 0, 0, 0),
(247, '02291', 'DECO ALNESAL RIZKY', 1, 7, 3, 'WISMA SARINADI J-15 RT.27/06 MAGERSARI-SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'FEBRILIANTI SATYANINGRUM', 'ARI KRISTANTO', '082245839779', 1, 6, 'WISMA SARINADI J-15 RT.27/06 MAGERSARI-SIDOARJO', 'WISMA SARINADI J-15 RT.27/06 MAGERSARI-SIDOARJO', 0, 0, 0),
(248, '02292', 'DENISA MAHARANI ', 1, 7, 3, 'PERUM PERMATA SIWALAN INDAH BLOK G2 NO.2 RT.26/6 SIWALANPANJI-BUDURAN', 0, '2', 1, 'SURABAYA', '0000-00-00', 'TITIK JUARIYAH', 'DENNY PRABOWO', '085233313696', 1, 6, 'PERUM PERMATA SIWALAN INDAH BLOK G2 NO.2 RT.26/6 SIWALANPANJI-BUDURAN', 'PERUM PERMATA SIWALAN INDAH BLOK G2 NO.2 RT.26/6 SIWALANPANJI-BUDURAN', 0, 0, 0),
(249, '02293', 'DIKA RISKY ARIPERMANA', 1, 7, 3, 'PERUM GRAHA KOTA BLOK A6 No.2 SDA', 0, '1', 1, 'SURABAYA', '0000-00-00', 'SANTI DWI ASTUTI', 'ARI MARTOPO', '081331719839', 1, 6, 'PERUM GRAHA KOTA BLOK A6 No.2 SDA', 'PERUM GRAHA KOTA BLOK A6 No.2 SDA', 0, 0, 0),
(250, '02294', 'DWI FARIDA BERLIANDA SAKTI', 1, 7, 3, 'PAGERWOJO 16/04 SIDOARJO', 0, '2', 1, 'KEDIRI', '0000-00-00', 'LUSIANI HABSOH', 'ARIEF JATMIKA SAKTI', '082337765558', 1, 6, 'PAGERWOJO 16/04 SIDOARJO', 'PAGERWOJO 16/04 SIDOARJO', 0, 0, 0),
(251, '02295', 'FAIRUZ ZATA AZIZAH', 1, 7, 3, 'PERMATA MEGAH ASRI F6 32/08 SIDOKEPUNG BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'EMELDA LESTARY', 'ACHMAD LUTFI', '085746491169', 1, 6, 'PERMATA MEGAH ASRI F6 32/08 SIDOKEPUNG BUDURAN', 'PERMATA MEGAH ASRI F6 32/08 SIDOKEPUNG BUDURAN', 0, 0, 0),
(252, '02296', 'FEBRIANSYAH PANGESTU HIDAYAT', 1, 7, 3, 'PERUM BLURU PERMAI BLOK CR 12', 0, '1', 1, 'SURABAYA', '0000-00-00', 'LILIK ARFIYANTI', 'R. SOEBALI', '085733880020', 1, 6, 'PERUM BLURU PERMAI BLOK CR 12', 'PERUM BLURU PERMAI BLOK CR 12', 0, 0, 0),
(253, '02297', 'GEMILANG DAMAR ISKANDAR', 1, 7, 3, 'BLURU PERMAI FH-12 RT12/11 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'WIWIK LESTARI', 'ERIS ISKANDAR', '081233653617', 1, 6, 'BLURU PERMAI FH-12 RT12/11 SIDOARJO', 'BLURU PERMAI FH-12 RT12/11 SIDOARJO', 0, 0, 0),
(254, '02298', 'HIKMA NURFITRIA PUTRI BYSMA', 1, 7, 3, 'Jl. MALIK IBRAHIM III/12 SIDOARJO', 0, '2', 1, 'BLITAR', '0000-00-00', 'SITI AMANAH', 'BENY SETIAWAN', '082257651189', 1, 6, 'Jl. MALIK IBRAHIM III/12 SIDOARJO', 'Jl. MALIK IBRAHIM III/12 SIDOARJO', 0, 0, 0),
(255, '02299', 'HULWA IFTINAN JANNAH', 1, 7, 3, 'Jl. KHR. ABBAS 2 KAVLING 04 25/01 SIWALANPANJI', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'GALUH UNSAH', 'OTO SUJATA', '081230508739', 1, 5, 'Jl. KHR. ABBAS 2 KAVLING 04 25/01 SIWALANPANJI', 'Jl. KHR. ABBAS 2 KAVLING 04 25/01 SIWALANPANJI', 0, 0, 0),
(256, '02300', 'JASMINE AIMY SHAAFFYA', 1, 7, 3, 'JL.WILAYUT RT.01/01 SUKODONO-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'TITIK AYUMI KANTI RAHAYU', 'IMAM MUNTOHA', '08123156775', 1, 6, 'JL.WILAYUT RT.01/01 SUKODONO-SIDOARJO', 'JL.WILAYUT RT.01/01 SUKODONO-SIDOARJO', 0, 0, 0),
(257, '02301', 'KEVIN WIDIANTORO WAHYU. S', 1, 7, 3, 'JL. TERUS SANBAT UTARA VA RT.06 RW.05 PANDAN WANGI BLIMBING, MALANG', 0, '1', 1, 'NGANJUK', '0000-00-00', 'SUTATIK', 'DARMUJI', '08123261856', 1, 9, 'JL. TERUS SANBAT UTARA VA RT.06 RW.05 PANDAN WANGI BLIMBING, MALANG', 'JL. TERUS SANBAT UTARA VA RT.06 RW.05 PANDAN WANGI BLIMBING, MALANG', 0, 0, 0),
(258, '02302', 'M. FAISAL ARIF MAULANA', 1, 7, 3, 'PRASUNG TANI RT.02 RW.04 BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'AMINATUL ZUHRIYA', 'GUNAWAN', '', 1, 6, 'PRASUNG TANI RT.02 RW.04 BUDURAN-SIDOARJO', 'PRASUNG TANI RT.02 RW.04 BUDURAN-SIDOARJO', 0, 0, 0),
(259, '02303', 'MAS AYU NURROKHMAH', 1, 7, 3, 'JL.BAGUS SANTRI NO.36 RT.04/02 BOHAR - TAMAN SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'MASRUROH', '-', '085854101837', 1, 8, 'JL.BAGUS SANTRI NO.36 RT.04/02 BOHAR - TAMAN SIDOARJO', 'JL.BAGUS SANTRI NO.36 RT.04/02 BOHAR - TAMAN SIDOARJO', 0, 0, 0),
(260, '02304', 'MIFTAKHUL ANGGITA CAHYANI', 1, 7, 3, 'SERUJO GG GAJAH 08/02 PUCANG ANOM ', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IDA ROYANI', 'DWI CAHYONO', '', 1, 9, 'SERUJO GG GAJAH 08/02 PUCANG ANOM ', 'SERUJO GG GAJAH 08/02 PUCANG ANOM ', 0, 0, 0),
(261, '02305', 'MOCHAMAD NAUFAL AFANDI', 1, 7, 3, 'SIDOKEPUNG 08/01 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUPIYAH', 'SUNARYO', '081234170234', 1, 6, 'SIDOKEPUNG 08/01 BUDURAN', 'SIDOKEPUNG 08/01 BUDURAN', 0, 0, 0),
(262, '02306', 'MOCHAMMAD RIZAL ARIFIANTO', 1, 7, 3, 'MAGERSARI Rt 19 Rw 06 SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SULIS TRIANI', 'MONO IDAYANTO', '082143835535', 1, 6, 'MAGERSARI Rt 19 Rw 06 SIDOARJO', 'MAGERSARI Rt 19 Rw 06 SIDOARJO', 0, 0, 0),
(263, '02307', 'MUSA MURTADHO SJAM', 1, 7, 3, 'PERUM GADING FAJAR BLOK A1/10', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NURTINA ADAM', 'SJAMSUL HILAL', '082245555417', 1, 6, 'PERUM GADING FAJAR BLOK A1/10', 'PERUM GADING FAJAR BLOK A1/10', 0, 0, 0),
(264, '02308', 'PANDEGA SYAHPUTRA FITRIANTO', 1, 7, 3, 'GRAHA REGENCY BLOK B20 SDA', 0, '1', 1, 'KEDIRI', '0000-00-00', 'BQ. LISA SURYANINGSIH', 'GAGUK FITRIANTO, ST', '082233888458', 1, 9, 'GRAHA REGENCY BLOK B20 SDA', 'GRAHA REGENCY BLOK B20 SDA', 0, 0, 0),
(265, '02309', 'RAHMAT AINUL BASIR', 1, 7, 3, 'PAGERWOJO RT.23/06 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI MUYASAROH', 'PONIMAN', '082230948084', 1, 10, 'PAGERWOJO RT.23/06 BUDURAN', 'PAGERWOJO RT.23/06 BUDURAN', 0, 0, 0),
(266, '02310', 'RANGGA EKO PRABOWO YUWONO', 1, 7, 3, 'Jl. RAYA GEDANGAN GG CENDRAWASIH Rt 01 Rw 01', 0, '1', 1, 'BLITAR', '0000-00-00', 'DEWI LARASATI', 'SUJARWOTO', '083854320917', 1, 6, 'Jl. RAYA GEDANGAN GG CENDRAWASIH Rt 01 Rw 01', 'Jl. RAYA GEDANGAN GG CENDRAWASIH Rt 01 Rw 01', 0, 0, 0),
(267, '02311', 'REVANDHO NICO SURYA NATHA', 1, 7, 3, 'PERUM SURYA ASRI A/816 SIDOARJO', 0, '1', 1, 'MADIUN', '0000-00-00', 'KASMIATI', 'SWAKA HARI MURTI', '081332006120', 1, 6, 'PERUM SURYA ASRI A/816 SIDOARJO', 'PERUM SURYA ASRI A/816 SIDOARJO', 0, 0, 0),
(268, '02312', 'SINTA WIDIGDA ERNAWA', 1, 7, 3, 'JL. GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'MISRATIN', 'DWI SUGENG SUPRIYADI', '082332528763', 1, 6, 'JL. GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 'JL. GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, 0, 0),
(269, '02313', 'VICO MAHAPRANA WICAKSONO', 1, 7, 3, 'JL. RANGKAH KIDUL NO.21 RT.10/02 RANGKAH KIDUL - SIDOARJO', 0, '1', 1, 'KEDIRI', '0000-00-00', 'NUR VITRI HANDAYANI', 'DJOKO WITJAKSONO', '0+811343140', 1, 6, 'JL. RANGKAH KIDUL NO.21 RT.10/02 RANGKAH KIDUL - SIDOARJO', 'JL. RANGKAH KIDUL NO.21 RT.10/02 RANGKAH KIDUL - SIDOARJO', 0, 0, 0),
(270, '02314', 'WINA DWI AGUSTINA RAHAYU', 1, 7, 3, 'PAGERWOJO RT.23/06 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'WIJI INDAYATI', 'HARNAJI', '082141135599', 1, 6, 'PAGERWOJO RT.23/06 BUDURAN', 'PAGERWOJO RT.23/06 BUDURAN', 0, 0, 0),
(271, '02315', 'WURIDITIYA KHAESA HARDONO', 1, 7, 3, 'Jl . BALAI DESA SELATAN IV/04 Rt 11 Rw 04 BUDURAN', 0, '2', 1, 'JAKARTA', '0000-00-00', 'SUMIATI', 'TRI HARDONO', '081230371765', 1, 5, 'Jl . BALAI DESA SELATAN IV/04 Rt 11 Rw 04 BUDURAN', 'Jl . BALAI DESA SELATAN IV/04 Rt 11 Rw 04 BUDURAN', 0, 0, 0),
(272, '02316', 'YOGI KURNIAWAN', 1, 7, 3, 'GRIYA PERMATA GEDANGAN BLOK I 1 NO.12A RT.01 RW.07 KEBOAN SIKEP GEDANGAN -SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'ENDAH PURWATI', 'WITONO WAHYUDI, SH', '08123184127', 1, 7, 'GRIYA PERMATA GEDANGAN BLOK I 1 NO.12A RT.01 RW.07 KEBOAN SIKEP GEDANGAN -SIDOARJO', 'GRIYA PERMATA GEDANGAN BLOK I 1 NO.12A RT.01 RW.07 KEBOAN SIKEP GEDANGAN -SIDOARJO', 0, 0, 0),
(273, '02317', 'ZAINY FITRIA SALAFIYAH', 1, 7, 3, 'PERUM TAS II BLOK R8/9 TANGGULANGIN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'CHOIRUL AMALIYAH', 'KUNTJORO PURBO HARIJANTO', '0811309690', 1, 6, 'PERUM TAS II BLOK R8/9 TANGGULANGIN', 'PERUM TAS II BLOK R8/9 TANGGULANGIN', 0, 0, 0),
(274, '02318', 'ZAKY ALIF SYAMMAKH', 1, 7, 3, 'PERUM PESONA PERMATA GADING I B-19 RT.01 RW.15 BLURU KIDUL-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SULISTIYOWATI', 'DJOKO PORNOMO', '085731668341', 1, 6, 'PERUM PESONA PERMATA GADING I B-19 RT.01 RW.15 BLURU KIDUL-SIDOARJO', 'PERUM PESONA PERMATA GADING I B-19 RT.01 RW.15 BLURU KIDUL-SIDOARJO', 0, 0, 0),
(275, '02319', 'MAHDIYAH NUR FAUZIYYAH', 1, 7, 3, 'PERUM PESONA PERMATA GADING II RR-1 BLURU KIDUL', 0, '2', 1, 'TANGERANG', '0000-00-00', 'KUSIMAH', 'SURIJADI', '081232100373', 1, 6, 'PERUM PESONA PERMATA GADING II RR-1 BLURU KIDUL', 'PERUM PESONA PERMATA GADING II RR-1 BLURU KIDUL', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE IF NOT EXISTS `submenu` (
`id_submenu` int(11) NOT NULL,
  `id_mainmenu` int(11) NOT NULL,
  `nama_submenu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `aktif` enum('y','t') NOT NULL,
  `icon` varchar(30) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id_submenu`, `id_mainmenu`, `nama_submenu`, `link`, `aktif`, `icon`, `level`) VALUES
(10, 26, 'siswa', 'siswa', 'y', 'fa fa-group', 1),
(20, 26, 'jenis pembayaran', 'jenisbayar', 'y', 'fa fa-puzzle-piece', 1),
(21, 26, 'biaya sekolah', 'setupbiaya', 'y', 'fa fa-money', 1),
(79, 29, 'form pembayaran', 'keuangan/pembayaran', 'y', 'fa fa-coins', 1),
(89, 26, 'tahun angkatan', 'tahunangkatan', 'y', 'fa fa-calendar', 1),
(91, 41, 'form pembayaran', 'keuangan/pembayaran', 'y', 'fa fa-coins', 2),
(92, 41, 'laporan keuangan', 'keuangan/laporan', 'y', 'fa fa-notes_2', 2),
(93, 29, 'laporan keuangan', 'keuangan/laporan', 'y', 'fa fa-notes_2', 1),
(94, 42, 'data sekolah', 'setting', 'y', '', 1),
(95, 42, 'pengguna sistem', 'users', 'y', '', 1),
(96, 31, 'siswa', 'siswa', 'y', 'fa fa-group', 2),
(97, 31, 'biaya sekolah', 'setupbiaya', 'y', 'fa fa-money', 2),
(98, 31, 'tahun angkatan', 'tahunangkatan', 'y', 'fa fa-calendar', 2);

-- --------------------------------------------------------

--
-- Table structure for table `telegram`
--

CREATE TABLE IF NOT EXISTS `telegram` (
`id` int(9) NOT NULL,
  `chat_id` varchar(9) NOT NULL,
  `nis` varchar(13) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'y=aktif ,n=tdk aktif'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `telegram`
--

INSERT INTO `telegram` (`id`, `chat_id`, `nis`, `tgl_daftar`, `status`) VALUES
(2, '403119565', '2047', '2018-07-17', 'y'),
(3, '214714741', '2048', '2018-07-01', 'y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akademik_konsentrasi`
--
ALTER TABLE `akademik_konsentrasi`
 ADD PRIMARY KEY (`konsentrasi_id`);

--
-- Indexes for table `akademik_prodi`
--
ALTER TABLE `akademik_prodi`
 ADD PRIMARY KEY (`prodi_id`);

--
-- Indexes for table `akademik_tahun_akademik`
--
ALTER TABLE `akademik_tahun_akademik`
 ADD PRIMARY KEY (`tahun_akademik_id`);

--
-- Indexes for table `app_agama`
--
ALTER TABLE `app_agama`
 ADD PRIMARY KEY (`agama_id`);

--
-- Indexes for table `app_dosen`
--
ALTER TABLE `app_dosen`
 ADD PRIMARY KEY (`dosen_id`);

--
-- Indexes for table `app_hari`
--
ALTER TABLE `app_hari`
 ADD PRIMARY KEY (`hari_id`);

--
-- Indexes for table `app_kelas`
--
ALTER TABLE `app_kelas`
 ADD PRIMARY KEY (`kelas_id`);

--
-- Indexes for table `app_pekerjaan`
--
ALTER TABLE `app_pekerjaan`
 ADD PRIMARY KEY (`pekerjaan_id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
 ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `keuangan_biaya_kuliah`
--
ALTER TABLE `keuangan_biaya_kuliah`
 ADD PRIMARY KEY (`biaya_kuliah_id`);

--
-- Indexes for table `keuangan_jenis_bayar`
--
ALTER TABLE `keuangan_jenis_bayar`
 ADD PRIMARY KEY (`jenis_bayar_id`);

--
-- Indexes for table `keuangan_pembayaran`
--
ALTER TABLE `keuangan_pembayaran`
 ADD PRIMARY KEY (`pembayaran_id`);

--
-- Indexes for table `keuangan_pembayaran_detail`
--
ALTER TABLE `keuangan_pembayaran_detail`
 ADD PRIMARY KEY (`pembayara_detail_id`);

--
-- Indexes for table `mainmenu`
--
ALTER TABLE `mainmenu`
 ADD PRIMARY KEY (`id_mainmenu`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
 ADD PRIMARY KEY (`ID`), ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`), ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
 ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
 ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
 ADD PRIMARY KEY (`ID`,`SequencePosition`), ADD KEY `sentitems_date` (`DeliveryDateTime`), ADD KEY `sentitems_tpmr` (`TPMR`), ADD KEY `sentitems_dest` (`DestinationNumber`), ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `student_angkatan`
--
ALTER TABLE `student_angkatan`
 ADD PRIMARY KEY (`angkatan_id`);

--
-- Indexes for table `student_siswa`
--
ALTER TABLE `student_siswa`
 ADD PRIMARY KEY (`siswa_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
 ADD PRIMARY KEY (`id_submenu`);

--
-- Indexes for table `telegram`
--
ALTER TABLE `telegram`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akademik_konsentrasi`
--
ALTER TABLE `akademik_konsentrasi`
MODIFY `konsentrasi_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `akademik_prodi`
--
ALTER TABLE `akademik_prodi`
MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `akademik_tahun_akademik`
--
ALTER TABLE `akademik_tahun_akademik`
MODIFY `tahun_akademik_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `app_dosen`
--
ALTER TABLE `app_dosen`
MODIFY `dosen_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `app_hari`
--
ALTER TABLE `app_hari`
MODIFY `hari_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_biaya_kuliah`
--
ALTER TABLE `keuangan_biaya_kuliah`
MODIFY `biaya_kuliah_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `keuangan_jenis_bayar`
--
ALTER TABLE `keuangan_jenis_bayar`
MODIFY `jenis_bayar_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `keuangan_pembayaran`
--
ALTER TABLE `keuangan_pembayaran`
MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_pembayaran_detail`
--
ALTER TABLE `keuangan_pembayaran_detail`
MODIFY `pembayara_detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `mainmenu`
--
ALTER TABLE `mainmenu`
MODIFY `id_mainmenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_angkatan`
--
ALTER TABLE `student_angkatan`
MODIFY `angkatan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `student_siswa`
--
ALTER TABLE `student_siswa`
MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=276;
--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `telegram`
--
ALTER TABLE `telegram`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
