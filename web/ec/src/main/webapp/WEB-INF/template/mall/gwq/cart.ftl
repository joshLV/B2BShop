<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>

	<#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
    window.pageConfig={
        compatible:true,
        navId:"cardAdd"
    };
</script>

<style>

    .left {float: left;width: 770px;}
    .right-extra{float:right;width:210px;}
    .p-name a:link,.p-name a:visited{color:#666;}
    .p-name a:hover{color:#E4393C;}

    /*succeed*/
    #succeed{position:relative;overflow:visible;}
    #succeed .corner{display:none;position:absolute;width:4px;height:4px;font-size:0;line-height:0;overflow:hidden;}
    #succeed .tl{top:-1px;left:-1px;background-position:-17px 0;}
    #succeed .tr{top:-1px;right:-1px;background-position:-21px 0;}
    #succeed .bl{bottom:-1px;left:-1px;background-position:-17px -4px;}
    #succeed .br{bottom:-1px;right:-1px;background-position:-21px -4px;}
    #succeed .btn-pay,#succeed .btn-continue,#succeed .btn-append{overflow:hidden;display:block;}
    #succeed .btn-pay{float:right;width:140px;height:36px;margin:0 25px 0 10px;line-height:36px; _margin-right:12px;background:#db0000; border-radius: 3px; color: #ffffff; font-size: 18px; text-align: center;}
    #succeed .btn-pay:hover{background: #ed4548;}
    #succeed .btn-continue{float:right;width:120px;height:34px; color: #db0000;  background:#ffeded; border: 1px solid #db0000; border-radius: 3px; font-size: 18px; text-align: center; line-height: 34px;}
    #succeed .btn-append{background-position:-41px 0;width:93px;height:23px;}
    #succeed .success{overflow:hidden;height:65px;padding:31px 10px 16px 80px;zoom:1;}
    #succeed .success b,#succeed .success-b{float:left;overflow:hidden;width:304px;height:40px;padding-left:56px;background:url(${base}/static/mall/img/cart.png) no-repeat 0 -100px;font:normal 24px/40px \5fae\8f6f\96c5\9ed1;color:#7ABD54;}
    #succeed .success-b{color:#999;font:12px/150% Arial,Verdana,"\5b8b\4f53";height:auto}
    #succeed .success-b h3{font:normal 24px/40px \5fae\8f6f\96c5\9ed1;color:#7ABD54;}

    .widepage .left{width:990px;}
    .widepage .m1 .mc{width:978px;}
    .widepage .m1 .mc dd{width:200px;}
    .widepage #succeed .btn-pay{margin:0 150px 0 10px;_margin-right:75px;}
    .widepage #succeed .success{padding:31px 10px 16px 140px;}

</style>
<div class="content">
    <div class="left">
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

    </div><!--left end-->
    <div class="right">
        <!--我的购物车 暂不显示-->
    </div><!--right end-->
    <div class="clr"></div>
</div>

<script type="text/javascript">
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {

    });
</script>


	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>