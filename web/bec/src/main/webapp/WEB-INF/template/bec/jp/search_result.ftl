<#escape x as x?html>
    <#include "bec/jp/header.ftl"/>

<style type="text/css">
    .searchTip {
        border: 1px solid #f7eae7;
    }

    .searchTip .searchTipContent {
        padding-left: 30px;
    }

    .searchTip .searchTipContent h2 {
        color: #333;
        font-size: 14px;
        font-weight: 700;
        line-height: 38px;
    }
    .searchTip .searchTipContent h2 {
        line-height: 36px;
    }

    #searchTipSugg {
        list-style: outside none none;
    }
    #searchTipSugg li {
        width: auto;
        list-style: inside none decimal;
        margin-bottom: 5px;
    }
    .search_wangwang {
        float: right;
        border-left: 1px solid #e8e8e8;
        width: 100px;
        text-align: center;
        height: 28px;
        padding: 7px 0;
    }

    #filter .fore1 .order .zhuanhuan{
        margin-left: 50px;
    }

    #filter .fore1 .order .zhuanhuan b{
        background: rgba(0, 0, 0, 0) url("${base}/static/bec/project/jp/images/pt.gif") no-repeat scroll 0 0;
        background-size: 11px;
        float: right;
        height: 11px;
        margin-left: 5px;
        margin-right: 10px;
        margin-top: 7px;
        width: 11px;
    }

    #filter .fore1 .order .zhuanhuanPT{
        margin-left: 10px;
    }
    #filter .fore1 .order .zhuanhuanPT b{
        background: rgba(0, 0, 0, 0) url("${base}/static/bec/project/jp/images/wholesale.png") no-repeat scroll 0 0;
        float: right;
        height: 11px;
        margin-left: 5px;
        margin-right: 10px;
        margin-top: 7px;
        width: 11px;
    }
