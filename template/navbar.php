<nav class="navbar navbar-expand-lg  navbar-light fixed-top fixed " style="background-color:#63a99e;            font-weight:bold;">
      <div class="container">


      <div class="logo mr-5" >
      <h2 style="font-family: comic sans; font-size: 40px; font-weight: bold; color: white;">Jje Store</h2>
      </div>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mr-5">
              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  " class="nav-link" href="index.php">Home<span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  "  class="nav-link" href="keranjang.php">Keranjang<span class="sr-only">(current)</span></a>
              </li>

              <!-- jk sudah login-->
             <?php if (isset($_SESSION["pelanggan"])): ?>

              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  " class="nav-link" href="riwayat.php">Riwayat<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  "  class="nav-link" href="logout.php">Logout<span class="sr-only">(current)</span></a>
              </li>
              

              <!-- selain itu(belum login)-->
               <?php else: ?>

              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  " class="nav-link" href="login.php">Login<span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item active">
                <a style="color: white;font-weight:bold;  "  class="nav-link" href="daftar.php">Daftar<span class="sr-only">(current)</span></a>
              </li> 
                   
                  
               <?php endif ?>
                 
              
            </ul>

               
  </nav>