<%@ page language="java" import="java.util.List,sun.misc.BASE64Decoder" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详细</title>
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
<script src="${ctx}/js/boot.js" type="text/javascript"></script>
<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
</head>
<body>
<div class="top-search" style="width:98%">
		<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="save()">保存</a>
		<a class="btn btn-danger btn-sm" iconCls="icon-search" onclick="cancel()">取消</a>
	</div>
<div class="mini-fit">
<div id="panel1" class="mini-panel" title="基本信息" iconCls="icon-goto" style="width:100%;" allowResize="true">
	<div id="baseForm" style="padding:20px;">
	 	<input class="mini-hidden" name="goodsNo" />
	 	<table align="center" width="95%">
	 		<tr><td>商品名称:</td>
	 			<td><input name="goodsName" class="mini-textbox" style="width:160px;" required="true" readonly/></td>
	 			<td>商家名称:</td>
	 			<td><input name="sellerNo" class="mini-combobox" style="width:160px;" textField="sellerName" valueField="sellerNo" 
	 					url="${ctx}/seller/totalList.do" required="true" readonly/></td>
	 			<td>商品分类:</td>
	 			<td><input name="sortNo" class="mini-treeselect" style="width:160px;" textField="sortName" valueField="sortNo" parentField="parentNO"
	 					url="${ctx}/goods/sort/list.do" expandOnLoad="true" required="true" allowInput="true" onvalueChanged="sortChange" /></td>
	 			<td>品牌:</td>
	 			<td><input id="brand" name="brand" class="mini-combobox" style="width:160px;" textField="sortPropertyValue"  
	 					valueField="sortPropertyValue" url="" allowInput="true" required="true" /></td>
	 		</tr>
	 		<tr><td>商品价格(元):</td>
	 			<td><input  name="price" class="mini-textbox" style="width:160px;" required="true" /></td>
	 			<td>市场价(元):</td>
	 			<td><input  name="marketPrice" class="mini-textbox" style="width:160px;" required="true" /></td>
	 			<td>商品状态:</td>
	 			<td><input id="onShelve" name="onShelve" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=onShelve" required="true" /></td>
	 			<td>商品关键词:</td>
	 			<td><input  name="keyWords" class="mini-textbox" style="width:160px;" required="true" /></td>
	 		</tr>
	 		<tr><td>商品毛重(kg):</td>
	 			<td><input  name="grossWeight" class="mini-textbox" style="width:160px;" required="true" /></td>
	 			<td>商品净重(kg):</td>
	 			<td><input  name="netWeight" class="mini-textbox" style="width:160px;" required="true" /></td>
	 			<td>上架时间:</td>
	 			<td><input name="shelfTime" class="mini-datepicker" format="yyyy-MM-dd" required="true"
	 					 style="width:160px;"  /></td>
	 			<td>供货总量:</td>
	 			<td><input  name="totalCount" class="mini-textbox" style="width:160px;" required="true" /></td>
	 		</tr>
	 		<tr><td>商城分类:</td>
	 			<td><input name="shopSort" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					url="${ctx}/system/dic/consult.do?sort=shopSort" /></td>
	 			<td>累计销量:</td>
	 			<td><input  name="salseCount" class="mini-textbox" style="width:160px;" readonly /></td>
	 			<td>虚拟销量:</td>
	 			<td><input  name="virtualSales" class="mini-textbox" style="width:160px;"/></td>
	 			<td>排序:</td>
	 			<td><input name="goodOrder" class="mini-textbox" style="width:160px;" /></td>
	 		</tr>
	 		<tr><td>精品:</td>
	 			<td><input name="fine" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly/></td>
	 			<td>新品:</td>
	 			<td><input name="newGoods" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly/></td>
	 			<td>爆款:</td>
	 			<td><input name="popularSales" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly/></td>
	 			<td>热销:</td>
	 			<td><input name="hotSales" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly/></td>
	 		</tr>
	 		<tr><td>推荐:</td>
	 			<td><input name="recSales" class="mini-combobox" style="width:160px;" textField="text" valueField="value" 
	 					data="[{value:'1',text:'是'},{value:'0',text:'否'}]" readonly/></td>
	 			<td>图片上传</td>
	 			<td><input name="img1" class="mini-htmlfile" id="good_file" style="width: 160px;" onvalidation="checkFile"  ></td>
	 		</tr>
	 	</table>
	 </div>
</div>

