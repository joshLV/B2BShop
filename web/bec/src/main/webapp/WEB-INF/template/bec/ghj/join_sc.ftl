<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>

    <#include "bec/ghj/top.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/join_us.css">

<div class="join_us_banner2">

</div>
<div class="join_supermarket">
    <div class="join_supermarket_in">
        <div class="join_supermarket_img">
            <img src="${base}/static/bec/project/ghj/img/scrz_img1.jpg">
            <div class="join_regbtn">
                <a href="javascript:regist();"><button>注册</button></a>
                <#--<a href="javascript:registShiYong();"><button>注册试用</button></a>-->
            </div>
        </div>
        <div class="join_supermarket_img"><img src="${base}/static/bec/project/ghj/img/scrz_img2.jpg"></div>
        <div class="join_supermarket_img"><img src="${base}/static/bec/project/ghj/img/scrz_img3.jpg"></div>
    </div>
    <div style="margin: 0 auto;width: 1200px;overflow: hidden;">
        <img src="${base}/static/bec/project/ghj/img/join_sc_03.jpg">
    </div>
</div>


    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>