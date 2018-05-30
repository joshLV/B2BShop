
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
        box-sizing: border-box;border-top: 1px dotted #d8d8d8; color: #999;
    }

    .merchant_title{
        padding: 8px 0px 0px 10px;text-align: left;font-size: 16px;
    }
    .detail{
        font-size: 10px;
        font-style: oblique;
        font-weight: normal;
        margin-left: 2px;
        color: #29A3FD;
    }

</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">询价单详情</h1>
</header>

<div class="mui-content wrap">
    <div class="myorder" style="margin-top: 16px;">
    <section class="order-con">
        <ul class="order-list">
            <li>
                <h3 style="padding-top: 15px;"><a href="javascript:void(0);" onclick="return false;">${enquiry.title}</a><sup class="detail"><sup>title</sup></sup></h3>

                <div style="margin-top: 10px; background: #F0F8FF; border-top: 1px solid #d8d8d8; border-bottom: 1px solid #d8d8d8; display: inline-block; width: 100%; padding: 2px 0;"></div>
            </li>

            <li><h4 class="merchant_title">询价产品</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>产品类型：<#if enquiry.isSpot != 2 >现货/标准品<#else>加工/定制品</#if></p>
                    </div>

                </div>
                <div style="font-size: 10px;background: #FFF;border-bottom: 1px solid #d8d8d8;color: #888;margin-top: -11px;margin-left: -5px;">
                    <table border="1" cellpadding="0" cellspacing="0"style="border: 1px solid #e8e8e8; width: 100%;font-size: 10px;margin-top: -1px;">
                        <tr height="45" bgcolor="#f0f8ff">
                            <td>所属分类</td>
                            <td>产品名称</td>
                            <td>数量</td>
                            <td>单位</td>
                            <td>产品描述</td>
                        </tr>
                    <#list goods as good>
                        <tr height="60">
                            <td>${good.categoryName}</td>
                            <td>${good.goodsName}</td>
                            <td>${good.goodsNum}</td>
                            <td>${good.goodsUnit}</td>
                            <td><a href="#${good.id}">查看</a></td>
                        </tr>
                    </#list>
                    </table>
                </div>
            </li>
            <li><h4 class="merchant_title">采购要求</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>报价截止时间：<span style="color: #ff8212">${enquiry.offerEndDateTime?string("yyyy年MM月dd日HH时mm分")}</span></p>
                        <p>期望收货日期：${enquiry.expectReceivDate?string("yyyy年MM月dd日")}</p>
                        <p>收货地：<span style="color: #ff8212">${enquiry.recAddress}</span></p>
                    </div>
                </div>
            </li>
            <li><h4 class="merchant_title">对供应商要求</h4></li>
            <li>
                <div class="order-box" style="padding: 15px 0px 5px 0px">
                    <div class="order-width">
                        <p>交易方式：<#if enquiry.tradeExchange != 2>支付宝<#else>其他交易方式(${enquiry.otherTrade})</#if></p>
                        <p>发票要求：<#if enquiry.invoiceRequire == 1>无需发票<#elseif enquiry.invoiceRequire == 2>普通发票<#elseif enquiry.invoiceRequire == 2>增值发票</#if></p>
                        <p>经营地址：${enquiry.manageArea}</p>
                        <p>注册资金：${enquiry.registeredCapital}&nbsp;&nbsp;万元及以上</p>
                        <p>证照要求：${enquiry.certification}</p>
                        <p>补充说明：${enquiry.replenishExplain}</p>
                    </div>
                </div>
            </li>
            <li><h4 class="merchant_title">询价方式及隐私设置</h4></li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>询价方式：<#if enquiry.enquiryMode != 2>
                            广泛征集供应商报价<span style="font-size: 10px; color: #d8d8d8;">(供应商可以通过搜索找到您的询价单)</span>
                        <#else>
                            邀请指定供应商报价<span style="font-size: 10px;color: #d8d8d8;">(${enquiry.merchantNames})</span>
                        </#if></p>
                        <p>联系方式：<#if enquiry.contactMode != 2>报价后可见<#else>公开</#if></p>
                        <p>联系人：<span style="color: #ff8212">${enquiry.linkman}</span></p>
                        <p>电话：<span style="color: #ff8212"> ${enquiry.phone}</span></p>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    </div>

<div id="goodsAccessoryDiv">
<#list goods as good>
<div id="${good.id}" class="mui-popover" style="height: 60%;width: 80%;display: none;z-index: 999">
    <div class="mui-popover-arrow"></div>
    <div class="mui-scroll-wrapper">
        <div class="mui-scroll" >
            <ul class="mui-table-view" style="border-radius:initial;">
            <div onclick="closeGoodsAccessoryDialog('${good.id}')" class="mui-icon mui-icon-close" style="margin-right: 5px;float: right;"></div>
             ${good.goodsAccessory}
            </ul>
        </div>
    </div>
</div>
</#list>
</div>
</div>
<#include "app/ghdj/tools.ftl">
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function(mui, doc) {
        /*mui.back = function(){
            jumpto(fullpath + '/order/list?whichclient=whichapp');
        };*/
        mui.init({  });
        mui('.mui-scroll-wrapper').scroll();
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
        jQuery("#goodsAccessoryDiv").find("img").lazyload({
            effect: "fadeIn"
        });
        /**
         * 查看询价单详情
         * @param id 询价单Id
         */
        viewEnquiry = function (id) {
            jumpto(fullpath + '/enquiry/detail/' + id + '?whichclient=whichapp');
        };

        checkQuitation = function(id){
            jumpto(fullpath + '/member/quitationcheck?whichclient=whichapp&quotationId=' + id );
        }

        //关闭商品介绍弹出框
        closeGoodsAccessoryDialog = function (id){
            jQuery("#"+id).hide();
            jQuery(".mui-active").hide();
            jQuery("#"+id).removeClass('mui-active');
            /* mui('.mui-popover').hide();*/
        }
    }(mui, document));

</script>
</body>
</html>