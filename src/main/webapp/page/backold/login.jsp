<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
<link href="${ctx}/css/newlogin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
     if (window != top) {
         top.location.href = location.href;
     }
</script>
</head>
<body>
	<div class="main-login-top"></div>
	<div class="main-login_center"></div>
	<div class="main-login_bor">
		<div class="mian-login_title">&nbsp;&nbsp;登录</div>
		<div id="errorMessage" style="position: relative;
	top: 65px;color:red;font-size:13px;font-family:'微软雅黑';text-align:center;padding-top:5px" ></div>
		<input class="textInput" type="textbox" id="loginName" />
		<input class="passInput" type="password" id="password"  />
		<input class="login_btn" type="submit" onclick="login()" value="登录"/>
	</div>

</body>
<script type="text/javascript">
	function login() {
		var name = document.getElementById("loginName").value;
		var pwd = document.getElementById("password").value;
		if (name == "" || pwd == "") {
			document.getElementById("errorMessage").innerHTML="用户名和密码不能为空";
			return;
		}
		document.getElementById("errorMessage").innerHTML="";
		var data = {'loginName' : name, 'password' : pwd};
		
		// 登录
		$.ajax({
			url: "${ctx}/user/webLogin.do",
			type: "post",
			data: data,
			success: function (text) {
				if (text == -1) {
					document.getElementById("errorMessage").innerHTML="用户名或密码错误";
				} else if (text == -2) {
					document.getElementById("errorMessage").innerHTML="用户权限不足";
				} else {
					window.location.href="${ctx}/page/backold/main.jsp";
				}
			}
		});
		
	}
	function clearForm() {
		document.getElementById("loginName").value="";
		document.getElementById("password").value="";
		document.getElementById("errorMessage").innerHTML="";
	}
</script>
</html>