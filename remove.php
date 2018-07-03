<?php 
    require_once ('./autoload/autoload.php'); 

    $key = intval(getInput('key'));

    unset($_SESSION['cart'][$key]);

    $_SESSION['success'] = "Xóa sản phẩm trong giỏ hàng thành công !";
    header('location:gio-hang.php');
	
 ?>