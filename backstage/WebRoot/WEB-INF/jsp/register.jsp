<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<title>注册界面</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" />
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				
				<div class="logo"></div>
				
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							注册
						</div>
						<form action="#" method="post">
							
							<div class="form_text_ipt">
								<input name="username" type="text" id="login-regname" placeholder="姓名">
							</div>
							<div class="ececk_warning"><span>姓名不能为空</span></div>
							<div class="form_text_ipt">
								<input name="password" type="text" id="login-regphone" placeholder="手机号">
							</div>
							<div class="ececk_warning"><span>手机号不能为空</span></div>
							<div class="form_text_ipt">
								<input name="repassword" type="password" id="login-password" placeholder="密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_ipt">
								<input name="code" type="text" id="login-regaddress" placeholder="住址">
							</div>
							<div class="ececk_warning"><span>住址不能为空</span></div>
							
							<div class="form_btn">
								<button type="button" onclick="register()">注册</button>
							</div>
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="${pageContext.request.contextPath }/menu/login">马上登录</a>
							</div>
						</form>
						<div class="other_login">
							<div class="left other_left">
								
							</div>
							<div class="right other_right">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/libs/jquery.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/common.js" ></script>
		<script type="text/javascript">
		/*
		 * 点击注册按钮触发事件
		 */
		function register(){
			
			var $name = $("#login-regname").val();
			var $phone = $("#login-regphone").val();
			var $pwd = $("#login-password").val();
			var $address = $("#login-regaddress").val();
			if ($name == "") {
				alert("姓名不能为空");
				return false;
			}
			var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test($phone)) {
				alert("请输入正确的手机号码");
				return false;
			}
			if ($pwd == "") {
				alert("密码不能为空");
				return false;
			}
			if ($address == "") {
				alert("地址不能为空");
				return false;
			}
			
			var url = "/backstage/menu/do_register";
				$.ajax({
					url:url,
					type: "post",
					dataType :"json",
					data:{"userName":$name,"userPwd":$pwd,"userPhone":$phone,"userAddress":$address},
					success:function(result)
					{
						if(result.success){
							alert("注册成功，那就去登录吧！！！");
							window.location.href="${pageContext.request.contextPath }/menu/login";
						}else
						{
							alert("注册失败！！！");
						}
					}
				})
			
		}
		</script>
		<div style="text-align:center;">
</div>
	</body>
</html>
