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
	<label>用户名称：</label>
	<input id="userID" class="mini-combobox" name="userID" style="width:150px;" textField="userName" valueField="userID" emptyText="请选择..."
		url="${ctx}/user/totalList.do" showNullItem="true" nullItemText="请选择...">
	<label>商家名称：</label>
	<input id="sellerNo" class="mini-combobox" name="sellerNo" style="width:150px;" textField="sellerName" valueField="sellerNo" emptyText="请选择..."
	 	url="${ctx}/seller/totalList.do" showNullItem="true" nullItemText="请选择...">
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/seller/attention/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="commentNo" visible="false"></div>
       	<div field="userName" width="100" headerAlign="center" align="center" >用户名称</div>
       	<div field="sellerNo" width="120" headerAlign="center" align="center" >关注商家</div>
       	<div field="grade" width="120" headerAlign="center" align="center" >关注等级</div>     	
       	<div field="createTime" width="120" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" align="center" >关注时间</div>
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:500px;height:400px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="viewForm" style="padding:10px;">
	 	<table align="center">
	 		<tr><td>商家名称:</td>
	 			<td colspan="3"><input name="sellerName" class="mini-textbox" style="width:373px;" readOnly /></td>
	 		<tr><td>所属区域:</td>
	 			<td><input name="area" class="mini-combobox" style="width:150px; textField="text" valueField="text" 
	 					url="${ctx}/system/dic/consult.do?sort=region" readOnly /></td>
	 			<td>商家分类:</td>
	 			<td><input id="sort" name="sort" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=sellerType" readOnly /></td>
	 		</tr>
	 		<tr><td>商家等级:</td>
	 			<td><input id="grade" name="grade" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{text:'一级',value:'1'},{text:'二级',value:'2'},{text:'三级',value:'3'}]" readOnly /></td>
	 			<td>商家状态:</td>
	 			<td><input id="status" name="status" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{text:'正常',value:'0'},{text:'不正常',value:'1'}]" readOnly /></td>
	 		</tr>
	 		<tr><td>审核状态:</td>
	 			<td><input id="checked" name="checked" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{text:'未审核',value:'0'},{text:'审核通过',value:'1'},{text:'审核不通过',value:'2'}]" readOnly /></td>
	 			<td>法人代表:</td>
	 			<td><input name="representative" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>商家地址:</td>
	 			<td colspan="3"><input name="address" class="mini-textbox" style="width:373px;" readOnly /></td>
	 		</tr>
	 		<tr><td>联系电话:</td>
	 			<td><input name="tel" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>身份证号:</td>
	 			<td><input name="idCard" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>电子邮件:</td>
	 			<td><input name="email" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>商家关注量:</td>
	 			<td><input name="attionCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>商家好评量:</td>
	 			<td><input name="goodCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>商家差评量:</td>
	 			<td><input name="badCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>备注:</td>
	 			<td colspan="3"><input name="content" class="mini-textarea" style="width:373px;height:60px;" readOnly /></td>
	 		</tr>
	 	</table>
	 </div>
	 <div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
		 <a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
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
	
	function getName(value,data){
		for(i in data){
			if(data[i].sellerNo==value){
				return data[i].sellerName;
			}
		}
		return "";
	}
	
	var gradeData = [{'value':'1','text':'一级'},{'value':'2','text':'二级'}];
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "sellerNo") {
			e.cellHtml = '<a href="javascript:view(\''+value+'\')";" style="text-decoration:none;">'+getName(value,mini.get(field).data)+'</a>';
		}
		if (field == "grade") {
			e.cellHtml = getText(value,gradeData);
		}
	});
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
	var win = mini.get("win1");
	var form = new mini.Form("viewForm");
	// 查看商家详细信息
	function view(sellerNo) {
		$.ajax({
			url: "${ctx}/seller/load.do",
			type: "post",
			data: {id:sellerNo},
			success: function (data) {
				if (data != null ) {
					form.setData(data);
					win.setTitle("查看商家详细信息");
					win.showAtPos('center', 'middle');
				}
			}
		});
	}
	
	function cancel() {
		win.hide();
	}
	
</script>
</html>