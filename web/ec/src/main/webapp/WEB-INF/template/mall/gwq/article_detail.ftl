<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
    window.pageConfig={
        compatible:true,
        navId:"memberindex"
    };
</script>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
    .breadcrumb span {font-family: "\5b8b\4f53"}

    .widepage .right {width: 980px;}
</style>
<div class="content">
    <div class="breadcrumb">
        <h1><a href="${base}/index">首页</a></h1>
        <span>&nbsp;&gt;&nbsp;<a href="${base}/comn/${articlesCategory.id}.html">${articlesCategory.name}</a></span>
    </div><!--breadcrumb end -->
    <div class="clr"></div>
</div>
<style>
    /*user-info*/
    #user-info {overflow: hidden;background-color: #fff;padding: 10px 10px;border: 1px solid #D0D0D0;border-radius: 3px;margin-top:10px;}
    #user-info a {color: #005ea7}
    #user-info a:hover {color: #e4393c;}
    #user-info .u-pic {position: relative;z-index: 0;float: left;width: 104px;height: 104px;margin: 5px 10px 0 0;overflow: hidden;text-align: center;}
    #user-info .u-pic .face-link {display: none;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;line-height: 30px;overflow: hidden;color: #fff;z-index: 3;}
    #user-info .u-pic .face-link-box {display: none;background: #000;z-index: 1;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;opacity: .5;filter: alpha(opacity=50);}
    #user-info .u-pic .mask {background: url(${base}/static/mall/img/bg4.png) 0 0;width: 104px;height: 104px;position: absolute;left: 0;top: 0;z-index: 2;}
    #user-info .info-m {float: left;width: 210px;}
    #user-info .info-m .u-name {font-size: 18px;font-family: "microsoft yahei";color: #333;line-height: 28px;margin-bottom: 5px;}
    #user-info .info-m .u-name a {color: #000;}
    #user-info .info-m .u-name a:hover {color: #e4393c;}
    #user-info .info-m .u-signature {color: #999;margin-bottom: 15px;width: 100%;text-overflow: ellipsis;word-wrap: normal;white-space: nowrap;overflow: hidden;}
    #user-info .info-m .u-level {margin-bottom: 10px;height: 18px;}
    #user-info .info-m .u-level .rank {margin-right: 10px;display: inline-block;height: 17px;line-height: 17px;}
    #user-info .info-m .u-level .rank s {background: url(${base}/static/mall/img/rank.gif) repeat 0 0;display: inline-block;height: 17px;margin-right: 5px;text-decoration: none;width: 17px;vertical-align: middle;}
    #user-info .info-m .u-level .rank a {display: inline-block;vertical-align: middle;}
    #user-info .info-m .u-level .rank.r2 s {background-position: 0 -17px;}
    #user-info .info-m .u-level .rank.r3 s {background-position: 0 -34px;}
    #user-info .info-m .u-level .rank.r4 s {background-position: 0 -51px;}
    #user-info .info-m .u-level .rank.r5 s {background-position: 0 -68px;}
    #user-info .info-m .u-level .rank.r6 s {background-position: 0 -85px;}
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
    #user-info .acco-info-2 li {background-color: #fafafa;border-right: 1px dotted #ddd;float: left;padding-top: 20px;height: 106px;width: 125px;text-align: left;line-height: 26px;}
    #user-info .acco-info-2 li.fore1 {width: 140px;}
    #user-info .acco-info-2 li.merge {line-height: 26px;padding-top: 8px;height: 118px;}
    #user-info .acco-info-2 li label {display: inline-block;padding-left: 10px;text-align: right;}
    #user-info .acco-info-2 li a {color: #666;}
    #user-info .acco-info-2 li a:hover {color: #e4393c;}
</style>
<style>
    /*order-list相关*/
    .mod-main {padding: 10px;background: #fff;margin-bottom: 10px;}
    .mod-main .mt {display: inline-block;display: block;padding: 10px;}
    .mod-main .mt h3 {float: left;font-family: "microsoft yahei";font-size: 16px;color: #333;line-height: 20px;}
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
    #order-list {border: 1px solid #D0D0D0;border-radius: 3px;}
    #order-list .tb-order {height: 278px;}
    #order-list .tb-order {margin-bottom: -10px;}
    .tb-order {border-collapse: collapse;border-spacing: 0;text-align: center;}
    table {border-collapse: collapse;}
    .tb-order td {padding: 5px;height: 82px;border-bottom: 1px dotted #e6e6e6;}
    .tb-order .img-list {overflow: hidden;text-align: left;}
    #order-list .tb-order tbody.fore3 tr td {border-bottom: 0;}
    .nocont-order {height: 280px;line-height: 280px;}
    .nocont-box b.icon-order {width: 70px;height: 70px;background-position: 0 0;}
    .nocont-box b {display: inline-block;vertical-align: middle;background: url(${base}/static/mall/img/nocont-icons.png) no-repeat;overflow: hidden;margin-right: 20px;}
    /*detail*/
    #detail{border:1px solid #EBEBEB;padding:15px 30px 0;font-family:\5fae\8f6f\96c5\9ed1;}
    #detail h1{padding:10px 0 15px;margin-bottom:10px;height:24px;text-align:center;border-bottom:1px solid #EBEBEB;font-family:\5fae\8f6f\96c5\9ed1;line-height:24px;font-size:20px;}
    #detail .summary{text-align:center;color:#999;}
    #detail .mc{padding:30px 10px;font-size:14px;line-height:2em;}
    #detail .mt{padding-bottom:2px;position:relative;}
    #detail .partake{position:absolute;right:0;bottom:0;overflow:hidden;zoom:1;}
    #detail .partake span{float:left;line-height:23px;}
    #detail .partake a{float:left;width:22px;height:23px;overflow:hidden;background-image:url(i/icon_site.gif);background-repeat:no-repeat;line-height:100px;}
</style>
<div class="content">
    <div id="detail" class="m">
        <div class="mt">
            <h1>${articles.title}</h1>
            <div class="summary">时间:${date}</div>
        </div>
        <div id="mc" class="mc">
		${content}
        </div>
    </div><!--right end-->
</div>

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


	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>