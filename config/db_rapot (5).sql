-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 25, 2025 at 03:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rapot`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id_access` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`id_access`, `role`) VALUES
(1, 'admin'),
(2, 'guru'),
(3, 'siswa');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `gelar_depan` varchar(50) NOT NULL,
  `gelar_belakang` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `mapel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `nip`, `gelar_depan`, `gelar_belakang`, `email`, `no_hp`, `mapel_id`) VALUES
(1, 'Siti Rahmawati', '197812312022012001', '', 'S.Pd.', 'siti.rahmawati@smkn2cmi.sch.id', '081234567890', 1),
(2, 'Bambang Hartono', '197911222021111001', '', 'S.Pd.', 'bambang.hartono@smkn2cmi.sch.id', '081234567891', 5),
(3, 'Dewi Lestari', '198001152020102002', '', 'S.Pd.', 'dewi.lestari@smkn2cmi.sch.id', '081234567892', 3),
(4, 'Andi Wijaya', '198203032019032003', '', 'S.Kom.', 'andi.wijaya@smkn2cmi.sch.id', '081234567893', 9),
(5, 'Nurul Hidayah', '198504282018082004', '', 'S.Pd.', 'nurul.hidayah@smkn2cmi.sch.id', '081234567894', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'Mekatronika'),
(3, 'Design Visual Komunikasi'),
(4, 'Teknik Kimia Industri'),
(5, 'Mesin'),
(6, 'Animasi');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `hadir` int(11) DEFAULT NULL,
  `izin` int(11) DEFAULT NULL,
  `sakit` int(11) DEFAULT NULL,
  `alpha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_siswa`, `hadir`, `izin`, `sakit`, `alpha`) VALUES
(1, 1, 180, 2, 1, 0),
(2, 2, 178, 3, 2, 0),
(3, 3, 175, 5, 2, 1),
(4, 4, 177, 4, 3, 0),
(5, 5, 179, 1, 0, 0),
(6, 6, 176, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `tingkat` enum('X','XI','XII') NOT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  `wali_kelas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `tingkat`, `id_jurusan`, `wali_kelas`) VALUES
(1, 'X RPL A', 'X', 1, 'Siti Rahmawati'),
(2, 'XI RPL B', 'XI', 1, 'Bambang Hartono'),
(3, 'XII RPL A', 'XII', 1, 'Dewi Lestari'),
(4, 'X Mekatronika A', 'X', 2, 'Andi Wijaya'),
(5, 'XI DKV C', 'XI', 3, 'Nurul Hidayah');

-- --------------------------------------------------------

--
-- Table structure for table `kepala_sekolah`
--

CREATE TABLE `kepala_sekolah` (
  `id` int(11) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `gelar_depan` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `gelar_belakang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kepala_sekolah`
--

INSERT INTO `kepala_sekolah` (`id`, `nip`, `gelar_depan`, `nama`, `gelar_belakang`) VALUES
(1, '197905022006041014', 'Prof.', 'Arul Fitrah Insani', 'S.Pd, S.T, S.Kom.');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'Pendidikan Agama dan Budi Pekerti'),
(2, 'Pendidikan Pancasila dan Kewarganegaraan'),
(3, 'Bahasa Indonesia'),
(4, 'Bahasa Inggris'),
(5, 'Matematika'),
(6, 'Pendidikan Jasmani, Olahraga, dan Kesehatan'),
(7, 'Informatika'),
(8, 'Pemrograman Dasar'),
(9, 'Pemrograman Web'),
(10, 'Basis Data'),
(11, 'Pemrograman Berorientasi Objek'),
(12, 'Dasar-dasar Mekatronika'),
(13, 'Mekatronika Industri'),
(14, 'Sensor dan Aktuator'),
(15, 'Dasar Desain Grafis'),
(16, 'Multimedia'),
(17, 'Animasi 2D dan 3D'),
(18, 'Proses Kimia Industri'),
(19, 'Keselamatan Kerja Industri Kimia'),
(20, 'Instrumentasi Proses Kimia'),
(21, 'Gambar Teknik Mesin'),
(22, 'Teknik Pemesinan Bubut'),
(23, 'Teknik Fabrikasi Logam'),
(24, 'Animasi Dasar'),
(25, 'Storyboard'),
(26, 'Produksi Animasi');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `nilai_akhir` int(11) DEFAULT NULL,
  `capaian_kompetensi` text DEFAULT NULL,
  `id_guru` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `non_akademik`
