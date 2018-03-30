<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家评论记录</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<label>商家：</label>
	<input id="sellerNo" class="mini-combobox" name="goodsNo" style="width:150px;" textField="sellerName" valueField="sellerNo" emptyText="请选择..."
	 	url="${ctx}/seller/totalList.do" showNullItem="true" nullItemText="请选择...">
	<label>评论用户：</label>
	<input class="mini-combobox" name="userID" style="width:150px;" textField="userName" valueField="userID" emptyText="请选择..."
		url="${ctx}/user/totalList.do" showNullItem="true" nullItemText="请选择...">
	<label>评论等级：</label>
	<input id="grade" name="grade" class="mini-combobox" style="width:150px; textField="text" valueField="value" emptyText="请选择..."
		url="${ctx}/system/dic/consult.do?sort=grade" showNullItem="true" nullItemText="请选择...">
	
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}//seller/comment/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="commentNo" visible="false"></div>
       	<div field="sellerNo" width="120" headerAlign="center" align="center" >商品名称</div>
       	<div field="title" width="120" headerAlign="center" align="center" >评论标题</div>
       	<div field="grade" width="100" headerAlign="center" align="center" >等级</div>
       	<div field="content" width="250" headerAlign="center" align="center" >评论内容</div>
       	<div field="userName" width="100" headerAlign="center" align="center" >评论用户</div>
       	<div field="createTime" width="120" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" align="center" >评论时间</div>
       	</div>
	</div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	datagrid.load();
	
	// 日期时间long转为date
	datagrid.on("preload", function(e) {
		var data = e.data;
		$.each(data, function(n,o) {
			o.createTime = new Date(o.createTime);
		});
	});
	
	//根据combobox的值获取text
	function getText(value,data){
		for(i in data){
			if(data[i].value==value){
				return data[i].text;
			}
		}
		return "";
	}
	
	function getName(value,data){
		for(i in data){
			if(data[i].sellerNo==value){
				return data[i].sellerName;
			}
		}
		return "";
	}
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "sellerNo") {
			e.cellHtml = getName(value,mini.get(field).data);
		}
		if (field == "grade") {
			e.cellHtml = getText(value,mini.get(field).data);
		}
	});
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
</script>
</html>