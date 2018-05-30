<#escape x as x?html>
<#include "bec/ghj/header.ftl"/>
<script type="text/javascript">
    var isindex = true;
</script>
<style>
   /* body{background:#f7f7f7 url(${base}/static/bec/project/ghj/img/h_bg.png) center 40px no-repeat!important;}
    header{width:100%; height:164px; background:none;}
    nav{background: url(${base}/static/bec/project/ghj/img/nav_bg.gif) left bottom no-repeat; background-size:100% 2px;  }
*/
</style>
<#include "bec/ghj/top.ftl"/>
<link href="${base}/static/bec/project/ghj/css/imagehover.css" rel="stylesheet"/>
<#--<#include "bec/ghj/top_index.ftl"/>-->

<!-- 轮播 -->
<div class="banner" id="kinMaxShow">
    <#list adslides as slideitem>
        <div><a href="${base}/${slideitem.url}"><img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}@1920w_450h.png"></a></div>
    </#list>
</div><#-- kinMaxShow end-->


<div id="main">
    <div class="login">
        <div class="haslog" id="loginAfter">
            <div class="f-cb info">
                <div class="f-fl"><img src="${base}/static/bec/project/ghj/img/user.png" width="42" height="42" alt=""></div>
                <div class="f-fl"><span id="lg_nickeName"></span>,<script>hello();</script><br>
                    欢迎来到广货街交易平台！</div>
            </div>
            <div class="haslogin">
                <a href="${base}/order/list?orderType_=0&status=unconfirm" target="_blank"> 待确认<span id="lg_orderQRCount"></span></a><span class="line"></span>
                <a href="${base}/order/list?orderType_=0&status=wait_buyer_pay" target="_blank">待付款<span id="lg_orderFuKuanCount"></span></a><span class="line"></span>
                <a href="${base}/order/list?orderType_=0&status=wait_seller_send_goods" target="_blank">待发货<span id="lg_orderFaHuoCount"></span></a>
                <a href="${base}/order/list?orderType_=0&status=wait_buyer_confirm_goods" target="_blank">待到货<span id="lg_orderConfirmCount"></span></a><span class="line"></span>
                <a href="${base}/order/list?orderType_=0&status=wait_buyer_validate_goods" target="_blank">待验货<span id="lg_orderYHCount"></span></a><span class="line"></span>
                <a href="${base}/allG.html">开始采购</a>
            </div>
        </div>
        <div class="notlogin" id="login">
            <form id="formlogin" method="post" onsubmit="return false;">
            <div class="logininput">
                <div class="title f-cb">采购商登陆<span class="f-fr"><a href="javascript:regist();">免费注册</a></span></div>
                <div class="input">
                    <i class="icon-user"></i>
                    <input class="has_reset" type="text" name="userName" id="userName" maxlength="11" style="ime-mode:disabled" onkeydown="if(event.keyCode==13)event.keyCode=9" onKeyPress="if((event.keyCode<48 || event.keyCode>57))event.returnValue=false" placeholder="请输入手机号">
                    <label id="userName_succeed" class="blank invisible"></label>
                    <label id="userName_error" class="hide"></label>
                </div>
                <div class="input">
                    <i class="icon-lock"></i><input class="has_reset" type="password" name="password" id="password" placeholder="请输入密码">
                    <label id="pwd_succeed" class="blank invisible"></label>
                    <label id="pwd_error" class="hide"></label>
                </div>
            </div>
            <div class="loginbtns f-cb">
                <button class="subbtn loginbtn" id="loginsubmit" ><i class="icon-user"></i>&nbsp;登 录</button>
                <a href="${base}/findPwd" class="f-fr">忘记密码</a>
            </div>
            </form>
        </div>

      <div class="tnews">
          <h2>商城快报</h2>
          <ul id="news" style="height: 96px; overflow: hidden;">
              <#--<li><a href="#">国内首条“陆空联运”跨境电商货运直</a></li>
              <li><a href="#">跨境电商货运直</a></li>
              <li><a href="#">国内首条“陆空联运”跨境电商货运直</a></li>
              <li><a href="#">跨境电商货运直</a></li>-->
          </ul>





      </div>

    <#-- <div class="ads">
            <a href="${base}/join/whichweb" target="_blank"><img src="${base}/static/bec/project/ghj/img/zsrz.jpg" width="202" height="135" alt=""></a>
        </div>-->
        <div class="right_ico">
           <ul class="f-cb">
               <li id="nologin_a"><a href="${base}/member/login" target="_self"><img src="${base}/static/bec/project/ghj/img/ico_01.png" width="30" height="30"><p>登录</p></a></li>
               <li id="login_a" style="display: none;"><a href="${base}/member/logout" target="_self"><img src="${base}/static/bec/project/ghj/img/ico_07.png" width="30" height="30"><p>退出</p></a></li>
               <li><a href="${base}/member/register" target="_blank"><img src="${base}/static/bec/project/ghj/img/ico_02.png" width="30" height="30"><p>注册</p></a></li>
               <li><a href="${base}/help/question/254774863888121856.html" target="_blank"><img src="${base}/static/bec/project/ghj/img/ico_03.png" width="30" height="30"><p>常见问题</p></a></li>
               <li><a href="${base}/help/question/254775495919403008.html" target="_blank"><img src="${base}/static/bec/project/ghj/img/ico_04.png" width="30" height="30"><p>配送服务</p></a></li>
               <li><a href="${base}/help/question/254777300363509760.html" target="_blank"><img src="${base}/static/bec/project/ghj/img/ico_05.png" width="30" height="30"><p>支付方式</p></a></li>
               <li><a href="${base}/help/question/254776214156214272.html" target="_blank"><img src="${base}/static/bec/project/ghj/img/ico_06.png" width="30" height="30"><p>联系我们</p></a></li>



           </ul>


        </div>


        <script type="text/javascript">
            $(function(){
                if(!$("#userName").val()){$("#userName").focus();}
                var validate = function(){
                    var userName=$("#userName").val();
                    var password=$("#password").val();
                    var valid=true;
                    if(validateRules.isNull(userName)){
                        $("#userName").addClass("highlight_error");
                        $("#userName_error").html("请输入手机号");
                        $("#userName_error").addClass("error");
                        $("#userName_error").show();
                        return false;
                    }
                    if(!validateRules.isMobile(userName)){
                        $("#userName").addClass("highlight_error");
                        $("#userName_error").html("手机号格式错误!");
                        $("#userName_error").addClass("error");
                        $("#userName_error").show();
                        return false;
                    }
                    if(validateRules.isNull(password)){
                        $("#password").addClass("highlight_error");
                        $("#pwd_error").html("请输入您的登录密码");
                        $("#pwd_error").addClass("error");
                        $("#pwd_error").show();
                        return false;
                    }
                    if(!validateRules.betweenLength(password,6,20)){
                        $("#password").addClass("highlight_error");
                        $("#pwd_error").html("登录密码长度在6~20范围内!");
                        $("#pwd_error").addClass("error");
                        $("#pwd_error").show();
                        return false;
                    }
                    return valid;
                };
                $("#userName").bind("focus", function () {
                    $("#userName").removeClass("highlight_error");
                    $("#userName").addClass("highlight_success");
                    $("#userName_error").html("");
                    $("#userName_error").removeClass("error");
                    $("#userName_error").hide();
                }).bind("blur", function () {
                    $("#userName").removeClass("highlight_success");
                });
                $("#password").bind("focus", function () {
                    $("#password").removeClass("highlight_error");
                    $("#password").addClass("highlight_success");
                    $("#pwd_error").html("");
                    $("#pwd_error").removeClass("error");
                    $("#pwd_error").hide();
                }).bind("blur", function () {
                    $("#password").removeClass("highlight_success");
                });
                $("#loginsubmit").click(function () {
                    if(!validate()){
                        return;
                    }
                    $this=$(this);
                    $this.attr({ "disabled": "disabled" });
                    $.ajax({
                        type: "post",
                        url: "${base}/member/check",
                        data:{'userName':$("#userName").val(),'password':$("#password").val()},
                        datatype: 'json',
                        error: function () {
                            $("#loginsubmit").removeAttr("disabled");
                            $this.removeAttr("disabled");
                        },
                        success: function(result) {
                            $this.removeAttr("disabled");
                            if("error"==result.status){
                                $("#pwd_error").html(result.message);
                                $("#pwd_error").addClass("error");
                                $("#pwd_error").show();
                            }else if("false"==result.status){
                                layer.alert(result.message);
                               /* layer.alert(result.message,{icon:2},function(){
                                    window.location=${base}/+"member/registerForward?buyerId="+result.buyerId;
                                });*/
                            }else if("regRep"==result.status){
                                //此采购商未注册完毕
                                //window.location="${base}/member/registerForward?buyerId="+result.buyerId;
                                window.location="${base}";
                            }else{
                                window.location.reload();
                            }
                        }
                    });
                });
                $("#userName,#password, #authcode").bind('keyup', function (event) {
                    if (event.keyCode == 13) {
                        $("#loginsubmit").click();
                    }
                });

                //定时器循环今日特价、热卖商品、包款、人气
                setInterval("eachTag()",3000);

                $(".tabbtn").on("mouseover",function(){
                    mouseSelct = false;
                    $(this).trigger("click");
                }).on("mouseout",function(){
                    mouseSelct = true;
                });
            });

            var mouseSelct = true;

            function eachTag(){
                if(mouseSelct){
                    var tabArray = new Array('li_tab1','li_tab2','li_tab3','li_tab4');
                    var $currTab = $(".tabbtns .active");
                    var currTab = $currTab.attr("id");
                    var nextId = '';
                    for(var i = 0; i < tabArray.length; i++){
                        if( currTab == tabArray[i] ){
                            nextId = tabArray[(i == 3? 0 : i+1)];
                            break;
                        }
                    }
                    $("#"+nextId).trigger("click");
                }
            }
        </script>
    </div>

    <!-- 品牌logo zyf 2016-12-1 -->
    <div class="brand_con">
        <div class="brand_tit">
            <h2><img src="${base}/static/bec/project/ghj/img/brand_tit.png"></h2>
            <span>
                <input type="hidden" id="barndPagerCount" value="${barndPagerCount}" />
                <input type="hidden" id="barndPagerIndex" value="1" />
                <a href="javascript:void(0);" onclick="brandNextPager();"><em><img src="${base}/static/bec/project/ghj/img/hyh.png"></em>换一批</a>
            </span>
        </div>
        <ul id="brand_list">
                    <li id="brand_item1">
                        <ul class="brand_ul">
                            <#list barndList as gb>
                            <li>
                                <figure <#if gb_index % 2 == 0>class="imghvr-slide-left"<#else>class="imghvr-slide-right"</#if>>
                                    <img src="${gb.pic}" alt="${gb.name}">
                                    <figcaption>
                                            <p class="p-top">${gb.name}</p>
                                            <p><a href="javascript:searchG('${gb.name}')" class="enter-a">点击进入</a></p>
                                    </figcaption>
                                </figure>
                            </li>
                            </#list>
                        </ul>
                    </li>
        </ul>
    </div>
    <#--换一换 js-->
    <script type="text/javascript">
        function brandNextPager () {
            var barndPagerCount = parseInt($("#barndPagerCount").val());
            var barndPagerIndex = parseInt($("#barndPagerIndex").val()) + 1;
            if(barndPagerIndex > barndPagerCount){
                barndPagerIndex = 1;
            }
            $.ajax({
                type: "post",
                url: "${base}/ajaxBrand",
                data: 'pageNumber='+barndPagerIndex+'&pagerSize=30',
                success: function(data) {
                    if (data.status == 'success') {
                        $("#barndPagerCount").val( data.pager.pageCount);
                        $("#barndPagerIndex").val(data.pager.pageNumber);
                        if( data.brandList ){
                            var html = '';
                            html +='<ul class="brand_ul">';
                            $.each(data.brandList,function(k,v){
                                    html +='    <li>';
                                    html +='        <figure ';
                                    if( k % 2 == 0){
                                        html +='class="imghvr-slide-left"';
                                    }else{
                                        html +='class="imghvr-slide-right"';
                                    }

                                    html +='   >';
                                    html +='            <img src="';
                                    if(v.pic != undefined){
                                        html += v.pic+'';
                                    }
                                    html +='" alt="' + v.name + '">';
                                    html +='            <figcaption>';
                                    html +='                    <p class="p-top">'+ v.name + '</p>';
                                    html +='                    <p><a href="javascript:searchG('+ v.name + ')" class="enter-a">点击进入</a></p>';
                                    html +='            </figcaption>';
                                    html +='        </figure>';
                                    html +='    </li>';
                            });
                            html +='</ul>';
                            $("#brand_item1").html(html);
                        }
                    }
                }
            });
        }

        /*$("ul.brand_ul li").hover(function(){
            $(".brand_enter").toggle();
        });*/
    </script>

    <!--本周特价和新品推荐先隐藏 2016年11月22日11:16:25 lxb-->
    <!-- 今日特价 热卖  爆款 人气  start -->
    <div class="hot" style="display: none;">
        <div class="tabbtns">
            <ul>
                <li link="#tab1" id="li_tab1" class="tabbtn active" ><span>本周特价</span>
                    <div class="times">
                        <p>距离特价结束</p>
                        <div class="endtime" value="604800"></div>
                    </div>
                </li>
                <li link="#tab2" id="li_tab2" class="tabbtn"><span style="padding-top: 20px;">新品推荐</span>
                    New Arrivals</li>
                <#--<li link="#tab3" id="li_tab3" class="tabbtn shadow">爆款商品<br>
                    EXPLOSIVE GOODS</li>
                <li link="#tab4" id="li_tab4" class="tabbtn shadow">人气商品<br>
                    POPULARITY</li>-->
            </ul>
        </div>
        <div class="tabs">
        <#list tagGoodsList as tagGoodsMap>
            <div class="tab" id="tab${tagGoodsMap_index + 1}">
                <ul class="f-cb">
                <#list tagGoodsMap["goodsList"] as goods>
                    <li class="f-fl">
                        <div class="p-img">
                            <a href="${base}/item/${goods.id}.html" target="_blank">
                                <img alt="${goods.fullName}" src="${goods.pic}@150w_150h.png" width="150" height="150">
                            </a>
                        </div>
                        <div class="p-text">
                            <div class="p-name">
                                <a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a>
                            </div>
                            <div class="p-tm">条码：<span>${goods.barcode}</span></div>
                            <div class="p-price nologin_price">
                                <span>仅会员可见！</span>
                            </div>
                            <div class="p-price login_price" style="display: none;">
                               <p><i>商城价：</i><span>
                                    <#if goods.enableBatchPrice == '1'>￥${goods.batchPrice}
                                    <#else >
                                    ${goods.price?string("currency")}
                                    </#if>
                                </span></p>
                                <p><i>会员价：</i>
                                    <span class="red nologin_price">仅会员可见！</span>
                                    <span class="red login_price">￥${(goods.price * (1-goods.defaultPrice/100))?string(',##0.00')}</span>
                                </p>
                            </div>
                        </div>
                    </li>
                    <#if goods_index == 4><#break ></#if>
                </#list>
                </ul>
            </div>
        </#list>
        </div>
    </div>
    <!-- 今日特价 热卖  爆款 人气  End -->
