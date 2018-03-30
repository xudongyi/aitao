<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品基本信息</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<label>商家名称：</label>
	<input class="mini-combobox" id="sellerNo" name="sellerNo" style="width:150px;" textField="sellerName" valueField="sellerNo" emptyText="请选择..."
	 	url="${ctx}/seller/totalList.do" showNullItem="true" nullItemText="请选择..." allowinput="true">
	<label>品牌：</label>
	<input class="mini-combobox" name="brand" style="width:150px;" textField="text" valueField="value" emptyText="请选择..."
	 	url="${ctx}/system/dic/consult.do?sort=brand" showNullItem="true" nullItemText="请选择...">
	
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
	<a class="btn btn-info btn-sm" iconCls="icon-search" onclick="add()">新增</a>
	<a class="btn btn-danger btn-sm" iconCls="icon-export" onclick="importGood()">导入CSV</a>

</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/goods/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="goodsNo" visible="false"></div>
       	<div field="goodsName" width="150" headerAlign="center" align="center" >商品名称</div>
       	<div field="sellerNo" width="150" headerAlign="center" align="center" >商家名称</div>
       	<div field="brand" width="120" headerAlign="center" align="center">品牌</div>
       	<div field="price" width="120" headerAlign="center" align="center">商品价格</div>
       	<div field="totalCount" width="120" headerAlign="center" align="center">供货总量</div>
        <div field="salseCount" width="120" headerAlign="center" align="center" >累计销量</div>
        <div field="onShelve" width="120" headerAlign="center" align="center">商品状态</div>
        <div field="op" width="250" headerAlign="center" align="center" >操作</div>	
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:500px;height:360px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="editForm" style="padding:10px;">
	 	<input class="mini-hidden" name="goodsNo" />
	 	<table align="center">
	 		<tr><td>商品名称:</td>
	 			<td><input name="goodsName" class="mini-textbox" style="width:150px;" required="true"/></td>
	 			<td>商家名称:</td>
	 			<td><input name="sellerNo" class="mini-combobox" style="width:150px;" textField="sellerName" valueField="sellerNo" 
	 					url="${ctx}/seller/totalList.do" required="true"/></td>
	 		<tr><td>商品分类:</td>
	 			<td><input name="sortNo" class="mini-combobox" style="width:150px;" textField="text" valueField="text" 
	 					url="${ctx}/system/dic/consult.do?sort=sortNo" required="true" /></td>
	 			<td>品牌:</td>
	 			<td><input name="brand" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=brand" required="true" /></td>
	 		</tr>
	 		<tr><td>商品价格(元):</td>
	 			<td><input  name="price" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>市场价(元):</td>
	 			<td><input  name="marketPrice" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>商品状态:</td>
	 			<td><input id="onShelve" name="onShelve" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=onShelve" required="true" /></td>
	 			<td>商品关键词:</td>
	 			<td><input  name="keyWords" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>商品毛重(kg):</td>
	 			<td><input  name="grossWeight" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>商品净重(kg):</td>
	 			<td><input  name="netWeight" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>上架时间:</td>
	 			<td><input name="shelfTime" class="mini-datepicker" format="yyyy-MM-dd" required="true"
	 					 style="width:150px;"  /></td>
	 			<td>供货总量:</td>
	 			<td><input  name="totalCount" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>累计销量:</td>
	 			<td><input  name="salseCount" class="mini-textbox" style="width:150px;" value="0" readonly /></td>
	 			<td>虚拟销量:</td>
	 			<td><input  name="virtualSales" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>排序:</td>
	 			<td><input name="goodOrder" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>商城分类:</td>
	 			<td><input name="shopSort" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=shopSort" required="true" /></td>
	 		</tr>
	 		
	 	</table>
	 </div>
	 <div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
	 	 <a class="btn btn-primary btn-sm" iconCls="icon-cancel" onClick="save()">保存</a>
		 <a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
	</div>


	<div id="win2" class="mini-window" title="" style="width:400px;height:170px;"
		 showMaxButton="true" showCollapseButton="true" showShadow="true"
		 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
		<div  style="padding:10px;">
			文件(.csv格式)：<input class="mini-htmlfile" name="Fdata"  id="file1" style="width:300px;"/>
		</div>
		<div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
			<a class="btn btn-primary btn-sm" iconCls="icon-cancel" onClick="ajaxFileUpload()">上传</a>
		</div>

	<form id="exportForm" method="post"></form>

