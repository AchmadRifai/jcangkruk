/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `jcafe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jcafe`;

CREATE TABLE IF NOT EXISTS `absensi` (
  `peg` varchar(30) NOT NULL,
  `tgl` date NOT NULL,
  `ket` text NOT NULL DEFAULT '',
  KEY `FK__karyawan` (`peg`),
  CONSTRAINT `FK__karyawan` FOREIGN KEY (`peg`) REFERENCES `karyawan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `aset` (
  `kode` varchar(20) NOT NULL DEFAULT '',
  `nm` varchar(30) NOT NULL DEFAULT '',
  `ket` text NOT NULL DEFAULT '0',
  `jum` bigint(20) NOT NULL DEFAULT 0,
  `liquid` tinyint(1) NOT NULL DEFAULT 0,
  `tetap` tinyint(1) NOT NULL DEFAULT 0,
  `beban` tinyint(1) NOT NULL DEFAULT 0,
  `hutang` tinyint(1) NOT NULL DEFAULT 0,
  `piutang` tinyint(1) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `aset` DISABLE KEYS */;
INSERT INTO `aset` (`kode`, `nm`, `ket`, `jum`, `liquid`, `tetap`, `beban`, `hutang`, `piutang`, `hapus`) VALUES
	('bayar', 'keluaran', '-', 0, 0, 0, 1, 0, 0, 0),
	('hutang', 'beban hutang', '-', 0, 0, 0, 0, 1, 0, 0),
	('kas', 'kas utama', '-', 0, 1, 0, 0, 0, 0, 0),
	('piutang', 'uang diluar', '-', 0, 0, 0, 0, 0, 1, 0);
/*!40000 ALTER TABLE `aset` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `bahan` (
  `kode` varchar(30) NOT NULL,
  `nm` varchar(40) NOT NULL,
  `pos` varchar(10) NOT NULL,
  `ket` text NOT NULL DEFAULT '',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK__bahan_pos` (`pos`),
  CONSTRAINT `FK__bahan_pos` FOREIGN KEY (`pos`) REFERENCES `bahan_pos` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `bahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `bahan_pos` (
  `kode` varchar(10) NOT NULL,
  `ket` text NOT NULL DEFAULT '',
  `kat` text NOT NULL DEFAULT '',
  `pos` text NOT NULL DEFAULT '',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `bahan_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahan_pos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `barang` (
  `kode` varchar(30) NOT NULL,
  `gbr` text NOT NULL DEFAULT '',
  `nm` varchar(50) NOT NULL DEFAULT '',
  `kat` varchar(10) NOT NULL DEFAULT '',
  `hrg` bigint(20) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK_barang_kat_brg` (`kat`),
  CONSTRAINT `FK_barang_kat_brg` FOREIGN KEY (`kat`) REFERENCES `kat_brg` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_psk` (
  `bhn` varchar(50) NOT NULL,
  `jum` float NOT NULL DEFAULT 0,
  `sat` bigint(20) NOT NULL DEFAULT 0,
  `psk` varchar(70) NOT NULL,
  KEY `FK__sat_bahan` (`bhn`),
  KEY `FK__pasok` (`psk`),
  CONSTRAINT `FK__pasok` FOREIGN KEY (`psk`) REFERENCES `pasok` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__sat_bahan` FOREIGN KEY (`bhn`) REFERENCES `sat_bahan` (`barkode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `item_psk` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_psk` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `item_psn` (
  `nota` varchar(40) NOT NULL,
  `brg` varchar(30) NOT NULL,
  `jum` float NOT NULL DEFAULT 0,
  `sat` bigint(20) NOT NULL DEFAULT 0,
  KEY `FK_item_psn_pesanan` (`nota`),
  KEY `FK_item_psn_barang` (`brg`),
  CONSTRAINT `FK_item_psn_barang` FOREIGN KEY (`brg`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_psn_pesanan` FOREIGN KEY (`nota`) REFERENCES `pesanan` (`nota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `item_psn` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_psn` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `jabatan` (
  `kode` varchar(20) NOT NULL,
  `nm` varchar(20) NOT NULL,
  `gaji` bigint(20) NOT NULL DEFAULT 0,
  `pol` int(11) NOT NULL DEFAULT 0,
  `saitik` int(11) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` (`kode`, `nm`, `gaji`, `pol`, `saitik`, `hapus`) VALUES
	('akutan', 'keuangan', 5000000, 10, 2, 0),
	('gudang', 'bhuri', 4000000, 15, 4, 0),
	('kasir', 'mbayare', 3500000, 4, 1, 0),
	('koki', 'seng masak', 4500000, 10, 3, 0),
	('master', 'database', 5500000, 2, 1, 0),
	('owner', 'dhuwe', 0, 1, 1, 0),
	('parkir', 'parkir', 2500000, 1, 1, 0),
	('waitres', 'pelayan', 3000000, 20, 5, 0);
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `jejak` (
  `peg` varchar(30) NOT NULL,
  `tgl` date NOT NULL DEFAULT curdate(),
  `jam` time NOT NULL DEFAULT curtime(),
  `ket` text NOT NULL DEFAULT '',
  KEY `FK_jejak_karyawan` (`peg`),
  CONSTRAINT `FK_jejak_karyawan` FOREIGN KEY (`peg`) REFERENCES `karyawan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `jejak` DISABLE KEYS */;
/*!40000 ALTER TABLE `jejak` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `karyawan` (
  `kode` varchar(30) NOT NULL,
  `jab` varchar(20) NOT NULL,
  `pass` text NOT NULL DEFAULT '',
  `nik` varchar(30) NOT NULL,
  `nm` varchar(50) NOT NULL,
  `almt` text NOT NULL DEFAULT '',
  `tlp` varchar(20) NOT NULL DEFAULT '',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK_karyawan_jabatan` (`jab`),
  CONSTRAINT `FK_karyawan_jabatan` FOREIGN KEY (`jab`) REFERENCES `jabatan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `kat_brg` (
  `kode` varchar(10) NOT NULL,
  `nm` varchar(20) NOT NULL,
  `gbr` text NOT NULL DEFAULT '',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `kat_brg` DISABLE KEYS */;
/*!40000 ALTER TABLE `kat_brg` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `komposisi` (
  `brg` varchar(30) NOT NULL,
  `bhn` varchar(50) NOT NULL,
  `jum` float NOT NULL DEFAULT 0,
  KEY `FK_komposisi_barang` (`brg`),
  KEY `FK_komposisi_sat_bahan` (`bhn`),
  CONSTRAINT `FK_komposisi_barang` FOREIGN KEY (`brg`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_komposisi_sat_bahan` FOREIGN KEY (`bhn`) REFERENCES `sat_bahan` (`barkode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `komposisi` DISABLE KEYS */;
/*!40000 ALTER TABLE `komposisi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `markir` (
  `gon` varchar(20) NOT NULL,
  `tgl` date NOT NULL DEFAULT curdate(),
  `turun` time NOT NULL DEFAULT curtime(),
  `pergi` timestamp NULL DEFAULT NULL,
  `byr` bigint(20) NOT NULL DEFAULT 0,
  `tulis` varchar(40) NOT NULL,
  KEY `FK__parkiran` (`gon`),
  KEY `FK_markir_transaksi` (`tulis`),
  CONSTRAINT `FK__parkiran` FOREIGN KEY (`gon`) REFERENCES `parkiran` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_markir_transaksi` FOREIGN KEY (`tulis`) REFERENCES `transaksi` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `markir` DISABLE KEYS */;
/*!40000 ALTER TABLE `markir` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `meja` (
  `nomor` int(11) NOT NULL,
  `gbr` text NOT NULL DEFAULT '',
  `pakai` tinyint(1) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`nomor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `meja` DISABLE KEYS */;
/*!40000 ALTER TABLE `meja` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `parkiran` (
  `kode` varchar(20) NOT NULL,
  `ket` text NOT NULL DEFAULT '',
  `pos` text NOT NULL DEFAULT '',
  `pakai` tinyint(1) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `parkiran` DISABLE KEYS */;
/*!40000 ALTER TABLE `parkiran` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasok` (
  `kode` varchar(70) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `bukti` varchar(40) NOT NULL DEFAULT '',
  `sales` varchar(50) NOT NULL DEFAULT '',
  `ket` text NOT NULL DEFAULT '',
  `jum` bigint(20) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK_pasok_sales` (`sales`),
  KEY `FK_pasok_transaksi` (`bukti`),
  CONSTRAINT `FK_pasok_sales` FOREIGN KEY (`sales`) REFERENCES `sales` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pasok_transaksi` FOREIGN KEY (`bukti`) REFERENCES `transaksi` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasok` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasok` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pesanan` (
  `nota` varchar(40) NOT NULL,
  `simpan` varchar(40) DEFAULT NULL,
  `meja` int(11) NOT NULL DEFAULT 0,
  `tot` bigint(20) NOT NULL DEFAULT 0,
  `byr` bigint(20) NOT NULL DEFAULT 0,
  `kbl` bigint(20) NOT NULL DEFAULT 0,
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`nota`),
  KEY `FK_pesanan_transaksi` (`simpan`),
  KEY `FK_pesanan_meja` (`meja`),
  CONSTRAINT `FK_pesanan_meja` FOREIGN KEY (`meja`) REFERENCES `meja` (`nomor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pesanan_transaksi` FOREIGN KEY (`simpan`) REFERENCES `transaksi` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `sales` (
  `kode` varchar(50) NOT NULL,
  `dari` varchar(30) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `nm` varchar(40) NOT NULL,
  `almt` text NOT NULL DEFAULT '',
  `tlp` varchar(20) NOT NULL DEFAULT '0',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK__suplier` (`dari`),
  CONSTRAINT `FK__suplier` FOREIGN KEY (`dari`) REFERENCES `suplier` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `sat_bahan` (
  `barkode` varchar(50) NOT NULL,
  `bahan` varchar(30) NOT NULL,
  `sat` varchar(10) NOT NULL,
  `stok` double NOT NULL DEFAULT 0,
  `banding_jum` double NOT NULL DEFAULT 0,
  `banding_sat` varchar(10) NOT NULL DEFAULT '0',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`barkode`),
  KEY `FK__bahan` (`bahan`),
  CONSTRAINT `FK__bahan` FOREIGN KEY (`bahan`) REFERENCES `bahan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `sat_bahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `sat_bahan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `suplier` (
  `kode` varchar(30) NOT NULL,
  `nm` varchar(50) NOT NULL,
  `almt` text NOT NULL DEFAULT '',
  `tlp` varchar(20) NOT NULL DEFAULT '',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `suplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `suplier` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `transaksi` (
  `kode` varchar(40) NOT NULL,
  `sumber` varchar(20) NOT NULL,
  `untuk` varchar(20) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `jum` bigint(20) NOT NULL DEFAULT 0,
  `ket` text NOT NULL DEFAULT '0',
  `hapus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kode`),
  KEY `FK__aset` (`sumber`),
  KEY `FK__aset_2` (`untuk`),
  CONSTRAINT `FK__aset` FOREIGN KEY (`sumber`) REFERENCES `aset` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__aset_2` FOREIGN KEY (`untuk`) REFERENCES `aset` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
