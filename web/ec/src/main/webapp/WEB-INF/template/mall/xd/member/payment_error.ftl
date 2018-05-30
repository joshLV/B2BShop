<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单支付-请选择支付方式</title>
<link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"payment_error"
};
</script>
</head>
<body>
<#include "mall/xd/shortcut.ftl"/>
<style>
.header {padding: 20px 0 10px;}
#logo {padding-left: 5px;float: left}
.progress {padding-top: 6px;}

.orderbody {border-top: 2px solid #7ABD54;background-color: #F3FDED;}
.orderbody .mc {padding: 19px 20px 18px;}
.orderbody .mc {padding-left: 46px;position: relative;}
.icon-succ04, .icon-quer04, .icon-error05 {display: inline-block;width: 16px;height: 16px;vertical-align: middle;}
.icon-succ04 {background-image: url(${base}/static/mall/img/icon-succ.png);}
.orderbody .icon-succ04, .orderbody .icon-error05 {margin-left: -26px;float: left;}
.orderinfo {float: left;color: #7ABD54;margin-right: 15px;}
.list-orderinfo, .list-orderinfo01 {overflow: hidden;}
.list-orderinfo li, .list-orderinfo01 li {float: left;border-right: 1px solid #CCCCCC;margin-right: 7px;padding-right: 7px;}
.list-orderinfo .li-last, .list-orderinfo01 .li-last {border-right: none;}
.list-orderinfo strong.ftx-01 {font-size: 12px;}
.list-orderinfo .ftx-01 {font-size: 16px;}
.ftx-01, a.flk-01:link, a.flk-01:visited, .flk-01 a:link, .flk-01 a:visited {color: #E4393C;}
.mb-tip, .mb-tip01 {color: #999999;margin-top: 4px;}
.ftx-04, a.flk-04:link, a.flk-04:visited, .flk-04 a:link, .flk-04 a:visited {color: #ff6600;}


</style>

<style>

</style>
    
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/xd/img/logo.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="clr"></div>
</div>


<style>
.banking {border: 3px solid #EDD28B;background-color: #FFFDEE;padding: 18px;}
.tit-sub {margin-bottom: 10px;}
.tit-sub strong {font: normal 18px "microsoft yahei";margin-right: 6px;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

.list-pay{height:68px;}
.list-pay li {height:60px;width: 168px;float:left;border-bottom: 1px solid #FBE7B3;background-color: #ffffff;margin-right: 20px;padding-left: 20px;padding-right: 20px;zoom: 1;cursor: pointer;}
.list-pay li:hover, .list-pay .select {-webkit-box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);-moz-box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);position: relative;}
.list-pay li .item {margin-right: 10px;float: left;padding-top: 16px;padding-bottom: 16px;}
.list-pay li .item .radio {position: relative;top: 7px;margin-right: 5px;}
.list-pay li .item label {margin-right: 5px;}

.list-pay .select {
border: 3px solid #e4393c;
padding-left: 17px;
padding-right: 17px;
z-index: 1;
}

.btns {margin-top:10px;}
.btn-next {margin-right: 10px;cursor: pointer;}
.btn-next:hover {background-position: 0 -38px;}
.btn-next {background: url(${base}/static/mall/img/btn-next.png) no-repeat;width: 134px;height: 37px;display: none;line-height: 100px;font-size: 0;overflow: hidden;display: inline-block;border: none;vertical-align: middle;}

</style>

<div class="content">
	<div class="m orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<h3 class="orderinfo">支付失败！</h3>
			<ul class="list-orderinfo">
				<li>订单号：123123</li>
				<li class="li-last">应付金额：<strong class="ftx-01">10000</strong> 元</li>
			</ul>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="clr"></div>
</div>

<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
/*宽屏设置*/
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

$(function(){
		
});
</script>
</body>
</html>