</style>
<input type="hidden" value="${priceHide}" id="priceHide">
<div id="container">
    <#include "bec/jp/top.ftl"/>
    <input type="hidden" value="${priceHide}" id="priceHide">
    <div class="search_page">
        <div class="categories_list">

            <div id="filter">
                <div class="cls"></div>
                <div class="fore1">
                    <dl class="order">
                        <dt>排序：</dt>
                        <dd <#if orderBy=="sales" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="sales" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="sales" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a><b></b>
                            <#elseif orderBy=="sales" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=desc&pageNumber=${pageNumber}')">销量</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if orderBy=="minBatchPrice" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="minBatchPrice" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="minBatchPrice" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=asc&pageNumber=${pageNumber}')">价格</a><b></b>
                            <#elseif orderBy=="minBatchPrice" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=desc&pageNumber=${pageNumber}')">价格</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=asc&pageNumber=${pageNumber}')"">价格</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if orderBy=="becScoreCount" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="becScoreCount" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="becScoreCount" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            <#elseif orderBy=="becScoreCount" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=desc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            </#if>
                        </dd>
                        <dd  class="zhuanhuan" >
                            <a href="javascript:void(0)" onclick="s('${keyword}','pageNumber=${pageNumber}')">普通模式<b></b></a>
                        </dd>
                        <dd  class="zhuanhuanPT" >
                            <a href="javascript:void(0)" onclick="changeJsp();">批发模式<b></b></a>
                        </dd>
                    </dl>
                    <#--<div class="goods-search">
                        <dl>
                            <dd>
                                <input type="button" value="转为列表" class="change-button"
                                       onclick="javascript:changeJsp();"/>
                            </dd>
                        </dl>
                    </div>-->
                    <#--<div style="float: left"><input type="button" value="转换" onclick="changeJsp()" class="change-button-search" /></div>-->

                    <div class="total">
                        <#--<input type="button" value="转换"  onclick="s('${keyword}','listStyle=detailList&pageNumber=${pageNumber}')"/>-->
                        <span>共<strong><#if totalResult != '' && totalResult &gt; 0>${totalResult}<#else>0</#if></strong>个商品</span>
                    </div>
                    <span class="clr"></span>
                </div>
            </div>

            <div class="search_content" >
                <ul>
                    <#list list as gl>
                        <#assign isGoBuy=true>
                    <li index="0" sku="${gl.id}" selfservice="0">
                        <div class="search_content_box">
                            <div class="search_content_mainimg">
                                <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img alt="${gl.name}" data-img="1" src="${gl.pic}@263w_350h.png" title="${gl.name}">
                            </div>
                            <p>
                                <span class="search_price">
                                    <#--Desc:搜索页面未登录时商品价格不可见；登录有商品阶梯价显示阶梯价否则显示商品价格 Auth:zhangqiang Time:2015-11-27 16:46:35 Start-->
                                    <strong style="color: #DB0000;">
                                        <#if priceHide ="hide" >
                                            会员可见!
                                        <#else >
                                            <#--<#if gl.batchPrice != null && gl.batchPrice != "0.00~0.00">-->
                                                <#--￥${gl.batchPrice}-->
                                            <#--<#else >-->
                                                <#--￥${gl.price}-->
                                            <#--</#if>-->
                                            <#if gl.enableBatchPrice == '1'>
                                                <#if gl.batchPrice??>
                                                    ￥${gl.batchPrice}
                                                <#else>
                                                    <#assign isGoBuy=false>
                                                    价格面议
                                                </#if>
                                            <#else>
                                                <#if gl.price == '0' || gl.price == '0.00'>
                                                    <#assign isGoBuy=false>
                                                    价格面议
                                                <#else>
                                                    ￥${gl.price}
                                                </#if>
                                            </#if>
                                        </#if>
                                    </strong>
                                    <#--Desc:搜索页面未登录时商品价格不可见；登录有商品阶梯价显示阶梯价否则显示商品价格 Auth:zhangqiang Time:2015-11-27 16:46:35 End-->
                                </span>
                                <span class="search_deal">近30天成交
                                    <#if gl.sales != '' && gl.sales &gt; 0>
                                        <#if gl.sales?index_of('.') &gt; 0>
                                        ${gl.sales?substring(0,gl.sales?index_of('.') )}
                                        <#else>
                                        ${gl.sales}
                                        </#if>
                                    <#else>
                                        0
                                    </#if>
                                    件</span>
                            </p>
                            <p class="search_content_names">
                                <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.name}">${gl.name}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                            </p>
                            <p>
                                <span class="company_names"><a target="_blank" href="${base}/item/${gl.id}.html">已有<#if gl.becScoreCount != '' && gl.becScoreCount &lt; 0>${gl.becScoreCount}<#else>0</#if>人评价</a></span>
                                <span class="company_reputation">
                                    <#--<img src="static/bec/project/jp/images/search/list_icon_strength.png">-->
                                    <#--<img src="static/bec/project/jp/images/search/list_icon_sincerity.png">-->
                                    <#--<em>10年</em>-->
                                </span>
                            </p>
                            <p class="search_box_bottom search_area_p">
                                <span class="search_area">
                                    <a stock="1010626351" tpl="1" <#if isGoBuy>class="search-btn-buy" onclick="addCart('${gl.id}','1');"<#else> class="search-btn-buy-disable" </#if>  href="javascript:void(0);"  ><i></i>加入购物车</a>
                                </span>
                                <span class="search_wangwang">
                                    <a id="coll1010626351" class="search-btn-coll" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" ><i></i>关注</a>
                                </span>
                            </p>
                        </div>
                    </li>
                    </#list>
                </ul>
            </div>
            <div class="clearfix">
                <div class="pagin fr" style="float: left;width: 100%;">
                    <#if (pager.list?size > 0)>
                        <#import "bec/jp/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/search/s/${keywordASCII}" />
                    <#else>
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
                    </#if>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">


        /**
         * 关闭登录的弹出窗口
         */
        function cartLoginClose(){
            $("#cartLogin").colorbox.close();
        }

        function highlight(key) {
            var html=$("#plist").html();
            var key = key.split('|');
            for (var i=0; i<key.length; i++) {
                var content = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
            }
            $("#plist").html(content);
        }
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
                        $(item).removeClass("btn-coll").addClass("showattention3");
                        $(item).text('已关注');
                        $(item).attr("onclick", "");
                    }else if(data.status=='warn'){
                        layer.alert(data.message,{icon:2});
                        $(item).removeClass("btn-coll").addClass("showattention3");
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
        function changeJsp(obj) {
            var isLogin = $("#priceHide").val();
            if(isLogin == 'hide'){
                location.href = "${base}/member/login";
                return;
            }else{
                s('${keyword}','listStyle=detailList&pageNumber=${pageNumber}');
            }
        }

    </script>
    <#include "bec/jp/service.ftl"/>
    <#include "bec/jp/foot.ftl"/>
</#escape>