</div>



    <#--促销信息  zyf 3-28-->
<div class="cx_bg f-cb" style="padding-top: 30px;">
    <div class="cx_tit"><a href="javascript:void(0)<#--${base}/promotionGoods/list.html-->" target="_blank"><img src="${base}/static/bec/project/ghj/img/cx_tit2.png"></a></div>
    <div class="cx_l"><img src="${base}/static/bec/project/ghj/img/cx_dl.png"></div>
    <div class="cx_r"><img src="${base}/static/bec/project/ghj/img/cx_dl.png"></div>
<div class="cuxiao">
    <#--<div class="cx_tit">促销信息<a href="${base}/promotionGoods/list.html" target="_blank"><img src="${base}/static/bec/project/ghj/img/cx_more.gif"></a></div>-->
    <ul class="cxlist">
        <#list promotionList as goodschild>
            <li <#if goodschild_index==4>class="lase"</#if>>
                <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                    <img alt="${goodschild.fullName}"  src="${goodschild.pic}@199w_199h.png" width="199" height="199"/>
                </a>
                <p class="par_tit"><a href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}" target="_blank">${goodschild.fullName}</a></p>
                <p class="par_tit">条码：${goodschild.barcode}</p>
                <p class="price_2 nologin_price">
                    <em  class="f-fr"></em>
                    <span class="on">仅会员可见！</span>
                </p>
                <p class="price_3 login_price" style="display: none;">
                     <i>商城价：</i>
                            <#if goodschild.enableBatchPrice == '1'>
                                ￥${goodschild.batchPrice}
                            <#else >
                            ${goodschild.price?string("currency")}
                            </#if>
                </p>
                <p class="price_3 red login_price" style="display: none;"><i>会员价：</i>
                    <span class="">￥${(goodschild.price * (1-goodschild.defaultPrice/100))?string(',##0.00')}</span>
                </p>
                <p class="price_2"> <em><a href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}" target="_blank">立即抢购</a></em></p>
            </li>
        </#list>
    </ul>
