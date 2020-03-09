<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.itemsDAO"%>
<%@ page import="entity.items"%>
<%@ page import="entity.Cart" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Perfume Store</title>
<link rel="icon" href="img/icon.png">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/styles_zh_CN.css">
 <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
      function selflog_show(id)
      { 
    	  var num = 1; 
         J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
         
         setTimeout(function(){ $("#shoppingPocket").load(location.href+" #shoppingPocket"); }, 100);
         }
    	 
</script>
<base href="<%=basePath%>">
</head>
<body class="fnb_zh_CN fnb_sticky-isOnTop">
	<div class="fnb_navigation">
		<div class="fnb_header fnb_white">
			<div class="fnb_gradient"></div>
			<div class="container">
				<div class="row fnb_gradient-menu">
					<div class="fnb_text-center fnb_col-wd6 fnb_col-wd-offset-2">
						<div class="fnb_logo">
							<a href="index.jsp"> <img src="img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-wd-4 pull-right ">
						<ul class="fnb_fixed-menu">
							<li><input type="text" name="search" id="search"
								placeholder="请输入查询内容..."> <i class="fa fa-search"
								aria-hidden="true"></i></li>
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
							%></span></li>
							
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
				<div class="fnb_main-menu-items">

					<div class="total menuitem">

						<div class="fnb_main-menu-item">
							<a class="fnb_active" href="" data-link="#totaltab">ALL</a>
						</div>
					</div>
					<div class="Chanel menuitem">
						<div class="fnb_main-menu-item">
							<a class="" href="" data-link="#Chaneltab">CHANEL</a>
						</div>
					</div>
					<div class="dior menuitem">
						<div class="fnb_main-menu-item">
							<a class="" href="" data-link="#diortab">Dior</a>
						</div>
					</div>
					<div class="Lancome menuitem">
						<div class="fnb_main-menu-item">
							<a class="" href="" data-link="#Lancometab">LANCOME</a>
						</div>
					</div>
					<div class="BVLGARI menuitem">
						<div class="fnb_main-menu-item">
							<a class="" href="" data-link="#BVLGARItab">BVLGARI</a>
						</div>
					</div>
					<div class="Other menuitem">
						<div class="fnb_main-menu-item">
							<a class="" href="" data-link="#Othertab">Other</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main role="main" class="fnb_main-container">
		<div class="pushZone">
			<section class="fnb_fullbleed-container fnb_is-parent">
				<div class="paredito parsys"></div>
			</section>
		</div>
		<div class="container fnb_products-container fnb_plp-page load">
			<div class="fnb_products__ container clearfix fnb_products-container">
				<ul class="row">
					
					
					<!-- 商品循环开始 -->
					<%
						itemsDAO itemsDao = new itemsDAO();
						ArrayList<items> list = itemsDao.getAllitems();
						if (list != null && list.size() > 0) {
							for (int i = 0; i < list.size(); i++) {
								items item = list.get(i);
					%>
					<li class="fnb_inline">
						<div
							class="fnb_col-wd6 fnb_product-grid clearfix fnb_event_listener fadding">
							<div class="fnb_col-wd6 fnb_product-img">
								<a href="detail.jsp?id=<%=item.getId()%>"><img
									class="fnb_img-responsive fnb_img-desc load"
									src="img/<%=item.getPhoto()%>" alt=""></a>
							</div>
							<div class="fnb_col-wd6 fnb_product-grid-infos">
								<div class="fnb_inline-block">
									<div class="fnb_product-title"><%=item.getEngname()%></div>
								</div>
								<div class="fnb_product_grid_description">
									<p><%=item.getName()%></p>
									<p class="fnb_desc"><%=item.getDesc()%></p>
								</div>
								<p class="fnb_text-3 fnb_product-price fnb_font-2 ">
									￥<span><%=item.getPrice()%></span>
								</p>
								<div class="fnb_buy">
									<div class="quickbuyButton button">
										<div style="text-align: left">
											<div class="fnb_buy">
												<button
													class="fnb_btn fnb_content_btn fnb_black  fnb_font-1 fnb_quickbuy-btn  "
													type="button"  onclick="location.href='detail.jsp?id=<%=item.getId()%>'" >立即购买</button>
													<button
													class="fnb_btn fnb_content_btn fnb_black  fnb_font-1 fnb_quickbuy-btn  "
													type="button"  onclick="selflog_show(<%=item.getId()%>);">加入购物车</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
						</li>
						<!-- 商品循环结束 --> <%
 	}
 	}
 %>

				</ul>
			</div>
		</div>
		<div class="container fnb_products-container">
			<div id="pagination" class="pagination">
				<ul>
					<li class="disabled">&lt;</li>
					<li class="active">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>&gt;</li>
				</ul>
			</div>
		</div>
	</main>


	<footer class="fnb_modal-footer">
		<div class="container">
			<ul>
				<li><a class="fohead">支付/配送</a> <a href="">货到付款</a> <a href="">在线支付</a>
					<a href="">配送时间</a></li>
				<li><a class="fohead">售后服务</a> <a href="">退换货规定</a> <a href="">退换及退款说明</a>
				</li>
				<li><a class="fohead">Regina与您</a> <a href="">法律声明</a> <a
					href="">隐私政策</a> <a href="">Regina介绍</a></li>
			</ul>
			<p>
				联系地址：Regina专营店 电话：0513-12345678 传真：0588-987654321<br>版权所有：浙江Regina有限公司
				浙ICP备000012345号
			</p>
		</div>
	</footer>
</body>
</html>