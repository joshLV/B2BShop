<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${message}</title>
<link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
<link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
<#--<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>-->
	<style type="text/css">
        /*succeed*/
        #succeed{position:relative;overflow:visible;padding-top: 150px;}
        #succeed .corner{display:none;position:absolute;width:4px;height:4px;font-size:0;line-height:0;overflow:hidden;}
        #succeed .tl{top:-1px;left:-1px;background-position:-17px 0;}
        #succeed .tr{top:-1px;right:-1px;background-position:-21px 0;}
        #succeed .bl{bottom:-1px;left:-1px;background-position:-17px -4px;}
        #succeed .br{bottom:-1px;right:-1px;background-position:-21px -4px;}
        #succeed .btn-pay,#succeed .btn-continue,#succeed .btn-append{background:#ccc url(${base}/static/mall/nsc/img/cart.png) no-repeat;line-height:100px;overflow:hidden;display:block;}
        #succeed .btn-pay{float:right;width:189px;height:36px;margin:0 25px 0 10px;_margin-right:12px;background-position:0 0;}
        #succeed .btn-continue{float:right;background-position:-90px -37px;width:94px;height:36px;}
        #succeed .btn-append{background-position:-41px 0;width:93px;height:23px;}
        #succeed .success{overflow:hidden;height:65px;padding:31px 10px 16px 80px;zoom:1;}
        #succeed .success b,#succeed .success-b{float:left;overflow:hidden;width:304px;height:40px;padding-left:56px;background:url(${base}/static/mall/nsc/img/cart.png) no-repeat 0 -100px;font:normal 24px/40px \5fae\8f6f\96c5\9ed1;color:#7ABD54;}
        #succeed .success-b{color:#999;font:12px/150% Arial,Verdana,"\5b8b\4f53";height:auto}
        #succeed .success-b h3{font:normal 24px/40px \5fae\8f6f\96c5\9ed1;color:#7ABD54;}
	</style>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript">
        $(window).load(function(e) {
            $(".u-category").css("display","none");
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
        });
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
			<#if message=="success">
			<div class="m" id="succeed">
				<div class="success">
					<div class="success-b">
						<h3>商品已成功加入购物车！</h3>
						<span id="flashBuy" style="display:none">商品数量有限，请您尽快下单并付款！</span>
					</div>
					<span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}" class="btn-pay">去结算</a><a href="${backurl}" class="btn-continue">继续购物</a></span>
				</div>
			</div>
			<#else>
			<div class="m" id="succeed">
				<div class="success">
					<div class="success-b">
						<h3>${message}</h3>
					</div>
					<span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}" class="btn-pay">去结算</a><a href="${backurl}" class="btn-continue">继续购物</a></span>
				</div>
			</div>
			</#if>
	</div>
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
</div>
</body>
</html>