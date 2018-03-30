<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家基本信息</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<label>商家名称：</label>
	<input class="mini-combobox" id="sellerNo" name="sellerNo" style="width:180px;" textField="sellerName" valueField="sellerNo" emptyText="请选择..."
	 	url="${ctx}/seller/totalList.do" showNullItem="true" nullItemText="请选择..." allowinput="true">
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/seller/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="sellerNo" visible="false"></div>
       	<div field="sellerName" width="150" headerAlign="center" align="center" >商家名称</div>
       	<div field="area" width="120" headerAlign="center" align="center">所属区域</div>
       	<div field="sort" width="120" headerAlign="center" align="center">商家分类</div>
       	<div field="grade" width="120" headerAlign="center" align="center">商家等级</div>
       	<div field="status" width="120" headerAlign="center" align="center">商家状态</div>
       	<div field="strSeller" width="120" headerAlign="center" align="center">实力商家</div>
        <div field="op" width="120" headerAlign="center" align="center" >操作</div>	
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:800px;height:390px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="editForm" style="padding:10px">
	 	<input class="mini-hidden" name="sellerNo" />
	 	<table align="center">
	 		<tr><td>商家名称:</td>
	 			<td colspan="3"><input name="sellerName" class="mini-textbox" style="width:391px;" required="true"/></td>
	 			<td>所属区域:</td>
	 			<td><input name="area" class="mini-combobox" style="width:150px; textField="text" valueField="text" 
	 					url="${ctx}/system/dic/consult.do?sort=region" required="true" /></td>
	 		</tr>
	 		<tr><td>商家分类:</td>
	 			<td><input id="sort" name="sort" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=sellerType" required="true" /></td>
	 			<td>商家等级:</td>
	 			<td><input id="grade" name="grade" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{text:'一级',value:'1'},{text:'二级',value:'2'},{text:'三级',value:'3'}]" required="true" /></td>
	 			<td>商家状态:</td>
	 			<td><input id="status" name="status" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{text:'正常',value:'0'},{text:'不正常',value:'1'}]" required="true" /></td>
	 		</tr>
	 		<tr><td>实力商家:</td>
	 			<td><input id="strSeller" name="strSeller" class="mini-combobox" style="width:150px; textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" /></td>
	 			<td>主页地址:</td>
	 			<td colspan="3"><input name="mainPageUrl" class="mini-textbox" style="width:391px;" /></td>
	 		</tr>
	 		<tr><td>法人代表:</td>
	 			<td><input name="representative" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>商家地址:</td>
	 			<td colspan="3"><input name="address" class="mini-textbox" style="width:391px;" required="true"/></td>
	 		</tr>
	 		<tr><td>联系电话:</td>
	 			<td><input name="tel" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>身份证号:</td>
	 			<td><input name="idCard" class="mini-textbox" style="width:150px;" required="true" /></td>
	 			<td>电子邮件:</td>
	 			<td><input name="email" class="mini-textbox" style="width:150px;" required="true" /></td>
	 		</tr>
	 		<tr><td>QQ账号一:</td>
	 			<td><input name="qq1" class="mini-textbox" style="width:150px;" /></td>
	 			<td>QQ账号二:</td>
	 			<td><input name="qq2" class="mini-textbox" style="width:150px;" /></td>
	 			<td>QQ账号三:</td>
	 			<td><input name="qq3" class="mini-textbox" style="width:150px;" /></td>
	 		</tr>
	 		<tr><td>关注量:</td>
	 			<td><input name="attionCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>好评量:</td>
	 			<td><input name="goodCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>差评量:</td>
	 			<td><input name="badCount" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>备注:</td>
	 			<td colspan="5"><input name="content" class="mini-textarea" style="width:632px;height:60px;" /></td>
	 		</tr>
	 	</table>
	 </div>
	 <div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
	 	 <a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="save()">保存</a>
		 <a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
	</div>
</div>

</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	datagrid.load();
	
	//根据combobox的值获取text
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
		if (field == "sellerName") {
			e.cellHtml = '<a href="javascript:view()";" style="text-decoration:none;">'+value+'</a>';
		}
		if (field == "sort" || field == "grade" || field == "status"|| field == "strSeller") {
			e.cellHtml = getText(value,mini.get(field).data);
		}
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-danger btn-sm" iconCls="icon-search" onclick="remove(\''+record.sellerNo+'\')">删除</a>';
		}
		
	});
	
	var win = mini.get("win1");
	var form = new mini.Form("editForm");
	// 查看商家详细信息
	function view() {
		var row = datagrid.getSelected();
		form.setData(mini.decode(row));
		win.setTitle("商家详细信息");
		win.showAtPos('center', 'middle');
	}
	
	function query() {
		var queryForm = new mini.Form("#queryForm");
        var data = queryForm.getData(true, false);     
        datagrid.load(data, null, showLoadErrorMessageBox);
	}
	
	function cancel() {
		win.hide();
	}
	
	
	function save() {
		if (form.validate()){
			var data = form.getData(true,false);
			$.ajax({
				url: "${ctx}/seller/saveBase.do",
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
	
	// 商品信息删除
	function remove(id) {
		mini.confirm("确认删除该商家信息？", "删除商家信息",function(e){
			if(e=="ok"){
				$.ajax({
        		    url: "${ctx}/seller/delete.do",
        		    type: "post",
        		    data:{ id: id },
        		    success: function (text) {
        		    	if(text>0){
        		    		 mini.alert("已删除商家信息", "提示", null);
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