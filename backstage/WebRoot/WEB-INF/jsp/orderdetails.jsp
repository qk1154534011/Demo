<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>订单详情</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/cartStyle.css" />
</head>
<body>

<div class="content">
    <div class="logo">
        <img src="/images/logo.png"><span onclick="close_plan();">返回</span>
    </div>
    <div class="cartList" id="cartList">
        <ul>
            <li></li>
            <li>菜品名</li>
            <li>菜品数量</li>
            <li>菜品价格</li>
            <li></li>
            <li></li>
        </ul>
        	<c:forEach var="s" items="${OrderDetails }">
        <ul>
        	
           	 	<li></li>
            	<li>${s.menuName}</li>
            	<li>${s.menuNum }</li>
            	<li>￥${s.menuPrice}</li>
            	<li></li>
             	
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