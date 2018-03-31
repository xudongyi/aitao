<%--
  Created by IntelliJ IDEA.
  User: xudy
  Date: 2018/3/30 0030
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商家首页</title>
    <script src="${ctx}/js/boot_front.js"></script>
    <link rel="stylesheet" href="${ctx}/css/front/shop-index.css"/>
    <script src="${ctx}/js/front/shop-index.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div  ms-controller="box">
		<div class="topImg" style="width:100%;height:163px;overflow:hidden;">
				 <img ms-attr="{src: @baseUrl+'/imglibs/'+@sellerInfo[0].topImg}" alt="">
			</div>
			<div class="menu menu_color" style="height:40px;width:100%;">
				<div class="dropdown"  ms-for="el in @menuInfo">
					{{el}}
				</div>
			</div>
		
		
		
			
		</div>
	<xmp :widget="[{is:'ms-bt-nav'},{level:2}]">
	</xmp>
	<xmp :widget="[{is:'ms-copyright'},{level:2}]">
	</xmp>
</body>
</html>
