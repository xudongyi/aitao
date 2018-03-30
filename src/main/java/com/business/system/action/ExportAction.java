package com.business.system.action;

import au.com.bytecode.opencsv.CSVWriter;
import com.business.system.bean.*;
import com.business.system.service.CsvWriter;
import net.sf.rose.initial.BootStart;
import net.sf.rose.jdbc.KeyGenerator;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import org.apache.commons.io.output.FileWriterWithEncoding;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;


/**
 * 商品导入导出
 * @author  zhangqiang
 */
@Controller
@RequestMapping("/export")
public class ExportAction {
    /**
     * 导出颜色代码
     */
    public static String Code_Color = "1627207";
    /**
     * 导出尺寸代码
     */
    public static String Code_Size = "5569827";
    /**
     * 导出品牌代码,暂时默认一个
     */
    public static String Code_Brand = "20000";

    /**
     *图片服务器地址
     */
    public static String Pic_Address = "http://139.196.225.100:8090/imglibs/";

    /**
     * 导入商品
     *
     * @param request
     * @param response
     * @param service
     * @throws IOException
     */
    @Transactional
    @ResponseBody
    @RequestMapping("/importgood.do")
    public String updateContract(HttpServletRequest request, HttpServletResponse response, Service service) throws IOException {
        /*int j =new Random().nextInt();

        //获取zip文件中的所有文件，存放到一个list中
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile client_file = multipartRequest.getFile("file");//上传控件
        File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                client_file.getName()+String.valueOf(j));
        client_file.transferTo(tmpFile);

        ZipFile zipFile = new ZipFile(tmpFile,Charset.forName("UTF-8"));
        List<ZipEntry> zipEntryList = new ArrayList<>();  //存放读到的压缩文件所有的内容
        InputStream in = new BufferedInputStream(new FileInputStream(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                client_file.getName()+String.valueOf(j)));
        ZipInputStream zin = new ZipInputStream(in,Charset.forName("UTF-8"));

        ZipEntry ze;
        while ((ze = zin.getNextEntry()) != null) {
            zipEntryList.add(ze);
        }
        zin.closeEntry();
        in.close();

        //读取文件的最后一个，即是CSV文件
        CsvReader csvReader = new CsvReader();
        File tempCSV= new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                "CSV"+String.valueOf(j));
        InputStreamTOFile(  zipFile.getInputStream(zipEntryList.get(zipEntryList.size()-1)),tempCSV);


        //1.读取CSV文件，获取属性名，和对应的属性值
        //以键值对的形势存放到map
        List<String> key_list = new ArrayList<>();//属性名
        List<String> value_list = new ArrayList<>();//值
        try (CsvParser csvParser = csvReader.parse(tempCSV, Charset.forName("GBK"))) {
            CsvRow row;
            while ((row = csvParser.nextRow()) != null) {
                if (row.getFields().contains("宝贝名称")) {
                    key_list = row.getFields();
                }
                if (!row.getFields().contains("version") && !row.getFields().contains("宝贝名称") && !row.getFields().contains("title")) {
                    value_list = row.getFields();
                }
            }
        } catch (Exception e) {
        }
        Map<String, String> result_map = new HashMap<>();
        for (int i = 0; i < key_list.size(); i++) {
            result_map.put(key_list.get(i), value_list.get(i));
        }


        //如果是乱码，格式不支持
        if(!result_map.containsKey("宝贝图片")){
            return "CODE_ERROR";
        }

        //获取宝贝图片，筛选缩略图和sku图,分别存到thumbZipList,skuZipList
        List<ZipEntry> thumbZipList= new ArrayList<>();   //缩略图zipentity合集
        List<ZipEntry> skuZipList= new ArrayList<>();     //sku图zipentity合集

        String[] csv_pic = result_map.get("宝贝图片").split(";");
        int thumb_size =0;
        for(String pic:csv_pic){
            if(pic.split("\\:")[1].equals("1")){
                thumb_size++;
            }
        }

//        for(ZipEntry zipEntry:zipEntryList){
//            for(String pic:csv_pic){
//                if(zipEntry.getName().contains(".tbi")){
//                    String pic_name = zipEntry.getName().split("\\.")[0].split("\\/")[2];
//                    if(pic.contains(pic_name) && pic.split("\\:")[1].equals("1")){
//                        thumbZipList.add(zipEntry);
//                        break;
//                    }
//                    else{
//                        continue;
//                    }
//
//                }
//            }
//        }

//        2.获取相应的商品基本属性，保存商品
        HttpSession session = request.getSession();
        UserBean bean = (UserBean)session.getAttribute("webuser");
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        GoodsBean goodsBean = new GoodsBean();
        goodsBean.setGoodsName(result_map.get("宝贝名称"));
        goodsBean.setSortNo(getGoodSort(service,result_map.get("宝贝类目")).getSortNo());
        goodsBean.setPrice(Double.parseDouble(result_map.get("宝贝价格")));
        goodsBean.setTotalCount(Integer.parseInt(result_map.get("宝贝数量")));
        goodsBean.setSellerNo(bean.getSellerNo());
        goodsBean.setShelfTime(new Date());
        goodsBean.setBrand("品牌1");
//        goodsBean.setImg1(uploadImage(zipFile.getInputStream(thumbZipList.get(0))));
        goodsBean.setImg1(uploadImage(UrlTOInputStream(csv_pic[0].split("\\|")[1])));
        query.createSaveSql(goodsBean);
        dao.update();

        //3.先获取销售属性别名，放入map去重
        String[] propAlias = result_map.get("销售属性别名").split(";");
        Map<String, String> propAlias_map = new HashMap<>();
        for (String s : propAlias) {
            propAlias_map.put(s.split(":")[0] + ":" + s.split(":")[1], s.split(":")[2]);
        }

        //4.获取销售属性组合
        String[] skuProps = result_map.get("销售属性组合").split(";");
        for (int i = 0; i < skuProps.length; i = i + 2) {
            GoodsPriceBean priceBean = new GoodsPriceBean();
            priceBean.setGoodsNo(goodsBean.getGoodsNo());
            priceBean.setPrice(Double.parseDouble(skuProps[i].split(":")[0]));
            priceBean.setTotalCount(Integer.parseInt(skuProps[i].split(":")[1]));
            //获取颜色和尺寸（暂时只有这两种属性）
            if (skuProps[i].split(":")[3].equals(Code_Color)) {
                priceBean.setPrppertityName1("颜色");
            }
            if (skuProps[i].split(":")[3].equals(Code_Size)) {
                priceBean.setPrppertityName1("尺寸");
            }
            priceBean.setPropertityValue1(propAlias_map.get(skuProps[i].split(":")[3] + ":" + skuProps[i].split(":")[4]));

            if (skuProps[i + 1].split(":")[0].equals(Code_Color)) {
                priceBean.setPrppertityName2("颜色");
            }
            if (skuProps[i + 1].split(":")[0].equals(Code_Size)) {
                priceBean.setPrppertityName2("尺寸");
            }
            priceBean.setPropertityValue2(propAlias_map.get(skuProps[i + 1]));
            query.createSaveSql(priceBean);
            dao.update();
        }


        //5.保存缩略图片到goodfile,filetype=1

        for(int k =0;k<thumb_size;k++){
            GoodsFileBean goodsFileBean = new GoodsFileBean();
            goodsFileBean.setGoodsNo(goodsBean.getGoodsNo());
            goodsFileBean.setFileType("1");
            goodsFileBean.setFileUrl(uploadImage(UrlTOInputStream(csv_pic[k].split("\\|")[1])));
//            goodsFileBean.setFileUrl(uploadImage(zipFile.getInputStream(thumbZipList.get(k))));
            goodsFileBean.setFileOrder(k);
            goodsFileBean.setUpdateTime(new Timestamp(System.currentTimeMillis()));
            goodsFileBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
            goodsFileBean.setCreateUser(bean.getSellerNo());
            goodsFileBean.setUpdateUser(bean.getSellerNo());
            query.createSaveSql(goodsFileBean);
            dao.update();
        }

        //6.保存宝贝描述到goodfile,filetype=2
        String[] main_pic = result_map.get("宝贝描述").split("<img src=\"");
        for (String pic : main_pic) {
            if(pic.length()>1){
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~"+pic);
                int m=0;
                pic = pic.substring(0,pic.length()-11);
                GoodsFileBean goodsFileBean = new GoodsFileBean();
                goodsFileBean.setGoodsNo(goodsBean.getGoodsNo());
                goodsFileBean.setFileType("2");
                goodsFileBean.setFileUrl(uploadImage(UrlTOInputStream(pic)));
                goodsFileBean.setFileOrder(m);
                goodsFileBean.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                goodsFileBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
                goodsFileBean.setCreateUser(bean.getSellerNo());
                goodsFileBean.setUpdateUser(bean.getSellerNo());
                query.createSaveSql(goodsFileBean);
                dao.update();
                m++;
            }
        }*/

        return "success";
    }


