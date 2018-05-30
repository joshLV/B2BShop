<!DOCTYPE html>
<html>
<head>
<#include "app/ghj/head.ftl">
    <link href="${path}/theme/red/ghj_style.css" rel="stylesheet" />
    <style>
        .mui-content {
            padding-bottom: 0!important;
        }
        .pro_box_peo{ background:#f5f5f5; margin:15px;  margin-bottom:0;padding:10px; overflow:hidden;}
        section{margin: 15px}
    </style>
</head>
<body>
<div class="top">
    <span class="fl return_2"><a href="${base}/zcgoods/detail/${id}"><img src="${path}/images/fh.png"></a></span>
    <span class="fr p_user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');"><img src="${path}/images/yh.png"></a></span>
</div>
<div class="mui-content" id="topbar">
        <section>
            <div class="pro_box">
                <h2 class="tb_2">项目支持者</h2>
                <div id="xmzcz">
                <#if orderList?? && orderList?size &gt; 0>
                    <#list orderList as order>
                        <dl class="pro_box_peo">
                            <dt>
                                <img src="${path}/images/pic6.jpg">
                            </dt>
                            <dd>
                                <h3>${order.createUser?substring(0,3)}****${order.createUser?substring(order.createUser?length-4,order.createUser?length)}</h3>
                                <p>订购数量：${order.goodsTotalQuantity}件</p>
                                <p>订购时间：${order.createDate?string("yyyy年MM月dd日")}</p>
                            </dd>
                        </dl>
                    </#list>
                </#if>
                </div>
            </div>
        </section>
</div>

<div class="return" >
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
</body>
<script>
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
    }(mui, document));
</script>
</html>