<#macro menu id>
<style>
/*leftMenu*/
#leftMenu .mt{height:40px;padding:0 6px;/*background-color:#fff6f6;*/line-height:40px;color:#fff;/* border-left: 1px solid #E8E8E8;  border-bottom: 1px solid #E8E8E8;*/ text-align: center; /*border-right: 1px solid #E8E8E8;*/}
#leftMenu .mt h2{/*float:left;*/background:none;padding-top:0;height:auto;line-height:40px; font-weight: normal; font-size: 16px;}
#leftMenu .mt a{color:#c00000;}
#leftMenu .mt .extra{cursor:pointer;float:right;width:22px;height:22px;overflow:hidden;line-height:0;font-size:0;/*background-image:url(${base}/static/mall/img/left.png);*/margin-top:5px}
#leftMenu .mt .extra:hover{background-position:-23px 0}
#leftMenu .mc{/*border-right:1px solid #E8E8E8; border-top: none;*/}
#leftMenu dl dt{position:relative;margin-bottom:-1px;height:40px;padding:0 12px;font-weight:bold;line-height:40px;cursor:pointer;color:#333333;background-color:#F9F9F9}
#leftMenu dl dt b{display:block;position:absolute;top:17px;left:173px;width:9px;height:5px;background:url(${base}/static/mall/img/left.png) -64px 0;font-size:0;line-height:0;overflow:hidden}
#leftMenu dl.close dt{background-color:#F1F1F1;margin-bottom:1px}
#leftMenu dl dt:hover{background-color:#F1F1F1;}
#leftMenu dl.close dt b{background:url(${base}/static/mall/img/left.png) -64px -6px;}
#leftMenu dl.close dd{display:none;}
#leftMenu dd{padding:4px 0 5px;}
#leftMenu dd .item{line-height: 40px; width: 193px;}
#leftMenu dd .item:hover{ border-left: 4px solid #db0000;width: 189px;}
#leftMenu dd .curr{font-weight:bold;}
#leftMenu dl dd a:link,#leftMenu dl dd a:visited{color:#333333}
#leftMenu dl dd a{padding-left: 24px; width:169px; display: block; height: 40px;}
#leftMenu dl dd a:hover{color:#E4393C; background: #F5F5F5;}
.selectedMenu a{font-weight: bold;}
</style>
<link href="${base}/static/mall/jp/css/fix.css" rel="stylesheet" type="text/css" media="all"/>
<div id="leftMenu" class="m">
	<#--<div class="mt">
		<h2><a href="${base}/member/index">会员中心</a></h2>
		<div id="settings" class="extra">常用设置</div> 
	</div><!--mt end&ndash;&gt;-->
	<div class="mc"> 
            <dl tag="1">
                <dt tag="1">订单中心<b></b></dt>
                <dd>
                    <div class="item" id="wddd">
                        <a href="/ec/order/list" tag="11">我的订单</a>
                    </div>
                    <div class="item" id="wdgz">
                        <a href="/ec/member/goodsattention/list" tag="12">我的关注</a>
                    </div>
                    <div class="item" id="llls">
                        <a href="/ec/member/history/list" tag="13">浏览历史</a>
                    </div>
                    <div class="item" id="wdtkd">
                        <a href="/ec/member/refund/list.html" tag="14">我的退款单</a>
                    </div>
                    <div class="item" id="wdtkd">
                        <a href="/ec/orderRejected/listRejected/all.html" tag="14">我的部分退货</a>
                    </div>
                    <div class="item" id="wdpj">
                        <a href="/ec/order/review.html" tag="124">我的评价</a>
                    </div>
                </dd>
            </dl>
            <dl tag="3">
                <dt tag="3">账户中心<b></b></dt>
                <dd>
                    <div class="item" id="zhxx">
                        <a href="/ec/member/info.html" tag="31">账户信息</a>
                    </div>
                    <div class="item" id="zhaq">
                        <a href="/ec/member/changepwd/list" tag="32">账户安全</a>
                    </div>
                    <div class="item" id="xfjl">
                        <a href="/ec/member/consumehistory/list" tag="33">消费记录</a>
                    </div>
                    <div class="item" id="jfjl">
                        <a href="/ec/member/vantages/list" tag="33">积分记录</a>
                    </div>
                    <div class="item" id="shdz">
                        <a href="/ec/member/receiver" tag="35">收货地址</a>
                    </div>
                </dd>
            </dl>
    </div><!--mc end-->
</div><!--leftMenu end-->

<script type="text/javascript">
    $(function(){
        <#if id!="">
            $("#${id}").addClass("selectedMenu");
        </#if>
    });
</script>
</#macro>

