<?php 
    require_once ('./autoload/autoload.php');

    $sqlHomecate = "SELECT name, id FROM category WHERE home = 1 ORDER BY update_at ";
    $CategoryHome = $db->fetchsql($sqlHomecate);

    // _debug($CategoryHome);
    $data = [];
    foreach ($CategoryHome as $item) {
        $cateId = intval( $item['id']);

        $sql = "SELECT * FROM product WHERE category_id = $cateId";
        $productHome = $db->fetchsql($sql);
        $data[$item['name']] = $productHome;
    }

    // _debug($data);
?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    <section id="slide" class="text-center" >
        <div id="slider">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
    
                  <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                      <img src="<?php echo base_url() ?>public/fontend/images/slide-4.jpg" alt="Vietpro Academy" width="100%">
                    </div>

                    <div class="item">
                      <img src="<?php echo base_url() ?>public/fontend/images/slide-5.jpg" alt="Vietpro Academy" width="100%">
                    </div>

                    <div class="item">
                      <img src="<?php echo base_url() ?>public/fontend/images/slide-6.png" alt="Vietpro Academy" width="100%">
                    </div>
                  </div>

                  <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span> 
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div> 
    </section>
    <section class="box-main1">
        <?php foreach ($data as $key => $value) { ?>
            <h3 class="title-main" "><a href="javascript:void(0)"><?php echo $key ?></a> </h3>
            <div class="showitem">
               <?php foreach ($value as $item) { ?>
                    <div class="col-md-3 item-product bor">
                        <a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?> ">
                        <img src="<?php echo uploads() ?>/product/<?php echo $item['image'] ?>" class="" width="100%" height="180px">
                        </a>
                        <div class="info-item">
                            <b><a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?>" ><?php echo $item['name'] ?></a></b><br>
                            <p ><?php echo $item['tacgia'] ?></p>
                            <p><strike class="sale"><?php echo formatPrice($item['price']) ?></strike> <b class="price"><?php echo formatPricesale($item['price'], $item['sale']) ?></b></p>
                        </div>
                        <div class="hidenitem">
                            <p><a href=""><i class="fa fa-search"></i></a></p>
                            <p><a href=""><i class="fa fa-heart"></i></a></p>
                            <p><a href="addcart.php?id=<?php echo $item['id'] ?>"><i class="fa fa-shopping-basket"></i></a></p>
                        </div>
                    </div>
               <?php } ?>
            </div>
            <div class="clearfix"></div>
        <?php } ?>

 
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                