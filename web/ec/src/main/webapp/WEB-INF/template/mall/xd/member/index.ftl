<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员中心</title>
<meta name="description" content="会员中心">
<meta name="Keywords" content="会员中心">
<link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"memberindex"
};
</script>
</head>
<body class="widepage">
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width:195px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width: 1000px;}

/*user-info*/
#user-info {overflow: hidden;background-color: #fff;padding: 10px 10px;border: 1px solid #E8E8E8;}
#user-info a {color: #005ea7}
#user-info a:hover {color: #e4393c;}
#user-info .u-pic {position: relative;z-index: 0;float: left;width: 104px;height: 104px;margin: 5px 10px 0 0;overflow: hidden;text-align: center;}
#user-info .u-pic .face-link {display: none;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;line-height: 30px;overflow: hidden;color: #fff;z-index: 3;}
#user-info .u-pic .face-link-box {display: none;background: #000;z-index: 1;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;opacity: .5;filter: alpha(opacity=50);}
#user-info .u-pic .mask {background: url(${base}/static/mall/img/bg4.png) 0 0;width: 104px;height: 104px;position: absolute;left: 0;top: 0;z-index: 2;}
#user-info .info-m {float: left;/*width: 210px;*/ padding-right: 20px;}
#user-info .info-m .u-name {font-size: 18px;font-family: "microsoft yahei";color: #333;line-height: 28px;margin-bottom: 15px; margin-top: 10px;}
#user-info .info-m .u-name a {color: #000;}
#user-info .info-m .u-name a:hover {color: #e4393c;}
#user-info .info-m .u-signature {color: #999;margin-bottom: 15px;width: 100%;text-overflow: ellipsis;word-wrap: normal;white-space: nowrap;overflow: hidden;}
#user-info .info-m .u-level {margin-bottom: 10px;height: 18px;}
#user-info .info-m .u-level .rank {margin-right: 10px;display: inline-block;height: 17px;line-height: 17px;}
#user-info .info-m .u-level .rank s {background: url(${base}/static/mall/img/rank.gif) repeat 0 0;display: inline-block;height: 17px;margin-right: 5px;text-decoration: none;width: 17px;vertical-align: middle;}
#user-info .info-m .u-level .rank a {display: inline-block;vertical-align: middle;}
#user-info .info-m .u-level .rank.r-register s {background-position: 0 0px;}
#user-info .info-m .u-level .rank.r-copper s {background-position: 0 -17px;}
#user-info .info-m .u-level .rank.r-silver s {background-position: 0 -34px;}
#user-info .info-m .u-level .rank.r-gold s {background-position: 0 -51px;}
#user-info .info-m .u-level .rank.r-diamond s {background-position: 0 -68px;}
#user-info .info-m .u-level .rank.r-vip s {background-position: 0 -85px;}
#user-info .info-m .u-safe {}
#user-info .info-m .u-safe .safe-rank01,#user-info .info-m .u-safe .safe-rank02,#user-info .info-m .u-safe .safe-rank03,#user-info .info-m .u-safe .safe-rank04,#user-info .info-m .u-safe .safe-rank05,#user-info .info-m .u-safe .safe-rank06 {background: url(${base}/static/mall/img/safe-rank.png) no-repeat 0 0;display: inline-block;font-size: 0;height: 14px;line-height: 0;margin-right: 10px;overflow: hidden;vertical-align: middle;width: 68px;}
#user-info .info-m .u-safe .safe-rank02 {background-position: 0 -15px;}
#user-info .info-m .u-safe .safe-rank03 {background-position: 0 -30px;}
#user-info .info-m .u-safe .safe-rank04 {background-position: 0 -45px;}
#user-info .info-m .u-safe .safe-rank05 {background-position: 0 -60px;}
#user-info .info-m .u-safe .safe-rank06 {background-position: 0 -75px;}
#user-info .info-m .u-safe .rank-text {font-weight: 400;margin-right: 5px;}
#user-info .info-m .u-safe .rank-text.ftx-01 {color: #f44e41;}
#user-info .info-m .u-safe .rank-text.ftx-02 {color: #fc9836;}
#user-info .info-m .u-safe .rank-text.ftx-03 {color: #71b247;}
#user-info .acco-info {border-left: 1px dotted #ddd;float: right;margin-top: 10px;}
#user-info .acco-info li {background-color: #fafafa;border-right: 1px dotted #ddd;float: left;padding: 20px 0;height: 56px;width: 80px;text-align: center;line-height: 28px;}
#user-info .acco-info li .total {font-size: 18px;}
#user-info .acco-info li .surplus a {color: #666;}
#user-info .acco-info li .surplus a:hover {color: #e4393c;}
#user-info .acco-info li.fore1 {width: 140px;}
#user-info .acco-info li.fore1 .surplus a {color: #e43c3e;}
#user-info .acco-info li.fore1 .surplus a:hover {color: #e4393c;}
#user-info .acco-info-2 {border-left: 1px dotted #ddd;float: left;}
#user-info .acco-info-2 li {/*background-color: #fcfcfc;*/border-right: 1px dotted #ddd;float: left;padding-top:36px;height: 90px;width:120px;text-align: center;line-height: 26px; /*padding-left: 15px;*/}
#user-info .acco-info-2 li.fore1 {/*width: 140px;*/}
#user-info .acco-info-2 li.merge {line-height: 26px;padding-top: 8px;height: 118px;}
#user-info .acco-info-2 li label {display: inline-block;padding-left: 10px;text-align: right;}
#user-info .acco-info-2 li a {color: #666;}
#user-info .acco-info-2 li a:hover {color: #e4393c;}