</div>

</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	datagrid.load();
	
	//根据combobox的值获取text
	function getTextByNo(value,data){
		for(i in data){
			if(data[i].sellerNo==value){
				return data[i].sellerName;
			}
		}
		return "";
	}
	
	function getText(value,data){
		for(i in data){
			if(data[i].value==value){
				return data[i].text;
			}
		}
		return "";
	}
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "goodsName") {
			e.cellHtml = '<a href="javascript:edit()";" style="text-decoration:none;">'+value+'</a>';
		}
		if (field == "sellerNo") {
			e.cellHtml = getTextByNo(value,mini.get(field).data);
		}
		if (field == "onShelve") {
			e.cellHtml = getText(value,mini.get(field).data);
		}
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-info btn-sm" href="javascript:exportGood(\''+record.goodsNo
							+'\')";" style="text-decoration:none;">导出</a>&nbsp;<a class="btn btn-warning btn-sm" href="javascript:imgUpload(\''+record.goodsNo
							+'\')";" style="text-decoration:none;">图片上传</a>&nbsp;<a class="btn btn-danger btn-sm" href="javascript:remove(\''+record.goodsNo
							+'\')";" style="text-decoration:none;">删除</a>';
			
		}
	});
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
	var win = mini.get("win1");
	var form = new mini.Form("editForm");
	
	// 新增商品
	function add() {
		form.reset();
		win.setTitle("新增商品信息");
		win.showAtPos('center', 'middle');
	}
	
	// 编辑商品
	function edit() {
		var row = datagrid.getSelected();
		row.shelfTime = new Date(row.shelfTime);
		form.setData(row);
		win.setTitle("修改商品信息");
		win.showAtPos('center', 'middle');
	}
	
	function save() {
		if (form.validate()){
			mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: '保存中...'
	         }); //在form校验成功后、ajax执行之前加载遮罩层
			var data = form.getData();
			$.ajax({
				url: "${ctx}/goods/save.do",
				type: "post",
				data: data,
				success: function (text) {
					mini.unmask(); //ajax执行成功后，取消遮罩层 
					if (text >0 ) {
						win.hide ();
						mini.alert("保存成功", "提示", null);
	 		    		datagrid.reload();
					}else {
	 		    		 mini.alert("保存失败", "提示", null);
	  		    	}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					mini.unmask(); //ajax执行失败后，取消遮罩层
				}
			});
		}else{
			var errors=form.getErrors();//获取所有校验错误的控件
			var firstError=errors[0];//获取第一个校验错误的控件
			if(firstError.type=="combobox"){//如果是combobox，则弹出下拉选项
				firstError.showPopup();
			}else{//其他控件，获取焦点
				firstError.focus();
			}
		}
	}
	
	function cancel() {
		win.hide();
	}
	
	// 商品信息删除
	function remove(id) {
		mini.confirm("确认删除该商品信息？", "删除商品信息",function(e){
			if(e=="ok"){
				$.ajax({
        		    url: "${ctx}/goods/delete.do",
        		    type: "post",
        		    data:{ id: id },
        		    success: function (text) {
        		    	if(text>0){
        		    		 mini.alert("已删除商品信息", "提示", null);
        		    		 datagrid.reload();
        		    	}else{
        		    		 mini.alert("操作失败", "提示", null);
        		    	}}
        		});
			}
		});
	}


	//商品导出
	function exportGood(){
		var row = datagrid.getSelected();
		var url="${ctx}/export/exportgood.do?id="+row.goodsNo;
		$('#exportForm').attr("action",url);
		$("#exportForm").submit();
	}


	//商品导入
	function importGood(){
		var win2 = mini.get("win2");
		win2.setTitle("导入CSV文件");
		win2.showAtPos('center', 'middle');
	}
	
	// 图片上传
	function imgUpload(goodsNo) {
	   mini.open({
            url: "${ctx}/page/good/goodImg.jsp",
            title: "上传商品图片", width: 710, height: 450,
            ondestroy: function (action) {
                datagrid.reload();
            }
        });
	}
	
</script>
</html>