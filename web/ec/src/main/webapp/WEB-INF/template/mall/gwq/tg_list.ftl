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
            //团购开始时间到了就修改购买图标已经将时间换成距离团购结束多长时间
            if(intDiff<0){
                $(obj+' .settime').parent().next().find(".grey-number").find("a").html("立即抢购");
                $(obj+' .settime').parent().next().find(".grey-number").attr("class","number");
                intDiff=$(obj+' .settime').attr("data-intervalEndTime");
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
                $(obj+' .settime').prev().html("距离结束：");
            }


        }, 1000);
    }
</script>
<div class="purchase_main">
    <div>
        <h2 class="pur_floors_title">
            <#--<i></i>
            <a class="muying" href="${base}/promotions/tg.html?catelogId=${list['topCatelog'].id}" target="_blank">${list['topCatelog'].name}</a>
            <div class="fr">
            &lt;#&ndash;<a href="#" target="_blank">营养辅食</a><span></span>
            <a href="#" target="_blank">洗护用品</a><span></span>
            <a href="#" target="_blank">尿裤湿巾</a><span></span>
            <a href="#" target="_blank">育儿用具</a><span></span>&ndash;&gt;
                <a href="${base}/promotions/tg.html?catelogId=${list['topCatelog'].id}" target="_blank">更多&nbsp;<em>&gt;&gt;</em></a>
            </div>-->
            团购专场
        </h2>
    </div>
    <#list proList as list>
        <#--<div class="pur_floors">-->
            <div class="pur_goods_list">
                <#list list['list'] as p>
                    <div class="index-goods" id="${p.pgId}" >
                        <a class="index-goods-img" href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank">
                            <img class="dynload" src="<#if p.url??>${p.url}_205x224.png</#if>" alt="">
                            <#--<img class="dynload" src="<#if p.url??>${imageUrl}${p.url}_205x224.png</#if>" alt="">-->
                        </a>
                        <h3>
                            <a class="index-goods-name" href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank" title="${p.goodsFullName}">${p.goodsFullName}</a>
                        </h3>
                        <div class="index-goods-times" id="CountMsg">
                            <span>距离<#if p.status == 'ing'>结束<#elseif p.status == 'before'>开始</#if>：</span>
                            <div class="settime" endTime="" data-intervalEndTime="${p.intervalEndTime}" data-endTime="${p.endTime?string("yyyy-MM-dd")} ${p.endTime?string("HH:mm:ss")}"></div>
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
                            <span class="money" style="text-decoration:line-through;font-size: 13px;">¥<del>${p.goodsPrice}</del></span>
                            <span <#if p.status == 'ing'>class="number"<#elseif p.status == 'before'>class="grey-number"</#if>><i></i>
                                <a href="${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}" target="_blank">
                                    <#if p.status == 'ing'>
                                        立即抢购
                                    <#elseif p.status == 'before'>
                                        即将开始
                                    </#if>
                                </a>
                            </span>
                        </div>
                    </div>
                </#list>
            </div>
        <#--</div>-->
    </#list>
</div>

	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>