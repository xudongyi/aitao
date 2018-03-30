<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
	<div class="top-search" id="queryForm">
		<a class="btn btn-info btn-sm" iconCls="icon-search" onclick="add()">新增</a>
	</div>
	<div class="mini-fit"> 
		<div id="datagrid1" class="mini-treegrid" style="width:100%;height:100%" url="${ctx}/goods/sort/list.do" treeColumn="sortName" idField="sortNo"  
			showTreeIcon="false"  parentField="parentNO" resultAsTree="false"   expandOnLoad="true" allowResize="true">
			    <div property="columns">
					<div name="sortName" field="sortName" width="150" headerAlign="center" align="left">商品分类名称</div>
					<div field="sortCode" width="100" headerAlign="center" align="center">分类代码</div>
					<div field="tbCode" width="100" headerAlign="center" align="center">淘宝代码</div>
					<div field="JdCode" width="100" headerAlign="center" align="center">京东代码</div>
					<div field="sortOrder" width="50" headerAlign="center" align="center">排序</div>
					<div field="onUse" width="50" headerAlign="center" align="center">是否启用</div>
					<div field="op" width="120" headerAlign="center" align="center">操作</div>
				</div>
		</div>
	</div>
	
	<div id="win1" class="mini-window" title="" style="width:650px;height:500px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
		 <div id="editForm" style="padding:10px;">
		 	<input name="sortNo" class="mini-hidden"/>
		 	<table align="center">
		 		<tr><td>商品分类名称:</td>
		 			<td><input name="sortName" class="mini-textbox" style="width:150px;" required="true"/></td>
		 			<td>分类代码:</td>
		 			<td><input name="sortCode" class="mini-textbox" style="width:150px;" required="true"/></td>
		 		<tr><td>淘宝代码:</td>
		 			<td><input name="tbCode" class="mini-textbox" style="width:150px;"/></td>
		 			<td>京东代码:</td>
		 			<td><input name="JdCode" class="mini-textbox" style="width:150px;"/></td>
		 		</tr>
		 		<tr><td>父节点</td>
		 			<td><input id="parentNo" name="parentNO" class="mini-combobox" style="width:150px;" textField="sortName" valueField="sortNo" 
	 					url="${ctx}/goods/sort/totalList.do" /></td>
	 				<td>首页显示:</td>
		 			<td><input name="showIndex" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" required="true" /></td>
		 		</tr>
		 		<tr><td>排序:</td>
		 			<td><input name="sortOrder" class="mini-textbox" style="width:150px;" required="true"/></td>
		 			<td>是否启用:</td>
		 			<td><input name="onUse" class="mini-combobox" style="width:150px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" required="true" /></td>
		 		</tr>
	 		</table>
		 </div>
		 
		 <div class="top-search" style="width:90%">
			 <a class="btn btn-info btn-sm" iconCls="icon-search" onclick="addProperty()">新增商品分类属性</a>
		 </div>
		 
		 <div class="mini-fit">
		 	<div id="datagrid2" class="mini-datagrid" style="width:100%;height:100%"  allowCellValid="true"
			  allowSortColumn="false" allowCellEdit="true" allowCellSelect="true" showPager="false" oncellbeginedit="cellbeginedit"
        	 enterNextCell="true" url="" idField="id" allowResize="true">
				<div property="columns">
		       	<div type="indexcolumn"></div>
		       	<div field="sortPropertyNo" visible="false"></div>
		       	<div field="sortPropertyName" width="100" headerAlign="center" vtype="required" align="center" allowSort="true">分类属性名
		       		<input id="sortPropertyName" property="editor" class="mini-combobox" style="width:100%;" allowInput="true" textField="sortPropertyName" 
	 					valueField="sortPropertyName" url="${ctx}/goods/sort/propertyList.do" required="true">
		       	</div>
		       	<div field="sortPropertyValue" width="100" headerAlign="center" vtype="required" align="center" allowSort="true">分类属性值
		       		<input property="editor" class="mini-textbox" style="width:100%;" />
		       	</div>
		       	<div field="sortOrder" width="60" headerAlign="center" align="center" allowSort="true">排序
		       		<input property="editor" class="mini-textbox" style="width:100%;" />
		       	</div>
		       	<div field="img" width="60" headerAlign="center" align="center" allowSort="true">图片</div>
		       	<div field="op" width="120" headerAlign="center" align="center" allowSort="true">操作</div>
		       </div>
			</div>
		</div>
		
		<div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
	 	 	<a class="btn btn-primary btn-sm" iconCls="icon-cancel" onClick="save()">保存</a>
		 	<a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
		</div>
	 </div>
	 
	 <div id="win2" class="mini-window" title="" style="width:160px;height:195px;">
		 	<img id="pic" style="width:150px;height:150px;margin-left:4px;" />
	</div>
