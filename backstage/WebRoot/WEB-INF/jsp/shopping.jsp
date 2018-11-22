<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>购物车</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/cartStyle.css" />
</head>
<body>

<div class="content">
    <div class="logo">
        <img src="/images/logo.png"><span onclick="close_plan();">返回</span>
    </div>
    <div class="cartList" id="cartList">
        <ul>
            <li>菜品图片</li>
            <li>菜品名称</li>
            <li>菜品价格</li>
            <li>数量</li>
            <li>总价</li>
            <li>操作</li>
        </ul>
        	<c:forEach var="s" items="${gwc }">
        <ul>
            <li><img src="/images/${s.value.menu.pic }" width="30" height="30"></li>
            <li>${s.value.menu.menuName}</li>
            <li>¥<input type="text" name="price" value=${s.value.menu.price }></li>
            <li>${s.value.num }</li>
            <li id="price0">${s.value.gPrice }</li>
            <li>
				<a href="${pageContext.request.contextPath }/menu/closeShopping?id=${s.value.menu.id}">删除</a>
			</li>
        </ul>
        </c:forEach>
        <ol>
            <li id="totalPrice">商品总计：<span id="priceCount"></span></li>
            <li><span><a href="#" onclick="shanchu()">结算</a></span></li>
        </ol>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/libs/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
/* 返回事件 */
function close_plan(){
	history.go(-1);
}
/* 获得商品总价事件 */
$(function(){
	var url = "/backstage/menu/count";
	$.ajax({
		url:url,
		type:"get",
		dataType:'json',
		data:{},
		success:function(data){
			$("#priceCount").html(data.count);
	}
	})
})
/* 获得总价格生成订单 */
function shanchu(){
	var url = "/backstage/menu/count";
	$.ajax({
		url:url,
		type:"get",
		dataType:'json',
		data:{},
		success:function(data){
			var count = data.count;
			var url = "/backstage/menu/overPrice";
			$.ajax({
				url:url,
				type:"get",
				dataType:'json',
				data:{"count" : count},
				success:function(resoult){
					if(resoult){
						if(resoult.successs){
							alert("结算成功");
							window.location.href="${pageContext.request.contextPath }/menu/showMenu";
						}
					}else{
						
						window.location.href="${pageContext.request.contextPath }/menu/login";
					}
			}
			})
	}
	})
	}

</script>
</html>