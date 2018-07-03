<?php 
	session_start();
	require_once('/../libraries/Database.php');
	require_once('/../libraries/Function.php');
	$db = new Database ;

	define("ROOT", $_SERVER['DOCUMENT_ROOT'] ."/datn/public/uploads/");

	$category = $db->fetchAll("category");


	// lấy ra sản phẩm mới 
	$sqlNew = "SELECT * FROM product WHERE 1 ORDER BY ID DESC LIMIT 2";
	$productNew = $db->fetchsql($sqlNew);

	$sqlPay = "SELECT * FROM product WHERE 1 ORDER BY spmuanhieu DESC LIMIT 3";
	$spmuanhieu = $db->fetchsql($sqlPay);
 ?> 