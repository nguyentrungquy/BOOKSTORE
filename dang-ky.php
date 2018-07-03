<?php
	require_once ('./autoload/autoload.php'); 

	if(isset($_SESSION['name_id']))
	{
		echo "<script type=\"text/javascript\">alert(' Bạn đã có tài khoản nên không thể vào đây ! '); location.href='index.php' </script>;";
	}
	//xử lý
	$data = 
	[
		"name" => postInput('name'),
		"email" => postInput('email'),
		"password" => postInput('password'),
		"phone" => postInput('phone'),
		"address" => postInput('address')
	];

	$error = [];
	if ($_SERVER['REQUEST_METHOD'] == "POST") 
	{
		if(postInput('name') == ''){
			$error['name'] = "Mời bạn nhập học tên";
		}
		
		if(postInput('email') == ''){
			$error['email'] = "Mời bạn nhập email";
		}
		else
		{
			$is_check = $db->fetchOne("user"," email = '".$data['email']."' ");
			if($is_check != NULL)
			{
				$error['email'] = "Email đã tồn tại! Mời bạn nhập địa chỉ Email khác !";
			}
		}

		if(postInput('phone') == ''){
			$error['phone'] = "Mời bạn nhập số điện thoại";
		}

		if(postInput('password') == ''){
			$error['password'] = "Mời bạn nhập mật khẩu";
		}
		else
		{
			$data['password'] = md5(postInput('password'));
		}
		
		if(postInput('address') == ''){
			$error['address'] = "Mời bạn nhập địa chỉ";
		}


		//Kiểm tra mảng error
		if (empty($error)) 
		{
			$id_insert = $db->insert("user",$data);
			if($id_insert > 0 )
			{
				$_SESSION['success'] = "Đăng ký thành công! Mời bạn đăng nhập !!!";
				header("location: dang-nhap.php");
			}
			else
			{
				echo "Đăng ký thất bại !";
			}
		}
	}
	
 ?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    <section class="box-main1">
        <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Đăng ký thành viên</a> </h3>
        <form action="" method="POST" style="margin-top: 20px">
		    <div class="form-group row">
		        <label for="inputEmail3" class="col-sm-2 col-form-label">Tên thành viên</label>
		        <div class="col-sm-10">
		            <input type="text" name="name" class="form-control" id="inputEmail3" placeholder="nguyễn trung quy" value="<?php echo $data['name'] ?>">
		            <?php if (isset($error['name'])) { ?>
		            	<p class="text-danger"><?php echo $error['name']; ?></p>
		            <?php } ?>
		            
		        </div>
		    </div>
		    
		    <div class="form-group row">
		        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
		        <div class="col-sm-10">
		            <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="nguyentrungquy96@gmail.com" value="<?php echo $data['email'] ?>">
		             <?php if (isset($error['email'])) { ?>
		            	<p class="text-danger"><?php echo $error['email']; ?></p>
		            <?php } ?>
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Mật khẩu</label>
		        <div class="col-sm-10">
		            <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="******" value="<?php echo $data['password'] ?>">
		             <?php if (isset($error['password'])) { ?>
		            	<p class="text-danger"><?php echo $error['password']; ?></p>
		            <?php } ?>
		        </div>
		    </div>
		    
		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Số điện thoại</label>
		        <div class="col-sm-10">
		            <input type="number" name="phone" class="form-control" id="inputPassword3" placeholder="0968478588" value="<?php echo $data['phone'] ?>">
		             <?php if (isset($error['phone'])) { ?>
		            	<p class="text-danger"><?php echo $error['phone']; ?></p>
		            <?php } ?>
		        </div>
		    </div>
 
		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Địa chỉ</label>
		        <div class="col-sm-10">
		            <input type="text" name="address" class="form-control" id="inputPassword3" placeholder="Lý Nhân - Vĩnh Tường - Vĩnh Phúc" value="<?php echo $data['address'] ?>">
		             <?php if (isset($error['address'])) { ?>
		            	<p class="text-danger"><?php echo $error['address']; ?></p>
		            <?php } ?>
		            
		        </div>
		    </div>

		    <div class="form-group row">
		        <div class="col-sm-5 col-sm-offset-2">
		            <button type="submit" class="btn btn-primary">Đăng ký</button>
		        </div>
		    </div>
		</form>
       <!-- Nội dung -->
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                