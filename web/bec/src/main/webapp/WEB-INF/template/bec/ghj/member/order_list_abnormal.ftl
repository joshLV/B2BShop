<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>

<div id="container" class="f-cb">
    <#include "bec/ghj/top.ftl"/>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list.html?orderType_=0">订单中心</a></strong><span>&nbsp;&gt;&nbsp;我的差异单<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <!-- leftMenu-->
            <#--<#include "bec/ghj/member/leftmenu.ftl"/>-->
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="ol"/>
            <!--leftMenu end-->
        </div>

       <div class="zyf_xunjia_list2">
           <h1 class=" f-cb"><em>差异单</em><span class="export_cyd"><a href="${base}/order/exportOrderAbnormal/${orderSn}.html">导出差异单</a></span></h1>
           <div class="user_right p0">
               <table cellpadding="0" cellspacing="0" width="100%" class="cyd_table">
                   <thead>
                   <tr>
                       <th width="16%">商品信息</th>
                       <th width="15%">商品名称</th>
                       <th width="15%">商品条码</th>
                       <th width="13%">原始订单数量</th>
                       <th width="13%">确认订单后数量</th>
                       <th width="14%">差异数量</th>
                       <#--<th width="14%">原始订单价格</th>
                       <th width="14%">确认订单后价格</th>-->
                   </tr>
                   </thead>
                   <tbody>
                   <tr><td colspan="7" bgcolor="#fafafa" style="text-align: left;"><span class="f13">差异商品</span></td></tr>
                    <#list hasAbnormalItems as item>
                   <tr>
                       <td width="14%">
                          <#-- <a href="${base}/item/${item.goodsId}.html" target="_blank">
                               <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                           </a>-->
                          <a>
                              <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                          </a>
                       </td>
                       <td width="17%">${item.goodsName}</td>
                       <td width="15%"><#--<a href="${base}/item/${item.goodsId}.html" target="_blank">${item.barcode}</a>-->
                           <a>${item.barcode}</a>
                       </td>
                       <td width="13%">${item.oldQuantity}</td>
                       <td width="13%">${item.newQuantity}</td>
                       <td width="14%">${item.quantityAbnormal}</td>
                       <#--<td width="14%">${item.oldGoodsPrice}</td>
                       <td width="14%">${item.newGoodsPrice}</td>-->
                   </tr>
                    </#list>
                   <tr><td colspan="7" bgcolor="#fafafa" style="text-align: left;"><span class="f13">无货商品</span></td></tr>
                       <#list noAbnormalGoodsItems as item>
                       <tr>
                           <td width="14%">
                               <#--<a href="${base}/item/${item.goodsId}.html" target="_blank">
                                   <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                               </a>-->
                               <a>
                                   <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                               </a>
                           </td>
                           <td width="17%">${item.goodsName}</td>
                           <td width="15%"><#--<a href="${base}/item/${item.goodsId}.html" target="_blank">${item.barcode}</a>-->
                               <a>${item.barcode}</a>
                           </td>
                           <td width="13%">${item.oldQuantity}</td>
                           <td width="13%">${item.newQuantity}</td>
                           <td width="14%">${item.quantityAbnormal}</td>
                           <#--<td width="14%">${item.oldGoodsPrice}</td>
                           <td width="14%">${item.newGoodsPrice}</td>-->
                       </tr>
                       </#list>
                   <tr><td colspan="7" bgcolor="#fafafa" style="text-align: left;"><span class="f13">无差异商品</span></td></tr>
                       <#list noAbnormalItems as item>
                       <tr>
                           <td width="14%">
                               <#--<a href="${base}/item/${item.goodsId}.html" target="_blank">
                                   <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                               </a>-->
                               <a>
                                   <img src="${item.pic}@50w_50h.png" title="${item.goodsName}" height="50" width="50">
                               </a>
                           </td>
                           <td width="17%">${item.goodsName}</td>
                           <td width="15%"><#--<a href="${base}/item/${item.goodsId}.html" target="_blank">${item.barcode}</a>-->
                               <a>${item.barcode}</a>
                           </td>
                           <td width="13%">${item.oldQuantity}</td>
                           <td width="13%">${item.newQuantity}</td>
                           <td width="14%">${item.oldQuantity-item.newQuantity}</td>
                           <#--<td width="14%">${item.oldGoodsPrice}</td>
                           <td width="14%">${item.newGoodsPrice}</td>-->
                       </tr>
                       </#list>

                   </tbody>




               </table>

           </div>




       </div>








        </div>
    </div>
</div>

<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
</script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>