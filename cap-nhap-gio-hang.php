<?php 
    require_once ('./autoload/autoload.php'); 
	$key = intval(getInput("key")); // id của sản phẩm
	$qty = intval(getInput("qty"));

	$_SESSION['cart'][$key]['qty'] = $qty; // $key là sản phẩm cần sửa

	echo 1;
 ?>