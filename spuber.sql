-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2018 at 08:29 AM
-- Server version: 5.6.20-log
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `akademik`
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
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '', '2018-07-15 13:20:04'),
(8, 'bendahara', '', 'e10adc3949ba59abbe56e057f20f883e', 2, '1', '2018-03-28 19:33:30');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `keuangan_biaya_kuliah`
--

INSERT INTO `keuangan_biaya_kuliah` (`biaya_kuliah_id`, `jenis_bayar_id`, `prodi_id`, `konsentrasi_id`, `angkatan_id`, `jumlah`) VALUES
(1, 1, 1, 0, 3, 200000),
(2, 2, 1, 0, 3, 675000),
(16, 4, 1, 0, 3, 2750000),
(17, 5, 1, 0, 3, 200000),
(18, 6, 1, 0, 3, 200000),
(19, 7, 1, 0, 3, 1850000),
(20, 8, 1, 0, 3, 100000),
(21, 1, 2, 0, 3, 0),
(22, 2, 2, 0, 3, 0),
(23, 4, 2, 0, 3, 0),
(24, 5, 2, 0, 3, 0),
(25, 6, 2, 0, 3, 0),
(26, 7, 2, 0, 3, 0),
(27, 8, 2, 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_jenis_bayar`
--

CREATE TABLE IF NOT EXISTS `keuangan_jenis_bayar` (
`jenis_bayar_id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `keuangan_jenis_bayar`
--

INSERT INTO `keuangan_jenis_bayar` (`jenis_bayar_id`, `keterangan`) VALUES
(1, 'SPP'),
(2, 'BUKU'),
(4, 'DPP'),
(5, 'UTS'),
(6, 'UAS'),
(7, 'UNAS'),
(8, 'Lain-lain');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

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
(24, '2018-07-08 10:49:34', '2048', 2, 1, 5000, 0),
(27, '2018-07-08 11:08:06', '2048', 4, 1, 50000, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `mainmenu`
--

INSERT INTO `mainmenu` (`id_mainmenu`, `nama_mainmenu`, `icon`, `aktif`, `link`, `level`) VALUES
(26, 'master data', 'fa fa-bar-chart-o', 'y', '#', 1),
(29, 'keuangan', 'fa fa-money', 'y', '#', 1),
(30, 'pengguna sistem', 'fa fa-qrcode', 'y', 'users', 1),
(31, 'Mahasiswa', 'fa fa-group', 'y', 'mahasiswa', 2),
(40, 'biodata', 'fa fa-user', 'y', 'users/account', 3),
(41, 'keuangan', 'fa fa-money', 'y', '#', 2);

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
(1, 'smp sepuluh nopember', 'sidoarjo', '031861010');

-- --------------------------------------------------------

--
-- Table structure for table `student_angkatan`
--

CREATE TABLE IF NOT EXISTS `student_angkatan` (
`angkatan_id` int(11) NOT NULL,
  `keterangan` varchar(15) NOT NULL,
  `aktif` varchar(1) NOT NULL COMMENT 'y = aktif dan n = tidak'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `student_angkatan`
--

INSERT INTO `student_angkatan` (`angkatan_id`, `keterangan`, `aktif`) VALUES
(3, '2017-2018', 'y'),
(4, '2018-2019', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `student_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `student_mahasiswa` (
`mahasiswa_id` int(11) NOT NULL,
  `nim` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `prodi_id` int(2) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=197 ;

--
-- Dumping data for table `student_mahasiswa`
--

INSERT INTO `student_mahasiswa` (`mahasiswa_id`, `nim`, `nama`, `prodi_id`, `angkatan_id`, `alamat`, `semester`, `gender`, `agama_id`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `no_hp_ortu`, `pekerjaan_id_ibu`, `pekerjaan_id_ayah`, `alamat_ayah`, `alamat_ibu`, `penghasilan_ayah`, `penghasilan_ibu`, `semester_aktif`) VALUES
(1, '2046', 'ABID MUNSHIF RAFI', 1, 3, 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IRMA ISNAINI', 'BINTANG HERMAWAN', '085655366741', 1, 6, 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 'KARANGAYAM GG PELABUHAN 70A SIDOARJO', 0, 0, 0),
(2, '2047', 'ADAM SETYA PRATAMA', 1, 3, 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NATALIA DINIK DEWAYANI', 'SETIYO WAHYUDI', '85101294041', 1, 6, 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 'PERUM SURYA ASRI I BLOK C3 NO 16 36/03 SIDOKEPUNG BUDURAN', 0, 0, 0),
(3, '2048', 'AHILLAH HALIMATUS HAWA', 1, 3, 'PERUM GRAHA POS PROPERINDO CA-08 ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'EVI ANDRIANI', 'DHANI WIBOWO, SE', '85231848468', 1, 5, 'PERUM GRAHA POS PROPERINDO CA-08 ', 'PERUM GRAHA POS PROPERINDO CA-08 ', 0, 0, 0),
(4, '2049', 'AIDIN FERARISTA ZAKARIYAH', 1, 3, 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'WIWIT WIDOWATI', 'RUDY HARTONO', '8123524515', 1, 6, 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 'PERUM SURYA ASRI I BLOK B6 NO.08 RT.44/03 SIDOKEPUNG BUDURAN ', 0, 0, 0),
(5, '2050', 'ALFITRAH ARDANA PUTRA', 1, 3, 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NURHAYANI', 'R. IRWAN SATRIO', '8135711746', 1, 99, 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 'PANDEAN RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(6, '2051', 'AMELIA', 1, 3, 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'MAIMUNA', 'SANIAN', '8785391477', 1, 9, 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 'GAJAH MAGERSARI RT.16 RW.05 MAGERSARI-SIDOARJO', 0, 0, 0),
(7, '2052', 'ANISA NABILA SAVITRI', 1, 3, 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'EMI SUSIAM', 'SHOLIKIN SOFYAN', '82234440468', 1, 9, 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 'JL PANGLIMA HIDAYAT GG.STM TRISAKTI RT.07 RW.02 BULUSIDOKARE ', 0, 0, 0),
(8, '2053', 'ARVA SATRIA PUTRA NUGRAHA', 1, 3, 'NATURA RESIDENCE A8-3 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MARTINI', 'DASA HARI NUGRAHA', '8123497080', 1, 6, 'NATURA RESIDENCE A8-3 SIDOARJO', 'NATURA RESIDENCE A8-3 SIDOARJO', 0, 0, 0),
(9, '2054', 'AVREL MAULANA PUTRA PURWOKO', 1, 3, 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ISNANI', 'PURWOKO', '87702884156', 1, 6, 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 'SIWALANPANJI RT12/03 BUDURAN SIDOARJO', 0, 0, 0),
(10, '2055', 'CANTICCA NOVIANA', 1, 3, 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, '2', 2, 'Sidoarjo', '0000-00-00', 'ANNA FITRIA', 'ANTOK ARIYANTO', '82230886174', 1, 9, 'GAJAH MAGERSARI 16/05 SIDOARJO', 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, 0, 0),
(11, '2056', 'DEWI SUKMA FII AMANILLAH', 1, 3, 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SRI ANDAYANI', 'MAHMUDI', '8563063147', 1, 9, 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 'JL. PAHLAWAN GOR DELTA KAV.28 MAGERSARI-SIDOARJO', 0, 0, 0),
(12, '2057', 'DWITA AYU NIRMALA ', 1, 3, 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'AYUTIK', 'EDI SUDARWANTO', '89674180352', 1, 6, 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 'PAGERWOJO RT.04/04 PAGERWOJO-SIDOARJO', 0, 0, 0),
(13, '2058', 'FAIZ AGENG PRATAMA', 1, 3, 'PANDEAN 05/01 BANJARKEMANTREN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HENI SOELISTIYOWATI', 'RIFA''I', '81330167691', 1, 6, 'PANDEAN 05/01 BANJARKEMANTREN', 'PANDEAN 05/01 BANJARKEMANTREN', 0, 0, 0),
(14, '2059', 'FERRARI SHEVKIANO DJAMIR', 1, 3, 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IRA KUSUMA DEWI', 'JULIANDRE CHANIAGO', '81216798089', 1, 9, 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 'PERUM AL CANDI L3 NO.15 CANDI - SIDOARJO', 0, 0, 0),
(15, '2060', 'HYMTA ALEXANDER NUGRAHA KADANG', 1, 3, 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'OKTAVIA MAHARANI', 'NICOLAS KADANG', '81357222458', 1, 6, 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 'PERUM THE TAMAN DHIKA BLOK BROMO F-12', 0, 0, 0),
(16, '2061', 'JASSON HOSHI MACHIDA', 1, 3, 'KEBOAN SIKEP 05/01 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'IDA ULFAH', 'BAMBANG HARMINTO MACHIDA', '85954407963', 1, 6, 'KEBOAN SIKEP 05/01 GEDANGAN', 'KEBOAN SIKEP 05/01 GEDANGAN', 0, 0, 0),
(17, '2062', 'KEZIA YOUAN VEBRINA', 1, 3, 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'YULI RAHMAWATI', 'YOHANES SUPRIYANTO', '85606591415', 1, 6, 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 'PERUM TRUS RESIDENCE B5 07/14 BLURU KIDUL', 0, 0, 0),
(18, '2063', 'M. FAVIAN FARHAN', 1, 3, 'PONDOK JATI DE-17 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPRIYATININGSIH', 'INDRA YUDHANA', '031-8073648', 1, 6, 'PONDOK JATI DE-17 SIDOARJO', 'PONDOK JATI DE-17 SIDOARJO', 0, 0, 0),
(19, '2064', 'MAULANA AKBAR RASYID', 1, 3, 'PURI SURYA JAYA 12/39 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NUR ZAKIYAH', 'YUSUF  ', '85231862531', 1, 6, 'PURI SURYA JAYA 12/39 GEDANGAN', 'PURI SURYA JAYA 12/39 GEDANGAN', 0, 0, 0),
(20, '2065', 'MIRNA MEITA RAHMAWATI', 1, 3, 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'KATINAH', 'EDY SAMPURNO', '85708074694', 1, 6, 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 'Jl. YANI GG MERPATI 02/01 GEDANGAN', 0, 0, 0),
(21, '2066', 'MOCHAMAD SURYA PRATAMA', 1, 3, 'SIDOKEPUNG 08/02 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NISFUL LAILI', 'SUTRISNO ', '87703077236', 1, 6, 'SIDOKEPUNG 08/02 BUDURAN', 'SIDOKEPUNG 08/02 BUDURAN', 0, 0, 0),
(22, '2067', 'MOHAMMAD REZA SETIAWAN', 1, 3, 'KARANGBONG 02/03 NO.414 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'KHOLIFAH', 'CHOIRUL ANWAR', '83830359312', 1, 9, 'KARANGBONG 02/03 NO.414 GEDANGAN', 'KARANGBONG 02/03 NO.414 GEDANGAN', 0, 0, 0),
(23, '2068', 'MUHAMMAD ALFIDIAN AQILAMIR', 1, 3, 'BCF Jl.SEKAWAN HARUM B.20', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NOVA MAHENDRA MISDIANA', 'FITHER SANI', '81358000097', 1, 9, 'BCF Jl.SEKAWAN HARUM B.20', 'BCF Jl.SEKAWAN HARUM B.20', 0, 0, 0),
(24, '2069', 'MUHAMMAD HAIKAL WAHYU PUTRA', 1, 3, 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'YULI ANDRIANI', 'WAHYU SHALEHIN AL ANSHARI', '8125134605', 1, 6, 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 'TAMAN TIARA REGENCY NEW AGE CLUSTER BLOK E-8', 0, 0, 0),
(25, '2070', 'NANDA AGUNG SETIAWAN', 1, 3, 'PANDEAN 10/01 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SRI ANDAYANI', 'ANDRI SETIAWAN', '81335628844', 1, 8, 'PANDEAN 10/01 BUDURAN', 'PANDEAN 10/01 BUDURAN', 0, 0, 0),
(26, '2071', 'NARULITA ELANIA FATIHAH', 1, 3, 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'PURYANI', 'CANDRA ALI LESMANA', '', 1, 10, 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 'PERUM BLURU PERMAI K28 RT.02/09 BLURU KIDUL', 0, 0, 0),
(27, '2072', 'NOFITA MAULIDIYAH', 1, 3, 'Jl. SRUNI 03/01 No.142 GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'WELAS ASIH', 'AFFANDI (Alm)', '85730032152', 1, 6, 'Jl. SRUNI 03/01 No.142 GEDANGAN', 'Jl. SRUNI 03/01 No.142 GEDANGAN', 0, 0, 0),
(28, '2073', 'NUR LAILATUN NASFIYAH ', 1, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUYATI', 'SOFA HADI MUDZAKKIR', '85646527616', 1, 6, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(29, '2074', 'RACHMADANI NOVYA SRY REJEKY', 1, 3, 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUMARNI', 'ADI MULYA ', '81357382702', 1, 6, 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 'JL. JENGGOLO II B NO.07 06/02 PUCANG', 0, 0, 0),
(30, '2075', 'RANGGA OCTADHIO PRATAMA', 1, 3, 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'WARIH ANTARI', 'ISMAWAN', '82230570205', 1, 6, 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 'PERUM SURYA INDAH PERMAI B-5 PRUMPON SURUH SUKODONO', 0, 0, 0),
(31, '2076', 'RENDY WAHYU PRATAMA', 1, 3, 'BANJARKEMANTREN 04/04 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DWI RETNOWATI', 'IMAM ROEKAN', '85645458700', 1, 6, 'BANJARKEMANTREN 04/04 BUDURAN', 'BANJARKEMANTREN 04/04 BUDURAN', 0, 0, 0),
(32, '2077', 'REYHAN RAHADIAN', 1, 3, 'PONDOK JATI BLOK T-24 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'Dra. UMI NURHAYATI', 'Ir. KRESNO DIPOYONO', '81216284242', 1, 12, 'PONDOK JATI BLOK T-24 SIDOARJO', 'PONDOK JATI BLOK T-24 SIDOARJO', 0, 0, 0),
(33, '2078', 'RISKI FEBRIAN CHANDRA', 1, 3, 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISWI ESTU RETNANINGRUM', 'DEDY CHANDRA', '82254226222', 1, 6, 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 'TAMAN HEDONA REGENCY B5/40 RT 13/06 PRASUNG BUDURAN', 0, 0, 0),
(34, '2079', 'SALMAN ALFARISI ', 1, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MARIYATUL QIPTIYAH', 'MUJALAL', '-', 1, 9, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(35, '2080', 'SEPTIAN SURYA ADITYA', 1, 3, 'BANJARPOH 14/06 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'NGATILAH', 'MUKIJAM', '', 1, 6, 'BANJARPOH 14/06 BUDURAN', 'BANJARPOH 14/06 BUDURAN', 0, 0, 0),
(36, '2081', 'SYAHFRI ILHAM SETIAWAN', 1, 3, 'KEBOANSIKEP 04/04 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SOFIA YULIATI', 'DONNY YUDA SETIAWAN', '81231742991', 1, 9, 'KEBOANSIKEP 04/04 GEDANGAN', 'KEBOANSIKEP 04/04 GEDANGAN', 0, 0, 0),
(37, '2082', 'VALDANOGA PONGSIRANTE RERUNG', 1, 3, 'PERUM KEMIRI INDAH BLOK C5/12', 0, '1', 2, 'Sidoarjo', '0000-00-00', 'ISWAHYUNI', 'VICTOR RERUNG', '82293040477', 1, 9, 'PERUM KEMIRI INDAH BLOK C5/12', 'PERUM KEMIRI INDAH BLOK C5/12', 0, 0, 0),
(38, '2083', 'YASIER ARAFAT', 1, 3, 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPRAPTI', 'ACH.SAAD', '82140107998', 1, 6, 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 'DSN. PANDEAN RT.05 RW.01 BANJAR KEMANTREN BUDURAN SIDOARJO', 0, 0, 0),
(39, '2084', 'ZAHWA MAHARANI PUTRI', 1, 3, 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YANI NURHAYATI', 'NUGROHO SETYO WIBOWO ', '031-8050061', 1, 6, 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 'PERMATA MEGA ASRI L/2 RT.33 RW.08 SIDOKEPUNG BUDURAN', 0, 0, 0),
(40, '02085', 'ABIYOSO SYAM PAMUNGKAS SETIAWAN', 1, 3, 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'PAULA KOMALASARI', 'DIDY SETIAWAN', '082140964046', 1, 10, 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 'PERUM SUKODONO PERMAI AA-10 RT.57 RW.12 KEBONAGUNG SUKODONO', 0, 0, 0),
(41, '02086', 'ADELINE AUREL YAFI SEPTANIA', 1, 3, 'PERUM MAGERSARI Z18 33/07 SDA', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'Dra. TITIK SETIYAWATI', 'Ir. G. SOEMARSONO', '081332354821', 1, 5, 'PERUM MAGERSARI Z18 33/07 SDA', 'PERUM MAGERSARI Z18 33/07 SDA', 0, 0, 0),
(42, '02087', 'AHKAM MAULANA IHYAUDDIN ', 1, 3, 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DIAH MUTIASARI', 'IWAN IHYAUDDIN', '081231500182', 1, 10, 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 'PONDOK SIDOKARE INDAH BLOK AI NO.14 SIDOKARE', 0, 0, 0),
(43, '02088', 'AJENG PURTIVIKASRI', 1, 3, 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YULIATI', 'Ir. BAMBANG PURNOMO', '081233423380', 1, 12, 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 'DS PANDEAN RT 10/02, BANJARKEMANTREN ', 0, 0, 0),
(44, '02089', 'ALIF NAUFAL FAKHRI SARYUANSAH', 1, 3, 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'YUNI ANDAYANI', 'SARWI EDI', '081554157843', 1, 9, 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 'JL. JENGGOLO III/157 RT.11 RW.03 PUCANG-SIDOARJO', 0, 0, 0),
(45, '02090', 'AMELIYA SEPFING', 1, 3, 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NURYANAH', 'YOHANIS SUTANTO', '085852998341', 1, 7, 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 'SEMEMI JAYA 5-C 02/01 BENOWO SURABYA', 0, 0, 0),
(46, '02091', 'ANNAS HENDRIAN MAULANA', 1, 3, 'SUKOREJO 10/03 BUDURAN', 0, '1', 1, 'MALANG', '0000-00-00', 'IMA TATIK MURIYANTI', 'KARIYONO', '085648721212', 1, 6, 'SUKOREJO 10/03 BUDURAN', 'SUKOREJO 10/03 BUDURAN', 0, 0, 0),
(47, '02092', 'ARVIEN SAVA NAYAKA ANANTA FIRMANSYAH', 1, 3, 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'AFIF ROHMANIYATI', 'TITO RIZKY FIRMANSYAH', '085732799889', 1, 6, 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 'DS.KEBOANSIKEP RT.06/01 GEDANGAN-SIDOARJO', 0, 0, 0),
(48, '02093', 'AYU DEWI SETYOWATI', 1, 3, 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SOEMARSIH', 'SAMALI', '085791214045', 1, 11, 'GAJAH MAGERSARI 13/04 SIDOARJO', 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, 0, 0),
(49, '02094', 'CHALITA DHUHA WISESA', 1, 3, 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'WIDIARTIN', 'AMARUDIN DJOKO SUSENO', '081233846421', 1, 10, 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 'PERUM OMA PESONA BUDURAN BLOK G11/ NO.10 RT.37 RW.07 SIDOKEPUNG BUDURAN SIDOARJO', 0, 0, 0),
(50, '02095', 'DIAN ARDIANSYAH', 1, 3, 'JL PASAR BUDURAN 10/04 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISWATI', 'DONI SUDIWUL', '081330002599', 1, 7, 'JL PASAR BUDURAN 10/04 BUDURAN', 'JL PASAR BUDURAN 10/04 BUDURAN', 0, 0, 0),
(51, '02096', 'ELENA ZVONAREVA SALENUSSA', 1, 3, 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'IKHA RINA YULIYANTI', 'NICOLAS SALENUSSA', '082232171623', 1, 5, 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 'BCF JL SEKAWAN WANGI 2A/30 BULU SIDOKARE ', 0, 0, 0),
(52, '02097', 'FAJAR NUR ASHFIYA''', 1, 3, 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 0, '1', 1, 'NGANJUK', '0000-00-00', 'RO''IKHATUL JANNAH', 'ABDUL WAHIB', '081235651950', 1, 10, 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 'GANTING RT.03 RW.01 GEDANGAN-SIDOARJO', 0, 0, 0),
(53, '02098', 'FARHAN RADITYA SUHENDRO', 1, 3, 'PONDOK JATI AL-22 SIDOARJO', 0, '1', 1, 'JAKARTA', '0000-00-00', 'HENNY WIBOWO', 'SUHENDRO DWI CAHYONO', '081311302816', 1, 5, 'PONDOK JATI AL-22 SIDOARJO', 'PONDOK JATI AL-22 SIDOARJO', 0, 0, 0),
(54, '02099', 'FIFIN AULIA ALFIANTI', 1, 3, 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUSIANA', 'MOCHAMMAD ROEM', '0818322668', 1, 9, 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 'SEDATI GEDE GG KELINCI 02/01 SEDATI', 0, 0, 0),
(55, '02100', 'GIBRAN AQSHA HENDRAWAN', 1, 3, 'Jl. SURABAYAN 1 NO.25 SURABAYA', 0, '1', 1, 'SURABAYA', '0000-00-00', 'RATNA PUSPITASARI', 'RISQKI HENDRAWAN', '081330613357', 1, 6, 'Jl. SURABAYAN 1 NO.25 SURABAYA', 'Jl. SURABAYAN 1 NO.25 SURABAYA', 0, 0, 0),
(56, '02101', 'ILHAM AKBARIZKY', 1, 3, 'DS. SURUH 11/03 SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MAROTIN', 'SUPENI', '', 1, 6, 'DS. SURUH 11/03 SUKODONO', 'DS. SURUH 11/03 SUKODONO', 0, 0, 0),
(57, '02102', 'JERICO PUTRA PRADANA', 1, 3, 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'TANTI KUSUMA WARDANY', 'EKO DESIANTO', '082231113643', 1, 6, 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 'JL. JENGGOLO UTARA BLOK A NO.5 10/03 SIWALANPANJI BUDURAN', 0, 0, 0),
(58, '02103', 'KHISBUL ANWAR', 1, 3, 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HERMIN', 'KHAMAMI', '085648925315', 1, 9, 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 'JL. MASJID KEMIRI RT.05 RW.02 KEMIRI-SIDOARJO', 0, 0, 0),
(59, '02104', 'M. MAULANA ROZAQ', 1, 3, 'ENTALSEWU 13/04 BUDURAN', 0, '1', 1, 'BLORA', '0000-00-00', 'SRI WAHYU EKO PRATIWI', 'PURWANTORO', '088977730722', 1, 6, 'ENTALSEWU 13/04 BUDURAN', 'ENTALSEWU 13/04 BUDURAN', 0, 0, 0),
(60, '02105', 'MAULANA EKA PRATAMA', 1, 3, 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LILIK KASIANI', 'DAHIRUN', '081285927477', 1, 6, 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 'SIDOPURNO RT.19 RW.04 BUDURAN-SIDOARJO', 0, 0, 0),
(61, '02106', 'MOCH GALANG JALU CANTONA', 1, 3, 'SRUNI 14/03 GEDANGAN', 0, '1', 1, 'JEMBER', '0000-00-00', 'MUSRIYATUN', 'MOCH TRIYONO', '085797140082', 1, 9, 'SRUNI 14/03 GEDANGAN', 'SRUNI 14/03 GEDANGAN', 0, 0, 0),
(62, '02107', 'MOCHAMMAD ADITYA FAIZ PRATAMA', 1, 3, 'SIDOKERTO 01/04 NO.19 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'TASRIFAH', 'SUSILO', '085645218562', 1, 6, 'SIDOKERTO 01/04 NO.19 BUDURAN', 'SIDOKERTO 01/04 NO.19 BUDURAN', 0, 0, 0),
(63, '02108', 'MOHAMMAD RIZKI FEBRIANTO', 1, 3, 'BLURU KIDUL 04/13 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SUPIYATI TRININGRUM', 'EFENDI', '085258322017', 1, 6, 'BLURU KIDUL 04/13 SIDOARJO', 'BLURU KIDUL 04/13 SIDOARJO', 0, 0, 0),
(64, '02109', 'MUHAMMAD ALLYA NOER MUZAMIL', 1, 3, 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 0, '1', 1, 'LAMONGAN', '0000-00-00', 'MILA', 'MAJID SANTOSO', '082301972279', 1, 9, 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 'GRIYA PERMATA HIJAU X3-11 05/03 WEDORO KLURAK CANDI', 0, 0, 0),
(65, '02110', 'MUHAMMAD IRFAN', 1, 3, 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 0, '1', 1, 'PADANG', '0000-00-00', 'YANTI RUDIANA', 'MUHAMMAD GUNTUR', '', 1, 9, 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 'KH.ABBAS RT.07/08 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(66, '02111', 'NADHIL PRATAMA', 1, 3, 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 0, '1', 1, 'JOMBANG', '0000-00-00', 'ENDAH JUNIATI', 'NURSYAM', '081357361036', 1, 5, 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 'JL.SUROWONGSO NO.714 RT.04/06 KARANGBONG-GEDANGAN', 0, 0, 0),
(67, '02112', 'NATASYA SHALSABILLA', 1, 3, 'PERUM BLURU PERMAI Ci/04', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'FETIKA ARISANDI', 'HERDI ARLIYANTO', '0318065017', 1, 9, 'PERUM BLURU PERMAI Ci/04', 'PERUM BLURU PERMAI Ci/04', 0, 0, 0),
(68, '02113', 'NOVA LABITA FERNANDA', 1, 3, 'KEBOAN ANOM 01/01 GEDANGAN', 0, '2', 1, 'KEDIRI', '0000-00-00', 'ASTUTIK SETIONINGRUM', 'EDI SUYETNO', '081232679762', 1, 6, 'KEBOAN ANOM 01/01 GEDANGAN', 'KEBOAN ANOM 01/01 GEDANGAN', 0, 0, 0),
(69, '02114', 'OZZY FITSANDY', 1, 3, 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SURATMI', 'MIATMO SUPRAPTO', '082230342441', 1, 6, 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 'SIDOMULYO RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(70, '02115', 'RAHMA AULIA FIRDAUS', 1, 3, 'Jl. JENGGOLO III/55A PUCANG ', 0, '1', 1, 'DENPASAR', '0000-00-00', 'ANIS MUYASAROH', 'ENDRI SETYAWAN', '081249306820', 1, 9, 'Jl. JENGGOLO III/55A PUCANG ', 'Jl. JENGGOLO III/55A PUCANG ', 0, 0, 0),
(71, '02116', 'RASHYNTA YULIANDA BRELIANA', 1, 3, 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'UPIK WATI', 'BENI SUSANTO', '081217017241', 1, 9, 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 'JL. TERATAI NO.41 RT.01 RW.01 KETAJEN GEDANGAN', 0, 0, 0),
(72, '02117', 'RENO ADITYA NASA SAPUTRA', 1, 3, 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 0, '1', 1, 'TULUNGAGUNG', '0000-00-00', 'NUR AISYAH', 'EKO SUMONO', '081357917007', 1, 9, 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 'PERUM BUMI GEDANGAN INDAH BLOK C-36 ', 0, 0, 0),
(73, '02118', 'RIZKY DWIMANDA PUTRA', 1, 3, 'SUKODONO TOWN HOUSE BLOK D/12 A', 0, '1', 1, 'CIREBON', '0000-00-00', 'LINDA MAYASARI', 'LUKMANSYAH', '082232319144', 1, 6, 'SUKODONO TOWN HOUSE BLOK D/12 A', 'SUKODONO TOWN HOUSE BLOK D/12 A', 0, 0, 0),
(74, '02119', 'SAMUDERA AHMAD', 1, 3, 'SIWALANPANJI 10/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DEWI ASLAMIYAH', 'AKAT', '081230399554', 1, 6, 'SIWALANPANJI 10/03 BUDURAN', 'SIWALANPANJI 10/03 BUDURAN', 0, 0, 0),
(75, '02120', 'SEPTYA ANJAR ALYANDARI KOENTJORO', 1, 3, 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'RITA SRI WEDARI', 'R. SOELOKOENTJORO', '087754262979', 1, 6, 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 'SERUJO GAJAH NO.2 07/02 SIDOARJO', 0, 0, 0),
(76, '02121', 'SYAHRANI ANGELA DELLA VIDA', 1, 3, 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'ISNAINI BS SISTHA', 'SULISTIAWAN', '085645983953', 1, 9, 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 'PERUM BLURU PERMAI BLOK BG 03 SIDOARJO', 0, 0, 0),
(77, '02122', 'VIOLA DIAH AYU ILHAM LAFITRI', 1, 3, 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'YENNY NUR KUMALA', 'MOCH ILHAM', '082132319569', 1, 5, 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 'PERUM GRAND ROSE REGENCY 22/06 KEMIRI', 0, 0, 0),
(78, '02123', 'YOGARAKSA ARIADI WICAKSANA', 1, 3, 'BLURU KIDUL 01/08 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LUSIARINI', 'DIDIK SUPRIYADI', '087856674588', 1, 6, 'BLURU KIDUL 01/08 SIDOARJO', 'BLURU KIDUL 01/08 SIDOARJO', 0, 0, 0),
(79, '02124', 'ACHMAD ALDY ARIAJI', 1, 3, 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'UMI MUJAYAHAH', 'RIAJI', '081330951359', 1, 10, 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 'JL. SENTANA 05 RT.10/05 TEBEL TENGAH GEDANGAN', 0, 0, 0),
(80, '02125', 'ADINDA PUTRI AYUNDA PUSPITASARI ', 1, 3, 'DS. PRUMPON 08/02 SURUH SUKODONO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'VIVA YULI ASTUTIK', 'EKO SETYAWAN', '081334188385', 1, 5, 'DS. PRUMPON 08/02 SURUH SUKODONO', 'DS. PRUMPON 08/02 SURUH SUKODONO', 0, 0, 0),
(81, '02126', 'AHMAD ALI ASY SYAWOI', 1, 3, 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'HARYUDIAH RASDIAHYU', 'HERLAN SUDARTO', '081252719926', 1, 10, 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 'KAHURIPAN NIRWANA A-19 RT.04/10 JATI SIDOARJO', 0, 0, 0),
(82, '02127', 'AKHMAD FATHONI ALI', 1, 3, 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'DYAH FITRHRI RAHAYU', 'ALI MACHFUD', '081333242006', 1, 12, 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 'JL. SENTANA 6A RT.03/04 TEBEL GEDANGAN', 0, 0, 0),
(83, '02128', 'ALVIA NATASYA AGUSTIN', 1, 3, 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SITI ROMLAH', 'IMAM SYAFII', '081242959487', 1, 9, 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 'JAMBE BUDURAN 02/02 BANJAR KEMANTREN BUDURAN', 0, 0, 0),
(84, '02129', 'ANANDYA PUTRI YUNIARTI', 1, 3, 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'SUCI HARINI', 'HERU PURNOMO', '085785646535', 1, 7, 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 'DS. KEBON AGUNG RT.16 RW.05 SUKODONO SIDOARJO', 0, 0, 0),
(85, '02130', 'ANNISA RAMADHANI EFENDI', 1, 3, 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'FENY TRISSIE INDRIANI', 'KOESNOE EFENDI', '081216277768', 1, 6, 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 'KAHURIPAN NIRWANA BLOK BB2 NO.09 RT.05 RW.08 SUMPUT-SIDOARJO', 0, 0, 0),
(86, '02131', 'ASYAM ERLANGGA PUTRA DWIYONO', 1, 3, 'PERUM SUKODONO PERMAI BLOK H NO 05', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NENNY IRAWATI', 'CATUR DARYONO', '081231203378', 1, 6, 'PERUM SUKODONO PERMAI BLOK H NO 05', 'PERUM SUKODONO PERMAI BLOK H NO 05', 0, 0, 0),
(87, '02132', 'BAGUS ARDHI NUGROHO', 1, 3, 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ANI SETYANINGSIH', 'ANDHIK', '085731330122', 1, 11, 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 'PERUM BUMI CABEAN ASRI M1-16 RT.17 RW.06 KALIPECABEAN CANDI-SIDOARJO', 0, 0, 0),
(88, '02133', 'CHLARISSA MAHARANI', 1, 3, 'KARANGBONG 05/01 GEDANGAN', 0, '2', 1, 'KEDIRI', '0000-00-00', 'ANDAYANI', 'SUGIANTO', '082234643922', 1, 10, 'KARANGBONG 05/01 GEDANGAN', 'KARANGBONG 05/01 GEDANGAN', 0, 0, 0),
(89, '02134', 'DIAZ YUFI AGATHA', 1, 3, 'PANDEMONEGORO 01/01 SUKODONO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'ANGELINA NATALIA', 'LAGA FIRMANA', '085856084733', 1, 7, 'PANDEMONEGORO 01/01 SUKODONO', 'PANDEMONEGORO 01/01 SUKODONO', 0, 0, 0),
(90, '02135', 'ELSHADAH HELENA PATRICIA', 1, 3, 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 0, '2', 2, 'SURABAYA', '0000-00-00', 'ELLY ERNA SIHOMBING', 'ESRON HUTABALIAN', '081232046208', 1, 5, 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 'PALEM NIRWANA C3/9 RT.08 RW.01 DUKUH TENGAH BUDURAN-SIDOARJO', 0, 0, 0),
(91, '02136', 'FARADINA AUREL DEVANY', 1, 3, 'Jl. R.K JIMAT 02/06 GEDANGAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'DWI ADJENG AMBARINI', 'NOVI YUDI ANTO', '085732565589', 1, 10, 'Jl. R.K JIMAT 02/06 GEDANGAN', 'Jl. R.K JIMAT 02/06 GEDANGAN', 0, 0, 0),
(92, '02137', 'FERDIAN DWIPUTRA PANGESTU', 1, 3, 'PONDOK JATI BLOK BU-02 SIDOARJO', 0, '1', 1, 'SUKABUMI', '0000-00-00', 'SURYANAH', 'BAMBANG MUJIONO', '081235778322', 1, 5, 'PONDOK JATI BLOK BU-02 SIDOARJO', 'PONDOK JATI BLOK BU-02 SIDOARJO', 0, 0, 0),
(93, '02138', 'FIRJATULLAH', 1, 3, 'SIWALANKERTO TENGAH No.236 SURABAYA', 0, '1', 1, 'SURABAYA', '0000-00-00', 'PURWATININGSIH', 'HENDRA PRASETIA', '081330047569', 1, 9, 'SIWALANKERTO TENGAH No.236 SURABAYA', 'SIWALANKERTO TENGAH No.236 SURABAYA', 0, 0, 0),
(94, '02139', 'GILANG SETYA PUTRA PRATAMA', 1, 3, 'DS. SIDOKEPUNG 14/03 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SULISTYOWATI', 'SUHARTO ', '08977337579', 1, 6, 'DS. SIDOKEPUNG 14/03 BUDURAN', 'DS. SIDOKEPUNG 14/03 BUDURAN', 0, 0, 0),
(95, '02140', 'IMELDA ARUM CAHYANI', 1, 3, 'ENTAL SEWU 14/04 BUDURAN', 0, '2', 1, 'Sidoarjo', '0000-00-00', '', 'DIDIK SUPRIYADI', '089534200000', 1, 6, 'ENTAL SEWU 14/04 BUDURAN', 'ENTAL SEWU 14/04 BUDURAN', 0, 0, 0),
(96, '02141', 'JULIANA ANGELINA', 1, 3, 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 0, '2', 2, 'SURABAYA', '0000-00-00', 'SUTIAH', 'BUDI MARIJONO', '083876309454', 1, 6, 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 'SIWALANKERTO GANG II NO.09 KEMIRI INDAH BLOK C II NO. 47', 0, 0, 0),
(97, '02142', 'KYKA CLEODIO RIZQOLLAH ANDRIYANTO', 1, 3, 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'SISKA MERINA ', 'LESKY NOVI DWI. A.', '085230606373', 1, 9, 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 'Jl. KARTINI GG 2 NO.21 SIDOARJO', 0, 0, 0),
(98, '02143', 'M. RIZKY IMANUHAN', 1, 3, 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'PUJI RAHAYU', 'TIRSAN', '081333080822', 1, 6, 'GAJAH MAGERSARI 16/05 SIDOARJO', 'GAJAH MAGERSARI 16/05 SIDOARJO', 0, 0, 0),
(99, '02144', 'MAULIDA ALFANDA SARI', 1, 3, 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 0, '2', 1, 'MALANG', '0000-00-00', 'BELADONA ENDAH RUMANTI S', 'SUHARYONO', '081334418477', 1, 6, 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 'JL. KENANGA NO.05 01/01 KEBOANSIKEP GEDANGAN', 0, 0, 0),
(100, '02145', 'MOCH. DWI ANDIKA', 1, 3, 'SIDOPURNO RT 18 RW 04', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YATIM SULISTYOWATI', 'MOCH. AMIRUL MUKMININ', '082337561095', 1, 9, 'SIDOPURNO RT 18 RW 04', 'SIDOPURNO RT 18 RW 04', 0, 0, 0),
(101, '02146', 'MOCHAMMAD ANDRE PRATAMA', 1, 3, 'Jl. JAMBU 378 14/03 SIDOARJO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'KOMARO', 'MOCH. ROCHIM', '082234062474', 1, 6, 'Jl. JAMBU 378 14/03 SIDOARJO', 'Jl. JAMBU 378 14/03 SIDOARJO', 0, 0, 0),
(102, '02147', 'MUCHAMMAD YOGI RAMADHANA', 1, 3, 'SIDOKEPUNG 12/03 BUDURAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'UMI KHASANAH', 'MUHAMMAD MUHAIMIN ', '081213916883', 1, 6, 'SIDOKEPUNG 12/03 BUDURAN', 'SIDOKEPUNG 12/03 BUDURAN', 0, 0, 0),
(103, '02148', 'MUHAMMAD ANNAS SHOLIKIN', 1, 3, 'ENTALSEWU 11/03 BUDURAN', 0, '1', 1, 'PONOROGO', '0000-00-00', 'NAWIYAH', 'MUJIANTO', '085785642592', 1, 9, 'ENTALSEWU 11/03 BUDURAN', 'ENTALSEWU 11/03 BUDURAN', 0, 0, 0),
(104, '02149', 'MUHAMMAD NUR WAHYU ILLAHI', 1, 3, 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI AMINAH', 'KUSWANTORO', '085257408847', 1, 9, 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 'JL. KH KHAMDANI III RT.01 RW.01 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(105, '02150', 'NADIA PUTRI ANDINI ', 1, 3, 'KEBOAN ANOM RT 04/ RW 05', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'YULIANI', 'YADI SUPRIYONO', '', 1, 5, 'KEBOAN ANOM RT 04/ RW 05', 'KEBOAN ANOM RT 04/ RW 05', 0, 0, 0),
(106, '02151', 'NAUFAL EKA PRASETYA', 1, 3, 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'LILIK STYOWATI', 'BAMBANG SUPRAPTO', '082140462796', 1, 9, 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 'LEMAH PUTRO GANG KELURAHAN 154 LEMAH PUTRO', 0, 0, 0),
(107, '02152', 'NOVAL ERFENDI', 1, 3, 'PERUM GRAND ROSE REGENCY BLOK C-34', 0, '1', 1, 'SURABAYA', '0000-00-00', 'ERNI WAHYUDI', 'AGUS EFFENDIK', '083849836308', 1, 6, 'PERUM GRAND ROSE REGENCY BLOK C-34', 'PERUM GRAND ROSE REGENCY BLOK C-34', 0, 0, 0),
(108, '02153', 'PRAMESWARI DEWI SEPTA ARUM', 1, 3, 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 0, '2', 1, 'SURABAYA', '0000-00-00', 'DIAN KUMALA DEWI', 'EDY PURNOMO', '081331113986', 1, 6, 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 'PERUM GADING FAJAR 1 B4/46 BUDURAN', 0, 0, 0),
(109, '02154', 'RAHMADITYA VIRMANSYAH', 1, 3, 'KEBOAN SIKEP 06/03 GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YULI RUSTAMI', 'TEGUH SUBAGYO', '085730534449', 1, 9, 'KEBOAN SIKEP 06/03 GEDANGAN', 'KEBOAN SIKEP 06/03 GEDANGAN', 0, 0, 0),
(110, '02155', 'RAYNALD RAZANZA', 1, 3, 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 0, '1', 1, 'BANDUNG', '0000-00-00', 'KIKI JAMILATUL FARIDAH', 'SUMARTONO', '0811277017', 1, 9, 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 'PERUM OMA PESONA BUDURAN G3/15 SIDOKEPUNG', 0, 0, 0),
(111, '02156', 'REVA MAY ASANDI', 1, 3, 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'ASISATUL YULIASIH', 'SUWANDI', '087851638531', 1, 9, 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 'LEMAH PUTRO GG MUTIARA RT.08 RW. 02 LEMAH PUTRO SIDOARJO', 0, 0, 0),
(112, '02157', 'RIZQI ANDRIYAN NUR RAMADAN', 1, 3, 'TEBEL TIMUR 06/06 GEDANGAN', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'PARNIATI', 'SUDIBYO', '085732457346', 1, 6, 'TEBEL TIMUR 06/06 GEDANGAN', 'TEBEL TIMUR 06/06 GEDANGAN', 0, 0, 0),
(113, '02158', 'SANIYYAH ARUN CLARINTA', 1, 3, 'Jl. JAMBU 17/03 SRUNI', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'TITIN SUHARTATIK', 'NUR AFFANDI', '085733733019', 1, 6, 'Jl. JAMBU 17/03 SRUNI', 'Jl. JAMBU 17/03 SRUNI', 0, 0, 0),
(114, '02159', 'SHERINATA IQSTI SOUDYAH', 1, 3, 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 0, '2', 1, 'Sidoarjo', '0000-00-00', 'RETNO DYAH PRATIWI', 'JUNI IRWANTO', '083830656244', 1, 6, 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 'PERUM PONDOK BUANA A-12, BLURU KIDUL, SIDOARJO', 0, 0, 0),
(115, '02160', 'SYAHREZA GIBRAN ARRAFI', 1, 3, 'PURI TERATAI BLOK E-10', 0, '1', 1, 'Sidoarjo', '0000-00-00', 'MUJI ASTUTIK', 'SUNARSO', '085100995463', 1, 9, 'PURI TERATAI BLOK E-10', 'PURI TERATAI BLOK E-10', 0, 0, 0),
(116, '02161', 'WENDY OKTAVIANA PUTRI', 1, 3, 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 0, '2', 1, 'PASURUAN', '0000-00-00', 'SUTIYAH', 'RATNAYUDI', '085335682208', 1, 5, 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 'Jl. NANGKA 125 03/01 SRUNI GEDANGAN', 0, 0, 0),
(117, '02162', 'YOGI ASWA SAPUTRA', 1, 3, 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 0, '1', 1, 'KEDIRI', '0000-00-00', 'SITI MASLIKAH', 'SUPRAPTO (ALM)', '082337492228', 1, 6, 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 'JL. KERTANEGARA NO. 31 05/11 SAWOTRATAP GEDANGAN', 0, 0, 0),
(118, '02163', 'ACHMAD DHYMAS VEBRYANTO', 1, 3, 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'MISTIYAH', 'JUMADI', '', 1, 99, 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 'DESA KEMIRI RT.03 RW.01 KEMIRI-SIDOARJO', 0, 0, 0),
(119, '02164', 'ADITA MAULINA', 1, 3, 'RANGKAH KIDUL 08/02 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'CHUSNUL FADILAH', 'ADI PURWANTO', '082231244291', 1, 6, 'RANGKAH KIDUL 08/02 SIDOARJO', 'RANGKAH KIDUL 08/02 SIDOARJO', 0, 0, 0),
(120, '02165', 'AHMAD FADHIL PURNAMA', 1, 3, 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUPRAPTI', 'HADI DWIYONO EDY P', '081333684860', 1, 6, 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 'SONO INDAH UTARA 04/05 SIDOKERTO BUDURAN', 0, 0, 0),
(121, '02166', 'ALDI RAMADHANI', 1, 3, 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'PUDJI WIRANAWATI', 'SUPRIJADI', '083849601690', 1, 6, 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 'JENGGOLO ARSI O-21 RT.01 RW.08 SIDOKERTO BUDURAN-SIDOARJO', 0, 0, 0),
(122, '02167', 'ALVIRA RAHMADINA', 1, 3, 'Jl. RADEN PATAH NO.109 SIDOARJO', 0, '2', 1, 'TULUNGAGUNG', '0000-00-00', 'WIHARTINI', 'ARIEF RAHCMAN', '085730559970', 1, 6, 'Jl. RADEN PATAH NO.109 SIDOARJO', 'Jl. RADEN PATAH NO.109 SIDOARJO', 0, 0, 0),
(123, '02168', 'ALYA RAMADHANI', 1, 3, '0', 0, '2', 1, '', '0000-00-00', '', '', '', 1, 6, '', '', 0, 0, 0),
(124, '02169', 'ANANTA ALICIA INDIE', 1, 3, 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 0, '2', 1, 'MALANG', '0000-00-00', 'INE SISWARINI', 'SUPRIYADI', '08123252147', 1, 6, 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 'PERUMTAS 2 21 MANGGA BLOK NI/26 RT.07 RW.06 TANGGULANGIN KALISAMPOERNA TANGGULANGIN-SIDOARJO', 0, 0, 0),
(125, '02170', 'ANYA TIRANA DEWANTI MAYANANDA', 1, 3, 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SULIKAH YUNIARTI', 'MOENDJARI', '08213128110', 1, 6, 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 'PERUM BLURU PERMAI BLOK CV 31A RT.15 RW.11 BLURU KIDUL-SIDOARJO', 0, 0, 0),
(126, '02171', 'AULIA PUTRI MAYORI', 1, 3, 'PERUM GEBANG RAYA AG-14 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUMARTINI', 'IMAM BASORI', '081252305559', 1, 10, 'PERUM GEBANG RAYA AG-14 SIDOARJO', 'PERUM GEBANG RAYA AG-14 SIDOARJO', 0, 0, 0),
(127, '02172', 'BAYU MAULA ISTIGHFARI', 1, 3, 'PERUM MAGERSARI PERMAI BLOK I-15', 0, '1', 1, 'SURABAYA', '0000-00-00', 'RETNO WULANDARI', 'ISROFIK SUGIANTO', '081235904400', 1, 6, 'PERUM MAGERSARI PERMAI BLOK I-15', 'PERUM MAGERSARI PERMAI BLOK I-15', 0, 0, 0),
(128, '02173', 'CINDY PUTRI AISYAH', 1, 3, 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ERNAWATI PRIANTINI', 'SUHARSONO', '081331904039', 1, 6, 'GAJAH MAGERSARI 13/04 SIDOARJO', 'GAJAH MAGERSARI 13/04 SIDOARJO', 0, 0, 0),
(129, '02174', 'DIMAS ADITYA ANANSYAH', 1, 3, 'DSN KALAK 15/04 PAGERWOJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RATNAWATI', 'MUCH. SININ', '083854619929', 1, 6, 'DSN KALAK 15/04 PAGERWOJO', 'DSN KALAK 15/04 PAGERWOJO', 0, 0, 0),
(130, '02175', 'ERVINA NIRMALASARI', 1, 3, 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ERDINA KALSUM', 'WINARNO', '082335181888', 1, 7, 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 'JL SATRIA 49 BETRO RT.08 RW.04 SEDATI-SIDOARJO', 0, 0, 0),
(131, '02176', 'FARHAN ZAHRIZAL', 1, 3, 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 0, '1', 1, 'SURAKARTA', '0000-00-00', 'DWI WAHYUNI', 'ZAHRI SURYA', '081915309184', 1, 6, 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 'PERUM CITRA SURYA MAS JLN KELAPA GADING BI-6 43/10 JUMPUT REJO SUKODONO', 0, 0, 0),
(132, '02177', 'FRISKA PUTRI MEILYASARI HANAFI', 1, 3, 'PERUM JENGGOLO ASRI BLOK Q/7', 0, '2', 1, 'SURABAYA', '0000-00-00', 'FIROELLY NURIAH SOEBAGIO', 'MOCH. SYAIFUL HANAFI', '', 1, 6, 'PERUM JENGGOLO ASRI BLOK Q/7', 'PERUM JENGGOLO ASRI BLOK Q/7', 0, 0, 0),
(133, '02178', 'HARLITA PUTRI FATIKHA SARI', 1, 3, 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'HARTATIK', 'HARIANTO', '081235624112', 1, 6, 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 'JL. JENGGOLO 1 01/02 PUCANG SIDOARJO', 0, 0, 0),
(134, '02179', 'IQBAL RAUL MU''IZUDDIN', 1, 3, 'PENCANTINGAN 04/12 SEKARDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'IDA NURYANI', 'SETYO WIBOWO', '081231275700', 1, 9, 'PENCANTINGAN 04/12 SEKARDANGAN', 'PENCANTINGAN 04/12 SEKARDANGAN', 0, 0, 0),
(135, '02180', 'JUVENTINI INDAR PARAWANGSA', 1, 3, 'GEDANGAN GG MERPATI 02/01 NO.27', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'WANTI SULIKAH', 'YEPI ASKARI', '085708074694', 1, 6, 'GEDANGAN GG MERPATI 02/01 NO.27', 'GEDANGAN GG MERPATI 02/01 NO.27', 0, 0, 0),
(136, '02181', 'LAURA BONITA', 1, 3, 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'SOELASTRI', 'ARIA CAKRA WIBAWA', '081332236257', 1, 5, 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 'PERUM MAGERSARI PERMAI D-5 SIDOARJO', 0, 0, 0),
(137, '02182', 'MAHADHIKA SUKMANAWATI', 1, 3, 'KOMPLEK TNI AL BIII/47 TEBEL ', 0, '1', 1, 'SURABAYA', '0000-00-00', 'SINTA WATI', 'SUKADI', '081330043094', 1, 5, 'KOMPLEK TNI AL BIII/47 TEBEL ', 'KOMPLEK TNI AL BIII/47 TEBEL ', 0, 0, 0),
(138, '02183', 'MAWAR MAUDI HIKMAH ALFIRA', 1, 3, 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 0, '2', 1, 'KEDIRI', '0000-00-00', 'SRI ERNAWATI', 'IMRON MUAFENDI', '085859067891', 1, 6, 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 'PANDEAN 01/01 PEKAUMAN SIDOARJO', 0, 0, 0),
(139, '02184', 'MOCH. FATUR ANGGA PRATAMA', 1, 3, 'DUKUH TENGAH RT.04/01 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'KHOLIFATURROHMA', 'ISMAIL', '085733018709', 1, 6, 'DUKUH TENGAH RT.04/01 BUDURAN', 'DUKUH TENGAH RT.04/01 BUDURAN', 0, 0, 0),
(140, '02185', 'MOCHAMMAD FARHAN AZIZ', 1, 3, 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RIFDA MAYLANA', 'EDHY BUDI JATMIKO', '081234300622', 1, 9, 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 'PERUM GRAHA PESONA B1/22 MODONG TULANGAN', 0, 0, 0),
(141, '02186', 'MUH. WILDAN AKBAR', 1, 3, 'SIDOKERTO 56 02/01 BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'Ir. Rr. SRI RAHAYU RETNANINGSIH', 'Drs. MANSUR, M.Pd', '082143568103', 1, 13, 'SIDOKERTO 56 02/01 BUDURAN', 'SIDOKERTO 56 02/01 BUDURAN', 0, 0, 0),
(142, '02187', 'MUHAMMAD ATHA RASYID', 1, 3, 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'DYLLA ARDYAHRINI', 'SUPRIYONO', '085645384964', 1, 5, 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 'TENGGULUNAN MAJU NO.19 01/01 CANDI', 0, 0, 0),
(143, '02188', 'MUHAMMAD RAFFY DIAN HERMAWAN', 1, 3, 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 0, '1', 1, 'BOJONEGORO', '0000-00-00', 'DWI ANITA', 'AGUS GATOT HERMAWAN', '081331507456', 1, 9, 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 'TAMAN PUSPA ANGGASWANGI C1-11 01/07 ANGGASWANGI SUKODONO', 0, 0, 0),
(144, '02189', 'NAILUL MAGHFIROH', 1, 3, 'Jl. RANDU ASRI 09/03 PAGERWOJO', 0, '2', 1, 'GRESIK', '0000-00-00', 'SRI TUTIK', 'KHOTIB', '085105248462', 1, 9, 'Jl. RANDU ASRI 09/03 PAGERWOJO', 'Jl. RANDU ASRI 09/03 PAGERWOJO', 0, 0, 0),
(145, '02190', 'NAUFAL ERA SETYAWAN', 1, 3, 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NIKMAH', 'GATOT DADIK HARTONO', '082231377562', 1, 6, 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 'PERUM PPG 2 BLOK O NO.15 RT.09 RW.06 BLURU KIDUL-SIDOARJO', 0, 0, 0),
(146, '02191', 'NOVITA FITRIANI', 1, 3, 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUWARSI', 'SUPRIYADI', '082142528264', 1, 6, 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 'JL. BUYUT KHORY I RT.01 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(147, '02192', 'PUTRI ELFRIDA NGESTIORINI', 1, 3, 'PERUM BLURU PERMAI ED/17 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ROSIANA ARIYANI', 'TRI NURCAHYO', '082257478184', 1, 6, 'PERUM BLURU PERMAI ED/17 SIDOARJO', 'PERUM BLURU PERMAI ED/17 SIDOARJO', 0, 0, 0),
(148, '02193', 'RAMA ADITYA PUTRA WARDOYO', 1, 3, 'JL. SONO INDAH BUDURAN SIDOARJO', 0, '1', 1, 'MOJOKERTO', '0000-00-00', 'RETNO SANTI UTAMI', 'MARDOYO', '082159813376', 1, 6, 'JL. SONO INDAH BUDURAN SIDOARJO', 'JL. SONO INDAH BUDURAN SIDOARJO', 0, 0, 0),
(149, '02194', 'REBECCA ALEXANDRA NAYARA', 1, 3, 'PERUMDA JENGGOLO 1 BLOK E NO.7', 0, '2', 1, 'SURABAYA', '0000-00-00', 'ANGGUN MESSAYU RATNA CITRA', 'FATHUR ROCHAM ', '081230006065', 1, 6, 'PERUMDA JENGGOLO 1 BLOK E NO.7', 'PERUMDA JENGGOLO 1 BLOK E NO.7', 0, 0, 0),
(150, '02195', 'REVALINDRA HAWA WANANDRIYA', 1, 3, 'PERUM BLURU PERMAI HX-20 SIDOARJO', 0, '2', 1, 'MAGETAN', '0000-00-00', 'HARIYATI', 'WAWAN HADI PRIYANTO', '085707182153', 1, 6, 'PERUM BLURU PERMAI HX-20 SIDOARJO', 'PERUM BLURU PERMAI HX-20 SIDOARJO', 0, 0, 0),
(151, '02196', 'RIZQINA NAZWA TIUR APRILIYA', 1, 3, 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IKA APRILIYANTI', 'MUHAMAD MUFRODI', '085730027608', 1, 6, 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 'Jl. MANGGA 251 11/2 SRUNI GEDANGAN', 0, 0, 0),
(152, '02197', 'SATRIA NANDA YULIANSYAH', 1, 3, 'KWADENGAN 02/01 LEMAHPUTRO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'BINTI ALKANA SARI', 'KARIADI', '081332069354', 1, 9, 'KWADENGAN 02/01 LEMAHPUTRO', 'KWADENGAN 02/01 LEMAHPUTRO', 0, 0, 0),
(153, '02198', 'SHEVA RIZQ ATHALLAH', 1, 3, 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SRI HARYATI', 'KHALIMI', '085648585513', 1, 6, 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 'KAHURIPAN BLOK AB7/3 13/06 CEMENGKALANG', 0, 0, 0),
(154, '02199', 'TIGRIS WIRYA NANDITA', 1, 3, 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 0, '1', 1, 'MADIUN', '0000-00-00', 'SUSIYAM', 'MARIKA LISTYA', '085231861758', 1, 9, 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 'PERUM PARK ROYAL REGENCY BLOK H2 NO.17', 0, 0, 0),
(155, '02200', 'WILDAN MAULANA ISHOM PUTRA', 1, 3, 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 0, '1', 1, 'SURABAYA', '0000-00-00', 'NUR KUSUMA DEWI', 'RENY I''TISHOM', '08121644432', 1, 9, 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 'PONDOK MUTIARA REGENCY BLOK MEJ-28 SIDOARJO', 0, 0, 0),
(156, '02201', 'ZUHAY LAILATUS SARIFAH', 1, 3, 'KLOPO SEPULUH 05/01 SUKODONO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'LAILATUL QODRIYAH', 'ULIL AMROZIK', '082233743699', 1, 6, 'KLOPO SEPULUH 05/01 SUKODONO', 'KLOPO SEPULUH 05/01 SUKODONO', 0, 0, 0),
(157, '02202', 'ACHMAD FAIZ AFRIYANTO', 1, 3, 'ANGGASWANGI 05/03', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SRI UTAMI', 'SYAIFUL HARIYANTO', '085850261142', 1, 6, 'ANGGASWANGI 05/03', 'ANGGASWANGI 05/03', 0, 0, 0),
(158, '02203', 'ADITYA ANANTA PUTRA SUHERMANTO', 1, 3, 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'WIWIN MARDIANA', 'ONNY SUHERMANTO', '082245561567', 1, 6, 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 'KEBOAN ANOM RT.01/08 KEBOAN ANOM GEDANGAN', 0, 0, 0),
(159, '02204', 'AHMAD HARDANI', 1, 3, 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'HARTATIK', 'CHOIRIL ANWAR', '081216348585', 1, 9, 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 'Jl. KERTANEGARA 02/12 SAWOTRATAP', 0, 0, 0),
(160, '02205', 'ALDY YONANDA', 1, 3, 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YANI MARYANI', 'AGUS YULIANTO', '081703587897', 1, 6, 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 'Jl. PAHLAWAN LEMAH ASIN GEDANGAN', 0, 0, 0),
(161, '02206', 'ALVIVATURROHMAH', 1, 3, 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 0, '2', 1, 'MALANG', '0000-00-00', 'LISTINAWATI', 'ROBIL', '0', 1, 6, 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 'Jl.DEMANG SINGOMENGGOLO 6/2 SIDOMULYO', 0, 0, 0),
(162, '02207', 'ANDRI DWI CAHYONO', 1, 3, 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'YUTI PURBADINENGTIAS', 'SOFIONO', '081330620068', 1, 9, 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 'KWADENGAN BARAT 142 02/01 LEMAH PUTRO', 0, 0, 0),
(163, '02208', 'ARDHYA RIZKY AYU PALUPI', 1, 3, 'GADING FAJAR I A1/3 BUDURAN', 0, '2', 1, 'MALANG', '0000-00-00', 'RENNY SUS DANARYANTI', 'BASUKI SURYANDORO', '08999880001', 1, 9, 'GADING FAJAR I A1/3 BUDURAN', 'GADING FAJAR I A1/3 BUDURAN', 0, 0, 0),
(164, '02209', 'AULIA RISKA SALSABILA', 1, 3, 'BULUSIDOKARE 03/01 SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ELIYAH ROMZAH', 'BAMBANG HENDRO WIKIYONO', '085649416519', 1, 5, 'BULUSIDOKARE 03/01 SIDOARJO', 'BULUSIDOKARE 03/01 SIDOARJO', 0, 0, 0),
(165, '02210', 'BAGAS FIRMAN AGFANSYAH', 1, 3, 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 0, '1', 1, 'JEMBER', '0000-00-00', 'NANIK IKE YULIANTI', 'YUDI AMIARTO', '081331160983', 1, 9, 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 'Jl. RAYA CANDI Rt 12 Rw 03 CANDI', 0, 0, 0),
(166, '02211', 'BETRAND ZICO LUCKYANTO', 1, 3, 'GADING KIRANA ESTATE BLOK L/10', 0, '1', 1, 'JAKARTA', '0000-00-00', 'NURHAYATI', 'YUNUS RENGGANA', '081298275500', 1, 6, 'GADING KIRANA ESTATE BLOK L/10', 'GADING KIRANA ESTATE BLOK L/10', 0, 0, 0),
(167, '02212', 'CINTA ANGELITA ANASTASYA PUTRI', 1, 3, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, '2', 2, 'SIDOARJO', '0000-00-00', 'CHAYYUL KOYYUM', 'ARI TRI SUSANTO', '081234420389', 1, 9, 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 'DSN SONO RT.03 RW.04 SIDOKERTO BUDURAN-SIDOARJO', 0, 0, 0),
(168, '02213', 'DIVA LAPIRSA AYU NAYLA', 1, 3, 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'NOVA DIANA SARI, S.Pd', 'BUDI SETIONO, SH', '082234104199', 1, 99, 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 'PERUM PUCANG INDAH BLOK P-5 24/06 SDA', 0, 0, 0),
(169, '02214', 'ESA ALLIANT', 1, 3, 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'BOJONEGORO', '0000-00-00', 'SITI KHOLIPAH', 'AGUS SUPRIANTO', '085748115681', 1, 12, 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 'SUKOREJO RT.03 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(170, '02215', 'FATHUR RACHMAN HAKIM', 1, 3, 'Ds. MLATEN 26/06 SIDOKEPUNG', 0, '1', 1, 'BANYUWANGI', '0000-00-00', 'RUKIATI', 'SUGIONO', '082115854800', 1, 6, 'Ds. MLATEN 26/06 SIDOKEPUNG', 'Ds. MLATEN 26/06 SIDOKEPUNG', 0, 0, 0),
(171, '02216', 'GABRIEL FEBRIAN ARYA WIDODIK', 1, 3, 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 0, '1', 3, 'SIDOARJO', '0000-00-00', 'IRENE CATUR RINI WIDYA R', 'V. SONY WIDODIK', '083830083676', 1, 6, 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 'Jl. SENTANA KALI NO.15 10/05 TEBEL', 0, 0, 0),
(172, '02217', 'HERY INDRAWAN', 1, 3, 'TEBEL TIMUR 02/07 GEDANGAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUMINI', 'ACH. NUR MUSA (Alm)', '085230769889', 1, 6, 'TEBEL TIMUR 02/07 GEDANGAN', 'TEBEL TIMUR 02/07 GEDANGAN', 0, 0, 0),
(173, '02218', 'ISMI RAHMAWATI PASHA SANJAYA', 1, 3, 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 0, '2', 1, 'SURABAYA', '0000-00-00', 'NILA SETYA WATI', 'ROMI DHIMAS SANJAYA', '081230753022', 1, 6, 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 'JL. RAYA KEMIRI 37 RT.07 RW.03 BUDURAN-SIDOARJO', 0, 0, 0),
(174, '02219', 'KAMILIYA RUVIANTI', 1, 3, 'Jl. RAYA PECANTINGAN SEKARDANGAN', 0, '2', 1, 'SURABAYA', '0000-00-00', 'YUVI SANTIKO', 'RUSDIYANTO', '082281808376', 1, 5, 'Jl. RAYA PECANTINGAN SEKARDANGAN', 'Jl. RAYA PECANTINGAN SEKARDANGAN', 0, 0, 0),
(175, '02220', 'LENY CAHYA NINGTIAS', 1, 3, 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'LULUK STIALIS STIANINGSIH', 'SUJIONO', '081234425117', 1, 9, 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 'JL. HANG TUAH I NO. 66 17/06 SIDOKLUMPUK', 0, 0, 0),
(176, '02221', 'MARCHEL STEVE FERNANDO SONDANG', 1, 3, 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 0, '1', 2, 'SIDOARJO', '0000-00-00', 'BUDI SRI WINARSIH', 'JUNIMUS SONDANG', '082330852133', 1, 5, 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 'ASRAMA YON ARHANUD SE 8 RT.02/04 SRUNI GEDANGAN', 0, 0, 0),
(177, '02222', 'MAYZENDHY PUTRA ARINDA', 1, 3, 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'RINDAYANI', 'AGUNG SETIYO HARIONO', '087702881280', 1, 6, 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 'PERUM BELLAVISTA AY 136 RT.07 RW.07 GEBANG ', 0, 0, 0),
(178, '02223', 'MOCH. RISKY DIAN FERDIANSYAH', 1, 3, 'Jl. JENGGOLO III 13/03 PUCANG', 0, '1', 1, 'LAMONGAN', '0000-00-00', 'UMI HANIK', 'SUTAJI', '089667833245', 1, 9, 'Jl. JENGGOLO III 13/03 PUCANG', 'Jl. JENGGOLO III 13/03 PUCANG', 0, 0, 0),
(179, '02224', 'MOHAMMAD AFANDI', 1, 3, 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI WELAS ATI', 'TASMUN', '082132262142', 1, 6, 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 'SIDOKEPUNG RT.18 RW.04 BUDURAN-SIDOARJO', 0, 0, 0),
(180, '02225', 'MUHAMMAD ADITYA ROMADHON', 1, 3, 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'PARYANTI', 'HERU PITONO', '081330566680', 1, 9, 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 'BANJARSARI RT 12/RW 03, BUDURAN, SIDOARJO', 0, 0, 0),
(181, '02226', 'MUHAMMAD BRILLIAN FERDIYANSAH', 1, 3, 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 0, '1', 1, 'JOMBANG', '0000-00-00', 'NURHANI MULYATI', 'USMAN', '081330766101', 1, 6, 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 'OMA PESONA BUDURAN BLOK I/3 NO.2 RT.38/07', 0, 0, 0),
(182, '02227', 'MUHAMMAD RISKY ARIYANTO PUTRA', 1, 3, 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SOEHARTININGTYAS', 'INDRIJANTO', '083854453510', 1, 6, 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 'PERUM TRUS RESIDENCE BLOK D/6 14/07 BLURU KIDUL ', 0, 0, 0),
(183, '02228', 'NABILAH ARDELIA ARIANTO', 1, 3, 'PAGERWOJO 15/04 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'RISALATUN NISA', 'NANANG ARIANTO', '081216537778', 1, 6, 'PAGERWOJO 15/04 BUDURAN', 'PAGERWOJO 15/04 BUDURAN', 0, 0, 0),
(184, '02229', 'NAYLA KIRANA MAHESWARI', 1, 3, 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 0, '2', 1, 'MALANG', '0000-00-00', 'FEBRIANA SETIA MAHARANI', 'DADONG WAHYU PURNOMO', '081330607077', 1, 6, 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 'PERUM SURYA REGENCY BLOK B1 20/03 SRUNI GEDANGAN', 0, 0, 0),
(185, '02230', 'NUR AZIZAH', 1, 3, 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'INDRIANI', 'NANANG KOSIM', '085234395169', 1, 6, 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 'KREMBANGAN RT.26 RW.05 SIDOKUMPUL-SIDOARJO', 0, 0, 0),
(186, '02231', 'PUTRI PUSPITA ILLIYIL', 1, 3, 'BANJARKEMANTREN 10/02 BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'YAYUK SULISWARI', 'TONI SETIAWAN (Alm)', '', 1, 6, 'BANJARKEMANTREN 10/02 BUDURAN', 'BANJARKEMANTREN 10/02 BUDURAN', 0, 0, 0);
INSERT INTO `student_mahasiswa` (`mahasiswa_id`, `nim`, `nama`, `prodi_id`, `angkatan_id`, `alamat`, `semester`, `gender`, `agama_id`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `no_hp_ortu`, `pekerjaan_id_ibu`, `pekerjaan_id_ayah`, `alamat_ayah`, `alamat_ibu`, `penghasilan_ayah`, `penghasilan_ibu`, `semester_aktif`) VALUES
(187, '02232', 'RAMA DINATA PHINASTIKA', 1, 3, 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUSNAENI', 'DIDIK SUDARSONO', '085102760466', 1, 6, 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 'JL.DEMANG SINGO MENGGOLO RT.04/02 SIDOMULYO BUDURAN-SIDOARJO', 0, 0, 0),
(188, '02233', 'REFINA EKA SAPUTRI', 1, 3, 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'IDA INDAYATI', 'IWAN SEPARTU', '085732093155', 1, 6, 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 'DUSUN KELING RT.13 R.04 JUMPUTREJO-SUKODONO', 0, 0, 0),
(189, '02234', 'REZA CHOIRUDIN DIVASYA', 1, 3, 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SITI MUARIFAH', 'SUGENG BUDI HARIJOTO', '081216811137', 1, 5, 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 'Jl. CITRA KRACIL 05/01 SIDOPURNO BUDURAN', 0, 0, 0),
(190, '02235', 'ROINALDO', 1, 3, 'ENTALSEWU 10/03 BUDURAN', 0, '1', 1, 'TUBAN', '0000-00-00', 'SULASTRI', 'PURWANTO', '089534056633', 1, 11, 'ENTALSEWU 10/03 BUDURAN', 'ENTALSEWU 10/03 BUDURAN', 0, 0, 0),
(191, '02236', 'SATRIO ADITYA SAPUTRA', 1, 3, 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 0, '1', 1, 'SIDOARJO', '0000-00-00', 'SUMIATIN', 'MANGUN', '', 1, 9, 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 'JL KH KHAMDANI SIWALANPANJI RT.03 RW.01 BUDURAN-SIDOARJO', 0, 0, 0),
(192, '02237', 'SILFIA AINUR ROCHMA', 1, 3, 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SUSI TRI RACHMAWATI', 'MOCH. KHOTIM DL GHOZI', '081246403885', 1, 7, 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 'JL PAHLAWAN TIGA NO. 37 RT. 30 RW.06 SIDOKUMPUL SIDOARJO', 0, 0, 0),
(193, '02238', 'TIARA VANEZA ANGELINA', 1, 3, 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'ANIK WIJAYA WARAS', 'HENDRA L', '081357805190', 1, 6, 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 'PERUM GADING FAJAR 1 BLOK B5 NO.47 SIWALANPANJI BUDURAN-SIDOARJO', 0, 0, 0),
(194, '02239', 'YUDARSONO', 1, 3, 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 0, '1', 1, 'NGAWI', '0000-00-00', 'SUPITRIANI', 'SIPITUNG', '081216348319', 1, 9, 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 'PERUM MAGERSARI PERMAI RT.32 RW.07 MAGERSARI-SIDOARJO', 0, 0, 0),
(195, '02240', 'ZULFIKA NAULA SHAFA', 1, 3, 'Jl. ERLANGGA 18/06 CELEP', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'MAZRO''ATUL ILMIYAH', 'ABDUL ADHIM', '087854023300', 1, 9, 'Jl. ERLANGGA 18/06 CELEP', 'Jl. ERLANGGA 18/06 CELEP', 0, 0, 0),
(196, '03000', 'BELLA SEPTYA PUTRI YAHYA', 1, 3, 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 0, '2', 1, 'SIDOARJO', '0000-00-00', 'SRI RAHAYU', '-', '-', 1, 6, 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 'Gg GALANGAN Rt 15 Rw 4 ENTALSEWU BUDURAN', 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id_submenu`, `id_mainmenu`, `nama_submenu`, `link`, `aktif`, `icon`, `level`) VALUES
(10, 26, 'siswa', 'mahasiswa', 'y', 'fa fa-group', 1),
(20, 26, 'jenis pembayaran', 'jenisbayar', 'y', 'fa fa-puzzle-piece', 1),
(21, 26, 'biaya sekolah', 'setupbiayakuliah', 'y', 'fa fa-money', 1),
(79, 29, 'form pembayaran', 'keuangan/pembayaran', 'y', 'fa fa-coins', 1),
(82, 29, 'laporan keuangan', 'keuangan/laporan', 'y', 'fa fa-notes_2', 1),
(89, 26, 'tahun angkatan', 'tahunangkatan', 'y', 'fa fa-calendar', 0),
(91, 41, 'form pembayaran', 'keuangan/pembayaran', 'y', 'fa fa-coins', 2),
(92, 41, 'laporan keuangan', 'keuangan/laporan', 'y', 'fa fa-notes_2', 2);

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
-- Indexes for table `student_mahasiswa`
--
ALTER TABLE `student_mahasiswa`
 ADD PRIMARY KEY (`mahasiswa_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
 ADD PRIMARY KEY (`id_submenu`);

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
MODIFY `biaya_kuliah_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `keuangan_jenis_bayar`
--
ALTER TABLE `keuangan_jenis_bayar`
MODIFY `jenis_bayar_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `keuangan_pembayaran`
--
ALTER TABLE `keuangan_pembayaran`
MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_pembayaran_detail`
--
ALTER TABLE `keuangan_pembayaran_detail`
MODIFY `pembayara_detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `mainmenu`
--
ALTER TABLE `mainmenu`
MODIFY `id_mainmenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
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
MODIFY `angkatan_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `student_mahasiswa`
--
ALTER TABLE `student_mahasiswa`
MODIFY `mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;--
-- Database: `cdcol`
--

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
`id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Database: `complaint`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas`) VALUES
('7C');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
`id_laporan` int(5) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tgl_upload` date NOT NULL,
  `diupload` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `isi_laporan`, `tgl_upload`, `diupload`) VALUES
(44, 'aaaa', '2017-02-19', 'reza'),
(45, 'sdfag', '2017-02-19', 'reza'),
(46, 'aaaa', '2017-02-19', 'reza'),
(49, 'ghsyg', '2017-02-19', 'reza123');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `kelas`, `jk`, `telp`) VALUES
('reza', 'reza', 'Reza Cahyanto', '7C', 'L', ''),
('reza123', 'reza123', 'Reza123', '7C', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
 ADD PRIMARY KEY (`id_laporan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
MODIFY `id_laporan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;--
-- Database: `crudsederhana`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
`id` int(11) NOT NULL,
  `nim` char(8) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `fakultas` varchar(50) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `ipk` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `datasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `datasiswa`
--

CREATE TABLE IF NOT EXISTS `datasiswa` (
  `NIS` int(6) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datasiswa`
--

INSERT INTO `datasiswa` (`NIS`, `Nama`) VALUES
(1020, 'Anton'),
(1021, 'Siti');
--
-- Database: `db_complaint`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas`) VALUES
('A1'),
('A2'),
('A3'),
('A4'),
('B1'),
('B2'),
('B3'),
('B4');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
`id_laporan` int(5) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tgl_upload` date NOT NULL,
  `diupload` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `isi_laporan`, `tgl_upload`, `diupload`) VALUES
(54, 'Wifi Gd Informatika tidak bisa', '2017-02-27', 'heni'),
(56, 'UMSIDA', '2017-02-27', 'arum');

-- --------------------------------------------------------

--
-- Table structure for table `smt`
--

CREATE TABLE IF NOT EXISTS `smt` (
  `smt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smt`
--

INSERT INTO `smt` (`smt`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `smt` int(11) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `smt`, `kelas`, `jk`, `telp`) VALUES
('arum', '12345', 'Arum Sari', 2, 'A2', 'P', '098786764563'),
('heni', 'bismillah', 'Heni Arum Sari ', 6, 'B2', 'P', '083928400486'),
('hida', '1', 'Muhammad Rijal Hiday', 2, 'B2', 'L', '087702700466');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
 ADD UNIQUE KEY `kelas` (`kelas`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
 ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `smt`
--
ALTER TABLE `smt`
 ADD UNIQUE KEY `smt` (`smt`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
MODIFY `id_laporan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;--
-- Database: `db_pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar pengaduan`
--

CREATE TABLE IF NOT EXISTS `daftar pengaduan` (
`ID` int(11) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `ALAMAT` varchar(50) NOT NULL,
  `NO TELP` varchar(20) NOT NULL,
  `KECAMATAN` enum('Balongbendo','Buduran','Candi','Gedangan','Jabon','Krembung','Krian','Prambon','Porong','Sedati','Sidoarjo','Sukodono','Taman','Tanggulangin','Tarik','Tulangan','Waru','Wonoayu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar pengaduan`
--
ALTER TABLE `daftar pengaduan`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar pengaduan`
--
ALTER TABLE `daftar pengaduan`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `dbevent`
--

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `emai` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblabsen`
--

CREATE TABLE IF NOT EXISTS `tblabsen` (
  `id_absen` int(1) NOT NULL,
  `id_event` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `waktu` datetime NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbldaftar`
--

CREATE TABLE IF NOT EXISTS `tbldaftar` (
  `id_daftar` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblevent`
--

CREATE TABLE IF NOT EXISTS `tblevent` (
  `id_event` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `acc1` varchar(50) NOT NULL,
  `acc2` varchar(50) NOT NULL,
  `pelaksana` varchar(50) NOT NULL,
  `id_tempat` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `harga` varchar(15) NOT NULL,
  `dekripsi` varchar(200) NOT NULL,
  `poster` varchar(500) NOT NULL,
  `flagevent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbljenis`
--

CREATE TABLE IF NOT EXISTS `tbljenis` (
  `jenis` varchar(6) NOT NULL,
  `grade` varchar(30) NOT NULL,
  `peran` varchar(20) NOT NULL,
  `nama_organisasi` varchar(30) NOT NULL,
  `point` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmhs`
--

CREATE TABLE IF NOT EXISTS `tblmhs` (
  `nim` varchar(15) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jurusan` varchar(5) NOT NULL,
  `jenjang` char(1) NOT NULL,
  `tahun_masuk` int(4) NOT NULL,
  `password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblorganisasi`
--

CREATE TABLE IF NOT EXISTS `tblorganisasi` (
  `id_organisasi` int(11) NOT NULL,
  `nama_organisasi` varchar(20) NOT NULL,
  `rekening` varchar(20) NOT NULL,
  `no_hp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpembayaran`
--

CREATE TABLE IF NOT EXISTS `tblpembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_daftar` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `waktu` datetime NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `bukti` varchar(500) NOT NULL,
  `beritaacara` varchar(200) NOT NULL,
  `flagkeuangan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbltempat`
--

CREATE TABLE IF NOT EXISTS `tbltempat` (
  `id_tempat` int(11) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `gedung` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `kapasitas` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_organisasi` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` varchar(5) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblabsen`
--
ALTER TABLE `tblabsen`
 ADD PRIMARY KEY (`id_absen`), ADD KEY `id_event` (`id_event`), ADD KEY `nim` (`nim`);

--
-- Indexes for table `tbldaftar`
--
ALTER TABLE `tbldaftar`
 ADD PRIMARY KEY (`id_daftar`), ADD KEY `nim` (`nim`);

--
-- Indexes for table `tblevent`
--
ALTER TABLE `tblevent`
 ADD PRIMARY KEY (`id_event`), ADD KEY `id` (`id`), ADD KEY `id_tempat` (`id_tempat`);

--
-- Indexes for table `tbljenis`
--
ALTER TABLE `tbljenis`
 ADD PRIMARY KEY (`jenis`);

--
-- Indexes for table `tblmhs`
--
ALTER TABLE `tblmhs`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tblorganisasi`
--
ALTER TABLE `tblorganisasi`
 ADD PRIMARY KEY (`id_organisasi`);

--
-- Indexes for table `tblpembayaran`
--
ALTER TABLE `tblpembayaran`
 ADD PRIMARY KEY (`id_pembayaran`), ADD KEY `id_daftar` (`id_daftar`);

--
-- Indexes for table `tbltempat`
--
ALTER TABLE `tbltempat`
 ADD PRIMARY KEY (`id_tempat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD KEY `id_organisasi` (`id_organisasi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblabsen`
--
ALTER TABLE `tblabsen`
ADD CONSTRAINT `tblabsen_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tblevent` (`id_event`),
ADD CONSTRAINT `tblabsen_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `tblmhs` (`nim`);

--
-- Constraints for table `tbldaftar`
--
ALTER TABLE `tbldaftar`
ADD CONSTRAINT `tbldaftar_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tblmhs` (`nim`);

--
-- Constraints for table `tblevent`
--
ALTER TABLE `tblevent`
ADD CONSTRAINT `tblevent_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `tblevent_ibfk_2` FOREIGN KEY (`id_tempat`) REFERENCES `tbltempat` (`id_tempat`);

--
-- Constraints for table `tblpembayaran`
--
ALTER TABLE `tblpembayaran`
ADD CONSTRAINT `tblpembayaran_ibfk_1` FOREIGN KEY (`id_daftar`) REFERENCES `tbldaftar` (`id_daftar`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_organisasi`) REFERENCES `tblorganisasi` (`id_organisasi`);
--
-- Database: `dblokomedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
`id_agenda` int(5) NOT NULL,
  `tema` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tema_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_agenda` text COLLATE latin1_general_ci NOT NULL,
  `tempat` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pengirim` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `tgl_posting` date NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `tema`, `tema_seo`, `isi_agenda`, `tempat`, `pengirim`, `tgl_mulai`, `tgl_selesai`, `tgl_posting`, `username`) VALUES
(30, 'Seminar "Membangun Portal Berita ala Detik.com"', 'seminar-membangun-portal-berita-ala-detikcom', 'Seminar ini akan membahas tentang konsep, proses, dan implementasi dalam membangun portal berita sekelas detik.com.<br>', 'Lab. Universitas Atmajaya Yogyakarta', 'HMJ TI (081843092580)', '2009-03-14', '2009-03-14', '2009-01-31', 'admin'),
(31, 'Bedah Buku "Membongkar Trik Rahasia Master PHP"', 'bedah-buku-membongkar-trik-rahasia-master-php', 'Acara bedah buku terbaru dari Lukmanul Hakim yang berjudul Membongkar Trik Rahasia Para Master PHP.<br>', 'Masih dalam konfirmasi', 'Enda (08192839849)', '2009-03-28', '2009-03-28', '2009-01-31', 'admin'),
(29, 'Workshop "3 Hari Menjadi Master PHP"', 'workshop-3-hari-menjadi-master-php', 'Workshop ini bertujuan untuk bla .. bla .. bla<br>', 'Jogja Expo Center', 'Adi (081893274848)', '2009-02-21', '2009-02-23', '2009-01-31', 'admin'),
(36, 'Workshop "VBA Programming for Excel"', 'workshop-vba-programming-for-excel', 'Tes<br><br>Pukul : 09.00 s/d 16.00 WIB<br>', 'Lab. Pusat Komputer UII', 'Aci (08189320984)', '2009-10-29', '2009-10-29', '2009-10-26', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
`id_album` int(5) NOT NULL,
  `jdl_album` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `album_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gbr_album` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `jdl_album`, `album_seo`, `gbr_album`) VALUES
(21, 'Kartun', 'kartun', '476928sonic.jpg'),
(20, 'Pernikahan', 'pernikahan', '146667nikah.jpg'),
(18, 'Bayi', 'bayi', '246551silvestree.jpg'),
(12, 'Ilustrator', 'ilustrator', '987701family.jpg'),
(19, 'Binatang', 'binatang', '391479burung.jpg'),
(17, 'Arsitektur', 'arsitektur', '741638arche090.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
`id_banner` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id_banner`, `judul`, `url`, `gambar`, `tgl_posting`) VALUES
(4, 'Fresh Book', 'http://freshbooks.com', 'freshbook.jpg', '2009-02-05'),
(7, 'Cinema 21', 'http://21cineplex.com', 'cinema21.jpg', '2008-02-09');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE IF NOT EXISTS `berita` (
`id_berita` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `judul_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_berita` text COLLATE latin1_general_ci NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT '1',
  `tag` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=97 ;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `id_kategori`, `username`, `judul`, `judul_seo`, `isi_berita`, `hari`, `tanggal`, `jam`, `gambar`, `dibaca`, `tag`) VALUES
(76, 23, 'joko', 'Laskar Pelangi Pecahkan Rekor', 'laskar-pelangi-pecahkan-rekor', 'Sukses film Laskar Pelangi dalam memecahkan rekor jumlah penonton memberi pembelajaran bahwa penonton film Indonesia bisa menerima inovasi. Mira Lesmana dari Miles Films yang memproduksi film ini mengatakan, sampai Rabu (12/11), pemutaran Laskar Pelangi di 100 layar bioskop di 25 kota menyedot lebih dari 4,4 juta penonton. Padahal, Kamis kemarin, jumlah kota yang memutar film itu bertambah dengan Padang, Tasikmalaya, dan Ambon. Sebelumnya, Ayat-ayat Cinta ditonton 3,7 juta penonton (Kompas, 26/10).<br><br>Jumlah penonton itu belum termasuk penonton layar tancap untuk menjangkau penonton di daerah yang belum memiliki gedung bioskop.<br><br>Menurut Mira, layar tancap di tiga lokasi di Belitung, tempat cerita berlokasi, menyedot penonton lebih dari 60.000 penonton dan di Bangka sekitar 80.000-an orang. Pemutaran layar tancap juga dilakukan di Rantau (Sumatera Utara) dan akan dilakukan di Natuna, Aceh (enam lokasi), Lombok, serta Papua di Timika, Sorong, dan Jayapura.<br><br>Kabar gembira lainnya, film ini menjadi salah satu film yang terpilih untuk menjadi bagian dari Berlin International Film Festival atau Berlinale 2009. Festival ini adalah sebuah peristiwa budaya terpenting di Jerman yang juga adalah salah satu festival film internasional paling bergengsi di dunia.<br><br>Film Laskar Pelangi diangkat dari novel berjudul sama karya Andrea Hirata. Film ini mengangkat realitas sosial masyarakat Belitung, tentang persahabatan, kegigihan dan harapan, dalam bingkai kemiskinan dan ketimpangan kelas sosial.<br><br>"Jumlah penonton dan panjangnya masa pemutaran film sejak 25 September memperlihatkan penonton butuh sesuatu yang baru, yang inovatif, walau yang ditampilkan realitas tidak gemerlap," papar Mira.<br><br>Selama ini, kebanyakan film Indonesia bertema drama cinta, horor, dan komedi, sementara Miles Films dalam empat film terakhirnya menggarap tema realisme sosial-politik.<br><br>Mira mengakui, inovasi itu tidak selalu berhasil secara komersial. Contohnya Gie, juga produksi Miles Films. Meskipun dari sisi kritik film dan kreativitas bagus, tetapi tidak sesukses Laskar Pelangi dalam pemasaran.<br><br>Produksi film ini menghabiskan biaya Rp 9 miliar dan 90 persen dikerjakan di dalam negeri. "Sound mixing dengan sistem Dolby dan transfer optis untuk suara belum bisa dikerjakan di dalam negeri," ujar Mira.<br><br>Miles Films dan para investor, antara lain Mizan Publishing, kini bersiap memproduksi lanjutan Laskar Pelangi. Sang Pemimpi adalah bagian novel tetralogi Andrea Hirata. (sumber: kompas.com)<br>', 'Minggu', '2009-02-01', '14:31:58', '76laskarpelangi.jpg', 9, 'laskar-pelangi'),
(69, 22, 'admin', 'Gelombang Solidaritas untuk Palestina', 'gelombang-solidaritas-untuk-palestina', 'Serangan Israel kepada Palestina yang terjadi mulai akhir Desember 2008 silam telah menewaskan hampir seribu nyawa manusia. Warga sipil yang kebanyakan perempuan dan anak-anak menjadi korban keganasan tentara Israel. Warga dunia pun marah. Saat ini, hampir setiap hari sejumlah unjuk rasa mengecam kebiadaban Israel terjadi di seluruh belahan dunia. Kejahatan Israel adalah kejahatan kemanusiaan dan sudah menjadi isu bersama umat manusia.<br><br>Kecaman tidak hanya datang dari umat Islam, tapi juga dari umat agama lain. Lihat saja sejumlah biksu yang tergabung dalam Perwakilan Umat Buddha Indonesia (Walubi), kemudian Persatuan Tionghoa Indonesia serta Dewan Pemuda Kristen Indonesia.<br><br>Mereka semua ikut berpatisipasi dalam aksi solidaritas untuk Palestina yang dilaksanakan di lapangan Monas, Jakarta Ahad (11/1/2009) lalu. Mereka mengutuk kebiadaban Israel. (sumber: sabili.co.id)<br>', 'Sabtu', '2009-01-31', '14:34:18', '11solidaritas.jpg', 10, 'gaza,israel,palestina'),
(78, 2, 'wiro', 'Cristiano Ronaldo Pemain Sepakbola Terbaik 2008', 'cristiano-ronaldo-pemain-sepakbola-terbaik-2008', 'Cristiano Ronaldo akhirnya terpilih sebagai Pemain Terbaik Dunia versi FIFA, mengalahkan Lionel Messi (Barcelona), dan Fernando Torres (Liverpool). Penetapan itu diumumkan di Zurich, Swiss, Senin atau Selasa (13/1) dini hari. Ronaldo menjadi pemain pertama dari Premier League yang menerima penghargaan itu. Sebelumnya, dia juga terpilih sebagai Pemain Terbaik Eropa (Ballon d''Or) dan baru saja dinobatkan sebagai Pemain Terbaik Dunia versi suporter.<br><br>Pemain Manchester United (MU) asal Portugal itu meraih 935 pemilih dari poling yang disebar ke seluruh dunia. Pemilihnya hanya dibatasi kapten tim dan pelatih. Hasil itu diumumkan oleh pemain legendaris Brasil, Pele.<br><br>Sementara itu, Lionel Messi berada di tempat kedua. Pemain Barcelona asal Argentina itu meraih 678 suara. Adapun striker Liverpool asal Spanyol, Fernando Torres, berada di tempat ketiga dengan 203 suara.<br><br>Musim lalu, Ronaldo memang tampil bagus. Dia mencetak 42 gol dan membawa Manchester United merebut gelar Premier League dan Liga Champions.<br><br>"Ini momen yang sangat indah buatku. Momen spesial dalam hidupku. Aku ingin mengatakan kepada ibu dan saudara perempuanku bahwa kembang api sudah saatnya disulut," kata Ronaldo seusai menerima penghargaan itu. (sumber: detiksport.com)<br>', 'Senin', '2009-02-02', '14:36:34', '92cristianoronaldo.jpg', 12, 'sepakbola'),
(71, 2, 'admin', 'Ronaldo "CR7" Pecahkan Transfer Termahal', 'ronaldo-cr7-pecahkan-transfer-termahal', 'Cristiano Ronaldo segera menjadi pemain termahal dunia, menumbangkan rekor Zinedine Zidane. Agen Ronaldo menyebut bahwa kliennya terikat pra kontrak 91 juta poundsterling dengan Real Madrid. Dengan transfer senilai Rp 1,5 triliun itu, maka CR7 dipastikan akan menjadi pemain termahal dunia. Tapi, itu mungkin baru terealisasi musim depan alias musim panas nanti.<br><br>Sport melansir bahwa Pemain Terbaik Dunia 2008 itu terikat kontrak dengan Madrid untuk jangka panjang. Bahkan, juga disebutkan bahwa agen Ronaldo, Jorge Mendes, akan terkena klausul penalti (penalty clause) 20 juta euro (18 juta pounds) jika Ronaldo tak hadir di Santiago Bernabeu, musim depan.<br><br>Sebelumnya, pemain berusia 23 tahun ini dikabarkan juga terikat kontrak dengan mantan presiden Madrid, Florentino Perez. Ronaldo akan menjadi alat kampanye Perez dalam pemilihan presiden Madrid, pertengahan Juli 2009.<br><br>Rekor pemain termahal dunia kini masih dipegang Zinedine Zidane dengan 46 juta poundsterling pada 2001. Perez juga menjadi aktor di balik kedatangan maestro asal Prancis itu dari Juventus ke Madrid.<br><br>Demikian juga runner up pemain termahal dunia, Luis Figo. Perez membajaknya dari rival bebuyutan Barcelona pada 2000 dengan nilai 38,7 juta pounds. Saat itu, Figo juga jadi alat kampanye Perez. (sumber: vivanews.com)<br>', 'Sabtu', '2009-01-31', '14:41:25', '97cristiano-ronaldo.jpg', 30, 'sepakbola'),
(72, 21, 'admin', 'Belajar Dari Krisis Amerika', 'belajar-dari-krisis-amerika', 'Ibarat karena nila setitik, rusak susu sebelanga. Dan di kolam susu inilah tampaknya warga dunia tengah menunggu kapan giliran nila itu datang yang akan benar-benar melumpuhkan sendi perekonomian di negaranya masing-masing, tak terkecuali kita di Indonesia.<br><br>Dan kini kita paham bahwa kondisi yang cukup serius kali ini memang awalnya bermula dari krisis nasional di AS, yang kemudian menyebar dengan cepat ke seluruh dunia. Namun jelas bahwa ia bukanlah penyebab utamanya seperti yang dituding oleh sejumlah media (lihat ''Runtuhnya Pusat Kapitalisme'', Editorial Harian Radar Bogor, 27/09/08).<br><br>Yang menjadi benang merah dari rentetan krisis ini justru adalah penerapan globalisasi dimana roda perekonomian banyak negara di dunia digantungkan. Sebab dalam sistem ekonomi global yang tengah dipraktikkan banyak negara saat ini, krisis yang dialami suatu negara akan menular bak virus ke negara-negara lain, khususnya bila krisis itu bermula dari negara-negara maju dan yang punya otoritas dalam peta perkonomian dunia.<br><br>Meski belum memiliki definisi yang mapan, istilah globalisasi banyak dihubungkan dengan peningkatan keterkaitan dan ketergantungan antarbangsa dan antarmanusia di seluruh dunia dunia melalui perdagangan, investasi, perjalanan, budaya populer, dan bentuk-bentuk interaksi yang lain sehingga batas-batas suatu negara menjadi bias (wikipedia.com).<br><br>Di alam globalisasi inilah, kesalingbergantungan antara negara satu dengan negara lain terjalin begitu kuat. Dengan begitu, sebuah negara yang telah maju diharapkan akan merangsang perekonomian negara-negara yang sedang berkembang lewat sistem pasar bebas yang saling terhubung dan kompetitif. Tak heran bila globalisasi dipercaya akan mampu membawa kemaslahatan pada segenap umat manusia di dunia.<br><br>Sebuah niat yang kedengarannya cukup mulia memang. Dan sejak diterapkan pada era 80-an, globalisasi menjadi sistem ekonomi (mencakup juga aspek sosial, budaya, dan komunikasi) yang populer di banyak negara. Tak terkecuali bagi negara kita tercinta yang kala itu berada di bawah rezim Orde Baru.<br><br>Tapi dengan adanya krisis global ini, untuk pertama kalinya kita disadarkan, betapa sistem globalisasi yang tengah dipraktikkan kebanyakan negara saat ini, ternyata juga berpotensi membawa umat manusia pada krisis berkepanjangan. Ditambah lagi betapa globalisasi ekonomi dunia kian hari kita lihat semu dan banal, yakni di mana triliunan dollar AS diperjualbelikan dan dipermainkan di pasar modal, tetapi hanya sebagian saja diantaranya yang benar-benar menyentuh sektor riil.<br><br>Dengan kondisi kesalingterhubungan dan kesalingbergantungan inilah globalisasi ekonomi menciptakan budaya ekonomi sebagai jaringan terbuka (open network) yang rawan terhadap kemacetan di suatu titik jaringan dan serangan virus ke seluruh jaringan. Serangan virus (semisal kemacetan likuiditas) di sebuah titik jaringan (seperti AS) dengan cepat menjalar ke seluruh jejaring global tanpa ada yang tersisa.<br><br>Maka di titik ini pulalah kita sadar betapa Indonesia sebagai salah satu peserta yang turut serta dalam sistem ekonomi global, cukup rentan terkena dampak krisis ini.<br><br>Sejatinya, krisis global ini memang lebih banyak berpengaruh pada industri keuangan, khususnya pasar modal. Ruang gerak pasar modal itu sendiri belum meluas bagi usaha dan bisnis yang dijalankan bagi kebanyakan masyarakat Indonesia.<br><br>Bisa disimak bahwa roda perekonomian di Kota Bogor sendiri lebih banyak digerakkan oleh sektor riil dan usaha kecil menengah (UKM). Kebanyakan dari mereka menjalankan usaha yang tak memiliki persinggungan langsung dengan investor, juga dikerjakan oleh SDM dari dalam negeri sendiri.<br><br>Karenanya, kita selaku warga Bogor patut menjadikan peristiwa krisis global saat ini sebagai momentum dalam mendukung segenap pelaku bisnis dan UKM kota Bogor. Sebab, sejarah negeri ini telah membuktikan bahwa para pelaku bisnis dan UKM-lah yang mampu bertahan ketika krisis menerpa Indonesia di tahun 1998.<br><br>Dan kepada merekalah kita bisa berharap krisis global kali ini takkan mampir ke Indonesia. (sumber: http://prys3107.blogspot.com/)<br>', 'Sabtu', '2009-01-31', '14:48:09', '44amerika.jpg', 8, 'amerika'),
(74, 19, 'admin', 'Google Chrome Susupi Microsoft', 'google-chrome-susupi-microsoft', 'Browser Microsoft, Internet Explorer (IE), bisa mendominasi karena tersedia secara default pada banyak komputer di pasaran. Google Chrome akan menggoyang dengan menyusup di lahan yang sama. Google rupanya sudah bersiap-siap menawarkan Google Chrome secara default pada komputer-komputer baru. Pichai juga menjanjikan Chrome akan keluar dari versi Beta (uji coba) pada awal 2009. \r\n\r\nJika Google berhasil menyusupkan Chrome dalam lahan yang selama ini jadi ''mainan'' Microsoft, lanskap perang browser akan mengalami perubahan. Saat ini Microsoft masih mendominasi pada kisaran 70 persen lewat Internet Explorer-nya, sedangkan Firefox menguasai sekitar 20 persen. (sumber: <a target="_blank" title="" href="http://detikinet.com">detikinet.com</a>)<br>', 'Sabtu', '2009-01-31', '13:34:25', '25chrome.jpg', 20, 'browser,google'),
(60, 19, 'admin', 'Digerus Firefox, IE Makin Melempem', 'digerus-firefox-ie-makin-melempem', 'Browser Mozilla Firefox sepertinya makin berkibar. Berdasarkan data terbaru dari biro penelitian Net Applications, Firefox menapak naik dengan menguasai 20,78 persen pangsa pasar browser pada bulan November, naik dari angka 19,97 persen di bulan Oktober.<br><br>Dikutip detikINET dari Afterdawn, Selasa (2/1/2/2008), Firefox kemungkinan sukses menggaet user yang sebelumnya mengandalkan browser Internet Explorer (IE) besutan Microsoft. Pasalnya, masih menurut data Net Applications, pangsa pasar IE kini menurun di bawah 70 persen untuk kali pertama sejak tahun 1998. IE sekarang menguasai 69,8 persen pangsa pasar dari sebelumnya 71,3 persen di bulan Oktober.<br><br>Padahal di masa jayanya di tahun 2003, IE pernah begitu dominan dengan menguasai 95 persen pasaran browser. Penurunan pangsa pasar IE ini disinyalir juga terkait musim liburan di AS di mana banyak perusahaan libur. Padahal browser IE banyak dipakai oleh kalangan perusahaan.<br><br>Adapun produk browser lainnya menunjukkan tren peningkatan. Apple Safari kini punya pangsa 7,13 persen dan Google Chrome sebesar 0,83 persen dari yang sebelumnya 0,74 persen. Sementara pangsa pasar Opera mengalami penurunan dari yang sebelumnya 0,75 persen menjadi 0,71 persen saja. (sumber: <a target="_blank" title="http://detikinet.com" href="http://detikinet.com">detikinet.com</a>)<br>', 'Sabtu', '2009-01-31', '13:58:31', '47firefox.jpg', 3, 'browser'),
(61, 22, 'admin', 'Sepatu Melayang Saat Bush Berpidato di Irak', 'sepatu-melayang-saat-bush-berpidato-di-irak', 'Apakah pemerintah AS sakit hati karena Presiden Bush ditimpuk sepatu? Sudah pasti. Tapi di Irak, sepatu melayang itu sebagai pamitan terindah untuk Bush. Muntazer Al Zaidi dieluk-elukkan di Irak. Tuntutan masyarakat agar dia dibebaskan juga semakin kencang. Mereka menilai tindakan Al Zaidi menimpuk Bush dengan sepatunya sebagai tindakan paling berani.<br><br>Sahabat Al Zaidi di stasiun TV Al Baghdadia, mengungkapkan betapa bencinya Al Zaidi pada Bush. Dia menganggap Bush sebagai tokoh yang memerintahkan perang di Irak.<br><br>"Melempari sepatu pada Bush merupakan ciuman pamitan terbaik hingga sejauh ini ... itu merupakan ungkapan bagaimana rakyat Irak dan bangsa Arab lainnya membenci Bush," tulis Musa Barhoumeh, editor koran independen Yordania, Al-Gahd, Selasa (16/12).<br><br>Di Washington, Al Zaidi dicap sebagai orang yang cuma mencari perhatian.<br><br>"Tak diketahui apa motivasi orang itu, ia tampaknya jelas hanya berusaha mendapatkan perhatian atas dirinya," kata Jurubicara Deplu AS, Roberet Wood, kepada para wartawan.<br><br>Pemerintah Irak mencap tindakan Zaidi sebagai ''memalukan'' dan menuntut permintaan maaf dari pemimpin redaksinya yang berkerdudukan di Kairo. Namun Bos Al Zaidi malah menuntut pembebasan reporternya itu. (sumber: <a target="_blank" title="http://inilah.com" href="http://inilah.com">inilah.com</a>)<br>', 'Sabtu', '2009-01-31', '14:04:27', '38bush.jpg', 10, 'amerika,george-bush'),
(62, 22, 'admin', 'Monumen Menghormati Pelempar Sepatu Bush', 'monumen-menghormati-pelempar-sepatu-bush', 'Wartawan pelempar sepatu ke arah mantan Presiden Amerika Serikat George W Bush Desember lalu, benar-benar menjadi pahlawan. Sebuah kota di Irak bahkan membuatkan monumen sepatu untuk menghormatinya. Seperti diberitakan Reuters, Jumat (30/1/2009), monumen sepatu yang terletak di kota Tikrit Irak tersebut diresmikan Kamis kemarin. Sepatu sepanjang dua meter itu dilapis material berwarna perunggu.<br><br>"Muntazar: Puasa (bicara) hingga pedang menyayat kebisuan dengan darah. Sunyi hingga mulut kami menyuarakan kebenaran," demikian tertulis di monument itu. Saat melemparkan sepatunya ke Bush dalam sebuah konferensi pers di Baghdad, wartawan televisi Al Baghdadia itu mengucapkan bahwa Bush merupakan orang yang bertangung jawab atas kematian ribuan warga Irak. Zaidi juga menyebut Bush dengan kata "anjing".<br><br>Sejak insiden itu Zaidi medekam di penjara Baghdad. Dia menghadapi tuntutan penyerangan terhadap tamu negara dengan ancaman hukuman penjara hingga 15 tahun.<br><br>Pimpinan rumah yatim piatu dan organisasi kesejahteraan anak Tikrit Fatin Abdul Qader mengatakan monumen itu didesain oleh Laith Al Amiri dengan bobot keseluruhan sekira 1,2 ton. Tema monumen tersebut adalah "Patung Semangat dan Kedermawanan".<br><br>"Monumen ini merupakan ekspresi penghargaan dan apresiasi kami untuk Muntazhar Zaidi akrena hati orang-orang Irak akan tenang dengan leparan sepatunya," kata Fatin. (sumber: <a target="_blank" title="http://sabili.co..id" href="http://sabili.co..id">sabili.co.id</a>)<br>', 'Sabtu', '2009-01-31', '14:11:28', '91bushet.jpg', 4, 'amerika,george-bush'),
(75, 21, 'admin', 'Krisis Ekonomi Amerika, Bukti Kegagalan Kapitalisme', 'krisis-ekonomi-amerika-bukti-kegagalan-kapitalisme', 'Presiden Ekuador, Rafael Correa menilai krisis yang terjadi di Amerika menjadi bukti kegagalan sistem kapitalis dan periode Kapitalisme telah berakhir serta ekonomi Amerika sebagai pasar terbesar dunia telah dililit krisis. (Kantor Berita Fars Prensa Latina Kuba).\r\n\r\nCorrea menambahkan, apa yang terjadi di Amerika tidak terbatas pada krisis keuangan, namun bukti kebuntuan sebuah sistem yang dibangun tanpa dicermati secara serius. Menurut Correa, solusi krisis sistem keuangan Amerika tidak akan bisa selesai dengan menyuntikkan dana 700 miliar dolar kepada bank-bank yang telah bangkrut, namun yang lebih penting lagi adalah Amerika harus melakukan perubahan fundamental. (sumber: hidayatullah.com)', 'Sabtu', '2009-01-31', '14:13:52', '54RafelKarera.jpg', 11, 'amerika'),
(79, 22, 'admin', 'Ahmadinejad: Gaza Akan Jadi Kuburan Israel', 'ahmadinejad-gaza-akan-jadi-kuburan-israel', 'Iran dan Israel tampaknya tidak akan pernah melakukan genjatan senjata. Presiden Iran Mahmoud Ahmadinejad melontarkan kata-kata serangan terhadap Israel dengan menyebut negara Yahudi itu akan segera lenyap dari bumi. "<span style="font-weight: bold; font-style: italic;">Kejahatan yang dilakukan rejim Zionis (Israel) terjadi karena mereka sadar sudah sampai di akhir dan segera lenyap dari muka bumi</span>," kata Ahmadinejad dalam pawai anti-Israel yang berlangsung di Teheran, seperti dilaporkan kantor berita Mehr dan dikutip DPA, Sabtu (13/12).<br><br>Dia mengatakan Israel sudah kehilangan arah dan kian sadar bahwa kelompok negara-negara kuat makin ragu untuk menunjukkan dukungan untuk negara Yahudi itu.<br><br>Ahmadinejad juga mengatakan bahwa kejahatan Israel di Gaza bertujuan mengganti pemimpin politik di wilayah itu agar sesuai dengan kepentingan politik Israel. (sumber: <a target="_blank" title="Situs Berita Inilah.com" href="http://inilah.com">inilah.com</a>)<br>', 'Senin', '2009-02-02', '14:23:39', '22ahmadinejad.jpg', 86, 'gaza,israel,palestina'),
(65, 23, 'admin', 'Michael Heart "Song for Gaza"', 'michael-heart-song-for-gaza', 'Banyak cara untuk men-support perjuangan rakyat Palestina di Gaza, salah satunya dengan lagu. Seorang penyanyi di Los Angeles Amerika Serikat - Michael Heart yang bernama asli Annas Allaf kelahiran Syiria, membuat sebuah lagu khusus yang dia tujukan untuk rakyat Gaza yang sampai saat ini masih jadi sasaran pembantaian oleh Zionis Israel.<br><br>Sejak dia merilis lagu yang berjudul "We will not go down" (Song for Gaza), lagu tersebut mendapat banyak respon, berupa komentar dukungan, sampai ia sendiri kewalahan menjawab dan membalas berbagai email yang masuk.<br><br>Michael Heart menggambarkan kondisi rakyat Gaza akan gempuran Zionis Israel dalam lagunya itu membuat kita merasa tersindir dan sedih akan nasib rakyat Gaza. Walaupun lagu itu baru di rilis, namun telah ratusan ribu orang melihatnya di youtube dan mendownload MP3 nya.<br><br>Awalnya dia berencana dengan menjual CD lagu MP3 nya itu dan hasil penjualannya akan dia donasikan untuk kepentingan amal kemanusiaan untuk penduduk Gaza, tapi karena dia merasa sulit kalau harus sendiri mendonasikan hasil penjualan CD MP3 nya, akhirnya dia memutuskan semua orang bisa mendownload gratis lagu tersebut. Dan dia berharap, setelah mendengarkan lagu itu, orang-orang akan tergerak hatinya untuk membantu rakyat Palestina di Gaza dengan mendonasikan uangnya ke lembaga-lembaga kemanusiaan yang ada atau organisasi yang didedikasikan untuk meringankan penderitaan rakyat Palestina.<br><br>Sebagai musisi Michael Heart sangat berterima kasih atas dukungan yang diberikan kepada dia atas lagu tersebut. Dan dia berharap setiap orang yang masih mempunyai hati nurani, mendukung perjuangan rakyat Palestina dan membantu mereka walau hanya dengan berupa doa.<br><br><br><span style="font-weight: bold;">WE WILL NOT GO DOWN (Song for Gaza)</span><br style="font-weight: bold;"><br style="font-style: italic;"><span style="font-style: italic;">A blinding flash of white light</span><br style="font-style: italic;"><span style="font-style: italic;">Lit up the sky over Gaza tonight</span><br style="font-style: italic;"><span style="font-style: italic;">People running for cover</span><br style="font-style: italic;"><span style="font-style: italic;">Not knowing whether they''re dead or alive</span><br style="font-style: italic;"><br style="font-style: italic;"><span style="font-style: italic;">They came with their tanks and their planes</span><br style="font-style: italic;"><span style="font-style: italic;">With ravaging fiery flames</span><br style="font-style: italic;"><span style="font-style: italic;">And nothing remains</span><br style="font-style: italic;"><span style="font-style: italic;">Just a voice rising up in the smoky haze</span><br style="font-style: italic;"><br style="font-style: italic;"><span style="font-style: italic;">We will not go down</span><br style="font-style: italic;"><span style="font-style: italic;">In the night, without a fight</span><br style="font-style: italic;"><span style="font-style: italic;">You can burn up our mosques and our homes and our schools</span><br style="font-style: italic;"><span style="font-style: italic;">But our spirit will never die</span><br style="font-style: italic;"><span style="font-style: italic;">We will not go down</span><br style="font-style: italic;"><span style="font-style: italic;">In Gaza tonight</span><br style="font-style: italic;"><br style="font-style: italic;"><span style="font-style: italic;">Women and children alike</span><br style="font-style: italic;"><span style="font-style: italic;">Murdered and massacred night after night</span><br style="font-style: italic;"><span style="font-style: italic;">While the so-called leaders of countries afar</span><br style="font-style: italic;"><span style="font-style: italic;">Debated on who''s wrong or right</span><br style="font-style: italic;"><br style="font-style: italic;"><span style="font-style: italic;">But their powerless words were in vain</span><br style="font-style: italic;"><span style="font-style: italic;">And the bombs fell down like acid rain</span><br style="font-style: italic;"><span style="font-style: italic;">But through the tears and the blood and the pain</span><br style="font-style: italic;"><span style="font-style: italic;">You can still hear that voice through the smoky haze</span><br style="font-style: italic;"><br style="font-style: italic;"><span style="font-style: italic;">We will not go down</span><br style="font-style: italic;"><span style="font-style: italic;">In the night, without a fight</span><br style="font-style: italic;"><span style="font-style: italic;">You can burn up our mosques and our homes and our schools</span><br style="font-style: italic;"><span style="font-style: italic;">But our spirit will never die</span><br style="font-style: italic;"><span style="font-style: italic;">We will not go down</span><br style="font-style: italic;"><span style="font-style: italic;">In Gaza tonight </span><br><br>(sumber: detik.com)<br>', 'Sabtu', '2009-01-31', '14:26:40', '24michaelheart.jpg', 22, 'gaza,israel,palestina'),
(66, 22, 'admin', 'Demo Kecam Israel Warnai Ibukota', 'demo-kecam-israel-warnai-ibukota', 'Aksi unjuk rasa menentang agresi militer Israel ke Jalur Gaza, Palestina kembali mewarnai Jakarta. Unjuk rasa kali ini dilakukan oleh Ormas Islam Hizbut Thahrir di kawasan Silang Monas, Jakarta. Sejak Minggu (4/1) pagi, para pengunjuk rasa nampak berbondong-bondong membawa karton besar bertuliskan ''Save Palestine'' dan foto anak-anak serta perempuan Palestina yang menjadi korban tak berdosa dari serangan biadab militer Israel.<br><br>Kepada warga Jakarta yang berolahraga di sekitar kawasan Monas, para pengunjuk rasa juga mengedarkan kotak sumbangan untuk didonasikan kepada korban warga Palestina.<br><br>Aksi unjuk rasa dan banyaknya warga Jakarta yang rutin berolahraga di kawasan Silang Monas setiap Minggu pagi, membuat kawasan itu cukup padat untuk dilalui kendaraan bermotor.<br><br>Serangan udara Israel yang dimulai pada 27 Desember 2008 sudah terjadi selama sepekan di Jalur Gaza dan menewaskan lebih 420 orang.<br><br>Meski mendapat kutukan keras dari dunia Internasional, termasuk Indonesia, Israel sampai saat ini belum menunjukkan tanda-tanda akan menghentikan aksi militernya. (sumber: inilah.com)<br>', 'Sabtu', '2009-01-31', '14:29:16', '32demo.jpg', 23, 'gaza,israel,palestina'),
(67, 2, 'admin', 'Ana Ivanovic Dinobatkan Sebagai Ratu Tenis 2008', 'ana-ivanovic-dinobatkan-sebagai-ratu-tenis-2008', 'Ana Ivanovic, dara kelahiran Belgrade pada tanggal 6 November 1987 sudah mulai bermain tenis sejak umur 5 tahun sesudah menonton Monica Seles di TV, mengingat nomor telpon sekolah tenis lokal dan memohon kepada orang tuanya untuk mengajak pergi ke sekolah itu. Kemudian di acara ulang tahunnnya yang ke-5, orang tuanya memberi hadiah berupa raket tenis dan sejak itu dia mulai jatuh cinta dengan dunia tenis. Kemudian Ana mulai berlatih tenis secara intens dengan Scott Byrnes pada bulan juli 2006.<br><br>Dragana, ibunya adalah seorang pengacara, sedangkan Miroslav bapaknya adalah seorang pebisnis, Milos kakaknya adalah seorang pemain basket dan seluruh keluarganya menyukai olahraga, tetapi tidak ada yang menyukai tenis seperti ana.<br><br>Senjata utamanya di tenis adalah pukulan forehand-nya, dan dia bisa main di segala jenis lapangan. Hobinya adalah menonton film di bioskop atau menonton DVD di rumah. Ana juga suka membaca, khususnya tentang Mitologi dan Sejarah Yunani. Ana juga senang sekali mendengarkan musik.<br><br>Pada tahun 2008 ini, setelah menjuarai Roland Garros prancis dengan mengalahkan Dinara safina dari rusia di final, maka saat ini peringkat Ana Ivanovic naik menjadi peringkat 1 dunia untuk petenis putri.<br>', 'Sabtu', '2009-01-31', '14:30:48', '20anaivanovic.jpg', 4, 'tenis'),
(73, 2, 'admin', 'Maria Kirilenko, Petenis Terseksi Versi WTA', 'maria-kirilenko-petenis-terseksi-versi-wta', 'Pesona kecantikan Maria Sharapova dan Ana Ivanovic sepertinya sudah mendapat saingan baru. Tidak jauh-jauh, nama Maria Kirilenko tiba-tiba menyeruak di daftar petenis terseksi pilihan responden WTA. Artinya, Maria sukses merengkuh gelar yang musim lalu diraih Maria Sharapova.<br><br>Setengah dari 7 ribu responden yang masuk ke WTA menyebut, kalau Maria adalah sosok petenis ideal dan paling proporsional di level bentuk tubuh. Meski hanya berperingkat 18 dunia, namun pesonanya di atas lapangan tenis menjadi daya tarik tersendiri.<br><br>"Tubuhnya sangat indah, siluetnya membuat setiap pria pasti penasaran ingin melihat lebih dekat. Yang jelas, ia memiliki kepribadian baik yang makin menyempurnakan pesona fisiknya," tulis seorang responden. Di kalangan petenis putri sendiri, sudah lama Maria menjadi saingan berat Masha dan Ana ivanovic.<br><br>Di situs pribadinya, petenis bernama asli Maria Yuryevna Kirilenko ini mengaku selalu menjaga proporsi tubuh dengan senam dan renang, selain tentu berlatih fisik tenis. "Olahraga adalah cermin hidupku, jika tak olahraga sehari saja, kadang membuat tubuhku terasa lemas dan tak bergairah," ujar Maria.&nbsp; (persda network/bud)<br><br>Meksi bersaing di lapangan dan dunia mode, namun ternyata sosok Maria Kirilenko adalah sobat sejati Maria Sharapova. Bukan hanya karena sama-sama berasal dari Rusia, namun gaya hidup mereka berdualah yang membuat Maria-Masha banyak memiliki kecocokan.<br>Selain suka fotografi, mereka berdua juga memiliki hobi berbelanja, terutama fashion dan perhiasan. Bukan untuk pamer memang, tapi mereka melakukan itu untuk tabungan dan investasi.<br><br>Di beberapa turnamen, Masha dan Maria memang tampak bersama tatkala berada di luar lapangan. Mereka biasanya menyingkir dari rombongan pemain lain, dan memilih berburu barang kesukaan mereka dengan menyisir bagian kota tempat mereka tengah bertanding. "Aku dan Masha seperti kakak beradik, bagiku dia lebih dari sekedar sahabat, dia begitu dewasa, apalagi saat kami berdua saling curhat," sebut Maria, di tennisnews. <br><br>Daftar petenis terseksi WTA:<br><ol><li>Maria Kirilenko (Russia)</li><li>Maria Sharapova (Russia)</li><li>Ana Ivanovic (Serbian)</li><li>Caroline Wozniacki (Danish)</li><li>Nicole Vaidisova (Czech)</li><li>Sania Mirza (Indian)</li><li>Ashley Harkleroad (American)</li><li>Gisela Dulko (Argentinian)</li><li>Samantha Stosur (Australian)<br></li></ol>', 'Sabtu', '2009-01-31', '15:01:49', '14mariakirilenko.jpg', 37, 'tenis'),
(77, 2, 'sinto', 'Sharapova, Petenis Wanita Berpenghasilan Tertinggi', 'sharapova-petenis-wanita-berpenghasilan-tertinggi', 'Petenis asal Rusia, Maria Sharapova dengan penghasilan 26 juta dolar AS merupakan petenis wanita berpenghasilan tertinggi. Ia pernah menempati peringkat satu dunia, pasca mundurnya Justine Henin. Ia juga memiliki prestasi dengan menjuarai turnamen grand slam Australia Terbuka dan AS Terbuka. Namun, sebagian besar penghasilannya didapat dari kontrak iklannya bersama Pepsi, Colgate-Palmolive, Nike dan Motorola.<br><br>Berikutnya disusul Williams bersaudara dari Amerika, yaitu Serena Williams dengan penghasilan 14 juta dolar AS. Ia meraih tiga gelar juara tiap tahunnya semenjak tahun 2005. Ia juga merupakan model dari produk Hawlett-Packard, Nike, dan Kraft. Sedangkan kakak kandungnya, yaitu Venus Williams berpenghasilan 13 juta dolar AS. Ia mengalahkan adiknya di final Wimbledon tahun 2008. Ia memiliki dan menjalankan sendiri usaha fashion Eleven.<br><br>Di peringkat ke empat dan kelima adalah petenis Belgia yaitu Justine Henin dengan penghasilan 12,5 juta dolar AS. Dan petenis asal Serbia, yaitu Ana Ivanovic dengan penghasilan 6,5 juta dolar AS.<br>', 'Minggu', '2009-02-01', '19:58:16', '89sharapova.jpg', 18, 'tenis'),
(68, 2, 'admin', 'Roger Federer, Petenis Legenda Abad Ini', 'roger-federer-petenis-legenda-abad-ini', 'Siapa yang tak kenal dengan Roger Federer saat ini? Masih muda, ganteng, namun sudah jadi legenda. Bayangkan, dalam usia belum menginjak 26 tahun, ia sudah memecahkan rekor bertahan sebagai peringkat pertama dunia tenis selama 161 pekan berturut-turut. Ia memecahkan rekor Jimmy Connor yang sudah bertahan puluhan tahun. <br><br>Itu baru satu rekor. Sebelumnya, ia juga mendapat penghargaan Bagel Award, yakni penghargaan sebagai petenis paling banyak memenangkan set tenis dengan angka sempurna 6-0. "Saya hanya berusaha melakukan yang terbaik dan tidak berhenti memperbaiki kesalahan-kesalahan saya,"sebut Federer merendah tentang prestasinya itu.<br><br>Dengan kerendahhatian dan semangat untuk terus memperbaiki diri, pria keturunan campuran Swiss, German, dan Afrika Selatan ini sepertinya akan terus mengukir prestasi. Sebab, mengingat usia yang masih muda dan jarak nilai ATP dengan peringkat kedua dunia Rafael Nadal, cukup jauh, ia akan bisa terus bertahan di rangking satu dunia. Apalagi jika ia nantinya bisa memenangkan satu-satunya gelar tenis Grand Slam yang belum diraih, Perancis Terbuka. Ia akan jadi satu-satunya petenis pria yang bisa mengawinkan semua gelar tenis Grand Slam.<br><br>Roger Federer memang sepertinya terlahir untuk jadi legenda. Bahkan, menurut pengakuannya, sejak kecil ia sudah disebut banyak orang punya bakat gemilang di bidang olahraga. Tapi, menurut dirinya, bukan bakat yang membuatnya seperti sekarang. Kerja keras, ketekunan berlatih, dan keuletan di lapangan lah yang membuat dia bisa jadi juara sejati. "Saya terus berlatih untuk meningkatkan teknik permainan saya dan menambah kekuatan saya. Proses ini saya jalani sampai hari ini dan bahkan makin saya tingkatkan sejak saya jadi juara. Ini saya lakukan karena saya yakin masih banyak perbaikan yang harus terus dilakukan."<br><br>Dengan tekad untuk terus melakukan perbaikan itu, Roger Federer terus meretas jalan untuk mengukir rekor-rekor lainnya. Namun, semua rekor dan kemenangan yang diperolehnya, ternyata bukan hanya untuk kebanggaan dirinya. Melalui sebuah yayasan yang diberi nama seperti dirinya, Roger Federer Foundation, ia membantu anak-anak kurang beruntung di dunia terutama di Afrika Selatan. Sebagian hadiah yang diperoleh dari kemenangannya di kejuaraan tenis, digunakan untuk membantu anak-anak itu. Ia juga berperan banyak saat terjadi tsunami akhir tahun 2005. Saat itu, ia terpilih menjadi duta UNICEF, untuk membantu anak-anak yang jadi korban tsunami di Tamil Nadu, India. Ia juga berjanji untuk mengukir lebih banyak kemenangan guna mengumpulkan lebih banyak dana untuk yayasannya. Ia juga merelakan beberapa raketnya untuk dilelang guna disumbangkan melalui UNICEF. Roger Federer telah membuktikan, dengan kerja keras, semangat pantang menyerah, tekad kuat, dan kepedulian terhadap sesama, telah menjadikannya sebagai juara sejati.<br><br>Dari kisah sukses Roger Federer ini, kita dapat mengambil pelajaran bahwa dengan kerja keras disertai semangat pantang menyerahlah kita bisa mewujudkan cita-cita. Selain itu, kepedulian kepada sesama juga selayaknya dapat mendorong semangat kita untuk terus mengukir prestasi. (sumber: andriewongso.com)<br>', 'Sabtu', '2009-01-31', '18:59:14', '33federer.jpg', 15, 'tenis'),
(70, 19, 'admin', 'Kisah Sukses Google', 'kisah-sukses-google', 'Dalam daftar orang terkaya di Amerika baru-baru ini, terselip dua nama yang cukup fenomenal. Masih muda, usianya baru di awal 30-an, namun kekayaannya mencapai miliaran dolar. Nama kedua orang itu adalah Larry Page dan Sergey Brin. Mereka adalah pendiri Google, situs pencari data di internet paling terkenal saat ini.<br><br>Terlepas dari jumlah kekayaan mereka, ada beberapa hal yang perlu dicontoh dari kisah sukses mereka. Satu hal yang pertama, yang disebut Sergey Brin, yang kini menjabat sebagai Presiden Teknologi Google, yakni tentang kekuatan kesederhanaan. Menurutnya, simplicity web adalah hal yang disukai penjelajah internet. Dan, Google berhasil karena menggunakan filosofi tersebut, menghadirkan web yang bukan saja mudah untuk mencari informasi, namun juga menyenangkan orang.<br><br>Kunci sukses kedua adalah integritas mereka dalam mewujudkan impiannya. Mereka rela drop out dari program doktor mereka di Stanford University untuk mengembangkan google. Mereka pun pada awalnya tidak mencari keuntungan dari proyek tersebut. Malah, kedua orang itu berangkat dari sebuah ide sederhana. Yakni, bagaimana membantu banyak orang untuk mempermudah mencari sumber informasi dan data di dunia maya. Mereka sangat yakin, ide mereka akan sangat berguna bagi banyak orang untuk mempermudah mencari data apa saja di internet.<br><br>Kunci sukses lainnya yaitu mereka tidak melupakan jasa orang-orang yang mendukung kesuksesan mereka. Larry dan Sergey sangat memerhatikan kesejahteraan SDM di Google. Kantornya yang diberi nama Googleplex dinobatkan sebagai tempat bekerja terbaik di Amerika tahun 2007 oleh majalah Fortune. Di sana suasananya sangat kekeluargaan, ada makanan gratis tiga kali sehari, ada tempat perawatan bagi bayi ibu muda, bahkan sampai kursi pijat elektronik pun tersedia. Mereka sadar, di balik sukses inovasi yang dilakukan Google, ada banyak doktor matematika dan lulusan terbaik dari berbagai universitas yang membantu mereka.<br><br>Larry dan Sergey memang tak pernah menduga Google akan sesukses sekarang. Kedua orang yang terlahir dari keluarga ilmuwan – ayah Sergey adalah doktor matematika, sedangkan Larry adalah putra almarhum doktor pertama komputer di Amerika – ini memang hanya berangkat dari sebuah masalah sederhana. Mereka berusaha memecahkan masalah tersebut, dan berbagi dengan orang lain. Namun, justru dengan kesederhanaan dan integritas mereka, mampu membuat Google saat ini menjadi mesin pencari terdepan, dikunjungi lebih dari 300 juta orang perhari. Diterjemahkan dalam 88 bahasa dengan nilai saham mencapai lebih dari 500 dolar AS per lembar, membuat sebuah kesederhanaan menjelma menjadi kekuatan yang luar biasa.<br><br>Sebuah niat mulia, meski sesederhana apapun, jika dilandasi kerja keras dan integritas yang tinggi, akan menghasilkan sesuatu yang istimewa. Hal tersebut nampak dari contoh kisah sukses Larry Page dan Sergey Brin di atas. Google yang mereka dirikan terbukti telah membantu banyak orang untuk bisa mendapatkan apa saja dari internet. Dan kini, mereka pun mendapatkan imbalan yang bahkan tak diduga mereka sebelumnya. Kesuksesan sejati memang akan terasa saat kita bisa berbagi. Dan, Larry serta Sergey membuktikannya sendiri. (sumber: andriewongso.com)<br>', 'Minggu', '2009-01-25', '20:26:26', '73google.jpg', 5, 'google'),
(64, 19, 'wiro', 'Browser Safari Diklaim Paling Handal di Windows', 'browser-safari-diklaim-paling-handal-di-windows', 'Dibandingkan browser Internet lainnya, Apple mengklaim browser web Safari buatannya adalah yang paling handal digunakan jika digunkan di atas sistem operasi Windows. Hal tersebut disampaikan CEO Apple Steve Jobs saat mengumumkan versi terbaru Safari yang dapat berjalan di Windows.<br><br>"Kami kira para pengguna Windows akan benar-benar terkejut saat melihat begitu cepat dan menariknya berselancar di Internet menggunakan Safari," ujar Steve Jobs di acara Worldwide Developer Conference Apple di San Fransisco, AS, Senin (11/6). Ia mengklaim browser Safari dapat membuka sebuah halaman web dua kali lebih cepat dibandingkan Internet Explorer 7 di Windows dan masih lebih cepat dibandingkan Opera maupun Firefox.<br><br>Kehadiran Safari untuk para pengguna Windows akan semakin menyemarakkan persaingan browser web. Steve Jobs berharap peluncuran ini akan meningkatkan popularitas Safari yang baru mencapai 4,9 persen pangsa pasar browser web. Persaingan browser web saat ini masih didominasi IE dengan pangsa pasar 78 persen menyusul Firefox. Versi tes Safari 3 untuk Windows XP, Vista, dan Apple Macs OSX sudah dapat di-download dari situs Apple sejak Senin (11/6). (sumber: bbc.co.uk)<br>', 'Minggu', '2009-01-25', '20:35:26', '18safari.jpg', 3, 'browser'),
(58, 23, 'sinto', 'Pelajaran Moral dari Film Laskar Pelangi', 'pelajaran-moral-dari-film-laskar-pelangi', '"Kalau Nak Pintar, Belajar! Kalau Nak Berhasil, Usaha!" Itulah mantra yang diberikan Tuk Bayan Tula kepada anak-anak laskar pelangi saat mau menghadapi ujian. Berikut beberapa fakta mengapa saya sangat menyukai film Laskar Pelangi (Petik hikmahnya ya):<br><br>1. Pelajaran itu bisa didapatkan dimana saja<br><br>Para Laskar Pelangi menimba ilmu di sekolah reot yang sangat tidak layak, kegigihan untuk menimba ilmu dan mengubah sejarah hidup membuat mereka mampu bangkit dan membuktikan bahwa mereka bisa menjadi yang terbaik. Sebagai blogger, belajarlah dari siapapun, baik master ataupun newbie, anda tidak akan rugi. Saya selalu senang belajar dari semua orang :)<br><br>2. Keinginan untuk memberi.<br><br>Keinginan untuk memberi akan membuat kita kuat dan bahagia. Berbagi itu Indah (seperti paman gober yang berbagi PR dengan saya). Semangat untuk memberikan yang terbaik akan membuat kita berusaha sekuat mungkin. Dari apa yang kita berikan pada orang lain, kitapun akan memetik hasilnya. Jangan takut kehilangan karena berbagi.<br><br>3. Semangat komunitas, lihat bagaimana mereka membangun tim.<br>Team building, walaupun saya seorang blogger, di BlogicThink saya bekerja bersama. Ada perbedaan sikap dalam menghadapi suatu masalah, dan tim yang baik akan menemukan jalan keluarnya. Saksikan bagaimana Laskar Pelangi memenangkan karnaval dan cerdas cermat. Terima kasih kepada Mas Ary yang mau berbagi dengan saya.<br><br>4. Kalau Nak Pintar, Belajar! Kalau Nak Berhasil, Usaha!<br>Saya suka bagian ini. Laskar pelangi mendatangi dukun untuk lulus dalam ujian. Sang Dukun yang bertempat di pilau terpencil mengngatkan untuk membaca mantra itu dipagi hari. Para Laskar pelangipun menurutinya. Dibawalah selembar mantra tersebut, dibaca didepan sekolah bersama keras-keras : Kalau Nak Pintar, Belajar! Kalau Nak Berhasil, Usaha!<br><br>Yups, suatu pelajaran bagi kita untuk tidak pendek akal ketika ingin menjadi blogger sukses. Saya memilih mewawancara Mas Jimmy, ketimbang membeli resep kebut semalam. Terima kasih untuk Mas Jimmy atas PRnya.<br><br>5. Gunakan waktu, mumpung masih muda<br><br>Ketika saya menonton Laskar Pelangi, saya ingat umur. Saya mengagumi mereka yang memiliki tekad belajar yang kuat, cerita tentang anak-anak kelas 5 SD ini memang mengagumkan. Saya jadi teringat Kawan Blogger saya Ruzdee yang mengenal internet saat kelas 5 SD, suatu kesempatan yang hebat. Semoga sukses kawan :)<br><br>6. Buku kucel mereka, adalah awal dari masa depan.<br><br>9 Laskar pelangi berkumpul dikelas saat sekolah mau dibuka, masih kurang 1 anak. Dalam suasana menunggu Ditampilkan buku kucel yang membuat haru penonton, efek dramatis berhasil dimunculkan. Melihat buku itu saya teringat buku catatan saya, saya memiliki buku catatan yang selalu habis dalam waktu kurang dari satu bulan, isinya adalah ide-ide bisnis.<br><br>Saya jadi ingat spydeey yang menjadikan blognya sebagai oret-oretan catatan belajar komputer dan internet, thanks atas PRnya Bro :)<br><br>7. Lintang, sang jenius yang tak berhenti bermimpi<br><br>Melihat lintang membuat saya melakukan refleksi. Saya tau rasanya putus sekolah. Dan saya tahu rasanya kehilangan kesempatan kuliah karena masalah biaya. Bagi saya itu bukan hambatan. Saya tahu saya akan berhasi. walau kadang dunia tak adil, sekarang saya coba menjawabn setiap permasalahan, dan saya bahagia.<br><br>8. Sekolah kecil itu mengalahkan sekolah dengan modal besar<br><br>Karena sekolah memang bukan soal modal. Pendidikan sejatinya bukan masalah hitung-hitungan material. Ini masalah nilai-nilai. SD Para Laskar Pelangi mengalahkan SD berfasilitas lengkap, karena mereka memiliki cita-cita, semangat, harapan dan kebijaksanaan seorang pendidik.<br><br>Saya adalah seorang trainer di organisasi saya dulu ketika mahasiswa. Anehnya, saya tidak suka sekolah, saya menganggapnya mengungkung pemikiran saya. Ada terlalu banyak pemikiran kaku dan tertinggal disana yang saya tidak sukai.<br><br>9. Ajari saya bermimpi<br><br>Seandainya kondisi membuat saya mundur, maka saya telah tertinggal sejak lama. Banting setir ke dunia bisnis adalah pilihan dari kesulitan ekonomi dan ketidakmampuan untuk melanjutkan kuliah. Awalnya saya down, namun saya tidak mau berlama-lama. Saya coba berusaha bangkit. Hari ini, saya dapat bangga akan ilmu manajemen pemasaran yang saya miliki. Bahkan ketika bertemu dengan kawan-kawan saya dibangku kuliah dulu. Beruntung, walaupun tidak bekerja seperti mereka, saya bangga menjadi seorang blogger dan bukan buruh orang lain. Btw, Om jadul ngasih PR ( Blognya kok suspend Om?)<br><br>10. Seperti Ikal saya berniat sekolah di Perancis<br><br>Jika Ikal pergi ke sorbonne dan berkeliling dunia saya berniat untuk belajar di Universitas Frankfurt, mungkinkah? kita tunggu saja nanti. (sumber: blogicthink.com)<br>', 'Minggu', '2009-01-25', '21:10:44', '46laskar.jpg', 9, 'laskar-pelangi'),
(85, 19, 'admin', 'Windows 7 Gantikan Windows Vista', 'windows-7-gantikan-windows-vista', 'Microsoft  ingin memudahkan rencana para administrator komputer yang akan bermigrasi ke Windows 7, namun sebuah tulisan di blog salam satu anggota tim Windows 7 berkata sebaliknya.\r\n\r\nSkenario uji coba terbaru menunjukkan, sebagian besar pengguna, proses upgrading akan menyulitkan, mengambil waktu kira-kira 30 menit. Prosentasi terbesar pengguna menyebut, migrasi butuh waktu hingga 21 jam.\r\n\r\nSalah satu anggota tim Windows dari Microsoft, Chris Hernandez, mengungkap hasi pengetesan timnya dengan berbagai merek komputer dan konfigurasi tipikal pengguna lewat simulasi pada tingkatan berbeda dari proses migrasi Vista ke Windwos pada Jumat akhir pekan lalu.\r\n\r\nTujuan simulasi untuk memastikan apakah upgrade dari Vista Service Pack (SP) 1 ke Windows 7, dalam lima persen percobaan utama, lebih cepat ketimbang upgrade dari Vista SP1 ke Vista SP2, ujar Chris.\r\n\r\nProses dari Vista SP1 ke Vista SP2 dipilih karena itu opsi instalasi paling umum digunakan Microsoft Product Support Services, yakni skenario repair (perbaikan ulang) di mana prosedur yang paling dianjurkan adalah melakukan re-instalasi sistem operasi (OS) yang sudah ada di komputer saat itu. Chris menampilkan hasil tes dalam blognya.\r\n\r\nTim mengetes konfigurasi komputer khusus hadware, merentang dari kategori hardware low-end (spesifikasi rendah), mid-range (spesifikasi menengah) dan high-end (spesifikasi atas). Kategori itu berlawanan dengan skenario pengguna pada umumnya yang berbasis pertanyaan seperti, berapa besar set data yang dibutuhkan pengguna dan bagaimana macam aplikasi tersebut diinstall.\r\n\r\nUntuk kategori komputer spesifikasi atas, Chris dan timnya mendefinisikan komputer dengan sistem operasi 32 bit dan memiliki CPU berprosesor Inter Core 2 Quad, yang bejalan di 2,4 GHz, memori 4GB dan hardisk 1 Terabyte .\r\n\r\nSementara, pengguna umumnya memiliki data sebesar 125 GB yang terikat dalam format dokumen, musik dan gambar dengan 40 aplikasi yang diinstal di komputer mereka.\r\n\r\nKinerja upgrade Vista SP1 ke Windows 7 pada hardware spesifikasi atas dengan konfigurasi pemilik pengguna kelas berat, membutuhkan 160 menit, atau sekitar 2,7 jam. Sebagai perbandingan, upgrade repair (perbaikan) dari Vista SP1 ke Vista SP1 dengan hadware yang sama dan penggunaan bera membutuhkan 176 menit, atau 2,9 jam.\r\n\r\nSkenario terburuk muncul pada konfigurasi hadware kelas menengah, yakni CPU 32 bit namun dengan software dan konfigurasi "pengguna super". Proses upgrading akan butuh waktu hingga 1.220 menit alias 20,3 jam. Padahal yang dianggap hadware kelas menengah, memiliki spesifikasi setara memory 2GB RAM, prosesor dual core, Athlon 64 X2, pada 2,6GHz dan hardisk 1 Terabyte.\r\n\r\nMereka yang dianggap pengguna super, memiliki profil lebih sadis dalam istilah penggunaan data, ketimbang pengguna kelas berat pada umumnya. Sebagai contoh, tim penguji menyebut pengguna super memiliki 650 GB data dan 40 aplikasi lebih yang terinstal dalam komputer mereka.\r\n\r\nLalu pada kelas rendah, pengguna medium, dengan 70 GB data dan 20 aplikasi, dengan memori sekitar 1 GB, prosesor 64 bit, AMD Athlon pada kecepatan 2,2 GHz, bakal butuh waktu bermigrasi sekitar 175 menit. Hardware yang lebih bertenaga, secara umum membutuhkan waktu instalasi lebih singkat.\r\n\r\nMicrosoft tidak selalu bisa mencapai target lima persen tujuan tim Chris yang telah dijanjikan. Dalam satu contoh, instalasi bersih (instalasi pertama pada komputer baru tanpa OS) Windows 7 pada hardware spesifikasi menengah membutuhkan 30 menit sementara instalasi bersih Vista SP1 butuhk 31 menit. Hanya saja, secara keseluruhan, tidak ada instalasi Windows 7 yang lebih lambat dibandingkan Vista.\r\n\r\nPertanyaan tersisa, apakah para toko dan ritel software akan mendengar rayuan Microsoft dan memutuskan hijrah ke Windows 7 lebih cepat? Tradisi yang berlaku, ritel IT akan cenderung menunggu Service Pack I sebelum mendatangkan versi terbaru Windows.\r\n\r\nWaktu yang akan menjadi sumber menentukan apakah kalangan profesional IT akan berpindah, sehingga Vista tak lagi menarik bagi ritel dan toko software. Jadi kehijrahan mereka ke Windows 7 dengan segera, menandakan pula, apakah para profesional IT suka dengan hasil pengujian waktu instal yang dilakukan Chris Hernandez.  internetnews/itz.\r\n', 'Minggu', '2009-10-25', '07:25:22', '19windows7.jpg', 10, 'komputer'),
(92, 23, 'admin', 'Pemilik Facebook akan Dibuat Filmnya', 'pemilik-facebook-akan-dibuat-filmnya', 'Sutradara David Fincher nampak jeli melihat peluang di tengah booming fenomena Facebook. Fincher akan menghadirkan sebuah film yang menceritakan tentang Mark Zuckerberg dan Facebook bagi para pencinta film dan Facebook tentunya.\r\n\r\nFincher mengaku rencana pembuatan film ini masih dinegosiasikan dengan pihak Zuckerberg. Dia hanya menyebutkan, filmya akan fokus menceritakan Mark Zuckerberg yang awalnya merancang Facebook sebatas untuk keperluan mahasiswa Universitas Harvard.\r\n\r\nFilm ini memaparkan bagaimana setelah itu Facebook kemudian berkembang menjadi fenomena yang mendunia sejak diluncurkan pada 2004.\r\n\r\nDalam penggarapan film ini, Fincher mengajak serta orang-orang kompeten di bidang film. Antara lain Aaron Sorkin, yang merupakan penulis naskah acara serial televisi ternama The West Wing.\r\n\r\nSementara itu, Columbia Pictures yang menamai film ini "The Social Network" dipercaya untuk memulai produksi film pada akhir tahun ini.\r\n\r\nSebagian orang menilai kehadiran film ini nantinya akan mengorek kembali kasus lama dimana tiga teman Zuckerberg, Cameron dan Tyler Winklevoss serta Divya Narendra mengklaim Zuckerberg telah mencuri ide mereka untuk membuat Facebook.\r\n\r\nPada saat Zuckerberg meluncurkan Facebook, mereka menuntut perkara atas Zuckerberg. Awal tahun ini, pengadilan AS memutuskan Facebook harus membayar USD65 juta untuk melunasi perkara ini.\r\n', 'Minggu', '2009-10-25', '07:36:47', '17mark_zuckerberg.jpg', 30, 'film');
INSERT INTO `berita` (`id_berita`, `id_kategori`, `username`, `judul`, `judul_seo`, `isi_berita`, `hari`, `tanggal`, `jam`, `gambar`, `dibaca`, `tag`) VALUES
(90, 29, 'admin', 'Ferrari 458 Polesan Teknologi Jepang', 'ferrari-458-polesan-teknologi-jepang', 'Barangkali hanya Jepang (diluar Italia) yang berani ''memoles'' bodi mobil dari Ferrari, sekaligus mengumumkan hasilnya kepada publik. Seperti dilakukan rumah modifikasi ASI terhadap Ferrari 458 yang oleh pabrikannya di Italia baru di launching.\r\n\r\nASI terkenal dengan keberaniannya menggarap proyek berisiko tinggi. Beberapa mobil berharga miliaran rupiah pernah digarap dan membuat tampilan mobil lebih sporty dan tambah dinamis dari versi standar.\r\n\r\nSebut saja, Bentley Continental GT (yang diberi julukan The ASI Tetsu GTR) dan Ferrari 430. Bahkan Ferrari milik seorang pengusaha muda di Indonesia pernah juga dimodifikasi (bodi) di Jepang pada 2007.\r\n\r\nCEO ASI Satoshi Kondo menjelaskan, bahwa tim rekayasanya telah bekerja keras memproduksi aerokit untuk Ferrari 458. ASI, katanya sengaja mengeluarkan sketsa dari hasil kerja mereka dengan terus melakukan finalisasi prototype yang ada, dan menghindari pencurian desain.\r\n\r\nSentuhan pada bagian depan dari kuda jingkrak menjadi salah satu yang menonjol. Di antaranya moncong yang baru, lubang udara lebih besar, dan dilanjutkan pada bagian roda. Dari sketsa gambar tampak terpasang sayap baru di bagian belakang.\r\n\r\nPaket body kit dari ASI mempertegas tampilan Ferrari sebagai hasil kawin silang dari gaya tuner Jepang dengan kendaraan eksotis khas Italia. ASI mengklaim, adanya perubahan dan penambahan pada bodi tidak mengurangi performa standar. Bahkan bobot kendaraan lebih ringan dari asli. (sumber: kompas.com)\r\n', 'Minggu', '2009-10-25', '07:44:05', '4ferrari458.jpg', 8, 'mobil'),
(86, 22, 'admin', 'Program 100 Hari Menkominfo Tifatul', 'program-100-hari-menkominfo-tifatul', 'Belum juga resmi diumumkan masuk jajaran kabinet, sejumlah calon menteri sudah berani membeberkan programnya. Salah satunya, Tifatul Sembiring. Tifatul disebut-sebut sebagai calon kuat Menkominfo (Menteri Komunikasi dan Informasi).\r\n\r\nApa saja program Tifatul? "100 Hari pertama? Kita targetkan sampai 2014 itu ada 10 ribu desa komputer. Presiden menargetkan tiga bulan ini ada 100 desa komputer harus tercapai," kata Tifatul di Gedung MPR/DPR, Jakarta, Selasa 20 Oktober 2009.\r\n\r\nKomputer-komputer ini, kata dia, bisa dimasukkan ke lembaga pendidikan untuk meningkatkan sumber daya manusia. Bagaimana SDM Indonesia bisa masuk ke bisnis supaya Indonesia bisa bersaing dengan negara-negara lain. Selain itu juga untuk meningkatkan e-goverment untuk meminimalisir korupsi, kolusi, kolusi dan nepotisme.\r\n\r\nDengan e-goverment, kata dia, maka nantinya semua urusan menjadi less paper. Artinya pegawai di tingkat pemda dan kecamatan, tidak lagi menerima uang tunai. "Tapi cukup menerima resi, sehingga sogok menyogok bisa diminimalisir," kata dia.\r\n\r\nTifatul sendiri mengaku tidak begitu asing dengan dunia Kominfo karena latar belakang pendidikannya cukup mendukung. Gelar sarjana strata satunya di bidang Informatika dan Komunikasi. Ia juga mengaju pernah bekerja selama delapan tahun di sistem informatika dan komunikasi PT Perusahaan Listrik Negara.\r\n\r\nSementara strata duanya di bidang politik internasional di Islamabad, Pakistan. "Itu saja sih, pinter ya belum, diupayakan sesuai," kata dia.\r\n\r\nNamun ia berharap bisa menembus tantangan Kominfo ke depan, yakni perbedaan kemudahan akses di kota besar dan desa. Selain itu juga soal infrastruktur yang masih lemah. Masalah lain, kurangnya tayangan edukatif di bidang informasi. "Dalam satu riset dikatakan 10 dari 75 tayangan di TV, radio masih bermasalah," kata dia.\r\n\r\nDia menambahkan, pelayanan informasi di Indonesia juga masih  lemah. Karena itu ia akan mengusahakan peningkatan layanan informasi ini. (Sumber: vivanews.com)\r\n', 'Minggu', '2009-10-25', '07:49:46', '27tifatul_sembiring.jpg', 9, 'komputer'),
(93, 23, 'admin', 'Dalam Dua Pekan, KCB 2 Ditonton 1,5 Juta Penonton', 'dalam-dua-pekan-kcb-2-ditonton-15-juta-penonton', 'Film Ketika Cinta Bertasbih (KCB) 2 diyakini bakal mereguk sukses seperti sekuel pertamanya Sejak diputar perdana tanggal 17 September lalu atau selama 15 hari, film garapan SinemArt telah disaksikan 1,5 juta penonton.\r\n\r\nRekor yang sama juga dialami KCB 1. "Pada pemutaran KCB 1 kami bisa memecah rekor pemutaran film di Indonesia, yaitu mendapat penonton sebanyak 100.000 perhari," ungkap Frans dari SinemArt saat promo film KCB 2 di Royal Plaza, Minggu (4/10).\r\n\r\nPihak SinemArt berharap KCB 2 bisa meraih prestasi minimal sama dengan KCB 1 dengan total 3 juta penonton. Untuk mencapai target tersebut, pihak SinemArt tak henti melakukan serangkaian promo di sejumlah kota di Tanah Air maupun di mancanegara.\r\n\r\n"Hari ini (Minggu, 4/10), Kholidi (Kholidi Asadil Alam, pemeran Azzam) dan Oki (Oki Setiana Dewi pemeran Anna) ke Hongkong untuk promo di sana," imbuh Frans. Pekan depan (10-12 Oktober 2009), giliran Meyda Sefira berangkat ke Makau untuk kegiatan yang sama.\r\n\r\nFilm besutan sutradara Chaerul Umam ini juga dijadwalkan diputar di Aceh pada tanggal 11-12 Oktober mendatang. Menurut Frans, pemutaran KCB 1 di kota yang dikenal dengan sebutan Serambi Mekkah ini ditonton 8.000 orang.\r\n\r\nPadahal di kota tersebut sama sekali tidak ada gedung bioskop. Karena itu kru SinemArt terpaksa mengusung peralatan khusus dari Jakarta dan memutar di sebuah gedung khusus selama dua hari dalam tujuh kali show.\r\n\r\nBertutur tentang kesan berperan di KCB 2, Kholidi beberapa waktu lalu mengaku paling terkesan dengan adegan kecelakaan saat membonceng Bu''e (Ninik L Karim). Karena ketika sepeda motornya terjatuh dia harus teriak memanggil ibundanya. "Bu''eee! Wah itu lumayan sulit," ungkap Kholidi.\r\n\r\nAdegan lain yang cukup berkesan adalah ketika pria asal Pasuruan ini terkapar di rumah sakit paska kecelakaan yang dia alami. "Ekspresi orang sakitnya kan harus dapat. Terus suaranya juga harus disesuaikan, tidak seperti kita ngomong biasa, jadi agak sedikit tertahan di tenggorokan, powernya tidak full seperti ngomong biasanya," bebernya.\r\n\r\nUntuk adegan itu Kholidi yang kini menempuh pendidikan di Universitas Al Azhar, Jakarta melakukan observasi pada beberapa orang yang pernah mengalami kecelakaan. "Aku juga tanya-tanya ke dokter. Ternyata di tempat tidurnya nggak bisa pakai bantal, posisi badannya harus lurus. Terus kalau ada gips di kaki, posisi jalan kita akan seperti apa. Biar nantinya terlihat lebih reel lah adengannya,"  pungkas Kholidi. (sumber: surya.co.id) \r\n', 'Minggu', '2009-10-25', '07:55:45', '54kcb2.jpg', 22, 'film'),
(91, 2, 'admin', 'Manchester United Incar Zidane Baru', 'manchester-united-incar-zidane-baru', 'Manchester United sedang mengincar pemain muda Perancis berdarah Aljazair. Pemain itu adalah Sofiane Feghouli yang baru berusia 19 tahun.\r\n\r\nSofiane Feghouli saat ini memperkuat tim Liga Perancis, Grenoble Foot 38. Posisinya adalah di lapangan tengah.\r\n\r\nPemain yang punya tinggi badan 178 cm itu disebut punya gaya bermain yang serupa dengan Zinedine Zidane. Feghouli sudah masuk dalam tim nasional Perancis U-21.\r\n\r\nTak hanya MU yang menginginkan pemain yang pernah ditolak Paris Saint-Germain itu. Tim-tim besar macam Barcelona, Liverpool dan Inter Milan juga sedang mengambil ancang-ancang untuk mengajukan tawaran.\r\n\r\nSeperti diberitakan Tribalfootball, MU sudah berencana untuk melakukan transaksi dengan Grenoble bulan Januari nanti. (Sumber: vivanews.com)\r\n', 'Minggu', '2009-10-25', '13:58:18', '62sofiane.jpg', 5, 'sepakbola');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
`id_download` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nama_file` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `hits` int(3) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`id_download`, `judul`, `nama_file`, `tgl_posting`, `hits`) VALUES
(3, 'Membuat Shopping Cart dengan PHP', 'shopping cart.pdf', '2009-02-17', 3),
(5, 'Skrip Captcha', 'captcha.rar', '2009-02-06', 2),
(1, 'Kalender Tahun 2009', 'kalender2009.rar', '2009-02-06', 6),
(8, 'Wallpaper PHP', 'PHP_weapon.jpg', '2009-10-28', 1),
(9, 'Slide  Pemrograman VBA Excell', 'Excell_VBA.ppt', '2009-11-03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `jdl_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gallery_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=48 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `jdl_gallery`, `gallery_seo`, `keterangan`, `gbr_gallery`) VALUES
(3, 12, 'Duduk di Sofa', 'duduk-di-sofa', 'Sekeluarga sedang duduk di sofa.', '27587family sofa.jpg'),
(4, 12, 'Didepan Rumah', 'didepan-rumah', 'Sekeluarga sedang berada di ladang.', '258819family field.jpg'),
(5, 12, 'Keluarga Bahagia', 'keluarga-bahagia', 'Si anak memperlihatkan lukisan.', '697448family.jpg'),
(18, 21, 'Naruto and Crew', 'naruto-and-crew', 'Naruto dan kawan-kawan.', '586303naruto-and-crew.jpg'),
(7, 19, 'Lebah', 'lebah', 'Lebah besar terbang.', '322906lebah.jpg'),
(8, 17, 'Bangunan Jepang', 'bangunan-jepang', 'Bangunan khas jepang', '370422arche037.jpg'),
(9, 17, 'Candi Merang', 'candi-merang', 'Bangunan candi khas kerajaan', '346527arche014.jpg'),
(10, 18, 'Cukur Janggut', 'cukur-janggut', 'Bayi unik sedang cukur rambut', '892395macho4.jpg'),
(11, 18, 'Push Up', 'push-up', 'Bayi unik sedang melakukan push-up', '991546macho1.jpg'),
(12, 19, 'Kuda Nyengir', 'kuda-nyengir', 'Gini nih kalau kuda lagi nyengir.', '658447kuda.jpg'),
(13, 21, 'Super Mario Bross', 'super-mario-bross', 'Game klasik 3D Mario Bross.', '601318mario bros.jpg'),
(32, 21, 'Naruto', 'naruto', 'Kartun ninja jepang Naruto', '45440naruto.jpg'),
(15, 21, 'Superman', 'superman', 'Superman kecil mau beraksi', '689147superman.jpg'),
(17, 21, 'Spongebob', 'spongebob', 'Spongebob', '22491sponge_bob_2.jpg'),
(21, 21, 'Monster', 'monster', 'Film Monster Inc dari Pixar Studio', '937683monster.jpg'),
(19, 21, 'Robot', 'robot', 'Funny 3D Robot', '240447robot.jpg'),
(20, 21, 'Koboi', 'koboi', 'Game dari Film Desperados', '791595desperado.jpg'),
(27, 21, 'Sonic', 'sonic', 'Sonic and Friend', '152618sonic.jpg'),
(24, 21, 'Final Fantasy X', 'final-fantasy-x', 'Rinoa Final Fantasy', '743164fantasy.jpg'),
(31, 21, 'Kungfu Panda', 'kungfu-panda', 'Jack Black', '550598panda2.jpg'),
(33, 21, 'Maskot Euro 2008', 'maskot-euro-2008', 'Trix dan Flix di Euro 2008', '816528mascot.jpg'),
(14, 21, 'Harry Potter', 'harry-potter', 'Game Harry Potter', '735687potter.jpg'),
(42, 21, 'Avatar', 'avatar', 'Eng si Gundul Avatar', '874877avatar.jpg'),
(16, 21, 'Shrek', 'shrek', 'Film 3D Shrek 2', '527801shrek06_800.jpg'),
(44, 21, 'Kenshin', 'kenshin', 'Kenshin Himura', '494110himura.jpg'),
(45, 21, 'Sun Goku', 'sun-goku', 'Goku Cilik', '266845goku.JPG'),
(46, 21, 'Virtual Girl', 'virtual-girl', 'Gadis Cantik 3D', '837921Girl.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
`id_hubungi` int(5) NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`) VALUES
(1, 'Ariawan', 'ariawan@gmail.com', 'Mohon Informasi', 'Mohon informasi mengenai buku yang diterbitkan oleh Lokomedia.', '2008-02-10'),
(4, 'lukman', 'lukman@hakim', 'Request Code', 'Tolong dunk ..', '2009-02-25'),
(6, '', '', '', '', '2017-01-26'),
(7, '', '', '', '', '2017-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `katajelek`
--

CREATE TABLE IF NOT EXISTS `katajelek` (
`id_jelek` int(11) NOT NULL,
  `kata` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `ganti` varchar(60) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `katajelek`
--

INSERT INTO `katajelek` (`id_jelek`, `kata`, `ganti`) VALUES
(4, 'sex', 's**'),
(2, 'bajingan', 'b*******'),
(3, 'bangsat', 'b******');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
`id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `kategori_seo`) VALUES
(19, 'Teknologi', 'teknologi'),
(2, 'Olahraga', 'olahraga'),
(21, 'Ekonomi', 'ekonomi'),
(22, 'Politik', 'politik'),
(23, 'Hiburan', 'hiburan'),
(29, 'Otomotif', 'otomotif');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
`id_komentar` int(5) NOT NULL,
  `id_berita` int(5) NOT NULL,
  `nama_komentar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_berita`, `nama_komentar`, `url`, `isi_komentar`, `tgl`, `jam_komentar`, `aktif`) VALUES
(12, 71, 'Wisnu', 'wisnu.wordpress.com', 'pertamax', '2009-02-02', '08:10:23', 'Y'),
(13, 71, 'Adrian', 'adrian.blogspot.com', 'CR 7 emang idola gua, melesat terus ya prestasinya.', '2009-02-02', '09:06:01', 'Y'),
(15, 79, 'Armen', 'detik.com', 'ahmadinejad emang idolaku', '2009-02-03', '10:05:20', 'Y'),
(17, 74, 'Lukman', 'http://hakim.com', 'apakah browser google secanggih search enginenya?', '2009-02-21', '10:12:23', 'Y'),
(34, 92, 'Rudi', 'bukulokomedia.com', ' Kalau  tentang  gue,  kapan  dibuat  filmnya  ya?   ', '2009-10-28', '21:21:21', 'Y'),
(22, 77, 'Raihan', 'bukulokomedia.com', 'mas .. tolong kirimin source code proyek lokomedia&nbsp; ke email saya di raihan@gmail.com', '2009-08-25', '16:30:00', 'Y'),
(23, 77, 'Wawan', 'bukulokomedia.com', 'woi .. kunjungin dong website saya di http://bukulokomedia.com, jangan lupa kasih komen dan sarannya ya.', '2009-08-25', '16:31:50', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
`id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=47 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(2, 'Manajemen User', '?module=user', '', '', 'N', 'user', 'Y', 1, ''),
(18, 'Berita', '?module=berita', '', '', 'Y', 'user', 'Y', 6, 'semua-berita.html'),
(19, 'Banner', '?module=banner', '', '', 'N', 'admin', 'Y', 9, ''),
(37, 'Profil', '?module=profil', '<b>Bukulokomedia.com</b> merupakan website resmi dari penerbit Lokomedia yang bermarkas di Jl. Arwana No.24 Minomartani Yogyakarta 55581. Dirintis pertama kali oleh Lukmanul Hakim pada tanggal 14 Maret 2008.<br><br>Produk unggulan dari penerbit Lokomedia adalah buku-buku serta aksesoris bertema PHP (<span style="font-weight: bold; font-style: italic;">PHP: Hypertext Preprocessor</span>) yang merupakan pemrograman Internet paling handal saat ini.\r\n', 'gedungku.jpg', 'Y', 'admin', 'Y', 3, 'profil-kami.html'),
(10, 'Manajemen Modul', '?module=modul', '', '', 'N', 'admin', 'Y', 2, ''),
(31, 'Kategori', '?module=kategori', '', '', 'N', 'admin', 'Y', 5, ''),
(33, 'Poling', '?module=poling', '', '', 'N', 'admin', 'Y', 10, ''),
(34, 'Tag (Label)', '?module=tag', '', '', 'N', 'admin', 'Y', 6, ''),
(35, 'Komentar', '?module=komentar', '', '', 'N', 'admin', 'Y', 7, ''),
(36, 'Download', '?module=download', '', '', 'Y', 'admin', 'Y', 8, 'semua-download.html'),
(40, 'Hubungi Kami', '?module=hubungi', '', '', 'Y', 'admin', 'Y', 12, 'hubungi-kami.html'),
(41, 'Agenda', ' ?module=agenda', '', '', 'Y', 'user', 'Y', 4, 'semua-agenda.html'),
(42, 'Shoutbox', '?module=shoutbox', '', '', 'Y', 'admin', 'Y', 13, ''),
(43, 'Album', '?module=album', '', '', 'N', 'admin', 'Y', 14, ''),
(44, 'Galeri Foto', '?module=galerifoto', '', '', 'Y', 'admin', 'Y', 15, ''),
(45, 'Templates', '?module=templates', '', '', 'N', 'admin', 'Y', 16, ''),
(46, 'Kata Jelek', '?module=katajelek', '', '', 'N', 'admin', 'Y', 17, '');

-- --------------------------------------------------------

--
-- Table structure for table `poling`
--

CREATE TABLE IF NOT EXISTS `poling` (
`id_poling` int(5) NOT NULL,
  `pilihan` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `rating` int(5) NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `poling`
--

INSERT INTO `poling` (`id_poling`, `pilihan`, `rating`, `aktif`) VALUES
(1, 'Internet Explorer', 15, 'Y'),
(2, 'Mozilla Firefox', 78, 'Y'),
(3, 'Google Chrome', 21, 'Y'),
(4, 'Opera', 22, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `shoutbox`
--

CREATE TABLE IF NOT EXISTS `shoutbox` (
`id_shoutbox` int(5) NOT NULL,
  `nama` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `website` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `shoutbox`
--

INSERT INTO `shoutbox` (`id_shoutbox`, `nama`, `website`, `pesan`, `tanggal`, `jam`, `aktif`) VALUES
(1, 'lukman', 'lukman.com', 'tes :-) aja ;-D ha ha ha <:D>', '2009-11-02', '00:00:00', 'Y'),
(2, 'hakim', 'hakim.com', 'tes :-) aja ;-D ha ha ha <:D>\r\ndfa\r\nfdas\r\nfdsa\r\nfdasf\r\n:-(', '2009-11-02', '00:00:00', 'Y'),
(3, 'daryono', 'bukulokomedia.com', 'ku tes lagi<br>\r\ntes :-) aja ;-D ha ha ha &lt;:D&gt;<br>\r\ndfa<br>\r\nfdas<br>\r\nfdsa<br>\r\nfdasf<br>\r\n:-(', '2009-11-02', '13:55:00', 'Y'),
(5, 'iin', 'uin-suka.ac.id', 'tes aja euy ;-D boi', '2009-11-03', '11:36:06', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('127.0.0.2', '2009-09-11', 1, '1252681630'),
('127.0.0.1', '2009-09-11', 17, '1252734209'),
('127.0.0.3', '2009-09-12', 8, '1252817594'),
('127.0.0.1', '2009-10-24', 8, '1256381921'),
('127.0.0.1', '2009-10-26', 108, '1256620074'),
('127.0.0.1', '2009-10-27', 52, '1256686769'),
('127.0.0.1', '2009-10-28', 124, '1256792223'),
('127.0.0.1', '2009-10-29', 9, '1256828032'),
('127.0.0.1', '2009-10-31', 3, '1257047101'),
('127.0.0.1', '2009-11-01', 85, '1257113554'),
('127.0.0.1', '2009-11-02', 11, '1257207543'),
('127.0.0.1', '2009-11-03', 165, '1257292312'),
('127.0.0.1', '2009-11-04', 12, '1257351239'),
('::1', '2017-01-26', 128, '1485446020'),
('::1', '2017-01-27', 18, '1485532990'),
('::1', '2017-01-29', 7, '1485705924'),
('::1', '2017-11-16', 1, '1510838867');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`id_tag` int(5) NOT NULL,
  `nama_tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tag_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id_tag`, `nama_tag`, `tag_seo`, `count`) VALUES
(1, 'Palestina', 'palestina', 4),
(2, 'Gaza', 'gaza', 4),
(9, 'Tenis', 'tenis', 5),
(10, 'Sepakbola', 'sepakbola', 3),
(8, 'Laskar Pelangi', 'laskar-pelangi', 2),
(11, 'Amerika', 'amerika', 10),
(12, 'George Bush', 'george-bush', 2),
(13, 'Browser', 'browser', 5),
(14, 'Google', 'google', 2),
(15, 'Israel', 'israel', 4),
(16, 'Komputer', 'komputer', 3),
(17, 'Film', 'film', 2),
(19, 'Mobil', 'mobil', 0);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
`id_templates` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id_templates`, `judul`, `pembuat`, `folder`, `aktif`) VALUES
(1, 'Standar', 'Lukmanul Hakim', 'templates/standar', 'Y'),
(2, 'Building', 'Lukmanul Hakim', 'templates/building', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`, `id_session`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@detik.com', '08238923848', 'admin', 'N', '6pn9gl10nun7jnvei0u29gvj75'),
('sinto ', '958f62f9f8b7f348d08943189fda3b15', 'Sinto Gendeng', 'sinto@detik.com', '09945849545', 'user', 'N', '958f62f9f8b7f348d08943189fda3b15'),
('joko', '4e5ad0dc4d478726661c8c2b3ea31777', 'Joko Sembung', 'joko@detik.com', '0895485045958', 'user', 'N', '4e5ad0dc4d478726661c8c2b3ea31777'),
('wiro', '7577bfe4fecd40c43e6140344d90ce0e', 'Wiro Sableng', 'wiro@detik.com', '038039403948', 'user', 'N', '14c0676a2ff6f9ecd3f3c1cc0c1e8e7f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
 ADD PRIMARY KEY (`id_agenda`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
 ADD PRIMARY KEY (`id_album`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
 ADD PRIMARY KEY (`id_banner`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
 ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
 ADD PRIMARY KEY (`id_download`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`id_gallery`);

--
-- Indexes for table `hubungi`
--
ALTER TABLE `hubungi`
 ADD PRIMARY KEY (`id_hubungi`);

--
-- Indexes for table `katajelek`
--
ALTER TABLE `katajelek`
 ADD PRIMARY KEY (`id_jelek`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
 ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
 ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
 ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `poling`
--
ALTER TABLE `poling`
 ADD PRIMARY KEY (`id_poling`);

--
-- Indexes for table `shoutbox`
--
ALTER TABLE `shoutbox`
 ADD PRIMARY KEY (`id_shoutbox`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
 ADD PRIMARY KEY (`id_templates`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
MODIFY `id_agenda` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
MODIFY `id_banner` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
MODIFY `id_berita` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
MODIFY `id_download` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `hubungi`
--
ALTER TABLE `hubungi`
MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `katajelek`
--
ALTER TABLE `katajelek`
MODIFY `id_jelek` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id_komentar` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `poling`
--
ALTER TABLE `poling`
MODIFY `id_poling` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shoutbox`
--
ALTER TABLE `shoutbox`
MODIFY `id_shoutbox` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
MODIFY `id_templates` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;--
-- Database: `dbtoko`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@detik.com', '08238923848', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
`id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `kategori_seo`) VALUES
(2, 'Nokia', 'nokia'),
(3, 'Sony Ericsson', 'sony-ericsson'),
(4, 'Motorola', 'motorola'),
(5, 'LG', 'lg'),
(6, 'Blackberry', 'blackberry'),
(7, 'Samsung', 'samsung'),
(8, 'Philips', 'philips');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
`id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(18, 'Produk', '?module=produk', '', '', 'Y', 'admin', 'Y', 3, 'semua-berita.html'),
(42, 'Order', '?module=order', '', '', 'N', 'admin', 'Y', 4, ''),
(10, 'Manajemen Modul', '?module=modul', '', '', 'N', 'admin', 'Y', 1, ''),
(31, 'Kategori', '?module=kategori', '', '', 'N', 'admin', 'Y', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id_orders` int(5) NOT NULL,
  `nama_kustomer` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `nama_kustomer`, `alamat`, `telpon`, `email`, `status_order`, `tgl_order`, `jam_order`) VALUES
(13, 'Lukmanul Hakim', 'Jl. Arwana No. 24', '081808083090', '', 'Lunas', '2009-06-04', '22:25:58'),
(14, 'Hendy Irawan, ST', 'Jl. Kaliurang No. 1', '081808083090', '', 'Dikirim', '2009-06-04', '22:28:47'),
(16, 'Ir. Yusuf Mansyur', 'Jl. Solo No. 23 Yogyakarta', '081808083090', '', 'Lunas', '2009-06-04', '22:34:27'),
(31, 'Perwira Abrianto', 'Jl. Arwana No. 24 Minomartani Yogyakarta 55581', '08182838485', 'perwira@gmail.com', 'Dikirim', '2009-10-20', '13:26:15'),
(32, 'Fidy', 'candi', '08291820398', '', 'Baru', '2017-01-27', '01:01:21'),
(33, 'Fidy', 'candi', '08291820398', '', 'Baru', '2017-01-27', '01:01:37'),
(34, 'Fidy', 'candi', '08291820398', '', 'Baru', '2017-01-27', '01:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(16, 6, 1),
(14, 7, 2),
(14, 5, 1),
(13, 6, 1),
(13, 5, 1),
(16, 7, 3),
(17, 7, 1),
(17, 6, 1),
(17, 5, 3),
(20, 5, 3),
(20, 6, 2),
(20, 7, 2),
(21, 7, 1),
(22, 6, 1),
(23, 5, 2),
(24, 6, 1),
(18, 6, 2),
(18, 5, 3),
(26, 5, 2),
(26, 7, 2),
(26, 6, 3),
(0, 6, 2),
(0, 5, 3),
(27, 5, 3),
(27, 6, 2),
(28, 5, 3),
(28, 6, 2),
(29, 5, 3),
(29, 6, 2),
(31, 5, 3),
(31, 6, 2),
(32, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
`id_orders_temp` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=99 ;

--
-- Dumping data for table `orders_temp`
--

INSERT INTO `orders_temp` (`id_orders_temp`, `id_produk`, `id_session`, `jumlah`, `tgl_order_temp`, `jam_order_temp`) VALUES
(98, 8, 'puibqb30usm64eihu0bcjlbi54', 2, '2017-01-27', '11:16:29'),
(96, 8, 'k8s246ubfk0ccn840b4kggl700', 1, '2017-01-26', '17:02:03');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
`id_produk` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `produk_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `produk_seo`, `deskripsi`, `harga`, `stok`, `tgl_masuk`, `gambar`) VALUES
(5, 4, 'Motorola RAZR V3m Red', 'motorola-razr-v3m-red', 'The Motorola Red RAZR V3m for Sprint combines powerful technology and chic style with social activism in a cell phone that makes a strong statement to the world.<br>Features: Bluetooth Wireless Technology, 1.3 Megapixel Digital Camera Takes Print-quality Stills or Video Clips, Less Than 1/2-inch Thick With Feather-touch Precision Crafted Keypad,&nbsp; Built-in Music Player With Removable, Expandable Memory Card Slot, Stunning Red Shell Is Made From Aircraft-grade Aluminum, Motorola Will Contribute A Portion Of The Red Razr Proceeds To Help Fight Aids In Africa, Watch On-demand Sprint TV or Listen To Streaming Music With Sprint Music Store.<br><br>', 2500000, 5, '2009-05-25', '9motorola_razr.jpg'),
(6, 5, 'LG Chocolate VX8550 Blue', 'lg-chocolate-vx8550-blue', 'The LG Chocolate VX8550 for Verizon Wireless - now available with a chic "blue ice" color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br><br>Features:<br><br>    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br>    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br>    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br>    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br>    * Stylish Slider Design With Soft-touch External Controls<br>    * Huge, Vibrant Color Display<br>    * Wirelessly Stream Music To A Stereo Bluetooth Headset<br>', 3450000, 4, '2009-06-02', '39lg_vx8550.jpg'),
(3, 7, 'Samsung FlipShot SCH-U900', 'samsung-flipshot-sch-u900', 'The Samsung U900 for Verizon Wireless is the update to the flagship Samsung A990. Features: Advanced Voice Activated Dialing Requires No Phone Pre-training, Advanced Bluetooth Wireless Technology With Streaming Stereo Music Support, Huge Color Main Display and Color External Display, Built-in Music Player Lets You Download From V CAST Music Service, One of the Best Digital Camera/Camcorders In A Mobile Phone Today, Next Generation (EV-DO) Technology Gives You Downloads At Near-Broadband Speeds, Watch On-demand TV or Listen to Music Via Verizon V CAST, Take Extra-long Video Clips With Very Good Resolution.<br>', 4500000, 7, '2009-06-02', '21samsung_u900.jpg'),
(8, 3, 'Sony Ericsson W200i', 'sony-ericsson-w220i', 'The Sony Ericsson specially Phone for Walkman - now available with a chic "blue ice" color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br><br>Features:<br><br>    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br>    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br>    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br>    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br>    * Stylish Slider Design With Soft-touch External Controls<br>    * Huge, Vibrant Color Display<br>    * Wirelessly Stream Music To A Stereo Bluetooth Headset<br>\r\n', 1100000, 8, '2009-09-28', '36se_w200i.jpg'),
(7, 3, 'Sony Ericsson W880', 'sony-ericsson-w880', 'The Sony Ericsson w880 specially Phone for Walkman and Business - now available with a chic "blue ice" color scheme - is the first Verizon Wireless phone with a soft-touch keypad, external graphic equalizer, streaming or downloadable music from VCAST, and the capability to transfer music to and from your PC (USB cable required).<br><br>Features:<br><br>    * Advanced Voice Dialing Lets Your Operate Your Phone Without Pre-training<br>    * 1.3 Megapixel Camera Takes Print-quality Photo And Hour-long Video Clips<br>    * High-speed Data Downloads Let You Watch TV Or Listen To Streaming Music<br>    * First Phone To Play Either Downloaded V CAST Music or PC-transferred Music Files<br>    * Stylish Slider Design With Soft-touch External Controls<br>    * Huge, Vibrant Color Display<br>    * Wirelessly Stream Music To A Stereo Bluetooth Headset<br>\r\n', 2800000, 9, '2009-09-28', '97se_w880.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
 ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
 ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
 ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
 ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;--
-- Database: `dbujian`
--

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE IF NOT EXISTS `matkul` (
  `id` varchar(20) NOT NULL,
  `kd_mp` varchar(30) NOT NULL,
  `nama_mp` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id`, `kd_mp`, `nama_mp`) VALUES
('1', 'mp1', 'BAHASA INDONESIA'),
('2', 'mp2', 'BAHSA INGGRIS');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
`Id` int(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `divisi` varchar(20) NOT NULL,
  `typeuser` varchar(20) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Id`, `nama`, `email`, `password`, `divisi`, `typeuser`) VALUES
(6, 'admin', 'admin@gmail.com', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `mini_config`
--

CREATE TABLE IF NOT EXISTS `mini_config` (
`id_config` int(11) NOT NULL,
  `site_title` varchar(255) NOT NULL DEFAULT '',
  `site_keyword` varchar(255) NOT NULL DEFAULT '',
  `site_description` text NOT NULL,
  `site_author` varchar(255) NOT NULL DEFAULT '',
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `site_reason` varchar(100) NOT NULL DEFAULT '',
  `site_email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mini_config`
--

INSERT INTO `mini_config` (`id_config`, `site_title`, `site_keyword`, `site_description`, `site_author`, `site_url`, `site_reason`, `site_email`) VALUES
(1, '.::SMP SEPULUH NOPEMBER SIDOARJO::. ', '.::SMP SEPULUH NOPEMBER SIDOARJO::. ', '.::SMP SEPULUH NOPEMBER SIDOARJO::. ', 'SMP SEPULUH NOPEMBER SIDOARJO', 'http://localhost/dbujian', '.::SMP SEPULUH NOPEMBER SIDOARJO::. ', 'webmaster@localhost.com');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id` varchar(12) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `na` float NOT NULL,
  `na1` float NOT NULL,
  `na2` float NOT NULL,
  `tol` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pencacah`
--

CREATE TABLE IF NOT EXISTS `pencacah` (
  `skrip` char(65) COLLATE utf8_bin NOT NULL,
  `cacah` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `pencacah`
--

INSERT INTO `pencacah` (`skrip`, `cacah`) VALUES
('/pegawai/user/index.php', 5),
('/pegawai/index.php', 24),
('/pegawai/admin/index.php', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
`id` tinyint(4) NOT NULL,
  `q` text NOT NULL,
  `question` text NOT NULL,
  `opt1` text NOT NULL,
  `opt2` text NOT NULL,
  `opt3` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tjawab`
--

CREATE TABLE IF NOT EXISTS `tjawab` (
  `nim` varchar(30) NOT NULL,
  `nilai` tinyint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjawab`
--

INSERT INTO `tjawab` (`nim`, `nilai`) VALUES
('201426386', 64),
('201426401', 64),
('201426360', 48),
('201426379', 52),
('201426366', 52),
('201426375', 52),
('201426332', 60),
('201426373', 56),
('201426349', 56),
('201426335', 60),
('201426356', 80),
('201426357', 68),
('201426307', 48),
('201426304', 72),
('201426368', 60),
('201426355', 44),
('201426377', 60),
('201426374', 60),
('201426261', 60),
('201426378', 52),
('201426282', 64),
('201426380', 56),
('201426363', 56),
('201426345', 40),
('201426323', 52),
('201426334', 48),
('201426330', 52),
('201426333', 44),
('201426389', 52),
('201426364', 68),
('201426288', 48),
('201426342', 52),
('201426367', 52),
('201426339', 48),
('201426348', 52),
('201426283', 64),
('201426351', 60),
('201426116', 52),
('201426376', 52),
('201426402', 44),
('201426352', 48),
('201426400', 48),
('201426394', 48),
('2014263472', 44),
('201426392', 56),
('2014263666', 68),
('201426023', 48),
('201426331', 48),
('201426341', 56),
('201426358', 70),
('201426382', 72),
('201426396', 72),
('201426370', 52),
('1234', 4),
('4444', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tjawab1`
--

CREATE TABLE IF NOT EXISTS `tjawab1` (
  `nim` varchar(30) NOT NULL,
  `nilai1` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjawab1`
--

INSERT INTO `tjawab1` (`nim`, `nilai1`) VALUES
('201426386', '96'),
('201426401', '88'),
('201426373', '76'),
('201426356', '88'),
('201426357', '92'),
('201426377', '80'),
('201426349', '72'),
('201426335', '84'),
('201426378', '80'),
('201426360', '60'),
('201426366', '76'),
('201426375', '96'),
('201426332', '92'),
('201426307', '56'),
('201426379', '84'),
('201426396', '88'),
('201426400', '88'),
('201426342', '76'),
('201426304', '76'),
('201426382', '72'),
('201426368', '52'),
('201426363', '64'),
('2014263472', '28'),
('201426394', '36'),
('201426370', '68'),
('201426282', '80'),
('201426334', '36'),
('201426330', '36'),
('201426374', '76'),
('201426283', '56'),
('201426339', '32'),
('201426116', '48'),
('201426389', '68'),
('201426355', '44'),
('201426323', '80'),
('201426380', '80'),
('201426352', '76'),
('201426393', '92'),
('201426023', '92'),
('201426331', '84'),
('201426341', '88'),
('201426358', '70'),
('201426376', '54'),
('201426261', '72'),
('201426351', '72'),
('201426367', '80'),
('201426288', '60'),
('201426348', '68'),
('201426364', '80'),
('201426345', '68'),
('2014263666', '80'),
('201426392', '64'),
('201426402', '80'),
('201426333', '72'),
('1234', '8');

-- --------------------------------------------------------

--
-- Table structure for table `tjawab2`
--

CREATE TABLE IF NOT EXISTS `tjawab2` (
  `nim` varchar(30) NOT NULL,
  `nilai2` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjawab2`
--

INSERT INTO `tjawab2` (`nim`, `nilai2`) VALUES
('201426373', '40'),
('201426386', '48'),
('201426375', '32'),
('2014263472', '28'),
('201426330', '28'),
('201426334', '28'),
('201426282', '36'),
('201426355', '32'),
('201426394', '24'),
('201426370', '36'),
('201426379', '28'),
('201426345', '20'),
('201426331', '20'),
('201426023', '32'),
('201426393', '36'),
('201426392', '28'),
('2014263666', '20'),
('201426401', '55'),
('201426368', '56'),
('201426307', '60'),
('201426358', '74'),
('201426349', '52'),
('201426335', '68'),
('201426304', '78'),
('201426382', '68'),
('201426366', '60'),
('201426332', '68'),
('201426360', '54'),
('201426400', '60'),
('201426396', '84'),
('201426356', '88'),
('201426357', '88'),
('201426352', '60'),
('201426376', '60'),
('201426261', '72'),
('201426339', '56'),
('201426342', '72'),
('201426116', '60'),
('201426351', '68'),
('201426367', '68'),
('201426288', '68'),
('201426348', '68'),
('201426364', '88'),
('201426380', '84\\'),
('201426323', '84'),
('201426363', '72'),
('201426283', '72'),
('201426341', '68'),
('201426374', '76'),
('201426402', '56'),
('201426333', '56');

-- --------------------------------------------------------

--
-- Table structure for table `tsoal`
--

CREATE TABLE IF NOT EXISTS `tsoal` (
  `soalid` int(150) NOT NULL,
  `jawaban` varchar(500) NOT NULL,
  `pertanyaan` varchar(5000) NOT NULL,
  `pilihan_a` varchar(2000) NOT NULL,
  `pilihan_b` varchar(2000) NOT NULL,
  `pilihan_c` varchar(2000) NOT NULL,
  `pilihan_d` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tsoal`
--

INSERT INTO `tsoal` (`soalid`, `jawaban`, `pertanyaan`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`) VALUES
(1, 'c', 'Semua donor harus berbadan sehat. Sebagian donor darah memiliki golongan darah O, jadi ...', 'Sebagian orang yang bergolongan darah O dan menjadi donor darah berbadan sehat.', 'Semua donor harus memiliki golongan darah O dan berbadan sehat.', 'Semua donor darah yang memiliki golongan darah O harus berbadan sehat.', 'Yang berbadan sehat adalah yang memiliki golongan darah O dan menjadi donor darah.'),
(2, 'a', 'Hanya jika berbakat dan bekerja keras, seorang atlet dapat sukses sebagai atlet profesional. Berikut adalah kesimpulan yang secara logis dapat ditarik dari pernyataan di atas:', 'Jika seorang atlet berbakat dan bekerja keras, maka ia akan sukses sebagai atlet profesional.', 'Jika seorang atlet tidak sukses sebagai atlet profesional, maka ia tidak berbakat.', 'Jika seorang atlet tidak sukses sebagai atlet profesional, maka ia bukan pekerja keras.', 'Jika seorang atlet tidak berbakat atau tidak bekerja keras, maka ia tidak akan sukses sebagai atlet profesional.'),
(3, 'b', 'Murid yang pandai dalam matematika lebih mudah belajar bahasa. Orang yang tinggal di negara asing lebih lancar berbicara dalam bahasa yang dipakai di negara tersebut. Tati lancar berbicara dalam bahasa Inggris. Jadi :', 'Mungkin Tati bisu.', 'Mungkin Tati tidak pernah tinggal diluar negeri.', 'Tidak mungkin Tati pernah tinggal di luar negeri.', 'mungkin Tati pandai dalam matematik.'),
(4, 'd', 'Sarjana yang lulus dengan predikat cum laude harus memiliki indeks prestasi di atas 3,5. Beberapa mahasiswa yang menjadi sarjana lulus dengan indeks prestasi di bawah 3,5. Kesimpulan pernyataan di atas adalah :', 'Semua mahasiswa tidak lulus dengan predikat cum laude.', 'Semua mahasiswa yang menjadi sarjana lulus dengan predikat cum laude.', 'Semua mahasiswa yang menjadi sarjana memiliki indeks prestasi di atas 3,5', 'Beberapa mahasiswa yang menjadi sarjana lulus dengan predikat cum laude.');

-- --------------------------------------------------------

--
-- Table structure for table `tsoal1`
--

CREATE TABLE IF NOT EXISTS `tsoal1` (
  `soalid` int(150) NOT NULL,
  `jawaban` varchar(150) NOT NULL,
  `pertanyaan` varchar(5000) NOT NULL,
  `pilihan_a` varchar(200) NOT NULL,
  `pilihan_b` varchar(200) NOT NULL,
  `pilihan_c` varchar(200) NOT NULL,
  `pilihan_d` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tsoal1`
--

INSERT INTO `tsoal1` (`soalid`, `jawaban`, `pertanyaan`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`) VALUES
(1, 'b', '1,3,5,7', '8', '9', '10', '11'),
(2, 'a', 'A,C,E,G', 'I', 'J', 'K', 'L'),
(3, 'c', '3,5,8,12', '15', '16', '17', '19'),
(4, 'a', 'A,D,H,M', 'S', 'T', 'O', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `tsoal2`
--

CREATE TABLE IF NOT EXISTS `tsoal2` (
  `soalid` int(150) NOT NULL,
  `jawaban` varchar(50) NOT NULL,
  `pertanyaan` varchar(2000) NOT NULL,
  `pilihan_a` varchar(50) NOT NULL,
  `pilihan_b` varchar(50) NOT NULL,
  `pilihan_c` varchar(50) NOT NULL,
  `pilihan_d` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tsoal2`
--

INSERT INTO `tsoal2` (`soalid`, `jawaban`, `pertanyaan`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`) VALUES
(1, 'd', 'Amin : Hi, Rais. I wish the eartquake had not hurt your family at all. Rais : Alhamdulilllah, not a', 'it''s okay', 'I don''t care', 'How lucky you are', 'I''m sorry to hear that'),
(2, 'c', 'Andi : I never see you so nervous like this. What happened to you? Malarangeng: I have to do', 'uncertainly', 'dissatisfaction', 'incapability', 'disagreement'),
(3, 'c', 'Zein : Let''s to see Mr. Ruiffi Ronny : ... I also want to see him.', 'Oh you are right', 'I don''t think I can', 'That''s a good idea', 'I like him very much'),
(4, 'd', 'Mila : Will you go with me to the movie Tonight? Euis : I''d love to but I don''t think I can. There', 'accepting ah offer', 'stating agreement', 'asking for permission', 'refusing an Invitation');

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE IF NOT EXISTS `tuser` (
`id` int(10) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `tlp` char(13) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `tuser`
--

INSERT INTO `tuser` (`id`, `nim`, `nama`, `kelas`, `tlp`, `password`, `tanggal`) VALUES
(9, '201126067', 'Steven Gerrard', 'Teknik Informatika', '08123456678', 'rahasia', '2014-06-14'),
(10, '201426375', 'Ilham Hamdani', 'Office Management', '085659623926', '5513', '2014-06-14'),
(11, '201426331', 'heru gunawan', 'Teknik Informatika', '085294234078', '112233', '2014-06-14'),
(12, '201426023', 'novi hendriyana', 'Teknik Informatika', '085310377339', 'novihendriyana', '2014-06-14'),
(13, '201426373', 'Sri susanti', 'Teknik Informatika', '087728116195', 'sripradja17', '2014-06-14'),
(14, '201426393', 'Ridwan Fauzi', 'Business Administration', '085323900079', '02091995', '2014-06-14'),
(15, '201426401', 'chipta adhitya rahman', 'Teknik Informatika', '089662082086', '0265maret', '2014-06-14'),
(16, '201426368', 'Muhamad Syamsan Salsabil', 'Business Administration', '08889370409', '130694', '2014-06-14'),
(17, '201426379', 'rizki muhammad fauzi', 'Teknik Otomotif', '083873591155', 'rizkifauzi', '2014-06-14'),
(18, '201426307', 'tri setiyawati', 'Office Management', '0857864255445', '18021996', '2014-06-14'),
(19, '201426386', 'Widi Nurfatwa', 'Teknik Informatika', '082128788692', 'lindialucu', '2014-06-14'),
(20, '201426358', 'Efembina sipayung', 'Teknik Informatika', '082276196548', 'efembina12', '2014-06-14'),
(21, '201426349', 'yunita ariady', 'Komputer Akuntasi', '085721174541', 'yunita789', '2014-06-14'),
(22, '201426335', 'ulfah nurmaulidiyatu sholihah', 'Komputer Akuntasi', '085294215109', '130410', '2014-06-14'),
(23, '201426304', 'PIPIH HANIPAH', 'Office Management', '08970705917', '100995', '2014-06-14'),
(24, '201426382', 'Fathan Azis', 'Business Administration', '08973970095', 'cintadamai', '2014-06-14'),
(25, '201426366', 'Silvia Wulandari', 'Komputer Akuntasi', '083827500659', 'purwaharja', '2014-06-14'),
(26, '201426332', 'Nursyamsi Agung Gumilar', 'Office Management', '085353653385', 'ujianonline', '2014-06-14'),
(27, '201426360', 'wati Rikawati', 'Teknik Informatika', '087725324702', 'rikawati', '2014-06-14'),
(28, '201426400', 'Muhamad dondon', 'Office Management', '087725476469', 'pastibisa', '2014-06-14'),
(29, '201426396', 'Apriliani Puspa Dewi', 'Office Management', '085316605870', 'rianigasbela', '2014-06-14'),
(30, '201426356', 'agung prayogo', 'Business Administration', '083827803862', 'agung', '2014-06-14'),
(31, '201426370', 'Andi Sutandi', 'Office Management', '085691931641', 'cancel', '2014-06-14'),
(33, '201426357', 'Irsan fahrul pratama', 'Office Management', '085723763747', '180396', '2014-06-14'),
(34, '201426355', 'yogi putra pradana', 'Office Management', '087826586202', 'tasik', '2014-06-14'),
(35, '201426352', 'asna gusliana', 'Office Management', '085220826400', 'bobonolan', '2014-06-14'),
(36, '201426376', 'emma rahmawati', 'Office Management', '085353255304', 'orongoh', '2014-06-14'),
(37, '201426261', 'Lela Sari', 'Komputer Akuntasi', '089672041821', 'wk407203', '2014-06-14'),
(38, '201426339', 'Ridha Fiki Rosyidah', 'Teknik Otomotif', '089650681221', 'ridha', '2014-06-14'),
(39, '201426342', 'Ujang Nanang Qosim', 'Teknik Otomotif', '085624901867', '11121994', '2014-06-14'),
(40, '201426116', 'Veni Komalasari', 'Komputer Akuntasi', '087826106885', 'venikomalasari', '2014-06-14'),
(41, '201426351', 'Ade Reni', 'Komputer Akuntasi', '081320226693', 'bismillah', '2014-06-14'),
(42, '201426367', 'irvan fauzi', 'Teknik Otomotif', '085774763904', 'kutukupret', '2014-06-14'),
(43, '201426288', 'isna nadia zulfa', 'Komputer Akuntasi', '085724222418', 'inaz07', '2014-06-14'),
(44, '201426348', 'Nisa Nur Apipah', 'Teknik Informatika', '085863866433', '02071994', '2014-06-14'),
(45, '201426364', 'Amalia Khoerunnisa', 'Komputer Akuntasi', '085798610640', 'september', '2014-06-14'),
(46, '201426380', 'asep kurniawan', 'Teknik Otomotif', '081214129084', '290195', '2014-06-14'),
(47, '201426323', 'cepi maulana', 'Teknik Informatika', '087728198143', '12345', '2014-06-14'),
(48, '201426345', 'sumarni alawiah', 'Business Administration', '085223117025', '08juni', '2014-06-14'),
(49, '201426282', 'GINA MEILINDA HASANUDIN', 'Komputer Akuntasi', '087708531151', '24112012', '2014-06-14'),
(50, '201426363', 'agustina anggita putri', 'Business Administration', '085795766241', 'putrii', '2014-06-14'),
(51, '201426283', 'Heni Handayani', 'Komputer Akuntasi', '087725794901', 'KAhenhanda', '2014-06-14'),
(52, '201426330', 'Ai Nuraeni', 'Komputer Akuntasi', '082319820219', 'Ainie', '2014-06-14'),
(53, '201426334', 'Nurratri dyah ayu retno palupi', 'Office Management', '88808366329', 'paluvi', '2014-06-14'),
(54, '201426378', 'Dewi Siti Rukoyah', 'Office Management', '087728032730', 'rukoyah', '2014-06-14'),
(55, '201426377', 'Meta Rachmanita Alamsyah', 'Komputer Akuntasi', '087708600309', 'Maret02', '2014-06-14'),
(56, '201426389', 'ulfa rahmatul umah', 'Komputer Akuntasi', '089636314807', 'rahma', '2014-06-14'),
(57, '201426333', 'Rahmat Darmawan', 'Teknik Otomotif', '081221454004', 'rahmat', '2014-06-14'),
(58, '123456', 'bini', 'Teknik Informatika', '025884110003', '123456789', '2014-06-14'),
(59, '201426402', 'Ana Rahmiati', 'Komputer Akuntasi', '083826269985', 'rahmiati', '2014-06-14'),
(67, '115566', 'adamadifa', 'Teknik Informatika', '08964907109', 'adamadifa', '2015-10-17'),
(61, '201426392', 'agung muharam', 'Teknik Otomotif', '085314423566', '17071992', '2014-06-14'),
(62, '201426374', 'Restu Nurochman', 'Teknik Informatika', '085793619850', '06011995', '2014-06-14'),
(63, '201426394', 'sopi meidina', 'Komputer Akuntasi', '082320252559', '04051995', '2014-06-14'),
(64, '2014263472', 'Frans Derian Yudha', 'Business Administration', '0265773374', 'gita gardea', '2014-06-14'),
(65, '2014263666', 'heri herdiansyah', 'Teknik Otomotif', '087826744168', '1234567', '2014-06-14'),
(66, '201426341', 'Tati Sri Maulani', 'Komputer Akuntasi', '087822912841', 'lp3i', '2014-06-14'),
(68, '1234', 'ff', 'Teknik Informatika', '455657754', '1234', '2017-02-01'),
(69, '4567', 'nila', 'Teknik Informatika', '1234567890', '4567', '2017-02-04'),
(70, '4444', 'Fidy', 'Teknik Informatika', '087856877337', '4444', '2017-04-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
 ADD PRIMARY KEY (`kd_mp`), ADD KEY `id` (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`Id`), ADD KEY `Id` (`Id`);

--
-- Indexes for table `mini_config`
--
ALTER TABLE `mini_config`
 ADD PRIMARY KEY (`id_config`);

--
-- Indexes for table `pencacah`
--
ALTER TABLE `pencacah`
 ADD PRIMARY KEY (`skrip`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tjawab`
--
ALTER TABLE `tjawab`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tjawab1`
--
ALTER TABLE `tjawab1`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tjawab2`
--
ALTER TABLE `tjawab2`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tsoal`
--
ALTER TABLE `tsoal`
 ADD PRIMARY KEY (`soalid`);

--
-- Indexes for table `tsoal1`
--
ALTER TABLE `tsoal1`
 ADD PRIMARY KEY (`soalid`);

--
-- Indexes for table `tsoal2`
--
ALTER TABLE `tsoal2`
 ADD PRIMARY KEY (`soalid`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
 ADD PRIMARY KEY (`nim`), ADD UNIQUE KEY `nim` (`nim`), ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `Id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mini_config`
--
ALTER TABLE `mini_config`
MODIFY `id_config` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tuser`
--
ALTER TABLE `tuser`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;--
-- Database: `inventoryv1.2`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
`idbarang` int(11) NOT NULL,
  `namabarang` varchar(200) NOT NULL,
  `serial` text NOT NULL,
  `spare` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `merk` varchar(100) DEFAULT NULL,
  `tipe` varchar(100) DEFAULT NULL,
  `tahun` int(5) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL,
  `ket` text,
  `sparebarang` varchar(100) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`idbarang`, `namabarang`, `serial`, `spare`, `date`, `merk`, `tipe`, `tahun`, `kondisi`, `ket`, `sparebarang`, `foto`) VALUES
(14, 'TV', '2', '3', '2017-12-17 16:36:33', 'paseo', 'tisu', 2016, 'baik', 'j', 'sajd', 'IMG_20170705_130626.jpg'),
(16, 'coba', '7868', '86', '2018-01-11 16:08:18', 'jhaskdljh', 'jhdl', 11, 'jsdhkj', 'jsadhkj', 'jksahd', 'Sunset.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
`id_level` int(11) NOT NULL,
  `level` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level`) VALUES
(1, 'administrator'),
(2, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `modal`
--

CREATE TABLE IF NOT EXISTS `modal` (
`modal_id` int(11) NOT NULL,
  `modal_name` varchar(255) DEFAULT NULL,
  `description` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `modal`
--

INSERT INTO `modal` (`modal_id`, `modal_name`, `description`, `date`) VALUES
(18, 'sad', 'sad', '2017-11-17 10:10:57'),
(19, 'gf', 'add', '2017-11-17 10:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id_user` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level_user` varchar(50) DEFAULT 'administrator'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `password`, `level_user`) VALUES
(1, 'rijal', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator'),
(11, 'Moch. Ilyas', 'ilyas', '3ea4a8e4d7a95ace878f907ab8b72d1b', 'administrator'),
(12, 'client', 'client', '62608e08adc29a8d6dbc9754e659f125', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`idbarang`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
 ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `modal`
--
ALTER TABLE `modal`
 ADD PRIMARY KEY (`modal_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modal`
--
ALTER TABLE `modal`
MODIFY `modal_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;--
-- Database: `latihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bukutamu`
--

CREATE TABLE IF NOT EXISTS `bukutamu` (
  `nama` char(50) NOT NULL,
  `email` char(30) DEFAULT NULL,
  `komentar` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bukutamu`
--

INSERT INTO `bukutamu` (`nama`, `email`, `komentar`) VALUES
('FIDHYA UTAMI', 'Fidhya180395@gmail.com', 'Gak Boleh Komentar'),
('Utami', 'Fidya@gmail.com', 'Bismillah');

-- --------------------------------------------------------

--
-- Table structure for table `liga`
--

CREATE TABLE IF NOT EXISTS `liga` (
  `Kode` char(3) NOT NULL,
  `Negara` char(15) DEFAULT NULL,
  `Champion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liga`
--

INSERT INTO `liga` (`Kode`, `Negara`, `Champion`) VALUES
('bel', 'Belanda', 4),
('ing', 'Inggris', 4),
('jer', 'Jerman', 4),
('spa', 'Spanyol', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tanggal_lahir` varchar(30) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `tempat_lahir`, `tanggal_lahir`, `kelas`, `jurusan`) VALUES
('141080200119', 'Fidhya Utami', 'Sidoarjo', '1995-03-18', '6-B2', 'Teknik Informatika');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukutamu`
--
ALTER TABLE `bukutamu`
 ADD UNIQUE KEY `nama` (`nama`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `email_2` (`email`), ADD UNIQUE KEY `email_3` (`email`);

--
-- Indexes for table `liga`
--
ALTER TABLE `liga`
 ADD UNIQUE KEY `Kode` (`Kode`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
 ADD UNIQUE KEY `nim` (`nim`);
--
-- Database: `loginadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `email`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@admin.com', 1),
(2, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'Guest', 'guest@gmail.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;--
-- Database: `pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(2) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'iniadmin');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pengaduan`
--

CREATE TABLE IF NOT EXISTS `daftar_pengaduan` (
`id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `keluhan` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `daftar_pengaduan`
--

INSERT INTO `daftar_pengaduan` (`id`, `nama`, `alamat`, `keluhan`) VALUES
(4, 'Paijo', 'Sukorejo', 'Sakit gigi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_pengaduan`
--
ALTER TABLE `daftar_pengaduan`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_pengaduan`
--
ALTER TABLE `daftar_pengaduan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `komplain`
--

CREATE TABLE IF NOT EXISTS `komplain` (
`id` int(3) NOT NULL,
  `tanggal` varchar(15) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `kritik` varchar(50) NOT NULL,
  `saran` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `komplain`
--

INSERT INTO `komplain` (`id`, `tanggal`, `nama`, `kelas`, `kritik`, `saran`) VALUES
(25, '01/24/2017', 'Fidy', '7A', 'kurang buku', 'nambah buku'),
(26, '01/28/2017', 'Didi', '7D', 'Test', 'Test'),
(27, '02/18/2017', 'Fidy', '7B', 'Test2', 'Test2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `komplain`
--
ALTER TABLE `komplain`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
`id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
`id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'perpus', 'komplain', 'id', '', '', '_', ''),
(2, 'perpus', 'komplain', 'tanggal', '', '', '_', ''),
(3, 'perpus', 'komplain', 'nama', '', '', '_', ''),
(4, 'perpus', 'komplain', 'kritik', '', '', '_', ''),
(5, 'perpus', 'komplain', 'saran', '', '', '_', ''),
(6, 'perpus', 'komplain', 'kelas', '', '', '_', ''),
(7, 'pkl', 'komplain', 'soal', '', '', '_', ''),
(8, 'pkl', 'komplain', 'jawaban', '', '', '_', ''),
(11, 'dbevent', 'password_resets', 'emai', '', '', '_', ''),
(12, 'dbevent', 'password_resets', 'token', '', '', '_', ''),
(13, 'dbevent', 'password_resets', 'created_at', '', '', '_', ''),
(14, 'dbevent', 'user', 'id', '', '', '_', ''),
(15, 'dbevent', 'user', 'nama', '', '', '_', ''),
(16, 'dbevent', 'user', 'id_organisasi', '', '', '_', ''),
(17, 'dbevent', 'user', 'email', '', '', '_', ''),
(18, 'dbevent', 'user', 'password', '', '', '_', ''),
(19, 'dbevent', 'user', 'level', '', '', '_', ''),
(20, 'dbevent', 'user', 'remember_token', '', '', '_', ''),
(21, 'dbevent', 'user', 'created_at', '', '', '_', ''),
(22, 'dbevent', 'user', 'updated_at', '', '', '_', ''),
(23, 'dbevent', 'tblorganisasi', 'id_organisasi', '', '', '_', ''),
(24, 'dbevent', 'tblorganisasi', 'nama_organisasi', '', '', '_', ''),
(25, 'dbevent', 'tblorganisasi', 'rekening', '', '', '_', ''),
(26, 'dbevent', 'tblorganisasi', 'no_hp', '', '', '_', ''),
(27, 'dbevent', 'tblevent', 'id_event', '', '', '_', ''),
(28, 'dbevent', 'tblevent', 'id', '', '', '_', ''),
(29, 'dbevent', 'tblevent', 'judul', '', '', '_', ''),
(30, 'dbevent', 'tblevent', 'jenis', '', '', '_', ''),
(31, 'dbevent', 'tblevent', 'acc1', '', '', '_', ''),
(32, 'dbevent', 'tblevent', 'acc2', '', '', '_', ''),
(33, 'dbevent', 'tblevent', 'pelaksana', '', '', '_', ''),
(34, 'dbevent', 'tblevent', 'id_tempat', '', '', '_', ''),
(35, 'dbevent', 'tblevent', 'tanggal', '', '', '_', ''),
(36, 'dbevent', 'tblevent', 'waktu', '', '', '_', ''),
(37, 'dbevent', 'tblevent', 'harga', '', '', '_', ''),
(38, 'dbevent', 'tblevent', 'dekripsi', '', '', '_', ''),
(39, 'dbevent', 'tblevent', 'poster', '', '', '_', ''),
(40, 'dbevent', 'tblevent', 'flagevent', '', '', '_', ''),
(41, 'dbevent', 'tbltempat', 'id_tempat', '', '', '_', ''),
(42, 'dbevent', 'tbltempat', 'tempat', '', '', '_', ''),
(43, 'dbevent', 'tbltempat', 'gedung', '', '', '_', ''),
(44, 'dbevent', 'tbltempat', 'lokasi', '', '', '_', ''),
(45, 'dbevent', 'tbltempat', 'kapasitas', '', '', '_', ''),
(46, 'dbevent', 'tbltempat', 'status', '', '', '_', ''),
(47, 'dbevent', 'tblmhs', 'nim', '', '', '_', ''),
(48, 'dbevent', 'tblmhs', 'nama', '', '', '_', ''),
(49, 'dbevent', 'tblmhs', 'jurusan', '', '', '_', ''),
(50, 'dbevent', 'tblmhs', 'jenjang', '', '', '_', ''),
(51, 'dbevent', 'tblmhs', 'tahun_masuk', '', '', '_', ''),
(52, 'dbevent', 'tblmhs', 'password', '', '', '_', ''),
(53, 'dbevent', 'tbldaftar', 'id_daftar', '', '', '_', ''),
(54, 'dbevent', 'tbldaftar', 'id_event', '', '', '_', ''),
(55, 'dbevent', 'tbldaftar', 'nim', '', '', '_', ''),
(56, 'dbevent', 'tbldaftar', 'no', '', '', '_', ''),
(57, 'dbevent', 'tbldaftar', 'no_hp', '', '', '_', ''),
(58, 'dbevent', 'tbldaftar', 'waktu', '', '', '_', ''),
(59, 'dbevent', 'tbljenis', 'jenis', '', '', '_', ''),
(60, 'dbevent', 'tbljenis', 'grade', '', '', '_', ''),
(61, 'dbevent', 'tbljenis', 'peran', '', '', '_', ''),
(62, 'dbevent', 'tbljenis', 'nama_organisasi', '', '', '_', ''),
(63, 'dbevent', 'tbljenis', 'point', '', '', '_', ''),
(64, 'dbevent', 'tblpembayaran', 'id_pembayaran', '', '', '_', ''),
(65, 'dbevent', 'tblpembayaran', 'id_event', '', '', '_', ''),
(66, 'dbevent', 'tblpembayaran', 'id_daftar', '', '', '_', ''),
(67, 'dbevent', 'tblpembayaran', 'nim', '', '', '_', ''),
(68, 'dbevent', 'tblpembayaran', 'waktu', '', '', '_', ''),
(69, 'dbevent', 'tblpembayaran', 'jumlah', '', '', '_', ''),
(70, 'dbevent', 'tblpembayaran', 'bukti', '', '', '_', ''),
(71, 'dbevent', 'tblpembayaran', 'beritaacara', '', '', '_', ''),
(72, 'dbevent', 'tblpembayaran', 'flagkeuangan', '', '', '_', ''),
(73, 'dbevent', 'tblabsen', 'id_absen', '', '', '_', ''),
(74, 'dbevent', 'tblabsen', 'id_event', '', '', '_', ''),
(75, 'dbevent', 'tblabsen', 'nim', '', '', '_', ''),
(76, 'dbevent', 'tblabsen', 'waktu', '', '', '_', ''),
(77, 'dbevent', 'tblabsen', 'status', '', '', '_', ''),
(78, 'datasiswa', 'datasiswa', 'NIS', '', '', '_', ''),
(79, 'datasiswa', 'datasiswa', 'Nama', '', '', '_', ''),
(80, 'akademik', 'keuangan_biaya_kuliah', 'prodi_id', '', '', '_', ''),
(81, 'akademik', 'student_mahasiswa', 'prodi_id', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

--
-- Dumping data for table `pma_designer_coords`
--

INSERT INTO `pma_designer_coords` (`db_name`, `table_name`, `x`, `y`, `v`, `h`) VALUES
('dbevent', 'password_resets', 46, 41, 1, 1),
('dbevent', 'tblabsen', 778, 335, 1, 1),
('dbevent', 'tbldaftar', 514, 195, 1, 1),
('dbevent', 'tblevent', 299, 203, 1, 1),
('dbevent', 'tbljenis', 281, 41, 1, 1),
('dbevent', 'tblmhs', 517, 401, 1, 1),
('dbevent', 'tblorganisasi', 52, 408, 1, 1),
('dbevent', 'tblpembayaran', 752, 40, 1, 1),
('dbevent', 'tbltempat', 303, 601, 1, 1),
('dbevent', 'user', 47, 149, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
`id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_navigationhiding`
--

CREATE TABLE IF NOT EXISTS `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma_navigationhiding`
--

INSERT INTO `pma_navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'laporan', 'table', 'reklame', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
`page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"akademik","table":"keuangan_jenis_bayar"},{"db":"akademik","table":"keuangan_biaya_kuliah"},{"db":"akademik","table":"student_mahasiswa"},{"db":"akademik","table":"keuangan_pembayaran_detail"},{"db":"akademik","table":"keuangan_transaksi"},{"db":"akademik","table":"keuangan_pembayaran"},{"db":"akademik","table":"akademik_prodi"},{"db":"akademik","table":"akademik_konsentrasi"},{"db":"akademik","table":"student_angkatan"},{"db":"akademik","table":"submenu"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma_savedsearches`
--

CREATE TABLE IF NOT EXISTS `pma_savedsearches` (
`id` int(5) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma_table_uiprefs`
--

INSERT INTO `pma_table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'akademik', 'submenu', '{"sorted_col":"`id_submenu` ASC"}', '2018-05-29 04:27:01'),
('root', 'akademik', 'outbox', '{"sorted_col":"`outbox`.`UpdatedInDB` DESC"}', '2018-02-27 14:49:42'),
('root', 'akademik', 'akademik_prodi', '{"sorted_col":"`akademik_prodi`.`prodi_id` ASC"}', '2018-03-28 12:13:17'),
('root', 'akademik', 'akademik_konsentrasi', '{"sorted_col":"`akademik_konsentrasi`.`prodi_id` ASC"}', '2018-03-28 12:16:29'),
('root', 'akademik', 'student_angkatan', '{"sorted_col":"`student_angkatan`.`keterangan` ASC"}', '2018-04-11 13:35:43'),
('root', 'akademik', 'student_mahasiswa', '{"sorted_col":"`mahasiswa_id` ASC"}', '2018-05-29 05:42:20'),
('root', 'akademik', 'keuangan_biaya_kuliah', '{"sorted_col":"`jenis_bayar_id` ASC"}', '2018-07-08 04:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-01-14 17:05:31', '{"collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma_usergroups`
--

CREATE TABLE IF NOT EXISTS `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma_users`
--

CREATE TABLE IF NOT EXISTS `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_history`
--
ALTER TABLE `pma_history`
 ADD PRIMARY KEY (`id`), ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
 ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
 ADD PRIMARY KEY (`page_nr`), ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma_recent`
--
ALTER TABLE `pma_recent`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_relation`
--
ALTER TABLE `pma_relation`
 ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`), ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma_table_info`
--
ALTER TABLE `pma_table_info`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
 ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma_tracking`
--
ALTER TABLE `pma_tracking`
 ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
 ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma_users`
--
ALTER TABLE `pma_users`
 ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `pma_history`
--
ALTER TABLE `pma_history`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;--
-- Database: `pkl`
--

-- --------------------------------------------------------

--
-- Table structure for table `komplain`
--

CREATE TABLE IF NOT EXISTS `komplain` (
`id` int(3) NOT NULL,
  `soal` varchar(50) NOT NULL,
  `jawaban` varchar(15) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `komplain`
--

INSERT INTO `komplain` (`id`, `soal`, `jawaban`) VALUES
(25, 'kurang buku', 'Fidy'),
(26, '', ''),
(27, '', ''),
(28, '', ''),
(29, 'kkkk', 'a'),
(30, 'Satu ditambah satu sama dengan???', 'DUA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `komplain`
--
ALTER TABLE `komplain`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;--
-- Database: `reklame`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `user_admin` varchar(10) NOT NULL,
  `pass_admin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user_admin`, `pass_admin`) VALUES
('admin', 'admin'),
('reza123', 'reza123');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
`id_laporan` int(5) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `lokasi` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_upload` date NOT NULL,
  `diupload` varchar(20) NOT NULL,
  `status` enum('Belum Ditindak','Sudah Ditindak','','') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `gambar`, `lokasi`, `deskripsi`, `tgl_upload`, `diupload`, `status`) VALUES
(38, '1631711.jpg', 'Balongbendo', 'test dirubah\r\n', '2017-01-24', '123', 'Sudah Ditindak'),
(39, 'Twitter-Backgrounds-Wallpapers-18.jpeg', 'Balongbendo', 'testttt', '2017-01-24', '1234', 'Belum Ditindak'),
(40, 'lightening_twitter_background_by_debzb17-d543cn8.jpg', 'Balongbendo', 'test laporan', '2017-01-24', '123', 'Belum Ditindak'),
(41, 'url4.jpg', 'Tulangan', 'test lagi', '2017-01-24', '1234', 'Belum Ditindak');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE IF NOT EXISTS `lokasi` (
  `id_lokasi` varchar(20) NOT NULL,
  `nama_lokasi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`) VALUES
('Balongbendo', 'Balongbendo'),
('Buduran', 'Buduran'),
('Candi', 'Candi'),
('Gedangan', 'Gedangan'),
('Sidoarjo', 'Sidoarjo'),
('Tulangan', 'Tulangan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `nama` varchar(20) NOT NULL,
  `ktp` varchar(16) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`nama`, `ktp`, `username`, `password`, `tgl_lahir`, `jk`, `alamat`, `telp`, `email`) VALUES
('Reza Cahyanto', '123', '', '', '2017-01-01', 'L', 'Jl. abcdefg', '0857000000', 'reza@gmail.com'),
('Reza', '1234', '', '', '2017-01-02', 'L', 'Gedangan', '085222222', 'reza@gmail.com'),
('Fidhya', '4444', 'Fidhya', '123456', '1995-03-18', 'P', 'Candi Sayang', '08123334566', 'Fidhya@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`user_admin`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
 ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
 ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`ktp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
MODIFY `id_laporan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;--
-- Database: `ujian`
--

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE IF NOT EXISTS `mapel` (
  `kd_mapel` varchar(10) NOT NULL,
  `nama_mapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`kd_mapel`, `nama_mapel`) VALUES
('bind', 'Bahasa Indonesia'),
('bing', 'Bahasa Inggris'),
('mtk', 'Matematika');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE IF NOT EXISTS `soal` (
`id_soal` int(5) NOT NULL,
  `kd_mapel` varchar(10) NOT NULL,
  `pertanyaan` text NOT NULL,
  `pilihan_a` text NOT NULL,
  `pilihan_b` text NOT NULL,
  `pilihan_c` text NOT NULL,
  `pilihan_d` text NOT NULL,
  `jawaban` varchar(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `kd_mapel`, `pertanyaan`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `jawaban`) VALUES
(1, 'mtk', '1+1 ?', '1', '2', '3', '4', 'b'),
(2, 'mtk', '2+2 ?', '2', '4', '6', '8', 'b'),
(3, 'bind', 'Kata tanya', 'Siapa', 'Ya', 'Tidak', 'Baik', 'a'),
(5, 'bing', 'What ... you doing ?', 'are ', 'is', 'am', 'of', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
 ADD PRIMARY KEY (`kd_mapel`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
 ADD PRIMARY KEY (`id_soal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;--
-- Database: `webauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_pwd`
--
ALTER TABLE `user_pwd`
 ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
