<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类属性</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<a class="btn btn-info btn-sm" iconCls="icon-search" onclick="add()">新增</a>
</div>
<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/goods/sort/propertyListPage.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="sortPropertyNo" visible="false"></div>
       	<div name="sortNo" field="sortNo" width="120" headerAlign="center" align="center" >商品分类</div>
       	<div name="sortPropertyName" field="sortPropertyName" width="100" headerAlign="center" align="center" >分类属性名</div>
       	<div field="sortPropertyValue" width="120" headerAlign="center" align="center">分类属性值</div>
       	<div field="sortOrder" width="100" headerAlign="center" align="center">排序</div>
        <div field="op" width="150" headerAlign="center" align="center" >操作</div>	
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:360px;height:400px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="editForm" style="padding:10px;">
	 	<input class="mini-hidden" name="sortPropertyNo" />
	 	<input id="img" class="mini-hidden" name="img" />
	 	<table align="center">
	 		<tr><td>商品分类</td>
	 			<td><input id="sortNo" name="sortNo" class="mini-combobox" style="width:180px;" textField="sortName" valueField="sortNo" 
	 					url="${ctx}/goods/sort/totalList.do" required="true"></td>
	 		</tr>
	 		<tr><td>分类属性名</td>
	 			<td><input id="sortPropertyName" name="sortPropertyName" class="mini-combobox" style="width:180px;" allowInput="true" textField="sortPropertyName" valueField="sortPropertyName" 
	 					url="${ctx}/goods/sort/propertyList.do" required="true"></td>
	 		</tr>
	 		<tr><td>分类属性值</td>
	 			<td><input name="sortPropertyValue" class="mini-textbox" style="width:180px;" required="true"/></td>
	 		</tr>
	 		<tr><td>排序</td>
	 			<td><input name="sortOrder" class="mini-textbox" style="width:180px;" required="true"/></td>
	 		</tr>
	 	</table>
	 	<table align="center">
	 		<tr><td><img id="pic" style="width:250px;height:120px;border:1px solid #B0B0B0;"></td></tr>
	 		<tr><td><input id="url" name="url" style="width:158px" type="textbox" />
				<a id="pictreButton" class="mini-button asLabel" iconCls="icon-ok" onclick="upload('url')">上传图片</a></tr>
	 	</table>
	 </div>
	 <div property="footer" style="text-align:center;padding:5px;padding-right:15px;">
	 	 <a class="btn btn-primary btn-sm" iconCls="icon-cancel" onClick="save()">保存</a>
		 <a class="btn btn-danger btn-sm" iconCls="icon-cancel" onClick="cancel()">取消</a>
	 </div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var datagrid = mini.get("datagrid");
	
	// 合并行
	datagrid.on("load", function () {
        datagrid.mergeColumns(["sortNo","sortPropertyName"]);
    });
	
	datagrid.load();
	
	
	//根据combobox的值获取text
	function getTextByNo(value,data){
		for(i in data){
			if(data[i].sortNo==value){
				return data[i].sortName;
			}
		}
		return "";
	}
	
	datagrid.on("drawcell", function(e) {
		var record = e.record, column = e.column, field = e.field, value = e.value;
		if (field == "sortNo") {
			e.cellHtml = getTextByNo(value,mini.get(field).data);
		}
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-primary btn-sm" href="javascript:edit()"; style="text-decoration:none;">编辑</a>'
				+'&nbsp;<a class="btn btn-danger btn-sm" href="javascript:remove(\''+record.sortPropertyNo+'\')";" style="text-decoration:none;">删除</a>';
		}
	});
	
	var win = mini.get("win1");
	var form = new mini.Form("editForm");
	
	// 新增商品
	function add() {
		document.getElementById("url").value = "";
		mini.get("sortNo").setReadOnly(false);
		mini.get("sortPropertyName").setReadOnly(false);
		form.reset();
		$("#pic").attr('src',"${ctx}/images/icon-white/1.png");
		win.setTitle("新增商品分类属性");
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
				url: "${ctx}/goods/sort/propertySave.do",
				type: "post",
				data: data,
				success: function (text) {
					mini.unmask(); //ajax执行成功后，取消遮罩层 
					if (text == -2) {
						mini.alert("分类属性名重复", "提示", null);
					}
					else if (text >0 ) {
						win.hide ();
						mini.alert("保存成功", "提示", null);
	 		    		datagrid.reload();
						mini.get("sortPropertyName").load("${ctx}/goods/sort/propertyList.do");
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
	
	// 修改分类属性
	function edit() {
		mini.get("sortNo").setReadOnly(true);
		mini.get("sortPropertyName").setReadOnly(true);
		var row = datagrid.getSelected();
		form.setData(row);
		document.getElementById("url").value = row.img;
		$("#pic").attr('src',"${ctx}/images/icon-white/1.png");
		if (row.img != null) {
			getImg(row.img);
		}
		win.setTitle("修改商品分类属性");
		win.showAtPos('center', 'middle');
	}
	
	// 删除分类属性
	function remove(id) {
		mini.confirm("确认删除该商品分类属性？", "删除商品分类属性",function(e){
			if(e=="ok"){
				$.ajax({
        		    url: "${ctx}/goods/sort/propertyDelete.do",
        		    type: "post",
        		    data:{ id: id },
        		    success: function (text) {
        		    	if(text>0){
        		    		 mini.alert("已删除商品分类属性", "提示", null);
        		    		 mini.get("sortPropertyName").load("${ctx}/goods/sort/propertyList.do");
        		    		 datagrid.reload();
        		    	}else{
        		    		 mini.alert("操作失败", "提示", null);
        		    	}}
        		});
			}
		});
	}
	
	
	// 上传图片
    top["win"]=window;
    function upload(name) {
        var oldUrl = document.getElementById("url").value;
        mini.open({
            url: "${ctx}/page/good/uploadImg.jsp?filename="+name,
            title: "上传图片", width: 400, height: 200,
            onload: function () {
                var iframe = this.getIFrameEl();
            },
            ondestroy: function (action) {
                var iframe = this.getIFrameEl();
                //获取选中、编辑的结果
                var url = document.getElementById("url").value;
                if (url != "" && oldUrl != url) {
                	mini.get("img").setValue(url);
                	getImg(url);
                }
            }
        });
    }
    
    function getImg(url){
        $.ajax({
            url: "${ctx}/goods/file/getImg.do",
            type: "post",
            data: { url : url },
            success: function (text) {
                $("#pic").attr("src", "data:image/png;base64," +text);
            }
        });
    }
</script>
</html>