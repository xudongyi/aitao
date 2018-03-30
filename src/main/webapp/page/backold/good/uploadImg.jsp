<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <script src="${ctx}/js/boot.js" type="text/javascript"></script>
    <link href="${ctx}/js/miniui/themes/default/miniui_nteport.css" rel="stylesheet" type="text/css"/>
    <!--文件上传JS插件引入包  开始-->
    <link rel="stylesheet" type="text/css" href="${ctx}/js/uploadify/uploadify.css">
    <script language="javascript" type="text/javascript">
        //防止客户端缓存文件，造成uploadify.js不更新，而引起的“喔唷，崩溃啦”
        document.write("<script type='text/javascript' "
                + "src='${ctx}/js/uploadify/jquery.uploadify.min.js?" + new Date()
                + "'></s" + "cript>");
    </script>
    <script type="text/javascript" src="${ctx}/js/uploadify/jquery.uploadify.js"></script>
    <!--文件上传JS插件引入包 结束-->
    <style type="text/css">
        table tr {
           height: 35px;
        }
    </style>
</head>

<body>
<div class="mini-fit bg">
    <div id="div_form" >
    <input class="mini-hidden" name="filename" id="filename">
    <input class="mini-hidden" name="filepath" id="filepath">
        <table style="width: 100%;padding: 20px">
            <tr>
                <td style="width:100%;" align="center" colspan="2">
                    <div id="status-message" style="font-family:黑体;color:red;padding-left: 10px;">
                        *----提示：只能上传一个文件，如果上传多个文件，取最新上传的----*
                    </div>
                </td>
                </td>
            </tr>
            <tr>
                <td style="width:100%;" colspan="2" align="center">
                    <input type="file" name="uploadify" id="uploadify" style="width: 90%;"/>
                </td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var uploadify_onSelectError = function (file, errorCode, errorMsg) {
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                this.queueData.errorMsg += "文件大小超过限制( " + this.settings.fileSizeLimit + " )";
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                this.queueData.errorMsg += "文件大小为0";
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                this.queueData.errorMsg = "文件格式不正确，仅限 " + this.settings.fileTypeExts;
                break;
            default:
                this.queueData.errorMsg += "错误代码：" + errorCode + "\n" + errorMsg;
        }
    };

    var uploadify_onUploadError = function (file, errorCode, errorMsg, errorString) {
        // 手工取消不弹出提示
        if (errorCode == SWFUpload.UPLOAD_ERROR.FILE_CANCELLED
                || errorCode == SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED) {
            return;
        }
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                this.queueData.errorMsg += "HTTP 错误\n" + errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
                this.queueData.errorMsg += "上传文件丢失，请重新上传";
                break;
            case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                this.queueData.errorMsg += "IO错误";
                break;
            case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                this.queueData.errorMsg += "安全性错误\n" + errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                this.queueData.errorMsg += "每次最多上传 " + this.settings.uploadLimit + "个";
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                this.queueData.errorMsg += errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
                this.queueData.errorMsg += "找不到指定文件，请重新操作";
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                this.queueData.errorMsg += "参数错误";
                break;
            default:
                this.queueData.errorMsg += "文件:" + file.name + "\n错误码:" + errorCode + "\n"
                        + errorMsg + "\n" + errorString;
        }
    }
    var fileinputid = '<%=request.getParameter("filename")%>';
    $(function () {
        $('#uploadify').uploadify({
            uploader: '${ctx}/upload/uploadFile.do',   // 服务器端处理地址
            swf: '${ctx}/js/uploadify/uploadify.swf',    // 上传使用的 Flash
            width: 120,                          // 按钮的宽度
            height: 23,                         // 按钮的高度
            buttonText: "请上传文件",                 // 按钮上的文字
            buttonCursor: 'hand',                // 按钮的鼠标图标
            fileObjName: 'uploadify',
            fileTypeExts: "*.*",             // 扩展名
            fileTypeDesc: "请选择文件",     // 文件说明
            auto: true,                // 选择之后，自动开始上传
            multi: false,               // 是否支持同时上传多个文件
            removeCompleted: false,
            queueSizeLimit: 1,          // 允许多文件上传的时候，同时上传文件的个数
            //上传文件个数限制
            uploadLimit : 5,//允许上传的文件的个数
            'onUploadSuccess': function (file, data, response) {
                if (data) {
                	top["win"].document.getElementById(fileinputid).value = data;
                	setTimeout('CloseOwnerWindow()',800);
                }
            },
            'onUploadError': function (file, errorCode, errorMsg) {
                //非用户取消上传的情况
                if (errorCode != "-280") {
                    alert("文件：“" + file.name + "”上传失败，原因：" + errorCode + "--" + errorMsg + "，请联系管理员！");
                }
            }
        });
    });
</script>

</body>
</html>