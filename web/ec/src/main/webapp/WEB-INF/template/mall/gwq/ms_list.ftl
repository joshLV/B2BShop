<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<style>
    .main{ overflow: inherit;}
    .ms_main{ width: 1200px; margin: 0 auto;}
</style>
<div class="ms_main">
<div class="ms_tit"><img src="${base}/static/mall/gwq/img/ms.gif" alt="限时秒杀"></div>
<ul class="ms_list f-cb">
    <#list pager.list as p>
	<li id="${p.pgId}">
		<a href="${base}/item/${p.goodsId}.html?mt=m&promotionsId=${p.id}" class="a-img"  target="_blank">
            <img src="<#if p.url??>${p.url}_364x290.png</#if>" width="364" height="290">
        </a>
        <div class="pms_time"><i></i>
            <div class="time-item">
                <strong>将于</strong>
                <#if p.status == 'ing'>
                    <#--<span class="day_show">${p.endTime}</span>-->
                    <span class="day_show">
                        ${p.endTime?string("yyyy-MM-dd")} ${p.endTime?string("HH:mm:ss")}
                    </span>
                    <strong>结束</strong>
                <#elseif p.status == 'before'>
                    <#--<span class="day_show">${p.startTime}</span>-->
                    <span class="day_show">
                        ${p.startTime?string("yyyy-MM-dd")} ${p.startTime?string("HH:mm:ss")}
                    </span>
                    <strong>开始</strong>
                </#if>
            </div>
        </div>
		<p class="pms_tit"><a href="${base}/item/${p.goodsId}.html?mt=m&promotionsId=${p.id}" title="${p.goodsFullName}" alt="${p.goodsFullName}" target="_blank">${p.goodsFullName}</a></p>
        <p class="pms_price"><i>￥</i>${p.promotionsPrice}&nbsp;&nbsp;<span style="text-decoration:line-through; color: #999; font-size: 13px;" id="weipu-marketPrice">￥${p.goodsPrice}&nbsp;</span></p>
        <p class="pms_time_2">
            <span>
                <#if p.status == 'ing'>
                    距离结束
                <#elseif p.status == 'before'>
                    距离开始
                </#if>
            </span>
            <span class="pms_time_interval" data-intervalEndTime="${p.intervalEndTime}" data-endTime="${p.endTime?string("yyyy-MM-dd")} ${p.endTime?string("HH:mm:ss")}"></span></p>
        <p class="pms_btn">
            <a href="${base}/item/${p.goodsId}.html?mt=m&promotionsId=${p.id}" target="_blank">
                <#if p.status == 'ing'>
                    <img src="${base}/static/mall/gwq/img/qg.jpg" alt="立即抢购" title="立即抢购">
                <#elseif p.status == 'before'>
                    <img src="${base}/static/mall/gwq/img/qg_2.jpg" alt="即将开始" title="即将开始">
                </#if>
            </a>
        </p>
        <script type="text/javascript">

            $(function(){

                <#if p.status == 'ing'>
                    timer(parseInt('${p.intervalEndTime}'),'#${p.pgId}');
                <#elseif p.status == 'before'>
                    timer(parseInt('${p.intervalStartTime}'),'#${p.pgId}');
                </#if>
            });
        </script>
	</li>
    </#list>
</ul>
</div>
<div class="clearfix">
    <#if (pager.list?size > 0)>
        <div class="pagin fr">
            <#import "mall/gwq/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/promotions/ms.html" />
        </div>
    <#else>
        <#--<div class="pagin">
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
        </div>-->
    </#if>
</div>




	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>
<script type="text/javascript">

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
            $(obj+' .pms_time_interval').html(time);
            intDiff--;

            //秒杀开始时间到了就修改购买图标已经将时间换成距离秒杀结束多长时间
            if(intDiff<0){
                $(obj+' .pms_time_interval').parent().next().find("img").attr("src","${base}/static/mall/gwq/img/qg.jpg");
                intDiff=$(obj+' .pms_time_interval').attr("data-intervalEndTime");
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
                $(obj+' .pms_time_interval').html(time);
                $(obj+' .pms_time_interval').prev().html("距离结束");
                $(obj+' .pms_time_interval').parent().parent().find(".day_show").html($(obj+' .pms_time_interval').attr("data-endTime"))
                $(obj+' .pms_time_interval').parent().parent().find(".day_show").next().html('结束');
            }
        }, 1000);
    }
</script>