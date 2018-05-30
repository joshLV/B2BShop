<#include "bec/ghj/header.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/pro_info.css">
<style>
    #kinMaxShow{z-index:10; width: 600px!important; height:600px!important; overflow:hidden;}
    #kinMaxShow .KMSPrefix_kinMaxShow_image_box .KMSPrefix_kinMaxShow_image_item a.KMSPrefix_kinMaxShow_coverlink {
        width: 600px!important; height:600px!important;
        display: block;
        text-decoration: none;
        padding: 0;
        margin: 0;
        background: transparent;
        text-indent: 0;
        outline: none;
        hide-focus: expression(this.hideFocus=true);
    }
    #kinMaxShow .KMSPrefix_kinMaxShow_image_box{
        width: 600px!important;
        height:600px!important;
        position: relative;
        z-index: 1;
    }
    #kinMaxShow .KMSPrefix_kinMaxShow_image_box .KMSPrefix_kinMaxShow_image_item {
        width:600px!important;
        height: 600px!important;
        position: absolute;
        overflow: hidden;
    }
    #kinMaxShow .KMSPrefix_kinMaxShow_button {
        right: 50%; margin-right: -40px;
    }
</style>
<!--购买数量所用js（jquery.spinner.js）-->
<script type="text/javascript" src="${base}/static/bec/project/ghj/js/system.js"></script>
<script type="text/javascript" src="${base}/static/bec/project/ghj/js/jquery.spinner.js"></script>
<#--<div id="container f-cb">-->
<#include "bec/ghj/top.ftl"/>

