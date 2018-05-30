<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>

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

    #filter .fore0{
        border-bottom: 1px solid #e7e3e7;
        height: 35px;
        margin-bottom: 5px;
        margin-top: 10px;
        overflow: hidden;
        padding: 5px 8px;
    }

    #filter .fore0 .filter_div{
        position: relative;
        margin-right: 5px;
        width: 325px;
        float: left;
        border: 1px solid #e7e3e7;
        height: 25px;
        line-height: 25px;
    }
    #filter .fore0 .filter_input{
        position: relative;
        height: 25px;
        width: 300px;
        line-height: 25px;
        vertical-align: middle;
        font-size: 14px;
        border: medium none;
        padding-left: 5px;
        margin-bottom: 15px;
    }

    #filter .fore0 .search_btn{
        position: absolute;
        height: 25px;
        width: 50px;
        line-height: 25px;
        vertical-align: middle;
        text-align: center;
        font-size: 12px;
        border: medium none;
        background: #0171bc none repeat scroll 0 0;
        color: #fff;
        font-weight: bolder;
        cursor: pointer;
        margin-top: 1px;
    }
    #filter .fore0 .search_btn:hover{
        text-decoration: none;
        font-weight: normal;
        color: #fff;
    }

    #filter .fore1 .order .zhuanhuan{
        margin-left: 50px;
    }

    #filter .fore1 .order .zhuanhuan b{
        background: rgba(0, 0, 0, 0) url("${base}/static/bec/project/gdnz/images/pt.gif") no-repeat scroll 0 0;
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
        background: rgba(0, 0, 0, 0) url("${base}/static/bec/project/gdnz/images/wholesale.png") no-repeat scroll 0 0;
        float: right;
        height: 11px;
        margin-left: 5px;
        margin-right: 10px;
        margin-top: 7px;
        width: 11px;
    }
    #filter .fore0 .mn_del {
        background: url("${base}/static/bec/project/gdnz/images/x.png") no-repeat;
        width: 15px;
        height: 15px;
        position: absolute;
        display: block;
    }
</style>

<div id="container">
    <#include "bec/gdnz/top.ftl"/>
    <div class="search_page">
        <div class="categories_list">

            <div id="filter">
                <div class="fore0">
                    <div class="filter_div">
                        <input type="text" class="filter_input" name="mn" id="mn" placeholder="供应商名称" value="${mn}"/>
                        <a href="javascript:void(0)" class="mn_del" style="top: 8px; right: 0px; display: block;" onclick="$('#mn').val('')"></a>
                    </div>
                    <div class="filter_div">
                        <input type="text" class="filter_input" name="sn" id="sn" placeholder="商品简称" value="${sn}"/>
                        <a href="javascript:void(0)" class="mn_del" style="top: 8px; right: 0px; display: block;" onclick="$('#sn').val('')"></a>
                    </div>
                    <div class="filter_btn_div">
                        <a href="javascript:void(0)" class="search_btn" onclick="allG('${mid}',$('#mn').val(),$('#sn').val(),'');" >搜&nbsp;&nbsp;索</a>
                    </div>
                </div>
                <div class="cls"></div>
                <div class="fore1">
                    <dl class="order">
                        <dt>排序：</dt>
                        <dd <#if pager.orderBy=="sales" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if pager.orderBy=="sales" && pager.orderType=="desc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}')">销量</a><b></b>
                            <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}')">销量</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}')">销量</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if pager.orderBy=="price" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if pager.orderBy=="price" && pager.orderType=="desc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}')">价格</a><b></b>
                            <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}')">价格</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}')"">价格</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=becScoreCount&orderType=asc&pageNumber=${pager.pageNumber}')">评论数</a><b></b>
                            <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=becScoreCount&orderType=desc&pageNumber=${pager.pageNumber}')">评论数</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','orderBy=becScoreCount&orderType=asc&pageNumber=${pager.pageNumber}')">评论数</a><b></b>
                            </#if>
                        </dd>
                        <dd  class="zhuanhuan" >
                            <a href="javascript:void(0)" onclick="allG('${mid}','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}')" class="sort_4">普通模式<b></b></a>
                        </dd>
                        <dd  class="zhuanhuanPT" >
                            <a href="javascript:void(0)" onclick="allG('${mid}','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&vt=list')">批发模式<b></b></a>
                        </dd>
                    </dl>
                    <div class="total">
                        <span>共<strong><#if total != '' && total &gt; 0>${total}<#else>0</#if></strong>个商品</span>
                    </div>
                    <span class="clr"></span>
                </div>
            </div>

            <div class="search_content" >
                <ul>
                    <#list goodslist as gl>
                        <#assign isGoBuy=true>
                    <li index="0" sku="${gl.id}" selfservice="0">
                        <div class="search_content_box">
                            <div class="search_content_mainimg">
                                <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img alt="${gl.name}" data-img="1" src="<#if gl.image??>${imageUrl}${gl.image}@263w_350h.png</#if>" title="${gl.name}">
                            </div>
                            <p>
                                <span class="search_price">
                                    <#--Desc:搜索页面未登录时商品价格不可见；登录有商品阶梯价显示阶梯价否则显示商品价格 Auth:zhangqiang Time:2015-11-27 16:46:35 Start-->
                                    <strong style="color: #DB0000;">
                                        <#if priceHide ="hide" >
                                            会员可见!
                                        <#else >
                                            <#if gl.enableBatchPrice == '1'>
                                                <#if gl.batchPrice??>
                                                    ￥${gl.batchPrice}
                                                <#else>
                                                    <#assign isGoBuy=false>
                                                    价格面议
                                                </#if>
                                            <#else >
                                                <#if gl.price == '0' || gl.price == '0.00'>
                                                    <#assign isGoBuy=false>
                                                    价格面议
                                                <#else>
                                                    ${gl.price?string('currency')}
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
                                    <#--<img src="static/bec/project/gwq/images/search/list_icon_strength.png">-->
                                    <#--<img src="static/bec/project/gwq/images/search/list_icon_sincerity.png">-->
                                    <#--<em>10年</em>-->
                                </span>
                            </p>
                            <p class="search_box_bottom search_area_p">
                                <span class="search_area">
                                    <a stock="1010626351" tpl="1" class="search-btn-buy" <#if isGoBuy>onclick="addCart('${gl.id}','1');"</#if> href="javascript:void(0);"  ><i></i>加入购物车</a>
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
                    <#if (pager.list?size > 0)>
                    <div class="pagin fr">
                        <#import "bec/gdnz/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/allG?mn=${mn}&sn=${sn}" />
                    </div>
                    <#else>
                    <div class="pagin">
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
                    </div>
                    </#if>
            </div>
            <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
        </div>
    </div>
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>

    <script type="text/javascript">
        var priceHide = '${priceHide}';
        var _mid= '${mid}';
        var _mn= '${mn}';
        $(function () {
            $("#cartLogin").hide();
            $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
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

        function allG(mid,mn,sn,param) {
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
            window.location.href = "${base}/allG.html" + filter;
        }

        function goToOrder(){
            allG('','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}&vt=list');
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
    <#include "bec/gdnz/service.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
</#escape>