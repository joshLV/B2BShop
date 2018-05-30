<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/group_purchase.css?v=<@spring.message 'version'/>">
<script language="javascript">
    function timer(intDiff,obj){
        window.setInterval(function(){
            var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
            if(intDiff > 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var time = day+"天";
            time += hour+'时';
            time += minute+'分';
            time += second+'秒';
            $(obj+' .settime').html(time);
            intDiff--;
        }, 1000);
    }
</script>
<div class="purchase_main">
    <div class="pur_floors">
        <h2 class="pur_floors_title">
            <i></i>
            <a class="muying" href="${base}/promotions/tg.html?catelogId=${catelog.id}" target="_blank">${catelog.name}</a>
            <div class="fr">
                <#--<a href="#" target="_blank">营养辅食</a><span></span>
                <a href="#" target="_blank">洗护用品</a><span></span>
                <a href="#" target="_blank">尿裤湿巾</a><span></span>
                <a href="#" target="_blank">育儿用具</a><span></span>-->
                <a href="${base}/promotions/tg.html?catelogId=${catelog.id}" target="_blank">更多&nbsp;<em>&gt;&gt;</em></a>
            </div>
        </h2>
        <div class="pur_goods_list">
            <#list pager.list as p>
            <div class="index-goods" id="${p.pgId}" >
                <a class="index-goods-img" href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank">
                    <img class="dynload" src="<#if p.url??>${imageUrl}${p.url}_232x232.png</#if>" alt="">
                </a>
                <h3>
                    <a class="index-goods-name" href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank" title="${p.goodsFullName}">${p.goodsFullName}</a>
                </h3>
                <div class="index-goods-times" id="CountMsg">
                    <span>距离
                        <#if p.status == 'ing'>
                            结束
                        <#elseif p.status == 'before'>
                            开始
                        </#if>
                        ：</span>
                    <div class="settime" endTime=""></div>
                    <script type="text/javascript">
                        $(function(){
                            <#if p.status == 'ing'>
                                timer(parseInt('${p.intervalEndTime}'),'#${p.pgId}');
                            <#elseif p.status == 'before'>
                                timer(parseInt('${p.intervalStartTime}'),'#${p.pgId}');
                            </#if>
                        });
                    </script>
                </div>
                <div class="index-goods-info">
                    <span class="price"><em>¥</em>${p.promotionsPrice}</span>
                    <span class="money">¥<del>${p.price}</del></span>
                    <span <#if p.status == 'ing'>class="number"<#elseif p.status == 'before'>class="grey-number"</#if>><i></i><a href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank">立即抢购</a></span>
                </div>
            </div>
            </#list>
        </div>
    </div>
</div>
<div class="clearfix">
    <#if (pager.list?size > 0)>
        <div class="pagin fr">
            <#import "mall/gwq/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/promotions/tg.html?catelogId=${catelog.id}" />
        </div>
    <#else>
        <div class="pagin">
            <div class="searchTip" style="min-height: 390px; padding-top: 12px;">
                <div class="searchTipContent">
                    <h2>尚未发布任何信息!</h2>
                    <h3>建议您：</h3>
                    <ol id="searchTipSugg">
                        <li>
                            看看输入的文字是否有误
                        </li>
                        <li>
                            调整关键词，如“全铜花洒套件”改成“花洒”或“花洒 套件”
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </#if>
</div>
	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>