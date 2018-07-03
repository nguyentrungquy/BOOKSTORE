<?php 
	$open = "transaction";
	require_once ('/../../autoload/autoload.php');

	// $product = $db->fetchAll("product");
	if(isset($_GET['page']))
	{
		$p = $_GET['page'];
	}
	else
	{
		$p = 1;
	}

	$sql = "SELECT transaction.*, user.name as nameuser, user.phone as phoneuser FROM transaction LEFT JOIN user ON user.id = transaction.users_id ORDER BY ID DESC ";
	$transaction = $db->fetchJone('transaction',$sql,$p,10,true);

	if (isset($transaction['page'])) 
	{
		$sotrang = $transaction['page'];
		unset($transaction['page']);	
	}
 ?>
<?php require_once('/../../layouts/header.php'); ?>
	<ol class="breadcrumb">
	    <li class="breadcrumb-item">
	        <a href="index.html">Dashboard</a>
	    </li>
	    <li class="breadcrumb-item active">Quản lý đơn hàng</li>
	</ol>
	<div class="row">
	    <div class="col-12">
	        <h1>Danh sách đơn hàng
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
                    <th >Phone</th>
                    <th>Tổng tiền</th>
                    <th >Status</th>
                    <th >Active</th>
                </tr>
            </thead>
            <tbody>
            	<?php $stt = 1; foreach ($transaction as $item) { ?>
	                <tr role="row" class="odd">
	                    <td class="sorting_1"><?php echo $stt ?></td>
	                    <td><?php echo $item['nameuser'] ?></td>
	                    <td><?php echo $item['phoneuser'] ?></td>
	                    <td><b><?php echo formatPrice($item['amount']) ?></b></td>
	                    <td>
	                    	<a href="status.php?id=<?php echo $item['id'] ?>" class="btn btn-xs <?php echo $item['status'] == 0 ? 'btn-danger' : 'btn-info' ?> "><?php echo $item['status'] == 0 ? 'Chưa xử lý' : 'Đã xử lý' ?></a>
	                    </td>
	                    <td>
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