<?php 
	require_once ('./autoload/autoload.php'); 

	if(!isset($_SESSION['name_id']))
	{
		echo "<script type=\"text/javascript\">alert(' Bạn phải đăng nhập để thực hiện được chức năng này! '); location.href='dang-nhap.php' </script>;";
	}

	$id = intval(getInput('id'));

	//chi tiết sản phẩm
	$product = $db->fetchID("product",$id);

	// kiểm tra nếu tồn tại giỏ hàng thì cập nhập

	//ngược lại thì tạo mói
	if (!isset($_SESSION['cart'][$id])) 
	{
		//tạo mới giỏ hàng
		$_SESSION['cart'][$id]['name'] = $product['name'];
		$_SESSION['cart'][$id]['image'] = $product['image'];
		$_SESSION['cart'][$id]['qty'] = 1;
		$_SESSION['cart'][$id]['price'] =((100 - $product['sale']) * $product['price']) / 100 ;
	}
	else
	{
		$_SESSION['cart'][$id]['qty'] += 1;
	}

	echo "<script type=\"text/javascript\">alert(' Thêm sản phẩm thành công ! '); location.href='gio-hang.php' </script>;";
 ?>