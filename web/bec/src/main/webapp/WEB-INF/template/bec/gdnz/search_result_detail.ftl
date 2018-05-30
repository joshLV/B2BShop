<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>
    <#include "bec/gdnz/top.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/list.css">
<style type="text/css">
    .z_main{
        width: 1200px;
        margin: 0 auto;
    }
</style>
<!--main-->
<div class="z_main" id="product-list">
    <div class="list_search f-cb">
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>排序：</span></div>
            <div class="f-fl">
                <ul class="pro_sort pro_sort2">
                    <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                        <#if pager.orderBy=="sales" && pager.orderType=="desc">
                            <a class="" href="javascript:void(0)"  onclick="s('${keyword}','orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=sales&order=desc')">销量</a>
                        <#else>
                            <a href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=sales&order=asc')">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="minBatchPrice" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="minBatchPrice" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="minBatchPrice" && pager.orderType=="desc">
                            <a href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=minBatchPrice&order=asc')">价格</a>
                        <#elseif pager.orderBy=="minBatchPrice" && pager.orderType=="asc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=minBatchPrice&order=desc')">价格</a>
                        <#else>
                            <a href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=minBatchPrice&order=asc')">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="becScoreCount" && pager.orderType=="desc">
                            <a class="sort_3" href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=becScoreCount&order=asc')">评论数</a>
                        <#elseif pager.orderBy=="becScoreCount" && pager.orderType=="asc">
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=becScoreCount&order=desc')')">评论数</a>
                        <#else>
                            <a class="sort_3" href="javascript:void(0)"  onclick="searchResult('${keyword}','orderBy=becScoreCount&order=asc')">评论数</a>
                        </#if>
                    </li>
                    <li><a href="javascript:void(0)" onclick="s('${keyword}','pageNumber=${pageNumber}')" class="sort_4">普通模式</a></li>
                    <li class="on"><a href="javascript:void(0)" onclick="changeJsp();" class="sort_5">批发模式</a></li>
                </ul>
            </div>
            <div class="f-fr"> 共找到<em style="float: none;" id="totalResult">0</em>个商品 </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pf_list f-cb" id="show">
        <input type="hidden" name="basePath" id="basePath" value="${base}"/>
        <input type="hidden" value="${isLogin}" id="isLogin">
        <input type="hidden" value="${priceHide}" id="priceHide">
        <input type="hidden" name="pageNumber" id="cur_pageNumber" value="0"/>
        <input type="hidden" name="pageCount" id="cur_pageCount" value="1"/>
        <input type="hidden" name="keyword_input" id="keyword_input" value="${keyword}"/>
        <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
        <input type="hidden" name="orderType" id="cur_orderType" value="${pager.orderType}"/>
        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
            <ul id="goodsDataTable">
            </ul>
        </form>
    </div>
    <div class="all_checkbox f-cb"  id="shopping_total" >
        <div class="all_chk_left">
            <div class="chk">
                <input type="checkbox" id="checkall" value="全选"  name="cartIdAll" />
                <label for="checkbox-1-6"></label>
            </div>
            <em>全选</em>
        </div>
        <div class="f-fl moretip" id="tip_notice">滚动鼠标滚轮加载更多...</div>
        <a  href="javascript:;" onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));" id="checkout_btn" >加入购物车</a> </div>
</div><#-- main end -->
<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/gdnz/js/search_result/ajaxGetGoods.js" type="text/javascript"></script>
<script type="text/javascript">
    var priceHide = '${priceHide}';
    $(function () {
        $("#product-list").on("click","input[name='cartId']",function(){
            if($("#product-list input[name='cartId']").length > 0){
                var checked = true;
                $("#product-list input[name='cartId']").each(function(){
                    if(!$(this).prop("checked")){
                        checked = false;
                        return;
                    }
                });
                $("#checkall").prop("checked", checked);
            }
        });
        $("#checkall").on("click",function(){
            $("#product-list input[name='cartId']").prop("checked", $(this).prop("checked"));
            $("#checkall").prop("checked", $(this).prop("checked"));
        });
        $("#toSettlement").on('click', function(){
            judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));
        });
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
        if(priceHide=='hide') {
            $("#cartLogin").trigger("click");
        }else{
            loadGoods();
        }


        changeShoppingCartTotal();
        $(window).scroll(function(){
            changeShoppingCartTotal();
        });

    });



    //购物车结算效果
    function changeShoppingCartTotal(){
        var wh=$(window).height();
        var top=$(window).scrollTop();
        //console.log($(window).height()+" "+$(window).scrollTop());
        var it=$("#show").offset().top;
        var ih=$("#show").height();
        if(((wh+top)-(it+ih+100))>0){
            $("#shopping_total").css("position","static");
        }else{
            $("#shopping_total").css({"position":"fixed","bottom":"-28px","z-index":"99999"});
        }
    }


    function searchResult(keyword,filter){
        window.location.href= "${base}/search/detaillist/"+keyword+"?"+filter;
    }


    /** -------------------------加入购物车  Start -------------------------------*/


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
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus_"+goodsId).val();
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(reduceGoodsNum % defPackageModulus != 0){
            reduceGoodsNum = (parseInt(reduceGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

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
            if(reduceGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
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
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());

        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = parseInt($("#nowGoodsNum_"+goodsId).val());
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(nowGoodsNum % defPackageModulus != 0){
            nowGoodsNum = (parseInt(nowGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        /**
         * 如果限购数量为零，说明启用了限购数量
         *  超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
         *  TianYu 2016-2-17 10:17:17
         */
        if( defLimitNum != 0 && nowGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断改变之后的数量是否小于起批数量
            if(nowGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else if(nowGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+nowGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(nowGoodsNum);
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
        }else{//无批发价时
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
                return;
            }else{
                $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
            }
        }
    }

    function add(goodsId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = $("#defStartBatchPrice_"+goodsId).val();
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //加1之后的商品数量
        //修改默认值为1的情况下 手动输入和点击加号算法不一致的情况  yuech 2016-02-23 14:23
        var addGoodsNum = parseInt(nowGoodsNum) + defPackageModulus;
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(addGoodsNum % defPackageModulus != 0){
            var i = parseInt(addGoodsNum / defPackageModulus);
            addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
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

    /** -------------------------加入购物车  end -------------------------------*/


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
        loadGoods();
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
            //s('${keyword}','listStyle=detailList&pageNumber=${pageNumber}');
            location.href = "${base}/search/detaillist/${keyword}";
        }
    }
</script>


    <#include "bec/gdnz/service.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
</#escape>