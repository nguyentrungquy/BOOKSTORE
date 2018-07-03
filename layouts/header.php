<?php 
    require_once ('/../autoload/autoload.php');

    $sqlNew = "SELECT * FROM product WHERE 1 ORDER BY ID DESC LIMIT 4";
    $productNew = $db->fetchsql($sqlNew);


 ?>
<!DOCTYPE html>
<html>
    <head>
        <title>BOOK STORE</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/fontend/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/fontend/css/bootstrap.min.css">
        <script  src="<?php echo base_url() ?>public/fontend/js/jquery-3.2.1.min.js"></script>
        <script  src="<?php echo base_url() ?>public/fontend/js/bootstrap.min.js"></script>
        <!---->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/fontend/css/slick.css"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/fontend/css/slick-theme.css"/>
        <!--slide-->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/fontend/css/style.css">
    </head>
    <body>
        <div id="wrapper">
            <!---->
            <!--HEADER-->
            <div id="header">
                <div id="header-top">
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-md-6" id="header-text">
                                <?php 
                                    if (isset($_SESSION['name_user'])) { ?>
                                        <a href="">Tài Khoản: <?php echo $_SESSION['name_user'] ?></a> 
                                    <?php }
                                    else echo '';
                                 ?>
                               
                            </div>
                            <div class="col-md-6">
                                <nav id="header-nav-top">
                                    <ul class="list-inline pull-right" id="headermenu">
                                        <?php if (isset($_SESSION['name_user'])) : ?>
                                            <li style="color: red">
                                                Xin chào: <?php echo $_SESSION['name_user'] ?>
                                            </li>
                                            <li>
                                                <a href=""><i class="fa fa-user"></i> Tài khoản của bạn <i class="fa fa-caret-down"></i></a>
                                                <ul id="header-submenu">
                                                    <li><a href="thongtin.php">Thông tin</a></li>
                                                    <li><a href="gio-hang.php">Giỏ hàng</a></li>
                                                    <li><a href="thoat.php"><i class="fa fa-share-square-o"></i> Thoát</a></li>
                                                </ul>
                                            </li>
                                        <?php else : ?>
                                            <li>
                                                <a href="dang-nhap.php"><i class="fa fa-unlock"></i> Đăng nhập</a>
                                            </li>
                                            <li>
                                                <a href="dang-ky.php"><i class="fa fa-user"></i> Đăng ký</a>
                                            </li>
                                            <li><div class="diliver"></div></li>
                                        <?php endif ; ?>
                                        
                                        <!-- <li>
                                            <a href="thoat.php"><i class="fa fa-share-square-o"></i> Checkout</a>
                                        </li> -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row" id="header-main">
                        <div class="col-md-4">
                            <a href="index.php">
                            <img src="<?php echo base_url() ?>public/fontend/images/logo.png">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <form class="form-inline" action="danhsachtimkiem.php" method="post">
                                <div class="form-group">
                                    <input  type="text" name="search" placeholder="tìm kiếm sản phẩm" class="form-control">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3" id="header-right">
                            <div class="pull-right">
                                <div class="pull-left">
                                    <i class="glyphicon glyphicon-phone-alt"></i>
                                </div>
                                <div class="pull-right">
                                    <p id="hotline">HOTLINE</p>
                                    <p>098478588</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--END HEADER-->
            <!--MENUNAV-->
            <div id="menunav">
                <div class="container">
                    <nav>
                        <div class="home pull-left">
                            <a href="index.php">Trang chủ</a>
                        </div>
                        <!--menu main-->
                        <ul id="menu-main">
                            <li>
                                <a href="gioithieu.php">Giới thiệu</a>
                            </li>
                            <li>
                                <a href="new.php">Tin Mới</a>
                            </li>

                            <li>
                                <a href="ungdung.php">Hướng dẫn</a>
                            </li>
                            <li>
                                <a href="dang-ky.php">Thành viên</a>
                            </li>
                        </ul>
                        <!-- end menu main-->
                        <!--Shopping-->
                        <ul class="pull-right" id="main-shopping">
                            <li>
                                <a href="gio-hang.php"><i class="fa fa-shopping-basket"></i> My Cart (<?php if(isset($_SESSION['cart'])){ echo count($_SESSION['cart']); } else {echo 0; } ?>) </a>
                            </li>
                        </ul>
                        <!--end Shopping-->
                    </nav>
                </div>
            </div>
            <!--ENDMENUNAV-->
            <div id="maincontent">
                <div class="container">
                    <div class="col-md-3  fixside" >
                        <div class="box-left box-menu" >
                            <h3 class="box-title"><i class="fa fa-list"></i>  Danh mục sách </h3>
                            <ul>
                                <?php foreach ($category as $item) { ?>
                                    <li><a href="danh-muc-san-pham.php?id=<?php echo $item['id'] ?>"><?php echo $item['name'] ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                        <div class="box-left box-menu">
                            <h3 class="box-title"><i class="fa fa-newspaper-o"></i>  Sản phẩm mới </h3>
                            <!--  <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()"  > -->
                            <ul>
                                <?php foreach ($productNew as $item) { ?>
                                    <li class="clearfix">
                                        <a href="chi-tiet-san-pham.php?id=<?php echo $item['id' ] ?>">
                                            <img src="<?php echo uploads() ?>/product/<?php echo $item['image'] ?>" class="img-responsive pull-left" width="80" height="80">
                                            <div class="info pull-right">
                                                <p class="name"><?php echo $item['name'] ?></p >
                                                <p class="name"><?php echo $item['tacgia'] ?></p >
                                                <?php if ($item['sale'] > 0 ): ?>
                                                    <strike class="sale">Giá gốc: <?php echo formatPrice($item['price']) ?></strike><br> <b class="price">Giảm giá: <?php echo formatPricesale($item['price'],$item['sale']) ?></b><br>
                                                <?php else : ?>
                                                    <b class="price">Giá: <?php echo formatPrice($item['price']) ?></b>
                                                <?php endif ?>
                                               
                                            </div>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                            <!-- </marquee> -->
                        </div>
                        <div class="box-left box-menu">
                            <h3 class="box-title"><i class="fa fa-product-hunt"></i>  Sản phẩm bán chạy </h3>
                            <!--  <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()"  > -->
                            <ul>
                               <?php foreach ($spmuanhieu as $item) { ?>
                                    <li class="clearfix">
                                        <a href="chi-tiet-san-pham.php?id=<?php echo $item['id' ] ?>">
                                            <img src="<?php echo uploads() ?>/product/<?php echo $item['image'] ?>" class="img-responsive pull-left" width="80" height="80">
                                            <div class="info pull-right">
                                                <p class="name"><?php echo $item['name'] ?></p >
                                                <p class="name"><?php echo $item['tacgia'] ?></p >
                                                <?php if ($item['sale'] > 0 ): ?>
                                                    <strike class="sale">Giá gốc: <?php echo formatPrice($item['price']) ?></strike><br> <b class="price">Giảm giá: <?php echo formatPricesale($item['price'],$item['sale']) ?></b><br>
                                                <?php else : ?>
                                                    <b class="price">Giá: <?php echo formatPrice($item['price']) ?></b>
                                                <?php endif ?>
                                            </div>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                            <!-- </marquee> -->
                        </div>
                    </div>