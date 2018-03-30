  var uploadify_onSelectError = function (file, errorCode, errorMsg) {
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
            	this.queueData.errorMsg="文件大小超过限制( " + this.settings.fileSizeLimit + " )" ;
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
                this.queueData.errorMsg += "文件：“" + file.name + "”上传失败，原因：" + errorCode + "--" + errorMsg + "，请联系管理员！";
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
    };
    function createUploadify(url,fileTypeExts,selectCallBack,uploadSuccessCallBack){
    	$('#uploadify').uploadify({
        	swf:bootPATH+"uploadify/uploadify.swf?t="+new Date().getTime(),    // 上传使用的 Flash
            uploader:url,   // 服务器端处理地址
            method:'post',
            width: 120,                          // 按钮的宽度
            height: 23,                         // 按钮的高度
            buttonText: "请选择文件",                 // 按钮上的文字
            buttonCursor: 'hand',                // 按钮的鼠标图标
            fileObjName: "uploadify",
            fileTypeExts: fileTypeExts,             // 扩展名
            fileTypeDesc: "请选择"+fileTypeExts+"文件",     // 文件说明
            auto: false,                // 选择之后，自动开始上传
            multi: false,               // 是否支持同时上传多个文件
            uploadLimit:999,
            queueSizeLimit:1,
            removeCompleted: true,
            fileSizeLimit:'10MB',
            'onUploadSuccess': function (file, data, response) {
            	uploadSuccessCallBack(data);
            },
            'onUploadError': uploadify_onUploadError,
            'onSelectError':uploadify_onSelectError,
            'onSelect':function(file){
            	selectCallBack(file);
            }

        });
    }
      
