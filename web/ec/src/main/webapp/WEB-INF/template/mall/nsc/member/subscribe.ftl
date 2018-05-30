<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>邮件订阅</title>
<meta name="description" content="邮件订阅">
<meta name="Keywords" content="邮件订阅">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width: 980px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
p {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	}
.mod-comm .mc {
line-height: 20px;
}
.mod-comm {padding: 10px 20px 20px;}
.mod-comm .mt {padding: 10px 0;}
.mod-comm .mc {line-height: 20px;overflow: visible;zoom: 1;}
.tb-void {
	line-height: 18px;
	text-align: center;
	border: 0;
	border-top: 0;
	color: #333;
	width: 100%;
	}
.remindlist {
	margin-left: -15px;
	position: relative;
	zoom: 1;
	overflow: hidden;
	}
.remindlist li {
	margin-left: 15px;
	line-height: 25px;
	width: 130px;
	float: left;
	text-align: left;
	}
.checkbox {
	float: none;
	vertical-align: -2px;
	_vertical-align: -1px;
	margin: 0 3px 0 0;
	padding: 0;
	}
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
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;邮件订阅<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/jd/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		<div class="mod-comm">
			<div class="mc">
				<p>
	                <span >为了您能准确收到邮件，</span>
	                <a href="#">请填写您的邮箱地址</a>
	            </p>
			</div>
            <div class="mt">
                <h3>
                  	  购物提醒邮件：
                </h3>
            </div>
            <div class="mc">
                <div class="tb-void">
                    
                    <ul class="remindlist">
                
                    <li>
                        <span class="checkbox" code=""><input id="" type="checkbox" name="" checked="checked" class="jdcheckbox"><label for="">下单成功提醒</label></span>
                    </li>
                
                    <li>
                        <span class="checkbox" code=""><input id="" type="checkbox" name="" checked="checked" class="jdcheckbox"><label for="">未付款提醒</label></span>
                    </li>
                
                    <li>
                        <span class="checkbox" code=""><input id="" type="checkbox" name="" checked="checked" class="jdcheckbox"><label for="">付款成功提醒</label></span>
                    </li>
                
                    <li>
                        <span class="checkbox" code=""><input id="" type="checkbox" name="" checked="checked" class="jdcheckbox"><label for="">未评价提醒</label></span>
                    </li>
                
                    </ul>
                        
                </div>
            </div>
        </div>
	    <div class="clr"></div>
	</div><!--right end-->
</div>
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
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