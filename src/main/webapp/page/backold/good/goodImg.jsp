<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品图片</title>
<style>
	.imgDiv {
     	width:220px;
     	height:190px;
     	float:left;
     	padding:5px 0 0 5px;
     }
     .uploadImg {
     	width:220px;
     	height:160px;
     	border:1px solid #B0B0B0;
     }
     .urlTextBox {
     	position:relative;
     	left:-20px;
     	width:140px;
     	height:22px;
     	line-height:22px;
     	border-radius:5px;
     	border-color: #3090E0;
     	background:#EBF8FF;
     }
     .uploadButton {
     	position:relative;
     	left:-15px;
     	padding: 2px 14px;
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
     	top:-160px;
     	left:200px;
     	width:20px;
     	height:20px;
     }
</style>
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
</head>
<body>
<div id="fitDiv" class="mini-fit">
	<div id="addImgDiv" class="imgDiv">
		<a href="javascript:addImgDiv('','')">
			<div style="width:220px;height:185px;border:1px solid #B0B0B0;">
				<img style="position:relative;top:18px;left:35px;width:150px;height:150px;" src="../../../images/addImg.png" />
			</div>
		</a>
	</div>
</div>

</body>
<script type="text/javascript">
	// 商品编号
	var goodsNo = "<%=request.getParameter("goodsNo") %>";
	var picNum = 0;
	getImgs();
	// 获取商品图片
	function getImgs() {
		$.ajax({
			url: "${ctx}/goods/file/list.do",
			type: "post",
			data: { goodsNo:goodsNo },
			success: function (text) {
				for (var i=0; i<text.length; i++) {
					addImgDiv(text[i].fileID,text[i].fileUrl);
					getImg(text[i].fileUrl,i+1);
				}
				if (text.length < 5) {
					for (var i=text.length; i< 5; i++) {
						addImgDiv('','');
					}
				}
			}
		});
	}
	
	function getImg(path,num){
		$.ajax({
			url: "${ctx}/goods/file/getImg.do",
			type: "post",
			data: { url : path },
			success: function (text) {
				$("#pic"+num).attr("src", "data:image/png;base64," +text);
			}
		});
	}
	
	function addImgDiv(id,url) {
		picNum += 1;
		 $("#addImgDiv").before('<div class="imgDiv" id="div'+picNum+'">'
			+'<input type="hidden" id="fileId'+picNum+'" value="'+id+'">'
		 	+'<img class="uploadImg" id="pic'+picNum+'">'
		 	+'<a href="javascript:deleteImg('+picNum+')"><img class="deleteImg" src="../../../images/delete.png"/></a>'
		 	+'<input class="urlTextBox" readonly="true" id="url'+picNum+'" value="'+url+'" />'
		 	+'<a class="uploadButton" onclick="uploadImg('+picNum+')">上传</a></div>');
		 
	}
	
	// 上传图片
	top["win"]=window;
	function uploadImg(num) {
		var oldUrl = document.getElementById("url"+num).value;
		mini.open({
		    url: "${ctx}/page/backold/good/uploadImg.jsp?filename=url"+num,
            title: "上传图片", width: 400, height: 200,
            onload: function () {
            var iframe = this.getIFrameEl();
	        },
	        ondestroy: function (action) {
                var iframe = this.getIFrameEl();
                //获取选中、编辑的结果
                var url = document.getElementById("url"+num).value;
                if (url != "" && oldUrl != url) {
                	getImg(url,num);
                    save(url,num);
                }
	        }
	    });
	}
	
	
	function save(url,num) {
		var id = document.getElementById("fileId"+num).value;
		$.ajax({
			url: "${ctx}/goods/file/save.do",
			type: "post",
			data: { id : id,
					goodsNo : goodsNo,
					fileUrl : url},
			success: function (text) {
				if (text.res>0) {
					document.getElementById("fileId"+num).value = text.fileId;
					mini.alert("图片保存成功", "提示", null);
				}
				else 
					mini.alert("图片保存失败", "提示", null);
			}
		});
	}
	
	function deleteImg(num) {
		var mainDiv =  document.getElementById("fitDiv");
		var id = document.getElementById("fileId"+num).value;
		if (id == "") {
			mainDiv.removeChild(document.getElementById("div"+num));
			return;
		}
		$.ajax({
			url: "${ctx}/goods/file/delete.do",
			type: "post",
			data: { id : id},
			success: function (text) {
				if (text > 0) {
					mainDiv.removeChild(document.getElementById("div"+num));
					mini.alert("图片删除成功", "提示", null);
				}
				else {
					mini.alert("图片删除失败", "提示", null);
				}	
			}
		});
	}
	
</script>

</html>