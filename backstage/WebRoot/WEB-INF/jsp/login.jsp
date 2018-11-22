<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<title>登录界面</title>
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
							登录
						</div>
						<form action="#" method="post">
							
							<div class="form_text_ipt">
								<input name="username" type="text" id="login-username" placeholder="姓名">
							</div>
							<div class="ececk_warning"><span>手机号/邮箱不能为空</span></div>
							<div class="form_text_ipt">
								<input name="password" type="password" id="login-password" placeholder="密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_check_ipt">
								<div class="left check_left">
									
								</div>
								<div class="right check_right">
									
								</div>
							</div>
							<div class="form_btn">
								<button type="button" onclick="add()">登录</button>
							</div>
							<div class="form_reg_btn">
								<span>还没有帐号？</span><a href="${pageContext.request.contextPath }/menu/register">马上注册</a>
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
		 * 点击登录按钮触发事件
		 */
		function add(){
			
			var url = "/backstage/menu/login";
			var $name = $("#login-username").val();
			var $pwd = $("#login-password").val();
			
			if ($name == "") {
				alert("姓名不能为空");
				return false;
			}
			if ($pwd == "") {
				alert("密码不能为空");
				return false;
			}
			$.ajax({
				url:url,
				type: "post",
				dataType :"json",
				data:{"userName":$name,"userPwd":$pwd},
				success:function(data)
				{
					if(data.success){
						alert("登录成功！！！");
						window.location.href="${pageContext.request.contextPath }/menu/showMenu";
					}else
					{
						alert("用户名或密码错误！！！");
					}
				}
			})
		}
		</script>
		<div style="text-align:center;">
</div>
	</body>
</html>
