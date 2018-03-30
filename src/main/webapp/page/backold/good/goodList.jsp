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
	<label>商品名称：</label>
	<input class="mini-textbox" name="goodsName" style="width:150px;">
	
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>

</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/goods/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="goodsNo" visible="false"></div>
       	<div name="sellerNo" field="sellerNo" width="150" headerAlign="center" align="center" >商家名称</div>
       	<div field="goodsName" width="150" headerAlign="center" align="center" >商品名称</div>
       	<div field="brand" width="120" headerAlign="center" align="center">品牌</div>
       	<div field="price" width="120" headerAlign="center" align="center">商品价格</div>
       	<div field="totalCount" width="120" headerAlign="center" align="center">供货总量</div>
        <div field="salseCount" width="120" headerAlign="center" align="center" >累计销量</div>
        <div field="onShelve" width="120" headerAlign="center" align="center">商品状态</div>
        <div field="op" width="120" headerAlign="center" align="center">操作</div>
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:800px;height:350px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="editForm" style="padding:10px;">
	 	<input class="mini-hidden" name="goodsNo" />
	 	<table align="center">
	 		<tr><td>商家名称:</td>
	 			<td><input name="sellerNo" class="mini-combobox" style="width:150px;" textField="sellerName" valueField="sellerNo" 
	 					url="${ctx}/seller/totalList.do" required="true" readonly /></td>
	 			<td>商品名称:</td>
	 			<td><input name="goodsName" class="mini-textbox" style="width:150px;" required="true"/></td>
	 			<td>商品分类:</td>
	 			<td><input name="sortNo" class="mini-treeselect" style="width:150px;" textField="sortName" valueField="sortNo" parentField="parentNO"
	 					url="${ctx}/goods/sort/list.do" expandOnLoad="true" required="true" allowInput="true" onvalueChanged="sortChange" /></td>
	 		</tr>
	 		<tr><td>品牌:</td>
	 			<td><input id="brand" name="brand" class="mini-combobox" style="width:150px;" textField="sortPropertyValue"  
	 					valueField="sortPropertyValue" url="" allowInput="true" required="true" /></td>
	 			<td>商品价格(元):</td>
	 			<td><input  name="price" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>市场价(元):</td>
	 			<td><input  name="marketPrice" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>商品状态:</td>
	 			<td><input id="onShelve" name="onShelve" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=onShelve" required="true" /></td>
	 			<td>爆款:</td>
	 			<td><input name="popularSales" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 			<td>热销:</td>
	 			<td><input name="hotSales" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 		</tr>
	 		<tr><td>新品:</td>
	 			<td><input name="newGoods" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 			<td>推荐:</td>
	 			<td><input name="recSales" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 			<td>精品:</td>
	 			<td><input name="fine" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 		</tr>
	 		<tr><td>商品关键词:</td>
	 			<td><input  name="keyWords" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>商品毛重(kg):</td>
	 			<td><input  name="grossWeight" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>商品净重(kg):</td>
	 			<td><input  name="netWeight" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr>
	 			<td>上架时间:</td>
	 			<td><input name="shelfTime" class="mini-datepicker" format="yyyy-MM-dd" required="true"
	 					 style="width:150px;"  /></td>
	 			<td>供货总量:</td>
	 			<td><input  name="totalCount" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>累计销量:</td>
	 			<td><input  name="salseCount" class="mini-textbox" style="width:150px;" /></td>
	 		</tr>
	 		<tr><td>虚拟销量:</td>
	 			<td><input  name="virtualSales" class="mini-textbox" style="width:150px;" /></td>
	 			<td>排序:</td>
	 			<td><input name="goodOrder" class="mini-textbox" style="width:150px;" /></td>
	 			<td>商城分类:</td>
	 			<td><input name="shopSort" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=shopSort" /></td>
	 		</tr>
	 		
	 	</table>
	 </div>
	 <div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
	 	 <a class="btn btn-primary btn-sm" iconCls="icon-cancel" onClick="save()">保存</a>
		 <a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
	</div>

</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	var brand = mini.get("brand"); 
	var sortPropertyName = "品牌";
	
	datagrid.load();

	// 合并行
	datagrid.on("load", function () {
        datagrid.mergeColumns(["sellerNo"]);
    });
	
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
			e.cellHtml = '<a class="btn btn-danger btn-sm" href="javascript:remove(\''+record.goodsNo+'\')";" style="text-decoration:none;">删除</a>';
			
		}
	});
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
	var win = mini.get("win1");
	var form = new mini.Form("editForm");
	
	// 编辑商品
	function edit() {
		var row = datagrid.getSelected();
		row.shelfTime = new Date(row.shelfTime);
		form.setData(row);
		// 品牌下拉列表数据
		brand.setUrl("${ctx}/goods/sort/propertyListBySort.do?sortNo="+row.sortNo+"&sortPropertyName="+encodeURI(encodeURI(sortPropertyName)));
		win.setTitle("修改商品信息");
		win.showAtPos('center', 'middle');
	}
	
	// 商品分类改变时
	function sortChange(e) {
		var sortNo = e.value;
		// 商品分类及父类所有品牌的分类属性
		brand.setUrl("${ctx}/goods/sort/propertyListBySort.do?sortNo="+sortNo+"&sortPropertyName="+encodeURI(encodeURI(sortPropertyName)));
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
        		    url: "${ctx}/goods/deleteAll.do",
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

</script>
</html>