</style>
<style>
/*order-list相关*/
.mod-main {/*padding: 10px;*/background: #fff;margin-bottom: 10px;}
.mod-main .mt {display: inline-block;display: block;padding: 10px 10px 30px 10px; border-bottom:1px solid #E8E8E8; background: #F5F5F5;}
.mod-main .mt h3 {float: left;font-family: "microsoft yahei";font-size: 16px;color:#000000;line-height: 20px; font-weight: normal;}
.mod-main .mt .extra-l {float: left;}
.mod-main .mt .extra-r {float: right;}
.mod-main .mt .extra-l li {float: left;padding-left: 20px;}
.mod-main .mt .extra-l li.fore-last {border-right: 0;}
.mod-main .mt .extra-l li a {display: inline-block;padding-bottom: 2px;color: #999;}
.mod-main .mt .extra-l li a:hover {color: #e4393c;}
.mod-main .mt .extra-l li a:hover em {color: #e4393c}
.mod-main .mt .extra-l li a.curr {padding-bottom: 0;color: #e4393c;border-bottom: 2px solid #e4393c;font-weight: 700;cursor: default;text-decoration: none}
.mod-main .mt .extra-l li.fore-last {border-right: 0}
.mod-main .mt .extra-l em {margin-left: 5px}
.mod-main .mc {overflow: visible;}
.ftx01,.ftx-01 {color: #e4393c}
.ftx03, .ftx-03 {color: #999;}
#order-list {border: 1px solid #E8E8E8; overflow: hidden;}
#order-list .tb-order {height: 278px;}
/*#order-list .tb-order {margin-bottom: -10px;}*/
.tb-order {border-collapse: collapse;border-spacing: 0;text-align: center;}
table {border-collapse: collapse;}
.tb-order td {padding: 5px;height: 82px;border-bottom: 1px dotted #CCCCCC; }
.tb-order .img-list {overflow: hidden;text-align: left;margin-left: 10px;}
#order-list .tb-order tbody.fore3 tr td {border-bottom: 0;}
.nocont-order {height: 280px;line-height: 280px;}
.nocont-box b.icon-order {width: 70px;height: 70px;background-position: 0 0;}
.nocont-box b {display: inline-block;vertical-align: middle;background: url(${base}/static/mall/img/nocont-icons.png) no-repeat;overflow: hidden;margin-right: 20px;}
	.points{color: #c00000; width: 120px; text-align: center; font-size:30px; font-family: arial; margin-top:5px;}
</style>




<style>
    .breadcrumb {
        height: 20px;
        padding: 10px 0 4px 6px;
        margin-bottom: 10px;
        overflow: hidden;
        line-height: 20px;
        vertical-align: baseline;
    }

    .breadcrumb strong, .breadcrumb h1 {
        display: inline;
        font-weight: normal;
        line-height: 20px;
        font-size: 18px;
        font-family: "microsoft yahei";
    }

    .left {
        float: left;
        width: 195px;
        margin-right: 10px;
    }

    .right {
        float: right;
        width: 830px;
    }

    .widepage .right {
        width:1000px;
    }

    .right a:link, .right a:visited {
        color: #005ea7;
    }

    .right a:link, .right a:visited {
        color: #005ea7;
    }

    .ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {
        color: #999999;
    }

    /**order-mt**/
    .right .order-mt {
        border: 1px solid #e6e6e6;
        border-bottom: 2px solid #c30000;
        height: 40px;
        line-height: 40px;
        margin-bottom: 10px;
        /*margin-top: 10px;*/
    }

    .right .order-mt h2 {
        position: relative;
    }

    .right .order-mt h2 {
        color: #cc0000;
        padding-left: 16px;
        float: left;
    }

    .right .order-mt .extra {
        float: right;
        padding-right: 15px;
    }

    .right .order-mt .extra a {
        display: inline-block;
        position: relative;
        margin-right: 10px;
    }

    .right .order-mt .extra a {
        margin-right: 10px;
        display: inline-block;
        vertical-align: middle;
    }

    /**order01**/
    #order01 {
        margin-top: -10px;
        line-height: 20px;
    }

    #order01 .mc {
        padding: 10px 20px;
        line-height: 25px;
        border: 1px solid #e6e6e6;
        border-top: none;
    }

    #order01 dl, .filter-item .item-con {
        overflow: hidden;
    }

    #order01 dt {
        width: 60px;
        text-align: right;
    }

    #order01 dt, #order01 dd {
        float: left;
        border-right: 1px dashed #e4e4e4;
        padding-left: 15px;
        padding-right: 15px;
    }

    #order01 dd {
        /*margin-right: 25px;*/
        color: #999;
    }

    #order01 dt, #order01 dd {
        float: left;
    }

    #expressLog{margin-left: 20px; line-height: 20px;}
    .green{color: #00aa00;}
    .black{color: #000000;}
    .red{color: #ff0000;}

</style>

<style>
    .ftx-04 {
        color: #C00;
    }

    #orderlist, #orderlist .mc, #orderlist .tb-order, #orderlist .mt {
        overflow: visible;
    }

    #orderlist .mt {
        border-bottom: 2px solid #C30000;
        padding-left: 6px;
        border-top: 1px solid #E6E6E6;
        border-right: 1px solid #E6E6E6;
        border-left: 1px solid #E6E6E6;
        background: #F5F5F5;
    }

    #orderlist .taborder li {
        position: relative;
        float: left;
        z-index: 2;
    }

    #orderlist .taborder .tyies-t {
        line-height: 40px;
        /* background: url(${base}/static/mall/img/tab01.png) 0 -32px;*/
        height: 40px;
        padding-left: 10px;
        padding-right: 47px;
        position: relative;
        z-index: 3;
        font-size: 14px;
        cursor: pointer;
    }

    #orderlist .taborder li b, #orderlist .taborder li s {
        height: 31px;
        /*   background: url(${base}/static/mall/img/tab01.png);*/
        position: absolute;
    }

    #orderlist .taborder li s {
        top: 0;
        left: 0;
        width: 3px;
    }

    #orderlist .taborder li b {
        width: 31px;
        background-position: -3px 0;
        top: 0;
        right: 0;
    }

    #orderlist .mt .extra {
        width: 447px;
    }

    #orderlist .mt .extra {
        color: #666666;
    }

    #orderlist .mt .extra {
        float: right;
    }

    #orderlist .search {
        float: right;
    }

    #orderlist .search .text {
        padding: 4px;
        margin-right: 3px;
        border: 1px solid;
        border-color: #aaa #ddd #ddd #aaa;
        width: 190px;
    }

    #orderlist .search .bti {
        background: url(${base}/static/mall/img/use.gif) 0 -42px;
        width: 50px;
        height: 25px;
        margin-top: -1px;
    }

    #orderlist .search .bti {
        border: none;
    }

    #orderlist .mc {
        border: 1px solid #e6e6e6;
        border-top: none;
    }

    #orderlist .tb-order {
        overflow: hidden;
        margin-right: -1px;
        margin-left: -1px;
        margin-bottom: -1px;
    }

    #orderlist .tb-order table {
        border-collapse: collapse;
        border: solid #E6E6E6;
        border-width: 0 1px 1px 1px;
    }

    #orderlist .tb-order th {
        background: #f7f7f7;
        height: 31px;
        color: #666666;
        font-weight: normal;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    #orderlist .tb-order td {
        border: solid #E6E6E6;
        border-width: 1px 0 0 1px;
        padding: 5px 4px;
        text-align: center
    }

    #orderlist .tb-order td.td-02 {
        background: #fffdee;
        color: #666666;
        padding-top: 5px;
    }

    #orderlist .tb-order .tr-th {
        background: #f9f9f9;
    }

    #orderlist .tb-order .tr-th td {
        text-align: left;

    }

    #orderlist .tr-th td, #orderlist .tr-split td {
        padding-top: 4px;
        padding-bottom: 4px;
    }

    #orderlist .tr-th span {
        display: inline-block;
        margin-right: 10px;
        overflow: hidden;
        vertical-align: middle;
        height: 24px;
        line-height: 23px;
        float: left;
    }

    #orderlist .tr-th .tcol1 {
        width: 225px;
        color: #666666
    }

    #orderlist .tr-th .tcol2 {
        /*width:130px;*/
        color: #666666;
        margin: 0;
    }

    #orderlist .tr-td td {
        vertical-align: top;
        padding-top: 10px;
    }

    #orderlist .tr-td .img-list {
        width: 280px;
        overflow: hidden; /* margin-bottom: 4px; */
    }

    #orderlist .tr-td .img-list .img-box {
        border: 1px solid #e1e1e1;
        float: left;
        margin-right: 4px;
        margin-bottom: 4px
    }

    #orderlist .tr-td .img-list .img-box:hover {
        border-color: #e5ca84
    }

    #orderlist .tr-td .u-name {
        width: 80px;
        overflow: hidden;
        word-break: break-all;
        word-wrap: break-word;
    }

    #orderlist .tr-td .cellphone-icon {
        display: block;
        width: 58px;
        height: 16px;
        margin: 5px auto 0;
        line-height: 100px;
        overflow: hidden;
        background: url(${base}/static/mall/img/cellphone.png) no-repeat;
    }

    #orderlist .tr-td a.btn-again {
        background: url(${base}/static/mall/img/use.gif);
        display: block;
        height: 21px;
        line-height: 100px;
        margin: 3px auto 0;
        overflow: hidden;
        width: 72px;
    }

    #orderlist .tr-td a.btn-again:hover {
        background-position: 0 -21px
    }

    /**pagin**/
    .pagin a, .pagin span {
        float: left;
        height: 20px;
        padding: 3px 10px;
        border: 1px solid #ccc;
        margin-left: 2px;
        font-family: arial;
        line-height: 20px;
        font-size: 14px;
        overflow: hidden;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }

    .pagin .text, .pagin .current {
        border: 0;
        padding: 4px 11px;
    }

    .pagin a:link, .pagin a:visited {
        color: #005aa0;
    }

    .pagin a:hover, .pagin a:active {
        background: #DB0000;
        color: #fff;
        text-decoration: none;
    }

    .pagin .current, .pagin .current:link, .pagin .current:visited {
        color: #f60;
        font-weight: 700;
    }

    .pagin b {
        display: block;
        position: absolute;
        top: 9px;
        width: 5px;
        height: 9px;
        background-image: url(${base}/static/mall/img/bg5.gif);
        background-repeat: no-repeat;
        overflow: hidden;
    }

    .pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
        position: relative;
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }

    .pagin .prev-disabled, .pagin .next-disabled {
        color: #ccc;
        cursor: default;
    }

    .pagin .prev, .pagin .prev-disabled {
        padding-left: 12px;
    }

    .pagin .prev b {
        left: 3px;
        background-position: -68px -608px;
    }

    .pagin .prev-disabled b {
        left: 3px;
        background-position: -80px -608px;
    }

    .pagin .next, .pagin .next-disabled {
        padding-right: 12px;
    }

    .pagin .next b {
        right: 3px;
        background-position: -62px -608px;
    }

    .pagin .next-disabled b {
        right: 3px;
        background-position: -74px -608px;
    }

    .pagin-m a, .pagin-m span {
        height: 14px;
        line-height: 14px;
        font-size: 12px;
    }

    .pagin-m b {
        top: 5px;
    }

    .pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {
        padding-top: 3px;
        height: 14px;
        line-height: 14px;
        *line-height: 16px;
    }
    /* 支付 */
    .btn{display: block; width: 76px; height: 24px; line-height: 24px; background: #db0000;border-radius: 3px;color: #ffffff !important; margin-left:52px;}
    .btn:hover{background: #ed4548;}
    .bltx-color{color: #DB0000;}
</style>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#import "mall/xd/member/menu.ftl" as memu>
		<@memu.menu id=""/>
	</div><!--left end-->
	<div class="right">
		<div class="m" id="user-info">
			<div class="u-pic">
            	<img alt="用户头像" src="${base}/static/mall/img/header.png">
            	<div class="mask"></div>
            	<!--<div class="face-link-box"></div>
            	<a class="face-link" href="#">修改头像</a>-->
            </div><!--u-pic end-->
			<div class="info-m">
				<div class="u-name">${(mb.nickName)!mb.userName}<!--<a href="${base}/member/me" target="_blank">${mb.nickName}</a>--></div>
				<#--<div class="u-signature">欢迎您进入<@spring.message "project_name"/>！</div>-->
				<div class="u-level">
					<span class="rank r-${mbr.sign}">
						<s></s>${mbr.name}<!--<a href="${base}/member/grade" target="_blank">${mbr.name}</a>-->
					</span>
				</div>
				<div class="u-safe">
					<span>账户安全：</span>
					<i id="cla" class="safe-rank05"></i><strong class="rank-text ftx-02">较高</strong>
					<a id="up" href="${base}/member/account/safety" style="display: none;">提升</a>
				</div>
			</div><!--info-m end-->
			<ul class="acco-info-2">
				<li class="fore1">
					<div class="mt">
						<label>当前积分：</label><div class="points">${mb.scoreTotal}</div>
						<#--0.00<!--<a href="${base}/member/finance/recently.action" id="BalanceCount">0.00</a>&ndash;&gt;-->
					</div>
					<#--<label>11111111优惠券：</label>-->
					<#--0<!--<a href="${base}/member/quan" id="CouponCount">1</a>&ndash;&gt;-->
				</li>
                <li class="fore1">
                    <div class="mt">
                        <label>累计积分：</label><div class="points">${mb.vipScoreTotal}</div>
					<#--0.00<!--<a href="${base}/member/finance/recently.action" id="BalanceCount">0.00</a>&ndash;&gt;-->
                    </div>
				<#--<label>11111111优惠券：</label>-->
				<#--0<!--<a href="${base}/member/quan" id="CouponCount">1</a>&ndash;&gt;-->
                </li>
			</ul><!--acco-info-2 end-->
		</div><!--user-info end-->
		<#include "mall/xd/member/index_order.ftl"/>
	    <div class="clr"></div>
	</div><!--right end-->
</div>
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	//左侧菜单折叠操作
	$("#leftMenu dt").click(function(){
		$parent=$(this).parent();
		if($parent.hasClass("close")){
			$parent.removeClass("close");
		}else{
			$parent.addClass("close");
		}
	});
});
</script>
</body>
</html>