<div id="panel2" class="mini-panel" title="商品价格" iconCls="icon-goto" style="width:100%;" allowResize="true">
	<div class="top-search" style="width:98%">
		<a class="btn btn-primary btn-sm" iconCls="icon-search" onclick="addPrice()">新增</a>
	</div>
	<div id="datagrid" class="mini-datagrid" style="width:100%;" showPager="false" allowCellValid="true"
			  allowSortColumn="false" allowCellEdit="true" allowCellSelect="true"
        	 enterNextCell="true" url="${ctx}/goods/price/list.do?goodsNo=<%=request.getParameter("goodsNo")%>"      
			 idField="id" allowResize="true">
		<div property="columns">
       	<div type="indexcolumn"></div>
       	<div field="goodsPriceNo" visible="false"></div>
       	<div field="price" width="60" headerAlign="center" vtype="required" align="center" allowSort="true">价格
       		<input property="editor" class="mini-textbox" style="width:100%;" />
       	</div>
       	<div field="propertityValue1" width="100" headerAlign="center" align="center" allowSort="true">属性一
       		<input id="propertityValue1" property="editor" class="mini-combobox" textField="sortPropertyName" 
       			valueField="sortPropertyValue" allowInput="true" style="width:100%;" />
       		</div>
       	<div field="propertityValue2" width="100" headerAlign="center" align="center" allowSort="true">属性二
       		<input id="propertityValue2" property="editor" class="mini-combobox" textField="sortPropertyName" 
       			valueField="sortPropertyValue" allowInput="true" style="width:100%;" />
       	</div>
       	<div field="propertityValue3" width="100" headerAlign="center" align="center" allowSort="true">属性三
       		<input id="propertityValue3" property="editor" class="mini-combobox" textField="sortPropertyName" 
       			valueField="sortPropertyValue" allowInput="true" style="width:100%;" />
       	</div>
       	<div field="propertityValue4" width="100" headerAlign="center" align="center" allowSort="true">属性四
       		<input id="propertityValue4" property="editor" class="mini-combobox" textField="sortPropertyName" 
       			valueField="sortPropertyValue" allowInput="true" style="width:100%;" />
       	</div>
       	<div field="sortOrder" width="60" headerAlign="center" align="center" allowSort="true">排序
       		<input property="editor" class="mini-textbox" style="width:100%;" />
       	</div>
       	<div field="totalCount" width="60" headerAlign="center" align="center" allowSort="true">供货总量
       		<input property="editor" class="mini-textbox" style="width:100%;" />
       	</div>
       	<div field="salseCount" width="60" headerAlign="center" align="center" allowSort="true">累计销量
       		<input property="editor" class="mini-textbox" style="width:100%;" />
       	</div>
       	<div field="op" width="100" headerAlign="center" align="center" allowSort="true">操作</div>
       </div>
	</div>
</div>

<div id="panel3" class="mini-panel" title="商品图片" iconCls="icon-goto" style="width:100%;" allowResize="true">
	<div id="imgForm">
		<div id="addImgDiv" class="imgDiv">
	        <a href="javascript:addImgDiv('','')">
	            <div style="width:250px;height:250px;border:1px solid #B0B0B0;">
	                <img style="position:relative;top:45px;left:45px;width:150px;height:150px;" src="../../images/addImg.png" />
	            </div>
	        </a>
	    </div>
    </div>
