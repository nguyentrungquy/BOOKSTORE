<?php 
	$open = "admin";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$Deleteadmin = $db->fetchID("admin", $id);
	if (empty($Deleteadmin)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("admin");
	}
	$num = $db->delete("admin",$id);
	if($num > 0)
			{
				$_SESSION["success"] = " Xóa thành công";
				redirectAdmin("admin");
			}
			else
			{
				$_SESSION["error"] = "Xóa thất bại !";
				redirectAdmin("admin");
			}
 ?>