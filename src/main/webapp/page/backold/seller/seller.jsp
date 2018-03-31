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
<style>
     .imgDiv {
         width:260px;
         height:260px;
         float:left;
         padding:5px 0 0 5px;
     }
     .detailDiv {
         width:260px;
         height:560px;
         float:left;
         padding:5px 0 0 5px;
     }
     .uploadImg {
         width:250px;
         height:220px;
         border:1px solid #B0B0B0;
     }
     .uploadDetailImg {
         width:250px;
         height:520px;
         border:1px solid #B0B0B0;
     }
     .urlTextBox {
         position:relative;
         left:-20px;
         width:155px;
         height:18px;
         line-height:18px;
     }
     .uploadButton {
         position:relative;
         left:-18px;
         padding: 2px 10px;
         font-size: 12px;
         line-height: 1.5;
         border-radius: 5px;
         color: #fff;
         background: #5bc0de;
         border-color: #10bdf5;
         display: inline-block;
         margin-bottom: 0;
         font-weight: normal;
         text-align: center;
         white-space: nowrap;
         vertical-align: middle;
         touch-action: manipulation;
         cursor: pointer;
         -webkit-user-select: none;
         border: 1px solid transparent;
         text-decoration: none;
     }
     .deleteImg {
         position:relative;
         top:-220px;
         left:230px;
         width:20px;
         height:20px;
     }
     .deleteDetailImg {
     	position:relative;
         top:-520px;
         left:230px;
         width:20px;
         height:20px;
     }
</style>
</head>
<body>
<div class="top-search" id="queryForm">
	<a id="editButton" class="btn btn-primary btn-sm" iconCls="icon-search" onclick="edit()">编辑</a>
	<a id="saveButton" class="btn btn-primary btn-sm" iconCls="icon-search" onclick="save()">保存</a>
	<a id="cancelButton" class="btn btn-danger btn-sm" iconCls="icon-search" onclick="cancel()">取消</a>
