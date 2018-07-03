<?php 
	require_once ('autoload/autoload.php');
	$sql="select sum(amount) as tongtien from transaction where MONTH(updated_at)=MONTH(NOW()) ";
	$total=$db->total($sql);

	$sql1 = "select sum(number) as sl from product";
	$sl = $db->fetchsql($sql1);


 ?>
<?php require_once('layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.php">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Bảng điều khiển </li>
	</ol>
    <div class="col-12">
        <!-- <h1>Xin chào bạn đến trang quản trị của admin</h1> -->
    </div>
	<div class="row">
	    <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-shopping-cart"></i>
              </div>
              <div class="mr-5">Tổng doanh thu trong tháng này là: <?php echo formatPrice($total['tongtien']) ?></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="modules/transaction/hoadontheothang.php">
              <span class="float-left">Xem chi tiết</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>

        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-support"></i>
              </div>
              <div class="mr-5">Số lượng đầu sách còn: <?php echo count($tonkho); ?></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="modules/product/index.php?query=2">
              <span class="float-left">xem chi tiết</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>

        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <?php foreach ($sl as $key ) { ?>
	              <div class="mr-5"><?php echo $key['sl'] ?> CUỐN SÁCH !</div>
              
              <?php } ?>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="modules/product/">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>

	</div>
<?php require_once('layouts/footer.php') ?>