<?php 
	require_once ('./autoload/autoload.php'); 


	$text = $_REQUEST['search'];
	$textnew = trim($text);
	$sqltext = "SELECT * from product where name LIKE '%".$textnew."%'";
	$search = $db->fetchsql($sqltext);
?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    <section class="box-main1">
        <h3>kết quả tìm được với từ khóa <span style="color: red; font-size: 25px;">"<?php echo $textnew ?>"</span></h3>
       	<div class="showitem clearfix">
       	 	<?php foreach ($search as $item) { ?>
	            <div class="col-md-3 item-product bor">
	                <a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?> ">
                        <img src="<?php echo uploads() ?>/product/<?php echo $item['image'] ?>" class="" width="100%" height="180px">
                        </a>
                        <div class="info-item">
                            <a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?>" ><?php echo $item['name'] ?></a>
                            <p ><?php echo $item['tacgia'] ?></p>
                            <p><strike class="sale"><?php echo formatPrice($item['price']) ?></strike> <b class="price"><?php echo formatPricesale($item['price'], $item['sale']) ?></b></p>
                        </div>
                        <div class="hidenitem">
                            <p><a href=""><i class="fa fa-search"></i></a></p>
                            <p><a href=""><i class="fa fa-heart"></i></a></p>
                            <p><a href="addcart.php?id=<?php echo $item['id']?>"><i class="fa fa-shopping-basket"></i></a></p>
                        </div>
	            </div>
       	 		
       	 	<?php } ?>
        </div>
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>