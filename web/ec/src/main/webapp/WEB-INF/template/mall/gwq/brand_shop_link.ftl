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
    .brands-content{width:1208px; height:auto; margin:0 auto; border:1px solid #e8e8e8; border-top:2px solid #db0000; margin-top: 10px;}
    .link_tit{height:40px; line-height:40px; background:#f5f5f5; border-bottom:1px solid #e8e8e8; font-size:16px; padding-left:15px;}
    /* 品牌旗舰店 */
    .nch-brand-list { margin-top: 20px;}
    .nch-brand-list ul { font-size: 0; *word-spacing:-1px/*IE6、7*/; width: 1208px; margin: 0 auto; padding-left: 12px;}
    .nch-brand-list ul li { vertical-align: top; letter-spacing: normal; word-spacing: normal; display: inline-block; *display: inline/*IE7*/; width: 225px; padding: 0; margin: 0 15px 20px 0; overflow: hidden; *zoom: 1;}
    .nch-brand-list dl { background-color: #FFF; width: 203px; padding:10px; border: solid 1px #E6E6E6; margin: 0 auto; border-radius: 3px; box-shadow: inset 0 0 2px rgba(204,204,204,0.3);}
    .nch-brand-list dt a { line-height: 0; background-color: #FFF; text-align: center; vertical-align: middle; display: table-cell; *display: block; width: 210px; height: 110px; overflow: hidden;}
    .nch-brand-list dt a img { max-width:200px; max-height: 110px; margin-top:expression(50-this.height/2); *margin-top:expression(25-this.height/2)/*IE6,7*/;}
    .nch-brand-list dl dd { font-size: 12px; text-align: center; text-overflow: ellipsis; white-space: nowrap; height:30px; /*padding: 4px 0 0 0;*/ line-height:30px; border-bottom: solid 1px #E6E6E6; overflow: hidden;}
</style>

<div class="brands-content">
    <h3 class="link_tit">品牌旗舰店</h3>
    <div class="nch-brand-list">
        <ul>
            <#list indexShopList as indexShop>
                <li>
                    <dl>
                        <dt>
                            <a href="javascript:void(0)"  onclick="s('${indexShop.name}','')" title="${indexShop.shopName}">
                                <img src="${indexShop.pic}" alt="${indexShop.name}">
                            </a>
                        </dt>
                    <#--<dd>-->
                    <#--<a href="${base}/search/s/${indexShop.name}" title="${indexShop.shopName}" target="_blank">${indexShop.shopName}</a>-->
                    <#--</dd>-->

                    <#--<dd>-->
                    <#--<#if indexShop.createUser?? && indexShop.createUser != ''>-->
                    <#--<a href="${base}/search/s/${indexShop.name}" title="${indexShop.shopName}" target="_blank">${indexShop.createUser}</a>-->
                    <#--</#if>-->
                    <#--</dd>-->


                    </dl>
                </li>
            </#list>
        </ul>
    </div>
</div>


<script type="text/javascript">

</script>


    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>