<div class="zc_div f-cb">
    <div class="zc_top f-cb">
        <div class="zc_topl">
          <#--  <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <#list goodsImagesList?sort_by("orderNo") as img>
                    <img name="imgSilder" name="imgSilder" alt="${img.title}" src="${img.pic}@455w_354h_2e.png"/>
                    <#if img_index==0><#break></#if>
                </#list>
            </#if>-->
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <div class="banner" id="kinMaxShow">
                    <#list goodsImagesList?sort_by("orderNo") as img>
                    <div>
                        <a href="javascript:void(0)">
                            <img alt="${img.title}" title="${img.title}" src="${img.pic}@455w_354h_2e.png">
                        </a>
                    </div>
                    </#list>
                </div>
                </#if>


        </div>
        <div class="zc_topright">
            <div class="zc_topr">
                <p class="p-title">${goods.name}</p>
                <p class="p-title2">${goods.description}</p>
               <#-- <p class="p-price"><span class="f-fl">会员价：<em class="hyj">￥100元</em></span><span span class="f-fr">商城价：<em>￥130元</em></span></p>-->
                <p class="p-have"> <span class="f-fl">目标金额：<em>￥${mbje}万元</em></span> <span class="f-fr">众筹价格：<em class="zcfont">${goods.successPrice?string(priceCurrencyFormat)}元</em></span> </p>
                <p class="p-num"><span style="font-size: 14px;">已筹金额:</span><span><em>￥</em><#if ycje?number&lt;1>${ycjeY}元<#else>${ycje}万元</#if></span></p>
                <div class="jdt_num">
                    当前进度
                    <em>${zcbfb}%</em>
                </div>
                <div class="p-bar">
                    <div style="width: ${zcbfb}%" class="p-bar-green"></div>
                </div>
                <p class="p-progress f-cb"> <span class="f-fl percent">${zcrs}名支持者</span><span class="f-fr">剩余 <#if syts ==1> ${sysj}<#else> ${syts}</#if> <#if syts &lt;=1><#else>天</#if></span> </p>
                <p class="p-target"> 此商品众筹必须在
                    <span class="f_red"> ${goods.zcEndTime?string("yyyy年MM月dd日")} </span>前得到 <span class="f_red"><i> ￥</i>${mbje}万元</span>的支持才可众筹成功，
                    众筹成功只需付款<span class="f_red"> ${goods.successPrice}元 </span>/<#if goods.unit??>${goods.unit}<#else>个</#if>即可得到该众筹商品。
                </p>
                <p class="p-target">点击<font style="font-weight: bold;">下单支持</font>跳转至众筹商品核对收货信息、认购数量页面，并支付定金。如有任何疑问请联系相关业务经理。</p>

                <p class="p-btns"><a id="takeCareId" href="javascript:;" onclick="addGoodsAttention('${goods.id}')" class="btn_1 follow"><span>添加关注</span></a>
                    <a href="javascript:;" id="isAttentions_a" class="btn_1 follow on" style="display: none;"><span>已关注</span></a>
                    <#if goods.isNaNOrder&gt;0>
                        <a href="javascript:;" class=".zc_top .zc_topr .p-btns .not-praise-grey"><span >下单支持</span></a>
                    <#else>
                        <a href="javascript:;"
                           onclick="
                               <#if status=='1'>
                                       topMsg('1');
                               </#if>
                               <#if status=='2'>
                                        xdzc('${goods.id}')
                               </#if>
                               <#if status=='3'>
                                       topMsg('3');
                               </#if>" class="btn_1 not-praise" >
                            <span >下单支持</span>
                        </a>
                    </#if>
                </p>
            </div>
            <div class="zc_tit2 f-cb">项目支持者<span>（${zcrs}人）</span></div>
            <#if orderList?? && orderList?size &gt; 0>
                <div class="rollBox">
                    <div class="LeftBotton" onMouseDown="ISL_GoUp()" onMouseUp="ISL_StopUp()" onMouseOut="ISL_StopUp()"></div>
                    <div class="RightBotton" onMouseDown="ISL_GoDown()" onMouseUp="ISL_StopDown()" onMouseOut="ISL_StopDown()"></div>
                    <div class="Cont" id="ISL_Cont">
                        <div class="ScrCont">
                            <div id="List1">
                                <ul>
                                    <#list orderList as order>
                                        <li class="item-li">
                                            <div class="item-img">
                                                <img src="${base}/static/bec/project/ghj/images/tx.jpg">
                                                <div class="item-shadow"></div>
                                                <div class="item-num2">${order_index+1}</div>
                                            </div>
                                            <div class="item-detail">
                                                <p class="item-name">${order.createUser?substring(0,3)}****${order.createUser?substring(order.createUser?length-4,order.createUser?length)}</p>
                                                <p class="item-num">订购数量：<span>${order.goodsTotalQuantity}<#if goods.unit??>${goods.unit}<#else>个</#if></span></p>
                                                <p class="item-num">订购时间：<span>${order.createDate?string("yyyy年MM月dd日")}</span></p>
                                            </div>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                            <div id="List2"></div>
                        </div>
                    </div>
                    <script src="${base}/static/bec/project/ghj/js/honor.js" type="text/javascript"></script>
                </div>
            <#else>
                <div class="more">
                    <span>暂时没有支持者！</span>
                </div>
            </#if>
        </div>
        <#if status =='1'>
            <div class="zc_state zc_zcfb"></div>
        </#if>
        <#if status =='2'>
            <div class="zc_state zc_zcz"></div>
        </#if>
        <#if status =='3'>
            <div class="zc_state zc_zcsb"></div>
        </#if>
   <#-- <#if status =='1'><span class="s_ks">未开始</span></#if>
    <#if status =='2'><span >众筹中</span></#if>
    <#if status =='3'><span class="s_sb">已结束</span></#if>-->

        <!--<div class="zc_state zc_zccg"></div>  众筹成功-->
        <!--<div class="zc_state zc_zcfb"></div>  待发布-->
        <!--<div class="zc_state zc_zcsb"></div>  众筹失败-->

    </div>
    <div class="zc_lcon f-cb">
        <div class="zc_tit">
            <h2>产品详情</h2>
        </div>
        <div class="zc_content">
            <#if isEnable=='NO'>
                ${goods.introduction}
            <#else>
                ${goods.phoneIntroduction}
            </#if>
            <#--<p>商品名称：江中猴姑饼干（15天)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上架时间：2016-05-04 15:38:10</p>
            <img src="temp/pic5.jpg"><br>
            <img src="temp/pic6.jpg">-->
        </div>

    </div>
    <div class="zc_rcon">
        <#if zhongChouList?? && zhongChouList?size &gt; 0>
            <#list zhongChouList as zc>
                <#assign zcgoods = zc["goods"]/>
                <p class="p-pirce">${zcgoods.name}</p>
                <dl class="zc_dl">
                    <dt>
                        <a href="${base}/zcgoods/detail/${zcgoods.id}.html?whichclient=whichpc" target="_blank">
                            <#if zcgoods.pic?exists>
                                <img src="${zcgoods.pic}@370w_200h.png">
                            <#else>
                                <img src="${base}/images/loaderror.png">
                            </#if>
                        </a>
                    </dt>
                    <dd>
                        <p class="par1">当前进度：<span class="hs">${zc["zcbfb"]}%</span></p>
                        <p class="par1"><#if 1== zc["syts"]>剩余时间<#else>剩余天数</#if>：<span><#if 1== zc["syts"]>${zc["sysj"]}<#else>${zc["syts"]}</#if> <#if 1== zc["syts"]>时<#else>天</#if></span></p>
                        <p class="par1">已筹金额：<span>￥<#if zc["ycje"]?number&lt;=0> ${zc["ycjeY"]}元<#else>${zv["ycje"]}万元</#if></span></p>
                        <p class="par2">
                            <#if zcgoods.isNaNOrder&gt;0>
                                <a href="javascript:;" class=".zc_top .zc_topr .p-btns .not-praise-grey"><span >下单支持</span></a>
                            <#else>

                                <#--<a href="javascript:void(0)" onclick="<#if zc["status"] ==1>topMsg('1');</#if><#if zc["status"] ==2>xdzc('${zcgoods.id}')</#if><#if zc["status"] ==3>topMsg('3');</#if>"  class="btn_2">下单支持</a>-->
                                <a href="javascript:void(0)" onclick="<#if zc["status"] ==1>topMsg('1');</#if><#if zc["status"] ==2>judgeAuth('${base}','goOrder',xdzc('${zcgoods.id}').bind({}));</#if><#if zc["status"] ==3>topMsg('3');</#if>"  class="btn_2">下单支持</a>
                            </#if>
                        </p>
                    </dd>
                </dl>
            </#list>
        </#if>

    </div>
