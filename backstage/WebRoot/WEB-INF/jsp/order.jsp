<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>订单页面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/cartStyle.css" />
</head>
<body>

<div class="content">
    <div class="logo">
        <img src="/images/logo.png"><span onclick="close_plan();">返回</span>
    </div>
    <div class="cartList" id="cartList">
        <ul>
            <li>订单编号</li>
            <li>用户姓名</li>
            <li>订单时间</li>
            <li>总价格</li>
            <li>支付状态</li>
            <li>操作</li>
        </ul>
        	<c:forEach var="s" items="${order }">
        <ul>
        	
           	 	<li>${s.orderId}</li>
            	<li>${s.userName}</li>
            	<li>${s.orderTime }</li>
            	<li>￥${s.totalPrice}</li>
            	<li>${s.pay}</li>
             	<li><a href="${pageContext.request.contextPath }/menu/orderdetails?orderId=${s.orderId}">详情</a></li>
        </ul>
       </c:forEach>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/libs/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
/* 返回事件 */
function close_plan(){
	history.go(-1);
}
</script>
</html>