--

CREATE TABLE `non_akademik` (
  `id_non_akademik` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `disiplin` varchar(50) DEFAULT NULL,
  `tanggung_jawab` varchar(50) DEFAULT NULL,
  `kerja_sama` varchar(50) DEFAULT NULL,
  `inisiatif` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `non_akademik`
--

INSERT INTO `non_akademik` (`id_non_akademik`, `id_siswa`, `disiplin`, `tanggung_jawab`, `kerja_sama`, `inisiatif`, `catatan`) VALUES
(1, 1, 'Baik', 'Sangat Baik', 'Baik', 'Cukup', 'Perlu lebih aktif dalam diskusi kelas'),
(2, 2, 'Sangat Baik', 'Sangat Baik', 'Sangat Baik', 'Baik', 'Siswa aktif dan bertanggung jawab'),
(3, 3, 'Cukup', 'Baik', 'Cukup', 'Cukup', 'Perlu meningkatkan kedisiplinan waktu'),
(4, 4, 'Baik', 'Cukup', 'Baik', 'Baik', 'Perlu lebih banyak berpartisipasi dalam proyek'),
(5, 5, 'Sangat Baik', 'Baik', 'Sangat Baik', 'Sangat Baik', 'Menunjukkan inisiatif tinggi dalam kelompok'),
(6, 6, 'Baik', 'Baik', 'Baik', 'Baik', 'Sikap konsisten dan cukup aktif di kelas');

-- --------------------------------------------------------

--
-- Table structure for table `projek_p5`
--

CREATE TABLE `projek_p5` (
  `id_projek` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projek_p5`
--

INSERT INTO `projek_p5` (`id_projek`, `id_siswa`, `tema`, `deskripsi`) VALUES
(1, 1, 'Kewirausahaan', 'Membuat produk digital dan menjualnya melalui media sosial.'),
(2, 2, 'Gaya Hidup Berkelanjutan', 'Menanam dan merawat tanaman sayur di lingkungan sekolah.'),
(3, 3, 'Kearifan Lokal', 'Mengangkat seni budaya lokal melalui pameran digital.'),
(4, 4, 'Suara Demokrasi', 'Melaksanakan simulasi pemilihan ketua OSIS yang adil dan transparan.'),
(5, 5, 'Rekayasa dan Teknologi', 'Merancang alat penyiram otomatis untuk tanaman.'),
(6, 6, 'Bangunlah Jiwa dan Raganya', 'Mengadakan kegiatan senam dan edukasi hidup sehat di sekolah.');

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `id` int(11) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `npsn` varchar(20) NOT NULL,
  `nss` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `desa` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`id`, `jenjang`, `npsn`, `nss`, `nama`, `jalan`, `desa`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `telepon`, `fax`, `email`, `website`) VALUES
(1, 'SMK', '12321', '1234121', 'SMKN 2 Cimahi', 'Kamarung', 'Kamarung', 'Citeureup', 'Cimahi Utara', 'Jawa Barat', '12312', '08465441', '213', 'smkn2@gmail.com', 'https://smkn2cmi.sch.id/');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `nama_semester` enum('Ganjil','Genap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_semester`, `nama_semester`) VALUES
(1, 'Ganjil'),
(2, 'Genap');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `nisn` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(120) NOT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `nis`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `id_jurusan`, `id_kelas`) VALUES
(1, 'Ahmad Fauzi', '121001', '0056789123', 'Bandung', '2006-03-12', 'L', '081232131', 1, 1),
(2, 'Budi Santoso', '121002', '0056789124', 'Cimahi', '2006-06-18', 'L', '011287387', 2, 2),
(3, 'Citra Lestari', '121003', '0056789125', 'Garut', '2007-02-28', 'P', '0813213', 3, 3),
(4, 'Dewi Ramadhani', '121004', '0056789126', 'Tasikmalaya', '2006-08-15', 'L', '0812314', 4, 4),
(5, 'Eko Saputra', '121005', '0056789127', 'Cianjur', '2008-01-10', 'L', '0896754', 5, 2),
(6, 'Fajar Nugroho', '121006', '0056789128', 'Sumedang', '2007-07-04', 'L', '085678676', 6, 4),
(13, 'Arul Fitrah Insani', '102205800', '0064006588', 'Pada dia yang menawan sekali semoga dia di jaga', '2007-12-04', 'L', '081221827997', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_pelajaran`
--

CREATE TABLE `tahun_pelajaran` (
  `id_tahun` int(11) NOT NULL,
  `tahun` varchar(9) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT 'Tidak Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tahun_pelajaran`
--

INSERT INTO `tahun_pelajaran` (`id_tahun`, `tahun`, `status`) VALUES
(1, '2023/2024', 'Tidak Aktif'),
(2, '2024/2025', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_semester`
--

CREATE TABLE `tahun_semester` (
  `id_tahun_semester` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT 'Tidak Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tahun_semester`
--

INSERT INTO `tahun_semester` (`id_tahun_semester`, `id_tahun`, `id_semester`, `status`) VALUES
(1, 2, 1, 'Aktif'),
(2, 2, 2, 'Tidak Aktif'),
(3, 1, 1, 'Tidak Aktif'),
(4, 1, 2, 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `id_access` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `nama`, `username`, `nip`, `nis`, `password`, `id_access`) VALUES
(4, 'Operator Sekolah', 'admin', NULL, NULL, '$2y$10$zv5B4Gk6cINRbgunUffv3.Nv50ql6/VQfQWSSWO/WEj1H8M.k2bQW', 1),
(5, 'Siti Rahmawati', NULL, '197812312022012001', NULL, '$2y$10$wlz7uOcWf/tW7J.biMQHFOWtPvz6FIw2J4BIw9rS7qjitrZvuukim', 2),
(6, 'Arul Fitrah Insani', NULL, NULL, '102205800', '$2y$10$pzx5PY75fbraIKIaOTATr.GbFzzO7Dv26b7174zvoGcqLeilcAJ7C', 3);

-- --------------------------------------------------------

--
-- Table structure for table `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `id_wali_kelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_tahun_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wali_kelas`
--

INSERT INTO `wali_kelas` (`id_wali_kelas`, `id_guru`, `id_kelas`, `id_tahun_semester`) VALUES
(2, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id_access`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `mapel_id` (`mapel_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `kepala_sekolah`
--
ALTER TABLE `kepala_sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `non_akademik`
--
ALTER TABLE `non_akademik`
  ADD PRIMARY KEY (`id_non_akademik`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `projek_p5`
--
ALTER TABLE `projek_p5`
  ADD PRIMARY KEY (`id_projek`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `siswa_ibfk_jurusan` (`id_jurusan`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `tahun_pelajaran`
--
ALTER TABLE `tahun_pelajaran`
  ADD PRIMARY KEY (`id_tahun`);

--
-- Indexes for table `tahun_semester`
--
ALTER TABLE `tahun_semester`
  ADD PRIMARY KEY (`id_tahun_semester`),
  ADD KEY `id_tahun` (`id_tahun`),
  ADD KEY `id_semester` (`id_semester`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `id_access` (`id_access`);

--
-- Indexes for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id_wali_kelas`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_tahun_semester` (`id_tahun_semester`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kepala_sekolah`
--
ALTER TABLE `kepala_sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `non_akademik`
--
ALTER TABLE `non_akademik`
  MODIFY `id_non_akademik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projek_p5`
--
ALTER TABLE `projek_p5`
  MODIFY `id_projek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tahun_pelajaran`
--
ALTER TABLE `tahun_pelajaran`
  MODIFY `id_tahun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tahun_semester`
--
ALTER TABLE `tahun_semester`
  MODIFY `id_tahun_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `id_wali_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id_mapel`);

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);

--
-- Constraints for table `non_akademik`
--
ALTER TABLE `non_akademik`
  ADD CONSTRAINT `non_akademik_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);

--
-- Constraints for table `projek_p5`
--
ALTER TABLE `projek_p5`
  ADD CONSTRAINT `projek_p5_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `siswa_ibfk_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tahun_semester`
--
ALTER TABLE `tahun_semester`
  ADD CONSTRAINT `tahun_semester_ibfk_1` FOREIGN KEY (`id_tahun`) REFERENCES `tahun_pelajaran` (`id_tahun`),
  ADD CONSTRAINT `tahun_semester_ibfk_2` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_nip` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_access`) REFERENCES `access` (`id_access`);

--
-- Constraints for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD CONSTRAINT `wali_kelas_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `wali_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `wali_kelas_ibfk_3` FOREIGN KEY (`id_tahun_semester`) REFERENCES `tahun_semester` (`id_tahun_semester`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
