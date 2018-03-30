<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据字典</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="mini-splitter" style="width: 100%; height: 100%;">
	<div size="240" showCollapseButton="true">
		<div class="mini-fit">		
			<ul id="pageTree" class="mini-tree" url="${ctx}/system/dic/list.do" style="width: 100%;" showTreeIcon="true" 
				allowDrag="true" allowDrop="true" textField="name" idField="id" parentField="pid" resultAsTree="false">
			</ul>
		</div>
	</div>
	
	<div showCollapseButton="true">
		<div class="mini-toolbar"
			style="padding: 2px; border-top: 0; border-left: 0; border-right: 0;">
			<a class="btn btn-info btn-sm" iconCls="icon-add" plain="true" href="javascript:addMenu()">新增</a> 
			<a class="btn btn-danger btn-sm" iconCls="icon-remove" plain="true" href="javascript:removeMenu()">删除</a> 
			<a class="btn btn-primary btn-sm" iconCls="icon-save" plain="true" href="javascript:saveMenu()">保存</a>
		</div>
		
		<div id="form1">
		<input id="parentID" name="parentID" class="mini-hidden" />
			<fieldset style="width: 98%;">
				<legend>
					<span>字典信息</span>
				</legend>
				<div class="fieldset-body">
					<table class="nteport-base-table2" style="width: 100%;">
						<tr>
							<td style="width: 10%; text-align: right;">编号：</td>
							<td style="width: 25%"><input id="dicID" name="dicID" class="mini-textbox" style="width: 90%" enabled="false" /></td>
							<td style="width: 10%; text-align: right;">文本：</td>
							<td style="width: 25%"><input id="text" required="true" name="text" class="mini-textbox" style="width: 90%"  vtype="maxLength:150"/></td>
						</tr>
						<tr>
							<td style="text-align: right;">分类：</td>
							<td><input required="true"id="sort" name="sort" class="mini-textbox" style="width: 90%" vtype="maxLength:150"/></td>
							<td style="text-align: right;">代码：</td>
							<td><input id="code" name="code" class="mini-textbox" style="width: 90%" vtype="maxLength:150"/></td>
						</tr>
						<tr>
							<td style="text-align: right;">键名：</td>
							<td><input id="key" name="key" class="mini-textbox" style="width: 90%"  vtype="maxLength:150"/></td>
							<td style="text-align: right;">名称：</td>
							<td><input id="name" name="name" class="mini-textbox" style="width: 90%" vtype="maxLength:150"/></td>
						</tr>
						<tr>
							<td style="text-align: right;">键值：</td>
							<td><input id="value" name="value" class="mini-textbox" style="width: 90%"  vtype="maxLength:150"/></td>
							<td style="text-align: right;">状态：</td>
							<td><input required="true" id="status" name="status" class="mini-combobox" textField="text" valueField="id" data="stateTypes" style="width:90%"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</div>
	</div>
	
</div>
</body>
<script type="text/javascript">
	var stateTypes = [{ id: '1', text: '启用'}, { id: '0', text: '禁用'}];
	mini.parse();
	
	var tree = mini.get("pageTree");
	var pageForm = new mini.Form("#form1");

	
    // 加载浅蓝色背景和去除滚动条
    $('.mini-splitter').addClass('bg');
    //$('.fieldset-body-body').addClass('bg');
    
	var editNode = null; // 当前编辑的节点
	/*********************************************************
	 * 左侧目录树的鼠标点击事件
	 *********************************************************/

	tree.on("nodeclick", function(e) {
		editNode = e.node;
		tree.loadNode(editNode);
		if (editNode.object) {
			pageForm.setData(editNode.object);
		}
	});  
	
	tree.on("beforeexpand",function(e){
		editNode = e.node;
		tree.loadNode(editNode);
		if (editNode.object) {
			pageForm.setData(editNode.object);
		}
	})

	/*********************************************************
	 * 字典操作方法
	 *********************************************************/
	/**
	 * 新增字典
	 */
	function addMenu() {
		var node = tree.getSelectedNode();
		if (node) {
			var newRow = {
				"parentID" : node.id
			};
			pageForm.setData(newRow);
		} else {
			showWarnMessageBox("请先选择字典创建的位置！");
		}
	}
	/**
	 * 保存字典
	 */
	function saveMenu() {
		pageForm.validate();
        if(pageForm.isValid()==false){
            return;
        }
		var data = pageForm.getData();
		var menuDataString = mini.encode(data);
		//alert(menuDataString);
		$.ajax({
			url : "${ctx}/system/dic/save.do",
			data : {
				json : menuDataString
			},
			type : "post",
			success : function(json) {
				// 如果是修改保存，刷新父节点
				if (data.dicID) {
					var parent = tree.getParentNode(editNode);
					tree.loadNode(parent);
				}
				// 如果是新增，刷新本节点的所有子节点
				else {
					tree.loadNode(editNode);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				showErr(jqXHR.responseText);
			}
		});
	}

	/**
	 * 删除字典
	 */
	function removeMenu() {
		var node = editNode;
		if (node) {
			mini.confirm("确定删除" + editNode.text + "字典吗？", "确定？", function(
					action) {
				if (action == "ok") {
					$.ajax({
						url : "${ctx}/system/dic/delete.do",
						data : {
							id : node.id
						},
						type : "post",
						success : function(text) {
							if (text == 1) {
								tree.removeNode(node);
// 								pageForm.setData([]);
								pageForm.clear();

							} else {
								showErr("删除失败！");
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							showErr(jqXHR.responseText);
						}
					});
				}
			});
		} else {
			showWarn("请先选择要删除的字典！");
		}
	}
</script>
</html>