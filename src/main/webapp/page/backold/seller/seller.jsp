<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家基本信息</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<a id="editButton" class="btn btn-primary btn-sm" iconCls="icon-search" onclick="edit()">编辑</a>
	<a id="saveButton" class="btn btn-primary btn-sm" iconCls="icon-search" onclick="save()">保存</a>
	<a id="cancelButton" class="btn btn-danger btn-sm" iconCls="icon-search" onclick="cancel()">取消</a>
</div>
<div class="mini-fit">
	<div id="form" style="width:100%;height:95%;padding-top:20px;">
		<input class="mini-hidden" name="sellerNo" />
	 	<table align="center" style="width:90%;">
	 		<tr><td>商家名称:</td>
	 			<td><input name="sellerName" class="mini-textbox" style="width:180px;" required="true"/></td>
	 			<td>所属区域:</td>
	 			<td><input name="area" class="mini-combobox" style="width:180px; textField="text" valueField="text" 
	 					url="${ctx}/system/dic/consult.do?sort=region" required="true" /></td>
	 			<td>商家分类:</td>
	 			<td><input id="sort" name="sort" class="mini-combobox" style="width:180px; textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=sellerType" required="true" /></td>
	 		</tr>
	 		<tr><td>商家等级:</td>
	 			<td><input id="grade" name="grade" class="mini-combobox" style="width:180px; textField="text" valueField="value" 
	 					data="[{text:'一级',value:'1'},{text:'二级',value:'2'},{text:'三级',value:'3'}]" readonly /></td>
	 			<td>商家状态:</td>
	 			<td><input id="status" name="status" class="mini-combobox" style="width:180px; textField="text" valueField="value" 
	 					data="[{text:'正常',value:'0'},{text:'不正常',value:'1'}]" readonly /></td>
	 			<td>实力商家:</td>
	 			<td><input name="strSeller" class="mini-combobox" style="width:180px; textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly /></td>
	 		</tr>
	 		<tr><td>法人代表:</td>
	 			<td><input name="representative" class="mini-textbox" style="width:180px;" required="true" /></td>
	 			<td>商家地址:</td>
	 			<td colspan="3"><input name="address" class="mini-textbox" style="width:535px;" required="true" /></td>
	 		</tr>
	 		<tr><td>联系电话:</td>
	 			<td><input name="tel" class="mini-textbox" style="width:180px;" required="true" /></td>
	 			<td>身份证号:</td>
	 			<td><input name="idCard" class="mini-textbox" style="width:180px;" required="true" /></td>
	 			<td>电子邮件:</td>
	 			<td><input name="email" class="mini-textbox" style="width:180px;" required="true" /></td>
	 		</tr>
	 		<tr><td>QQ账号一:</td>
	 			<td><input name="qq1" class="mini-textbox" style="width:180px;" /></td>
	 			<td>QQ账号二:</td>
	 			<td><input name="qq2" class="mini-textbox" style="width:180px;" /></td>
	 			<td>QQ账号三:</td>
	 			<td><input name="qq3" class="mini-textbox" style="width:180px;" /></td>
	 		</tr>
	 		<tr><td>商家关注量:</td>
	 			<td><input name="attionCount" class="mini-textbox" style="width:180px;" readonly /></td>
	 			<td>商家好评量:</td>
	 			<td><input name="goodCount" class="mini-textbox" style="width:180px;" readonly /></td>
	 			<td>商家差评量:</td>
	 			<td><input name="badCount" class="mini-textbox" style="width:180px;" readonly /></td>
	 		</tr>
	 		<tr><td>主页地址:</td>
	 			<td colspan="3"><input name="mainPageUrl" class="mini-textbox" style="width:463px;" required="true" /></td>
	 			<td>图片上传</td>
	 			<td><input name="sellerImg" class="mini-htmlfile" id="seller_file" style="width: 180px;" onvalidation="checkFile"  ></td>
	 		</tr>
	 		<tr><td>备注:</td>
	 			<td colspan="5"><input name="content" class="mini-textarea" style="width:818px;height:60px;" /></td>
	 		</tr>
	 	</table>
	 </div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var sellerNo = '<%=request.getParameter("sellerNo") %>';
	
	var form = new mini.Form("form");
	
	// 页面内荣只读
	function labelModel() {
		document.getElementById("editButton").style.display = "";
		document.getElementById("saveButton").style.display = "none";
		document.getElementById("cancelButton").style.display = "none"; 
		var fields = form.getFields();
		for (var i = 0, l = fields.length; i < l; i++) {
			var c = fields[i];
			if (c.setReadOnly)
				c.setReadOnly(true); //只读
			if (c.setIsValid)
				c.setIsValid(true); //去除错误提示
			if (c.addCls)
				c.addCls("asLabel"); //增加asLabel外观
		}
	}
	
	// 页面内容编辑模式
	function inputModel() {
		document.getElementById("editButton").style.display = "none";
		document.getElementById("saveButton").style.display = "";
		document.getElementById("cancelButton").style.display = "";
		var fields = form.getFields();
		for (var i = 0, l = fields.length; i < l; i++) {
			var c = fields[i];
			var name= c.name;
			if (name != "grade" && name != "status" && name != "strSeller"
				&& name != "attionCount" && name != "goodCount" && name != "badCount") {
				if (c.setReadOnly)
					c.setReadOnly(false);
			}
			if (c.removeCls)
				c.removeCls("asLabel");
		}
	}
	
	
	labelModel();
	loadInfo();
	// 获取商家信息
	function loadInfo() {
		$.ajax({
			url: "${ctx}/seller/load.do",
			type: "post",
			data: {id:sellerNo},
			success: function (text) {
				form.setData(mini.decode(text));
			}
		});
	}
	
	function edit() {
		inputModel();
	}
	
	function save() {
		if (form.validate()){
			mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: '保存中...'
	         }); //在form校验成功后、ajax执行之前加载遮罩层
	     	var data = form.getData(true);
			var json = mini.encode(data).replace(/\"/g,"'");
			var inputFile = $("#seller_file > input:file")[0];
			$.ajaxFileUpload({
				url:"${ctx}/seller/save.do",
				fileElementId:inputFile ,
				data:{data:json},
				dataType:'text',
				success: function (text) {
					mini.unmask(); //ajax执行成功后，取消遮罩层 
					if(text.indexOf("1")!=-1) {
						mini.alert("保存成功", "提示", null);
						form.reset();
						loadInfo();
						labelModel();
					}else {
	 		    		 mini.alert("保存失败", "提示", null);
	  		    	}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					mini.unmask(); //ajax执行失败后，取消遮罩层
				},
				complete: function () {
					mini.unmask(); //ajax执行成功后，取消遮罩层
	                var jq = $("#seller_file > input:file");
	                jq.before(inputFile);
	                jq.remove();
	            }
			});
		} else{
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
		form.reset();
		loadInfo();
		labelModel();
	}
	
	/**
	 * 验证文件
	 * @param e
	 */
	function checkFile(e){
		var file=$ ("#seller_file > input:file")[0];
		var limitType="*.jpg;*.jpeg;*.bmp;*.png";
		var file_type=file.value.substr(file.value.lastIndexOf(".")+1);
		if(limitType.indexOf(file_type)==-1){
			e.errorText = "不支持该文件格式"+file_type;
	        e.isValid = false;
		}
	}
</script>
</html>