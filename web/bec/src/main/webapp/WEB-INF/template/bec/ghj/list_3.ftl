<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top.ftl"/>

<!--main-->
<div class="z_main">
    <div class="list_search">
        <div class="f-cb">
            <div class="f-fl">
                <h1>
                    <#if catelog.id??>${catelog.name}
                    <#elseif parentCatelog.id??>
                    ${parentCatelog.name}
                    <#else>
                    ${grandCatelog.name}
                    </#if>
                    -<strong>&nbsp;商品筛选</strong></h1>
            </div>
        <#--<div class="f-fl">
            <span>商品搜索：</span>
            <input type="text" class="inp_search" name="mn" id="mn" placeholder="供应商名称" value="${mn}">
            <input type="text" class="inp_search" name="sn" id="sn" placeholder="商品简称" value="${sn}">
            <input type="button" name="" value="搜&nbsp;索" class="inp_btn" onclick="">
        </div>-->
            <div class="f-fr"> 共找到<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个商品 </div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>品牌：</span></div>
            <div class="f-fl pinpai">
                <ul class="pro_sort f-cb">
                <#list brandList as brand>
                    <li <#if brand.id==brandFlag>class="on"</#if>><a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                           title="${brand.name}">${brand.name}</a></li>
                </#list>
                </ul>
            </div>
            <div class="f-fr" id="morepinpai"><a href="javascript:;" class="more">更多<i class="icon-angle-down"></i></a><a href="javascript:;" class="shouqi">收起<i class="icon-angle-up"></i></a></div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>价格：</span></div>
            <div class="f-fl">
                <ul class="pro_sort f-cb">
                    <li>
                        <a <#if priceFlag=="M0L10">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M0L10&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">0-10</a>
                    </li>
                    <li>
                        <a <#if priceFlag=="M10L50">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?&price=M10L50&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">10-50</a>
                    </li>
                    <li>
                        <a <#if priceFlag=="M50L100">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M50L100&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">50-100</a>
                    </li>
                    <li>
                        <a <#if priceFlag=="M100L500">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M100L500&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">100-500</a>
                    </li>
                    <li>
                        <a <#if priceFlag=="M500">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M500&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">&ge;500</a>
                    </li>

                    <!-- 自定义价格区间 -->
                    <li>
                        <input id="priS" type="text" class="input has_reset" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${priS}"/>
                        <em style="display:inline-block; height:px; line-height:25px; margin:0 5px;">-</em>
                        <input id="priE" type="text" class="input has_reset" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${priE}" />
                        <button class="btn" onclick="javascript:searchPriceArea('0');">确定</button>
                    </li>
                    <!-- #自定义价格区间 -->
                </ul>
            </div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>排序：</span></div>
            <div class="f-fl">
                <ul class="pro_sort pro_sort2 f-cb">
                    <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                        <#if pager.orderBy=="sales" && pager.orderType=="desc">
                            <a class="arr_down" class="" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a>
                        <#else>
                            <a class="arr_down" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="price" && pager.orderType=="desc">
                            <a class="arr_down" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a>
                        <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                            <a class="" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a>
                        <#else>
                            <a class="arr_down" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                            <a class="sort_3 sort_3_down" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a>
                        <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                            <a class="sort_3" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a>
                        <#else>
                            <a class="sort_3 sort_3_down" href="${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a>
                        </#if>
                    </li>
                    <li class="on"><a href="javascript:void(0)" onclick="changeJsp();" class="sort_4">普通模式</a></li>
                    <li><a href="javascript:void(0)" onclick="searchPriceArea('1');" class="sort_5">批发模式</a></li>
                </ul>
            </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pt_list f-cb">
        <input type="hidden" value="${base}" id="basePath">
        <input type="hidden" value="${isLogin}" id="isLogin">
        <input type="hidden" value="${priceHide}" id="priceHide">
        <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
        <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
        <input type="hidden" value="${catelogPath}" id="catelogPath">
        <input type="hidden" value="${priceFlag}" id="priceFlag">
        <input type="hidden" value="${brandFlag}" id="brandFlag">
        <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
        <input type="hidden" name="pageSize" id="cur_pageSize" value="${pager.pageSize}"/>
        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
        <ul id="goodsDataTable">
            <#list goodslist as gl>
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
                            <span class="lase">评价数<i><#if gl.scoreCount != '' && gl.scoreCount &lt; 0>${gl.scoreCount}<#else>0</#if>条</i></span>
                        </p>
                    </div>
                    <div class="fanli_2" <#if gl.hasRebate=='no'>style="display:none;"</#if>>返利</div>
                </li>
            </#list>
        </ul><#-- 商品列表UL end -->
        </form>
        <div class="f-fl moretip" id="tip_notice" style="margin-left: 400px;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else> 没有了...</#if></div>
    </div>
    <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
</div><!-- Main End -->
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghj/js/list3/ajaxGetGoods.js" type="text/javascript"></script>
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
    var _mid= '${mid}';
    var _mn= '${mn}';
    $(function (){
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
        if($(".pinpai").outerHeight()<= 37){
            $("#morepinpai").hide();
        }
        $(".more").click(function(){
            $(this).hide();
            $(".shouqi").show();
            $(".pinpai").addClass("pinpaiopen");
        });
        $(".shouqi").click(function(){
            $(this).hide();
            $(".more").show();
            $(".pinpai").removeClass("pinpaiopen");
        });


    });


    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
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
                    $(item).removeClass("gz").addClass("gz_on");
                    $(item).text('已关注');
                    $(item).attr("onclick", "");
                }else if(data.status=='warn'){
                    layer.alert(data.message,{icon:2});
                    $(item).removeClass("gz").addClass("gz_on");
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
        if(!isLogin() && obj == '1') {
            $("#cartLogin").trigger("click");
            return false;
        }


        var priS = $("#priS").val();
        var priE = $("#priE").val();

        var parentCatelogId = $("#getParentCatelogId").val();
        var catelogId = $("#getCatelogId").val();
        var brandFlag = $("#getBrandFlag").val();
        var orderByFlag = $("#getOrderByFlag").val();

        var srcUrl = "${base}/list/${ids}.html?price=";
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

    function goToOrder(){
        searchPriceArea('1');
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

    /**
     * Desc:页面切换
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function changeJsp(obj) {
        window.location.href = "${base}/list/${ids}.html";
    }
</script>

    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>