</div>
</div>
<div id="main">
    <div class="new_products">
        <div class="new_products_tit"><#--<a href="${base}/newArrivals/list">新品推荐</a>--></div>
        <div class="new_products_con">
            <div class="feature-list">
                <ul class="clearfix">
                    <li class="first">
                        <a href="${base}/newArrivals/list" target="_blank">
                            <img width="236" height="582" src="${base}/static/bec/project/ghj/img/new_proimg01.jpg" alt="">
                        </a>
                    </li>
                    <#list newArrivalsList as goodschild>
                    <li>
                        <div class="p-img f-cb">
                            <a href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                                <img src="${goodschild.pic}@209w_209h.png" width="208" height="208" alt="${goodschild.fullName}">
                            </a>
                            <div class="subtitle" style="display: none;">
                                <div class="f-fl"> <a href="javascript:void(0);" class="car" onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${goodschild.id}','1'));">加入购入车</a> </div>
                                <div class="f-fr"> <a href="javascript:void(0);" class="gz" onclick="judgeAuth('${base}','addAttention',addGoodsAttention.bind({},'${goodschild.id}',this));">关注</a> </div>
                            </div>
                        </div>
                        <div class="p-name textoverflow">
                            <a href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}" target="_blank">${goodschild.fullName}</a>
                        </div>
                        <div class="p-tm">条码：<span>${goodschild.barcode}</span></div>
                        <div class="p-price f-cb nologin_price">
                            <div class="f-fl">仅会员可见!</div>
                        </div>
                        <div class="p-price f-cb login_price" style="display: none;">
                            <div class="f-fl"><i>商城价</i>
                                <#if goodschild.enableBatchPrice == '1'>
                                    ￥${goodschild.batchPrice}
                                <#else >
                                ${goodschild.price?string("currency")}
                                </#if>
                            </div>
                            <div class="f-fr"><i>会员价</i>
                                <span class="nologin_price">仅会员可见！</span>
                                <span class="login_price">￥${(goodschild.price * (1-goodschild.defaultPrice/100))?string(',##0.00')}</span>
                            </div>
                        </div>
                        <div class="fanli" <#if goodschild.hasRebate=='no'>style="display:none;"</#if>></div>
                    </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>


    <!-- 楼层  Start -->
    <#list typeList as child>
        <!--${child_index+1}F Start-->
        <div class="floor">
            <div class="floortitle f-cb">
                <div class="f-fl floorname">
                    <a href="${base}/list/${child["catelog"].id}.html" target="_blank">${child["catelog"].name}</a>
                </div>
                <div class="f-fr floorlinks"  id="tabsbox" class="tabsbox">
                    <ul>
                        <#list child["categrandList"] as secondCatelog><#--二级分类-->
                            <li >
                                <a href="#xtab${secondCatelog.id}" onclick="return false;" class="<#if (secondCatelog_index == 0)>selected</#if>">${secondCatelog.name}</a>
                            </li>
                        </#list>
                    </ul>
                   <a href="${base}/list/${child["catelog"].id}.html"  target="_blank" class="more">更多<i class="icon-angle-right"></i></a>
                </div>
            </div>

            <div class="floorcontent" class="tabscont">

                <#list child["categrandList"] as secondCatelog><#--二级分类-->
                    <ul id='xtab${secondCatelog.id}'>
                        <#list child["goodschildList"]["${secondCatelog.id}"] as goodschild><#--二级分类对应商品信息展示-->
                            <li class="f-fl">
                                <div class="p-img f-cb">
                                    <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                                        <img alt="${goodschild.fullName}"  src="${goodschild.pic}@209w_209h.png" width="209" height="209" >
                                    </a>
                                    <div class="subtitle" style="display: none;">
                                        <div class="f-fl"> <a href="javascript:void(0);" class="car" onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${goodschild.id}','1'));" >加入购入车</a> </div>
                                        <div class="f-fr"> <a onclick="judgeAuth('${base}','addAttention',addGoodsAttention.bind({},'${goodschild.id}',this));" href="javascript:void(0);" class="gz">关注</a> </div>
                                    </div>
                                </div>
                                <div class="p-name textoverflow">
                                    <a href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">${goodschild.fullName}</a>
                                </div>
                                <div class="p-tm">条码：<span>${goodschild.barcode}</span></div>
                                <div class="p-price f-cb nologin_price">
                                    <div class="f-fl">仅会员可见！</div>
                                </div>
                                <div class="p-price f-cb login_price" style="display: none;">
                                    <div class="f-fl"><i>商城价</i>
                                        <#if goodschild.enableBatchPrice == '1'>
                                            ￥${goodschild.batchPrice}
                                        <#else >
                                        ${goodschild.price?string("currency")}
                                        </#if>
                                    </div>
                                    <div class="f-fr">
                                        <i>会员价</i>
                                        <span class="nologin_price">仅会员可见！</span>
                                        <span class="login_price">￥${(goodschild.price * (1-goodschild.defaultPrice/100))?string(',##0.00')}</span>
                                    <#--${goodschild.marketPrice?string("currency")}-->
                                    </div>
                                </div>
                                <div class="fanli" <#if goodschild.hasRebate=='no'>style="display:none;"</#if>></div>
                            </li>
                            <#if (goodschild_index == 9)><#break></#if>
                        </#list>
                    </ul>
                </#list>
            </div>
        </div>
        <#--楼层广告图-->
        <#if child['floor_bottom_'+'${child_index+1}'+'_1']?exists>
            <div class="floor_img">
                <a href="${child['floor_bottom_'+'${child_index+1}'+'_1'].link}" target="_blank">
                    <img width="1200" height="100" alt="${child['floor_bottom_'+'${child_index+1}'+'_1'].name}" src="${child['floor_bottom_'+'${child_index+1}'+'_1'].pic}@1200w_100h.png">
                </a>
            </div><!--floor floorBottomAd end-->
        </#if>
    </#list>
    <!--${child_index+1}F End-->

    <script type="text/javascript">

        $("#tabsbox ul").idTabs("xtabs0","!mouseover");

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
    </script>

    <!-- 楼层  End -->

