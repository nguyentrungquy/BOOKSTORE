<?php 
	$open = "transaction";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$DeleteTransaction = $db->fetchID("transaction", $id);
	if (empty($DeleteTransaction)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("transaction");
	}
	$num = $db->delete("transaction",$id);
	if($num)
	{
		$_SESSION["success"] = " Xóa thành công";
		redirectAdmin("transaction");
	}
	else
	{
		$_SESSION["error"] = "Xóa thất bại !";
		redirectAdmin("transaction");
	}
 ?>