<#macro menu id>
<div class="columnleft" id="myYihaodianLeftMenu" style="display: block; float: left;">
    <div class="member_tit">个人中心 </div>
    <div class="menuDiv">
        <h3><i class="iconDian"></i>订单中心</h3>
        <ul>
            <li id="ol">
                <a href="${base}/order/list?orderType_=0">我的订单</a>
            </li>
            <li id="ol2">
                <a href="${base}/order/list?orderType_=1">众筹订单</a>
            </li>
            <#--<li id="tkdlb">-->
                <#--<a href="${base}/member/refund/list">我的退款单</a>-->
            </li>
            <#if loginType != 'operator'>
                <li id="sppj">
                    <a href="${base}/order/review.html">我的评价</a>
                </li>
            <#else>
                <#if role?index_of("buyer")!= -1>
                    <li id="sppj">
                        <a href="${base}/order/review.html">我的评价</a>
                    </li>
                </#if>
            </#if>
            <li id="ol5">
                <a href="${base}/cart/list.html?cartType=menu">我的购物车</a>
            </li>
        </ul>
    </div>
    <#if loginType != 'operator'>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>采购单管理</h3>
            <ul>
                <li id="purchaseOrder_list">
                    <a href="${base}/purchaseOrder/list">采购比价单</a>
                </li>
            </ul>
        </div>
    <#else>
        <#if role?index_of("buyer")!= -1>
            <div class="menuDiv">
                <h3><i class="iconDian"></i>采购单管理</h3>
                <ul>
                    <li id="purchaseOrder_list">
                        <a href="${base}/purchaseOrder/list">采购比价单</a>
                    </li>
                </ul>
            </div>
        </#if>
    </#if>
    <#if loginType != 'operator'>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>询价单</h3>
            <ul>
                <li>
                    <a href="${base}/enquiry/publish.html" target="_blank">发布询价单</a>
                </li>
                <li id="xjdlb">
                    <a href="${base}/enquiry/list.html">所有询价单</a>
                </li>
            </ul>
        </div>
    <#else>
        <#if role?index_of("buyer")!= -1>
            <div class="menuDiv">
                <h3><i class="iconDian"></i>询价单</h3>
                <ul>
                    <li>
                        <a href="${base}/enquiry/publish.html" target="_blank">发布询价单</a>
                    </li>
                    <li id="xjdlb">
                        <a href="${base}/enquiry/list.html">所有询价单</a>
                    </li>
                </ul>
            </div>
        </#if>
    </#if>

    <div class="menuDiv">
        <h3><i class="iconDian"></i>账户中心</h3>
        <ul>
            <li id="user_info">
                <a href="${base}/member/info.html">账户信息</a>
            </li>
            <li id="changePWD">
                <a href="${base}/member/changepwd/list">账户安全</a>
            </li>

            <#if loginType != 'operator'>
                <li id="xfjl">
                    <a href="${base}/member/consumehistory/list">消费记录</a>
                </li>
                <li id="memberScore">
                    <a href="${base}/member/vantages/list">积分记录</a>
                </li>
            <#else>
                <#if role?index_of("payment")!= -1>
                    <li id="xfjl">
                        <a href="${base}/member/consumehistory/list">消费记录</a>
                    </li>
                    <li id="memberScore">
                        <a href="${base}/member/vantages/list">积分记录</a>
                    </li>
                </#if>
            </#if>

            <#if loginType != 'operator'>
                <li id="memberReceiver">
                    <a href="${base}/member/receiver">收货地址</a>
                </li>
                <li id="memberB2BGoodsAttention">
                    <a href="${base}/member/goodsattention/list">我的关注</a>
                </li>
                <li id="memberB2BHistory">
                    <a href="${base}/member/history/list">浏览历史</a>
                </li>
            <#else>
                <#if role?index_of("buyer")!= -1>
                    <li id="memberReceiver">
                        <a href="${base}/member/receiver">收货地址</a>
                    </li>
                    <li id="memberB2BGoodsAttention">
                        <a href="${base}/member/goodsattention/list">我的关注</a>
                    </li>
                    <li id="memberB2BHistory">
                        <a href="${base}/member/history/list">浏览历史</a>
                    </li>
                </#if>
            </#if>
        </ul>
    </div>

    <#if loginType != 'operator'>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>操作员管理</h3>
            <ul>
                <li id="buyerOperator">
                    <a href="${base}/buerOperator/list">操作员管理</a>
                </li>
            </ul>
        </div>
    </#if>

    <!-- 20160505 dzz 注销授信部分功能菜单 -->
    <#if loginType != 'operator'>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>资产中心</h3>
            <ul>
            <#--<li id="credit_list">
                <a href="${base}/credit/list">授信申请</a>
            </li>
            <li id="creditReply_list">
                <a href="${base}/creditLoanLog/getCreditReplyList">放款申请</a>
            </li>
            <li id="creditUsedLog">
                <a href="${base}/credit/useList">授信操作记录</a>
            </li> -->
            <li id="account_charge">
                <a href="${base}/account/recharge">账户充值</a>
            </li>
            <li id="account_chargeList">
                <a href="${base}/account/rechargeList">账户充值记录</a>
            </li>
            <#--<li id="bankcard_list">
                <a href="${base}/bankCard/list">银行卡</a>
            </li>-->
        </ul>
    </div>
