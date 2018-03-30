package com.business.system.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 商品导入和导出service
 * Created by Administrator on 2017/2/28.
 */
public class CsvWriter {
    /**
     * CSV文件列分隔符
     */
    private static final String CSV_COLUMN_SEPARATOR = ",";
    /**
     * CSV文件列分隔符
     */
    private static final String CSV_RN = "\r\n";
    /**
     * 将检索数据输出的对应的csv列中
     */
    public static String formatCsvData(List<Map<String, Object>> data,
                                       String displayColNames, String matchColNames) {
        StringBuffer buf = new StringBuffer();
        String[] displayColNamesArr = null;
        String[] matchColNamesMapArr = null;
        displayColNamesArr = displayColNames.split(",");
        matchColNamesMapArr = matchColNames.split(",");
        // 输出列头
        for (int i = 0; i < displayColNamesArr.length; i++) {
            buf.append(displayColNamesArr[i]).append(CSV_COLUMN_SEPARATOR);
        }
        buf.append(CSV_RN);
        if (null != data) {
            // 输出数据
            for (int i = 0; i < data.size(); i++) {
                for (int j = 0; j < matchColNamesMapArr.length; j++) {
                    buf.append(data.get(i).get(matchColNamesMapArr[j])).append(
                            CSV_COLUMN_SEPARATOR);
                }
                buf.append(CSV_RN);
            }
        }
        return buf.toString();
    }
    public static void exportCsv(String fileName, String content,
                                 HttpServletResponse response, HttpServletRequest request) throws IOException {
        // 设置文件后缀
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhh24mmss");
        String fn = fileName.concat(sdf.format(new Date()).toString() + ".csv");
        // 读取字符编码
        String csvEncoding = "UTF-8";
        // 设置响应
        response.setCharacterEncoding(csvEncoding);
        response.setContentType("text/csv; charset=" + csvEncoding);
        response.setHeader("Pragma", "public");
        response.setHeader("Cache-Control", "max-age=30");
        response.setHeader("Content-Disposition", "attachment; filename="
                + new String(fn.getBytes(), csvEncoding));
        // 写出响应
        OutputStream os = response.getOutputStream();
        os.write(content.getBytes("GBK"));
        os.flush();
        os.close();
    }
    /**
     * 将指定文件夹打包成zip
     *
     * @param folder
     * @throws IOException
     */
    public static void zipFile(String folder) throws IOException {
        File zipFile = new File(folder + ".zip");
        if (zipFile.exists()) {
            zipFile.delete();
        }
        ZipOutputStream zipout = new ZipOutputStream(new FileOutputStream(zipFile), Charset.forName("GBK"));
        File dir = new File(folder);
        File[] fs = dir.listFiles();
        byte[] buf = null;
        if (fs != null) {
            for (File f : fs) {
                //如果是文件夹，打包子文件
                if(f.isDirectory()){
                    for (File f_2 : f.listFiles()) {
                        String[] path = f_2.getPath().split("\\\\");
                        String real_name = path[path.length-2]+File.separator+path[path.length-1];
                        zipout.putNextEntry(new ZipEntry(real_name));
                        FileInputStream fileInputStream = new FileInputStream(f_2);
                        buf = new byte[2048];
                        BufferedInputStream origin = new BufferedInputStream(fileInputStream, 2048);
                        int len;
                        while ((len = origin.read(buf, 0, 2048)) != -1) {
                            zipout.write(buf, 0, len);
                        }
                        zipout.flush();
                        origin.close();
                        fileInputStream.close();
                    }
                }
                //是文件，直接打包
                else{
                    zipout.putNextEntry(new ZipEntry(f.getName()));
                    FileInputStream fileInputStream = new FileInputStream(f);
                    buf = new byte[2048];
                    BufferedInputStream origin = new BufferedInputStream(fileInputStream, 2048);
                    int len;
                    while ((len = origin.read(buf, 0, 2048)) != -1) {
                        zipout.write(buf, 0, len);
                    }

                    zipout.flush();
                    origin.close();
                    fileInputStream.close();
                }
            }
        }
        zipout.flush();
        zipout.close();
    }
    /**
     * 导出
     * @param response
     * @param auto_name
     * @throws IOException
     */
    public static void downloadFile(HttpServletResponse response, StringBuilder uri, String auto_name)
            throws IOException {
        //获取服务其上的文件名称
        StringBuffer filename = new StringBuffer();
        filename.append(uri);
        File file = new File(filename.toString());
        StringBuffer sb = new StringBuffer();
        sb.append("attachment;  filename=").append(auto_name+ ".zip");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        response.setContentType("application/x-msdownload;charset=UTF-8");
        response.setHeader("Content-Disposition", new String(sb.toString().getBytes(), "UTF-8"));
        //将此文件流写入到response输出流中
        FileInputStream inputStream = new FileInputStream(file);
        OutputStream outputStream = response.getOutputStream();
        byte[] buffer = new byte[1024];
        int i = -1;
        while ((i = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, i);
        }
        outputStream.flush();
        outputStream.close();
        inputStream.close();
    }


    /**
     * 下载图片
     * @param urlString
     * @param filename
     * @param savePath
     * @throws Exception
     */
    public static void PicDownload(String urlString, String filename,String savePath) throws Exception {
        // 构造URL
        URL url = new URL(urlString);
        // 打开连接
        URLConnection con = url.openConnection();
        //设置请求超时为5s
        con.setConnectTimeout(5*1000);
        // 输入流
        InputStream is = con.getInputStream();

        // 1K的数据缓冲
        byte[] bs = new byte[1024];
        // 读取到的数据长度
        int len;
        // 输出的文件流
        File sf=new File(savePath);
        if(!sf.exists()){
            sf.mkdirs();
        }
        OutputStream os = new FileOutputStream(sf.getPath()+"\\"+filename);
        // 开始读取
        while ((len = is.read(bs)) != -1) {
            os.write(bs, 0, len);
        }
        // 完毕，关闭所有链接
        os.close();
        is.close();
    }


}