</div><#-- main  end -->

<#include "bec/ghj/news.ftl"/>

<#include "bec/ghj/service.ftl"/>



<!--鼠标放上出现购物车效果-->
<script type="text/javascript">

    $(".p-img").each(function(){
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

    $(function(){
        /**
         * 判断是否登录
         */
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#login").hide();
                    $("#loginAfter").show();
                    /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
//                    $("#lg_nickeName").text('Hi! '+data.m.realName);
                    if(data.loginType == 'operator'){
                        $("#lg_nickeName").text('Hi! '+data.mp.realName);
                    }else{
                        //$("#lg_nickeName").text('Hi! '+data.m.realName);
                        if(data.m.realName!=null && data.m.realName!=""){
                            $("#lg_nickeName").text('Hi! '+data.m.realName);
                        }else{
                            $("#lg_nickeName").text('Hi! '+data.m.userName);
                        }
                    }
                    /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

                    $("#lg_orderQRCount").text('('+data.bl.orderQRCount+')');
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');
                    $("#lg_orderYHCount").text('('+data.bl.orderYHCount+')');

                    $(".nologin_price").hide();
                    $(".login_price").show();
                    $(".cart_btn").show();
                    $(".subtitle").show();
                    $("#nologin_a").hide();
                    $("#login_a").show();
                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                    $(".nologin_price").show();
                    $(".login_price").hide();
                    $(".cart_btn").hide();
                    $(".subtitle").hide();
                    $("#nologin_a").show();
                    $("#login_a").hide();
                }
            }
        });
    });
</script>

<script type="text/javascript">
    $(function(){

        var now = new Date(); //当前日期
        var nowDayOfWeek = now.getDay() == 0 ? 7 : now.getDay(); //今天本周的第几天
        var nowHour = now.getHours();
        var nowMinute = now.getMinutes();
        var nowSecond = now.getSeconds();
        var cha = parseInt($(".endtime").attr('value')) - ((nowDayOfWeek - 1)*24*60*60 +  nowHour*60*60 + nowMinute*60 + nowSecond);

        timer(cha);


        $(".prolist li img").each(function(){
            var img = $(this);
            img.hover(function(){
                img.next().show();
            },function(){
                img.next().hide();
            });
        });
    });

    function timer(intDiff){
        window.setInterval(function(){
            var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
            if(intDiff > 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var time = day+"天";
            time += hour+'时';
            time += minute+'分';
            time += second+'秒';
            $('.endtime').html(time);
            intDiff--;
        }, 1000);
    }
</script>

<#include "bec/ghj/foot.ftl"/>
</#escape>