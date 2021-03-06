<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Organisasi</title>

  <!-- Bootstrap core CSS -->
  <link href="<?php echo base_url().'asset/vendor/bootstrap/css/bootstrap.min.css'?>" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<?php echo base_url().'asset/css/heroic-features.css'?>" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<?= base_url() ?>Organisasi/tampilan_awal/<?=$this->session->nim;?>">Organisasi Mahasiswa</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="<?= base_url() ?>Organisasi/tampilan_awal/<?=$this->session->nim;?>">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= site_url('Login/logout') ?>">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content --><br/>

    <!-- Page Features -->
  <?php if ($this->session->username) { ?>
  
  <?php } else { redirect('Login/aksi_login'); } ?>
  <?php if ($this->session->nim != 0 ) { ?> 
    <form action="<?php echo site_url('Organisasi/cari');?>" method="post"> 
          <input type="text" name="keyword">
          <input type="submit" value="Cari"> 
    </form>
    <?php } ?>
    <br>
    <?php if ($this->session->nim == 0 ) { ?> 
    <table align="right">
      <th><a href="<?= base_url() ?>Organisasi/buat_organisasi" class="btn btn-primary">+ Tambah Organisasi</a></th>
      <th><a href="<?= base_url() ?>Organisasi/tampilOrg" class="btn btn-primary">Kelola Organisasi</a></th>
    </table> 
    <form action="<?php echo site_url('Organisasi/cari');?>" method="post"> 
          <input type="text" name="keyword">
          <input type="submit" value="Cari"> 
    </form>
    <br> <br>
    <div class="row text-center">
      <?php foreach($data as $data ){ ?>
      
      <div class="col-lg-2 col-md-4 mb-3">
        <div class="card h-100">
          <img class="card-img-top" src="<?= base_url('asset/images/ormawa/').$data->logo ?>" alt="">
          <div class="card-body">
            <h4 class="card-title"><?= $data->namaOrganisasi ?></h4>
            <p class="card-text">Ketua : <?= $data->ketua ?></p>
          </div>
          <div class="card-footer">
            <a href="<?= base_url() ?>Organisasi/halaman_daftar/<?=$data->idOrganisasi;?>" class="btn btn-primary">Tentang</a>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php }else{ ?>
      <div class="row text-center">
         <?php foreach($data as $data ){ ?>
      
      <div class="col-lg-2 col-md-4 mb-3">
        <div class="card h-100">
          <img class="card-img-top" src="<?= base_url('asset/images/ormawa/').$data->logo ?>" alt="">
          <div class="card-body">
            <h4 class="card-title"><?= $data->namaOrganisasi ?></h4>
            <p class="card-text">Ketua : <?= $data->ketua ?></p>
          </div>
          <div class="card-footer">
            <a href="<?= base_url() ?>Organisasi/halaman_daftar/<?= $data->idOrganisasi;?>" class="btn btn-primary">Tentang</a>
          </div>
        </div>
      </div>
    <?php } ?>
    <?php } ?>
    </div>
     
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<?php echo base_url().'asset/vendor/jquery/jquery.min.js'?>"></script>
  <script src="<?php echo base_url().'asset/vendor/bootstrap/js/bootstrap.bundle.min.js'?>"></script>

</body>

</html>