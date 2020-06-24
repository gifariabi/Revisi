-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2020 at 06:47 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_kas` (IN `total_kas` INT(255))  NO SQL
    DETERMINISTIC
BEGIN
SELECT (SUM(pemasukan_kas)-SUM(pengeluaran_kas)) AS 'Total Kas' FROM kas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ang_organisasi`
--

CREATE TABLE `ang_organisasi` (
  `nim` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `idOrganisasi` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isi` text COLLATE utf8_bin DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `isi`, `gambar`, `tanggal`, `status`) VALUES
(1, 'Anak Yang Terasingkan', 'Anak terlihat diasingkan di depan pertokoan', 'bagan.PNG', '2020-05-28 05:32:23', ''),
(2, 'Luxurious 2020', 'Mengundang onadio', 'index.png', '2020-05-28 05:35:35', ''),
(3, 'Ragam Kriteria Daerah yang Boleh Terapkan New Normal di Tengah Wabah', 'Pemerintah tengah menggodok protokol tatanan normal yang baru atau new normal di tengah pandemi virus Corona baru (COVID-19). Ada dua kriteria daerah yang akan menerapkan new normal.\r\n\"Adapun untuk daerah yang nantinya akan dibuka, dapat kami sampaikan ada 2 kriteria di sini,\" kata Ketua Gugus Tugas Penanganan COVID-19 Doni Monardo saat konferensi pers di YouTube Setpres, Rabu (25/7/2020).\r\n\r\nKriteria pertama adalah daerah-daerah yang sama sekali belum ada kasus Corona. Tercatat, terdapat sebanyak 110 kabupaten/kota di mana terdiri dari 87 di wilayah daratan, dan 23 di wilayah kepulauan, kemudian kecuali Papua.\r\n\"Makanya yang akan nantinya diberikan tawaran untuk membuka adalah 87 kabupaten/kota, yaitu 65 di wilayah daratan, dan 22 di wilayah kepulauan,\" jelas Doni.\r\nDoni mengatakan daerah-daerah yang akan dibuka atau dilonggarkan aktivitasnya adalah daerah yang nyaris steril. Meski begitu, Doni meminta semua daerah tetap waspada dari Corona.\r\n\r\n\"Daerah-daerah ini nyaris steril dari ancaman COVID, tetapi belum tentu selamanya akan tetap aman,\" ucapnya.\r\n\r\nAlasan mengapa daerah itu nyaris steril dari kasus Corona adalah tingginya tingkat kesadaran masyarakat dan kepatuhan masyarakat terhadap protokol kesehatan. Daerah ini, kata Doni, juga daerah yang jarang dikunjungi oleh wisatawan asing.\r\n\r\n\"Minggu lalu kami telah komunikasi dengan para pimpinan dan bupati, wali kota tentang kenapa daerah mereka aman COVID, setelah pemaparan yang diberikan, maka dapat disimpulkan bahwa yang pertama tingkat kesadaran dan kepatuhan masyarakat tinggi, kemudian kerja sama antar-tokoh di daerah, baik pemerintah daerah maupun unsur tokoh nonformal lainnya sampai tingkat RT dan RW,\" jelasnya.', '2682f0ab-0b82-4729-bd16-9218e56c5121_169.jpeg', '2020-05-28 06:01:28', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `nama` varchar(50) DEFAULT NULL,
  `nim` varchar(10) NOT NULL,
  `jenisKelamin` varchar(15) DEFAULT NULL,
  `prodi` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `foto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`nama`, `nim`, `jenisKelamin`, `prodi`, `username`, `password`, `foto`) VALUES
