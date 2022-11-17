<?php 
session_start();


include 'koneksi.php';

if (empty($_SESSION["keranjang"]) or !isset($_SESSION["keranjang"])) 

{
  echo "<script>alert('Keranjang Kosong, Silahkan belanja dulu');</script>";
  echo "<script>location='index.php';</script>";
}

 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>Keranjang Belanja</title>
 	
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="style.css">
 </head>
 <body>

 	<!-- navbar -->
 <?php include 'template/navbar.php'; ?>

  <section class="konten" style="margin-top: 10%;">
  	<div class="container">
  		<h2>Keranjang Belanja</h2>
  		<hr>
  		<table class="table table-bordered">
  			<thead>
  				<tr>
  					<th>No</th>
  					<th>Produk</th>
  					<th>Harga</th>
  					<th>Jumlah</th>
  					
            <th>Aksi</th>
  				</tr>
  			</thead>
  			<tbody>
				<?php $nomor=1; ?>
				<?php foreach ($_SESSION["keranjang"] as $id_produk => $jumlah): ?>
				<!--menampilkan produk yang sedang diperulangkan berdasarkan id_produk -->	
				<?php 
				
					$ambil = $koneksi->query("SELECT * FROM produk
						WHERE id_produk='$id_produk'");

					$pecah= $ambil->fetch_assoc();
				
				 ?>
  					<tr>
  						<td><?php echo $nomor; ?></td>
  						<td><?php echo $pecah['nama_produk']; ?></td>
  						<td><?php echo number_format($pecah['harga']); ?></td>
  						<td><?php echo $jumlah; ?></td>
  					    
              <td>
              <a href="hapuskeranjang.php?id=<?php echo $id_produk ?> " class="btn btn-danger btn-xs">Hapus</a>
              </td>
  					</tr>
  					<?php $nomor++; ?>
  					<?php endforeach ?>
  				</tbody>
  			
  		</table>

  		<a href="index.php" class="btn btn-info">(+)Tambah Belanja</a>
  		<a href="checkout.php" class="btn btn-primary">Checkout</a>
  		
  	</div>
  </section>
 
 </body>
 </html>