<?php
	 require_once ('./autoload/autoload.php');


	 $id = intval(getInput('id'));

	 $sqlbl="SELECT *FROM blsanpham WHERE id_sp=$id";
	 $binhluan = $db->fetchsql($sqlbl);

	if ($_SERVER["REQUEST_METHOD"] == "POST"){
	 	$data = 
		[
			"name" => postInput('name'),
			"phone" => postInput('phone'),
			"comment" => postInput("comment")

		];

	 	$error = [];

		if(postInput('name') == ''){
			$error['name'] = "Mời bạn nhập tên";
		}

		if(postInput('phone') == ''){
			$error['phone'] = "Mời bạn nhập số điện thoại";
		}
		
		if(postInput('comment') == ''){
			$error['comment'] = "Nội dung bình luận";
		}
		$date = date("Y-m-d G:i:s");
		if (empty($error)) 
		{

			$id_insert = $db->insert("blsanpham",$data);
			if(isset($id_insert))
			{
				$_SESSION["success"] = "Thêm bình luận thành công";
				header("location: chi-tiet-san-pham.php");
			}
			else
			{
				$_SESSION["error"] = "Thêm bình luận không thành công";
			}
		}

 	}
	 //Chi tiết sản phẩm
	 $product = $db->fetchID("product",$id);

	 //Lấy danh mục sản phẩm liên quan
	 $cateid = intval($product['category_id']);

	 $sql = "SELECT * FROM product WHERE category_id = $cateid ORDER BY ID DESC LIMIT 4";
	 $sanphamkemtheo = $db->fetchsql($sql);

?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    
	<section class="box-main1" >
	    <div class="col-md-6 text-center">
	        <img src="<?php echo uploads() ?>product/<?php echo $product['image'] ?>" class="img-responsive bor" id="imgmain" width="100%" height="370" data-zoom-image="images/16-270x270.png">
	        
	    </div>
	    <div class="col-md-6 bor" style="margin-top: 20px;padding: 30px; border: 1px solid #ccc;">
	       <ul id="right" >
	            <li><h3><?php echo $product['name'] ?></h3></li>
	            <li style="font-size: 16px; font-style: italic;">Thể loại: <?php $theloai=$db->fetchOne("category","id= '".$product['category_id']." '"); echo $theloai['name'];?></li>
	            <li style="font-size: 18px"> Tác giả: <?php echo $product['tacgia'] ?></li>

	            <?php if ($item['sale'] > 0 ): ?>
                   <li  style="font-size: 18px"> <strike class="sale">Giá gốc: <?php echo formatPrice($item['price']) ?></strike><br> <b class="price">Giảm giá: <?php echo formatPricesale($item['price'],$item['sale']) ?></b><br></li>
                <?php else : ?>
                    <li  style="font-size: 18px">  <b class="price">Giá: <?php echo formatPrice($item['price']) ?></b></li>
                <?php endif ?>

	            <li><a href="addcart.php?id=<?php echo $product['id'] ?>" class="btn btn-default"> <i class="fa fa-shopping-basket"></i>Add TO Cart</a></li>
	       </ul>
	    </div>
	</section>
	<div class="col-md-12" id="tabdetail">
	    <div class="row">
	        <ul class="nav nav-tabs">
	            <li class="active"><a data-toggle="tab" href="#home">Giới Thiệu Sản Phẩm </a></li>
	            <li><a data-toggle="tab" href="#menu1">Bình Luận Sản Phẩm </a></li>

	        </ul>
	        <div class="tab-content">
	            <div id="home" class="tab-pane fade in active">
	                <h3 align="center"><?php echo $product['name'] ?></h3><br>
	                <p style="font-family: Arial,Helvetica,sans-serif; font-size: 15px; "><?php echo $product['content'] ?></p>
	            </div>
	            <div id="menu1" class="tab-pane fade">
	                <h3> Bình luận sản phẩm </h3>
					<form method="post">
						<ul>
							<li class="required">Tên <br />
								<input type="text" name="name" /> 
								<?php if (isset($error['name'])) { ?>
					            	<p class="text-danger"><?php echo $error['name']; ?></p>
					            <?php } ?>
								<!-- <span>(*)</span></li> -->
							<li class="required">Số điện thoại <br /><input type="text" name="phone" /> 
								<?php if (isset($error['phone'])) { ?>
					            	<p class="text-danger"><?php echo $error['phone']; ?></p>
					            <?php } ?>
								<!-- <span>(*)</span></li> -->
							<li class="required">Nội dung <br /><textarea rows="10" cols="50" name="comment"></textarea>
								<?php if (isset($error['comment'])) { ?>
					            	<p class="text-danger"><?php echo $error['comment']; ?></p>
					            <?php } ?> 
								<!-- <span>(*)</span></li> -->
							<li><input type="submit" name="submit" value="Bình luận" /></li>
						</ul>
					</form>
	            </div>
				<div class="comment-list">
					<?php foreach ($binhluan as $item) { ?>
					<ul>
						<li class="com-title"><?php echo $item['name'] ?><br /><span><?php echo $item['date'] ?></span></li>
                        <li class="com-details"><?php echo $rowbl['comment'] ?></li>
					</ul>
					<?php } ?>
				</div>

	        </div>
	    </div>
	</div>

	<div class="col-md-12">
		<h3 class="title-main"><a href="javascript:void(0)">Sản Phẩm Cùng Loại</a> </h3>
		<div class="showitem">
           <?php foreach ($sanphamkemtheo as $item) { ?>
                <div class="col-md-3 item-product bor">
                    <a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?> ">
                    <img src="<?php echo uploads() ?>/product/<?php echo $item['image'] ?>" class="" width="100%" height="180px">
                    </a>
                    <div class="info-item">
                        <a href="chi-tiet-san-pham.php?id=<?php echo $item['id'] ?>" ><?php echo $item['name'] ?></a>
                        <p><strike class="sale"><?php echo formatPrice($item['price']) ?></strike> <b class="price"><?php echo formatPricesale($item['price'], $item['sale']) ?></b></p>
                    </div>
                    <div class="hidenitem">
                        <p><a href=""><i class="fa fa-search"></i></a></p>
                        <p><a href=""><i class="fa fa-heart"></i></a></p>
                        <p><a href=""><i class="fa fa-shopping-basket"></i></a></p>
                    </div>
                </div>
           <?php } ?>
        </div>
	</div>

</div>

<?php require_once ('./layouts/footer.php'); ?>

                