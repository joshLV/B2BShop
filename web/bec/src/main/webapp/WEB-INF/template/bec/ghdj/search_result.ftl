<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top.ftl"/>

<!--main-->
<div class="z_main">
    <div class="list_search f-cb">
        <div class="f-cb w100 mt13">
            <div class="f-fl"><span>排序：</span></div>
            <div class="f-fl">
                <ul class="pro_sort pro_sort2">
                    <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                        <#if pager.orderBy=="sales" && pager.orderType=="desc">
                            <a class="arr_down" class="" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=desc&pageNumber=${pageNumber}')">销量</a>
                        <#else>
                            <a class="arr_down" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="minBatchPrice" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="minBatchPrice" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="minBatchPrice" && pager.orderType=="desc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=asc&pageNumber=${pageNumber}')">价格</a>
                        <#elseif pager.orderBy=="minBatchPrice" && pager.orderType=="asc">
                            <a href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=desc&pageNumber=${pageNumber}')">价格</a>
                        <#else>
                            <a class="arr_down" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=minBatchPrice&order=asc&pageNumber=${pageNumber}')">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a>
                        <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">
                            <a class="sort_3" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=desc&pageNumber=${pageNumber}')">评论数</a>
                        <#else>
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=becScoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a>
                        </#if>
                    </li>
                    <li class="on"><a href="javascript:void(0)" onclick="s('${keyword}','pageNumber=${pageNumber}')" class="sort_4">普通模式</a></li>
                    <li><a href="javascript:void(0)" onclick="changeJsp();" class="sort_5">批发模式</a></li>
                </ul>
            </div>
        <div class="f-fr"> 共找到<em style="float: none;"><#if totalResult != '' && totalResult &gt; 0>${totalResult}<#else>0</#if></em>个商品 </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pt_list f-cb">
        <input type="hidden" name="basePath" id="basePath" value="${base}"/>
        <input type="hidden" name="imageUrl" id="imageUrl" value="${imageUrl}"/>
        <input type="hidden" name="mid" id="cur_mid" value="${mid}"/>
        <input type="hidden" value="${isLogin}" id="isLogin">
        <input type="hidden" value="${priceHide}" id="priceHide">
        <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
        <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
        <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
        <input type="hidden" name="orderType" id="cur_orderType" value="${pager.orderType}"/>
        <input type="hidden" name="keyword_input" id="keyword_input" value="${keyword}"/>
        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
        <ul id="goodsDataTable">
            <#list list as gl>
                <li <#if (gl_index+1) % 5 == 0>class="lase"</#if>>
                    <div class="pro_info">
                        <div class="showbox">
                            <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img src="<#if gl.pic??>${gl.pic}@210w_210h.png</#if>" width="210" height="210" alt="${gl.name}" title="${gl.name}">
                            </a>
                            <div class="subtitle" <#if priceHide ="hide" >style="display: none;" </#if>>
                                <div class="f-fl"> <a onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${gl.id}','1'));" href="javascript:void(0);" class="car">加入购物车</a> </div>
                                <div class="f-fr"> <a onclick="judgeAuth('${base}','addAttention',addGoodsAttention.bind({},'${gl.id}',this));" href="javascript:void(0);" class="gz_on">关注</a> </div>
                            </div>
                        </div>
                        <p class="pro_price">
                            <#if priceHide ="hide" >
                                <span>会员可见!</span>
                            <#else >
                                <i>商城价：</i>
                                    <#if gl.enableBatchPrice == '1'>
                                       ￥${gl.batchPrice}
                                    <#else >
                                        ￥${gl.price?string(',##0.00')}
                                    </#if>

                            </#if>
                        </p>
                        <p class="pro_price red"><i>会员价：</i>
                            <#if priceHide ="hide" >
                                <span>会员可见!</span>
                            <#else >
                                ￥${(gl.price*(1 - gl.defaultPrice/100))?string(',##0.00')}
                            </#if>
                        </p>
                        <p class="pro_tit"><a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.name}">${gl.name}</a></p>
                        <p class="pro_tit">条码：${gl.barcode}</p>
                        <p class="pro_sp_info">
                        <span>月成交
                            <i>
                                <#if gl.sales != '' && gl.sales &gt; 0>
                                    <#if gl.sales &lt; 10000>
                                        <#if gl.sales?index_of('.') &gt; 0>
                                        ${gl.sales?substring(0,gl.sales?index_of('.') )}
                                        <#else>
                                        ${gl.sales}
                                        </#if>
                                    <#else>
                                    ${(gl.sales/10000)?string("##0.0")}万
                                    </#if>
                                <#else>
                                    0
                                </#if>
                                笔
                            </i>
                        </span>
                            <span class="lase">评价数<i><#if gl.becScoreCount != '' && gl.becScoreCount &lt; 0>${gl.becScoreCount}<#else>0</#if>条</i></span>
                        </p>
                    </div>
                    <div class="fanli_2" <#if gl.hasRebate=='no'>style="display:none;"</#if>>返利</div>
                </li>
            </#list>
        </ul>
        </form>
        <div class="f-fl moretip" id="tip_notice" style="margin-left: 400px;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...</#if></div>
    </div>
    <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
</div><!-- Main End -->
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/search_result/ajaxGetAllGoods.js" type="text/javascript"></script>
<script type="text/javascript">
    /*<!-- 鼠标放上出现购物车效果 -->*/
    $(".showbox").each(function(){
        var self = $(this), delay;
        self.mouseover(function(){
            delay = setTimeout(function(){ delay = null; self.find(".subtitle").stop().animate({"bottom":0}, 300);},300);
        }).mouseout(function(){
            if(delay){
                clearTimeout(delay);
            }else{
                setTimeout(function(){self.find(".subtitle").stop().animate({"bottom":-40}, 300);},300);
            }
        });
    });

    var priceHide = '${priceHide}';

    $(function(){
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
    });

    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }


    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        if(priceHide != 'hide'){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        priceHide = flag ? "" : "hide";
    }
    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    function goToOrder(){
        changeJsp();
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
    function changeJsp(obj) {
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
            return false;
        }else{
            location.href = "${base}/search/detaillist/${keywordASCII}";
        }
    }
</script>

    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>