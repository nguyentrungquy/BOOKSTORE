<?php 
	require_once ('./autoload/autoload.php'); 

?>
<?php require_once ('./layouts/header.php'); ?>

<div class="col-md-9 bor">
    <section class="box-main1">
        <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)"> Thông báo thanh toán </a> </h3>
        <?php if (isset($_SESSION['success'])) { ?>
            <div class="alert alert-success">
                <strong style="color: #3c763d; font-size: 15px; text-align: center;"><?php echo $_SESSION['success']; unset($_SESSION['success']) ?></strong>
            </div>
        <?php } ?>
        <?php if (isset($_SESSION['error'])) { ?>
        	<div class="alert alert-danger">
        		<strong style="color: #3c763d; font-size: 15px; text-align: center;"><?php echo $_SESSION['error']; unset($_SESSION['error']) ?></strong>
        	</div>
        <?php } ?>

        <a  href="index.php" class="btn btn-success">Trở về trang chủ</a>
       <!-- Nội dung -->
    </section>
</div>

<?php require_once ('./layouts/footer.php'); ?>

                