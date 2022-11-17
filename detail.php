<?php session_start(); ?>
<?php include 'koneksi.php' ?>

<?php 
// mendapatkan id_produk dari url
$id_produk=$_GET["id"];

//query ambil data
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk = '$id_produk'");
$detail = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detail);
// echo "</pre>";

 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Detail</title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    
</head>
<body>

<nav class="navbar navbar-expand-lg  navbar-light fixed-top fixed " style="background-color:#63a99e;font-weight:bold;">
      <div class="container">


      <div class="logo mr-5" >
              <a class="nav-link" aria-current="page" href="index.php" style="font-family: comic sans; font-size: 40px; font-weight: bold; color: white; " >Jje Store</a>
      </div>
</nav>

<section class="kontent" style="margin-top:10%; ">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="foto_produk/<?php echo $detail["foto_produk"]; ?> " class="img-responsive" width="500">
			</div>
			<div class="col-md-6">
				<h2> <?php echo $detail["nama_produk"]; ?></h2>
                <hr>
				<h4>Rp. <?php echo number_format($detail ["harga"]) ; ?></h4>
                 
				<h5>Stok : <?php echo $detail["stok_produk"]; ?></h5>
                <hr>
                <h4>Deskripsi Produk</h4>
				<p><?php echo $detail ["deskripsi"]; ?></p>
                <hr>
                <h4>Jumlah Barang :</h4>
                           
				<form method="post">
					<div class="form-group">
						<div class="input-group">
                            
							<input type="number" min="1" class="form-control" name="jumlah" max="<?php echo $detail["stok_produk"]; ?> ">
                            
                        
							
							</div>
						</div>
                        <br>
                        <div class="input-group-btn">
								<button class="btn btn-primary" name="beli">Beli</button>
					</div>		
				</form>
                
				<?php 
					if (isset($_POST["beli"])) 
					{
						//jk stok kosong
						if($detail["stok_produk"] > 0){
						$jumlah = $_POST["jumlah"];

						//msukanke keranjang belanja
						$_SESSION["keranjang"][$id_produk]= $jumlah;

						echo "<script>alert ('produk telah ditambahkan ke keranjang segera dichekout');</script>";
						echo "<script>location='keranjang.php';</script>";
						
						}else{
	

						echo "<script>alert ('Stok Produk Kosong');</script>";
						echo "<script>location='index.php';</script>";
					  }
					}

				 ?>

			
			</div>
			
		</div>
	</div>
</section>
<br>
<?php include 'template/footer.php'; ?>
</body>
</html>