    /**
     * 导出商品
     *
     * @param request
     * @param response
     * @param service
     * @param id
     * @throws Exception
     */
    @RequestMapping("/exportgood.do")
    public void exportAllCsv(HttpServletRequest request, HttpServletResponse response, Service service, String id) throws Exception {
        try {
            //服务器生成一个临时文件，存放要打包的数据
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String auto_name = sdf.format(new Date()).toString(); //以时间设置一个名称
            CSVWriter writer = null;
            String folder = request.getSession().getServletContext().getRealPath("/") + auto_name;
            File myfolder = new File(folder);
            myfolder.mkdir();

            //CSV文件
            File csv_f = new File(myfolder + File.separator + auto_name + ".csv");
            if (csv_f.exists()) {
                csv_f.delete();
            } else {
                csv_f.createNewFile();
            }


            //表头
            String[] header1 = {"title", "cid", "cateProps", "price", "num", "description", "picture", "skuProps", "propAlias"};
            String[] header2 = {"宝贝名称", "宝贝类目", "宝贝属性", "宝贝价格", "宝贝数量", "宝贝描述", "宝贝图片", "销售属性组合", "销售属性别名"};

            //内容开始
            StringBuilder cateProps = new StringBuilder();   //宝贝属性拼接字段
            StringBuilder skuProps = new StringBuilder();    //销售属性组合拼接字段
            StringBuilder propAlias = new StringBuilder();   //销售属性别名拼接字段
            StringBuilder picture = new StringBuilder();   //宝贝图片拼接字段
            StringBuilder main_pic = new StringBuilder();   // 内容图片拼接字段


            Map<String, String> sku_map = new HashMap<>();   //存放sku代码，保证相同的属性用相同的代码

            //1.根据id获取对应的产品
            BeanDAO dao = new BeanDAO(service);
            BeanSQL query = dao.getQuerySQL();
            query.setEntityClass(GoodsBean.class);
            query.createSql(id);
            GoodsBean good = dao.load();

            //2.获取该产品的sku,并增加到宝贝属性，销售属性，销售属性别名,宝贝图片
            query.setEntityClass(GoodsPriceBean.class);
            query.createSql("goodsNo", id);
            List<GoodsPriceBean> price_list = dao.list();

            //图片路径
            String pic_path = myfolder + File.separator + auto_name + File.separator;


            //good-file,即缩略图
            query.setEntityClass(GoodsFileBean.class);
            Map<String, Object> params = new HashMap<>();
            params.put("goodsNo",good.getGoodsNo());
            params.put("fileType","1");
            query.createSql(params);
            List<GoodsFileBean> goodsFileBeanList = dao.list();

            //生成相应的图片名称个数
            List<String> pic_name = new ArrayList<>();
            for(int i =0;i<price_list.size()+goodsFileBeanList.size()+1;i++){
                pic_name.add(KeyGenerator.getSystemUUID());
            }

            //good--img1图片
            picture.append(pic_name.get(0) + ":1:0:|" + Pic_Address+good.getImg1() + ";");
            CsvWriter.PicDownload(Pic_Address+good.getImg1(), pic_name.get(0)+".tbi",pic_path);

            //good-file缩略图
            for (int i =0;i<goodsFileBeanList.size();i++) {
                picture.append(pic_name.get(i+1) + ":1:"+String.valueOf(i+1)+":|" + Pic_Address+goodsFileBeanList.get(i).getFileUrl() + ";");
                CsvWriter.PicDownload(Pic_Address+goodsFileBeanList.get(i).getFileUrl(), pic_name.get(i+1)+".tbi",pic_path);
            }


            for (int i =0;i<price_list.size();i++) {
                GoodsPriceBean g_price = price_list.get(i);
                Map<String, String> map = new HashMap<>();
                map.put(g_price.getPrppertityName1(), g_price.getPropertityValue1());
                map.put(g_price.getPrppertityName2(), g_price.getPropertityValue2());
                map.put(g_price.getPrppertityName3(), g_price.getPropertityValue3());
                map.put(g_price.getPrppertityName4(), g_price.getPropertityValue4());
                String color = Code_Color + ":" + Rdm(5);
                String size = Code_Size + ":" + Rdm(7);
                String brand = Code_Brand + ":" + Rdm(9);
                //放入map，保证值唯一
                if (!sku_map.containsKey(map.get("颜色"))) {
                    sku_map.put(map.get("颜色"), color);
                }
                if (!sku_map.containsKey(map.get("尺寸"))) {
                    sku_map.put(map.get("尺寸"), size);
                }
                color = sku_map.get(map.get("颜色"));
                size = sku_map.get(map.get("尺寸"));

                //宝贝属性
                cateProps.append(brand + ";" + color + ";" + size + ";");
                //销售属性别名
                if(map.containsKey("颜色")){
                    propAlias.append(color + ":" + map.get("颜色") + ";");
                }
                if(map.containsKey("尺寸")){
                    propAlias.append(size + ":" + map.get("尺寸") + ";");
                }
                //属性销售组合
                skuProps.append(g_price.getPrice() + ":" + g_price.getTotalCount() + "::" + color + ";" + size + ";");

                //宝贝图片
                if(StringUtils.isNotEmpty(g_price.getImg())) {
                    picture.append(pic_name.get(i+goodsFileBeanList.size()+1) + ":2:0:" + color + "|" + g_price.getImg() + ";");
                    CsvWriter.PicDownload(g_price.getImg(), pic_name.get(i+goodsFileBeanList.size()+1)+".tbi",pic_path);
                }
                else{
                    //没有设置，导出的时，用缩略图当sku图片
                    picture.append(pic_name.get(i+goodsFileBeanList.size()+1) + ":2:0:" + color + "|" + Pic_Address+goodsFileBeanList.get(0).getFileUrl() + ";");
                    CsvWriter.PicDownload(Pic_Address+goodsFileBeanList.get(0).getFileUrl(), pic_name.get(i+goodsFileBeanList.size()+1)+".tbi",pic_path);
                }
            }


            query.setEntityClass(GoodsFileBean.class);
            Map<String, Object> params2 = new HashMap<>();
            params2.put("goodsNo",good.getGoodsNo());
            params2.put("fileType","2");
            query.createSql(params2);
            List<GoodsFileBean> goodsFilePicList = dao.list();

            for(GoodsFileBean goodFile :goodsFilePicList){
                main_pic.append("<img src=\"" + Pic_Address+goodFile.getFileUrl() + "\" alt=\"\" />");
            }

            List<String> dataList = new ArrayList<>();
            List<String[]> dataString = new ArrayList<>();
            dataList.add(good.getGoodsName());
            dataList.add(getGoodSortNo(service,good.getSortNo()).getSortCode());
            dataList.add(cateProps.toString());
            dataList.add(String.valueOf(good.getMarketPrice()));
            dataList.add(String.valueOf(good.getTotalCount()));
            dataList.add(main_pic.toString());
            dataList.add(picture.toString());
            dataList.add(skuProps.toString());
            dataList.add(propAlias.toString());

            //list转stirng[]
            String[] str_list = dataList.toArray(new String[dataList.size()]);
            dataString.add(str_list);
            //生成CSV并写入
            writer = new CSVWriter(new FileWriterWithEncoding(csv_f,Charset.forName("GBK")));
            writer.writeNext(header1);
            writer.writeNext(header2);
            writer.writeAll(dataString);
            writer.close();

            CsvWriter.zipFile(folder);//打包文件，folder是之前获取的文件夹路径
            StringBuilder uri = new StringBuilder();
            uri.append(folder);
            uri.append(".zip");
            CsvWriter.downloadFile(response, uri,auto_name);//去下载zip文件
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 随即生成n位数字
     */
    public static String Rdm(int number) {
        Random random = new Random();
        String result = "";
        for (int i = 0; i < number; i++) {
            result += random.nextInt(10);
        }
        return result;
    }


    /**
     *inputstream转file
     */
    public static void InputStreamTOFile(InputStream ins,File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 将InputStream转换成byte数组
     * @param in InputStream
     * @return byte[]
     * @throws IOException
     */
    public static byte[] InputStreamTOByte(InputStream in) throws IOException{

        int BUFFER_SIZE = 4096;
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] data = new byte[BUFFER_SIZE];
        int count = -1;
        while((count = in.read(data,0,BUFFER_SIZE)) != -1)
            outStream.write(data, 0, count);

        data = null;
        return outStream.toByteArray();
    }


    public static InputStream UrlTOInputStream(String path) {
        URL url = null;
        InputStream is =null;
        try {
            url = new URL(path);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        try {
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();//利用HttpURLConnection对象,我们可以从网络中获取网页数据.
            conn.setDoInput(true);
            conn.connect();
            is = conn.getInputStream(); //得到网络返回的输入流

        } catch (Exception e) {
            e.printStackTrace();
        }
        return is;
    }


    /**
     * 上传图片
     */
    public static String uploadImage(InputStream bytes) throws IOException {
        String OS = System.getProperty("os.name").toLowerCase();

        String ctxPath = "";
        if (OS.indexOf("linux") >= 0) {
            ctxPath = "/usr/local/app/appserver-01/webapps/imglibs";
        } else if (OS.indexOf("windows") >= 0) {
            ctxPath = BootStart.WINDOWS_PATH;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        String ymd = sdf.format(new Date());
        ctxPath += File.separator + ymd + File.separator;
        // 创建文件夹
        File file = new File(ctxPath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String fileName = ".jpg";
        UUID uuid = null;
        uuid = UUID.randomUUID();
        File uploadFile = new File(ctxPath + uuid + fileName);

        BufferedInputStream is = new BufferedInputStream(bytes);
        BufferedOutputStream dest = null;
        byte data[] = new byte[4096];
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(uploadFile);
            dest= new BufferedOutputStream(fos, 4096);
            int count = -1;
            while ((count = is.read(data, 0, 4096)) != -1) {
                dest.write(data, 0, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dest.flush();
            dest.close();
            is.close();
        }
            String path = ymd + "/" + uuid + fileName;
            return path;
        }


    //sort查询sortNo
    private GoodsSortBean getGoodSort(Service service, String sortCode) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsSortBean.class);
        query.createSql("sortCode",sortCode);
        GoodsSortBean goodsort = (GoodsSortBean) dao.list().get(0);
        return  goodsort;
    }

    //sortNo查询sort
    private GoodsSortBean getGoodSortNo(Service service,String sortNo) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsSortBean.class);
        query.createSql("sortNo",sortNo);
        GoodsSortBean goodsort = (GoodsSortBean) dao.list().get(0);
        return  goodsort;
    }



}
