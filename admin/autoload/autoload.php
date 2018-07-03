<?php 
	session_start();
	require_once('/../../libraries/Database.php');
	require_once('/../../libraries/Function.php');
	$db = new Database ;

	if( !isset($_SESSION['admin_id']))
	{
		header("location: /datn/login/");
	}

	define("ROOT", $_SERVER['DOCUMENT_ROOT'] ."/datn/public/uploads/");
	$sql = "select * from product where number  > 0";
	$tonkho = $db->fetchsql($sql);
 ?>