<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.items"%>
<%@ page import="dao.itemsDAO"%>
<%@ page import="entity.Cart" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>Perfume Store</title>
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet" href="css/detail.css">
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<base href="<%=basePath%>">
 <script type="text/javascript">
      function selflog_show(id)
      { 
         var num =  document.getElementById("number").value; 
         J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
         setTimeout(function(){ $("#shoppingPocket").load(location.href+" #shoppingPocket"); }, 100);
      }
      function add()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num<100)
         {
            document.getElementById("number").value = ++num;
         }
      }
      function sub()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num>1)
         {
            document.getElementById("number").value = --num;
         }
      }
     
    </script>
</head>

<body class="fnb_zh_CN fnb_sticky-isOnTop">
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <div class="container">
                <div class="row fnb_gradient-menu">
                    <div class="fnb_text-center fnb_col-wd6 fnb_col-wd-offset-2">
                        <div class="fnb_logo">
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-wd-4 pull-right ">
                        <ul class="fnb_fixed-menu">
                            <li><input type="text" name="search" id="search" placeholder="请输查询内容...">
                                <i class="fa fa-search" aria-hidden="true"></i></li>
                            <li><i class="fa fa-user" aria-hidden="true"></i><span>
                            <%
							if(session.getAttribute("loginuser")==null)
							{
								out.print("<a href='login.jsp'>请登录</a>");
							}
							else
							{
								out.print(session.getAttribute("loginuser"));
							}
							%>
                            </span></li>
                            <li id="shoppingPocket"><i class="fa fa-shopping-bag" aria-hidden="true"></i> <a
                                    href="
                                    <%
							if(session.getAttribute("loginuser")==null)
							{
								out.print("login.jsp");
							}
							else
							{
								out.print("cart.jsp");
							}%>
								
                                    ">购物袋
                                                                                           <% 
				   //首先判断session中是否有购物车对象
				   if(request.getSession().getAttribute("cart")!=null)
				   {
				%>
                                    <%
                                    		 Cart cart = (Cart)request.getSession().getAttribute("cart");
                                    		%>
                                    		<span>(<%=cart.getTotalNumber() %></span>)</a></li>
                       <%} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="fnb_main-menu">
            </div>
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <ol class="fnb_breadcrumb fnb_text-4 fnb_font-2 ">
                    <li><a href="index.jsp">首页</a></li>
                    <li>产品名称</li>
                </ol>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
                  <!-- 商品详情 -->
          <% 
          itemsDAO itemDao =new itemsDAO();
          items item=itemDao.getitemsById(Integer.parseInt(request.getParameter("id")));
             if(item!=null)
             {
          %>
            <div class="row">
                <div class="fnb_pdp-image fnb_col-wd5 fnb_thumb-1">
                    <img class="fnb_img-responsive" src="img/<%=item.getPhoto() %>" alt="">
                </div>
                <div class="fnb_col-wd6 information">
                    <div class="fnb_pdp-information">
                        <h1 class="fnb_pdp-title fnb_text-18"><%=item.getName() %></h1>
                        <p class="fnb_pdp-subtitle fnb_block-blc fnb_text-6"><%=item.getEngname() %></p>
                    </div>
                    <div class="detailfnb_desc"><%=item.getDesc() %></div>
                    <div class="item fnb_col-wd12">
                        <div class="title">价格:</div>
                        <div class="price">￥<span><%=item.getPrice() %></span></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">规格:</div>
                        <div class="capacity">
                            <ul>
                                <li class="now">30ml</li>
                                <li class="normal">50ml</li>
                                <li class="normal">100ml</li>
                            </ul>
                        </div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">库存:</div>
                        <div class="stock"><%=item.getStock() %></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="Addcartnum">
                            <div class="numberBox">
                                <input type="text" class="text20" id="number"  value="1">
                            </div>
                            <div class="arrow">
                                <div class="topArrow curPoint">
                                    <div class="icon1"  id="add" onclick="add();"></div>
                                </div>
                                <div class="bottomArrow curPoint">
                                    <div class="icon2"  id="sub" onclick="sub();"></div>
                                </div>
                            </div>
                        </div>
                        <div class="button addToBagButton no-gutter-right">
                            <div class="has_btn">
                            
                  
                                <button type="button"
                                    class="shop-btn fnb_btn-state shop-btn-mirror fnb_btn fnb_content_btn fnb_black  fnb_submit fnb_event_listener fnb_font-1-b fnb_text-2 fnb_fulldiv fnb_addtobag-btn "
                                    style="opacity: 1;" onclick="selflog_show(<%=item.getId()%>);"><span style="opacity: 1;">加入购物袋</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                     <% 
            }
          %>
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
            <p>
                联系地址：Regina专营店　 电话：0513-12345678 传真：0588-987654321<br>版权所有：浙江Regina有限公司　浙ICP备000012345号
            </p>
        </div>
    </footer>
</body>



</html>