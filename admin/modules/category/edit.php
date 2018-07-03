<?php 
	$open = "category";
	require_once ('/../../autoload/autoload.php');

	$id = intval(getInput('id'));

	$EditCategory = $db->fetchID("category", $id);
	if (empty($EditCategory)) {
		$_SESSION['error'] = "Dữ liệu không tồn tại";
		redirectAdmin("category");
	}
	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$data = 
		[
			"name" => postInput('name'),
			"slug" => to_slug(postInput("name"))
		];

		$error = [];

		if(postInput('name') == ''){
			$error['name'] = "Moi ban nhap ten danh muc";
		}
		if (empty($error)) {
			if($EditCategory['name'] != $data['name'])
			{
				$isset = $db->fetchOne("category", "name = '".$data['name']."'");
				if(count($isset) > 0)
				{
					$_SESSION['error'] = "Tên danh mục đã tồn tại !";
				}
				else
				{
					$id_update = $db->update("category",$data,array("id"=>$id));
					if($id_update > 0)
					{
						$_SESSION["success"] = " Cập nhập thành công";
						redirectAdmin("category");
					}
					else
					{
						$_SESSION["error"] = "Dữ liệu không thay đổi";
						redirectAdmin("category");
					}
				}
			}
			else
			{
				$id_update = $db->update("category",$data,array("id"=>$id));
				if($id_update > 0)
				{
					$_SESSION["success"] = " Cập nhập thành công";
					redirectAdmin("category");
				}
				else
				{
					$_SESSION["error"] = "Dữ liệu không thay đổi";
					redirectAdmin("category");
				}
			}

		}
	}

 ?>
<?php require_once('/../../layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.html">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Danh mục</li>
	    <li class="breadcrumb-item active">Thêm mới</li>
	</ol>
	<div class="row">
	    <div class="col-12">
	        <h1>Thêm mới danh mục danh mục
	        </h1>
	    </div>
	</div>
	    <div class="clearfix"></div>
<!-- thông báo lỗi -->
<?php require_once('/../../../partials/notification.php'); ?>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" action="" method="POST">
			    <div class="form-group">
			        <label for="inputEmail3" class="col-sm-2 control-label">Tên danh mục</label>
			        <div class="col-sm-8">
			            <input type="text" class="form-control" id="inputEmail3" placeholder="danh mục" name="name"  value="<?= $EditCategory['name'] ?>">
			            <?php if (isset($error['name'])) { ?>
			            	<p class="text-danger"><?php echo $error['name']; ?></p>
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