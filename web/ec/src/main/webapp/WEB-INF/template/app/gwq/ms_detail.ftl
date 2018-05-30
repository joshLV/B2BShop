<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

    <head>
    <#include "app/gwq/head.ftl">
      <#--script type="javascript" src="/ec/static/app/gwq/js/jquery.idTabs.min.js"></script-->

<style>

/*产品详细介绍样式*/
    .goods_abstract {
        background: #fff;
        border-bottom: solid 1px #d8d8d8;
        padding: .8rem .5rem; overflow:hidden;
    }
    .goods_abstract h2 {font-size: 16px; line-height:22px;color: #333;
         font-weight: normal!important;
        margin-top: 0px!important;
        margin-bottom: 0px!important;
    }
    .goods_abstract .goods_sell {
        margin: 10px 0 4px;
        color: #aaa;
    }
    .goods_abstract .goods_sell li{ float:left; font-size:13px; width:100%; padding-bottom:3px;}
    .goods_abstract .goods_sell li .pro_l{ float:left;}
    .goods_abstract .goods_sell li .pro_l .t1 {font-size: 15px;}
    .goods_abstract .goods_sell li .pro_l span{padding-left:5px;font-size:13px; color:#999;}
    .goods_abstract .goods_sell li .pro_l span.scj{  text-decoration:line-through;}
    .goods_abstract .goods_sell li .pro_l strong {color: #E4393C;}
    .goods_abstract .goods_sell li .pro_l .t2{font-size: 20px;}
    .goods_abstract .goods_sell li .pro_r{ float:right;}
    .goods_abstract .goods_sell li .pro_r span{ padding-right:5px;}


    .goods_info01{ margin-top:10px;background:#fff;border-bottom: solid 1px #d8d8d8;border-top: solid 1px #d8d8d8;padding-left:.5rem;overflow:hidden;}
    .goods_info01 ul{ padding-left: 6px;overflow: hidden;}
    .goods_info01 ul li{padding: 12px 0;border-top: solid 1px #d8d8d8; font-size:14px; color:#666; overflow:hidden;}
    .goods_info01 ul li:first-child{  border-top: none;}
    .goods_info01 ul li .key,.goods_info02 ul li .key {width:74px; float:left;}
    .goods_info01 ul li .val span a,.goods_info02 ul li .grade span{ padding:0 3px; color:#E4393C;}

    .goods_info02{ margin-top:10px;background:#fff;border-bottom: solid 1px #d8d8d8;border-top: solid 1px #d8d8d8;padding:0 .5rem;overflow:hidden;}
    .goods_info02 ul{ padding-left: 6px;overflow: hidden;}
    .goods_info02 ul li{padding: 12px 0;font-size:14px; color:#666; overflow:hidden;}
    .goods_info02 ul li .grade {float: left;color: #333;}
    .goods_info02 ul li .total {float: right; padding-right:30px; font-size:13px; color:#999;}
    .goods_info02 ul li .arrow,.goods_info01 ul li .arrow ,.goods_sell li .arrow{
        width: 8px;
        height: 8px;
        overflow: hidden;
        border-right: solid 2px #999;
        border-top: solid 2px #999;
        margin-right: 15px;
        transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        margin-top: 6px;
        position: absolute;
        right: 0;
    }
    .goods_info01 ul li .arrow{ margin-top:-15px; right:8px;}


.order_filter_02 {
    height: 39px;
    background: #fff;
    border-bottom: solid 1px #d8d8d8;
    display: -webkit-box;
    display: -moz-box;
    display: -o-box;
    display: -ms-box; margin-top:10px;
}
.order_filter_02 li {
    width: 25%;
    position: relative;
}


.order_filter_02 li a.selected {
    border-bottom: solid 2px #E4393C;
}
.order_filter_02 li a {
    display: block;
    width: 100%;
    height: 38px;
    line-height: 38px;
    text-align: center;
    font-size: 14px;
    color: #666;
    position: absolute;
}
.order_filter_02 li a em{ color:#E4393C; font-size:13px; padding-left:2px; font-style: normal;}


.lala {
    height: 30px;
    background: #fafafa;
    border: solid 1px #d8d8d8;-webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    display: -webkit-box;
    display: -moz-box;
    display: -o-box;
    display: -ms-box; margin-top:10px;
}
.lala li {
    width: 25%;
    position: relative;
}


.lala li a.selected {

    background: #E4393C; color: #fff;-webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.lala li a {
    display: block;
    width: 100%;
    height: 28px;
    line-height: 28px;
    text-align: center;
    font-size: 14px;
    color: #666;
    position: absolute; background: #fafafa;
}
.lala li a em{ color:#E4393C; font-size:13px; padding-left:2px; font-style: normal;}

.lala li a.selected em{ color: #fff;}






.goods_comment_info{ background: #fff; overflow:hidden;}
.goods_comment02{padding-left: 10px; background: #fff;}
.goods_comment02 dl {padding: 15px 0; border-bottom: solid 1px #d8d8d8;}
.goods_comment02 dl dt{height: 35px;
    line-height: 35px;
    display: -webkit-box;
    display: -moz-box;
    display: -o-box;
    display: -ms-box;
}
.goods_comment02 dl dt, .goods_comment02 dl dd {
    padding-right: 15px;
    border-top: 1px solid #d8d8d8;
}
.goods_comment02 dl dt .avatar {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    margin-top: 5px;
    margin-right: 10px;
}
.goods_comment02 dl dt .avatar img {
    border-radius: 50%;
    width: 100%;
    height: 100%;
}

.goods_comment02 dl dt .phone {
    font-size: 16px;
    color: #333;
}

.goods_comment02 dl dt .time {
    -webkit-box-flex: 1;
    -moz-box-flex: 1;
    -o-box-flex: 1;
    -ms-box-flex: 1;
    text-align: right;
    color: #aaa; font-size:13px;
}

.goods_comment02 dl dd {
    margin-top: 10px;
}
.goods_comment02 dl dd .level {
    height: 9px;
    position: relative;
    padding: 5px 0px;
}
.goods_comment02 dl dd .level .bg {
    width: 200px;
    height: 30px;
    overflow: hidden;
}

.goods_comment02 dl dd .level span {
    display: inline-block;
    vertical-align: top;
    height: 9px;
    background: url(${path}/images/xing.png) left center repeat-x;
    background-size: 13px 9px;
}
.goods_comment02 dl dd p {
    font-size: 12px;
    color: #666;
    margin-top: 10px; margin-bottom: 0!important;
    word-wrap: break-word;
}

.w33{border-top: solid 1px #d8d8d8;}
.w33 li{ width:33.3%;}
.w33 li a{ font-size:15px;}

.goods_info_more{
    width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
}
.goods_info_spjs{ padding: 10px 10px 20px;background: #fff; font-size: 15px;}
.goods_info_spjs img{width: 100%; height: auto;}

.mask{
    position:absolute;
    left:0;
    top:0;
    z-index:100;
    height:100%;
    width:100%;
    background:black;
    opacity:0.4;
    filter:alpha(opacity=40)
}


/* 选择商品 */
.choose-goods{width: auto height: auto; float: left;}
.choose-goods .dd{border: 2px solid #cccccc; margin-top: 3px; margin-bottom: 3px; padding-left: 5px; padding-right:5px; height: 30px; line-height: 30px; margin-right: 5px;float: left;width: auto}
.choose-goods .selected {
    position: relative;
    border: 2px solid #DB0000;
}
.choose-goods .selected b{
    position: absolute;
    bottom: -2px;
    right: -2px;
    width: 12px;
    height: 12px;
    overflow: hidden;
    background:url(${base}/static/img/newicon20140910.png) no-repeat scroll -202px -224px;
}
.Ptable {
    margin: 10px 0;
    line-height: 30px;
    margin-top: 10px !important;

}
.Ptable .tdTitle {
    text-align: left;
    width: 110px;
    background: #F5FAFE;
}

.layermcont {
    text-align:left;
}

/*zyf 3-17*/
.sp_left{ width:44%; padding-right:3px; float: left;-webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box;}
.sp_left a {color: #d4d4d4;font-size: 10px; width: 30%; text-align: center;}
.sp_left a.w36{width: 40%;}
.z_gz{display: inline-block;width: 40px;text-align: center;}
.w50{ width: 50px;}
.sp_icon{  display: inline-block;width: 21px;height: 19px; padding-bottom: 2px;}
.gz_icon{background: url(${base}/static/app/gwq/images/z_icon.png) no-repeat;background-size: 100px 100px; background-position: 0 0;}
.gz_icon_on{background: url(${base}/static/app/gwq/images/z_icon.png) no-repeat;background-size: 100px 100px; background-position: 0 -25px;}
.car_icon{background: url(${base}/static/app/gwq/images/z_icon.png) no-repeat;background-size: 100px 100px; background-position: 0 -50px; width: 25px;}
.user_icon{background: url(${base}/static/app/gwq/images/z_icon.png) no-repeat;background-size: 100px 100px; background-position: 0 -75px;}

.sp_left a span{display: block;  line-height: 13px;  height: 18px;text-align: center;color: #777;font-size: 10px;}
.focus_icon{text-align: center; margin-bottom: -18px;}


.sp_left a,.sp_right a{display: inline-block;height: 50px;line-height: 50px;float: left;}
.sp_right{ width:56%; float: left;}
.sp_right a{ width: 50%; background-color: #E4393C; font-size: 14px; color: #fff; text-align:center;}
.sp_right a:hover{color: #fff;}
.sp_right a.hs{background-color: #ffb03f;}

.mui-btn:hover{border: none;}

</style>

</head>
	<!--页眉-->
<body style="padding-bottom:55px;">
    <header class="mui-bar mui-bar-nav bg_color_${catelogGrandfatherId}">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <div class="mui-center mui-title ">
                秒杀商品详情
            </div>
            <a  href="${base}/app_index" class="mui-right mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:10px;">
                首页
            </a>
        </header>
    <#if !goods??>
        <div id="refresh">
            不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
        </div>
    <#else>
        <!--商品图片-->
        <div id="slider" class="mui-slider" style="font-size:12px; color:#666; margin-top:45px;">
            <div class="mui-slider-group <#--mui-slider-loop-->">
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                   <#-- <#assign lastImg = goodsImagesList?sort_by("orderNo")?last>
                    <div class="mui-slider-item mui-slider-item-duplicate">
                        <img name="imgSilder" src="${base}/static/mall/img/error-img.gif" data-original="${lastImg.pic}_455x354.png">
                    </div>-->
                    <#list goodsImagesList?sort_by("orderNo") as img>
                        <div class="mui-slider-item">
                            <img name="imgSilder" name="imgSilder" alt="${img.title}" src="${base}/static/mall/img/error-img.gif" data-original="${img.pic}@400h_400w.png"/>
                        </div>
                    </#list>
                    <#--<#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                    <div  class="mui-slider-item mui-slider-item-duplicate ">
                        <img name="imgSilder" src="${base}/static/mall/img/error-img.gif" data-original="${firstImg.pic}_455x354.png">
                    </div>-->
                <#else>
                    <div class="mui-slider-item">
                        <img src="${base}/static/mall/img/error-img.gif"/>
                    </div>
                </#if>
            </div>
            <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
            <div class="mui-slider-indicator">
            <#list goodsImagesList?sort_by("orderNo") as img>
                <#if img_index == 0>
                    <div class="mui-indicator mui-active"></div>
                <#else>
                    <div class="mui-indicator"></div>
                </#if>
            </#list>
            </div>
            </#if >
        </div>
    </#if><!--商品图片结束-->

<#--新做-->
    <div class="goods_abstract">
        <h2><#if goods.isMarketable == 0><span style="color: red;">[已下架]&nbsp;&nbsp;&nbsp;</span></#if>${goods.fullName}</h2>
        <span style="color: red; font-size: 0.9em;" >${goods.description}</span><br>
        <span style="color: red;" id="systemParamsId"></span>
        <ul class="goods_sell">
           <#-- <#if (goods.description != "" && goods.description != null)>
            <li style="color: #E4393C;">
                ${goods.description}
            </li>
            </#if>-->
            <li>
                <div class="pro_l" >
                    <span style="color: #333;">库存：</span>
                    <span style="color: #333;">${goods.stock}&nbsp;${goods.unit}</span>
                </div>
            </li>
            <li>
                <div class="pro_l">
                <#if isOpen == "start">
                    <strong class="t2">活动价:￥${goods.price?string('##0.00')}</strong>
                    <span class="scj">￥${promotionsGoods.goodsPrice?string('##0.00')}</span>
                <#else>
                    <strong class="t2">￥${goods.price?string('##0.00')}</strong>
                    <span class="scj">￥${goods.marketPrice?string('##0.00')}</span>
                </#if>
                </div>
            </li>
           <#if activityFullCut.mjName!="">
               <li data-align="show" style="position: relative;">
                   <span style="background-color: #ff4401;color: #ffffff">${activityFullCut.mjName}:</span>
                   <div class="val" id="yfsms" style="padding-left:26px;color: red;display: inline">
                       <#list activityFullCutPrice as price>
                           满${price.totalPrice}元减${price.decreaseAmount}元，
                       </#list>
                   </div>
                  <#-- <div class="arrow" id="jts" style="top:0;"></div>-->
               </li>
           </#if>
        </ul>
    </div>
    <div class="goods_info01">
        <ul>
           <#-- <li style="position:relative;">
                <div class="key">选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;择：</div>
                <div class="val">
                    <span class="grade">请选择产品 规格 数量</span>
                </div>
                <div class="arrow"></div>
            </li>-->
           <#-- <li>
                <div class="key">商品说明：</div>
                <div class="val"><#if goods.description == "">该商品无特别说明<#else>${goods.description}</#if></div>
            </li>-->
            <li>
                <div class="key">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</div>
                <div class="val" style="margin-left: 74px;">由
                <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 Start --><#--${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}?whichclient=whichapp'>${shop.name}</a>","本商城")}-->
                    西安港进出口商品交易中心
                    <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 End -->
                    发货并提供售后服务。
                </div>
            </li>
           <li>
               <div class="key">送达时间：</div>
               <div class="val">${goods.predictDay}</div>
           </li>
           <li onclick="showTab(this)" data-align="show">
                <div class="key">运费说明：</div>
               <div class="arrow" id="jt" style="margin-top: 7px;"></div>
                <div class="val" id="yfsm" style="padding-right: 12px;display: none;width: 95%">
                    <img style="width: 100%;margin-top: 12px;" src="${base}/static/app/gwq/images/wlsm.png">
                    <span>注：默认发送<font color="#87c326">中通快递</font>（如：商品总量<font color="#87c326">10kg</font> 送达<font color="#87c326">西安</font>总计运费:<font color="#87c326">5元(首重)+9元(续重)=14元</font>）</span>
                </div>
            </li>
            <li>
                <div class="key">同类商品：</div>
                <div class="val">
                    <div class="choose-goods">
                    <#list goodsProductList as gsP>
                        <#if goods.id == gsP.id>
                            <div class="dd selected ">
                                <b></b><a title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                            </div>
                        <#else>
                            <div class="dd">
                                <b></b><a href="${base}/item/whichapp/${gsP.id}.html" title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                            </div>
                        </#if>
                    </#list>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <div class="goods_info02">
        <ul>
            <li style="position:relative;" onclick="setTab('tab3')">
                <div class="key">商品评论：</div>
                <div class="val">
                    <span class="grade">好评度<span id="haopinglv"></span></span>
                    <span class="total">共<span id="haopingcount"></span>个评价</span>
                </div>
                <div class="arrow"></div>
            </li>
        </ul>
    </div>

    <#--商品介绍-->
    <div class="goods_info_con" id="tabsbox">
        <ul class="order_filter_02 w33" id="setTab">
            <li style="width: 25%"><a href="javascript:;" onclick="setTab('tab0')" id="title_tab0" class="selected" >商品介绍</a></li>
            <li style="width: 25%"><a href="javascript:;" onclick="setTab('tab1')" id="title_tab1">商品参数</a></li>
            <li style="width: 25%"><a href="javascript:;" onclick="setTab('tab2')" id="title_tab2">相关证书</a></li>
            <li style="width: 25%"><a href="javascript:;" onclick="setTab('tab3')" id="title_tab3">商品评价</a></li>

        </ul>
        <div class="goods_info_more" >
            <div class="goods_info_spjs"  id="tab0" >
                <#--商品介绍内容-->
                    <div class="mc " data-widget="tab-content" id="p-detail" style="">
                        <ul class="detail-list">
                            <li title="${goods.name}">商品名称：${goods.name}</li>
                            <#--<li>商品编号：${goods.sn}</li>-->
                        <#list brandMap["${goods.brandId}"] as brandName>
                            <li>品牌：${brandName}</li>
                        </#list>
                            <li>上架时间：${goods.createDate?datetime}</li>
                        <#list goodsParamList as pm>
                            <#assign c = pm["content"]/>
                            <#assign parameterId = pm["parameterId"]/>
                            <#if c != "">
                                <#list parameterMap?values as vals>
                                    <#list vals as val>
                                        <#if val.id = parameterId>
                                            <li>${val.name}：${c}</li>
                                        </#if>
                                    </#list>
                                </#list>
                            </#if>
                        </#list>
                        </ul>
                        <div class="detail-correction ac"></div>
                        <div class="detail-content" id="item1mobile" style="overflow: hidden">
                            <#if isEnable='NO'>
                                ${goods.introduction}
                            <#else>
                            ${goods.phoneIntroduction}
                            </#if>
                        </div>
                    </div>
            </div>
            <div class="goods_info_spjs"  id="tab1" style="display: none">
                <!-- 属性参数 -->
                <div class="detail-correction ac" style="border: 1px solid #ddd; border-top: none;"></div>
                <table cellpadding="0" cellspacing="1" width="100%" border="1" class="Ptable" style="margin-top: 0px">
                    <tbody id="params">
                    <#--
                    <#list parameterMap?keys as key>
                        <#assign params=parameterMap[key] />
                        <#assign flag=false />
                        <#list params as p>
                            <#list goodsParamList as gpm>
                                <#if gpm.parameterId == p.id && gpm.content != "">
                                    <#assign flag=true>
                                    <#break>
                                </#if>
                            </#list>
                        </#list>
                        <#if flag>
                        <tr>
                            <th class="tdTitle" colspan="2"><b>${key}</b></th>
                        </tr>
                            <#list params as p>
                                <#list goodsParamList as gpm>
                                    <#if gpm.parameterId == p.id && gpm.content != "">
                                    <tr>
                                        <td class="tdTitle">${p.name}</td>
                                        <td id="${p.id}_${p.name}">${gpm.content}</td>
                                    </tr>
                                    </#if>
                                </#list>
                            </#list>
                        </#if>
                    </#list>
                    -->
                    </tbody>
                </table>
            </div>
            <div class="goods_info_spjs"  id="tab2" style="display: none">
                <!-- 相关证书 -->
                 ${goods.shippingOrderUrl}
            </div>
            <div class="goods_info_spjs"  id="tab3" style="display: none">
                <!-- 评价 -->
                <div class="viewport" style="min-height: 490px; padding: 0 0px;">
                    <ul class="order_filter_02 lala" id="order_filter_02">
                        <li><a href="javascript:void(0);" class="selected" onclick="setTabH('comments-all')" id="title_comments-all">全部评论(<em id="totalReview"></em>)</a></li>
                        <li><a href="javascript:void(0);" onclick="setTabH('comments-haoping')" id="title_comments-haoping">好评(<em id="haopingCnt"></em>)</a></li>
                        <li><a href="javascript:void(0);" onclick="setTabH('comments-zhongping')" id="title_comments-zhongping">中评(<em id="zhongpingCnt"></em>)</a></li>
                        <li><a href="javascript:void(0);" onclick="setTabH('comments-chaping')" id="title_comments-chaping">差评(<em id="chapingCnt"></em>)</a></li>
                    </ul>
                    <div class="goods_comment_info">
                        <div class="goods_comment02" id="comments-all"></div>
                        <div class="goods_comment02" id="comments-haoping" style="display: none"></div>
                        <div class="goods_comment02" id="comments-zhongping" style="display: none"></div>
                        <div class="goods_comment02" id="comments-chaping" style="display: none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<#--点击商品评论链接到查看评论页面的评论-->

    <input type="hidden" value="${parameterMap?size}" id="parameterMapSize"/>
    <div id="item2mobile" class="mui-control-content"  style="background:#FFF">
        <div class="mc" data-widget="tab-content" id="p-detail" style="width:100%;">
            <div class="myorder">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <#list parameterMap?keys as key>
                        <#assign params=parameterMap[key] />
                        <#assign flag=false />
                        <#list params as p>
                            <#list goodsParamList as gpm>
                                <#if gpm.parameterId == p.id && gpm.content != "">
                                    <#assign flag=true>
                                    <#break>
                                </#if>
                            </#list>
                        </#list>

                        <#if flag>

                        <tr>
                            <td class="tdTitle" colspan="2"><b>${key?substring(key?index_of("_")+1)}</b></td>
                        </tr>
                            <#list params as p>
                                <#list goodsParamList as gpm>
                                    <#if gpm.parameterId == p.id && gpm.content != "">
                                    <tr>
                                        <td class="tdTitle">${p.name}</td>
                                        <td id="${p.id}_${p.name}">${gpm.content}</td>
                                    </tr>
                                    </#if>
                                </#list>
                            </#list>
                        </#if>
                    </#list>
                    </tbody>
                </table>
            </div>
            <div class="detail-correction ac"></div>
        </div>
    </div>

    <nav class="mui-bar mui-bar-tab">
    <#--
        <table border="0" width="100%">
               <tr>
                   <td valign="top" align="center">
                       <div class="mui-numbox" style="width: 44px;height: 30px; margin-top: 9px;">
                           <button class="mui-numbox-btn-minus" type="button" onClick="clickNum()">-</button>
                           <input class="mui-numbox-input" type="number"  id="num" onchange="if(this.value>1000){this.value=1000;}else if(this.value<1){this.value=1;}"  onBlur="checkNum2()" value="1"/>
                           <button class="mui-numbox-btn-plus" type="button">+</button>
                       </div>
                   </td>
                   <td>
                       <button class="mui-btn mui-btn-primary mui-pull-right" style="margin-right:-30px; display: none;" >
                           <a href="app/nsc/shopping_cart.html">去结算</a>
                       </button>
                   </td>
                -->
                <#--<td>
                    <#if goods.stock == 0>
                        <button  class="mui-btn mui-btn-primary mui-pull-right mui-gwc" disabled="true">
                            <a  href="javascript:void(0);">暂时无货</a>
                        </button>
                    <#else>
                        <button  class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onclick="openSpPanel()" >
                            <a  href="javascript:void(0);">加入购物车</a>
                        </button>
                    </#if>
                    <button  class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onclick="addGoodsAttention('${goods.id}');" >
                        <a  href="javascript:void(0);">关注商品</a>
                    </button>
                </td>
            </tr>
        </table>
    -->

        <div class="sp_left">
                <a class="atam" href="javascript:addGoodsAttention('${goods.id}');">
                    <div class="z_gz">
                        <div class="focus_icon"><#--<i class="sp_icon gz_icon_on"></i>--><i class="sp_icon gz_icon"></i></div>
                        <span>关注</span>
                    </div>
                </a>
                <a href="JavaScript:if(isWeiXin()){jumpto(weixinLoginUrl);}else{jumpto(fullpath + '/member/index?whichclient=whichapp') }" class="w36">
                    <div class="z_gz w50">
                        <div class="focus_icon"><i class="sp_icon user_icon"></i></div>
                        <span>个人中心</span>
                    </div>
                </a>
                <a href="javascript:jumpto(fullpath +  '/cart/list?whichclient=whichapp&isLogin=');">
                    <div class="z_gz">
                        <div class="focus_icon"><i class="sp_icon car_icon"></i></div>
                        <span>购物车</span>
                    </div>
                </a>



        </div>
        <div class="sp_right">
            <#if goods.stock gt 0>
                <a href="javascript:;openSpPanel('addCart')" class="hs">加入购物车</a>
                <a href="javascript:openSpPanel('buyNow');">立即购买</a>
            <#else>
                <a href="javascript:;void(0);" disabled="true" style="background-color: #FAFAFA"></a>
                <a href="javascript:;void(0);" disabled="true" style="background-color: #aaa">暂时无货</a>
            </#if>

        </div>

    </nav>
    <nav class="mui-bar mui-bar-tab"style="z-index: 101;display: none;" id="opSpPanel">
        <div style="right: 5px;top: 5px;width: 21px;height:18px;display: block;float: right;" onclick="closeSpPanel()"><img src="${base}/static/img/close.png"></div>
        <div style="padding:10px 10px 0px 10px;">
            <div>
                <h5 style="color: #000000;line-height: 25px;">商品名称：${goods.name}</h5>
                <h5 style="color: #000000;line-height: 25px;display: none;" id="ckSpParent">您选择了：<span id="ckSp"></span></h5>

                <#list spInfoMap["goodsSpList"] as sp>
                    <li id="choose-${sp.id}" style="text-align: left" >
                        <div class="dt" id="${sp.id}_sp" style="font-size: 14px;line-height: 25px;">${sp.name}：</div>
                        <#assign i = 0>
                        <#list spInfoMap["goodsSpItemList"] as item>
                            <#if item.specificationId == sp.id>
                                <#if i == 0>
                                    <input type="hidden" name="goodsSp" id="goodsSp_${sp.id}" value="${item.name}" spname="${sp.name}">
                                </#if>
                                <div style="float: left;background-color: #eceaea;margin-right:5px;font-size: 14px; -moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px;padding: 2px;margin-top: 3px;margin-bottom: 3px;">
                                    <div class="item <#if i == 0>selected</#if>" style="min-width: 35px;text-align: center;">
                                        <#if sp.type == 1>
                                            <a class="spValItem" style="font-size: 12px;" href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">
                                            ${item.name}<img src="${item.pic}" style="margin-top: 1px;padding-left: 1px;padding-right: 3px" width="16" height="16">
                                            </a>
                                        <#else>
                                            <a class="spValItem" href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">${item.name}</a>
                                        </#if>
                                    </div>
                                </div>
                                <#assign i = i+1>
                            </#if>
                        </#list>
                    </li>
                    <div style="clear: both;"></div>
                </#list>

                <div style="width: 100%;float: left;">
                    <div style="float: left;margin-bottom: 10px;margin-top: 16px;margin-right: 10px;">购买数量</div>
                    <div class="mui-numbox" style="width: 44px;height: 30px; margin-top: 10px;float: left;margin-bottom: 10px;">
                        <button class="mui-numbox-btn-minus" type="button" onClick="clickNum()">-</button>
                        <input class="mui-numbox-input" type="number"  id="num" onchange="if(this.value>1000){this.value=1000;}else if(this.value<1){this.value=1;}"  onBlur="checkNum2()" value="1"/>
                        <button class="mui-numbox-btn-plus" type="button">+</button>
                    </div>
                    <div >
                        <input type="hidden" id="whoOpenSpPanel"/>
                        <button id="addCart" class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onclick="addCart('${goods.id}', $('#num').val());" >
                            <a id="addCartA" href="javascript:void(0);">确定</a>
                        </button>
                    </div>
                </div>


            </div>
        </div>
    </nav>
    <div class="mask" style="display: none" id="mask"></div>

</body>
</html>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script type="text/javascript">
    var reviewClicked = false;
    /**
     * 计算并展示评价内容
     */
    function countReviewRate() {
        if (!reviewClicked) {
            $.ajax({
                type: 'post',
                url: '${base}/goods/getGoodsReviewList/${goods.id}.html',
                success: function(data) {
                    var all_comments_list = $("#comments-all");
                    var haoping_comments_list = $("#comments-haoping");
                    var zhongping_comments_list = $("#comments-zhongping");
                    var chaping_comments_list = $("#comments-chaping");
                    var allHtml = "";
                    var haopingHtml = "";
                    var zhongpingHtml = "";
                    var chapingHtml = "";
                    var haopingList = []; var zhongpingList = []; var chapingList = [];
                    $('#totalReview').text(data.length);

                    $.each(data, function(i, review) {
                        huifuHtml = '';
                        if(review.maps != 'undefined' && review.maps != undefined && review.maps != ''){
                            $.each(review.maps, function(i, item) {
                                if(item !="" && item !=undefined){
                                    if( item.whichSys == "EC"){
                                        huifuHtml += '<dd style="margin-left: 20px;"><p style="color:#005ea7;">追加评价：' + item.replyContent + '</p><p style="color:#005ea7;">评价日期：' + item.replyDate + '</p></dd>';
                                    }else{
                                        huifuHtml += '<dd style="margin-left: 20px;"><p style="color:#F66D13;">商城回复：' +item.replyContent+ '</p><p style="color:#F66D13;">回复日期：'+item.replyDate+'</p></dd>';
                                    }

                                }
                            });
                        }


                        var score = parseInt(review.score);
                        if (score > 3) {
                            haopingList.push(review);
                            haopingHtml +=''+
                                            '<dt>'+
                                            '<div class="avatar"><img src="${base}/static/mall/img/header.png"></div>'+
                                            '<div class="phone">' + review.nickName +'</div>'+
                                            '<div class="time">'+review.buyDateStr+'</div>'+
                                            '</dt>'+
                                            '<dd>'+
                                            '<div class="level">'+
                                            '<div class="bg"><span style="zoom:2;width:'+review.score*13+'px"></span></div>'+
                                            '</div>'+
                                            '<p>会员评价：'+ review.content +'</p>'+
                                            '<p>评价时间：'+ review.cdStr +'</p>'+
                                            '</dd>';
                            /*if(review.replyContent !="" && review.replyContent !=undefined){
                                haopingHtml +='<dd style="padding-left: 10px;">'+
                                '<div class="level" style="font-size: 12px;font-weight: 200">回复：'+ review.replyDate+'</div>'+
                                '<p style="font-size: 12px;">'+review.replyContent+'</p>'+
                                '</dd>';
                            }*/
                            haopingHtml +='';
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                haopingHtml +=huifuHtml;
                            }

                        } else if (score > 1 && score < 4) {
                            zhongpingList.push(review);

                            zhongpingHtml +=''+
                            '<dt>'+
                            '<div class="avatar"><img src="${base}/static/mall/img/header.png"></div>'+
                            '<div class="phone">' + review.nickName +'</div>'+
                            '<div class="time">'+review.buyDateStr+'</div>'+
                            '</dt>'+
                            '<dd>'+
                            '<div class="level">'+
                            '<div class="bg"><span style="zoom:2;width:'+review.score*13+'px"></span></div>'+
                            '</div>'+
                            '<p>会员评价：'+ review.content +'</p>'+
                            '<p>评价时间：'+ review.cdStr +'</p>'+
                            '</dd>';
                            /*if(review.replyContent !="" && review.replyContent !=undefined){
                                zhongpingHtml +='<dd style="padding-left: 10px;">'+
                                '<div class="level" style="font-size: 12px;font-weight: 200">回复：'+ review.replyDate+'</div>'+
                                '<p style="font-size: 12px;">'+review.replyContent+'</p>'+
                                '</dd>';
                            }*/
                            zhongpingHtml +='';
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                zhongpingHtml +=huifuHtml;
                            }
                        } else if (score < 2) {
                            chapingList.push(review);
                            chapingHtml +=''+
                            '<dt>'+
                            '<div class="avatar"><img src="${base}/static/mall/img/header.png"></div>'+
                            '<div class="phone">' + review.nickName +'</div>'+
                            '<div class="time">'+review.buyDateStr+'</div>'+
                            '</dt>'+
                            '<dd>'+
                            '<div class="level">'+
                            '<div class="bg"><span style="zoom:2;width:'+review.score*13+'px"></span></div>'+
                            '</div>'+
                            '<p>会员评价：'+ review.content +'</p>'+
                            '<p>评价时间：'+ review.cdStr +'</p>'+
                            '</dd>';
                            /*if(review.replyContent !="" && review.replyContent !=undefined){
                                chapingHtml +='<dd style="padding-left: 10px;">'+
                                '<div class="level" style="font-size: 12px;font-weight: 200">回复：'+ review.replyDate+'</div>'+
                                '<p style="font-size: 12px;">'+review.replyContent+'</p>'+
                                '</dd>';
                            }*/
                            chapingHtml +='';
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                chapingHtml +=huifuHtml;
                            }
                        }

                        allHtml +=''+
                        '<dt>'+
                        '<div class="avatar"><img src="${base}/static/mall/img/header.png"></div>'+
                        '<div class="phone">' + review.nickName +'</div>'+
                        '<div class="time">'+review.buyDateStr+'</div>'+
                        '</dt>'+
                        '<dd>'+
                        '<div class="level">'+
                        '<div class="bg"><span style="zoom:2;width:'+review.score*13+'px"></span></div>'+
                        '</div>'+
                        '<p>会员评价：'+ review.content +'</p>'+
                        '<p>评价时间：'+ review.cdStr +'</p>'+
                        '</dd>';
                        /*if(review.replyContent !="" && review.replyContent !=undefined){
                            allHtml +='<dd style="padding-left: 10px;">'+
                            '<div class="level" style="font-size: 12px;font-weight: 200">回复：'+ review.replyDate+'</div>'+
                            '<p style="font-size: 12px;">'+review.replyContent+'</p>'+
                            '</dd>';
                        }*/
                        allHtml +='';
                        if(huifuHtml !="" && huifuHtml !=undefined){
                            allHtml +=huifuHtml;
                        }

                    });
                    $('#haopingCnt').text(haopingList.length);
                    $('#zhongpingCnt').text(zhongpingList.length);
                    $('#chapingCnt').text(chapingList.length);
                    $("<dl>"+allHtml+"</dl>").appendTo(all_comments_list);
                    $("<dl>"+haopingHtml+"</dl>").appendTo(haoping_comments_list);
                    $("<dl>"+zhongpingHtml+"</dl>").appendTo(zhongping_comments_list);
                    $("<dl>"+chapingHtml+"</dl>").appendTo(chaping_comments_list);
                }
            });

            reviewClicked = true;
            $('#comments-all').removeClass('hide');
        }
    }

    function initReviewCount() {
        var reviewList = [];
        var haopingList = [];
        var zhongpingList = [];
        var chapingList = [];
    <#list goodsReviewList as review>
        var pingjia = {
            score: '${review.score}'
        };
        <#if review.score &lt; 2>
            chapingList.push(pingjia);
        <#elseif review.score &gt; 1 && review.score &lt; 4>
            zhongpingList.push(pingjia);
        <#elseif review.score &gt; 3>
            haopingList.push(pingjia);
        </#if>
        reviewList.push(pingjia);
    </#list>
        var haopinglv = haopingList.length / reviewList.length;
        var zhongpinglv = zhongpingList.length / reviewList.length;
        var chapinglv = chapingList.length / reviewList.length;

        //好评度
        $("#haopinglv").html(haopinglv.toPercent() + "<span>%</span>")
        //好评
        $("#haopingcount").html(haopingList.length+zhongpingList.length+chapingList.length)
    }

    /**
     * 数字百分比格式化
     * @param n 保留几位小数
     * @returns {string}
     */
    Number.prototype.toPercent = function (n) {
        n = n || 0;
        var result = (Math.round(this * Math.pow(10, n + 2)) / Math.pow(10, n) ).toFixed(n);
        return !isNaN(result) ? result : 0;
    }


    function setTab(id){
       $("#setTab").find("a").removeClass("selected");
       $("#title_"+id).addClass("selected")
       $(".goods_info_spjs").hide();
       $("#"+id).show();
       if(id=='tab3'){
           var url=window.location.href.split(".html")[0]+".html#tabsbox";
           window.location.href=url;
       }
   }
if(window.location.href.split(".html").length>1){
    initReviewCount();
    countReviewRate();
}
    function setTabH(id){
        $(".order_filter_02").find("a").removeClass("selected");
        $("#title_"+id).addClass("selected")
        $(".goods_comment02").hide();
        $("#"+id).show();
    }
    /**
     * 打开选择规格面板
     */
    function openSpPanel(type){
        $("#whoOpenSpPanel").val(type);
        $("#opSpPanel").slideToggle("fast");
        if($(".spValItem") && $(".spValItem").length>0){
            $("#ckSpParent").show();
        }
        $("#mask").show();
    }
    $(window).scroll(function(){
        $("#mask").css("height",$(document.body).height());
    })
    /**
     * 关闭选择规格面板
     */
    function closeSpPanel(){
        $("#mask").hide();
        $("#opSpPanel").slideToggle("fast");
    }
    /**
     * 选择规格
     */
    function chekedSp(spId,itemId,itemName){
        $('#' +spId).val(itemName);
        $('#' +itemId).parent().addClass('selected');
        selectedSp();
    }
    function selectedSp(){
        var selectedText = "“";
        if($('input[name="goodsSp"]').length > 0){
            var i = 0;
            $('input[name="goodsSp"]').each(function(){
                if($(this).val() != ''){
                    if(i > 0){
                        selectedText += ","
                    }
                    selectedText += $(this).val();
                    i++;
                }
            });
        }
        selectedText += "”";
        if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
            $('#ckSp').html(selectedText);
        } else {
            $('#ckSp').html("");
        }
    }

    var msgcc="";
    function addCart(goodsId, cnt) {
        if($(".spValItem") && $(".spValItem").length>0){
           if($("#ckSp").html()==''){
               popAlert("请选择商品规格")
               return false;
            }
       }
        var sp = '';
        var sp = '';
        var flag = true;
        if($('input[name="goodsSp"]').length > 0){
            $('input[name="goodsSp"]').each(function(){
                if($(this).val() == ''){
                    flag =false;
                    popAlert('请选择['+$(this).attr("spname")+']');
                    return false;
                }else{
                    sp += $(this).attr("spname")+':'+$(this).val() + ',';
                }
            });
        }
        if(sp != ''){
            sp = sp.substring(0,sp.length-1);
        }


        $.ajax({//判断会员是否登录
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    //如果登录了
                    //获取是否为跨境商品
                    $.ajax({
                        type: 'post',
                        async: false,
                        url: '${base}/goods/ajaxIsCrossBorderGoods',
                        data:{shopId:'${goods.shopId}',catelogId:'${goods.categoryId}'},
                        //data:{shopId:'1511161631465891861',catelogId:'1601061057317951071'},//测试跨境商品
                        success: function(data) {
                            if( data.status == 'success' ){
                                //是跨境商品
                                //获取跨境商品提示信息
                                $.ajax({
                                    type: 'post',
                                    async: false,
                                    url: '${base}/goods/ajaxGetSystemCrossMsg',
                                    success: function(data) {
                                        if( data.status == 'success' ){
                                            message = data.msg;
                                            //只要是跨境商品就提示信息
                                            var layer_confrim = layer.open({
                                                title:'提示信息',
                                                content:message,
                                                btn: ['确认'],
                                                shadeClose: false,
                                                yes: function(){
                                                    //给出跨境商品判断是否设置了身份证
                                                    $.ajax({
                                                        type: 'post',
                                                        async: false,
                                                        url: '${base}/member/getMemberIDcode',
                                                        success: function(data) {
                                                            if( data.status == 'success' ){
                                                                //如果设置了直接加入购物车
//                                                                var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
//                                                                jumpto(path);
                                                                addCartOrBuyNow(goodsId, cnt, sp);
                                                            }else if(data.status == 'error'){
                                                                //没有设置的话打开框设置身份证
                                                                var layer_confrim = layer.open({
                                                                    title:'请输入身份证号码',
                                                                    content:'<input type="text" id="IDcode" value=""/><span id="msgcc">身份证号不能为空!</span>',
                                                                    btn: ['确认'],
                                                                    shadeClose: false,
                                                                    yes: function(){
                                                                        //获取输入的身份证并且验证
                                                                        var idcode=$("#IDcode").val();
                                                                        if(checkIdcode(idcode)){
                                                                            //保存身份证号码
                                                                            $.ajax({
                                                                                type: "post",
                                                                                async: false,
                                                                                url: "${base}/member/username/check",
                                                                                data:{'userName':idcode,'property':'iDCode'},
                                                                                datatype: 'json',
                                                                                error: function () {

                                                                                },
                                                                                success: function(result) {
                                                                                    if(result){
                                                                                        $.ajax({
                                                                                            type: "post",
                                                                                            async: false,
                                                                                            url: "${base}/member/saveMemberIDcode",
                                                                                            data:{'idcode':idcode},
                                                                                            datatype: 'json',
                                                                                            error: function () {

                                                                                            },
                                                                                            success: function(result) {
                                                                                                if(result.status == 'success'){
                                                                                                    layer.closeAll();
//                                                                                                    var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
//                                                                                                    jumpto(path);
                                                                                                    addCartOrBuyNow(goodsId, cnt, sp);
                                                                                                }else{
                                                                                                    $("#msgcc").html('设置失败!');
                                                                                                }
                                                                                            }
                                                                                        });
                                                                                    }else{
                                                                                        $("#msgcc").html('身份证号已存在,请重新输入!');
                                                                                    }
                                                                                }
                                                                            });

                                                                        }else{
                                                                            $("#msgcc").html(msgcc);
                                                                        }
                                                                    }
                                                                });


                                                            }else{
                                                                jumpto('${base}/member/login?whichclient=whichapp');
                                                            }
                                                        }
                                                    });
                                                }
                                            });

                                        }else{
                                        }
                                    }
                                });
                            }else{
                                //不是跨境商品
                                //如果设置了直接加入购物车
//                                var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
//                                jumpto(path);

                                addCartOrBuyNow(goodsId, cnt, sp);
                            }
                        }
                    });

                }else{
                    //没有登录跳到登录页面
                    if(isWeiXin()) {
                        jumpto(weixinLoginUrl);
                    }else{
                        jumpto(fullpath + "/member/login?whichclient=whichapp");
                    }
                }
            }
        });
    }

    function addCartOrBuyNow(goodsId, cnt, sp){
        var type = $("#whoOpenSpPanel").val();
        if(type == 'addCart'){
            $.ajax({
                type: "post",
                async: false,
                url: "${base}/cart/ajax/add",
                data:{'gid':goodsId, 'cnt':cnt, 'sp':sp},
                datatype: 'json',
                error: function () {
                    popAlert('加入购物车失败，请稍后再试!');
                },
                success: function(result) {
                    if(result.status == 'success'){
                        closeSpPanel();
                        popAlert('加入购物车成功!');
                    }else{
                        popAlert(result.message);
                    }
                }
            });
        }else if(type == 'buyNow'){
            var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
            jumpto(path);
        }
    }
    function checkIdcode(idcode){
        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
            msgcc='身份证号不能为空!';
            return false;
        }

        if(idcode.length > 18 || idcode.length < 15){
            msgcc='身份证号长度范围15~18位!';
            return false;
        }

        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {
            msgcc='身份证号格式错误!';
            return false;
        }
        return true;
    }

    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        var oldback = mui.back;
        mui.back = function(){
            var cuxiao = '${cuxiao}';
            if( cuxiao == 'true'){
                jumpto(fullpath + '/huodong/${promotionsId}?whichclient=whichapp');
            } else{
                oldback();
            }
        };
        mui.ready(function () {
            //异步获取参数
            jQuery.ajax({
                type: 'post',
                url: '${base}/goods/getParamNoGroup',
                data:{goodsId:'${goods.id}'},
                success: function(data) {
                    if( data.status == 'success' ){
                        //params
                        var html = '';
                        jQuery.each(data.params,function(i,d){
                            html += '<tr><td class="tdTitle">'+ d.name+'</td>';
                            html += '<td id="'+ d.parameterId+'_'+d.name+'" style="text-align:left;">'+ d.content+'</td>';
                            html += '</tr>';
                        });
                        jQuery("#params").html(html);
                    }else{

                    }
                }
            });
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
        jQuery("img[name='imgSilder']").lazyload({
            effect: "fadeIn"
        });
        jQuery("#item1mobile img").lazyload({
            threshold : 20,
            effect: "fadeIn"
        });
        getGoodsSystemParameters('${goods.id}');
        addToHistory('${goods.id}');
        ck_gz('${goods.id}');
    }(mui, document));
    /**
     * 是否关注
     * */
    function ck_gz(goodsId){
        $.ajax({
            type: "get",
            url: "${base}/goods/isGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='warn'){
                    $(".atam").attr("href","javascript:void(0)")
                    $(".atam").find("i").addClass("gz_icon_on");
                }
            }
        });
    }


        //整数正则
    var regexEnum =/^-?[0-9]{1,}$/;
        //验证内容是不是整数
    function checkNum(num) {
        return regexEnum.test(num);
    }
        //点击加减号
    function clickNum() {
        var btn = jQuery("#num");
        jQuery(btn).disabled = true;
        if (checkNum(btn.value)) {
            if (parseInt(btn.value) <= 1) {
                btn.value = 1;
            }
        } else {
            btn.value = 1;
        }
        jQuery(btn).disabled = false;
    }
    //手动输入数量校验
    function checkNum2() {
        if (!checkNum(document.getElementById("num").value)) {
            document.getElementById("num").value = 1;
        } else {
            if (parseInt(document.getElementById("num").value) < 1) {
                document.getElementById("num").value = 1;
            }
        }
    }

    /**
     * Desc:获取此商品的系统参数(国家;产地;保质期)
     * Auth:liuxiaobing
     * Time:2015-12-4 10:31:35
     */
    function getGoodsSystemParameters(goodsId){
        $.ajax({
            type: "post",
            url: "${base}/goods/ajaxGetGoodsSystemParameters",
            data:{'goodsId':goodsId},
            datatype: 'json',
            error: function () {
            },
            success: function(result) {
                if(result.status=='success'){
                    $("#systemParamsId").html(result.sysParms.replace(/&nbsp;/ig,' ').trim());
                }else{
                }
            }
        });
    }

    /**
     * Desc:关注商品
     * Auth:liuxiaobing
     * Time:2015-12-7 10:50:35
     */
    function addGoodsAttention(goodsId) {
        showWaiting();
        jQuery.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    popAlert('已成功关注该商品!');
                    $(".atam").attr("href","javascript:void(0)")
                    $(".atam").find("i").addClass("gz_icon_on");
                }else if(data.status=='warn'){
                    popAlert(data.message);
                }else if(data.status=='NOLOGIN'){
                    popAlert('登录后才可关注商品');
                }else{
                    popAlert(data.message);
                }
                closeWaiting();
            },
            error:function(data){
                closeWaiting();
                popAlert(data.message);
            }
        });
    }
    function addToHistory(goodsId){
        jQuery.ajax({
            type: "post",
            url: "${base}/goods/ajaxaddToHistory",
            data: "goodsId="+goodsId,
            success: function(data) {

            },
            error:function(data){
            }
        });
    }
    /**
     * 运费说明
     * @param obj
     */
    function showTab(obj){
        if($(obj).attr("data-align")=='show'){
            $(obj).attr("data-align",'none')
            $("#yfsm").slideDown();
            $("#jt").css("-moz-transform","rotate(135deg)");
            $("#jt").css("-webkit-transform","rotate(135deg)");
        }else{
            $(obj).attr("data-align",'show')
            $("#yfsm").slideUp();
            $("#jt").css("-webkit-transform","rotate(40deg)");
            $("#jt").css("-moz-transform","rotate(40deg)");
        }
    }

    /**
     * 促销说明
     * @param obj
     */
   /* function showcx(obj){
        if($(obj).attr("data-align")=='show'){
            $(obj).attr("data-align",'none')
            $(obj).animate({"padding-bottom":"42px"});
            $("#yfsms").animate({height:"63px"});
            $("#jts").css("-moz-transform","rotate(135deg)");
            $("#jts").css("-webkit-transform","rotate(135deg)");
        }else{
            $(obj).attr("data-align",'show')
            $(obj).animate({"padding-bottom":"0px"});
            $("#yfsms").animate({height:"21px"});
            $("#jts").css("-webkit-transform","rotate(40deg)");
            $("#jts").css("-moz-transform","rotate(40deg)");
        }
    }*/
</script>