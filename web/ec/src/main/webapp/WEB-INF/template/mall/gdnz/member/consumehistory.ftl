<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>消费记录</title>
<meta name="description" content="消费记录">
<meta name="Keywords" content="消费记录">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding:10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width:195px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width:1000px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

.mod-main {/*padding: 10px;*/margin-bottom: 10px;}
.right .mtop{border: 1px solid #E8E8E8; /*border-bottom: 2px solid #C30000;*/ height: 40px; line-height: 40px; color: #333; padding-left: 10px; background: #F5F5F5;}
.mbot{border: 1px solid #E8E8E8; border-top: none; padding: 15px;}
/*.mod-comm {padding: 10px 20px 20px;}*/
.mod-comm .mc {line-height: 20px;overflow: visible; }
.fl {float: left;}
.user-info-cont .num {margin: 0 5px;}
.user-info-cont strong {font-size: 16px;font-family: "microsoft yahei";}
.ftx01, .ftx-01 {color: #ea5313;}
.ftx-05 {color: #005ea7;}
.ml20 {margin-left: 20px;}
.mod-comm .mt {padding: 10px 0;}
.mod-main .mt .extra-l {float: left;}
.lefta-box .mt .extra-l li {padding: 0;padding-right: 20px;}
.mod-main .mt .extra-l li {float: left;}
.mod-main .mt .extra-l li a.curr {
	padding-bottom: 0;
	color: #ea5313;
	border-bottom: 2px solid #ea5313;
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
.mt10 {/*margin-top: 10px;*/}
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
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;消费记录<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
	<#import "mall/gdnz/member/menu.ftl" as memu>
		<@memu.menu id="xfjl"/>
	</div><!--left end-->
	<div class="right">
		<div class="mod-main mod-comm">
			<div class="mtop"><h3>消费记录</h3></div>
			<div class="mbot">
				<div class="mc">
					<div class="clearfix mt10 user-info-cont" id="">
						<div class="fl">
							<#assign totalPrice = 0>
							<#list orderList as list>
								<#assign price = (list.totalAmount?number)>
								<#assign totalPrice = totalPrice+price>
							</#list>
							最近20笔消费金额总数：<strong class="ftx01 num">￥${totalPrice}</strong>
							<!--会员等级暂时屏蔽 等后端涉及完成后开放 Auth:zhangqiang Time:2015-09-25 09:15:35 Start -->
							<!--<a href="" class="ftx-05 ml20">查看您的会员级别</a>-->
							<!--会员等级暂时屏蔽 等后端涉及完成后开放 Auth:zhangqiang Time:2015-09-25 09:15:35 End -->
						</div>
					</div>
				</div>
                <div class="mod-main mod-comm lefta-box" id="xfnotes2">
                    <div class="mt">
                        <ul class="extra-l">
                            <li class="fore-1"><s></s><b></b><a class="curr" href="">近20条消费记录</a></li>
                        </ul>
                    </div>
                    <div class="mc">
                        <div class="tb-void">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                <tr>
                                    <th width="200">时间</th>
                                    <th width="150">订单号</th>
                                    <th width="150">消费金额</th>
                                    <th>备注</th>
                                </tr>
							<#if orderList?? && orderList?size &gt; 0 >
								<#list orderList as list>
                                <tr>
                                    <td>${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td><a href="${base}/order/view/${list.id}.html">${(list.orderSn)!}</a></td>
                                    <td><div class="ar">￥${(list.totalAmount)!}</div></td>
                                    <td><div class="baklist">订单${(list.orderSn)!}完成</div></td>
                                </tr>
								</#list>
							<#else>
                            <tr>
                                <td colspan="4">
                                    <div class="nocont-box nocont-order">
                                        <b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
                                    </div>
                                </td>
                            </tr>
							</#if>
                                </tbody>
                            </table>
                        </div>

                        <#--<div class="mymoney_pages f-cb" >
                            <div class="pagin fr">
							<#if pager!false && pager.list?size &gt; 0>
								<#import "mall/gwq/pager.ftl" as p>
								<@p.pager pager = pager baseUrl = "/member/consumehistory/list.html" />
							<#else>
                                <div class="noRecord">你还没有订单！</div>
							</#if>
                            </div>
                        </div>-->


                    </div>
                </div>
			</div>
		</div>

	    <div class="clr"></div>
	</div><!--right end-->
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