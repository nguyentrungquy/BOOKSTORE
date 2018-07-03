<?php 
	$open = "user";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$Deleteadmin = $db->fetchID("user", $id);
	if (empty($Deleteadmin)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("user");
	}
	$num = $db->delete("user",$id);
	if($num > 0)
			{
				$_SESSION["success"] = " Xóa thành công";
				redirectAdmin("user");
			}
			else
			{
				$_SESSION["error"] = "Xóa thất bại !";
				redirectAdmin("user");
			}
 ?>