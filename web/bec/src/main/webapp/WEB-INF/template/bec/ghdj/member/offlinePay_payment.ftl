<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top2.ftl"/>
<style xmlns="http://www.w3.org/1999/html">
    .orderbody .mc{ border-bottom: 0;}
    .banking{border-bottom: 0;margin: 0px 20px;}
</style>
<script type="text/javascript">
    function checkFile(){
        if (document.all.file1.value!="") {
            return true;
        }else {
            layer.alert("请选择支付凭证！",{icon:2});
            return false;
        }

    }
</script>
<div class="main f-cb">
    <h1 class="order_tit">上传支付凭证</h1>
    <div class="order_info">
        <div class="orderbody">
            <div class="mc">
                <s class="icon-succ04"></s>
                <div style="width: 1100px; float: left;">
                    <h3 class="orderinfo">订单已经提交成功，请您尽快上传支付凭证</h3>
                    <div class="pay-total">总支付金额：<strong class="ftx-01" >￥${order.totalAmount?number?string("##0.00")}</strong>元<br></div>
                </div>
                <ul class="list-orderinfo">
                    <li>订单号：${order.orderSn}</li>
                    <li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount?number?string("##0.00")}</strong> 元</li>
                </ul>
                <p class="mb-tip">请您在提交订单后<span class="ftx-04">72小时</span>内完成支付，否则订单会自动取消。</p>
            </div>
        </div>
        <div class="banking">
            <h4 class="tit-sub">
                <strong>账号信息</strong>
            </h4>
            <div class="payment-xz">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="20%">公司名称</th>
                        <th width="80%"></th>
                    </tr>
                    <tr>
                        <td width="20%">开户行</td>
                        <td width="80%"></td>
                    </tr>
                    <tr>
                        <td width="20%">转账账号信息</td>
                        <td width="80%"></td>
                    </tr>
                    <tr>
                        <td width="20%">支付金额</td>
                        <td width="80%"><strong class="ftx-01" >￥${order.totalAmount?number?string("##0.00")}</strong>元</td>
                    </tr>
                </table>
            </div>
            <h4 class="tit-sub">
                <strong>上传支付凭证</strong>
            </h4>
            <div class="payment-xz">
                <form method="POST" onsubmit="return checkFile()" action="${base}/payment/merge/addOfflinePay" enctype="multipart/form-data">
                    <input type="hidden" value="${order.orderSn}" name="orderSn"/>
                    <table cellpadding="0" cellspacing="0" class="OfflinePayTable">
                        <tr>
                            <td width="20%"><b style="color:#f00;">*</b>凭证一</td>
                            <td width="80%">
                                <input type="file" id="file1" accept="image/*" name="file" class="inp_text2" datatype="img"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">凭证二</td>
                            <td width="80%"><input type="file" accept="image/*" name="file" class="inp_text2" datatype="img"/></td>
                        </tr>
                        <tr>
                            <td width="20%">凭证三</td>
                            <td width="80%"><input type="file" accept="image/*" name="file" class="inp_text2" datatype="img"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="inp_sub inp_sub2" id="submit_btn" value="上传"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>