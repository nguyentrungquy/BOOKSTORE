<?php 
    require_once ('./autoload/autoload.php'); 
    
    $sum = 0;

    if( !isset($_SESSION['cart']) | count($_SESSION['cart']) == 0)
    {
        echo "<script type=\"text/javascript\">alert(' Không có sản phẩm trong giỏ hàng ! '); location.href='index.php' </script>;";
    }
?>
<?php require_once ('./layouts/header.php'); ?>
<div class="col-md-9 bor">
    <section class="box-main1">
        <h3 class="title-main" style="text-align: center;"><a href="javascript:void(0)">Giỏ hàng của bạn</a> </h3>
            <?php if (isset($_SESSION['success'])) { ?>
            <div class="alert alert-success">
                <strong style="color: #008340; font-size: 15px;"><?php echo $_SESSION['success']; unset($_SESSION['success']) ?></strong>
            </div>
        <?php } ?>
        <table class="table table-hover" id="shopcart">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sách</th>
                    <th>Hình ảnh</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Tổng tiền</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <?php $stt =1 ; foreach ($_SESSION['cart'] as $key => $value) { ?>
                <tr>
                    <td><?php echo $stt  ?></td>
                    <td><?php echo $value['name']  ?></td>
                    <td>
                        <img src="<?php echo uploads() ?>product/<?php echo $value['image'] ?> " width ="80px" height="80px">
                    </td>
                    <td>
                        <input class="form-control qty" id="qty" type="number" name="qty" value="<?php echo $value['qty'] ?>" min="0">
                    </td>
                    <td><?php echo formatPrice($value['price']) ?></td>
                    <td><?php echo formatPrice($value['price'] * $value['qty']) ?></td>
                    <td>
                        <a href="remove.php?key=<?php echo $key ?>" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> remove</a>
                        <a href="#" class="btn btn-xs btn-info updatecart" data-key=<?php echo $key ?>> <i class="fa fa-refresh"></i> Update</a>
                    </td>
                </tr>
                <?php $sum += $value['price'] * $value['qty']; $_SESSION['tongtien'] = $sum ; ?>

                <?php $stt++; } ?>
            </tbody>
        </table>
        <div class="col-md-5 pull-right">
            <ul class="list-group">
                <li class="list-group-item">
                    <h3> Thông tin đơn hàng </h3>
                </li>
                <li class="list-group-item">
                    <span class="badge"><?php echo formatPrice($_SESSION['tongtien']) ?></span>
                    Số tiền
                </li>
                <li class="list-group-item">
                    <span class="badge">10 %</span>
                    Thuế VAT
                </li>

                <li class="list-group-item">
                    <span class="badge"><?php $_SESSION['total'] = $_SESSION['tongtien'] * 110/100; echo formatPrice($_SESSION['total']); ?></span>
                    Tổng tiền thanh toán
                </li>
                
                <li class="list-group-item">
                    <a href="index.php" class="btn btn-success">Tiếp tục mua hàng</a>
                    <a href="thanh-toan.php" class="btn btn-success">Thanh toán</a>
                </li>


            </ul>
        </div>
    </section>
</div>
<?php require_once ('./layouts/footer.php'); ?>
