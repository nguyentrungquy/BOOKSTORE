<?php 
	$open = "category";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$EditCategory = $db->fetchID("category", $id);
	if (empty($EditCategory)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("category");
	}
	// kiểm tra xem danh mục có sản phẩm ko, nếu có ko cho xóa 
	$is_product = $db->fetchOne("product"," category_id = $id ");
	if($is_product == NULL)
	{
		$num = $db->delete("category",$id);
		if($num > 0)
		{
			$_SESSION["success"] = " Xóa thành công";
			redirectAdmin("category");
		}
		else
		{
			$_SESSION["error"] = "Xóa thất bại !";
			redirectAdmin("category");
		}
	}
	else
	{
		$_SESSION["error"] = "Danh mục có sản phẩm! Bạn không thể xóa ";
		redirectAdmin("category");
	}
 ?>