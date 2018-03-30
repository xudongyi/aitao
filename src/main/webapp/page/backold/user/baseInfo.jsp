<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户基础信息</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" id="queryForm">
	<label>用户名称：</label>
	<input name="userName" class="mini-textbox" style="width:150px;">
	<label>用户角色：</label>
	<input name="roler" class="mini-combobox" style="width:150px;" textField="text" valueField="value" emptyText="请选择..."
	 	url="${ctx}/system/dic/consult.do?sort=userRole" showNullItem="true" nullItemText="请选择...">
	<label>用户等级：</label>
	<input name="grade" class="mini-combobox" style="width:150px;" textField="text" valueField="value" emptyText="请选择..."
	 	data="[{text:'一级',value:'1'},{text:'二级',value:'2'}]" showNullItem="true" nullItemText="请选择...">
	<label>用户状态：</label>
	<input name="status" class="mini-combobox" style="width:150px;" textField="text" valueField="value" emptyText="请选择..."
	 	data="[{text:'无效用户',value:'0'},{text:'有效用户',value:'1'}]" showNullItem="true" nullItemText="请选择...">
	<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="query()">查询</a>
</div>

<div class="mini-fit">
	<div id="datagrid" class="mini-datagrid" style="width:100%;height:100%;" pageSize="20" 
		 url="${ctx}/user/list.do"  idField="id" allowResize="true" allowSortColumn="false">
		 <div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="userID" visible="false"></div>
       	<div field="userName" width="120" headerAlign="center" align="center" >用户名称</div>
       	<div field="loginName" width="120" headerAlign="center" align="center">登录名</div>
       	<div field="nickName" width="120" headerAlign="center" align="center">呢称</div>
       	<div field="roler" width="100" headerAlign="center" align="center">用户角色</div>
       	<div field="grade" width="100" headerAlign="center" align="center">用户等级</div>
       	<div field="status" width="100" headerAlign="center" align="center">用户状态</div>
        <div field="op" width="150" headerAlign="center" align="center" >操作</div>	
       	</div>
	</div>
</div>

<div id="win1" class="mini-window" title="" style="width:500px;height:400px;"
	 showMaxButton="true" showCollapseButton="true" showShadow="true"
	 showToolbar="true" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	 <div id="viewForm" style="padding:10px;">
	 	<table align="center">
	 		<tr><td>用户名:</td>
	 			<td><input name="userName" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>登录名:</td>
	 			<td><input name="loginName" class="mini-textbox" style="width:150px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>昵称:</td>
	 			<td><input name="nickName" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>用户角色:</td>
	 			<td><input id="roler" name="roler" class="mini-combobox" style="width:150px;"  
	 					textField="text" valueField="value" url="${ctx}/system/dic/consult.do?sort=userRole" readOnly /></td>
	 		</tr>
	 		<tr><td>用户等级:</td>
	 			<td><input id="grade" name="grade" class="mini-combobox" style="width:150px;" readOnly
	 					textField="text" valueField="value" data="[{text:'一级',value:'1'},{text:'二级',value:'2'}]" /></td>
	 			<td>用户状态:</td>
	 			<td><input id="status" name="status" class="mini-combobox" style="width:150px;" readOnly
	 					textField="text" valueField="value" data="[{text:'无效用户',value:'0'},{text:'有效用户',value:'1'}]" /></td>
	 		</tr>
	 		<tr><td>性别:</td>
	 			<td><input id="sex" name="sex" class="mini-combobox" style="width:150px;" readOnly 
	 					textField="text" valueField="value" url="${ctx}/system/dic/consult.do?sort=sex" /></td>
	 			<td>年龄:</td>
	 			<td><input name="age" class="mini-textbox" style="width:150px;" readOnly /></td>
	 		</tr>
	 		<tr><td>手机:</td>
	 			<td><input name="tel" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>验证手机:</td>
	 			<td><input name="telChecked" class="mini-textbox" style="width:150px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>出生日期:</td>
	 			<td><input name="birthday" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>身份证号:</td>
	 			<td><input name="idCard" class="mini-textbox" style="width:150px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>email:</td>
	 			<td><input name="email" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>所在区域:</td>
	 			<td><input name="area" class="mini-textbox" style="width:150px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>商家编号:</td>
	 			<td><input name="sellerNo" class="mini-textbox" style="width:150px;" readOnly /></td>
	 			<td>登录次数:</td>
	 			<td><input name="loginCount" class="mini-textbox" style="width:150px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>最近登录时间:</td>
	 			<td colspan="3"><input name="lastLoginTime" class="mini-textbox" style="width:373px;"  readOnly /></td>
	 		</tr>
	 		<tr><td>详细地址:</td>
	 			<td colspan="3"><input name="address" class="mini-textbox" style="width:373px;" readOnly /></td>
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
		if (field == "userName") {
			e.cellHtml = '<a href="javascript:view()";" style="text-decoration:none;">'+value+'</a>';
		}
		if (field == "roler" || field == "sex" || field == "grade"|| field == "status") {
			e.cellHtml = getText(value,mini.get(field).data);
		}
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-primary btn-sm"  onclick="sellerList(\''+record.userID+'\',\''+record.userName+'\')">关注商家</a>'+
				'&nbsp;<a class="btn btn-danger btn-sm" onclick="goodList(\''+record.userID+'\',\''+record.userName+'\')">关注商品</a>'
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
	function view() {
		var row = datagrid.getSelected();
		var data = mini.decode(row);
		var birthday = new Date(data.birthday).format("yyyy-MM-dd");
		var lastLoginTime = new Date(data.lastLoginTime).format("yyyy-MM-dd hh:mm:ss");
		data.birthday = birthday;
		data.lastLoginTime = lastLoginTime;
		form.setData(data);
		win.setTitle("查看用户详细信息");
		win.showAtPos('center', 'middle');
	}
	
	Date.prototype.format = function (format) {  
        var o = {  
            "M+": this.getMonth() + 1,  
            "d+": this.getDate(),  
            "h+": this.getHours(),  
            "m+": this.getMinutes(),  
            "s+": this.getSeconds(),  
            "q+": Math.floor((this.getMonth() + 3) / 3),  
            "S": this.getMilliseconds()  
        }  
        if (/(y+)/.test(format)) {  
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
        }  
        for (var k in o) {  
            if (new RegExp("(" + k + ")").test(format)) {  
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
            }  
        }  
        return format;  
    }
	
	function cancel() {
		win.hide();
	}
	
	// 关注商家
	var tabs=window.parent.mini.get('main_tabs');
	function sellerList(id,name){
		var tab = tabs.getTab("seller_attention");
		if (!tab) {
            tab = {};
            tab._nodeid = 'seller_attention';
            tab.name = 'seller_attention';
            tab.title = name+"关注商家";
            tab.showCloseButton = true;
            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url = "${ctx}/page/log/sellerAttentionLog.jsp?id="+id;
            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
	}
	
	// 关注商品
	function goodList(id,name){
		var tab = tabs.getTab("good_attention");
		if (!tab) {
            tab = {};
            tab._nodeid = 'good_attention';
            tab.name = 'good_attention';
            tab.title = name+"关注商品";
            tab.showCloseButton = true;
            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url = "${ctx}/page/log/goodAttentionLog.jsp?id="+id;
            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
	}
</script>
</html>