</div>
<div id="panel4" class="mini-panel" title="商品详细图片" iconCls="icon-goto" style="width:100%;" allowResize="true">
	<div id="detailForm">
		<div id="addDetailDiv" class="detailDiv">
	        <a href="javascript:addDetailDiv('','')">
	            <div style="width:250px;height:550px;border:1px solid #B0B0B0;">
	                <img style="position:relative;top:195px;left:45px;width:150px;height:150px;" src="../../images/addImg.png" />
	            </div>
	        </a>
	    </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript">
	mini.parse();
	var baseForm = new mini.Form("baseForm");
	var goodsNo = "<%= request.getParameter("goodsNo")%>";
	var brand = mini.get("brand"); 
	var sortPropertyName = "品牌";
	var datagrid = mini.get("datagrid");
	
	// 商品图片order
	var picNum = 0;
	
	// 商品详细图片order
	var detailNum = 0;
	
	// 删除的商品图片ID,商品详细图片ID
	var deleteId = "", deleteDetailId = "";
	var imgJson = new Array(), detailImgJson = new Array();

	datagrid.load();
	
	function reloadTab() {
		var tabs =window.top.mini.get('main_tabs');
		var tab = tabs.getTab("good_detail");
		tabs.reloadTab(tab);
	}
	
	datagrid.on("drawcell", function(e) {
		var field = e.field;
		if (field == "op") {
			e.cellHtml = '<a class="btn btn-danger btn-sm" href="javascript:removePrice()";" style="text-decoration:none;">删除</a>'
		}
		
	});
	
	//分类所有属性
	var propertyData = new Array();
	// 设置基础数据
	setBase();
	function setBase() {
		$.ajax({
			url: "${ctx}/goods/load.do",
			type: "post",
			data: {id : goodsNo},
			success: function (text) {
				text.shelfTime = new Date(text.shelfTime);
				baseForm.setData(mini.decode(text));
				// 品牌下拉列表数据
				brand.setUrl("${ctx}/goods/sort/propertyListBySort.do?sortNo="+text.sortNo+"&sortPropertyName="+encodeURI(encodeURI(sortPropertyName)));
				property(text.sortNo);
			}
		});
	}
	
	
	// 商品分类改变时
	function sortChange(e) {
		var sortNo = e.value;
		// 商品分类及父类所有品牌的分类属性
		brand.setUrl("${ctx}/goods/sort/propertyListBySort.do?sortNo="+sortNo+"&sortPropertyName="+encodeURI(encodeURI(sortPropertyName)));
		property(sortNo);
	}
	
	// 保存
	function save() {
		if (baseForm.validate()){
			datagrid.validate();
			if (datagrid.isValid()) {
				mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: '保存中...'
		         });
				var data = baseForm.getData();
				var baseJson = mini.encode(data).replace(/\"/g,"'");
				var rows = datagrid.getChanges();
				var priceJson = mini.encode(rows).replace(/\"/g,"'");
				var json = mini.encode(imgJson).replace(/\"/g,"'");
				var detailJson = mini.encode(detailImgJson).replace(/\"/g,"'");
				var inputFile = $("#good_file > input:file")[0];
				$.ajaxFileUpload({
					url:"${ctx}/goods/saveAll.do",
					fileElementId:inputFile ,
					data: {baseJson : baseJson,
						   priceJson : priceJson,
						   deleteId : deleteId,
						   deleteDetailId : deleteDetailId,
						   imgJson : json,
						   detailImgJson : detailJson
						   },
					dataType:'text',
					success: function (text) {
						mini.unmask(); //ajax执行成功后，取消遮罩层 
						if (text.indexOf("1")!=-1) {
							mini.alert("保存成功", "提示", null);
							reloadTab();
						}else {
		 		    		mini.alert("保存失败", "提示", null);
		  		    	}
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						mini.unmask(); //ajax执行失败后，取消遮罩层
					},
					complete: function () {
						mini.unmask(); //ajax执行成功后，取消遮罩层
		                var jq = $("#good_file > input:file");
		                jq.before(inputFile);
		                jq.remove();
		            }
				});
			} else {
				var error = datagrid.getCellErrors()[0];
				datagrid.beginEditCell(error.record,error.column);
			}
		}else{
			var errors=baseForm.getErrors();//获取所有校验错误的控件
			var firstError=errors[0];//获取第一个校验错误的控件
			if(firstError.type=="combobox"){//如果是combobox，则弹出下拉选项
				firstError.showPopup();
			}else{//其他控件，获取焦点
				firstError.focus();
			}
		}
	}
	
	function cancel() {
		reloadTab();
	}
	
	// 新增价格
	function addPrice() {
		var newRow = { name: "New Row" };
		datagrid.addRow(newRow, 0);
	}
	
	// 商品分类属性
	function property(sortNo) {
		var name = encodeURI(encodeURI(sortPropertyName));
		$.ajax({
			url: "${ctx}/goods/sort/propertyListBySort.do",
			type: "post",
			data: {sortNo : sortNo,
				   type : "2",
				   sortPropertyName : name},
			success: function (text) {
				propertyData = text;
			}
		});
	}
	
	datagrid.on("cellclick", function(e) {
    	var field=e.field;
    	// 下拉框设置数据
        if(field.substr(0,field.length-1) =="propertityValue") {
        	mini.get(field).setData(propertyData);
        }
	});
	
	// 删除商品价格
	function removePrice() {
		var row = datagrid.getSelected();
		datagrid.removeRow (row);
	}
	
	
	// 获取商品图片
	getImgs("1");
	
	// 获取商品详细图片
	getImgs("2");
    function getImgs(type) {
        $.ajax({
            url: "${ctx}/goods/file/list.do",
            type: "post",
            data: { goodsNo:goodsNo,
            		fileType : type
            	   },
            success: function (text) {
                for (var i=0; i<text.length; i++) {
                	var str = {'fileID' : text[i].fileID, 'fileUrl' : text[i].fileUrl,
                				'fileOrder' : i, 'fileType': type};
                	if (type == "1") {
                		imgJson.push(str);
                		addImgDiv(text[i].fileID,text[i].fileUrl);
                        getImg(text[i].fileUrl,i+1,"url"+(i+1));
                	} else {
                		detailImgJson.push(str);
                		addDetailDiv(text[i].fileID,text[i].fileUrl);
                        getImg(text[i].fileUrl,i+1,"detailUrl"+(i+1));
                	}
                    
                }
            }
        });
    }
	
	
	function addImgDiv(id,url) {
        picNum += 1;
        var textId = "url"+picNum;
        $("#addImgDiv").before('<div class="imgDiv" id="div'+picNum+'">'
            +'<input type="hidden" id="fileId'+picNum+'" value="'+id+'">'
            +'<img class="uploadImg" id="pic'+picNum+'">'
            +'<a href="javascript:deleteImg('+picNum+')"><img class="deleteImg" src="../../images/delete.png"/></a>'
            +'<input class="urlTextBox" readonly="true" id="url'+picNum+'" value="'+url+'" />'
            +'<a class="uploadButton" onclick="uploadImg(\''+textId+'\','+picNum+')">上传图片</a></div>');

    }
	
	function addDetailDiv(id,url) {
		detailNum += 1;
		var textId = "detailUrl"+detailNum;
        $("#addDetailDiv").before('<div class="detailDiv" id="detailDiv'+detailNum+'">'
        	+'<input type="hidden" id="detailFileId'+detailNum+'" value="'+id+'">'
            +'<img class="uploadDetailImg" id="detailPic'+detailNum+'">'
            +'<a href="javascript:deleteDetailImg('+detailNum+')"><img class="deleteDetailImg" src="../../images/delete.png"/></a>'
            +'<input class="urlTextBox" readonly="true" id="detailUrl'+detailNum+'" value="'+url+'" />'
            +'<a class="uploadButton" onclick="uploadImg(\''+textId+'\','+detailNum+')">上传图片</a></div>');
	}
	
	// 上传图片
    top["win"]=window;
    function uploadImg(textId,num) {
        var oldUrl = document.getElementById(textId).value;
        mini.open({
            url: "${ctx}/page/good/uploadImg.jsp?filename="+textId,
            title: "上传图片", width: 400, height: 200,
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
     			        		if (imgJson[i].fileID == id) imgJson[i].fileUrl = url;
     			        	}
     			        } else {
     			        	var str = {'fileUrl' : url,'fileOrder' : num,
     			        				'goodsNo': goodsNo, 'fileType': '1'};
     			        	imgJson.push(str);
     			        }
                    } else {
                    	var id = document.getElementById("detailFileId"+num).value;
     			        // 有主键的
     			        if (id != "") {
     			        	for (var i=0; i< detailImgJson.length; i++) {
     			        		if (detailImgJson[i].fileID == id) detailImgJson[i].fileUrl = url;
     			        	}
     			        } else {
     			        	var str = {'fileUrl' : url,'fileOrder' : num,
     			        				'goodsNo': goodsNo, 'fileType': '2'};
     			        	detailImgJson.push(str);
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
	        	if (imgJson[i].fileID == id) {
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
    
    // 商品详细图片删除
    function deleteDetailImg(num) {
        var mainDiv = document.getElementById("detailForm");
        var url = document.getElementById("detailUrl"+num).value;
        var id = document.getElementById("detailFileId"+num).value;
        mainDiv.removeChild(document.getElementById("detailDiv"+num));
     	// 有主键的
        if (id != "") {
        	deleteDetailId += id+",";
        	for (var i=0; i< detailImgJson.length; i++) {
	        	if (detailImgJson[i].fileID == id) {
	        		detailImgJson.splice(i,1);
	        		return;
	        	}
	        }
        } else {
        	if (url != "") {
    	        for (var i=0; i< detailImgJson.length; i++) {
    	        	if (detailImgJson[i].fileUrl == url) {
    	        		detailImgJson.splice(i,1);
    	        		return;
    	        	}
    	        }
            }
        }
    }
    
    // 
    /**
	 * 验证文件
	 * @param e
	 */
	function checkFile(e){
		var file=$ ("#good_file > input:file")[0];
		var limitType="*.jpg;*.jpeg;*.bmp;*.png";
		var file_type=file.value.substr(file.value.lastIndexOf(".")+1);
		if(limitType.indexOf(file_type)==-1){
			e.errorText = "不支持该文件格式"+file_type;
	        e.isValid = false;
		}
	}

</script>
</html>