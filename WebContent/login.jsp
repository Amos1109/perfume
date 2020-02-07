<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>Perfume Store</title>
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet" href="css/login.css">

</head>
<body>
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <div class="container">
                <div class="row fnb_gradient-menu">
                    <div class="fnb_text-center fnb_col-wd6 fnb_col-wd-offset-2">
                        <div class="fnb_logo">
                            <a href="index.html">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-wd-4 pull-right ">
                        <ul class="fnb_fixed-menu">
                            <li><input type="text" name="search" id="search" placeholder="请输查询内容...">
                                <i class="fa fa-search" aria-hidden="true"></i></li>
                            <li><i class="fa fa-user" aria-hidden="true"></i><span> 未登录</span></li>
                            <li><i class="fa fa-shopping-bag" aria-hidden="true"></i> <a
                                    href="#">购物袋</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="fnb_navigation">
        <div class="fnb_main-menu">
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_products-container fnb_plp-page load">
        <form action="dologin.jsp" name="loginForm" method="post">
            <h3 class="fnb_account-title fnb_text-16 fnb_text-center">用户登录</h3>
            <div class="login">
                <h2 class="loginTitle"></h2>
                <div class="namepositon">
                    <div class="form_field-label fnb_inline">
                        <div class="Title_name">
                            用户名
                            <span class="mandatory">*</span>
                        </div>
                        <div class="form_field-input">
                            <input type="text" id="username" name="username">
                        </div>
                        <div class="fnb_error_msg fnb_text-3"></div>
                    </div>
                </div>
                <div class="pwdpositon">
                    <div class="form_field-label fnb_inline">
                        <div class="Title_name">
                            密码
                            <span class="mandatory">*</span>
                        </div>
                        <div class="form_field-input">
                            <input type="password" id="password" name="password">
                        </div>
                        <div class="fnb_error_msg fnb_text-3"></div>
                    </div>
                </div>
                <div class="fnb_account-password-link fnb_text-4 fnb_font-2 fnb_buttonlink pull-right">
                    忘记密码？
                </div>
                <button class="fnb_main-submit fnb_btn fnb_black">
                    登陆
                </button>
                <p class="fnb_color-grey fnb_text-4 fnb_half_top fnb_bottom" style="font-weight:normal">
                    *必填
                </p>
            </div>
            </form>
        </div>
    </main>
    <footer class="fnb_modal-footer">
        <div class="container">
            <ul>
                <li>
                    <a class="fohead">支付/配送</a>
                    <a href="">货到付款</a>
                    <a href="">在线支付</a>
                    <a href="">配送时间</a>
                </li>
                <li>
                    <a class="fohead">售后服务</a>
                    <a href="">退换货规定</a>
                    <a href="">退换及退款说明</a>
                </li>
                <li>
                    <a class="fohead">Regina与您</a>
                    <a href="">法律声明</a>
                    <a href="">隐私政策</a>
                    <a href="">Regina介绍</a>
                </li>
            </ul>
            <p>联系地址：Regina专营店　 电话：0513-12345678 传真：0588-987654321<br>版权所有：浙江Regina有限公司　浙ICP备000012345号
            </p>
        </div>
    </footer>

</body>

</html>