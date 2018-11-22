<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>帅帅酒家</title>
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/style.css?v=2">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/jcarousel.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/iconfont.css">

<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
<script
	src="${pageContext.request.contextPath }/statics/js/libs/modernizr-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/libs/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/libs/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/libs/jquery.jcarousel.min.js"></script>
<style>
.hide {
	display: none;
}
.headicon{
	font-size: 32px;
    line-height: 28px;
    text-align: center;
   	display: inline-block;
    margin-top: 8px;
    width: 31px;
    height: 29px;
    border-radius: 50%;
    overflow: hidden;
    background-color: #fff;
    cursor: pointer;
}
.headBar{
position:relative;
}
.headBar:hover  .logout{display:block;}
.headBar .logout{
	position:absolute;
	top:45px;
	left:0;
	background-color:#fff;
	z-index:10000;
	border-radius: 5px;
    overflow: hidden;
}
.top-nav nav .login .logout .link{
	color: #000;
    width: 40px;
    display: block;
    padding: 5px 50px;
}
.top-nav nav .login .logout .link:hover{
	background-color:#e8e8e8;
}

</style>
</head>

<body class="home">
	<!-- <div id="popup-overlay"></div> -->
	<!-- <div class="popup" id="popup-login">
		<h2>登录</h2>
		<hr class="separator">
		<form class="form clearfix">
			<fieldset>
				<label for="login-username">姓名:</label> <input type="text"
					name="name" id="login-username" class="input text"> <label
					for="login-password">密码:</label> <input type="password"
					name="password" id="login-password" class="input text">
			</fieldset>
			<hr class="separator">
			<button class="button submit" onclick="add()">登录</button>
		</form>
		<div class="links">
			<a href="#" class="register-btn"> 注册</a>
		</div>
		<a class="close" href="#"></a>
	</div>
	<div class="popup" id="popup-register">
		<h2>注册</h2>
		<hr class="separator">
		<form method="post" action="" class="form clearfix">
			<fieldset>
				<label for="login-username">姓名:</label> <input type="text" name=""
					id="login-regname" class="input text"> <label
					for="login-email">手机号:</label> <input type="text" name=""
					id="login-regphone" class="input text error" value=""> <label
					for="login-password">密码:</label> <input type="password" name=""
					id="login-regpassword" class="input text"> <label
					for="login-confirm-password">住址:</label> <input type="text"
					name="" id="login-regaddress" class="input text">
			</fieldset>

			<hr class="separator">

			<button class="button submit" onclick="register()">注册</button>
		</form>
		<a class="close" href="#"></a>
	</div> -->
	<div class='
wrapper '>
		<header>
		<div class="top-nav">
			<form class="search-form" method="post"
				action="${pageContext.request.contextPath }/menu/listing">
				<input type="text" class="search" placeholder="请输入要查询的菜品类型"
					name="typeName"> <input type="submit" class="search-submit"
					value="">
			</form>
			<nav class="nva">
			<ul class="unlogin <c:if test='${user !=null  }'>hide</c:if>">
				<li><a href="${pageContext.request.contextPath }/menu/login" id="login-btn">登录</a></li>|
				<li><a href="${pageContext.request.contextPath }/menu/register" id="login-btn">注册</a></li>
			</ul>
			<ul class="login <c:if test='${user == null  }'>hide</c:if>">
				<li class="headBar">
					<span class="headicon iconfont icon-cc-head-o"></span>
					<span class="logout hide">
						<a class="link" href="${pageContext.request.contextPath }/menu/order?name=${user.name }" id="login-btn">订单</a>
						<a class="link" href="${pageContext.request.contextPath }/menu/shopping" id="login-btn">购物车</a>
						<a class="link" href="${pageContext.request.contextPath }/menu/ext" id="login-btn">退出</a>
					</span>
				</li>
				<li><a href="#" id="login-btn">${user.name }</a></li>
			</ul>
			</nav>
		</div>
		<a href="${pageContext.request.contextPath }/menu/showMenu"
			class="logo"><img
			src="${pageContext.request.contextPath }/statics/images/logo.png"
			alt="your logo" /></a> <nav class="main-menu">
		<ul>
			<c:forEach var="listMenuType" items="${listMenuType }">
				<li><a
					href="${pageContext.request.contextPath }/menu/listing?typeName=${listMenuType.typeName }">${listMenuType.typeName }</a></li>
			</c:forEach>
			<li id="lava-elm"></li>
		</ul>
		</nav>
		<div class="header-slider-canvas">
			<div class="parts part-1"></div>
			<div class="parts part-2"></div>
			<div class="parts part-3"></div>
		</div>

		<ul id="mycarousel" class="jcarousel-skin-header-slider">
			<li><img src="/images/youmendaxia.jpg" width="680px"
				height="464" alt="" />
				<div class="description">
					<span class='price '>$58.00</span><span class='name '>油焖大虾</span>
				</div></li>
			<li><img src="/images/yanbaoyouyu.jpg" width="680px"
				height="464" alt="" />
				<div class="description">
					<span class='price '>$39.00</span><span class='name '>芫爆鱿鱼</span>
				</div></li>
			<li><img src="/images/tangculiji.jpg" width="680px" height="464"
				alt="" />
				<div class="description">
					<span class='price '>$29.00</span><span class='name '>糖醋里脊</span>
				</div></li>
			<li><img src="/images/minglukaoluzhu.jpg" width="680px"
				height="464" alt="" />
				<div class="description">
					<span class='price '>$118.00</span><span class='name '>明炉烤卤猪</span>
				</div></li>
		</ul>
		</header>
		<div class="content clearfix">
			<div id="meals-of-the-day">
				<h3 class="title-separator">
					<span class="title">今日特价</span><span class="sep"></span>
				</h3>
				<ul id="hotlist">


				</ul>
			</div>
			<h3 class="title-separator">
				<span class="title">本店特色</span><span class="sep"></span>
			</h3>


			<div id="featured-meals">
				<ul id="hotEnd">

				</ul>
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
		</div>
	</div>

</body>



<script src="${pageContext.request.contextPath }/statics/js/hotlist.js"></script>

</html>