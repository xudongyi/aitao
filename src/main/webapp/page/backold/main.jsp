<%@ page language="java" import="java.util.Date,net.sf.rose.util.DateFormat" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.business.system.bean.UserBean" %>
<%@include file="/js/header.jsp"%>
<% 
	UserBean bean = (UserBean)session.getAttribute("webuser");
	String loginName = bean.getLoginName();
	String sellerNo = bean.getSellerNo();
	int roler = bean.getRoler();
	
	String date = DateFormat.format(new Date(), "yyyyMMdd");
	String year = date.substring(0,4);
	String month = date.substring(4,6);
	String day = date.substring(6,8);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
<link href="${ctx}/css/icon-newBlue.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/css/myoutlookmenu.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/css/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-layout" style="width: 100%; height: 100%;">
    <div class="header" region="north" height="94px" showSplit="false"
         showHeader="false" style="border: 0">
        <div class="head-top">
            <a style="right:10px" class="top-hover-5" href="${ctx}/user/webLogout.do" >
            	<span style="font-size:13px;color:white;position: absolute;top:20px;font-weight:bold;">退&nbsp;出</span>
            </a>
        </div>
        <div class="head-bottom-left" >
            <div class="bottom-01">
                <label style="color: #175786;">今天是： <%=year %>年<%=month %>月<%=day %>日&nbsp;&nbsp;&nbsp;<span id="week"></span></label>
            </div>
        </div>
        <div class="head-bottom-right" >
            <div  class="bottom-02" >
                <label style="color: white;letter-spacing:3px;">欢迎您,<%= loginName %></label>
            </div>
        </div>
        <div style="clear: none"></div>
    </div>
    <div style="width: 100%">
        <div style="float: left;width: 250px;height: 100%;white-space:nowrap;" id="leftTree"
             autoCollapse="true" class="mini-outlookmenu" textField="name" idField="id"
             parentField="parent_id" borderStyle="border:1" onitemclick="onItemSelect"
                >
        </div>
        <div  style="overflow: auto;height: 100%;border: 0px;" region="center"
              bodyStyle="overflow:hidden;" showSplit="false">
            <div id="main_tabs" class="mini-tabs" activeIndex="0" oncloseClick="onCloseClick"
                 style="width: 100%; height: 100%;" contextMenu="#tabsMenu"></div>
        </div>
    </div>
</div>
<ul id="tabsMenu" class="mini-contextmenu" onbeforeopen="onBeforeOpen">
    <li onclick="closeTab">关闭标签页</li>
    <li onclick="closeAllBut">关闭其他标签页</li>
    <li onclick="closeAll">关闭所有标签页</li>
</ul>


</body>