<#else>
    <#if role?index_of("payment")!= -1>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>资产中心</h3>
            <ul>
            <#--<li id="credit_list">
                <a href="${base}/credit/list">授信管理</a>
            </li>
            <li id="creditReply_list">
                <a href="${base}/creditLoanLog/getCreditReplyList">放款申请</a>
            </li>
            <li id="creditUsedLog">
                <a href="${base}/credit/useList">授信使用记录</a>
            </li> -->
            <li id="account_charge">
                <a href="${base}/account/recharge">账户充值</a>
            </li>
            <#--<li id="account_chargeList">
                <a href="${base}/account/rechargeList">账户充值记录</a>
            </li>
            <li id="bankcard_list">
                <a href="${base}/bankCard/list">银行卡</a>
            </li> -->
        </ul>
    </div>
</#if>
</#if>

    <#if loginType != 'operator'>
        <div class="menuDiv">
            <h3><i class="iconDian"></i>红包管理</h3>
            <ul>
                <li id="redenvelopRecord_list">
                    <a href="${base}/vmredenvelopaccount/getRedenvelopRecord">红包信息</a>
                </li>
            </ul>
        </div>
    <#else>
        <#if role?index_of("payment")!= -1>
            <div class="menuDiv">
                <h3><i class="iconDian"></i>红包管理</h3>
                <ul>
                    <li id="redenvelopRecord_list">
                        <a href="${base}/vmredenvelopaccount/getRedenvelopRecord">红包信息</a>
                    </li>
                </ul>
            </div>
        </#if>
    </#if>

    <#if loginType != 'operator' || (loginType == 'operator' && role?index_of("buyer") != -1 )>
    <div class="menuDiv">
        <h3><i class="iconDian"></i>销售数据</h3>
        <ul>
            <li id="xssjdr">
                <a href="${base}/toolsHks/list.html" target="_blank">销售数据导入</a>
            </li>
        </ul>
    </div>
    </#if>

    <div class="menuDiv">
        <h3><i class="iconDian"></i>帮助中心</h3>
        <ul>
            <li id="helpCenter">
                <a href="${base}/help/question/254774992435150848.html" target="_blank">帮助</a>
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
        });/*.mouseout(function(){
            $(this).delay(500).removeClass("current");
            $(".menuDiv:eq("+index2+") li:eq("+index1+")").delay(1000).addClass("current");
        });*/
    });
</script>

</#macro>