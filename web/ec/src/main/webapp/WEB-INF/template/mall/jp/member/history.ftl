<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>浏览历史</title>
<meta name="description" content="浏览历史">
<meta name="Keywords" content="浏览历史">
<link href="${base}/static/mall/jp/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/jp/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"history"
};
</script>
</head>
<body>
<#include "mall/jp/shortcut.ftl"/>
<#include "mall/jp/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 195px;margin-right: 10px;}
.right {float: right;width: 820px;}

.widepage .right {width:1000px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

#right .mt {
	position: relative;
	background: #efefef;
	height: 41px;
	padding: 0 12px 0 6px;
}
#right .mt .icon-left {
	position: absolute;
	top: 0;
	left: 0;
	background: url(${base}/static/mall/img/short1.jpg) -100px -82px no-repeat;
	height: 41px;
	width: 4px;
}
#right .mt h2 {
	font-size: 12px;
	color: #333333;
	float: left;
	width: 104px;
	text-align: center;
	height: 32px;
	line-height: 32px;
	text-align: center;
	margin: 4px 10px 0 0;
}
#right .mt .extra {
	float: right;
	overflow: hidden;
}
#right .mt .extra .empty {
	color: #323333;
	background:#fcfcfc;
	border: 1px solid #dcdcdc;
	border-radius: 3px;
	width: 120px;
	text-align: center;
	height: 25px;
	line-height: 25px;
	float: left;
	margin: 8px 10px 0 0;
}
#right .mt .icon-right {
	position: absolute;
	top: 0;
	right: 0;
	background: url(${base}/static/mall/img/short1.jpg) -110px -82px no-repeat;
	height: 41px;
	width: 10px;
}
#right .mc .item {
	border-bottom: 4px solid #efefef;
	overflow: hidden;
	zoom: 1;
}
#mc .dity {
float: left;
border-left: 4px solid #efefef;
overflow: hidden;
    border-right: 4px solid #efefef;
}
#mc .mod {
	border-bottom: 1px dashed #c7c7c7;
	zoom: 1;
	overflow: hidden;
	padding-left: 10px;
}
#mc .p-img {
	float: left;
	width: 130px;
	height: 130px;
	padding: 5px 10px;
	border: 1px solid #E8E8E8;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 10px;
}
#mc .i-it {
	width: 982px;
	position: relative;
	margin-top: 12px;
}
#mc h3 {
	font-size: 14px;
	line-height: 30px;
	height: 30px;
	overflow: hidden;
	width: 500px;
}
#mc .p-price {
	color: #999999;
	margin-top: 5px;
}
#mc strong {
	font-weight: normal;
	color: #999999;
	font-family: "宋体";
}
#mc font {
	color: #cc0000;
	font-weight: bold;
	font-size: 14px;
	padding-right: 20px;
}
#mc del {
	text-decoration: line-through;
}
#mc .buton {
	position: absolute;
	top: 10px;
	right: 20px;
	width: 94px;
}
#mc .buton .buy {
	background: #db0000;
	border-radius: 3px;
	width:87px;
	height: 25px;
	line-height: 25px;
	display: block;
	padding-left: 7px;
	color: #FFF;
}
#mc .pay {
	display: none;
	margin-bottom: 8px;
	cursor: pointer;
	background: url(${base}/static/mall/img/short1.jpg) 0 -137px no-repeat;
	width: 77px;
	padding-left: 24px;
	height: 25px;
	line-height: 25px;
	display: block;
	margin-top: 10px;
	border: none;
}
#mc .buton .buy-new img{padding-right: 3px;}

#mc .buton .buy-new {
    background:#b2b2b2;
    border-radius: 3px;
    width: 87px;
    padding-left: 7px;
    height: 25px;
    line-height: 25px;
    display: block;
    color: #FFF;
}
#mc .buton .buy-new:hover{text-decoration: none;}
.delet{width: 94px; text-align: center; display: block; height: 24px; line-height: 24px;}
</style>

