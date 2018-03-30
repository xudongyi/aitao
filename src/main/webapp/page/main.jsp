<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
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
                <a class="top-hover-1" data-url="" href="javascript:showIndex('')" id="main_href">
                </a>
            <a class="top-hover-2" href="http://localhost:8080/yzd">
            </a>
            <a class="top-hover-3" href="${ctx}/logout" >
            </a>
        </div>
        <div class="head-bottom-left" >
            <div class="bottom-01">
                <label style="color: #175786;">今天是： <span id="year"></span>年<span id="month"></span>月<span id="day"></span>日&nbsp;&nbsp;&nbsp;<span id="week"></span></label>
            </div>
        </div>
        <div class="head-bottom-right" >
            <div  class="bottom-02" >
                <label style="color: white;letter-spacing:3px;">欢迎您,系统管理员</label>
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
            <div id="main_tabs" class="mini-tabs" activeIndex="0"
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
    var json = [
        {
            "iconCls": "",
            "id": "cd71ed3366154a718dbe5333359f749e",
            "name": "商品信息管理",
            "parent_id": "",
            "url": ""
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463601a",
            "name": "商品基本信息",
            "parent_id": "cd71ed3366154a718dbe5333359f749e",
            "url": "/page/good/goodList.jsp"
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463602a",
            "name": "商品分类信息",
            "parent_id": "cd71ed3366154a718dbe5333359f749e",
            "url": ""
        }
        ,{
            "iconCls": "",
            "id": "cd71ed3366154a718dbe5333359f7491",
            "name": "商家信息管理",
            "parent_id": "",
            "url": ""
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463b01a",
            "name": "商家基本信息",
            "parent_id": "cd71ed3366154a718dbe5333359f7491",
            "url": "/page/seller/sellerList.jsp"
        },
        {
            "iconCls": "",
            "id": "cd71ed3366154a718dbe5333359f7495",
            "name": "用户信息管理",
            "parent_id": "",
            "url": ""
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463b05a",
            "name": "用户基本信息",
            "parent_id": "cd71ed3366154a718dbe5333359f7495",
            "url": "/page/user/baseInfo.jsp"
        },
        {
            "iconCls": "",
            "id": "cd71ed3366154a718dbe5333359f7497",
            "name": "日志信息管理",
            "parent_id": "",
            "url": ""
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463105a",
            "name": "商品评论信息",
            "parent_id": "cd71ed3366154a718dbe5333359f7497",
            "url": "/page/log/goodCommentLog.jsp"
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463205a",
            "name": "商家评论信息",
            "parent_id": "cd71ed3366154a718dbe5333359f7497",
            "url": "/page/log/sellerCommentLog.jsp"
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463505a",
            "name": "用户关注商品",
            "parent_id": "cd71ed3366154a718dbe5333359f7497",
            "url": "/page/log/goodAttentionLog.jsp"
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463305a",
            "name": "用户关注商家",
            "parent_id": "cd71ed3366154a718dbe5333359f7497",
            "url": "/page/log/sellerAttentionLog.jsp"
        },
        {
            "iconCls": "",
            "id": "cd71ed3366154a718dbe5333359f7492",
            "name": "数据字典",
            "parent_id": "",
            "url": ""
        },
        {
            "iconCls": "",
            "id": "7c96c70a2de24bd2a897bb526463b013",
            "name": "数据字典",
            "parent_id": "cd71ed3366154a718dbe5333359f7492",
            "url": "/page/system/sysDic.jsp"
        }

    ];
    lefttree.loadList( json, "id", "parent_id" );


</script>
</html>