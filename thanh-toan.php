<?php 

	require_once ('./autoload/autoload.php'); 
	if(isset($_SESSION['name_id']))
	{
		$user = $db->fetchID("user",intval($_SESSION['name_id']));
	}
	else
	{
		$_SESSION['error'] = "Bạn cần phải đăng nhập ";
		header("location:thong-bao.php");
	}

	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		$data = 
		[
			'amount' => $_SESSION['total'],
			'users_id' => $_SESSION['name_id'],
			'note' => postInput("note")
		];

		//luu vào bảng thông tin đơn hàng
		$id_transaction = $db->insert("transaction",$data);
		if($id_transaction > 0 )
		{
			foreach ($_SESSION['cart'] as $key => $value) {
				$data2 = 
				[
					'transaction_id' => $id_transaction,
					'product_id' 	 => $key,
					'qty' 			 => $value['qty'],
					'price' 		 => $value['price']
				];

				$id_insert = $db->insert("orders",$data2);
			}

			unset($_SESSION['cart']);
			unset($_SESSION['total']);
			$_SESSION['success'] = "Lưu thông tin đơn hàng thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất! ";
			header("location:thong-bao.php");
		}
	}
?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 ">
    <section class="box-main1">
        <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Thanh toán đơn hàng</a> </h3>
        <form action="" method="POST" style="margin-top: 20px">
		    <div class="form-group row">
		        <label for="inputEmail3" class="col-sm-2 col-form-label">Tên thành viên</label>
		        <div class="col-sm-10">
		            <input type="text" readonly="" name="name" class="form-control" id="inputEmail3" placeholder="nguyễn trung quy" value="<?php echo $user['name'] ?>">
		        </div>
		    </div>
		    
		    <div class="form-group row">
		        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
		        <div class="col-sm-10">
		            <input type="email" readonly="" name="email" class="form-control" id="inputEmail3" placeholder="nguyentrungquy96@gmail.com" value="<?php echo $user['email'] ?>">
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Số điện thoại</label>
		        <div class="col-sm-10">
		            <input type="number" readonly="" name="phone" class="form-control" id="inputPassword3" placeholder="0968478588" value="<?php echo $user['phone'] ?>">
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Địa chỉ</label>
		        <div class="col-sm-10">
		            <input type="text" readonly="" name="address" class="form-control" id="inputPassword3" placeholder="Lý Nhân - Vĩnh Tường - Vĩnh Phúc" value="<?php echo $user['address'] ?>">
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Số tiền</label>
		        <div class="col-sm-10">
		            <input type="text" readonly="" name="address" class="form-control" id="inputPassword3" placeholder="" value="<?php echo formatPrice($_SESSION['total']) ?>">
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Ghi chú</label>
		        <div class="col-sm-10">
		            <input type="text" name="note" class="form-control" id="inputPassword3" placeholder="Giao hàng tận nơi">
		        </div>
		    </div>

		    <div class="form-group row">
		        <div class="col-sm-5 col-sm-offset-2">
		            <button type="submit" class="btn btn-primary">Xác nhận</button>
		        </div>
		    </div>
		</form>
       <!-- Nội dung -->
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                