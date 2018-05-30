<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top.ftl"/>

    <style type="text/css">
        .selected-c .a-values, .prop-attrs .a-values, .color-attr .a-values, .brand-attr .a-values {
            position: relative;
            overflow: hidden;
            float: left;
            width: 800px;
            padding-right: 0px;
        }

        div {
            display: block;
        }

        /* 筛选更多 */

        .list-more {
            float: left;
            border: 1px solid #E8E8E8;
            padding: 3px 6px 3px 6px;
        }

        .list-more a {
            display: block;
            float: left;
        }

        .list-more i {
            width: 18px;
            height: 7px;
            margin-top: 3px;
            margin-left: 3px;
            background: url(${base}/static/bec/project/gwq/images/search.ele.png) no-repeat;
            float: left;
        }

        .list-less {
            float: left;
            border: 1px solid #E8E8E8;
            padding: 3px 6px 3px 10px;
        }

        .list-less a {
            display: block;
            float: left;
        }

        .list-less i {
            width: 18px;
            height: 7px;
            margin-top: 3px;
            margin-left: 3px;
            background: url(${base}/static/bec/project/gwq/images/search.ele.png) no-repeat 0 -34px;
            float: left;
        }

        .a-values-more {
            float: left;
            overflow: hidden;
            width: 800px;
            margin-left: 100px;
        }

        .a-values-more div {
            float: left;
            overflow: hidden;
            width: 180px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }

        .a-values-more a {
            color: #005aa0
        }

        .a-values-more a.curr {
            color: #E4393C;
        }

        #filter .order .arrow_write_bottom {
            background: #005aa0;
            border: none;
        }

        #filter .order .arrow_write_bottom a {
            color: #ffffff;
        }

        #filter .order .curr b {
            background: url("${base}/static/img/top_arrow_write.png") no-repeat;
            width: 11px;
            height: 11px;
            float: left;
            margin-top: 7px;
            margin-right: 10px;
        }

        #filter .order .arrow_write_bottom b {
            background: url("${base}/static/img/bot_arrow_write.png") no-repeat;
            width: 11px;
            height: 11px;
            float: left;
            margin-top: 7px;
            margin-right: 10px;
        }

        #filter .arrow_native b {
            background: url("${base}/static/img/top_arrow.png") no-repeat;
            width: 11px;
            height: 11px;
            float: left;
            margin-top: 7px;
            margin-right: 10px;
        }

        #filter .arrow_bottom b {
            background: url("${base}/static/img/bot_arrow.png") no-repeat;
            width: 11px;
            height: 11px;
            float: left;
            margin-top: 7px;
            margin-right: 10px;
        }

    </style>
    <div class="classify_listmain">
        <#--<div class="classify_listl">-->
            <#--<strong><a-->
                    <#--href="${base}/list/${grandCatelog.id}.html?listStyle=${listStyle}">${grandCatelog.name}</a></strong>-->
        <#--<span>-->
        <#--<#if parentCatelog.id??>-->
            <#--&nbsp;&gt;&nbsp;-->
		    <#--<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html?listStyle=${listStyle}">${parentCatelog.name}</a>-->
        <#--</#if>-->
            <#--<#if catelog.id??>-->
                <#--&nbsp;&gt;&nbsp;-->
                <#--<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?listStyle=${listStyle}">${catelog.name}</a>-->
            <#--</#if>-->
	    <#--</span>-->
        <#--&lt;#&ndash;<strong><a href="${base}/list/${grandCatelog.id}.html">${grandCatelog.name}</a></strong>&ndash;&gt;-->
        <#--</div>-->
        <div class="classify_listr">
            <div id="select">
                <div class="mt"><h1>
                    <#if catelog.id??>${catelog.name}
                    <#elseif parentCatelog.id??>
                    ${parentCatelog.name}
                    <#else>
                    ${grandCatelog.name}
                    </#if>
                    -<strong>&nbsp;商品筛选</strong></h1></div>
                <div class="mc attrs">
                    <div class="brand-attr">
                        <div class="attr">
                            <div class="a-key">品牌：</div>
                            <div class="a-values">
                                <div class="v-tabs">
                                    <div class="tabcon">
                                        <#list brandList as brand>
                                            <#if brand_index == 8 >
                                                <#break>
                                            </#if>
                                            <div id="brand_id_19570" rel="y" more="false">
                                                <a <#if brand.id==brandFlag>class="curr"</#if>
                                                   href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                                                   title="${brand.name}">${brand.name}</a>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                            </div>

                            <div class="list-more" id="more_btn" <#if brandMore == 'true' >style="display: none; "</#if>
                                 onclick="$('#less_btn').show();$('#more_btn').hide();$('#brand_more').show();">
                                <a href="javascript:void(0)">更多</a><i></i>
                            </div>
                            <div class="list-less" id="less_btn" <#if brandMore != 'true' >style="display: none;"</#if>
                                 onclick="$('#less_btn').hide();$('#more_btn').show();$('#brand_more').hide();">
                                <a href="javascript:void(0)">收起</a><i></i>
                            </div>
                            <div id="brand_more" class="a-values-more"
                                 <#if brandMore != 'true' >style="display: none; "</#if>>
                                <#list brandList as brand>
                                    <#if brand_index &gt;= 8 >
                                        <div id="brand_id_19570" rel="y" more="false">
                                            <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                        <#--<a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"-->
                                        <#--title="${brand.name}">${brand.name}</a>-->
                                            <a <#if brand.id==brandFlag>class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&brand=${brand.id}&brandMore=true&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                                               title="${brand.name}">${brand.name}</a>
                                            <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                        </div>
                                    </#if>
                                </#list>
                            </div>


                        </div>
                    </div>
                    <div class="prop-attrs">
                        <div class="attr">
                            <div class="a-key">价格：</div>
                            <div class="a-values">
                                <div class="v-fold">
                                    <ul class="f-list">
                                        <!--价格中增加 品牌与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                        <li>
                                            <a <#if priceFlag=="M0L199">class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&price=M0L199&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">0-199</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M200L499">class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&price=M200L499&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">200-499</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M500L999">class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&price=M500L999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">500-999</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M1000L4999">class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&price=M1000L4999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">1000-4999</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M5000">class="curr"</#if>
                                               href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&price=M5000&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">&ge;5000</a>
                                        </li>

                                        <!-- 自定义价格区间 -->
                                        <li>
                                            <input id="priS" type="text" style="width:39px;border: 1px solid #E8E8E8;"
                                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
                                                   value="${priS}"/>
                                            <em style="float: none;margin-right: 0px;">-</em>
                                            <input id="priE" type="text" style="width:39px;border: 1px solid #E8E8E8;"
                                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
                                                   value="${priE}"/>
                                            <input type="button" value="确定" onclick="javascript:searchPriceArea();"/>
                                        </li>
                                        <!-- #自定义价格区间 -->
                                        <!--价格中增加 品牌与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                    </ul>
                                </div>
                                <div class="v-option hide"><span class="o-more unfold"><b></b>收起</span></div>
                            </div>
                        </div>
                    </div>

                    <div id="filter">
                        <div class="cls"></div>
                        <div class="fore1">
                            <dl class="order">
                                <dt>排序：</dt>
                                <dd <#if pager.orderBy=="sales" && pager.orderType=="desc">class="arrow_write_bottom"
                                    <#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="curr"
                                    <#else>class="arrow_native"</#if>>
                                    <#if pager.orderBy=="sales" && pager.orderType=="desc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                                    <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                                    <#else>
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                                    </#if>
                                </dd>
                                <dd <#if pager.orderBy=="price" && pager.orderType=="desc">class="arrow_write_bottom"
                                    <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="curr"
                                    <#else>class="arrow_native"</#if>>
                                    <#if pager.orderBy=="price" && pager.orderType=="desc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                                    <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                                    <#else>
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                                    </#if>
                                </dd>
                                <dd <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="arrow_write_bottom"
                                    <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="curr"
                                    <#else>class="arrow_native"</#if>>
                                    <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                                    <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                                    <#else>
                                        <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                                    </#if>
                                </dd>
                            </dl>
                            <div class="goods-search">
                                <dl>
                                    <dd>
                                        <em>商品简称</em>
                                        <input type="text" class="goods-names" value="" name="search_shortName" id="search_shortName">
                                    </dd>
                                    <dd>
                                        <em>商家名称</em>
                                        <input type="text" class="goods-names" value="" name="search_shopName" id="search_shopName">
                                        <input type="button" value="搜索" class="search-button" onclick="javascript:searchGoodsInfo();"/>
                                    </dd>
                                    <dd>
                                        <input type="button" value="转为缩略图" class="change-button"
                                               onclick="javascript:changeJsp();"/>
                                    </dd>
                                </dl>
                            </div>
                            <div class="pagin pagin-m hide">
                                <span class="text"><i>1</i>/152</span>
                                <span class="prev-disabled">上一页<b></b></span>
                                <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&page=2"
                                   class="next">下一页<b></b></a>
                            </div>
                            <div class="total">
                                <span>共<strong>${total}</strong>个商品</span>
                            </div>
                            <span class="clr"></span>
                        </div>
                    </div>
                <#--<div id="plist" class="plist-n7a ordinary-prebuy" style="float: left;">-->
                <#--<ul class="list-h">-->

                <#--</ul>-->
                <#--</div>-->
                    <div class="categories_list">
                        <div id="show">
                            <div class="categories_box1">
                                <input type="hidden" value="${isLogin}" id="isLogin">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="55">
                                            <input type="checkbox" id="allcheck" class="s_checkbox">全选
                                        </td>
                                        <td width="270">商品信息</td>
                                        <td width="145">商品简称</td>
                                        <td width="145">所属商家</td>
                                        <td width="130">商品规格</td>
                                        <td width="125">会员价</td>
                                        <td width="100">当前价格</td>
                                        <td width="105" style="text-align: center; padding-left: 0;">数量</td>
                                        <td width="50">库存</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="categories_box2" id="product-list">
                                <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <#list goodslist as goods>
                                            <tr class="shopping_list" id="product_${goods.id}">
                                                <#if goods.ypice != null && goods.ypice != "0.00">
                                                    <input type="hidden" name="" value="${goods.ypice}" id="defStartBatchPrice_${goods.id}" />
                                                <#else >

                                                    <input type="hidden" name="" value="${goods.price?string("currency")}" id="defStartBatchPrice_${goods.id}" />
                                                </#if>
                                                <td width="55">
                                                    <input type="hidden" name="goodsNumId" value="${goods.total}" id="defStartBatchNum_${goods.id}" />
                                                    <input type="checkbox" id="checkbox_${goods.id}" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.merchantId}" </#if>/>
                                                </td>
                                                <td width="270">
                                                    <a href="${base}/item/${goods.id}.html" target="_blank">
                                                        <#--<img src="${goods.pic}@67w_66h.png" width="67" height="66" alt="${goods.name}" class="shop_imgs"/>-->
                                                        <a href="${base}/item/${goods.id}.html" target="_blank">${goods.name}</a>

                                                    <div id="sp_${goods.id}" style="color:#666; margin-top: 5px;">
                                                    <#--${goods.specification}-->
                                                    </div>
                                                </td>
                                                <td width="145">
                                                    ${goods.shortName}
                                                </td>
                                                <td width="145">
                                                ${goods.shopName}
                                                </td>
                                                <td width="130">
                                                    <#if goodsSpList??>
                                                        <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                                        ${sp.name}:
                                                            <select name="goodsSp_${goods.id}" spid="${sp.id}" spname="${sp.name}">
                                                                <#list goodsSpList["${goods.id}"]["goodsSpItemList"] as item>
                                                                    <#if item.specificationId == sp.id>
                                                                        <option value="${sp.name}:${item.name}" <#if item_index==0>selected="selected"</#if>>${item.name}</option>
                                                                    </#if>
                                                                </#list>
                                                            </select><br>
                                                        </#list>
                                                    </#if>
                                                </td>
                                                <td width="125">
                                                    <#if goods.batchPrice != null && goods.batchPrice != "0.00~0.00">
                                                        <input type="hidden" value="1" name="name" id="ifBatchPriceId_${goods.id}" />
                                                        ￥${goods.batchPrice}
                                                    <#else >
                                                        <input type="hidden" value="0" name="name" id="ifBatchPriceId_${goods.id}" />
                                                    ${goods.price?string("currency")}
                                                    </#if>
                                                </td>
                                                <td width="100">
                                                    <span id="${goods.id}_nowPrice">
                                                        <#if goods.ypice != null && goods.ypice != "0.00">
                                                            ￥${goods.ypice}
                                                        <#else >
                                                        ${goods.price?string("currency")}
                                                        </#if>
                                                    </span>
                                                </td>
                                                <td width="105" class="shop_grey">
                                                    <#if 0<goods.stock>
                                                        <input type="text" name="textfield" id="textfield" value="-"
                                                               class="shop_add" readonly="ture" onfocus="this.blur()"
                                                               onclick="javascript:reduce('${goods.id}');">
                                                        <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                               class="shop_number" placeholder="1"
                                                               onblur="change('${goods.id}','${goods.price}')"
                                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                               value="${goods.total}"
                                                               onchange="change('${goods.id}')" ;>
                                                        <input type="text" name="textfield3" id="textfield3" value="+"
                                                               class="shop_add" readonly="ture" onfocus="this.blur()"
                                                               onclick="javascript:add('${goods.id}');">
                                                    <#else>
                                                        <input type="text" name="textfield" id="textfield" value="-"
                                                               class="shop_add" readonly="ture" onfocus="this.blur()">
                                                        <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                               class="shop_number" placeholder="1" readonly="ture"
                                                               value="0" onfocus="this.blur()">
                                                        <input type="text" name="textfield3" id="textfield3" value="+"
                                                               class="shop_add" readonly="ture" onfocus="this.blur()">
                                                    </#if>

                                                </td>
                                                <td width="50" class="shop_grey">
                                                    <#if goods.stock<=0>
                                                        0
                                                    <#else>
                                                    ${goods.stock}
                                                    </#if>

                                                </td>
                                            </tr>
                                        </#list>
                                    </table>
                                </form>

                            </div>
                            <div class="categories_box3">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="shop_box3_left">
                                            <span id="showinfo" style="color: red;"></span>
                                        </td>
                                        <td class="shop_box3_right" colspan="2">
                                            <div style="float:right; padding: 10px 20px 0px 0px">
                                                <a href="#" class="shop_settlement" id="toSettlement">加入购物车</a>
                                                <a href="${base}/member/popuplogin"
                                                   title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin"></a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="clearfix"
                         style="float: right; margin-top: 10px; margin-bottom: 10px; margin-right: 10px;">
                        <div class="pagin fl">
                            <#if (pager.list?size > 0)>
                                <#import "bec/gwq/pager.ftl" as p>
                            <#--分页时增加价格与品牌条件 Auth:zhangqiang Time:2015-09-28 13:47:25 Start -->
                                <#if parentCatelog.id?? && catelog.id?? &&  grandCatelog.id??>
                                <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html" />-->
                                    <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?listStyle=${listStyle}&price=${priceFlag}&brand=${brandFlag}" />
                                <#elseif parentCatelog.id?? && grandCatelog.id??>
                                <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html" />-->
                                    <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html?listStyle=${listStyle}&price=${priceFlag}&brand=${brandFlag}" />
                                <#else>
                                <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html" />-->
                                    <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html?listStyle=${listStyle}&price=${priceFlag}&brand=${brandFlag}" />
                                </#if>
                            <#--分页时增加价格与品牌条件 Auth:zhangqiang Time:2015-09-28 13:47:25 End -->
                            <#else>
                                <div class="noRecord">
                                    尚未发布任何信息!
                                </div>
                            </#if>
                        </div>
                    </div>

                </div>
                <div class="clr"></div>
            </div>
        </div>
    </div>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
    <script type="text/javascript">
        $(function () {
            var $allcheck1 = $("#allcheck");// 全选复选框
            var $cartIds = $("#product-list input[name='cartId']");// ID复选框
            // 全选
            $allcheck1.click( function() {
                var $this = $(this);
                $cartIds.prop("checked", $this.prop("checked"));

            });

            $("#toSettlement").on('click', goToGoodsCars);
        });

        function goToGoodsCars(){
            //判断是否存在选中的商品，如果无，不进入结算页面
            var selected = $("input[name='cartId']:checked");

            if(selected != 'undefined' && selected != null && selected.length != 0){
                try {
                    var goodsIds = '';
                    var i = 0;
                    $(selected).each(function(){
                        if(i > 0){
                            goodsIds += '--';
                        }
                        goodsIds += $(this).val();
                        goodsIds += "_"+$("#nowGoodsNum_"+$(this).val()).val();

                        //组装规格
                        if( $('select[name="goodsSp_'+ $(this).val() +'"]').length > 0 ){
                            var sp = '';
                            var j = 0;
                            $("select[name='goodsSp_"+ $(this).val() +"']").each(function(){
                                if(j > 0){
                                    sp += ","
                                }
                                sp += $(this).val();
                                j++;
                            });
                            goodsIds += '_' + sp;
                        }

                        i++;
                    });
                    window.location.href = "${base}/cart/addBatch?goodsIds=" + goodsIds + "&backurl=" + window.location.href

                }catch (e) {
                }
            }else{
                layer.alert("请至少选中一件商品!",{icon:7});
            }
        }

        /**
         * Desc:商品数量执行减去操作
         * @param goodsId
         * @param goodsPrice
         */
        function reduce(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //减1之后的商品数量
            var reduceGoodsNum = parseInt(nowGoodsNum) - 1;
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断减去之后的数量是否小于起批数量
                if(reduceGoodsNum <defStartBatchNum){
                    layer.alert("商品数量不能小于起批数量!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+reduceGoodsNum+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(reduceGoodsNum);
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(reduceGoodsNum <1){
                    layer.alert("商品数量不能小于1!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(reduceGoodsNum));
                }
            }
        }

        /**
         * Desc:商品数量执行改变操作
         * @param goodsId
         * @param goodsPrice
         */
        function change(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断改变之后的数量是否小于起批数量
                if(parseInt(nowGoodsNum) <defStartBatchNum){
                    layer.alert("商品数量不能小于起批数量!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else if(parseInt(nowGoodsNum) >100000){
                    layer.alert("商品数量不能大于于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+parseInt(nowGoodsNum)+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(parseInt(nowGoodsNum) <1){
                    layer.alert("商品数量不能小于1!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else if(parseInt(nowGoodsNum) >100000){
                    layer.alert("商品数量不能大于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
                }
            }
        }

        function add(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //加1之后的商品数量
            var addGoodsNum = parseInt(nowGoodsNum) + 1;
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断减去之后的数量是否小于起批数量
                if(addGoodsNum >100000){
                    layer.alert("商品数量不能大于于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(addGoodsNum >100000){
                    layer.alert("商品数量不能大于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                }
            }
        }

        /**
         * Desc:页面切换
         * Auth:zhangqiang
         * Time:2016-01-30
         */
        function changeJsp() {
            window.location.href = "${base}/list/${grandCatelog.id}.html";
        }

        /**
         * Desc:搜索商品信息
         * Auth:zhangqiang
         * Time:2016-01-30
         */
        function searchGoodsInfo(){
            //获取商品简称
            var goodsShortName = $("#search_shortName").val();
            //获取商家名称
            var shopName = $("#search_shopName").val();

            if(isEmpty(goodsShortName) && isEmpty(shopName)){
                layer.alert("请输入要搜索的内容!", {icon: 7});
                return;

            }else{
                if(goodsShortName.length > 20){
                    layer.alert("商品简称长度不能超过20个字符!", {icon: 7});
                    return;
                }

                if(shopName.length > 10){
                    layer.alert("商家名称长度不能超过10个字符!", {icon: 7});
                    return;
                }

            }
            window.location.href = "${base}/list/${grandCatelog.id}.html?listStyle=${listStyle}&goodsShortName="+goodsShortName+"&shopName="+shopName;

        }

        /**
         * 判断是否是空
         * @param value
         */
        function isEmpty(value){
            if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
                return true;
            }
            else{
                value = (value+"").replace(/\s/g,'');
                if(value == ""){
                    return true;
                }
                return false;
            }
        }
    </script>

</#escape>