<?php 
	require_once ('./autoload/autoload.php'); 


	$data = 
	[
		"email" => postInput('email'),
		"password" => postInput('password')
	];

	$error = [];
	if ($_SERVER['REQUEST_METHOD'] == "POST") 
	{
		if(postInput('email') == ''){
			$error['email'] = "Mời bạn nhập số điện thoại";
		}

		if(postInput('password') == ''){
			$error['password'] = "Mời bạn nhập mật khẩu";
		}

		if(empty($error))
		{
			$is_check = $db->fetchOne("user", "email = '".$data['email']."' && password = '".md5($data['password'])."' ");
			if($is_check != NULL)
			{
				$_SESSION['name_user'] = $is_check['name'];
				$_SESSION['name_id'] = $is_check['id'];
				echo "<script type=\"text/javascript\">alert(' Đăng nhập thành công ! '); location.href='index.php' </script>;";
			}
			else
			{
				$_SESSION['error'] = "Đăng nhập thất bại !";
			}
		}
	}


?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    <section class="box-main1">
        <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)"> Đăng nhập </a> </h3>
        <?php if (isset($_SESSION['success'])) { ?>
        	<div class="alert alert-success">
        		<strong style="color: #008340; font-size: 15px;"><?php echo $_SESSION['success']; unset($_SESSION['success']) ?></strong>
        	</div>
        <?php } ?>
         <?php if (isset($_SESSION['error'])) { ?>
        	<div class="alert alert-danger">
        		<strong style="color: #008340; font-size: 15px;"><?php echo $_SESSION['error']; unset($_SESSION['error']) ?></strong>
        	</div>
        <?php } ?>

        <form action="" method="POST" style="margin-top: 20px">
		    <div class="form-group row">
		        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
		        <div class="col-sm-10">
		            <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="nguyentrungquy96@gmail.com">
		             <?php if (isset($error['email'])) { ?>
		            	<p class="text-danger"><?php echo $error['email']; ?></p>
		            <?php } ?>
		        </div>
		    </div>

		    <div class="form-group row">
		        <label for="inputPassword3" class="col-sm-2 col-form-label">Mật khẩu</label>
		        <div class="col-sm-10">
		            <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="******">
		             <?php if (isset($error['password'])) { ?>
		            	<p class="text-danger"><?php echo $error['password']; ?></p>
		            <?php } ?>
		        </div>
		    </div>
		    
		    <div class="form-group row">
		        <div class="col-sm-5 col-sm-offset-2">
		            <button type="submit" class="btn btn-primary">Đăng nhập</button>
		        </div>
		    </div>
		</form>
       <!-- Nội dung -->
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                