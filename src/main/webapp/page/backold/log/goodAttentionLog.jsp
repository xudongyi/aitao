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
	<label>商品名称：</label>
	<input id="goodsNo" class="mini-combobox" name="goodsNo" style="width:150px;" textField="goodsName" valueField="goodsNo" emptyText="请选择..."
	 	url="${ctx}/goods/totalList.do" showNullItem="true" nullItemText="请选择...">
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/goods/attention/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="commentNo" visible="false"></div>
       	<div field="userName" width="100" headerAlign="center" align="center" >用户名称</div>
       	<div field="goodsNo" width="120" headerAlign="center" align="center" >关注商品</div>
       	<div field="grade" width="120" headerAlign="center" align="center" >关注等级</div>     	
       	<div field="createTime" width="120" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" align="center" >关注时间</div>
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:500px;height:360px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="viewForm" style="padding:10px;">
	 	<input class="mini-hidden" name="goodsNo" />
	 	<table align="center">
	 		<tr><td>商品名称:</td>
	 			<td><input name="goodsName" class="mini-textbox" style="width:150px;" readOnly/></td>
	 			<td>商家名称:</td>
	 			<td><input name="sellerNo" class="mini-combobox" style="width:150px;" textField="sellerName" valueField="sellerNo" 
	 					url="${ctx}/seller/totalList.do" readOnly/></td>
	 		<tr><td>商品分类:</td>
	 			<td><input name="sortNo" class="mini-combobox" style="width:150px;" textField="text" valueField="text" 
	 					url="${ctx}/system/dic/consult.do?sort=sortNo" readOnly /></td>
	 			<td>品牌:</td>
	 			<td><input name="brand" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=brand" readOnly /></td>
	 		</tr>
	 		<tr><td>商品价格(元):</td>
	 			<td><input  name="price" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>市场价(元):</td>
	 			<td><input  name="marketPrice" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>商品状态:</td>
	 			<td><input id="onShelve" name="onShelve" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=onShelve" readOnly /></td>
	 			<td>商品关键词:</td>
	 			<td><input  name="keyWords" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>商品毛重(kg):</td>
	 			<td><input  name="grossWeight" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>商品净重(kg):</td>
	 			<td><input  name="netWeight" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>上架时间:</td>
	 			<td><input name="shelfTime" class="mini-datepicker" format="yyyy-MM-dd" readOnly
	 					 style="width:150px;"  /></td>
	 			<td>供货总量:</td>
	 			<td><input  name="totalCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>累计销量:</td>
	 			<td><input  name="salseCount" class="mini-textbox" style="width:150px;" value="0" readonly /></td>
	 			<td>虚拟销量:</td>
	 			<td><input  name="virtualSales" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>排序:</td>
	 			<td><input name="goodOrder" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>商城分类:</td>
	 			<td><input name="shopSort" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=shopSort" readOnly /></td>
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
			if(data[i].goodsNo==value){
				return data[i].goodsName;
			}
		}
		return "";
	}
	
	var gradeData = [{'value':'1','text':'一级'},{'value':'2','text':'二级'}];
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "goodsNo") {
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
	function view(goodsNo) {
		$.ajax({
			url: "${ctx}/goods/load.do",
			type: "post",
			data: {id:goodsNo},
			success: function (data) {
				if (data != null ) {
					data.shelfTime = new Date(data.shelfTime);
					form.setData(data);
					win.setTitle("查看商品详细信息");
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