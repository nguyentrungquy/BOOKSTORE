<?php 

	require_once ('./autoload/autoload.php'); 
	$user = $db->fetchID("user",intval($_SESSION['name_id']));

	
?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 ">
    <section class="box-main1">
        <h3 class="title-main" ><a href="javascript:void(0)">Thông tin thành viên</a> </h3>
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
		</form>
       <!-- Nội dung -->
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                