</div>


<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>

<script type="text/javascript">
    var priceHide = '${priceHide}';
    $(function(){
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
    });

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

    function goToOrder(){
        window.location.href = window.location.href;
    }

    function addGoodsAttention(goodsId) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    layer.alert(data.message,{icon: 7});
//                    $("#takeCareId").addClass("on")
                    $("#takeCareId").hide();
                    $("#isAttentions_a").show();
                }else if(data.status=='warn'){
                    layer.alert(data.message,{icon: 7});
//                    $("#takeCareId").addClass("on")
                    $("#takeCareId").hide();
                    $("#isAttentions_a").show();
                }else if(data.status=='NOLOGIN'){
                    layer.alert('登录后才可关注商品',{icon: 7});
                }else{
                    layer.alert(data.message,{icon: 7});
                }

            }
        });
    }

    function topMsg(nTag) {
        if(nTag=="1") {
            layer.alert('活动尚未开始,尽请期待！',{icon: 7});
        } else if(nTag=="3") {
            layer.alert('活动已经结束！',{icon: 7});
        }  else if(nTag=="5") {
            layer.alert('亲，宝贝已被抢光了，下次早点来哦！',{icon: 7});
        }
    }

    //下单支持
    function xdzc(goodsId){
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
            return false;
        }

        //验证用户已购数量
        var maxNum = #{goods.buyMaxNum}; //允许购买最大数量,为0时为不限制
        var hadBuyNum = <#if zhongChouSumQuantity?exists>#{zhongChouSumQuantity}<#else>0</#if>; //当前用户已购买众筹
        if(parseInt(maxNum)!=0) {
            if(parseInt(hadBuyNum)>=parseInt(maxNum)) {
                layer.alert('亲, 您已经购买了最大数量的众筹商品！',{icon: 5});
                return;
            }
        }

        window.location.href = '${base}/zcorder/ordercheck/'+goodsId+'.html?whichclient=whichpc';
    }

    function isAttention(gid){
        $.ajax({
            type: "post",
            url: base+"member/goodsattention/ajaxIsAttention",
            data:{gid: gid},
            success: function(data) {
                if(data.status=='success'){
                    if( data.isAttention ){
                        $("#takeCareId").hide();
                        $("#isAttentions_a").show();
                    }else{
                        $("#takeCareId").show();
                        $("#isAttentions_a").hide();
                    }
                }
            }
        });
    }
</script>



<#include "bec/ghj/service.ftl"/>
<#include "bec/ghj/foot.ftl"/>