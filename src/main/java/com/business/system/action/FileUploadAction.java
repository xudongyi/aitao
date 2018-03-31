package com.business.system.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.rose.initial.BootStart;
import net.sf.rose.jdbc.service.Service;



import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 项目名称:  yzd-platform
 * 创建人:    xudy
 * 创建时间:  2016/8/17 0017 20:13
 * 类描述:    文件处理action
 * 修改备注:  说明本次修改内容
 */

@Controller
@RequestMapping("/upload")
public class FileUploadAction {
    private static String OS = System.getProperty("os.name").toLowerCase();
    
    @ResponseBody
    @RequestMapping(value = "/uploadFile.do",method = RequestMethod.POST)
    public String upload(HttpServletResponse response, HttpServletRequest request, Service service){
        try{
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
            String ctxPath = BootStart.getInstance().getWorkSpacePath();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            String ymd = sdf.format(new Date());
            ctxPath += File.separator + ymd + File.separator;
            // 创建文件夹
            File file = new File(ctxPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            String fileName = null;
            UUID uuid = null;
            for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
                // 上传文件
                MultipartFile mf = entity.getValue();
                fileName = mf.getOriginalFilename();// 获取原文件名
                fileName = fileName.substring(fileName.lastIndexOf("."));
                // System.out.println("filename="+UUID.randomUUID()+"."+fileName);
                uuid = UUID.randomUUID();
                File uploadFile = new File(ctxPath + uuid + fileName);
                try {
                    FileCopyUtils.copy(mf.getBytes(), uploadFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            String path = ymd + "/" + uuid + fileName;
            // 将图片转换成网络地址
            return path;
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }

	}

}
