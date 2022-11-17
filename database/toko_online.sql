-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 01:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'jje@gmail.com', '123', 'jje');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(16, 'Hoodie'),
(17, 'jaket puffer '),
(18, 'windbraker'),
(19, 'sherpa');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(6) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Malang-Jombang', 13000),
(8, 'Malang-Surabaya', 10000),
(9, 'Malang-Cepu', 25000),
(10, 'Malang-Bali', 30000),
(11, 'Malang-Jakarta', 25000),
(12, 'Malang-Kepanjen Kabupaten', 6000),
(13, 'Malang-Kediri', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email`, `password`, `nama_pelanggan`, `telepon`, `alamat`) VALUES
(5, 'wardhanajendra24@gmail.com', 'haha2421', 'rajendra wardhana putra', '0312219', 'jombang'),
(6, 'lano@gmail.com', '123', 'lano', '08410398', 'sawojajar');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 1, 'Lancelot', 'bri', 247000, '2021-07-17', '20210717062455FB_IMG_1437282787040.jpg'),
(2, 2, 'anggi', 'bri', 386000, '2021-07-24', '20210724051557afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(3, 3, 'anggi', 'bni', 167000, '2021-07-24', '20210724061501afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(4, 4, 'khan', 'bri', 145000, '2021-07-24', '20210724080257afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(5, 6, 'lancelot', 'bri', 222000, '2021-07-25', '20210725155423afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(6, 8, 'admin', 'bca', 60000, '2022-11-16', '20221116193830Rajendra Wardhana Putra_33_XIR2 (2).pdf'),
(7, 9, 'admin', 'bca', 913000, '2022-11-17', '20221117003635hoodie h&m.jpg'),
(8, 10, 'admin', 'bri', 1213000, '2022-11-17', '20221117013009jaket sherpa.webp');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(6) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tgl_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(1, 1, 1, '2021-07-17', 247000, 'Jambi-BatangHari', 22000, 'jln yuuk, rt 01 batanghari city', 'barang dikirim', '987654'),
(2, 3, 4, '2021-07-24', 386000, 'Jambi-Merangin', 16000, 'hiuhwhiihkwkwj', 'barang dikirim', '09876547888'),
(3, 3, 3, '2021-07-24', 167000, 'Jambi-Kerinci', 22000, 'jambi', 'barang dikirim', '124'),
(6, 1, 1, '2021-07-25', 222000, 'Jambi-BatangHari', 22000, 'jlnjln', 'barang dikirim', '0987111'),
(7, 3, 1, '2021-07-26', 127000, 'Jambi-BatangHari', 22000, 'Kambang', 'pending', ''),
(8, 5, 0, '2022-11-16', 60000, '', 0, 'jombang', 'lunas', '0819'),
(9, 5, 1, '2022-11-16', 913000, 'Malang-Jombang', 13000, 'malang-jombang', 'barang dikirim', '0820'),
(10, 5, 1, '2022-11-17', 1213000, 'Malang-Jombang', 13000, 'jln.mangkubumi no 18 A', 'lunas', '0821'),
(11, 6, 13, '2022-11-17', 3510000, 'Malang-Kediri', 10000, 'jln pare', 'pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(2, 2, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(3, 2, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(4, 3, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(5, 4, 96, 1, 'Baju Wanita', 145000, 500, 500, 145000),
(6, 5, 97, 1, 'Celana Levis', 225000, 600, 600, 225000),
(7, 6, 94, 2, 'jaket maroon', 100000, 500, 1000, 200000),
(8, 7, 104, 1, 'Celana Karet', 105000, 700, 700, 105000),
(9, 8, 106, 2, 'Sajadah Travel hijau', 30000, 200, 400, 60000),
(10, 9, 107, 2, 'hoodie h&m', 450000, 20, 40, 900000),
(11, 10, 110, 2, 'jaket sherpa', 600000, 50, 100, 1200000),
(12, 11, 109, 1, 'stone island', 3500000, 70, 70, 3500000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `id_kategori` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok_produk` int(10) NOT NULL,
  `berat` int(11) NOT NULL,
  `foto_produk` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `id_kategori`, `harga`, `stok_produk`, `berat`, `foto_produk`, `deskripsi`) VALUES
(97, 'Celana Levis Kancing Timbul ', '14', 225000, 0, 600, '2.jpeg', 'Celana Panjang wanita good quality tebal dan halus enak nyaman dipakai		\r\n		'),
(98, 'Sajadah Travel', '15', 35000, 2, 500, 'sa1.jpg', 'Sajadah Travel cocok dibawa saat berpergian kemana saja  \r\n		'),
(104, 'Celana Karet', '14', 105000, 1, 700, 'cel1.jpg', 'bahan premium nyaman dipakai,tidak kaku,tebal,halus jaminan mutu \r\nbagian karet bisa di addjust sehingga tidak begah dipakai	\r\n		'),
(105, 'Celana Kulot ALL SIZE Fit XL', '14', 110000, 2, 700, 'cel2.jpg', 'celana kulot panjang bahan sangat adem dan berkualitas sangat nyaman digunakan saat pergi bersantai\r\npanjang 90cm \r\n \r\n		'),
(106, 'Sajadah Travel hijau', '15', 30000, 0, 200, 'sa2.jpg', 'Sajadah Travel cocok untuk dibawa bepergian mudah dibawa kemana saja		\r\n		'),
(107, 'hoodie h&m', '16', 450000, 8, 20, 'hoodie h&m.jpg', 'menggunakan bahan bulu domba'),
(108, 'jaket puffer tnf', '17', 1250000, 5, 50, 'puffer.jfif', 'The North Face adalah sebuah produsen peralatan rekreasi luar ruang asal Amerika Serikat. The North Face memproduksi pakaian, alas kaki, dan peralatan luar ruang.'),
(109, 'stone island', '18', 3500000, 1, 70, 'e20370cb8f5cec3e5c208fc9fe771649.jpg', 'Memiliki teknologi yang inovatif dalam membuat setiap koleksinya. Salah satu contohnya adalah Stone Island Ice jacket yang dapat berubah warna sesuai dengan suhu yang ada di sekitar'),
(110, 'jaket sherpa', '19', 600000, 10, 50, 'images.jfif', 'Material : Wool\r\n\r\nSize : \r\nMedium USA (panjang 74cm x lebar 52cm)\r\nLarge USA (panjang 76cm x lebar 54cm)\r\nExtra large (panjang 78cm x rebar 56cm)\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
