
<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
<style>
    .order-box {
        display: -webkit-box;
        display: -moz-box;
        display: -o-box;
        display: -ms-box;
        margin-bottom: 10px;
        padding-bottom: 5px;
    }
    .order-box  .order-goods a{ display: block;; width: 100%;
        margin-bottom: 10px;
        padding-bottom: 5px;}

    #expressLog li{ line-height: 1.8; text-align: left; font-size: 14px;width: 100%; margin-left:10px; padding: 8px 0; padding-left: 10px; padding-right:15px;-webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;border-top: 1px dotted #d8d8d8; color: #999;}

    .buyer_title{
        padding: 25px 0px 0px 10px;text-align: left;font-size: 16px;
    }
    .merchant_title{
        padding: 8px 0px 0px 10px;text-align: left;font-size: 16px;
    }

    .checkQuitation {float: right; padding:5px 12px;  background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;margin-top: -4px;margin-left: 4px;}
    .checkQuitationDis {float: right; padding:5px 12px;  background: #a8a8a8;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;margin-top: -4px;margin-left: 4px;}

</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">报价单详情</h1>
</header>

<div class="mui-content wrap">
    <section class="order-con">
        <ul class="order-list">
            <li><h4 class="buyer_title">询价方</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p style="font-weight: bold;font-size: 16px!important;">${buyer.companyName}</p>
                        <p>所在地区：${buyAddress}</p>
                        <p>联系人：${buyer.linkMan}</p>
                        <p>联系电话：${buyer.likeManMobile}
                            <a style="float: right; margin-left: 10px; padding:5px 12px;  background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;margin-top: -14px;"
                               href="javascript:void(0);" onclick="viewEnquiry('${enquiry.id}');">查看询价单详情</a>
                        </p>
                    </div>
                </div>
            </li>
            <li><h4 class="merchant_title">报价方</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p style="font-weight: bold;font-size: 16px!important;">${merchant.name}</p>
                        <p>所在地区：${merchant.areaPath}${merchant.address}</p>
                        <p>联系人：${merchant.head}</p>
                        <p>联系电话：${merchant.mobile}</p>
                    </div>
                </div>
            </li>
            <li><h4 class="merchant_title">报价信息</h4></li>
            <li>
                <div class="order-box" style="padding: 15px 0px 5px 0px">
                    <div class="order-width">
                        <p>报价时间：${quotation.buyerDateTime?string("yyyy-MM-dd HH:mm:ss")}</p>
                        <p>有效期至：${quotation.quotationPeriod?string("yyyy-MM-dd HH:mm:ss")}<label
                                style="color: #ff8212"> (<#if daysType ="1"> 已过期<#else >还剩${days}天</#if>)</label></p>
                        <p>联系电话：${merchant.mobile}</p>
                        <p>报价状态：${qutationStatus}</p>
                    </div>
                </div>

                <div style="font-size: 10px;background: #FFF;border-bottom: 1px solid #d8d8d8;color: #888;margin-top: -11px;">
                    <table border="1" cellpadding="0" cellspacing="0"style="border: 1px solid #e8e8e8; width: 100%;font-size: 10px;margin-top: -1px;">
                        <tr height="45" bgcolor="#f0f8ff">
                            <td>报价产品</td>
                            <td>采购量(单位)</td>
                            <td>报价</td>
                            <td>含税</td>
                            <td>运费</td>
                            <td>小计(元)</td>
                        </tr>
                    <#list quotationDetailsList as quoDetList>
                        <tr height="60">
                            <td>${quoDetList.goodsName}</td>
                            <td>${quoDetList.purchaseNum}${quoDetList.units}</td>
                            <td><span style="color: #ff8212">￥${quoDetList.quotationPrice}</span>/${quoDetList.units}</td>
                            <td>${quoDetList.containTax}%</td>
                            <td><span style="color: #ff8212">￥${quoDetList.freight}</span></td>
                            <td><span style="color: #ff8212">￥${quoDetList.productCount}</span></td>
                        </tr>
                    </#list>
                        <tr height="85" align="right">
                            <td colspan="6">产品总额：
                        <span style="color: #ff8212">￥${quotation.totalCost}.00
                        </span>
                                <em> (含运费:￥${quotation.freightTotalCost})</em>
                            <#if daysType !="1" && quotation.isDownOrder !="2">
                                <a class="checkQuitation"
                                   href="javascript:void(0);" onclick="checkQuitation('${quotation.id}');">立即订购</a>
                            <#else >
                                <a class="checkQuitationDis"
                                   href="javascript:void(0);" onclick="return false;">立即订购</a>
                            </#if>
                            </td>
                        </tr>
                    </table>
                </div>
            </li>
            <li><h4 class="merchant_title">交易信息</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>交易方式：<#if enquiry.tradeExchange =1>支付宝<#else >${enquiry.otherTrade}</#if></p>
                        <p>备货周期：${quotation.productStock}天</p>
                        <p>收货地：${address}</p>
                        <p>税务发票：<#if quotation.invoiceType=1>不提供发票<#else >提供普通发票</#if></p>
                        <p>附件：${quotation.replenishExplain}</p>
                        <p>资质：${quotation.accessory}</p>
                    </div>
                </div>
            </li>
        </ul>
    </section>
</div>

<#include "app/ghdj/tools.ftl">
<script>
    (function(mui, doc) {

        mui.init({  });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }



    }(mui, document));
    /**
     * 查看询价单详情
     * @param id 询价单Id
     */
    function viewEnquiry(id) {
        jumpto(fullpath + '/enquiry/detail/' + id + '?whichclient=whichapp');
    }
    function checkQuitation(id){
        jumpto(fullpath + '/member/quitationcheck?whichclient=whichapp&quotationId=' + id );
    }
</script>
</body>
</html>