<%--
  Created by IntelliJ IDEA.
  User: xudy
  Date: 2017/3/6 0006
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/js/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>京东一键上传导航</title>
    <link rel="stylesheet" href="${ctx}/css/api.css">
    <script src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/js/vue/vue.min.js"></script>
</head>
<body>
<div class="user-info" align="right">
    当前京东用户:<span>jd_雅吖家纺_美工</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">退出</a>
</div>

<fieldset>
    <legend>基本内容编辑（*表示必填）</legend>
    <div class="tooltip require"> 提示:如果同时设置了促销宣传语，此商品标语在前台将会被促销宣传语覆盖！</div>

    <table style="width: 40%">
        <tr>
            <td class="td-title"><span class="require">*</span>商品名称:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">最多输入45个字</td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <div class="tooltip require"> 提示:如果属性和属性值选项不满足业务需要，请联系京东对接运营人员进行修改或添加。</div>
            </td>
        </tr>
        <tr>
            <td class="td-title">商品标语:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">最多输入45个字</td>
        </tr>
        <tr>
            <td class="td-title">加链接的文字:</td>
            <td class="td-input"><input type="text"></td>
        </tr>
        <tr>
            <td class="td-title">链接地址:</td>
            <td class="td-input"><input type="text"></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>品牌:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
            <td class="td-unit">最多输入45个字</td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*7天无理由退货:</span></td>
            <td class="td-input"><select>
                <option value="1">支持</option>
            </select></td>
        </tr>
    </table>

</fieldset>
<fieldset>
    <legend>商品属性</legend>
    <table style="width: 33%">
        <tr>
            <td class="td-title"><span class="require">*</span>窗帘类型:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>材质:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>风格:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>价格:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>尺寸:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">雅阁</option>
            </select></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>帘头款式:</td>
            <td class="td-input"><select>
                <option value="1">支持</option>
            </select></td>
        </tr>
    </table>
</fieldset>

<fieldset>
    <legend>商品信息</legend>
    <div class="tooltip warning">提示:价格的发布和修改有可能会有延迟,如果出现敬请谅解</div>
    <table style="width: 100%">
        <tr>
            <td class="td-title"><span class="require">*</span>京东价:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">元</td>
            <td class="td-title"><span class="require">*</span>商品毛重:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">公斤</td>
            <td class="td-title">货号:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit"></td>
        </tr>
        <tr>
            <td class="td-title"><span class="require">*</span>市场价:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">元</td>
            <td class="td-title"><span class="require">*</span>[包装]长:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">mm</td>
            <td class="td-title">产地:</td>
            <td class="td-input"><select>
                <option value="">请选择</option>
                <option value="1">1111</option>
                <option value="2">22222</option>
            </select></td>
            <td></td>
        </tr>
        <tr>
            <td class="td-title">折扣:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">%</td>
            <td class="td-title"><span class="require">*</span>[包装]宽:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">mm</td>
            <td class="td-title">UPC编码:</td>
            <td class="td-input"><input type="text"></td>
            <td></td>
        </tr>
        <tr>
            <td class="td-title">成本价:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">元</td>
            <td class="td-title"><span class="require">*</span>[包装]高:</td>
            <td class="td-input"><input type="text"></td>
            <td class="td-unit">mm</td>
            <td class="td-title">密度:</td>
            <td class="td-input"><input type="text" disabled></td>
            <td>g/cm3</td>
        </tr>
    </table>
</fieldset>

<fieldset>
    <legend>销售属性</legend>
    <div class="tooltip warning-bg">勾选销售属性后，可修改名称哟</div>
    <div class="tooltip require">★★★因京东的商品结构与淘宝的商品结构不一样，请注意SKU是否勾选，若无勾选会报错“json转换错误”★★★</div>
    <div class="sku-list">
        <div class="sku-name">颜色：</div>
        <table style="width: 98%">
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: red;"></span>
                    <span class="sku-text">红色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #990000;"></span>
                    <span class="sku-text">深红色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #FF9900;"></span>
                    <span class="sku-text">橙色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #FFFF00;"></span>
                    <span class="sku-text">黄色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #FFFF99;"></span>
                    <span class="sku-text">浅黄色</span>
                </td>
            </tr>
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #66CC33;"></span>
                    <span class="sku-text">草绿色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #339933;"></span>
                    <span class="sku-text">绿色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #0099FF;"></span>
                    <span class="sku-text">浅蓝色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #0033CC;"></span>
                    <span class="sku-text">蓝色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #000066;"></span>
                    <span class="sku-text">深蓝色</span>
                </td>
            </tr>
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #CC99FF;"></span>
                    <span class="sku-text">浅紫色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #660066;"></span>
                    <span class="sku-text">紫色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #FF6666;"></span>
                    <span class="sku-text">玫瑰红</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #FF0066;"></span>
                    <span class="sku-text">粉红色</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="color-block" style="background: #CCCC66;"></span>
                    <span class="sku-text">卡其色</span>
                </td>
            </tr>

        </table>
    </div>
    <div class="sku-list">
        <div class="sku-name">尺码：</div>
        <table style="width: 98%">
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">S</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">M</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">L</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">XL</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">XXL</span>
                </td>
            </tr>
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">XXXL</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">4XL</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">5XL</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">6XL</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">7XL</span>
                </td>
            </tr>
            <tr>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">均码</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">34</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">35</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">36</span>
                </td>
                <td class="sku-detial">
                    <input type="checkbox">
                    <span class="sku-text">37</span>
                </td>
            </tr>

        </table>
    </div>

    <!--承载sku的排列组合-->
    <div class="result">
        <table class="result-table">
            <tr></tr>
        </table>
    </div>

</fieldset>

</body>
</html>
