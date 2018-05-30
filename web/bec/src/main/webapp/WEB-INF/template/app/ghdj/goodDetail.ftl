<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">

    <head>
    <#include "app/ghdj/head.ftl">
      <#--script type="javascript" src="/ec/static/app/ghdj/js/jquery.idTabs.min.js"></script-->

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
    .goods_info02 ul li .arrow,.goods_info01 ul li .arrow {
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
}


.goods_comment02 dl dt .avatar {
    width: 35px;
    height: 35px;
    border-radius: 50%;
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
}
.goods_comment02 dl dd .level .bg {
    width: 62px;
    height: 9px;
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
    font-size: 14px;
    color: #666;
    margin-top: 10px; margin-bottom: 0!important;
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
    background:url(/bec/static/img/newicon20140910.png) no-repeat scroll -202px -224px;
}


/*top*/
header{
    position: fixed;
    top: 0px;
    right: 0;
    left: 0;
    background:#e12f45;
    padding:8px 0;
    font-size:18px;
    height:30px;
    line-height:30px;
   /* box-shadow: 0px 3px 6px #999;*/
    z-index:10;text-align:center;}
.logo{ position:absolute;left:10px;float:left;}
.logo a{ color:#fff;}
.logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
.user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
.user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghdj/images/user.png) no-repeat; background-size: 20px
20px;}

.mtit{color:#fff;}

/*新加样式  12-31*/
.logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
21px;margin-top:5px;}
/*帮商乐*/
.shop-ghs {
    border: 1px solid #ffaa00;
    padding-top: 3px;
    padding-bottom: 3px;
    padding-right: 5px;
    background: #fef7db url("${base}/static/bec/project/ghdj/img/ghs_icon.png") no-repeat 2px center;
    padding-left: 23px;
}
</style>

</head>
	<!--页眉-->
<body style="padding-bottom:55px;">
<#--
    <header class="mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <div class="mui-center mui-title ">
                商品详情
            </div>
        </header>
-->

    <header>
        <div class="logo"><a href="javascript:window.history.back(-1);" class="ltext">返回</a></div>
        <div class="mtit">商品详情</div>
        <div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>

    </header>


    <#if !goods??>
        <div id="refresh">
            不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
        </div>
    <#else>
        <!--商品图片-->
        <div id="slider" class="mui-slider" style="font-size:12px; color:#666; margin-top:48px;">
            <div class="mui-slider-group <#--mui-slider-loop-->">
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                   <#-- <#assign lastImg = goodsImagesList?sort_by("orderNo")?last>
                    <div class="mui-slider-item mui-slider-item-duplicate">
                        <img name="imgSilder" src="${base}/static/mall/img/error-img.gif" data-original="${lastImg.pic}@455w_354h.png">
                    </div>-->
                    <#list goodsImagesList?sort_by("orderNo") as img>
                        <div class="mui-slider-item">
                            <img name="imgSilder" name="imgSilder" alt="${img.title}" src="${base}/static/mall/img/error-img.gif" data-original="${img.pic}@455w_354h.png"/>
                        </div>
                    </#list>
                    <#--<#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                    <div  class="mui-slider-item mui-slider-item-duplicate ">
                        <img name="imgSilder" src="${base}/static/mall/img/error-img.gif" data-original="${firstImg.pic}@455w_354h.png">
                    </div>-->
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

    <#--<ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <span>商城价：</span>
            <span style="color:#F00">${goods.price?string(priceCurrencyFormat)}</span>&nbsp;&nbsp;
            <#if (goods.marketPrice)?exists>
            <span>市场价：</span>
            <span>${goods.marketPrice?string(priceCurrencyFormat)}</span>
            </#if>
        </li>
        <li class="mui-table-view-cell">
            <span style=" font-size:14px; font-family:'微软雅黑'">${goods.fullName}</span>
        </li>
        <li class="mui-table-view-cell">
            <span><#if goods.description == "">该商品无特别说明<#else>${goods.description}</#if></span>
        </li>
        <li class="mui-table-view-cell">
            <table border="0" width="100%">
                <tr>
                    <td width="24%">销售区域：</td>
                    <td>陕西省  运费：0元</td>
                </tr>
                <tr>
                    <td>累计售出：</td>
                    <td>${fixed}件</td>
                </tr>
                <tr>
                    <td>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存：</td>
                    <td>${fixed}件</td>
                </tr>
                <tr>
                    <td>起订数量：</td>
                    <td>最低起订1件</td>
                </tr>
                <tr>
                    <td valign="top">温馨提示：</td>

                    <td>由 ${(shop.name?exists)?string("<span class='mui-shopname'>${shop.name}</span>","本商城")} 发货并提供售后服务。</td>
                </tr>
            </table>
        </li>
    </ul>-->


