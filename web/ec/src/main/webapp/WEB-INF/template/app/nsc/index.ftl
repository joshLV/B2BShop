<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/app/nsc/theme/red/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${base}/static/app/nsc/theme/red/function.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/app/nsc/theme/red/css.css">
    <script src="${base}/static/app/nsc/js/mui.min.js"></script>
    <script src="${base}/static/app/nsc/js/mui.enterfocus.js"></script>
    <script src="${base}/static/app/nsc/js/app.js"></script>
<body>
<header class="mui-bar mui-bar-nav">
    <div class="mui-pull-left fonts logo-font"> 文昌农商场 </div>
    <div class="mui-title">
        <div class="mui-input-row">
            <input id="search" type="search" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" class="mui-input-speech mui-input-clear" placeholder="请输入商品名称">
        </div>
    </div>
    <div class="mui-pull-right"> <a id="setting" class="mui-icon mui-icon-bars" href="${base}/allSort?whichclient=whichapp"></a> </div>
</header>
${typeList}
 <div class="mui-content">
     <div id="slider" class="mui-slider" >
        <div class="mui-slider-group mui-slider-loop">
        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
            <#assign lastImg = adslides?last>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${lastImg.pic}_492x161.png" alt="${lastImg.description}">
            </div>
            <#list adslides as slideitem>
                <div class="mui-slider-item mui-slider-item-duplicate">
                     <img src="${slideitem.pic}_492x161.png" alt="${slideitem.description}">
                </div>
            </#list>
            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
            <#assign firstImg = adslides?first>
                 <img src="${firstImg.pic}_492x161.png" alt="">
            </div>
        </div>

        <!-- 轮播图片下面的小点 -->
        <div class="mui-slider-indicator">
            <#list adslides as slideitem>
                <#if slideitem_index == 0>
                    <div class="mui-active mui-indicator"></div>
                <#else><div class="mui-indicator"></div>
                </#if>
            </#list>
        </div>
    </div>
    <!--导航-->
    <div class="f-cb ico-link fonts">
        <div class="f-fl"> <a href="${base}/allSort?whichclient=whichapp"><img src="${base}/static/app/nsc/images/fl_icon.png" alt=""><br>
            商品分类</a> </div>
        <div class="f-fl"> <a href="${base}/fossick/list?whichclient=whichapp"><img src="${base}/static/app/nsc/images/ppj_icon.png" alt=""><br>
            农资淘</a> </div>
        <div class="f-fl"> <a href="${base}/join/whichapp"><img src="${base}/static/app/nsc/images/zsrz_icon.png" alt=""><br>
            招商入驻</a> </div>
        <div class="f-fl"> <a href="${base}/member/index?whichclient=whichapp"><img src="${base}/static/app/nsc/images/grzx_icon.png" alt=""><br>
            个人中心</a> </div>
    </div>
    <!--导航-->
    <!--导航栏目-->
    <div id="segmentedControl" class="mui-segmented-control fonts">
        <a class="mui-control-item mui-active" href="#item1mobile">新品速递</a>
        <a class="mui-control-item" href="#item2mobile">热评商品</a>
        <a class="mui-control-item" href="#item3mobile">当季推荐</a>
        <a class="mui-control-item" href="#item4mobile">超值优惠</a>
    </div>
    <!--导航栏目结束-->
     <!--导航栏目结束-->
    <div class="tabs">
    <!--热卖商品等。。-->
       <#list tagGoodsList as tagGoodsMap>
            <div id="item${tagGoodsMap_index+1}mobile"
                 <#if tagGoodsMap_index==0> class="mui-control-content mui-active "
                  <#else> class="mui-control-content"
                 </#if>  >
                <ul class="f-cb">

                    <#list tagGoodsMap["goodsList"] as goods>
                        <#if goods_index<2>
                            <li class="f-fl">
                                <div class="li-line">
                                    <div class="goods-pic">
                                        <!--链接到商品详情-->
                                        <a href="${base}/item/whichapp/${goods.id}.html">
                                            <img alt="${goods.fullName}" src="${goods.pic}_200x150.png">
                                        </a>
                                    </div>
                                    <!--商品名字-->
                                    <div class="mui-ellipsis-2" >
                                        <a href="${base}/item/whichapp/${goods.id}.html" title="${goods.fullName}">${goods.name}</a>
                                    </div>
                                    <!--商品名字-->
                                    <div class="goods-price1">
                                        <span> 市场价：${goods.marketPrice}元</span>
                                    </div>
                                    <div class="goods-price2">
                                        <span> 商城价：${goods.price}元</span>
                                    </div>
                                </div>
                            </li>
                        </#if>
                    </#list>
                </ul>
            </div>
        </#list>
    </div>


    <!--热卖商品等结束。。-->
    <div class="line"></div>
    <!--楼层显示-->
       <#list typeList as child>
        <div class="floors">
            <div class="floor-title f-cb">
                <div class="f-fl">${child["catelog"].name}</div>
                <div class="f-fr">
                    <#list child["categrandList"] as cate>
                    <#if cate_index<2>
                        <a href="${base}/list/whichapp/${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a>
                    </#if>
                    </#list>
                    <a href="#">更多&gt;</a>
                </div>
            </div>
            <!--楼层商品显示-->
            <div class="floor-content">
                <ul class="f-cb">
                    <#list child["goodschildList"] as goodschild>
                        <!--商品显示-->
                        <li class="f-fl">
                            <a href="${base}/item/whichapp/${goodschild.id}.html" >
                                 <div class="li-line">
                                    <div class="goods-pic"><img src="${goodschild.pic}_200x150.png" alt="${goodschild.fullName}" class="li-line"></div>
                                     <div class="mui-ellipsis-2"> ${goodschild.fullName}</div>
                                     <div class="goods-name">市场价：￥${goodschild.marketPrice}元</div>
                                     <div class="goods-name" style="color: red">商城价：￥${goodschild.price}元</div>
                                 </div>
                            </a>
                        </li>
                        <!--商品显示-->
                    </#list>
                </ul>
            </div>
            <!--楼层商品显示-->
        </div>
       </#list>
    <!--楼层显示结束-->
    <!--尾部信息-->
    <div class="foot">
        <div class="link">
            <a href="${base}/member/login?whichclient=whichapp" >登陆</a> | <a href="${base}/member/register?whichclient=whichapp">注册</a> | <a href="#">反馈</a>
        </div>
        <div class="copyright">
            西安文昌农商场<br>
            招商电话：029-63608111 029-63379111<br>
            地址：西安市北三环西段六村保物流园东侧
        </div>
    </div>
    <!--尾部信息-->
</div>

<!--footer-->
<div>
    <#include "app/nsc/tools.ftl">
</div>
<!--footer-->
<script>
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
            if(ismobile){
                mui.openWindow({url:fullpath+"/search/sa?key="+key});
            }else{
                window.location.href = "${base}/search/sa?key=" + key;
            }
        }
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#f7f7f7',
            swipeBack:true
        });
        var slider = mui("#slider").slider({interval: 1500});
        jQuery("#search").blur(function(){
            s(jQuery(this).val());
        })
        setTimeout(function() {
            if(ismobile && typeof(plus)!='undefined'){
                plus.navigator.closeSplashscreen();
            }
        }, 600);
        var backButtonPress = 0;
        mui.back = function(event) {
            backButtonPress++;
            if (backButtonPress > 1) {
                plus.runtime.quit();
            } else {
                plus.nativeUI.toast('再按一次退出应用');
            }
            setTimeout(function() {
                backButtonPress = 0;
            }, 1000);
            return false;
        }
    }(mui, document));
</script>
</head>

</body>
</html>
