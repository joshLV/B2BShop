<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>品牌旗舰店</title>
<meta name="description" content="品牌旗舰店">
<meta name="Keywords" content="品牌旗舰店">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"memberindex"
};
</script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
    .brands-content{width:1208px; height:auto; margin:0 auto; border:1px solid #e8e8e8; /*border-top:2px solid #ea5313;*/ margin-top: 10px;}
    .link_tit{height:40px; line-height:40px; background:#f5f5f5; border-bottom:1px solid #e8e8e8; font-size:16px; padding-left:15px;}
    /* 品牌旗舰店 */
    .nch-brand-list { margin-top: 20px;}
    .nch-brand-list ul { font-size: 0; *word-spacing:-1px/*IE6、7*/; width: 1208px; margin: 0 auto; padding-left: 12px;}
    .nch-brand-list ul li { vertical-align: top; letter-spacing: normal; word-spacing: normal; display: inline-block; *display: inline/*IE7*/; width: 225px; padding: 0; margin: 0 15px 20px 0; overflow: hidden; *zoom: 1;}
    .nch-brand-list dl { background-color: #FFF; width: 203px; padding:10px; border: solid 1px #E6E6E6; margin: 0 auto; border-radius: 3px; box-shadow: inset 0 0 2px rgba(204,204,204,0.3);padding-bottom: 5px;}
    .nch-brand-list dt a { line-height: 0; background-color: #FFF; text-align: center; vertical-align: middle; display: table-cell; *display: block; width: 210px; height: 110px; overflow: hidden;}
    .nch-brand-list dt a img { max-width:200px; max-height: 110px; margin-top:expression(50-this.height/2); *margin-top:expression(25-this.height/2)/*IE6,7*/;}
    .nch-brand-list dl dd { font-size: 12px; text-align: center; text-overflow: ellipsis; white-space: nowrap; height:30px; /*padding: 4px 0 0 0;*/ line-height:30px; border-bottom: solid 1px #E6E6E6;}
    .code{display:none;width: 100px;height: 100px;background:#CCC; position: absolute; z-index: 9999; bottom: 16px; left:-40px;}
    .code img{ width: 100%; }
    .wx{ position: relative;z-index: 9999;}
    .wx .wx_ico{ width: 18px; height: 18px;}
    .nch-brand-list dl dd:last-child {
        border-bottom: 0;
    }
</style>

<div class="brands-content">
    <h3 class="link_tit">品牌旗舰店</h3>
    <div class="nch-brand-list">
        <ul>
         <#list indexShopList as indexShop>
            <li>
                <dl>
                    <dt>
                        <a href="${base}/shop/${indexShop.urlAddress}.html" title="${indexShop.shopName}" target="_blank" >
                            <img src="${indexShop.pic}" alt="${indexShop.name}">
                        </a>
                    </dt>
                    <dd >
                        <a href="${base}/shop/${indexShop.urlAddress}.html" title="${indexShop.shopName}" target="_blank"  >${indexShop.shopName}</a>
                    </dd>

                    <dd>
                    <#if indexShop.createUser?? && indexShop.createUser != ''>
                        <a href="${base}/shop/${indexShop.urlAddress}.html" title="${indexShop.shopName}" target="_blank"  >${indexShop.createUser}</a>
                    </#if>
                        <#if indexShop.weixinImg??>
                            <a href="javascript:void(0)" onmouseover="display('${indexShop.id}')" onmouseout="disappear('${indexShop.id}')" class="wx">
                                <img src="${base}/static/mall/img/weixin.jpg" alt="微信二维码" align="微信二维码"  class="wx_ico"/>
                                <div class="code" id="${indexShop.id}" onmouseover="display('${indexShop.id}')" onmouseout="disappear('${indexShop.id}')">
                                    <img src="${indexShop.weixinImg}" alt="微信二维码" align="微信二维码" />
                                </div>
                            </a>
                        </#if>
                    </dd>


                </dl>
            </li>
         </#list>
        </ul>
    </div>
</div>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript" >
    <!--
    function display(id){
        document.getElementById(id).style.display="block";
    }
    function disappear(id){
        document.getElementById(id).style.display="none";
    }
    -->
</script>
</body>
</html>