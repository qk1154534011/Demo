/**
 * 
 */
$(function(){
	/*
	 * 轮播
	 */
	jQuery('#mycarousel').jcarousel({
		auto : 3,
		wrap : 'last',
		scroll : 1,
		animation : 'slow',
		initCallback : mycarousel_initCallback,
	});
	/*
	 * 加载今日特价
	 */
	var url = "/backstage/index/list";
	var urll= "/backstage/index/end";
	$.ajax({
		url:url,
		type:"get",
		dataType:'json',
		data:{},
		success:function(data){
			if(data.success){
				var html = '';
				var obj =data.list;
				for ( var index in obj) {
					//alert(obj[index].pic);
					html+='<li class="meal">'
						+'<div class="img-holder">'
						+'<img id="productImg" src="/images/'+obj[index].pic+'" alt="" height="200px" width="400px">'
						+'</div>'
						+'<div class="desc-holder">'
						+'<h1><a id="productName" href="#">'+obj[index].menuName+'</a></h1>'
						+'<p id="productDisc">'+obj[index].disc+'</p>'
						+'<span id="productPrice" class="price">'+obj[index].price+'</span>'
						+'<a href="#" class="add-to-cart-button" onclick="shanchu('+obj[index].id+')">加入购物车</a>'
						+'</div>'
						+'</li>'
				}
				$("#hotlist").append(html);
			}
		}
	})
	/*
	 * 加载本店特色
	 */
	$.ajax({
		url:urll,
		type:"get",
		dataType:'json',
		data:{},
		success:function(data){
			if(data.success){
				var html = '';
				var obj =data.list;
				for ( var index in obj) {
					//alert(obj[index].pic);
					html+='<li class="meal">'
						+'<div class="img-holder">'
						+'<img id="productImg" src="/images/'+obj[index].pic+'" alt="" height="200px" width="400px">'
						+'</div>'
						+'<div class="desc-holder">'
						+'<h1><a id="productName" href="#">'+obj[index].menuName+'</a></h1>'
						+'<p id="productDisc">'+obj[index].disc+'</p>'
						+'<span id="productPrice" class="price">'+obj[index].price+'</span>'
						+'<a href="#" class="add-to-cart-button" onclick="shanchu('+obj[index].id+')">加入购物车</a>'
						+'</div>'
						+'</li>'
				}
				$("#hotEnd").append(html);
			}
		}
	})
})
/*
 * 购物车添加按钮触发事件
 */
function shanchu(obj){
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

/*
 * 点击注册按钮触发事件
 */
function register(){
	/*var faly = true;*/
	var url = "/backstage/menu/register";
	var $name = $("#login-regname").val();
	/*if ($name == "") {
		alert("用户名不能为空");
		faly = false;
	}*/
	var $phone = $("#login-regphone").val();
	/*if ($phone == "") {
		alert("电话号码不能为空");
		faly = false;
	}*/
	var $pwd = $("#login-regpassword").val();
	/*if ($pwd == "") {
		alert("密码不能为空");
		faly = false;
	}*/
	var $address = $("#login-regaddress").val();
	/*if ($address == "") {
		alert("地址不能为空");
		faly = false;
	}
	return faly;*/
	$.ajax({
		url:url,
		type: "post",
		dataType :"json",
		data:{"userName":$name,"userPwd":$pwd,"userPhone":$phone,"userAddress":$address},
		success:function(result)
		{
			if(result.success){
				alert("注册成功！！！");
			}else
			{
				alert("注册失败！！！");
			}
		}
	})
}