</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid1");
	var datagrid2 = mini.get("datagrid2");
	var parentNo = mini.get("parentNo");
	datagrid.load();
	
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-primary btn-sm" href="javascript:edit()"; style="text-decoration:none;">编辑</a>'
			+'&nbsp;<a class="btn btn-danger btn-sm" href="javascript:remove(\''+record.sortNo+'\')";" style="text-decoration:none;">删除</a>';
		}
	});
	
	datagrid2.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "img" && value != null) {
			e.cellHtml = '<a href="javascript:getImg(\''+value+'\')";" style="text-decoration:none;">'+value+'</a>';
		}
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-primary btn-sm" href="javascript:upload()"; style="text-decoration:none;">图片上传</a>'
			+'&nbsp;<a class="btn btn-danger btn-sm" href="javascript:removeProperty()";" style="text-decoration:none;">删除</a>';
		}
	});
	
	var win = mini.get("win1");
	var form = new mini.Form("editForm");
	function add() {
		form.reset();
		parentNo.setReadOnly(false);
		datagrid2.clearRows();
		win.setTitle("新增商品分类");
		win.showAtPos('center', 'middle');
	}
	
	
	function edit() {
		form.reset();
		parentNo.setReadOnly(true);
		var row = datagrid.getSelected();
		datagrid2.setUrl("${ctx}/goods/sort/propertyListAll.do?sortNo="+row.sortNo);
		datagrid2.load();
		form.setData(row);
		win.setTitle("修改商品分类");
		win.showAtPos('center', 'middle');
	}
	
	function save() {
		if (form.validate()){
			datagrid2.validate();
			if (datagrid2.isValid()) {
				mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: '保存中...'
	        	}); //在form校验成功后、ajax执行之前加载遮罩层
				var data = form.getData(true,false);
	        	var json = mini.encode(data);
		        var rows = datagrid2.getChanges();
		        var propertyJson = mini.encode(rows);
		        $.ajax({
					url: "${ctx}/goods/sort/save.do",
					type: "post",
					data: { json : json,
							propertyJson : propertyJson
					},
					success: function (text) {
						mini.unmask(); //ajax执行成功后，取消遮罩层 
        		    	var res = parseInt(text);
        		    	if (isNaN(res)) {
        		    		mini.alert("重复分类属性："+decodeURI(decodeURI(text)));
        		    	} else {
        		    		if (res >0 ) {
    							win.hide ();
    							datagrid.reload();
    							mini.get("parentNo").load("${ctx}/goods/sort/totalList.do");
    							mini.alert("保存成功", "提示", null);
    						}else {
    		 		    		 mini.alert("保存失败", "提示", null);
    		  		    	}
        		    	}
						
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						mini.unmask(); //ajax执行失败后，取消遮罩层
					}
				});
	        	
			} else {
				var error = datagrid2.getCellErrors()[0];
				datagrid2.beginEditCell(error.record,error.column);
			}
		} else {
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
	
	function remove(id) {
		mini.confirm("确认删除该商品分类？", "删除商品分类",function(e){
			if(e=="ok"){
				$.ajax({
        		    url: "${ctx}/goods/sort/delete.do",
        		    type: "post",
        		    data:{ id: id },
        		    success: function (text) {
        		    	if(text>0){
        		    		 mini.alert("已删除商品分类", "提示", null);
        		    		 mini.get("parentNo").load("${ctx}/goods/sort/totalList.do");
        		    		 datagrid.reload();
        		    	}else{
        		    		 mini.alert("操作失败", "提示", null);
        		    	}}
        		});
			}
		});
	}
	
	function addProperty() {
		var newRow = { name: "New Row" };
		datagrid2.addRow(newRow, 0);
	}
	
	// 删除商品价格
	function removeProperty() {
		var row = datagrid2.getSelected();
		datagrid2.removeRow (row);
	}
	
	function cellbeginedit(e) {
		if (e.field == "sortPropertyName") {
			e.url = mini.get(e.field).load("${ctx}/goods/sort/propertyList.do");
		}
	}
	
	// 上传图片
	top["win"]=window;
	function upload() {
		var row = datagrid2.getSelected();
		mini.open({
            url: "${ctx}/page/good/uploadImg.jsp?filename=propertyImg",
            title: "上传图片", width: 400, height: 200,
        });
	}
	
	// 图片查看
	var win2 = mini.get("win2");
	function getImg(path){
		win2.setTitle("分类属性图片");
		win2.showAtPos('center', 'middle');
        $.ajax({
            url: "${ctx}/goods/file/getImg.do",
            type: "post",
            data: { url : path },
            success: function (text) {
                $("#pic").attr("src", "data:image/png;base64," +text);
            }
        });
    }
</script>
</html>