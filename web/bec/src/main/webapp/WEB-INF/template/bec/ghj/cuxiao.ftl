<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/jydz.css">
<!--main-->
<div class="z_main">
    <#if flag == true>
    <div class="pro_pt_list f-cb">
        <div style="width: 100%; height: 30px; line-height: 30px; padding: 10px 0; font-size: 20px; font-weight: bold; text-align: center;">${promotions.pName}</div>
        <ul id="goodsDataTable">
            <#list pager.getList() as gl>
                <li <#if (gl_index+1) % 5 == 0>class="lase"</#if>>
                    <div class="pro_info">
                        <div class="showbox">
                            <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img width="210" height="210" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}@210w_210h.png" title="${gl.fullName}">
                            </a>
                            <div class="subtitle" <#if priceHide ="hide" >style="display: none;" </#if>>
                                <div class="f-fl"> <a onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${gl.id}','1'));" href="javascript:void(0);" class="car">加入购物车</a> </div>
                                <div class="f-fr"> <a onclick="judgeAuth('${base}','addAttention',addGoodsAttention.bind({},'${gl.id}',this));" href="javascript:void(0);" class="gz_on">关注</a> </div>
                            </div>
                        </div>
                        <#if promotions.isOpen == "start">
                            <p class="pro_price">
                                <#if priceHide ="hide" >
                                    <span>会员可见!</span>
                                <#else >
                                    <i>原价：</i>
                                    ￥ ${gl.goodsPrice?string(',##0.00')}
                                </#if>
                            </p>
                            <p class="pro_price red"><i>活动价：</i>
                                <#if priceHide ="hide" >
                                    <span>会员可见!</span>
                                <#else >
                                    ￥${gl.promotionsPrice?string(',##0.00')}
                                </#if>
                            </p>
                        <#else>
                            <p class="pro_price">
                                <#if priceHide ="hide" >
                                    <span>会员可见!</span>
                                <#else >
                                    <i>商城价：</i>
                                    ￥${gl.price?string(',##0.00')}
                                </#if>
                            </p>
                            <p class="pro_price red"><i>市场价：</i>
                                <#if priceHide ="hide" >
                                    <span>会员可见!</span>
                                <#else >
                                    ￥${gl.marketPrice?string(',##0.00')}
                                </#if>
                            </p>
                        </#if>
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
                    <#--<div class="fanli_2" <#if gl.hasRebate=='no'>style="display:none;"</#if>>返利</div>-->
                </li>
            </#list>
        </ul><#-- 商品列表UL end -->
        <div class="f-fl moretip" id="tip_notice" style="margin-left: 400px;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if></div>
    </div>
    <#else>
    <div class="pro_pt_list f-cb" style="text-align: center;color: #e12f45;">
        ${message}
    </div>
   </#if>
</div>
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
    })
    var pagecount= ${pager.pageCount};
    var page= ${pager.pageNumber};
    var pagesize = ${pager.pageSize};
    var promotionsId = "${promotions.id}";
    var priceHide = "${priceHide}";
    var totalheight = 0;     //定义一个总的高度变量
    var flag = true;//数据是否加载完了 true 未完  false  完了
    var isload = false;//是否加载中， true 未加载  false  正在加载中
    $(window).scroll( function() {
        totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop()) + 500;     //浏览器的高度加上滚动条的高度,减去底部高度
        if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
        {
            //加载数据
            loadGoods();
        }
    });

    //显示加载更多
    function loadGoods(){
        if(pagecount>page && !isload){
            var index = layer.load();
            page=parseInt(page)+1;
            isload=true;
            $.ajax({
                url:"${base}/huodongdata/"+promotionsId,
                type:"POST",
                data:"pageNumber="+page,
                success:function(result){
                    layer.close(index);
                    isload = false;
                    if(result.status=="success") {
                        var html = makehtml(result.data);
                        $("#goodsDataTable").append(html);
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
                        //判断是否加载完
                        if( parseInt(result.pager.pageNumber) >= parseInt(result.pager.pageCount)) {
                            flag = false;
                            $("#tip_notice").text('没有了...');
                        }
                    }
                },
                error:function(){
                    layer.alert("获取数据失败请刷新后重试！");
                }
            });
        }
    }
    function makehtml(data){
        var html="";
        $.each(data, function (goods_index, goods) {
            if((goods_index+1)%5==0){
                html +=  '<li class="lase">';
            }else{
                html +=  '<li>';
            }
            html+='<div class="pro_info"><div class="showbox">';
            html += '<a target="_blank" href="${base}/item/'+goods.id+'.html">';
            html += '<img src="';
            html += goods.pic  +'@210w_210h.png';
            html += '" width="210" height="210" alt="'+goods.name+'" title="'+goods.name+'">';
            html += '</a>';
            if(priceHide == "hide"){
                html += ' <div class="subtitle" style="display: none;"> ';
            }else{
                html += ' <div class="subtitle"> ';
            }
            html+=' <div class="f-fl"> <a onclick="judgeAuth(\'${base}\',\'addCarts\',addCart.bind({},\'' + goods.id + '\',1))" class="car">加入购物车</a> </div>';
            html+='<div class="f-fr"> <a onclick="judgeAuth(\'${base}\',\'addAttention\',addGoodsAttention.bind({},\'' + goods.id + '\',this));" class="gz_on">关注</a> </div>';
            html+='</div></div>';
            <#if promotions.isOpen == "start">
            html+='<p class="pro_price">';
            if(priceHide == "hide"){
                html += '<span>会员可见!</span>';
            }else{
                html += '<i>原价：</i>';
                html +='￥'+goods.goodsPrice.toFixed(2);

            }
            html+='</p">';
            html+='<p class="pro_price red">';
            if(priceHide == "hide"){
                html += '<span>会员可见!</span>';
            }else{
                html += '<i>活动价：</i>';
                html +="￥"+goods.promotionsPrice.toFixed(2);
            }
            html+='</p">';
            <#else >
                html+='<p class="pro_price">';
                if(priceHide == "hide"){
                    html += '<span>会员可见!</span>';
                }else{
                    html += '<i>商城价：</i>';
                    html +='￥'+goods.price.toFixed(2);
                }
                html+='</p">';
                html+='<p class="pro_price red">';
                if(priceHide == "hide"){
                    html += '<span>会员可见!</span>';
                }else{
                    html += '<i>会员价：</i>';
                    html +="￥"+gl.marketPrice.toFixed(2);
                }
                html+='</p">';
            </#if>
            html+='<p class="pro_tit"><a target="_blank" href="" title='+goods.name+'>'+goods.name+'</a></p>';
            html+='<p class="pro_tit">条码：'+goods.barcode+'</p>';
            if(goods.sales==null||goods.sales<=0){
                html+='<p class="pro_sp_info"><span>月成交<i>0';
            }else{
                html+='<p class="pro_sp_info"><span>月成交<i>'+transformNumber(goods.sales);
            }

            html+='笔</i></span>';
            html+= '<span class="lase">评价数<i>'+goods.scoreCount+'条</i></span>'
            html+= '</p></div>';
       /*     if(goods.hasRebate=='no'){
                html+='<div class="fanli_2" style="display:none;">返利</div>';
            }else{
                html+='<div class="fanli_2">返利</div>';
            }*/
            html += '</li>';
        });
        return html;
    }
    function transformNumber(number){
        if(number>10000){
            return (number/10000).toFixed(2)+"万";
        }else{
            return number;
        }
    }

        /*关注*/
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
    /*加入购物车*/
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }
</script>
<#include "bec/ghj/service.ftl"/>
<#include "bec/ghj/foot.ftl"/>
</#escape>