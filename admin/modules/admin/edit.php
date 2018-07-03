<?php 
	$open = "admin";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$Editadmin = $db->fetchID("admin" , $id);
	if (empty($Editadmin)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("admin");
	}
	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$data = 
		[
			"name" => postInput('name'),
			"email" => postInput('email'),
			"phone" => postInput("phone"),
			// "password" => md5(postInput("password")),
			"address" => postInput("address"),
			"lever" => postInput("lever")
		];

		$error = [];

		if(postInput('name') == ''){
			$error['name'] = "Mời bạn nhập học tên";
		}
		
		if(postInput('email') == ''){
			$error['email'] = "Mời bạn nhập email";
		}
		else
		{	if(postInput('email') != $Editadmin['email'])
			{
				$is_check = $db->fetchOne("admin"," email = '".$data['email']."' ");
				if($is_check != NULL)
				{
					$error['email'] = "Email đã tồn tại !";
				}
			}
		}
		
		if(postInput('phone') == ''){
			$error['phone'] = "Mời bạn nhập số điện thoại";
		}

		// if(postInput('password') == ''){
		// 	$error['password'] = "Mời bạn nhập mật khẩu";
		// }
		
		if(postInput('address') == ''){
			$error['address'] = "Mời bạn nhập địa chỉ";
		}

		// if ($data['password'] != md5(postInput("re_password"))) {
		// 	$error['password'] = "Mật khẩu không khớp !";
		// }
		if (postInput("password") != NULL && postInput("re_password") != NULL) 
		{
			if (postInput("password") != postInput("re_password")) 
			{
				$error['password'] = "Mật khẩu thay đổi không khớp !";
			}
			else
			{
				$data['password'] = md5(postInput("password"));
			}
		}
	//error trống có nghĩa là không có lỗi
		if (empty($error)) 
		{
			$id_update = $db->update("admin",$data,array("id"=>$id));
			if($id_update > 0)
			{
				$_SESSION["success"] = "Cập nhập thành công";
				redirectAdmin("admin");
			}
			else
			{
				$_SESSION["error"] = "Cập nhập không thành công";
			}
		}
	}

 ?>
<?php require_once('/../../layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.html">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Admin</li>
	    <li class="breadcrumb-item active">Sửa</li>
	</ol>
	<div class="row">
	    <div class="col-12">
	        <h1>Cập nhập Admin
	        </h1>
	    </div>
	</div>
    <div class="clearfix"></div>
<!-- thông báo lỗi -->
<?php require_once('/../../../partials/notification.php'); ?>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" action="" method="POST"  enctype="multipart/form-data">

			    <div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Họ và tên</label>
			        <div class="col-sm-8">
			            <input type="text" class="form-control" id="inputEmail3" placeholder="Họ và tên" name="name" value="<?php echo $Editadmin['name'] ?>">
			            <?php if (isset($error['name'])) { ?>
			            	<p class="text-danger"><?php echo $error['name']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

			    <div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			        <div class="col-sm-8">
			            <input type="email" class="form-control" id="inputEmail3" placeholder="nguyentrungquy96@gmail.com" name="email" value="<?php echo $Editadmin['email'] ?>">
			            <?php if (isset($error['email'])) { ?>
			            	<p class="text-danger"><?php echo $error['email']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

			     <div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
			        <div class="col-sm-8">
			            <input type="number" class="form-control" id="inputEmail3" placeholder="0968478588" name="phone" value="<?php echo $Editadmin['phone'] ?>">
			            <?php if (isset($error['phone'])) { ?>
			            	<p class="text-danger"><?php echo $error['phone']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

				<div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">password</label>
			        <div class="col-sm-8">
			            <input type="password" class="form-control" id="inputEmail3" placeholder="******" name="password">
			            <?php if (isset($error['password'])) { ?>
			            	<p class="text-danger"><?php echo $error['password']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

				<div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Config password</label>
			        <div class="col-sm-8">
			            <input type="password" class="form-control" id="inputEmail3" placeholder="******" name="re_password" >
			            <?php if (isset($error['re_password'])) { ?>
			            	<p class="text-danger"><?php echo $error['re_password']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

				<div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Address</label>
			        <div class="col-sm-8">
			            <input type="text" class="form-control" id="inputEmail3" placeholder="địa chỉ" name="address" value="<?php echo $Editadmin['address'] ?>">
			            <?php if (isset($error['address'])) { ?>
			            	<p class="text-danger"><?php echo $error['address']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

			    
			    <div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Lever</label>
			        <div class="col-sm-8">
			           	<select class="form-control" name="lever">
			           		<option value="1" <?php isset($Editadmin['lever']) && $Editadmin['lever'] == 1 ? "selected = selected" : '' ?>>CTV</option>
			           		<option value="2" <?php isset($Editadmin['lever']) && $Editadmin['lever'] == 2 ? "selected = selected" : '' ?>>Admin</option>
			           	</select>
			            <?php if (isset($error['lever'])) { ?>
			            	<p class="text-danger"><?php echo $error['lever']; ?></p>
			            <?php } ?>
			        </div>
			    </div>

			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-success">Lưu</button>
			        </div>
			    </div>
			</form>
		</div>
	</div>

<?php require_once('/../../layouts/footer.php') ?>