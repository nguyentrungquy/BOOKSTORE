</div>
 <div class="container">
                    <div class="col-md-4 bottom-content">
                        <a href=""><img src="<?php echo base_url() ?>public/fontend/images/free-shipping.png"></a>
                    </div>
                    <div class="col-md-4 bottom-content">
                        <a href=""><img src="<?php echo base_url() ?>public/fontend/images/guaranteed.png"></a>
                    </div>
                    <div class="col-md-4 bottom-content">
                        <a href=""><img src="<?php echo base_url() ?>public/fontend/images/deal.png"></a>
                    </div>
                </div>
                <div class="container-pluid">
                    <section id="footer">
                        <div class="container">
                            <div class="col-md-3" id="shareicon">
                                <ul>
                                    <li>
                                        <a href=""><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fa fa-google-plus"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fa fa-youtube"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-8" id="title-block">
                                <div class="pull-left">
                                </div>
                                <div class="pull-right">
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="footer-button">
                        <div class="container-pluid">
                            <div class="container">
                                <div class="col-md-3" id="ft-about">
                                    <p>
                                        Mua sách online tại BOOK STORE để được cập nhật nhanh nhất các tựa sách đủ thể loại với mức giảm 15 – 35% cùng nhiều ưu đãi, quà tặng kèm. Qua nhiều năm, không chỉ là địa chỉ tin cậy để bạn mua sách trực tuyến, BOOK STORE còn có quà tặng, văn phòng phẩm với chất lượng đảm bảo từ hàng trăm thương hiệu uy tín trong và ngoài nước.
                                    </p>
                                </div>
                                <div class="col-md-3 box-footer" >
                                    <h3 class="tittle-footer">Tài khoản của bạn</h3>
                                    <ul>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Cập nhật tài khoản </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i>Giỏ hàng</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Lịch sử giao dịch </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Sản phẩm yêu thích</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i>Kiểm tra đơn hàng</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-3 box-footer">
                                    <h3 class="tittle-footer">Trợ Giúp</h3>
                                    <ul>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> TRỢ GIÚP</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Đăng ký nhận bản tin </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i>  Hướng dẫn mua hàng</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Phương thức thanh toán</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-angle-double-right"></i>
                                            <a href=""><i></i> Chính sách đổi - trả</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-3" id="footer-support">
                                    <h3 class="tittle-footer"> Liên hệ </h3>
                                    <ul>
                                        <li>
                                            <p><i class="fa fa-home" style="font-size: 16px;padding-right: 5px;"></i> Số nhà 24-ngõ 36-phố Đào Tấn-Hà Nội  </p>
                                            <p><i class="sp-ic fa fa-mobile" style="font-size: 22px;padding-right: 5px;"></i> 0968478588</p>
                                            <p><i class="sp-ic fa fa-envelope" style="font-size: 13px;padding-right: 5px;"></i> nguyentrungquy96@gmail.com</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="ft-bottom">
                        <p class="text-center">Copyright © 2017 . Design by  ... !!! </p>
                    </section>
                </div>
            </div>
        </div>
        </div>      
        </div>
        <script  src="<?php echo base_url() ?>public/fontend/js/slick.min.js"></script>
    </body>
</html>
<script type="text/javascript">
    $(function() {
        $hidenitem = $(".hidenitem");
        $itemproduct = $(".item-product");
        $itemproduct.hover(function(){
            $(this).children(".hidenitem").show(100);
        },function(){
            $hidenitem.hide(500);
        })
    })




    $(function(){
        $updatecart = $(".updatecart");
        $updatecart.click(function(e){
            e.preventDefault(); //không load lại trang
            $qty = $(this).parents("tr").find(".qty").val();//lấy số lượng người dùng nhập vào

            $key = $(this).attr("data-key");//key của đơn hàng cần sửa
            $.ajax({
                url: 'cap-nhap-gio-hang.php', 
                type: 'GET',
                data: {'qty':$qty,'key':$key},//dữ liệu gửi sang file cap-nhap-gio-hang
                success:function(data)
                {
                    if(data == 1)
                    {
                        alert("cập nhập giỏ hàng thành công !");
                        location.href='gio-hang.php';
                    }
                }
            });
        })
    })
</script>