</div>
<div class="mini-fit">
	<div id="panel1" class="mini-panel" title="基本信息" iconCls="icon-goto" style="width:100%;" allowResize="true">
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
		 		<tr>
		 			<td>主页地址:</td>
		 			<td colspan="3"><input name="mainPageUrl" class="mini-textbox" style="width:463px;" required="true" /></td>
		 			<td></td>
		 			<td></td>
		 		</tr>
		 		<tr>
		 			<td>LOGO上传</td>
		 			<td><input name="sellerImg" class="mini-htmlfile" id="seller_file" style="width: 180px;" onvalidation="checkFile"  ></td>
		 			<td>微信二维码</td>
		 			<td><input name="qrImg" class="mini-htmlfile" id="qr_file" style="width: 180px;" onvalidation="checkFile"  ></td>
		 			<td>顶部图片</td>
		 			<td><input name="topImg" class="mini-htmlfile" id="top_file" style="width: 180px;" onvalidation="checkFile"  ></td>
		 		</tr>
		 		<tr><td>备注:</td>
		 			<td colspan="5"><input name="content" class="mini-textarea" style="width:818px;height:60px;" /></td>
		 		</tr>
		 	</table>
		 </div>
	 </div>
	 
	 <div id="panel2" class="mini-panel" title="轮播图片" iconCls="icon-goto" style="width:100%;" allowResize="true">
	 	<div id="imgForm">
			<div id="addImgDiv" class="imgDiv">
		        <a href="javascript:addImgDiv('','')">
		            <div style="width:250px;height:250px;border:1px solid #B0B0B0;">
		                <img style="position:relative;top:45px;left:45px;width:150px;height:150px;" src="../../../images/addImg.png" />
		            </div>
		        </a>
		    </div>
	    </div>
	 </div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var sellerNo = '<%=request.getParameter("sellerNo") %>';
	var imgJson = new Array();
	var form = new mini.Form("form");
	// 删除的轮播图片ID
	var deleteId = ""
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
	getImgs();
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
	//获取商家轮播图片
    function getImgs() {
        $.ajax({
            url: "${ctx}/seller/file/list.do",
            type: "post",
            data: { sellerNo:sellerNo },
            success: function (text) {
                for (var i=0; i<text.length; i++) {
                	var str = {'fileId' : text[i].fileId, 'fileUrl' : text[i].fileUrl,
                				'fileOrder' : i, 'fileType': 1};
            		imgJson.push(str);
            		addImgDiv(text[i].fileId,text[i].fileUrl);
                    getImg(text[i].fileUrl,i+1,"url"+(i+1));
                }
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
			var lunJson = mini.encode(imgJson).replace(/\"/g,"'");
			var inputFile1 = $("#seller_file > input:file")[0];
			var inputFile2 = $("#qr_file > input:file")[0];
			var inputFile3 = $("#top_file > input:file")[0];
			$.ajaxFileUpload({
				url:"${ctx}/seller/save.do",
				fileElementId:[inputFile1,inputFile2,inputFile3],
				data:{
						data:json,
						imgJson:lunJson,
						deleteId:deleteId
					 },
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
	                var jq1 = $("#seller_file > input:file");
	                var jq2 = $("#qr_file > input:file");
	                var jq3 = $("#top_file > input:file");
	                jq1.before(inputFile1);
	                jq2.before(inputFile2);
	                jq3.before(inputFile3);
	                jq1.remove();
	                jq2.remove();
	                jq3.remove();
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
	// 轮播图片order
	var picNum = 0;
	
	
	function addImgDiv(id,url) {
        picNum += 1;
        var textId = "url"+picNum;
        $("#addImgDiv").before('<div class="imgDiv" id="div'+picNum+'">'
            +'<input type="hidden" id="fileId'+picNum+'" value="'+id+'">'
            +'<img class="uploadImg" id="pic'+picNum+'">'
            +'<a href="javascript:deleteImg('+picNum+')"><img class="deleteImg" src="../../../images/delete.png"/></a>'
            +'<input class="urlTextBox" readonly="true" id="url'+picNum+'" value="'+url+'" />'
            +'<a class="uploadButton" onclick="uploadImg(\''+textId+'\','+picNum+')">上传图片</a></div>');

    }
	
	// 上传图片
    top["win"]=window;
    function uploadImg(textId,num) {
        var oldUrl = document.getElementById(textId).value;
        mini.open({
            url: "${ctx}/page/backold/good/uploadImg.jsp?filename="+textId,
            title: "上传图片", width: 450, height: 200,
            onload: function () {
                var iframe = this.getIFrameEl();
            },
            ondestroy: function (action) {
                var iframe = this.getIFrameEl();
                //获取选中、编辑的结果
                var url = document.getElementById(textId).value;
                if (url != "" && oldUrl != url) {
                    getImg(url,num,textId);
                    
                    // 拼接json
                    if (textId.substr(0,3) == "url") {
                    	var id = document.getElementById("fileId"+num).value;
     			        // 有主键的
     			        if (id != "") {
     			        	for (var i=0; i< imgJson.length; i++) {
     			        		if (imgJson[i].fileId == id) imgJson[i].fileUrl = url;
     			        	}
     			        } else {
     			        	var str = {'fileUrl' : url,'fileOrder' : num, 'fileType': '1'};
     			        	imgJson.push(str);
     			        }
                    } 
			        
                }
            }
        });
    }
    
    
    // 图片展示
    function getImg(path,num,textId){
        $.ajax({
            url: "${ctx}/goods/file/getImg.do",
            type: "post",
            data: { url : path },
            success: function (text) {
            	if (textId.substr(0,3) == "url") {
            		$("#pic"+num).attr("src", "data:image/png;base64," +text);
            	} else {
            		$("#detailPic"+num).attr("src", "data:image/png;base64," +text);
            	}
                
            }
        });
    }
    
	 // 图片删除
    function deleteImg(num) {
        var mainDiv = document.getElementById("imgForm");
        var url = document.getElementById("url"+num).value;
        var id = document.getElementById("fileId"+num).value;
        mainDiv.removeChild(document.getElementById("div"+num));
        // 有主键的
        if (id != "") {
        	deleteId += id+",";
        	for (var i=0; i< imgJson.length; i++) {
	        	if (imgJson[i].fileId == id) {
	        		imgJson.splice(i,1);
	        		return;
	        	}
	        }
        } else {
        	if (url != "") {
    	        for (var i=0; i< imgJson.length; i++) {
    	        	if (imgJson[i].fileUrl == url) {
    	        		imgJson.splice(i,1);
    	        		return;
    	        	}
    	        }
            }
        }
       
    }
    
</script>
</html>