<script type="text/javascript">
    mini.parse();
    var tabs = mini.get("main_tabs");
    var lefttree = mini.get("leftTree");
    var roler = <%=roler%>;
    var sellerNo = "<%=sellerNo%>"; 
    function showIndex(_url){
        var tab = tabs.getTab("首页");//
        if(!tab){
            //首页
            tab = {
                id: '001',
                name: '首页',
                title: '首页',
                url: _url,
                showCloseButton: false
            };
            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }

    showIndex($("#main_href").data("url"));

    function showTab(node) {
        var id = "tab$" + node.id;
        var tab = tabs.getTab(node.text);//
        if (!tab) {
            tab = {};
            tab.name = node.text;
            tab.title =node.text;
            tab.showCloseButton = true;
            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            if(node.url.indexOf("http://")!=-1){
                tab.url = node.url;
            }else{
                tab.url = "${ctx}" + node.url;
            }
            tabs.addTab(tab);
        } else {
            //刷新已存在的页面
            tabs.updateTab(tab, {
                url : tab.url
            });
            tabs.reloadTab(tab);
        }

        tabs.activeTab(tab);
    }
    function onItemSelect(e) {
        var item = e.item;
        showTab(item);
    }
    
    function onCloseClick(e) {
    	if (e.tab.name == "good_detail") {
    		var tab = tabs.getTab("商品信息");
    		if (tab) {
    			tabs.reloadTab(tab);
    		}
    	}
    }

    //tab右键菜单
    var currentTab = null;

    function onBeforeOpen(e) {
        currentTab = tabs.getTabByEvent(e.htmlEvent);
        if (!currentTab) {
            e.cancel = true;
        }
    }
    function closeTab() {
        tabs.removeTab(currentTab);
    }
    function closeAllBut() {
        tabs.removeAll(currentTab);
    }
    function closeAll() {
        tabs.removeAll();
    }


    //初始化菜单
    var json = new Array();
    if (roler == "1") {
    	json = [
   	         {
   	            "iconCls": "",
   	            "id": "cd71ed3366154a718dbe5333359f749a",
   	            "name": "商家信息",
   	            "parent_id": "",
   	            "url": ""
   	        },
   	        {
   	            "iconCls": "icon-base",
   	            "id": "7c96c70a2de24bd2a897bb526463b0a1",
   	            "name": "基本信息",
   	            "parent_id": "cd71ed3366154a718dbe5333359f749a",
   	            "url": "/page/backold/seller/seller.jsp?sellerNo="+sellerNo
   	        },
   	     	{
   			    "iconCls": "icon-sort",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b9",
   			    "name": "商品分类",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749a",
   			    "url": "/page/backold/seller/sellerSortment.jsp"
   			},
   	        {
   	            "iconCls": "icon-good",
   	            "id": "7c96c70a2de24bd2a897bb526463b0a2",
   	            "name": "商品信息",
   	            "parent_id": "cd71ed3366154a718dbe5333359f749a",
   	            "url": "/page/backold/good/sellerGood.jsp?sellerNo="+sellerNo
   	        },
   	        {
   	            "iconCls": "icon-addGood",
   	            "id": "7c96c70a2de24bd2a897bb526463b0a5",
   	            "name": "添加商品",
   	            "parent_id": "cd71ed3366154a718dbe5333359f749a",
   	            "url": "/page/backold/good/addSellerGood.jsp?sellerNo="+sellerNo
   	        },
   	        {
   	            "iconCls": "icon-comment",
   	            "id": "7c96c70a2de24bd2a897bb526463b0a3",
   	            "name": "用户评论",
   	            "parent_id": "cd71ed3366154a718dbe5333359f749a",
   	            "url": "/page/backold/log/sellerGoodCommentLog.jsp?sellerNo="+sellerNo
   	        },
   	        {
   	            "iconCls": "icon-attention",
   	            "id": "7c96c70a2de24bd2a897bb526463b0a4",
   	            "name": "最新关注",
   	            "parent_id": "cd71ed3366154a718dbe5333359f749a",
   	            "url": "/page/backold/log/attentionLogBySellerNo.jsp?sellerNo="+sellerNo
   	        }
   	    ];
    } else if (roler == "2") {
    	json = [
   			{
   			    "iconCls": "",
   			    "id": "cd71ed3366154a718dbe5333359f749b",
   			    "name": "管理员信息",
   			    "parent_id": "",
   			    "url": ""
   			},
   			{
   			    "iconCls": "icon-sellerList",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b1",
   			    "name": "商家列表",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749b",
   			    "url": "/page/backold/seller/sellerList.jsp"
   			},
   			{
   			    "iconCls": "icon-goodList",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b5",
   			    "name": "商品列表",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749b",
   			    "url": "/page/backold/good/goodList.jsp"
   			},
   			{
   			    "iconCls": "icon-userList",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b2",
   			    "name": "用户信息",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749b",
   			    "url": "/page/backold/user/baseInfo.jsp"
   			},
   			{
   			    "iconCls": "icon-sort",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b3",
   			    "name": "商品分类",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749b",
   			    "url": "/page/backold/good/goodAssortment.jsp"
   			},
   			{
   			    "iconCls": "icon-dic",
   			    "id": "7c96c70a2de24bd2a897bb526463b0b4",
   			    "name": "数据字典",
   			    "parent_id": "cd71ed3366154a718dbe5333359f749b",
   			    "url": "/page/backold/system/sysDic.jsp"
   			}
   	    ]
    }
    
    
    
    lefttree.loadList( json, "id", "parent_id" );


</script>
</html>