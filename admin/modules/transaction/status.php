<?php 
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	//Lấy đơn hàng cần sửa
	$EditTransaction = $db->fetchID("transaction" , $id);
	if (empty($EditTransaction)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("transaction");
	}
	//Lấy trạng thái của đơn hàng cần sửa
	if($EditTransaction['status'] == 1)
	{
		$_SESSION["error"] = "Đơn hàng đã được xử lý rồi !!!";
		redirectAdmin("transaction");
	}
	$status = 1;

	$update = $db->update("transaction",array("status" => $status), array("id" => $id));
	if($update > 0)
	{
		$_SESSION["success"] = " Cập nhập thành công";

		$sql = "SELECT product_id, qty FROM orders WHERE transaction_id = $id";
		$Order = $db->fetchsql($sql);
		foreach ($Order as $item) 
		{
			$idproduct = intval($item['product_id']);

			$product = $db->fetchID("product",$idproduct);

			$number = $product['number'] - $item['qty']; // số lượng còn lại

			$update_pro = $db->update("product", array("number"=>$number,"spmuanhieu"=>$product['spmuanhieu']+1), array("id"=>$idproduct));
		}
		redirectAdmin("transaction");
	}
	else
	{
		$_SESSION["error"] = "Dữ liệu không thay đổi";
		redirectAdmin("transaction");
	}
 ?>