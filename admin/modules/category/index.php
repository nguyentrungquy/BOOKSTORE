<?php 
	$open = "category";
	require_once ('/../../autoload/autoload.php');

	$category = $db->fetchAll("category");
 ?>
<?php require_once('/../../layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.html">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Danh mục sách</li>
	</ol>
	<div class="row">
	    <div class="col-12">
	        <h1>Danh sách danh mục
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
                    <th >Slug</th>
                    <th >Home</th>
                    <th >Created</th>
                    <th >Active</th>
                </tr>
            </thead>
            <tbody>
            	<?php $stt = 1; foreach ($category as $item) { ?>
	                <tr role="row" class="odd">
	                    <td class="sorting_1"><?php echo $stt ?></td>
	                    <td><?php echo $item['name'] ?></td>
	                    <td><?php echo $item['slug'] ?></td>
	                    <td>
	                    	<a  href="home.php?id=<?php echo $item['id'] ?>" class="btn btn-xs <?php echo $item['home'] == 1 ? 'btn-info' : 'btn-default' ?>" >
	                    		<?php echo $item['home'] == 1 ? ' Hiển thị ' : ' không ' ?>
	                    	</a>
	                    </td>
	                    <td><?php echo $item['create_at'] ?></td>
	                    <td>
	                    	<a class="btn btn-xs btn-info" href="edit.php?id=<?php echo $item['id']?>"><i class="fa fa-edit"></i>Sửa</a>
	                    	<a class="btn btn-xs btn-danger" href="delete.php?id=<?php echo $item['id']?>"><i class="fa fa-times"></i>Xóa</a>
	                    </td>
	                    
	                </tr>
            	<?php $stt++; } ?>
                
                
            </tbody>
        </table>
       <!--  <div class="pull-right">
		    <nav aria-label="Page navigation example">
			    <ul class="pagination">
			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Previous">
			            <span aria-hidden="true">&laquo;</span>
			            <span class="sr-only">Previous</span>
			            </a>
			        </li>
			        <li class="page-item"><a class="page-link" href="#">1</a></li>
			        <li class="page-item"><a class="page-link" href="#">2</a></li>
			        <li class="page-item"><a class="page-link" href="#">3</a></li>
			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            <span class="sr-only">Next</span>
			            </a>
			        </li>
			    </ul>
			</nav>
		</div> -->
    </div>
</div>

<?php require_once('/../../layouts/footer.php') ?>