<style>
.ftx-04 {color: #ff6600;}

/**pagin**/
.pagin a,.pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .text,.pagin .current {border: 0;padding: 4px 11px;}
.pagin a:link,.pagin a:visited {color: #005aa0;}
.pagin a:hover,.pagin a:active {background: #005aa0;color: #fff;text-decoration: none;}
.pagin .current,.pagin .current:link,.pagin .current:visited {color: #f60;font-weight: 700;}
.pagin b {display: block;position: absolute;top: 9px;width: 5px;height: 9px;background-image: url(${base}/static/mall/img/bg5.gif);background-repeat: no-repeat;overflow: hidden;}
.pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin .prev-disabled,.pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev,.pagin .prev-disabled {padding-left: 12px;}
.pagin .prev b {left: 3px;background-position: -68px -608px;}
.pagin .prev-disabled b {left: 3px;background-position: -80px -608px;}
.pagin .next,.pagin .next-disabled {padding-right: 12px;}
.pagin .next b {right: 3px;background-position: -62px -608px;}
.pagin .next-disabled b {right: 3px;background-position: -74px -608px;}
.pagin-m a,.pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
.pagin-m b {top: 5px;}
.pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled {padding-top: 3px;height: 14px;line-height: 14px;*line-height: 16px;}
</style>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;浏览历史<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
	<#import "mall/jp/member/menu.ftl" as memu>
		<@memu.menu id="llls"/>
	</div><!--left end-->
	<div class="right" id="right">
		<div class="mt">
        	<div class="icon-left"></div>
            <h2>浏览历史</h2>
            <div class="extra">
                    <a onclick="javascript:deleteAll();" href="javascript:void(0);" class="empty">清空浏览历史</a></div>
            <div class="icon-right"></div>
        </div>
        <div class="mc" id="mc">                   
            <div class="item">
                <ul id="recenthistory">
				<#if hisList?? && hisList?size &gt; 0 >
                <#list hisList as his>                        
                <li id="${his.id}" order="0">
                	<div class="dity">
	                    <div class="mod">
	                        <div class="p-img">
	                            <a href="${base}/item/${his.goodsId}.html" target="_blank"><img width="130" height="130" src="${his.image}" class="err-product"></a>
	                        </div>
	                        <div class="i-it">
	                            <h3><a href="${base}/item/${his.goodsId}.html" target="_blank" >${his.name}</a></h3>
	                            <div class="p-price">
	                                <strong>商城价：</strong>
									<font>
										<#if his.price == '0.00'>
                                            价格面议
										<#else>
                                            ￥${his.price}
										</#if>
									</font>
									<#if his.marketPrice != '0.00'>
                                        <strong>市场价：</strong>
                                        <del>￥${his.marketPrice}</del>
									</#if>
	                            </div>
	                            <div class="buton">
									<#if his.price == '0.00'>
                                        <a class="buy-new" ><img src="${base}/static/mall/img/gwc_icon.png"> 加入购物车</a>
									<#else>
                                        <a href="javascript:void(0);" onclick="addCart('${his.goodsId}');" class="buy" ><img src="${base}/static/mall/img/gwc_icon.png"> 加入购物车</a>
									</#if>
	                                <#--<a href="javascript:void(0);" onclick="addCart('${his.goodsId}');" class="buy" target="_blank" >加入购物车</a>-->
	                                <#--<a onclick="javascript:deleteOne('${his.id}');" href="javascript:void(0);" class="delet" >清除该浏览历史</a>-->
									<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 Start -->

                                    <a onclick="deleteOne('${his.id}');" href="javascript:void(0);" class="delet" >清除该浏览历史</a>
									<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 End -->
	                            </div>
	                        </div>
	                        <span class="clr"></span>
	                    </div>
                    </div>
                </li>
                </#list>
				<#else>
                    <li>
                        <div class="nocont-box nocont-order">
                            <b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
                        </div>
                    </li>
				</#if>
                </ul>
            </div>

            <div class="mymoney_pages f-cb" >
                <div class="pagin fr">
				<#if pager!false && pager.list?size &gt; 0>
					<#import "mall/gwq/pager.ftl" as p>
					<@p.pager pager = pager baseUrl = "/member/history/list.html" />
				<#else>
                    <div class="noRecord">你还没有订单！</div>
				</#if>
                </div>
            </div>


        </div>
    	<div class="clr"></div>
	</div><!--right end-->
</div>
<#include "mall/jp/service.ftl"/>
<#include "mall/jp/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

    });
    function deleteAll(){
	    $.ajax({
	        type: "get",
	        url: "${base}/member/history/ajaxDeleteAllByMemberId",
	        success: function(data) {
	        	if(data.status=='success'){
	        		//刷新本页面
	        		location.replace("${base}/member/history/list");
		        }
	        }
	    });
    }
    function deleteOne(id){
    	$.ajax({
	        type: "get",
	        url: "${base}/member/history/ajaxDeleteHisId",
	        data: "id="+id,
	        success: function(data) {
	        	if(data.status=='success'){
	        		location.reload();
		        }
	        }
	    });
    }
    function addCart(goodsId) {
       window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=1" + "&backurl=" + window.location.href;
    }
</script>
</body>
</html>