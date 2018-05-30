<#escape x as x?html>
	<#include "bec/jp/header.ftl"/>

<style>
    .banner{ width: 1200px!important; margin:0 auto; height: 380px!important;}
    #kinMaxShow .KMSPrefix_kinMaxShow_image_box .KMSPrefix_kinMaxShow_image_item,#kinMaxShow .KMSPrefix_kinMaxShow_image_box{    width: 100%; height:380px!important;}

</style>
<#--自适应banner-->
<script type="text/javascript" src="${base}/static/js/jquery.kinMaxShow-1.1.min.js"></script>
<div id="container" class="f-cb">
	<#include "bec/jp/top.ftl"/>
	<#if shop.status gt 0>
       <#-- <div class="content">
            <div class="breadcrumb">
                <strong><a href="${base}/index.html">首页</a></strong>
		<span>&nbsp;&gt;&nbsp;
		<a href="${base}/shop/${(shop.urlAddress)!}">${(shop.name)!}，欢迎您的到来！</a>
		&lt;#&ndash;<a href="${base}/shopExtend/detail/${(shop.urlAddress)!}.html">${(shop.name)!}，欢迎您的到来！</a>&ndash;&gt;
	    </span>
            </div>
            <div class="clr"></div>
        </div>-->
        <div class="banner" id="kinMaxShow">
			<#list imglist as slideitem>
                <div><img alt="${shop.name}" src="${headAd.pic}/${slideitem}@1200w_380h_2e.png"></div>
			</#list>
        </div>
		<#include "bec/jp/shop/default/header.ftl"/>
		<#include "bec/jp/shop/default/middle.ftl"/>
	<#else >
        <div class="content">
            <div style="width:100%; height: 400px; line-height: 400px; text-align: center; font-size: 20px; font-weight: bold;">对不起！您查看的店铺已关闭，您可以<a href="${base}/index" style="color: #0000cc;">去首页</a>选择其他商家的产品！</div>
        </div>
	</#if>
</div>
	<#include "bec/jp/service.ftl"/>
	<#include "bec/jp/foot.ftl"/>
<script type="text/javascript">

    $(function () {
        /*自适应banner*/
        $("#kinMaxShow").kinMaxShow({
            height:'500',
            button:{
                showIndex:false,
                normal:{background:'url('+base+'/static/img/button.png) no-repeat -14px 0', width:'14px', height:'14px',marginRight:'9px',border:'0',right:'45%',bottom:'30px'},
                focus:{background:'url('+base+'/static/img/button.png) no-repeat 0 0',border:'0'}
            },
        });
    });
</script>
</#escape>