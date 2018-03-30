//重写ajax方法，实现session失效时，ajax请求也能跳转到登录页面
(function($){  
    //备份jquery的ajax方法  
    var _ajax=$.ajax;  
      
    //重写jquery的ajax方法  
    $.ajax=function(opt){  
        //备份opt中error和success方法  
        var fn = {  
            error:function(XMLHttpRequest, textStatus, errorThrown){},  
            success:function(data, textStatus){}  
        }  
        if(opt.error){  
            fn.error=opt.error;  
        }  
        if(opt.success){  
            fn.success=opt.success;  
        }  
          
        //扩展增强处理  
        var _opt = $.extend(opt,{  
            error:function(XMLHttpRequest, textStatus, errorThrown){
            	//单点登录时，错误处理
            	if(textStatus=="error"){
            		if(errorThrown=="Unauthorized"){//没有权限
            			//window.location.href="/AuthorizationSystem/page/401.jsp";  
            		}else if(errorThrown==""){//session超时，跳到主页
//            			window.location.href="/huihuan-system";  
            		}else if(errorThrown=="Not Found"){//404
            			//window.location.href="/AuthorizationSystem/page/404.jsp";  
            		}else{
            			//window.location.href="/AuthorizationSystem/page/500.jsp";  
            		}
            	}
                //错误方法增强处理  
                fn.error(XMLHttpRequest, textStatus, errorThrown);  
            },  
            success:function(data, textStatus){  
            	//session超时，跳到主页
            	if((typeof data)=="string"){
            		if(data.indexOf("/cas-server/login")!=-1){
            			window.location.href="/huihuan-system";  
            		}
            	}
                fn.success(data, textStatus);  
            }  
        });  
        _ajax(_opt);  
    };  
})(jQuery); 