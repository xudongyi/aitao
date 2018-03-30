<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关注商家记录</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<label>关注等级：</label>
	<input name="grade" class="mini-combobox" style="width:150px; textField="text" valueField="value" emptyText="请选择..."
		data="[{'value':'1','text':'一级'},{'value':'2','text':'二级'}]" showNullItem="true" nullItemText="请选择...">
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/seller/attention/list.do?sellerNo=<%= request.getParameter("sellerNo") %>"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="commentNo" visible="false"></div>
       	<div field="userName" width="100" headerAlign="center" align="center" >用户名称</div>
       	<div field="grade" width="120" headerAlign="center" align="center" >关注等级</div>     	
       	<div field="createTime" width="120" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" align="center" >关注时间</div>
       	</div>
	</div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	
	// 用户页面跳转
	// 获取用户ID
	var userId = "<%= request.getParameter("id")%>";
	if (userId != "null" && userId != "") {
		mini.get("userID").setValue(userId);
		mini.get("userID").setReadOnly(true);
		
	}
	query();
	
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
	
	
	var gradeData = [{'value':'1','text':'一级'},{'value':'2','text':'二级'}];
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "grade") {
			e.cellHtml = getText(value,gradeData);
		}
	});
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
	
</script>
</html>