('yusril wahyuda', '670117400', 'Laki-laki', 'D3SI', 'yusril', 'yusril', NULL),
('Eko adinata', '670117455', 'Laki-laki', 'D3SI', 'eko', 'eko', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `idDept` int(5) NOT NULL,
  `namaDepartemen` varchar(255) NOT NULL,
  `idOrganisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Table structure for table `histori_pengurus`
--

CREATE TABLE `histori_pengurus` (
  `nim` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `idOrganisasi` int(11) NOT NULL,
  `id_thnAjaran` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histori_pengurus`
--

INSERT INTO `histori_pengurus` (`nim`, `nama`, `jabatan`, `idOrganisasi`, `id_thnAjaran`) VALUES
(670117455, 'Eko Adinata', '', 8, 3),
(670117410, 'Muhammad Luqman', '', 8, 1),
(670117400, 'Yusril Wahyuda', 'Ketua', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id_kas` int(5) NOT NULL,
  `pemasukan_kas` int(255) NOT NULL,
  `pengeluaran_kas` int(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `idOrganisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(10) NOT NULL,
  `nama_kegiatan` varchar(255) COLLATE utf8_bin NOT NULL,
  `waktu` varchar(255) COLLATE utf8_bin NOT NULL,
  `tempat` varchar(255) COLLATE utf8_bin NOT NULL,
  `harga` varchar(255) COLLATE utf8_bin NOT NULL,
  `qr_code` varchar(255) COLLATE utf8_bin NOT NULL,
  `foto` varchar(255) COLLATE utf8_bin NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8_bin NOT NULL,
  `kuota` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_programkerja` int(10) NOT NULL,
  `upload_lpj` tinyint(255) DEFAULT 0 COMMENT '1 = sudah upload , 0 belum upload'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `nama_kegiatan`, `waktu`, `tempat`, `harga`, `qr_code`, `foto`, `deskripsi`, `kuota`, `id_programkerja`, `upload_lpj`) VALUES
(31, 'Seminar Android', '2020-09-01', 'Aula Fakultas Ilmu Terapan', '20000', 'Seminar Android.png', '', 'Pengisi Acara di Seminar ini adalah ibu Suryatingsih dan akan membahas materi UX bertema \"Pandangan User kepada Aplikasi\"', '', 12, 0),
(32, 'Seminar UX', '2020-06-27', 'Aula Fakultas Ilmu Terapan', '20000', 'Seminar UX.png', '', 'Pengisi Acara di Seminar ini adalah ibu Suryatingsih dan akan membahas materi UX bertema \"Pandangan User kepada Aplikasi\"', '40', 12, 1),
(33, 'Basketball Competition', '2020-10-01', 'Batununggal Sport Center', '20000', 'Basketball Competition.png', '', 'Kompetisi Basket untuk D3 SI', '12', 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `konten`
--

CREATE TABLE `konten` (
  `deskripsi` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `konten`
--

INSERT INTO `konten` (`deskripsi`) VALUES
('shdsgadgashjdgashjdgsdgja');

-- --------------------------------------------------------

--
-- Table structure for table `lpj`
--

CREATE TABLE `lpj` (
  `id_lpj` int(5) NOT NULL,
  `file` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_kegiatan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lpj`
--

INSERT INTO `lpj` (`id_lpj`, `file`, `id_kegiatan`) VALUES
(6, '1__Sejarah_dan_Perkembangan_Komputer-_SLIDE_pertemuan_1.pdf', 32);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `noWA` varchar(255) NOT NULL,
  `noHP` varchar(255) NOT NULL,
  `idLine` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `prodi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `username`, `password`, `nama`, `noWA`, `noHP`, `idLine`, `foto`, `prodi`) VALUES
(0, 'bk', 'bk', '', '', '', '', '', ''),
(670117400, 'yusril', 'yusril123', 'Yusril Wahyuda', '', '', '', 'b60e2ca62d0a36db693c98d0191a9586.jpg', 'D3SI'),
(670117403, 'gifariabi', 'gifariabi', 'Gifari Abi Waqqash', '085868442225', '085868442226', 'gifarifr', '217af0b91e134c93fe445afec6e3c284.jpg', 'D3 Sistem Informasi'),
(670117406, 'sherli', 'sherli', 'Sherli Yualinda', '', '', '', '', 'D3 Sistem Informasi'),
(670117410, 'Luqman', 'luqman123', 'Muhammad Luqman', '080808099', '080808089', 'luqmaneuy', '2323ec9a9fc0bb6dfd56ddb9a37f8402.jpg', 'D3 Sistem Informasi'),
(670117455, 'eko', 'eko', 'Eko Adinata', '', '', '', '', 'D3SI'),
(670606006, 'ade', 'ade123', 'Ade Pangestu', '', '', '', '', 'D3 Sistem Informasi\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `organisasi`
--

CREATE TABLE `organisasi` (
  `idOrganisasi` int(11) NOT NULL,
  `namaOrganisasi` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `logo` text NOT NULL,
  `ketua` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `organisasi`
--

INSERT INTO `organisasi` (`idOrganisasi`, `namaOrganisasi`, `deskripsi`, `logo`, `ketua`) VALUES
(6, 'SAMALOWA', 'Organisasi Mahasiswa adalah wadah untuk penyaluran bakat buat KEMA untuk menyalurkan potensi-potensi yang ada pada diri kita. Selain potensi dalam akademik, juga tempat belajar bagaimana mengasah potensi non-akademik yang ada pada diri kita.Aplikasi ini diharapkan mampu untuk membantu organisasi mahasiswa dalam menjalankan kepengurusan organisasi', 'f24cb5dc09d7de843e7d91f4d6df9f06.jpg', ''),
(7, 'SEARCH', 'Organisasi Mahasiswa adalah wadah untuk penyaluran bakat buat KEMA untuk menyalurkan potensi-potensi yang ada pada diri kita. Selain potensi dalam akademik, juga tempat belajar bagaimana mengasah potensi non-akademik yang ada pada diri kita.Aplikasi ini diharapkan mampu untuk membantu organisasi mahasiswa dalam menjalankan kepengurusan organisasi', '572e0d07a16c914e4ba0f5f3fda0b8fa.jpg', ''),
(8, 'HMDSI', 'Organisasi Mahasiswa adalah wadah untuk penyaluran bakat buat KEMA untuk menyalurkan potensi-potensi yang ada pada diri kita. Selain potensi dalam akademik, juga tempat belajar bagaimana mengasah potensi non-akademik yang ada pada diri kita.Aplikasi ini diharapkan mampu untuk membantu organisasi mahasiswa dalam menjalankan kepengurusan organisasi', 'bd3575bbab7f44877aeabca6d01c3c54.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE `pengurus` (
  `nim` int(11) NOT NULL,
  `id` int(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `idOrganisasi` int(11) NOT NULL,
  `id_thnAjaran` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `pengurus`
--

INSERT INTO `pengurus` (`nim`, `id`, `nama`, `jabatan`, `idOrganisasi`, `id_thnAjaran`) VALUES
(670117410, 20, 'Muhammad Luqman', 'Sekretaris', 8, 1),
(670117400, 21, 'Yusril Wahyuda', 'Ketua', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id_presensi` int(5) NOT NULL,
  `waktu_submit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `nim` int(10) NOT NULL,
  `id_kegiatan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `programkerja`
--

CREATE TABLE `programkerja` (
  `id_programkerja` int(10) NOT NULL,
  `nama_programkerja` varchar(255) COLLATE utf8_bin NOT NULL,
  `waktu_pelaksanaan` varchar(255) COLLATE utf8_bin NOT NULL,
  `departemen` varchar(255) COLLATE utf8_bin NOT NULL,
  `idOrganisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `programkerja`
--

INSERT INTO `programkerja` (`id_programkerja`, `nama_programkerja`, `waktu_pelaksanaan`, `departemen`, `idOrganisasi`) VALUES
(12, 'Study Group', '2020-08-01', 'Minat dan Bakat', 8),
(13, 'Olahraga', '2020-06-30', 'Olahraga', 8);

-- --------------------------------------------------------

--
-- Table structure for table `rapat`
--

CREATE TABLE `rapat` (
  `id_rapat` int(11) NOT NULL,
  `perihal` varchar(255) COLLATE utf8_bin NOT NULL,
  `tempat` varchar(255) COLLATE utf8_bin NOT NULL,
  `tanggal` varchar(255) COLLATE utf8_bin NOT NULL,
  `waktu` varchar(255) COLLATE utf8_bin NOT NULL,
  `kategori` varchar(255) COLLATE utf8_bin NOT NULL,
  `nim` int(10) NOT NULL,
  `idOrganisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rapat`
--

INSERT INTO `rapat` (`id_rapat`, `perihal`, `tempat`, `tanggal`, `waktu`, `kategori`, `nim`, `idOrganisasi`) VALUES
(6, 'Coba 1', 'Aula Fakultas Ilmu Terapan', '2020-06-22', '19:00', 'Pengurus', 670117410, 8),
(7, 'Coba 3', 'Aula Fakultas Ilmu Terapan', '2020-06-23', '19:00', 'Pengurus dan Anggota', 670117410, 8),
(8, 'Coba 4', 'Aula Fakultas Ilmu Terapan', '2020-06-24', '20:00', 'Pengurus', 670117410, 8),
(9, 'Coba 2', 'Aula Fakultas Ilmu Terapan', '2020-06-25', '19:00', 'Pengurus dan Anggota', 670117410, 8),
(10, 'Coba 7', 'Aula Fakultas Ilmu Terapan', '2020-06-25', '16:00', 'Pengurus', 670117410, 8);

-- --------------------------------------------------------

--
-- Table structure for table `suratkeluar`
--

CREATE TABLE `suratkeluar` (
  `id` int(10) NOT NULL,
  `no_suratkeluar` varchar(255) COLLATE utf8_bin NOT NULL,
  `penerima` varchar(255) COLLATE utf8_bin NOT NULL,
  `tanggalkeluar` varchar(255) COLLATE utf8_bin NOT NULL,
  `waktu` varchar(255) COLLATE utf8_bin NOT NULL,
  `perihal` varchar(255) COLLATE utf8_bin NOT NULL,
  `nim` int(10) NOT NULL,
  `idOrganisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `suratkeluar`
--

INSERT INTO `suratkeluar` (`id`, `no_suratkeluar`, `penerima`, `tanggalkeluar`, `waktu`, `perihal`, `nim`, `idOrganisasi`) VALUES
(1, '002', 'Ketua Wapala', '2020-07-01', '19:00', 'Dies Natalis Himpunan Mahasiswa D3 Sistem Informasi', 670117410, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id_thnAjaran` int(5) NOT NULL,
  `tahunAjaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id_thnAjaran`, `tahunAjaran`) VALUES
(1, '2019-2020'),
(2, '2020-2021'),
(3, '2021-2022'),
(4, '2022-2023');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `no_tiket` int(10) NOT NULL,
  `nama` varchar(255) COLLATE utf8_bin NOT NULL,
  `nimAkun` int(10) NOT NULL,
  `nim` varchar(255) COLLATE utf8_bin NOT NULL,
  `jurusan` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `total` varchar(255) COLLATE utf8_bin NOT NULL,
  `metode_pembayaran` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_kegiatan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`no_tiket`, `nama`, `nimAkun`, `nim`, `jurusan`, `email`, `total`, `metode_pembayaran`, `status`, `waktu`, `id_kegiatan`) VALUES
(33, 'Gifari Abi Waqqash', 670117410, '6701175588', 'D3 Sistem Informasi', 'gifariabi9@gmail.com', '20000', 'Transfer', 'Accepted', '2020-06-22 10:17:33', 31),
(34, 'SULE', 670117410, '6701174566', 'S1 Teknik Informatika', 'gifariabi9@gmail.com', '20000', 'Transfer', 'Menunggu', '2020-06-22 10:17:10', 32),
(35, 'Temon', 670117410, '6701175588', 'D3 Sistem Informasi', 'gifariabi9@gmail.com', '20000', 'Transfer', 'Menunggu', '2020-06-22 13:04:49', 31);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_total_kas`
-- (See below for the actual view)
--
CREATE TABLE `view_total_kas` (
`Total Kas` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Structure for view `view_total_kas`
--
DROP TABLE IF EXISTS `view_total_kas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total_kas`  AS  select sum(`kas`.`pemasukan_kas`) - sum(`kas`.`pengeluaran_kas`) AS `Total Kas` from `kas` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ang_organisasi`
--
ALTER TABLE `ang_organisasi`
  ADD KEY `fk_idOrganisasi` (`idOrganisasi`),
  ADD KEY `fk_nim_anggota` (`nim`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`idDept`),
  ADD UNIQUE KEY `idOrganisasi` (`idOrganisasi`);

--
-- Indexes for table `histori_pengurus`
--
ALTER TABLE `histori_pengurus`
  ADD KEY `fk_nimn` (`nim`),
  ADD KEY `fk_idAjaran` (`id_thnAjaran`),
  ADD KEY `fk_idOrganisasi5` (`idOrganisasi`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id_kas`),
  ADD KEY `fk_idOrganisasii` (`idOrganisasi`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `id_programkerja` (`id_programkerja`);

--
-- Indexes for table `lpj`
--
ALTER TABLE `lpj`
  ADD PRIMARY KEY (`id_lpj`),
  ADD UNIQUE KEY `id_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`idOrganisasi`);

--
-- Indexes for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_thnAjaran` (`id_thnAjaran`) USING BTREE,
  ADD KEY `fk_organisasi` (`idOrganisasi`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `nim` (`nim`) USING BTREE,
  ADD KEY `id_kegiatan` (`id_kegiatan`) USING BTREE;

--
-- Indexes for table `programkerja`
--
ALTER TABLE `programkerja`
  ADD PRIMARY KEY (`id_programkerja`),
  ADD KEY `idOrganisasi` (`idOrganisasi`) USING BTREE;

--
-- Indexes for table `rapat`
--
ALTER TABLE `rapat`
  ADD PRIMARY KEY (`id_rapat`),
  ADD KEY `nim` (`nim`),
  ADD KEY `rapat_idOrganisasi` (`idOrganisasi`);

--
-- Indexes for table `suratkeluar`
--
ALTER TABLE `suratkeluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`) USING BTREE,
  ADD KEY `fk_idorganisasi3` (`idOrganisasi`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id_thnAjaran`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`no_tiket`),
  ADD KEY `id_kegiatan` (`id_kegiatan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `idDept` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id_kas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `lpj`
--
ALTER TABLE `lpj`
  MODIFY `id_lpj` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `idOrganisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengurus`
--
ALTER TABLE `pengurus`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_presensi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `programkerja`
--
ALTER TABLE `programkerja`
  MODIFY `id_programkerja` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rapat`
--
ALTER TABLE `rapat`
  MODIFY `id_rapat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suratkeluar`
--
ALTER TABLE `suratkeluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id_thnAjaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `no_tiket` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ang_organisasi`
--
ALTER TABLE `ang_organisasi`
  ADD CONSTRAINT `fk_idOrganisasi` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`),
  ADD CONSTRAINT `fk_nim_anggota` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `departemen`
--
ALTER TABLE `departemen`
  ADD CONSTRAINT `departemen_ibfk_1` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `histori_pengurus`
--
ALTER TABLE `histori_pengurus`
  ADD CONSTRAINT `fk_idAjaran` FOREIGN KEY (`id_thnAjaran`) REFERENCES `tahun_ajaran` (`id_thnAjaran`),
  ADD CONSTRAINT `fk_idOrganisasi5` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`),
  ADD CONSTRAINT `fk_nimn` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `kas`
--
ALTER TABLE `kas`
  ADD CONSTRAINT `fk_idOrganisasii` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`id_programkerja`) REFERENCES `programkerja` (`id_programkerja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lpj`
--
ALTER TABLE `lpj`
  ADD CONSTRAINT `lpj_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD CONSTRAINT `fk_organisasi` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`),
  ADD CONSTRAINT `fk_thnAjaran` FOREIGN KEY (`id_thnAjaran`) REFERENCES `tahun_ajaran` (`id_thnAjaran`),
  ADD CONSTRAINT `pengurus_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `presensi_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `programkerja`
--
ALTER TABLE `programkerja`
  ADD CONSTRAINT `pk` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rapat`
--
ALTER TABLE `rapat`
  ADD CONSTRAINT `rapat_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `pengurus` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rapat_idOrganisasi` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`);

--
-- Constraints for table `suratkeluar`
--
ALTER TABLE `suratkeluar`
  ADD CONSTRAINT `fk_idorganisasi3` FOREIGN KEY (`idOrganisasi`) REFERENCES `organisasi` (`idOrganisasi`),
  ADD CONSTRAINT `suratkeluar_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `pengurus` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