<#--新做-->
    <div class="goods_abstract">
        <h2><#if goods.isMarketable == 0><span style="color: red;">[已下架]&nbsp;&nbsp;&nbsp;</span></#if>${goods.fullName}</h2>
        <span style="color: red; font-size: 0.9em;" >${goods.description}</span><br>
        <span style="color: red;" id="systemParamsId"></span>
        <ul class="goods_sell">
            <li>
                <div class="pro_l">
                    <strong class="nologin">仅会员可见！</strong>
                    <span class="login" style="display: none">
			<!--
                        <strong class="t2">${goods.price?string(priceCurrencyFormat)}</strong>
                        <span class="scj">${goods.marketPrice?string(priceCurrencyFormat)}</span>-->
			<p style="font-size: 14px;margin-left: -5px;color: black;margin-top: -45px;">
			    <span style="font-size: 14px;color: black;">商城价：</span>
			    <span style="font-size: 14px;color: black;">
                               <#if goods.enableBatchPrice == '1'>
				  ￥${goods.batchPrice}
                               <#else>
				  ${goods.price?string("currency")}
                               </#if>
                            </span><br/>
			    <span style="font-size: 14px;color: black;">会员价：</span>
			    <span class="red login_price" style="font-size: 14px;color: black;">￥${(goods.price * (1-goods.defaultPrice/100))?string(',##0.00')}</span>
			</p>
                    </span>
                    <div class="key" style="margin-top: -25px;color:black; ">商品条码：${goods.barcode}</div>
                </div>
            </li>
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
            <li>
                <div class="key">商品说明：</div>
                <div class="val"><#if goods.description == "">该商品无特别说明<#else>${goods.description}</#if></div>
            </li>
            <li>
                <div class="key">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</div>
                <div class="val">由
                <#if shop.name??> <a class="ls shop-ghs">帮商乐</a><#else ><em style="float: none;">本商城</em></#if>
                <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 Start -->
                <#--${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}?whichclient=whichapp'>${shop.name}</a>","本商城")}-->
                    <#--西安港进出口商品交易中心-->
                    <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 End -->
                    发货并提供售后服务
                <#if shop.deliveryDay??>${shop.deliveryDay}</#if>
                <#if goods.predictDay??>，预计送达时间：${goods.predictDay}。</#if>
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
                            <li>商品编号：${goods.sn}</li>
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
        <table border="0" width="100%">
            <tr>
<#--                <td valign="top" align="center">
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
                </td>-->
                <td>
                    <button  class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onclick="openSpPanel()" >
                        <a  href="javascript:void(0);">加入购物车</a>
                    </button>
                    <button  class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onclick="addGoodsAttention('${goods.id}');" >
                        <a  href="javascript:void(0);">关注商品</a>
                    </button>
                </td>
            </tr>
        </table>
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
                    <div style="float: left;margin-bottom: 10px;margin-top: 16px;font-size: 14px;margin-right:10px;">购买数量</div>
                    <div class="mui-numbox" style="width: 44px;height: 30px; margin-top: 10px;float: left;margin-bottom: 10px;">
                        <button class="mui-numbox-btn-minus" type="button" type="button" onclick="add_subtract(this)" op="-" step="${goods.packageModulus}" ng-gis="${goods.startNum}">-</button>
                        <input class="mui-numbox-input" type="number" type="input" min="${1+goods.packageModulus}" max="1000"  id="num" name="num"  onBlur="checkNum2()"   packgeModulus="${goods.packageModulus}" value="${goods.startNum}" />
                        <button class="mui-numbox-btn-plus" type="button" onclick="add_subtract(this)" op="+" step="${goods.packageModulus}">+</button>
                    </div>
                    <div style="float: left;margin-bottom: 10px;margin-top: 16px;color:red;font-size: 12px;">共<span id="goodsNum">1</span>件</div>
		            <div >
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
    function openSpPanel(){
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
        //var waiting = plus.nativeUI.showWaiting( "加载中..." );
        showWaiting();
        setTimeout(function(){}, 100); // 延时100ms防止click事件传递到Ajax中刚生成的对象
        $("#addCart").attr("onclick","");
        $("#addCartA").html("提交中...");
        // "&backurl=" + window.location.href+
        //没有中间页面，直接跳到购物车！
        var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
        //alert(path);
        jumpto(path);
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
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
   




    function checkNum2(){
	    	
	   var total=$("#num").val(); //当前输入的值
	   var packgeModulus=$("#num").attr("packgeModulus");　//包装系数
	   if(total%packgeModulus!=0){
		total=(parseInt(total / packgeModulus) + 1) * packgeModulus;
		$("#num").val(total);
	   }
	    	
	   if(!checkNum(document.getElementById("num").value)){
	       $("#num").val(1);
           }else{
	        if(parseInt(document.getElementById("num").value)<1){
	           $("#num").val(1);
	        }
	    } 
    }




//加减
    function add_subtract(obj){
        var op=$(obj).attr("op");//加减标识
        var step=$(obj).attr("step");//加减系数
        var startNum=$(obj).attr("ng-gis");
        var min=1;//最大值
        var max=1000;//最小值
        var reg = new RegExp("^[0-9]*$");
        var newObj=obj;
        if(op=='+'){
        	newObj=$(obj).prev();
            if($(obj).prev().attr("max")!='' &&　$(obj).prev().attr("max")!='undefined' &&　reg.test($(obj).prev().attr("max"))){
                max=$(obj).prev().attr("max")
            }
            if(parseInt($(obj).prev().val())<max){
		
                $(obj).prev().val(parseInt($(obj).prev().val())+parseInt(step)-1);
		$("#goodsNum").html(parseInt($("#goodsNum").html())+1);
            }
        }else{
        	newObj=$(obj).next();
            if($(obj).next().attr("min")!='' &&　$(obj).next().attr("min")!='undefined' &&　reg.test($(obj).next().attr("min"))){
                min=$(obj).next().attr("min")
            }
            if(parseInt($(obj).next().val())>startNum){
                $(obj).next().val(parseInt($(obj).next().val())-parseInt(step)+1);
		$("#goodsNum").html(parseInt($("#goodsNum").html())-1);
            }else if(parseInt($(obj).next().val())<=startNum){
	        $(obj).next().val(startNum);
            	popAlert('商品数量不得小于起批数量!');
            	return;
            }
        }
       	console.log(newObj);
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
    $(function(){
        loginShowView()
    });
</script>