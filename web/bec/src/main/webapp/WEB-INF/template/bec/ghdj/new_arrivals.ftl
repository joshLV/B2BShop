<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top.ftl"/>

<!--main-->
<div class="z_main">
    <div class="list_search">
        <div class="f-cb">
            <div class="f-fl">
                    <span>商品搜索：</span>
                    <input class="has_reset inp_search xj-hy" type="text"  name="cl" id="cl" placeholder="分类" value="${cl}">
                    <input class="has_reset inp_search" type="hidden" name="mn" id="mn" placeholder="供应商名称" value="${mn}">
                    <input class="has_reset inp_search" type="text"  name="sn" id="sn" placeholder="商品简称" value="${sn}">
                    <input class="has_reset inp_search" type="text"  name="bc" id="bc" placeholder="商品条码" value="${bc}">
                    <input type="button" name="" id="page_search_btn" value="搜&nbsp;索" class="inp_btn" onclick="allG('${mid}',$('#mn').val(),$('#sn').val(),$('#cl').val(),$('#bc').val(),'');">
            </div>
            <div class="f-fr"> 共找到<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个商品 </div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>排序：</span></div>
            <div class="f-fl">
                <ul class="pro_sort pro_sort2">
                    <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                        <#if pager.orderBy=="sales" && pager.orderType=="desc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}')">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}')">销量</a>
                        <#else>
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}')">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="price" && pager.orderType=="desc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}')">价格</a>
                        <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                            <a class="" href="javascript:void(0)"  onclick="allG('${mid}','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}')">价格</a>
                        <#else>
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}')">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}')">评论数</a>
                        <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                            <a class="sort_3" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}')">评论数</a>
                        <#else>
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}')">评论数</a>
                        </#if>
                    </li>
                    <li class="on"><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}')" class="sort_4">普通模式</a></li>
                    <li><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&vt=list')" class="sort_5">批发模式</a></li>
                </ul>
            </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pt_list f-cb">
        <ul>
        <#list goodslist as gl>
            <li <#if (gl_index+1) % 5 == 0>class="lase"</#if>>
                <div class="pro_info">
                    <div class="showbox">
                        <a target="_blank" href="${base}/item/${gl.id}.html">
                            <img src="<#if gl.pic??>${gl.pic}@210w_210h.png</#if>" width="210" height="210" alt="${gl.name}" title="${gl.name}">
                        </a>
                        <div class="subtitle" <#if priceHide ="hide" >style="display: none;" </#if>>
                            <div class="f-fl"> <a onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${gl.id}','1'));" href="javascript:void(0);" class="car">加入购入车</a> </div>
                            <div class="f-fr"> <a onclick="judgeAuth('${base}','addAttention',addGoodsAttention.bind({},'${gl.id}',this));" href="javascript:void(0);" class="gz_on">关注</a> </div>
                        </div>
                    </div>
                    <p class="pro_price">
                        <#if priceHide ="hide" >
                            <i>会员可见!</i>
                        <#else >
                            <i>商城价：</i>
                            <#if gl.enableBatchPrice == '1'>
                                <i>￥</i>${gl.batchPrice}
                            <#else >
                                <i>￥</i>${gl.price?string(',##0.00')}
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
        <div class="page" style="width: 600px;height:390px; ">
            <#if (pager.list?size > 0)>
                <div class="pagin fr">
                    <#import "bec/ghdj/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/newArrivals/list?mn=${mn}&sn=${sn}&cl=${cl}&bc=${bc}" />
                </div>
            <#else>
                <div class="pagin">
                    <div class="searchTip" style="min-height: 390px; padding-top: 12px; line-height: 2; font-size: 14px; text-align: center;">
                        <div class="searchTipContent">
                            <h2 style="font-size: 16px; color: #e9314a;">尚未发布任何信息!</h2>
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
                </div>
            </#if>
        </div><#-- page end -->
    </div>
    <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
