<?php 
	$open = "product";
	require_once ('/../../autoload/autoload.php');
	$query = getInput("query");
	// $product = $db->fetchAll("product");
	if(isset($_GET['page']))
	{
		$p = $_GET['page'];
	}
	else
	{
		$p = 1;
	}
	$title = "";
	if($query != 2)
	{
		$sql = "SELECT product.*,category.name as namecate FROM product LEFT JOIN category on category.id = product.category_id";
	}
	else
	{
		$sql = "select product.*,category.name as namecate from product LEFT JOIN category on category.id = product.category_id where number  > 0";
		$title = "Tồn";
	}

	$product = $db->fetchJone('product',$sql,$p,6,true);

	if (isset($product['page'])) 
	{
		$sotrang = $product['page'];
		unset($product['page']);	
	}
 ?>
<?php require_once('/../../layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.html">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Sản phẩm</li>
	</ol>
	<div class="row">
	    <div class="col-12">
	        <h1>Danh sách sản phẩm <?php if(isset($title)){echo $title;}else{echo "";} ?>
	        <a href="add.php" class="btn btn-success">Thêm mới</a>
	        </h1>
	        <div class="clearfix"></div>

	        <!-- thông báo lỗi -->
<?php require_once('/../../../partials/notification.php'); ?>
	       

	    </div>
	</div>
	<div class="row">
    <div class="col-sm-12">
        <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
            <thead>
                <tr role="row">
                    <th >STT</th>
                    <th >Name</th>
                    <th >Category</th>
                    <!-- <th >Slug</th> -->
                    <th >Tác giả</th>
                    <!-- <th >Nội dung</th> -->
                    <th >Hình ảnh</th>
                    <th >Tình trạng</th>
                    <th >Active</th>
                </tr>
            </thead>
            <tbody>
            	<?php $stt = 1; foreach ($product as $item) { ?>
	                <tr role="row" class="odd">
	                    <td class="sorting_1"><?php echo $stt ?></td>
	                    <td><?php echo $item['name'] ?></td>
	                    <td><?php echo $item['namecate'] ?></td>
	                    <!-- <td><?php echo $item['slug'] ?></td> -->
	                    <td><?php echo $item['tacgia'] ?></td>
	                    <td>
	                    	<img src="<?php echo uploads() ?>product/<?php echo $item['image'] ?>" width="80px" height="80px" >
	                    </td>
	                    <td>
	                    	<ul>
	                    		<li>Giá: <?php echo $item['price'] ?></li>
	                    		<li>Số lượng: <?php echo $item['number'] ?></li>
	                    		<li>Giảm giá:: <?php echo $item['sale'] ?>%</li>
	                    	</ul>
	                    </td>
	                    <td>
	                    	<a class="btn btn-xs btn-info" href="edit.php?id=<?php echo $item['id']?>"><i class="fa fa-edit"></i>Sửa</a>
	                    	<a class="btn btn-xs btn-danger" href="delete.php?id=<?php echo $item['id']?>"><i class="fa fa-times"></i>Xóa</a>
	                    </td>
	                    
	                </tr>
            	<?php $stt++; } ?>
                
                
            </tbody>
        </table>
        <div class="pull-right">
		    <nav aria-label="Page navigation example">
			    <ul class="pagination">
			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Previous">
			            <span aria-hidden="true">&laquo;</span>
			            <span class="sr-only">Previous</span>
			            </a>
			        </li>
					<?php for ($i=1; $i <= $sotrang ; $i++) { ?>
						<?php 
						if (isset($_GET['page'])) {
							$p = $_GET['page'];
						}
						else{
							$p = 1;
						}
						?>
				        <li class="<?php echo ($i == $p) ? 'active' : '' ?>">
				        	<a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
				        </li>
					<?php } ?>

			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            <span class="sr-only">Next</span>
			            </a>
			        </li>
			    </ul>
			</nav>
		</div>
    </div>
</div>

<?php require_once('/../../layouts/footer.php') ?>