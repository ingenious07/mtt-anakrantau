-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Sep 2020 pada 08.20
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isa_uts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `idBarang` int(11) NOT NULL,
  `idPenjual` int(11) NOT NULL,
  `jenisBarang` varchar(45) DEFAULT NULL,
  `namaBarang` varchar(45) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `deskripsi` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`idBarang`, `idPenjual`, `jenisBarang`, `namaBarang`, `stok`, `harga`, `deskripsi`) VALUES
(1, 3, 'Buku', 'Bukan Lagi Manusia, Tetapi Hewan Berkaki Dua', 50, 200000, 'Karya dari Dazai Ozamu'),
(2, 6, 'Buah Setan', 'Gomu Gomu No Mi', 10, 1000000, 'Menyebabkan tidak bisa berenang'),
(3, 3, 'Manga', 'One Piece Episode 977', 100, 25000, 'Karya Eichiro Oda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detilbarang`
--

CREATE TABLE `detilbarang` (
  `idUser` int(11) NOT NULL,
  `idBarang` int(11) NOT NULL,
  `idPenjual` int(11) NOT NULL,
  `noNota` varchar(15) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subTotal` double DEFAULT NULL,
  `keterangan` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `detilbarang`
--

INSERT INTO `detilbarang` (`idUser`, `idBarang`, `idPenjual`, `noNota`, `jumlah`, `subTotal`, `keterangan`) VALUES
(1, 1, 3, '20200409001', 2, 400000, 'Karya dari Dazai Ozamu'),
(1, 1, 3, '20200409005', 1, 200000, 'Karya dari Dazai Ozamu'),
(1, 2, 6, '20200409003', 1, 1000000, 'Menyebabkan tidak bisa berenang'),
(1, 2, 6, '20200409004', 3, 3000000, 'Menyebabkan tidak bisa berenang'),
(1, 3, 3, '20200409002', 2, 50000, 'Karya Eichiro Oda'),
(16, 1, 3, '20200409006', 2, 400000, 'Karya dari Dazai Ozamu'),
(16, 2, 6, '20200409006', 1, 1000000, 'Menyebabkan tidak bisa berenang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo`
--

CREATE TABLE `promo` (
  `kodePromo` int(11) NOT NULL,
  `potongan` double DEFAULT NULL,
  `batasTanggalBerlaku` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `noNota` varchar(15) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `ppn` double DEFAULT NULL,
  `grandTotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`noNota`, `tanggal`, `total`, `ppn`, `grandTotal`) VALUES
('20200409001', '2020-04-09 12:05:24', 400000, 10, 360000),
('20200409002', '2020-04-09 12:18:06', 50000, 10, 45000),
('20200409003', '2020-04-09 12:31:09', 1000000, 10, 900000),
('20200409004', '2020-04-09 12:37:17', 3000000, 10, 2700000),
('20200409005', '2020-04-09 12:46:11', 200000, 10, 180000),
('20200409006', '2020-04-09 03:45:36', 1400000, 10, 1540000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `name`) VALUES
(1, 'root', NULL, 'admin', 'abednegojoshua'),
(3, 'anthony', 'lllhaoslll', 'penjual', 'jerichoanthony'),
(5, 'anang', 'anu', 'penjual', 'aneandra'),
(6, 'monet', 'yuki', 'penjual', 'yukiyukinomi'),
(13, 'abed', 'fehi', 'pembeli', 'abed'),
(14, 'abc', 'feg', 'pembeli', 'abc'),
(15, 'abcd', 'fehg', 'pembeli', 'abcd'),
(16, 'albert', 'erweom89ek', 'pembeli', 'yohanesalbert');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idBarang`,`idPenjual`),
  ADD KEY `fk_barang_user1_idx` (`idPenjual`);

--
-- Indeks untuk tabel `detilbarang`
--
ALTER TABLE `detilbarang`
  ADD PRIMARY KEY (`idUser`,`idBarang`,`idPenjual`,`noNota`),
  ADD KEY `fk_user_has_barang_user1_idx` (`idUser`),
  ADD KEY `fk_detilBarang_transaksi1_idx` (`noNota`),
  ADD KEY `fk_detilBarang_barang1_idx` (`idBarang`,`idPenjual`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`kodePromo`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`noNota`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `idBarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_user1` FOREIGN KEY (`idPenjual`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `detilbarang`
--
ALTER TABLE `detilbarang`
  ADD CONSTRAINT `fk_detilBarang_barang1` FOREIGN KEY (`idBarang`,`idPenjual`) REFERENCES `barang` (`idBarang`, `idPenjual`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detilBarang_transaksi1` FOREIGN KEY (`noNota`) REFERENCES `transaksi` (`noNota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_barang_user1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
