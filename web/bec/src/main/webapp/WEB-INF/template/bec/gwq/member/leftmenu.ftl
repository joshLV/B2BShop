<#macro menu id>
<div class="columnleft" id="myYihaodianLeftMenu" style="display: block; float: left;">
    <div class="menuDiv">
        <h3>订单中心</h3>
        <ul>
            <li id="ol">
                <a href="${base}/order/list">我的订单</a>
            </li>
            <li id="tkdlb">
                <a href="${base}/member/refund/list">我的退款单</a>
            </li>
            <li id="sppj">
                <a href="${base}/order/review.html">我的评价</a>
            </li>
        </ul>
    </div>
    <div class="menuDiv">
        <h3>询价单</h3>
        <ul>
            <li>
                <a href="${base}/enquiry/publish.html" target="_blank">发布询价单</a>
            </li>
            <li id="xjdlb">
                <a href="${base}/enquiry/list.html">所有询价单</a>
            </li>
        </ul>
    </div>
    <div class="menuDiv">
        <h3>账户中心</h3>
        <ul>
            <li id="user_info">
                <a href="${base}/member/info.html">账户信息</a>
            </li>
            <li id="changePWD">
                <a href="${base}/member/changepwd/list">账户安全</a>
            </li>
            <li id="xfjl">
                <a href="${base}/member/consumehistory/list">消费记录</a>
            </li>
            <li id="memberScore">
                <a href="${base}/member/vantages/list">积分记录</a>
            </li>
            <li id="memberReceiver">
                <a href="${base}/member/receiver">收货地址</a>
            </li>
            <li id="memberB2BGoodsAttention">
                <a href="${base}/member/goodsattention/list">我的关注</a>
            </li>
            <li id="memberB2BHistory">
                <a href="${base}/member/history/list">浏览历史</a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        <#if id!="">
            $("#${id}").addClass("current");
        </#if>
        var index1,index2;
        index1 = $(".current").index();
        index2 = $(".current").parents(".menuDiv").index();
        $(".columnleft li").mouseover(function(){
            $(".columnleft li").removeClass("current");
            $(this).addClass("current");
        }).mouseout(function(){
            $(this) .removeClass("current");
            $(".menuDiv:eq("+index2+") li:eq("+index1+")").addClass("current");
        });
    });
</script>

</#macro>