</div><!-- Main End -->

    <#include "bec/ghdj/b2b/spfl.ftl"/>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghdj/css/jydz.css">
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
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
    $(function () {
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});

        //分类
        $(".xj-hy").on('click',function(){
            $(".category_select_container").show().css({top:$(this).offset().top+37+"px",left:$(this).offset().left+"px"}).attr("index",$(this).parents("tr").index());
        });
        $(".close").on('click',function(){
            $(".category_list").eq(0).find("li").removeClass("current");
            $(".category_list").eq(1).html("");
            $(".category_list").eq(2).html("");
            $(this).parents(".category_select_container").hide().removeAttr("index");

            $("#page_search_btn").trigger("click");
        });
        $(".category_list").on('click','li',function(){
            $(this).parent("ul").find("li").removeClass("current");
            $(this).addClass("current");
            var id=$(this).find("a").attr("categoryid");
            var level=$(this).parent("ul").attr("level");
            var path=$(this).find("a").attr("catelogpath");
            var pathname="";
            if(level<3) {
                $.ajax({
                    url: "${base}/getSons",
                    data: {id: id},
                    success: function (data) {
                        if (data.status == "exception") {
                            alert(data.message);
                        } else if (data.status == "success") {
                            level++;
                            $(".category_list").eq(level-1).html("");
                            $(".category_list").eq(level).html("");
                            var html = "";
                            var itemclass = "class=\"item_p\"";
                            if (level == 3) {
                                itemclass = "";
                            }
                            $.each(data.sons, function (index, catelog) {
                                html += "<li><a href=\"javascript:;\" target=\"_self\" leaf=\"0\" categoryid=\"" + catelog.id + "\" catelogpath=\"" + catelog.path + "\" title=\"" + catelog.name + "\" " + itemclass + ">" + catelog.name + "</a></li>";
                            })
                            $(".category_list").eq(level-1).html(html);
                            if(level==2){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">";
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==3){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">";
                                pathname = $(".category_list").eq(1).find(".current > a").text();
                            }
                            $(".xj-hy").val(pathname);
                        } else {
                            $(this).removeClass("item_p");
                            if(level==1){
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==2){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text();
                                pathname = $(".category_list").eq(1).find(".current > a").text();
                            }
//                            $(".xj-id").val(id);
//                            $(".xj-path").val(path);
                            level++;
//                            $(".category_list").eq(level-1).html("");
//                            $(".category_list").eq(level).html("");
                            $(".xj-hy").val(pathname);
                        }
                    },
                    error: function () {
                        alert("获取服务器数据失败！请刷新后重试！");
                    }
                });
            }else{
//                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">" + $(this).find("a").text();
                pathname = $(this).find("a").text();
//                $(".xj-id").val(id);
//                $(".xj-path").val(path);
            }
            $(".xj-hy").val(pathname);
        });
    });


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

    function allG(mid,mn,sn,cl,bc,param) {
        if(!isLogin()  && param.indexOf("vt=list") > 0) {
            $("#cartLogin").trigger("click");
            return false;
        }
        if( mn == '' ){
            mn = $("#mn").val();
        }
        if( sn == '' ){
            sn = $("#sn").val();
        }
        if( cl == '' ){
            cl = $("#cl").val();
        }
        if( bc == '' ){
            bc = $("#bc").val();
        }
        //如果存在用供应商ID查询的精准查询，需要判断供应商名称是否和查询条件中的一致，
        // 如果不一致，说明查询条件已修改,查询时不组装此条件
        if( _mid != '' && _mn != $.trim(mn)){
            _mid = '';
            mid = '';
        }

        //组装查询条件
        var filter = '';
        if($.trim(mn) != ''){
            filter += "mn=" + encodeURI(encodeURI($.trim(mn)));
        }
        if($.trim(sn) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "sn=" + encodeURI(encodeURI($.trim(sn)));
        }
        if($.trim(cl) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "cl=" + encodeURI(encodeURI($.trim(cl)));
        }
        if($.trim(bc) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "bc=" + encodeURI(encodeURI($.trim(bc)));
        }
        if( mid != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "mid=" + mid;
        }

        if(filter != '' && param != ''){
            filter += '&' + param;
        }else if(filter == '' && param != ''){
            filter += param;
        }

        if(filter != ''){
            filter = '?' + filter;
        }
        window.location.href = "${base}/newArrivals/list.html" + filter;
    }

    function goToOrder(){
        allG('','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}&vt=list');
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
</script>

    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>