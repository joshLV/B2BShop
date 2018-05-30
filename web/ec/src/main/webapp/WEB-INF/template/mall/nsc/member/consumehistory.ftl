<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>消费记录</title>
<meta name="description" content="消费记录">
<meta name="Keywords" content="消费记录">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
	<link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="g-hd">
	<#include "${path}/shortcut.ftl"/>
        <#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
<style>
    .content{width: 100%;margin-top: 20px; }
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 1030px; border: 1px solid #cccccc;}

.widepage .right {width: 980px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

.mod-main {padding: 10px;margin-bottom: 10px;}
.mod-comm {padding: 10px 20px 20px;}
.mod-comm .mc {line-height: 20px;overflow: visible;}
.fl {float: left;}
.user-info-cont .num {margin: 0 5px;}
.user-info-cont strong {font-size: 16px;font-family: "microsoft yahei";}
.ftx01, .ftx-01 {color: #e4393c;}
.ftx-05 {color: #005ea7;}
.ml20 {margin-left: 20px;}
.mod-comm .mt {padding: 10px 0;}
.mod-main .mt .extra-l {float: left;}
.lefta-box .mt .extra-l li {padding: 0;padding-right: 20px;}
.mod-main .mt .extra-l li {float: left;padding-left: 20px;}
.mod-main .mt .extra-l li a.curr {
	padding-bottom: 0;
	color: #2e970f;
	border-bottom: 2px solid #2e970f;
	font-weight: 700;
	cursor: default;
	text-decoration: none;
	}
.mod-comm .mc {line-height: 20px;}
.mod-main .mc {overflow: visible;}
.tb-void {
	line-height: 18px;
	text-align: center;
	border: 1px solid #f2f2f2;
	border-top: 0;
	color: #333;
	width: 100%;
	}
.tb-void th {
	background: #f5f5f5;
	height: 32px;
	line-height: 32px;
	padding: 0 5px;
	text-align: center;
	font-weight: 400;
	}
.tb-void td {
	border: 1px solid #f2f2f2;
	padding: 10px 5px;
	}
.mt10 {margin-top: 10px;}
.clearfix {display: block;}
.ar {text-align: center;}
</style>

<style>
.ftx-04 {color: #ff6600;}

/**pagin**/
.pagin a,.pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .text,.pagin .current {border: 0;padding: 4px 11px;}
.pagin a:link,.pagin a:visited {color: #005aa0;}
.pagin a:hover,.pagin a:active {background: #005aa0;color: #fff;text-decoration: none;}
.pagin .current,.pagin .current:link,.pagin .current:visited {color: #ffffff;font-weight: 700;}
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
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;消费记录<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/jd/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		<div class="mod-main mod-comm">
			<div class="mc">
				<div class="clearfix mt10 user-info-cont" id="">
					<div class="fl">
						<#assign totalPrice = 0>
						<#list orderList as list>
							<#assign price = (list.totalAmount?number)>
							<#assign totalPrice = totalPrice+price>
						</#list>
						近三个月实际消费金额：<strong class="ftx01 num">￥${totalPrice}</strong>
						<a href="" class="ftx-05 ml20">查看您的会员级别</a>
					</div>
				</div>
			</div>
		</div>
		<div class="mod-main mod-comm lefta-box" id="xfnotes2">
			<div class="mt">
				<ul class="extra-l">
					<li class="fore-1"><s></s><b></b><a class="curr" href="">近三个月记录</a></li>
				</ul>
			</div>
			<div class="mc">
				<div class="tb-void">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
						<tr>
								<th width="180">时间</th>
								<th width="125">涉及订单号</th>
								<th width="125">消费额扣减</th>
								<th width="125">消费额增加</th>
								<th>备注</th>
						</tr>
						<#list orderList as list>
							<tr>
                                <td>${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
								<td>${(list.orderSn)!}</td>
								<td><div class="ar">-</div></td>
								<td><div class="ar">￥${(list.totalAmount)!}</div></td>
								<td><div class="baklist">订单${(list.orderSn)!}完成</div></td>
	                        </tr>
                        </#list>
						</tbody>
					</table>
				</div>
				<div class="mt10 clearfix">
					<div class="pagin pagin-m fr">
	            		<div id="pagin-box">
							<div class="pagin pagin-m fr">
							<span class="prev-disabled">首页</span>
							<span class="prev-disabled">上一页<b></b></span>
							<a class="current">1</a>
							<span class="next-disabled">下一页<b></b></span>
							<span class="next-disabled">末页</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	    <div class="clr"></div>
	</div><!--right end-->
</div>
	</div>
	<#include "${path}/service.ftl"/>
    </div>
<#include "${path}/footer.ftl"/>
</div>

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
</script>
</body>
</html>