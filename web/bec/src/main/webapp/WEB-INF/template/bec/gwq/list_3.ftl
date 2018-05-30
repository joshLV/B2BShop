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




        .list-more{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 6px;}
        .list-more a{display: block; float: left;}
        .list-more i{width: 18px; height: 7px; margin-top: 3px; margin-left: 3px;  background: url(${base}/static/bec/project/gwq/images/search.ele.png) no-repeat; float: left;}
        .list-less{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 10px;}
        .list-less a{display: block; float: left;}
        .list-less i{width: 18px; height: 7px; margin-top: 3px; margin-left: 3px;  background: url(${base}/static/bec/project/gwq/images/search.ele.png) no-repeat 0 -34px; float: left;}
        .a-values-more{float: left;overflow: hidden;width: 800px; margin-left: 100px;}
        .a-values-more div {
            float: left;
            overflow: hidden;
            width: 180px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }
        .a-values-more a{color: #005aa0}
        .a-values-more a.curr {
            color: #E4393C;
        }


        #filter .order .arrow_write_bottom{background: #005aa0; border: none; }
        #filter .order .arrow_write_bottom a{color: #ffffff;}
        #filter .order .curr b{background: url("${base}/static/img/top_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .order .arrow_write_bottom b{background: url("${base}/static/img/bot_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .arrow_native b{background: url("${base}/static/img/top_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .arrow_bottom b{background: url("${base}/static/img/bot_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}

    </style>
    <input type="hidden" value="${priceHide}" id="priceHide">
    <div class="classify_listmain">
        <#--<div class="classify_listl">-->
            <#--<strong><a href="${base}/list/${grandCatelog.id}.html">${grandCatelog.name}</a></strong>-->
        <#--<span>-->
        <#--<#if parentCatelog.id??>-->
            <#--&nbsp;&gt;&nbsp;-->
		    <#--<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html">${parentCatelog.name}</a>-->
        <#--</#if>-->
            <#--<#if catelog.id??>-->
                <#--&nbsp;&gt;&nbsp;-->
                <#--<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html">${catelog.name}</a>-->
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
                                                <a <#if brand.id==brandFlag>class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                                                   title="${brand.name}">${brand.name}</a>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                            </div>

                            <div class="list-more" id="more_btn" <#if brandMore == 'true' >style="display: none; "</#if> onclick="$('#less_btn').show();$('#more_btn').hide();$('#brand_more').show();">
                                <a href="javascript:void(0)">更多</a><i></i>
                            </div>
                            <div class="list-less" id="less_btn" <#if brandMore != 'true' >style="display: none;"</#if>  onclick="$('#less_btn').hide();$('#more_btn').show();$('#brand_more').hide();">
                                <a href="javascript:void(0)">收起</a><i></i>
                            </div>
                            <div id="brand_more" class="a-values-more" <#if brandMore != 'true' >style="display: none; "</#if>>
                                <#list brandList as brand>
                                    <#if brand_index &gt;= 8 >
                                        <div id="brand_id_19570" rel="y" more="false">
                                            <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                        <#--<a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"-->
                                        <#--title="${brand.name}">${brand.name}</a>-->
                                            <a <#if brand.id==brandFlag>class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&brandMore=true&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
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
                                            <a <#if priceFlag=="M0L199">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M0L199&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">0-199</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M200L499">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?&price=M200L499&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">200-499</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M500L999">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M500L999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">500-999</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M1000L4999">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M1000L4999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">1000-4999</a>
                                        </li>
                                        <li>
                                            <a <#if priceFlag=="M5000">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M5000&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">&ge;5000</a>
                                        </li>

                                        <!-- 自定义价格区间 -->
                                        <li>
                                            <input id="priS" type="text" style="width:39px;border: 1px solid #E8E8E8;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${priS}"/>
                                            <em style="float: none;margin-right: 0px;">-</em>
                                            <input id="priE" type="text" style="width:39px;border: 1px solid #E8E8E8;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${priE}" />
                                            <input type="button" value="确定" onclick="javascript:searchPriceArea('0');"/>

                                        </li>
                                        <!-- #自定义价格区间 -->
                                        <!--价格中增加 品牌与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                    </ul>
                                </div>
                                <div class="v-option hide"><span class="o-more unfold"><b></b>收起</span></div>
                            </div>
                        </div>
                    </div>

            <div  id="filter">
                <div class="cls"></div>
                <div class="fore1">
                    <dl class="order">
                        <dt>排序：</dt>
                        <dd <#if pager.orderBy=="sales" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                            <#if pager.orderBy=="sales" && pager.orderType=="desc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                            <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                            <#else>
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if pager.orderBy=="price" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                            <#if pager.orderBy=="price" && pager.orderType=="desc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                            <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                            <#else>
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                            <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                            <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                            <#else>
                                <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                            </#if>
                        </dd>
                    </dl>
                    <div class="goods-search">
                        <dl>
                            <dd>
                                <input type="button" value="转为列表" class="change-button"
                                       onclick="javascript:searchPriceArea('1');"/>
                            </dd>
                        </dl>
                    </div>
                    <div class="pagin pagin-m hide">
                        <span class="text"><i>1</i>/152</span>
                        <span class="prev-disabled">上一页<b></b></span>
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?page=2"
                           class="next">下一页<b></b></a>
                    </div>
                    <div class="total">
                        <span>共<strong>${total}</strong>个商品</span>
                    </div>
                    <span class="clr"></span>
                </div>
            </div>
            <div id="plist" class="plist-n7a ordinary-prebuy" style="float: left; width: 1190px; border-bottom: 1px solid #E8E8E8;">
                <ul class="list-h">
                    <#list goodslist as gl>
                        <li index="0" sku="${gl.id}" selfservice="0">
                            <div class="lh-wrap">
                                <div class="p-img">
                                    <a target="_blank" href="${base}/item/${gl.id}.html">
                                        <img width="220" height="220" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}@220w_220h.png" title="${gl.fullName}">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.fullName}">${gl.fullName}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                                </div>
                                <div class="p-price">
                                    <strong style="color: #DB0000;">
                                        <#if priceHide ="hide" >
                                            会员可见!
                                        <#else >
                                            <#if gl.batchPrice != null && gl.batchPrice != "0.00~0.00">
                                                ￥${gl.batchPrice}
                                            <#else >
                                                ${gl.price?string("currency")}
                                            </#if>
                                        </#if>
                                    </strong>
                            <span id="${gl.id}">
                                <a class="pt2" title="购买本商品送赠品"></a>
                                <a class="pt4" title="购买本商品送京豆"></a>
                            </span>
                                </div>
                                <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 Start -->
                                <div class="extra">
                                    <strong>销量&nbsp;<#if gl.sales??>${gl.sales}<#else>0</#if></strong>
                                    <div>
                                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 End -->
                                        <div class="extra">
                            <span class="evaluate">
                                <a target="_blank" href="${base}/item/${gl.id}.html">已有&nbsp;<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if>&nbsp;人评价</a>
                            </span>
                                        </div>
                                        <div class="btns">
                                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1');" href="javascript:void(0);" class="btn-buy"><i></i>加入购物车</a>
                                        <#--<a stock="1010626351" tpl="1" href="${base}/item/${gl.id}.html" class="btn-buy">加入购物车</a>-->
                                            <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" class="btn-coll">关注</a>
                                            <!--<a id="comp_1010626351" skuid="1010626351" class="btn-compare btn-compare-s"><span></span>对比</a>-->
                                        </div>
                                    </div>
                        </li>

                    </#list>

                </ul>
            </div>
            <div class="clearfix" style="float: right; margin-top: 10px; margin-bottom: 10px; margin-right: 10px;">
                <div class="pagin fl">
                    <#if (pager.list?size > 0)>
                        <#import "bec/gwq/pager.ftl" as p>
                    <#--分页时增加价格与品牌条件 Auth:zhangqiang Time:2015-09-28 13:47:25 Start -->
                        <#if parentCatelog.id?? && catelog.id?? &&  grandCatelog.id??>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html" />-->
                            <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
                        <#elseif parentCatelog.id?? && grandCatelog.id??>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html" />-->
                            <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
                        <#else>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html" />-->
                            <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
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
//        $("#sortlist h3").bind("click",function(){
//            var element=$(this).parent();
//            if (element.hasClass("current")){
//                element.removeClass("current");
//            }else{
//                element.addClass("current");
//            }
//        })
        function addCart(goodsId, cnt) {
            window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
        }
        function addGoodsAttention(goodsId,item) {
            $.ajax({
                type: "get",
                url: "${base}/goods/addToGoodsAttention",
                data: "goodsId="+goodsId,
                success: function(data) {
                    if(data.status=='success'){
                        layer.alert(data.message,{icon:1});
                        $(item).removeClass("btn-coll").addClass("showattention2");
                        $(item).text('已关注');
                        $(item).attr("onclick", "");
                    }else if(data.status=='warn'){
                        layer.alert(data.message,{icon:2});
                        $(item).removeClass("btn-coll").addClass("showattention2");
                        $(item).text('已关注');
                        $(item).attr("onclick", "");
                    }else if(data.status=='NOLOGIN'){
                        layer.alert("登录后才可关注商品",{icon:2},function(){
                            window.location="${base}/member/login";
                        });
                    }else{
                        layer.alert(data.message,{icon:2});
                    }

                }
            });
        }

        /**
         * 查询价格区间
         */
        function searchPriceArea(obj) {
            if(obj == '1'){
                var isLogin = $("#priceHide").val();
                if(isLogin == 'hide'){
                    location.href = "${base}/member/login";
                    return;
                }
            }
            var priS = $("#priS").val();
            var priE = $("#priE").val();

            var parentCatelogId = $("#getParentCatelogId").val();
            var catelogId = $("#getCatelogId").val();
            var brandFlag = $("#getBrandFlag").val();
            var orderByFlag = $("#getOrderByFlag").val();

            var srcUrl = "${base}/list/${grandCatelog.id}";
            if(parentCatelogId!="" && parentCatelogId!=null) {
                srcUrl += "-"+parentCatelogId;
            }
            if(catelogId!="" && catelogId!=null) {
                srcUrl +="-"+catelogId;
            }
            srcUrl += ".html?price=";
            if(priS) {
                srcUrl +="M" + priS;
            }
            if(priE) {
                srcUrl += "L" + priE;
            }
            srcUrl += "&page=1";
            if(brandFlag!="" && brandFlag!=null) {
                srcUrl += "&brand=" + brandFlag
            }
            if(orderByFlag!="" && orderByFlag!=null) {
                srcUrl += "&orderBy=" + orderByFlag;
            }

            if(obj == '1'){
                srcUrl += "&listStyle=" + "detailList";
            }

            window.location.href = srcUrl;
        }

    </script>
</#escape>