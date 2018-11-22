<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>分类菜单</title>
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/style.css?v=2">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/jcarousel.css">


<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
<script
	src="${pageContext.request.contextPath }/statics/js/libs/modernizr-1.7.min.js"></script>
</head>

<body>

	<!-- LOGIN POP UPS -->
	<div id="popup-overlay"></div>
	<div class="popup" id="popup-login">
		<h2>登录</h2>
		<hr class="separator">
		<form method="post" action="" class="form clearfix">
			<fieldset>
				<label for="login-username">姓名:</label> <input type="text" name=""
					id="login-username" class="input text"> <label
					for="login-password">密码:</label> <input type="password" name=""
					id="login-password" class="input text">
			</fieldset>
		</form>
		<hr class="separator">
		<button class="button submit">Login</button>
		<div class="links">
			<a href="#">Forgotten password </a> | <a href="#"
				class="register-btn"> New account</a>
		</div>
		<a class="close" href="#"></a>
	</div>
	<div class="popup" id="popup-register">
		<h2>Registration form</h2>
		<hr class="separator">
		<form method="post" action="" class="form clearfix">
			<fieldset>
				<label for="login-username">Username:</label> <input type="text"
					name="" id="login-username" class="input text"> <label
					for="login-email">Email:</label> <input type="text" name=""
					id="login-email" class="input text error" value="Error"> <label
					for="login-password">Password:</label> <input type="password"
					name="" id="login-password" class="input text"> <label
					for="login-confirm-password">Confirm password:</label> <input
					type="password" name="" id="login-confirm-password"
					class="input text">
			</fieldset>

			<hr class="separator">

			<div class="checks">
				<div class="check-row">
					<label><input type="checkbox" class="input checkbox">I
						have read and agree to the <a href="#">Terms &amp; Conditions</a></label>
				</div>
				<div class="check-row">
					<label><input type="checkbox" class="input checkbox">I
						agree to recieve promotional mails</label>
				</div>
			</div>

			<button class="button submit">Register now</button>
		</form>
		<a class="close" href="#"></a>
	</div>
	<!-- END LOGIN POP UPS -->
	<div class='
wrapper '>
		<header>
			<div class="top-nav">
				<nav>
					<ul>
						<!-- <li style="color: white;"><a href="#" id="login-btn">登录</a></li> -->
					</ul>
				</nav>

				<!-- <form class="search-form" method="post">
					<input type="text" class="search"> <input type="submit"
						class="search-submit" value="">
				</form> -->

			</div>
			<a href="${pageContext.request.contextPath }/menu/showMenu"
				class="logo"><img
				src="${pageContext.request.contextPath }/statics/images/logo.png"
				alt="logo" /></a>
			<nav class="main-menu">
				<ul id="ceshi1">
					<c:forEach var="listMenuType" items="${listMenuType }">
						<li><a
							href="${pageContext.request.contextPath }/menu/listing?typeName=${listMenuType.typeName }">${listMenuType.typeName }</a></li>
					</c:forEach>
					<li id="lava-elm"></li>
				</ul>
			</nav>
		</header>
		<div class="content clearfix">
			<div class="breadcrumbs">
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/menu/showMenu">首页</a></li>
					<li>${typeName }</li>
				</ul>
			</div>
			<div class="left-content">

				<div class="meals-listing">
					<ul>
						<c:forEach var="byMenuType" items="${byMenuType }">
							<li class="meal-details">
								<div class="image">
									<img src="/images/${byMenuType.pic }" alt="" height="200px"
										width="200px">
								</div>
								<div class="info">
									<div class="descr-holder"
										style="font-size: 100px; line-height: 70px">
										<h3 id="names">菜名 ：${byMenuType.menuName }</h3>
										<%-- <p style="font-size: 10px; line-height: 50px" id="byId">${byMenuType.id }</p> --%>
										<div class="date_categories"
											style="font-size: 20px; line-height: 50px">类型
											：${byMenuType.menuType.typeName }</div>
									</div>
									<span class="price" id="price">${byMenuType.price}</span> 
									<a href="#" class="add-to-cart-button" onclick="tianjia('${byMenuType.id }')">加入购物车</a>

									<div class="rating-small">
										<div class="rating-small-over" style="width: 30%"></div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

			</div>
			<div class="right-content">
				<div class="call-us">
					<span class="label">订餐电话</span> <span class="pop phone">13931197175</span>
					<span class="label">工作时间</span> <span class="pop">0-24h</span>
				</div>

				<div class="cart-box">
					<div class="top">购物车</div>
					<div class="body">
						<ul>
							<li class="info"><span class="products"> 产品：<strong
									id="totalcountshow">0</strong>数量
							</span> <a href="${pageContext.request.contextPath }/menu/shopping">查看购物车</a></li>
							<li class="price"><span class="label">总计</span> <span
								class="value" id="priceCount">0</span></li>
						</ul>
						<a class="submit-button" href="check-out.html">结账</a>
						<div class="graphic"></div>
					</div>
				</div>

				<div class="separator dark box-and-meals"></div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/libs/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/libs/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/libs/jquery.jcarousel.min.js"></script>
<script type="text/javascript">
function tianjia(obj){
	var url = "/backstage/index/putCar";
    var $id = obj;
    $.ajax({
		url:url,
		type:"get",
		dataType:'json',
		data:{"id" : $id},
		success:function(data){
			if (data.success) {
				alert("添加成功");
			}
	}
	})
}
	</script>
</html>