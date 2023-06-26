-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 02:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_hubungan`
--

CREATE TABLE `tabel_hubungan` (
  `id_hub` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `status_hubungan` enum('Kandung','Tiri') NOT NULL,
  `keterangan` enum('Ayah','Ibu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_kelas`
--

CREATE TABLE `tabel_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `jurusan` enum('IPA','IPS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_ortu`
--

CREATE TABLE `tabel_ortu` (
  `id_ortu` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status` enum('Hidup','Alm') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_poin`
--

CREATE TABLE `tabel_poin` (
  `id_poin` int(10) NOT NULL,
  `nama_poin` varchar(15) NOT NULL,
  `bobot` varchar(10) NOT NULL,
  `jenis` enum('Prestasi','Pelanggaran') NOT NULL,
  `status` enum('True','False') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_semester`
--

CREATE TABLE `tabel_semester` (
  `id_semester` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_poin` int(10) NOT NULL,
  `id_wali` int(10) NOT NULL,
  `id_ortu` int(10) NOT NULL,
  `tanggal` date NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `status` enum('Lulus','Tidak Lulus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_user`
--

CREATE TABLE `tabel_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  `level` varchar(15) NOT NULL,
  `status` enum('Ayah','Ibu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_wali_kelas`
--

CREATE TABLE `tabel_wali_kelas` (
  `id_wali` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `matpel` varchar(15) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `status` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_siswa`
--

CREATE TABLE `table_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nik` varchar(13) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telpon` varchar(13) NOT NULL,
  `status` enum('aktif','tidak') NOT NULL,
  `tingkat_kelas` enum('10','11','12') NOT NULL,
  `jurusan` enum('IPA','IPS') NOT NULL,
  `id_wali` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  ADD PRIMARY KEY (`id_hub`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_ortu`),
  ADD UNIQUE KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_siswa` (`id_siswa`,`id_ortu`);

--
-- Indexes for table `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD UNIQUE KEY `jurusan_2` (`jurusan`),
  ADD UNIQUE KEY `jurusan_3` (`jurusan`),
  ADD KEY `jurusan` (`jurusan`);

--
-- Indexes for table `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `tabel_poin`
--
ALTER TABLE `tabel_poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD UNIQUE KEY `id_siswa_2` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_siswa_3` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD UNIQUE KEY `id_wali` (`id_wali`),
  ADD KEY `id_siswa` (`id_siswa`,`id_wali`,`id_ortu`,`id_poin`),
  ADD KEY `id_poin` (`id_poin`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- Indexes for table `tabel_user`
--
ALTER TABLE `tabel_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  ADD PRIMARY KEY (`id_wali`);

--
-- Indexes for table `table_siswa`
--
ALTER TABLE `table_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `jurusan_2` (`jurusan`,`id_wali`),
  ADD UNIQUE KEY `jurusan_3` (`jurusan`,`id_wali`),
  ADD UNIQUE KEY `jurusan_4` (`jurusan`,`id_wali`),
  ADD KEY `jurusan` (`jurusan`,`id_wali`),
  ADD KEY `id_wali` (`id_wali`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  MODIFY `id_hub` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_ortu`
--
ALTER TABLE `tabel_ortu`
  MODIFY `id_ortu` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_poin`
--
ALTER TABLE `tabel_poin`
  MODIFY `id_poin` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_semester`
--
ALTER TABLE `tabel_semester`
  MODIFY `id_semester` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_user`
--
ALTER TABLE `tabel_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_wali_kelas`
--
ALTER TABLE `tabel_wali_kelas`
  MODIFY `id_wali` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_siswa`
--
ALTER TABLE `table_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_hubungan`
--
ALTER TABLE `tabel_hubungan`
  ADD CONSTRAINT `tabel_hubungan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `table_siswa` (`id_siswa`),
  ADD CONSTRAINT `tabel_hubungan_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `tabel_ortu` (`id_ortu`);

--
-- Constraints for table `tabel_kelas`
--
ALTER TABLE `tabel_kelas`
  ADD CONSTRAINT `tabel_kelas_ibfk_1` FOREIGN KEY (`jurusan`) REFERENCES `table_siswa` (`jurusan`);

--
-- Constraints for table `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD CONSTRAINT `tabel_semester_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `table_siswa` (`id_siswa`),
  ADD CONSTRAINT `tabel_semester_ibfk_2` FOREIGN KEY (`id_poin`) REFERENCES `tabel_poin` (`id_poin`),
  ADD CONSTRAINT `tabel_semester_ibfk_3` FOREIGN KEY (`id_wali`) REFERENCES `tabel_wali_kelas` (`id_wali`),
  ADD CONSTRAINT `tabel_semester_ibfk_4` FOREIGN KEY (`id_ortu`) REFERENCES `tabel_ortu` (`id_ortu`);

--
-- Constraints for table `table_siswa`
--
ALTER TABLE `table_siswa`
  ADD CONSTRAINT `table_siswa_ibfk_1` FOREIGN KEY (`id_wali`) REFERENCES `tabel_wali_kelas` (`id_wali`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
