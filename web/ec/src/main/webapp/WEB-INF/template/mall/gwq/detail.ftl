    <#include "mall/gwq/top.ftl"/>
    <#include "mall/gwq/header_new.ftl"/>

<link href="${base}/static/mall/gwq/css/goods_detail.css" rel="stylesheet" type="text/css" />
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<#--<script src="${base}/static/mall/nsc/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>
<link href="${base}/static/css/cloud-zoom.css" rel="stylesheet" type="text/css" />-->
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">window.pageConfig={compatible:true,navId:"detail"};</script>
    <#if !goods??>
    <div id="refresh" class="content">
        <style type="text/css">#refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}</style>
        不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
    </div>
    <#else>
    <!--面包屑导航-->
    <style>
        .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
        .breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
        .breadcrumb span {font-family: "\5b8b\4f53"}
        .comment-box .commstar .star1{background-color:red; display:block; width:20px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
        .comment-box .commstar .star2{background-color:red; display:block; width:43px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
        .comment-box .commstar .star3{background-color:red; display:block; width:63px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
        .comment-box .commstar .star4{background-color:red; display:block; width:85px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
        .comment-box .commstar .star5{background-color:red; display:block; width:105px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
        /* 选择商品 */
        .choose-goods{/*width: 475px;*/ height: auto; float: left;}
        .choose-goods .dd{border: 2px solid #cccccc; margin-top: 3px; margin-bottom: 3px; padding-left: 5px; padding-right:5px; height: 30px; line-height: 30px; margin-right: 5px;}
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

        #choose .selected b{
            position: absolute;
            width: 12px;
            height: 12px;
            overflow: hidden;
            background:url(${base}/static/img/newicon20140910.png) no-repeat scroll -202px -224px;
        }

        .choose-goods a:hover{text-decoration: none;}
        #choose-btns .btn_buys {
            width: 137px;
            height: 38px;
            background: #DDD none repeat scroll 0% 0%;
            color: #FFF;
            border-radius: 3px;
        }
        #choose-btns .btn-appends {
            width: 137px;
            height: 36px;
            border: 1px solid #DDD;
            background: #DDD none repeat scroll 0% 0%;
            border-radius: 3px;
            line-height: 34px !important;
        }
        /*********************今日爆款**********************/
        .jrbk {width:210px;float:right;overflow:hidden;position:relative; border-left: 1px solid #E8E8E8; height:auto;margin-bottom: -9999999px; padding-bottom: 9999999px; overflow: hidden;}
        .jrbk .mt{font-size:16px;color:#333; width: 210px; text-align: center;line-height:30px;}
        .jrbk .mt h2{height:30px; line-height:30px; padding-top:10px;font-size:16px;font-weight:normal;color:#333;}
        .jrbk .mc{overflow:hidden; border-bottom: 1px dashed #E8E8E8; padding-bottom: 10px; margin-left: 15px; margin-right: 15px; width: 180px; margin-bottom: -1px;}
        .jrbk .p-img{height: 162px; background: url("${base}/static/mall/gwq/img/default_img.jpg") no-repeat center;}
        .jrbk .p-img img{width: 100%; height: 100%;}
        .jrbk .p-name{overflow:hidden; line-height: 24px; }

        .widepage .jrbk{width:210px;}
        .reply-color {
            color:#ff6500 ;
        }
        .reply-color dt{
            color:#ff6500;
        }

        #spec-n5 {
            width: 350px;
            height: 61px;
            padding-top: 15px;
            overflow: hidden;
        }

        #spec-left {
            background: transparent url("${base}/static/img/arr_l.gif") no-repeat scroll 0% 0%;
        }
        .control {
            width: 14px;
            height: 23px;
            float: left;
            cursor: pointer;
            margin-top: 20px;
        }

        #spec-right {
            background: transparent url("${base}/static/img/arr_r.gif") no-repeat scroll 0% 0%;
        }

        #spec-list ul {
            float: left;
            overflow: hidden;
        }
        ul, menu, dir {
        }
        ol, ul {
            list-style: outside none none;
        }
        #spec-list ul li img {
            padding: 2px;
            border: 1px solid #CCC;
            width: 54px;
            height: 54px;
        }
        img {
            vertical-align: middle;
            margin: 0px;
            padding: 0px;
        }



        /*产品图片*/

        .pro_info_l{width:420px; float:left; padding-bottom: 15px;}

        #preview{text-align:center; width:420px;}

        .list-h li{ float:left;}
        #spec-n5{width:420px; height:65px; padding-top:13px; overflow:hidden;}
        .control{ width:14px; height:23px; float:left;cursor:pointer;margin-top:23px;}
        #spec-left{ background: transparent url("${base}/static/img/arr_l.gif") no-repeat scroll 0% 0%; margin-left: 5px;}
        #spec-right{background: transparent url("${base}/static/img/arr_r.gif") no-repeat scroll 0% 0%;}
        #spec-list{ width:360px; float:left; overflow:hidden; display:inline; margin:0 12px 0 13px; position:relative;}
        #spec-list ul{width:1100px; float:left; overflow:hidden;}
        #spec-list ul li{ float:left; padding-right:15px; display:inline-block; width:60px;}
        #spec-list ul li img{ padding:2px ; border:1px solid #ccc; width:54px; height:54px;}

        /*jqzoom*/
        .jqzoom{ width:420px; height:420px; /*border:1px solid #e6e6e6;*/ position:relative;overflow:hidden; background: url("${base}/static/mall/gwq/img/default_img.jpg") no-repeat center;}
        .zoomdiv{z-index:100;position:absolute;top:1px;left:0px;width:450px;height:450px;border:1px solid #e4e4e4;display:none;text-align:center;overflow: hidden;}
        .bigimg{width:800px;height:800px;}
        .jqZoomPup{z-index:10;visibility:hidden;position:absolute;top:0px;left:0px;width:50px;height:50px;border:1px solid #aaa;background:#FEDE4F 50% top no-repeat;opacity:0.5;-moz-opacity:0.5;-khtml-opacity:0.5;filter:alpha(Opacity=50);cursor:move;}

        /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  Start*/
        .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
        .popGeneral_address .aptab_center_address .newaddress{margin-top: 20px; margin-left: 20px;}
        .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
        .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
        .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto;  line-height:34px; margin: 10px 5px 0 85px; text-align: center; background: #db0000; border: none !important; color: #FFFFFF; border-radius: 3px;}

        .check_error{color: #DB0000; margin-left: 10px;}
        /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  End*/


        /* 同类商品更多收起样式 */
        .list-more{float: right; margin-bottom: 10px; margin-top: 3px;}
        .list-more {
            border: 1px solid #e8e8e8;
            padding: 7px 6px 7px 10px;
            margin-right: 7px;
        }
        .list-more i {
            background: rgba(0, 0, 0, 0) url("/ec/static/mall/gwq/img/search.ele.png") no-repeat scroll 0 0;
            float: left;
            height: 7px;
            margin-left: 3px;
            margin-top: 6px;
            width: 18px;
        }
        .list-more a {
             display: block;
             float: left;
             color: #666 !important;
         }
        .list-more a:hover{
            color: #DB0000 !important;
        }
        .list-less {
            border: 1px solid #e8e8e8;
            padding: 7px 6px 7px 10px;
            margin-top: 3px;
            margin-right: 7px;
        }
        .list-less a {
            display: block;
            float: left;
            color: #666 !important;
        }
        .list-less a:hover{
            color: #DB0000 !important;
        }
        .list-less i {
            background: rgba(0, 0, 0, 0) url("/ec/static/mall/gwq/img/search.ele.png") no-repeat scroll 0 -34px;
            float: left;
            height: 7px;
            margin-left: 3px;
            margin-top: 6px;
            width: 18px;
        }
        .list-less{float: right; margin-bottom: 10px; }
        .p-ad{font-family: arial,"microsoft yahei";
            color: #DB0000;
            font-size: 14px;
            line-height: 20px;
            word-break: break-all;}
    </style>
    <#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 Start-->
    <input type="hidden" name="goodsId" value="${goods.id}" id="goodsId" />
    <input type="hidden" name="isLogin" value="0" id="isLogin" />
    <input type="hidden" name="gwcGoodsId" value="${goods.id}" id="gwcGoodsId" />
    <input type="hidden" name="gwTypeId" value="" id="gwTypeId" />
    <#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 End-->
    <div class="content">
        <div class="breadcrumb">
            <#if breadcrumbCatList?? && breadcrumbCatList?size &gt; 0>
                <#assign c = breadcrumbCatList?first>
                <h1><a href="${base}/list/${c['l1_id']}.html">${c['l1_name']}</a></h1>
                <#if c['l2_id'] != null>
                    <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}.html">${c['l2_name']}</a></span>
                </#if>
                <#if c['l3_id'] != null>
                    <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}-${c['l3_id']}.html">${c['l3_name']}</a></span>
                </#if>
            </#if>
        </div>
        <!-- 商品介绍 -->

        <div style="width: 1210px; margin: 0 auto; border: 1px solid #E8E8E8; overflow: hidden; background: #ffffff;">
            <div class="pro_info_l">
                <div id="preview">
                    <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                        <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                        <a href="${base}/goods/getGoodsImages/${goods.id},.html" id="goods_img_a" target="_blank">
                        <div class="jqzoom" id="spec-n1" <#--onClick="$('#goods_img_a').trigger('click');"-->>
                            <IMG height="420" src="${firstImg.pic}_420x420.png" jqimg="${firstImg.pic}@420w_420h.png" alt="${firstImg.title}" width="420">
                        </div>
                        </a>
                    <#else>
                        <div class="jqzoom" id="spec-n1">
                            商家没有上传商品图片
                        </div>
                    </#if>

                    <div id="spec-n5">
                        <div class="control" id="spec-left"> </div>
                        <div id="spec-list" style="margin-top: 5px">
                            <ul class="list-h">
                                <#list goodsImagesList?sort_by("orderNo") as img>
                                    <li><img alt="${img.title}" src="${img.pic}@420w_420h.png"></li>
                                </#list>
                            </ul>
                        </div>
                        <div class="control" id="spec-right"> </div>
                    </div>
                </div>
            </div>

            <!-- 简要说明 -->
            <div id="product-intro" style="/*min-height: 430px;*/ float: left; overflow: hidden;">

                <input type="hidden" value="${goods.id}">
                <div id="name" style="width:548px; margin-top: 10px; ">
                <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 start-->
                    <h1 >
                        <#if goods.isMarketable == 0 || goods.isDelete != '1'>
                            <span style="color: red;">
                        <#if showView == "success">
                            [未上架]
                        <#else >
                            [已下架]
                        </#if>
                                &nbsp;&nbsp;&nbsp;
                    </span>
                        </#if>
                    ${goods.fullName}
                    </h1>
                    <div class="p-ad" >${goods.description}</div>
                    <#if promotions ?? && mt?? && mTPromotions?? && mTPromotions.status == 'ing'>
                        <div class="p-ad" ><#if promotionsGoods?? && promotionsGoods.description??>${promotionsGoods.description}</#if></div>
                    </#if>
                <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 End-->
                    <strong></strong>
                <#--Desc:增加系统参数 Auth:zhangqiang Time:2015-11-24 15:13:25 Start-->
                    <br>
                    <h2 style="color: red;" id="systemParamsId"></h2>
                <#--Desc:增加系统参数 Auth:zhangqiang Time:2015-11-24 15:13:25 End-->
                </div>
                <!-- 简单介绍 -->
                <div <#--class="clearfix"--> style="overflow: hidden; width: 548px;border-bottom: 1px dotted #e8e8e8;">
                    <ul id="summary">
                        <div class="goods-price">
                            <#if mTPromotions.isOpen == "end">
                                <li id="summary-price">
                                    <div class="dd" style=";margin-top: 3px">
                                        <strong class="p-price" id="weipu-price">
                                            <#if mTPromotions.status == 'ing'>
                                                ￥${promotionsGoods.promotionsPrice?string('##0.00')}&nbsp;
                                            <#else>
                                                ￥${mTPromotions.price?string("##0.00")}&nbsp;
                                            </#if>
                                        </strong><#--<a id="notice-downp" href="#" target="_blank">(降价通知)</a>-->
                                    </div>
                                    <#--20160718 dzz 取消展示商品原价
                                    <div class="dd" style=";margin-top: 3px">
                                        <span style="text-decoration:line-through;" id="weipu-marketPrice">
                                            ￥${promotionsGoods.goodsPrice?string('##0.00')}&nbsp;
                                        </span>
                                    </div>-->
                                </li>
                            <#else>
                                <#if mt?? && mt != 'z'>
                                    <#if mTPromotions.status == 'ing'>
                                        <li id="summary-price" class="summary-ms" style="padding: 0px;">
                                            <div style=" width: 548px;">
                                                <div style="line-height: 24px;width: 548px;font-size: 14px;background: #ddd;color: #000;">
                                                    【${promotions.pName}】<#if promotions.description?? && promotions.description != '' && promotions.description != null>${promotions.description}</#if>
                                                </div>
                                                <div style="height: 90px;width:100px;float: left; font-size: 16px; border-right: 2px dotted #d12153; /*line-height: 90px; text-align: center;*/ color: #fff;">
                                                    <div style="width: 90px; height: 90px;background: #fff280; line-height: 90px; text-align: center; color: #DB0000;">
                                                    <#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if>
                                                    </div>
                                                </div>
                                                <div style="width:425px;float: left; line-height: 30px;  font-size: 14px; padding-left: 20px; margin-top: 15px;">
                                                    <strong><#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if>价：</strong>
                                                    <span >￥${promotionsGoods.promotionsPrice?string("##0.00")}&nbsp;</span>
                                                </div>
                                                <div style="width:425px;float: left; line-height: 30px; font-size: 14px; padding-left: 20px;">
                                                    <strong>距离<#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if>结束&nbsp;&nbsp;&nbsp;</strong>
                                                        <span class="endtime" value="${mTPromotions.intervalEndTime}" data-status="ing">
                                                        </span>
                                                    <script type="text/javascript">
                                                        $(function(){
                                                            timer(parseInt($(".endtime").attr('value')));
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </li>
                                    <#elseif mTPromotions.status == 'before'>
                                        <li id="summary-price">
                                            <div class="dd" style=";margin-top: 3px">
                                                <strong class="p-price" id="weipu-price" >￥${goods.price}&nbsp;</strong><#--<a id="notice-downp" href="#" target="_blank">(降价通知)</a>-->
                                            </div>
                                            <div class="dd" style=";margin-top: 3px">
                                                <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${goods.marketPrice}&nbsp;</span><!-- 市场价 -->
                                            </div>
                                        </li>
                                        <li id="summary-price" class="summary-ms" style="padding: 0px;">
                                            <div style="width: 548px;" >
                                                <div style="line-height: 24px;width: 548px;font-size: 14px;background: #ddd;color: #000;">
                                                    【${promotions.pName}】<#if promotions.description?? && promotions.description != '' && promotions.description != null>${promotions.description}</#if>
                                                </div>
                                                <div style="height: 90px;width:100px;float: left; font-size: 16px; border-right: 2px dotted #d12153; /*line-height: 90px; text-align: center;*/ color: #fff; ">
                                                    <div style="width: 90px; height: 90px;background: #fff280; line-height: 90px; text-align: center; color: #DB0000;"><#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if></div>
                                                </div>
                                                <div style="width:425px;float: left; line-height: 30px;  font-size: 14px; padding-left: 20px; margin-top: 15px;">
                                                    <strong><#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if>价：</strong>
                                                    <span >￥${promotionsGoods.promotionsPrice?string("##0.00")}&nbsp;</span>
                                                    <#--<#if mt == 't'>
                                                    <span >(
                                                        <#if mTPromotions.startNum &gt; 0>起购&nbsp;${mTPromotions.startNum}，</#if>
                                                        <#if mTPromotions.limitNum &gt; 0>限购&nbsp;${mTPromotions.limitNum}</#if>
                                                        )
                                                    </#if>-->
                                                </div>
                                                <div style="width:425px;float: left; line-height: 30px; font-size: 14px; padding-left: 20px;">
                                                    <strong>距离<#if mt == 'm'>秒杀<#elseif mt == 't'>团购</#if>开始&nbsp;&nbsp;&nbsp;</strong>
                                                    <span class="endtime" value="${mTPromotions.intervalStartTime}" data-intervalEndTime="${mTPromotions.intervalEndTime}" data-status="before">
                                                    </span>
                                                    <script type="text/javascript">
                                                        $(function(){
                                                            timer(parseInt($(".endtime").attr('value')));
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </li>
                                    </#if>
                                <#else>
                                    <li id="summary-price">
                                        <div class="dd" style=";margin-top: 3px">
                                            <strong class="p-price" id="weipu-price" >￥${goods.price}&nbsp;</strong><#--<a id="notice-downp" href="#" target="_blank">(降价通知)</a>-->
                                        </div>
                                        <div class="dd" style=";margin-top: 3px">
                                            <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${goods.marketPrice}&nbsp;</span>
                                        </div>
                                    </li>
                                </#if>
                            </#if>
                            <#if activityFullCut??>
                            <li id="summary-price">

                                <dl class="mj_info">
                               <dt><b>促&nbsp;&nbsp;&nbsp;销：</b></dt>
                              <dd><span style="color: #db0000;">
                                  <em class="mj">${activityFullCut.mjName}</em>
                                  <#if activityFullCutPrice?? && activityFullCutPrice?size &gt; 0>
                                      <#list activityFullCutPrice as price>
                                          满${price.totalPrice}元减${price.decreaseAmount}元
                                         <#if price_has_next>,</#if>
                                      </#list>
                                  </#if>
                                </span></dd>
                                </dl>

                            </li>
                            </#if>
                        </div>
                        <li id="summary-yunfei">
                            <div class="dt">运　　费：</div>
                            <div class="dd">
                                <a href="${base}/html/gwq/wuliu_desc.html" id="wuliu_desc" style="color: #DB0000;font-weight: bold;">运费说明</a>
                            </div>
                        </li>
                        <li id="summary-service">
                            <div class="dt">服　　务：</div>
                            <div class="dd">由
                            <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 Start -->
                            <#--${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}'>${shop.name}</a>","本商城")}-->
                                西安港进出口商品交易中心
                            <#--Desc:将服务提供商写死成‘西安港进出口商品交易中心’ Auth:zhangqiang Time:2015-11-23 16:39:42 End -->
                                发货并提供售后服务。
                            </div>

                        </li>
                        <li>
                            <div class="times">
                                <span style="float: left;">预计送达时间：</span>
                                <em  style="float: left; width: 460px;">${goods.predictDay}</em>
                            </div>
                        </li>

                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 Start-->
                        <li>
                            <div class="dt">同类商品：</div>
                            <div style="float: left; width: 475px;">
                            <div class="choose-goods">
                                <#list goodsProductList as gsP>
                                    <#if gsP_index == 8 >
                                        <#break>
                                    </#if>
                                    <#if goods.id == gsP.id>
                                        <div class="dd selected ">
                                            <b></b><a title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                        </div>
                                    <#else>
                                        <div class="dd">
                                            <b></b><a href="${base}/item/${gsP.id}.html<#if showView == "success">?showView=true</#if>" title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                        </div>
                                    </#if>
                                </#list>
                            </div>
                            <div class="list-more" id="more_btn" <#if brandMore == 'true' >style="display: none; "</#if> onclick="$('#less_btn').show();$('#more_btn').hide();$('#brand_more').show();">
                                <a href="javascript:void(0)">更多</a><i></i>
                            </div>
                            <div class="list-less" id="less_btn" <#if brandMore != 'true' >style="display: none;"</#if>  onclick="$('#less_btn').hide();$('#more_btn').show();$('#brand_more').hide();">
                                <a href="javascript:void(0)">收起</a><i></i>
                            </div>

                            <div id="brand_more" class="choose-goods" <#if brandMore != 'true' >style="display: none; "</#if>>
                                <#list goodsProductList as gsP>
                                    <#if gsP_index &gt;= 8 >
                                        <#if goods.id == gsP.id>
                                            <div class="dd selected ">
                                                <b></b><a title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                            </div>
                                        <#else>
                                            <div class="dd">
                                                <b></b><a href="${base}/item/${gsP.id}.html<#if showView == "success">?showView=true</#if>" title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                            </div>
                                        </#if>
                                    </#if>
                                </#list>
                            </div>
                            </div>
                        </li>
                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 End-->
                    </ul>
                    <ul id="choose">
                        <#list spInfoMap["goodsSpList"] as sp>
                            <li id="choose-${sp.id}">
                                <div class="dt" id="${sp.id}_sp">${sp.name}：</div>
                                <#assign i = 0>
                                <#list spInfoMap["goodsSpItemList"] as item>
                                    <#if item.specificationId == sp.id>
                                        <#if i == 0>
                                            <input type="hidden" name="goodsSp" id="goodsSp_${sp.id}" value="${item.name}" spname="${sp.name}">
                                        </#if>
                                        <div style="float: left;">
                                            <div class="item <#if i == 0>selected</#if>" style="min-width: 35px;text-align: center;margin-top: -2px">
                                                <#if sp.type == 1>
                                                    <b></b><a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">
                                                    ${item.name}<img src="${item.pic}@16w_16h.png" style="margin-top: 1px;padding-left: 1px;padding-right: 3px" width="16" height="16">
                                                    </a>
                                                <#else>
                                                    <b></b><a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">${item.name}</a>
                                                </#if>
                                            </div>
                                        </div>
                                        <#assign i = i+1>
                                    </#if>
                                </#list>
                            </li>
                        </#list>
                        <li id='choose-type'></li>
                        <li id="choose-amount">
                            <div class="dt">购买数量：</div>
                            <div class="dd" style="width: 480px;">
                                <div class="wrap-input" style="width: 140px">
                                    <#if goods.stock <= 0>
                                        <div title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height: 20px;font-size: 15px;margin-left: -18px;margin-right: 3px; text-align: center;">－</div>
                                        <input class="text" id="buy-num" disabled value="0" style="float: left" />
                                        <div title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height:20px;font-size: 15px;margin-left: 3px; text-align: center;">＋</div>
                                        <div style="color: red;font-size: 14px;font-weight: bold; margin-left: 15px; float: left; margin-top: 3px;">[无货]</div>
                                    <#else>
                                        <div onclick="reduce();" title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height: 20px;font-size: 15px;margin-left: -18px;margin-right: 3px; text-align: center;">－</div>
                                        <input class="text" id="buy-num"
                                               value="<#if promotionsId??><#if (mt=="t" ||  mt=="m") && mTPromotions.status=="ing">${validObj.startNum}<#else>1</#if><#else>1</#if>"
                                               style="float: left"
                                               onkeyup="if(this.value.length==0){this.value=this.value.replace(/[^1-9]/g,'');}else{this.value=this.value.replace(/\D/g,'');}"
                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                               onchange="changeNum()"
                                               onblur="changeNum()"
                                                />
                                        <div onclick="add();" title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height:20px;font-size: 15px;margin-left: 3px; text-align: center;">＋</div>
                                    </#if>
                                </div>
                                &nbsp;&nbsp;&nbsp;库存 <span id="goodsStock_span"></span><#if goods.unit??>&nbsp;&nbsp;${goods.unit}</#if>
                                <#if mt?? && ("${mt}"=="t"||"${mt}"=="m") && mTPromotions.status == 'ing'>
                                    (
                                    <#if goods.startNum &gt; 0>起购&nbsp;${goods.startNum}
                                    </#if>
                                    <#if goods.limitNum &gt; 0>，限购&nbsp;${goods.limitNum}
                                    </#if>
                                    )
                                </#if>
                            </div>
                            <div>

                            </div>

                        </li>
                        <li id="choose-btns">
                            <div id="choose-btn-append" class="btn">
                                <#--Desc:判断商品是否上架 goods.isMarketable == 1 上架 Auth:zhangqiang Time:2016-01-30 Start -->
                                    <#if goods.isMarketable != 0 && goods.isDelete != '0'>
                                    <#--Desc:判断商品库存  Auth:zhangqiang Time:2016-01-30 Start -->
                                    <#if goods.stock <= 0>
                                        <#--Desc:商品库存 <=0 无法购买及加入购物车操作  Auth:zhangqiang Time:2016-01-30 Start -->

                                        <a class="btn_buys" id="goBuyUrl"  >立即购买</a>
                                        <#if !(mt?? && mTPromotions.status == 'ing')>
                                            <a class="btn-appends " id="InitCartUrl"  >加入购物车</a>
                                        </#if>
                                        <#--Desc:商品库存 <=0 无法购买及加入购物车操作  Auth:zhangqiang Time:2016-01-30 End -->
                                    <#else>
                                            <#--Desc:商品库存>0时 JS动态判断此商品是否为跨境商品  Auth:zhangqiang Time:2016-01-30 Start -->
                                        <#--<#if isCrossBorder == "true">-->

                                            <a class="btn_buy" style="display: none;" id="goBuyUrl1" onclick="isCrossborder('${goods.id}', $('#buy-num').val(),'goBuy','cross');" href="javascript:void(0);">立即购买</a>
                                            <#if mt != 't'>
                                                <a class="btn-append " style="display: none;" id="InitCartUrl1" onclick="isCrossborder('${goods.id}', $('#buy-num').val(),'add','cross');" href="javascript:void(0);">加入购物车</a>
                                            </#if>

                                        <#--<#else>-->
                                           <a class="btn_buy"  style="display: none;" id="goBuyUrl2" onclick="isCrossborder('${goods.id}', $('#buy-num').val(),'goBuy','');" href="javascript:void(0);">立即购买</a>
                                            <#if !(mt?? && mTPromotions.status == 'ing') >
                                                <a class="btn-append " style="display: none;" id="InitCartUrl2" onclick="isCrossborder('${goods.id}', $('#buy-num').val(),'add','');" href="javascript:void(0);">加入购物车</a>
                                            </#if>
                                        <#--</#if>-->
                                            <#--Desc:商品库存>0时 JS动态判断此商品是否为跨境商品  Auth:zhangqiang Time:2016-01-30 End -->

                                    </#if>
                                    <#--Desc:判断商品库存  Auth:zhangqiang Time:2016-01-30 End -->

                                    <script type="text/javascript">
                                        /**
                                         * Desc:判断商品是否为跨境商品
                                         * Auth:zhangqiang
                                         * Time:2016-01-30
                                         * Param:
                                         *       goodsId        商品ID
                                         *       cnt            加入购物车的商品数量
                                         *       type           立即购买与加入购物车判断
                                         *       cross          是否为跨境商品标识  cross:是跨境商品
                                         */
                                        function isCrossborder(goodsId, cnt, type,cross){
                                            //debugger;
                                            <#if promotionsId??>
                                                if(("${mt}"=="t"|| "${mt}"=="m") && "${mTPromotions.status}"=="ing") {
                                                    var buyNuma = $('#buy-num').val();
                                                    var startNum = ${validObj.startNum};//起购数量
                                                    if(parseInt(${goods.stock})<parseInt(startNum)) {
                                                        var msg = "库存小于起购数量，无法购买";
                                                        layer.alert(msg, {icon:5});
                                                        $('#buy-num').val(parseInt(startNum));
                                                        return;
                                                    }
                                                    if(parseInt(buyNuma)>parseInt(${goods.stock}) && parseInt(buyNuma)>parseInt(startNum)) {
                                                        layer.alert("库存不足!", {icon:5});
                                                        $('#buy-num').val("${goods.stock}");
                                                        return;
                                                    }
                                                    if(parseInt(buyNuma)<parseInt(startNum)) {
                                                        var msg = "您最少需购买"+ parseInt(startNum) +"件";
                                                        layer.alert(msg, {icon:5});
                                                        $('#buy-num').val(startNum);
                                                        return;
                                                    }
                                                }
                                            </#if>

                                            var login = $("#isLogin").val();
                                            //判断是否登录
                                            if(login == '1') {
                                                //是跨境商品时
                                                if(cross == 'cross'){
                                                    var message = '';
                                                    $.ajax({
                                                        type: 'post',
                                                        async: false,
                                                        url: '${base}/goods/ajaxGetSystemCrossMsg',
                                                        success: function(data) {
                                                            if( data.status == 'success' ){
                                                                message = data.msg;
                                                            }else{
                                                            }
                                                        }
                                                    });

                                                    layer.confirm(message, {icon: 7, title:'温馨提示'}, function(index){
                                                        if(ifMemberIDcode()) {
                                                            //20160718 dzz 验证促销活动是否已结束
                                                            <#if promotionsId??>
                                                                $.ajax({
                                                                    type: 'post',
                                                                    async: false,
                                                                    url: '${base}/promotions/validMs/${promotionsId}?mt=${mt}',
                                                                    success: function(data) {
                                                                        if( data.status == 'success' ){
                                                                            if(("${mt}"=="t"||"${mt}"=="m") && "${mTPromotions.status}"=="ing") {
                                                                                //验证团购活动用户可购买商品数量
                                                                                var limitNum = parseInt(data.limitNum);//限购数量
                                                                                var quantity = ${validObj.quantity};//已购数量

                                                                                if(parseInt(limitNum)!=0) {
                                                                                    var beBuy = parseInt($("#buy-num").val()) + parseInt(quantity);
                                                                                    if(parseInt(beBuy)>parseInt(limitNum)) {
                                                                                        if((parseInt(limitNum)-parseInt(quantity))<=0) {
                                                                                            var msg = "购买总数量不能大于 "+limitNum;
                                                                                            layer.alert(msg, {icon:5});
                                                                                            $("#buy-num").val(parseInt(data.startNum));
                                                                                            return;
                                                                                        } else {
                                                                                            var msg = "最多可以购买"+ (parseInt(limitNum)-parseInt(quantity)) +"件";
                                                                                            layer.alert(msg, {icon:5});
                                                                                            $("#buy-num").val(parseInt(limitNum)-parseInt(quantity));
                                                                                            return;
                                                                                        }
                                                                                    }
                                                                                }
                                                                                tgOrderCheck('${promotionsId}', goodsId);
                                                                            } else {
                                                                                addCart(goodsId, cnt, type);
                                                                            }
                                                                        } else if(data.status == 'warn'){
                                                                            addCart(goodsId, cnt, type);
                                                                        } else if(data.status == 'error'){
                                                                            layer.alert(data.message, {icon:1});
                                                                            return;
                                                                        }
                                                                    }
                                                                });
                                                            <#else>
                                                                addCart(goodsId, cnt, type);
                                                            </#if>
                                                        }else{
                                                            $("#gwcGoodsId").val(goodsId);
                                                            $("#gwTypeId").val(type);
                                                            layer.open({
                                                                type: 1,
                                                                title:'设置会员本人身份证号',
                                                                area:["500px","210px"],
                                                                scrollbar:false,
                                                                content: $('#popupdiv') //这里content是一个DOM
                                                            });
                                                        }
                                                        layer.close(index);
                                                    });
                                                }else{
                                                    //20160718 dzz 验证促销活动是否已结束
                                                    <#if promotionsId??>
                                                        $.ajax({
                                                            type: 'post',
                                                            async: false,
                                                            url: '${base}/promotions/validMs/${promotionsId}?mt=${mt}',
                                                            success: function(data) {
                                                                if( data.status == 'success' ){
                                                                    if(("${mt}"=="t" || "${mt}"=="m") && "${mTPromotions.status}"=="ing") {
                                                                        //验证团购活动用户可购买商品数量
                                                                        var limitNum = ${validObj.limitNum};//限购数量
                                                                        var quantity = ${validObj.quantity};//已购数量

                                                                        if(parseInt(limitNum)!=0) {
                                                                            var beBuy = parseInt($("#buy-num").val()) + parseInt(quantity);
                                                                            if(parseInt(beBuy)>parseInt(limitNum)) {
                                                                                if((parseInt(limitNum)-parseInt(quantity))<=0) {
                                                                                    var msg = "购买总数量不能大于 "+limitNum;
                                                                                    layer.alert(msg, {icon:5});
                                                                                    $("#buy-num").val("${validObj.startNum}");
                                                                                    return;
                                                                                } else {
                                                                                    var msg = "最多可以购买"+ (parseInt(limitNum)-parseInt(quantity)) +"件";
                                                                                    layer.alert(msg, {icon:5});
                                                                                    $("#buy-num").val(parseInt(limitNum)-parseInt(quantity));
                                                                                    return;
                                                                                }
                                                                            }
                                                                        }
                                                                        tgOrderCheck('${promotionsId}', goodsId);
                                                                    } else {
                                                                        addCart(goodsId, cnt, type);
                                                                    }
                                                                }else if(data.status == 'warn'){
                                                                    //"非促销(秒杀, 团购)活动!"
                                                                    addCart(goodsId, cnt, type);
                                                                }else if(data.status == 'error'){
                                                                    layer.alert(data.message, {icon:1});
                                                                    return;
                                                                }
                                                            }
                                                        });
                                                    <#else>
                                                        addCart(goodsId, cnt, type);
                                                    </#if>
                                                }
                                            }else{
                                                location.href = "${base}/member/login";
                                            }

                                        }
                                        /**
                                         * Desc:判断会员是否设置了身份证号
                                         * Auth:zhangqiang
                                         * Time:2016-01-30
                                         * Return:
                                         *        true  设置了身份证号
                                         *        false 没有设置
                                         */
                                        function ifMemberIDcode(){
                                            var flags = false;
                                            $.ajax({
                                                type: 'post',
                                                async: false,
                                                url: '${base}/member/getMemberIDcode',
                                                success: function(data) {
                                                    if( data.status == 'success' ){
                                                        flags = true;
                                                    }else if(data.status == 'error'){
                                                        flags = false;
                                                    }else{
                                                        location.href = "${base}/member/login";
                                                        return;
                                                    }
                                                }
                                            });
                                            return flags;
                                        }
                                        function addCart(goodsId, cnt, type) {
                                            var sp = '';
                                            var flag = true;
                                            if($('input[name="goodsSp"]').length > 0){
                                                $('input[name="goodsSp"]').each(function(){
                                                    if($(this).val() == ''){
                                                        flag =false;
                                                        alert('请选择['+$(this).attr("spname")+']');
                                                        return false;
                                                    }else{
                                                        sp += $(this).attr("spname")+':'+$(this).val() + ',';
                                                    }
                                                });
                                            }
                                            if(sp != ''){
                                                sp = sp.substring(0,sp.length-1);
                                            }
                                            if(flag){
                                                if(type == 'add'){
                                                    window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + encodeURIComponent(window.location.href)
                                                }else if(type=='goBuy'){
                                                    window.location.href = "${base}/cart/goBuy?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + encodeURIComponent(window.location.href)
                                                }
                                            }

                                        }

                                        //团购
                                        function tgOrderCheck(promotionId, goodsId) {
                                            window.location.href = "${base}/promotions/ordercheck/"+promotionId+"/"+goodsId+"?dealNum="+$("#buy-num").val()+"&resultNum=${resultNum}&backurl=" + encodeURIComponent(window.location.href);
                                        }
                                    </script>
                                </#if>
                                <#--Desc:判断商品是否上架 goods.isMarketable == 1 上架 Auth:zhangqiang Time:2016-01-30 End -->
                            </div>
                            <div id="choose-btn-easybuy" class="btn"></div>
                            <div id="choose-btn-divide" class="btn"></div>
                            <div id="Fqfk_Tip" class="Tip360" style="display:none;"></div>
                <div class="attention-shop"><a onclick="addGoodsAttention('${goods.id}',this);" href="javascript:void(0);">关注该商品</a></div>
                        </li>
                    </ul>
                    <span class="clr"></span>
                </div>
                <!-- 图片预览 -->

            </div>

            <div class="jrbk">
                <div class="mt" style="margin-bottom: 3px;">
                    <h2>今日爆款</h2>
                </div>
                <#list tcGoodsList as goods>
                    <div class="mc">
                        <div class="p-img">
                            <a  title="${goods.fullName}" href="${base}/item/${goods.id}.html">
                                <img  alt="${goods.fullName}" data-img="1" src="${goods.pic}@100w_100h.png" class="err-product">
                            </a>
                        </div>
                        <div class="p-name">
                            <a title="${goods.fullName}" href="${base}/item/${goods.id}.html">${goods.fullName}</a>
                        </div>
                        <div class="p-price">
                            <strong>￥${goods.price}</strong>
                        </div>
                    </div>
                </#list>
            </div><!--jrbk end-->
        </div>
        <!-- 详细信息 -->
        <div id="detail-info">
            <div class="right" style="padding-top: 10px">
                <div id="product-detail" class="m m1" data-widget="tabs" clstag="shangpin|keycount|product|detail" load="true">
                    <div class="float-nav-wrap" style="height: 35px;">
                        <div class="mt" style="height:35px; width: 988px; background: #fbfbfb; border-top: 1px solid #dedfde;">
                            <ul class="tab">
                                <li data-widget="tab-item" id="p-detail-tab" class="curr"><a href="javascript:;" class="toggle-link">商品介绍</a></li>
                                <li data-widget="tab-item" id="p-attr-tab" class=""><a href="javascript:;" class="toggle-link">相关参数</a></li>
                                <li data-widget="tab-item" id="p-order-tab" class=""><a href="javascript:;" class="toggle-link">关单、检疫合格证、原产地证明</a></li>
                                <li data-widget="tab-item" id="p-review-tab" class=""><a href="javascript:;" class="toggle-link">商品评价<span class="hl_blue" id="reviewSizeId"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div style="border-top: 1px solid #ccc;width: 990px;min-width: 990px"></div>
                    <div id="tab-content">
                        <!-- 商品介绍 -->
                        <div class="mc " data-widget="tab-content" id="p-detail" style="width:990px;min-width: 990px">
                            <ul class="detail-list">
                                <li title="${goods.name}">商品名称：${goods.name}</li>
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
                            <div class="detail-content">
                                <div style="width: 100%">
                                ${goods.introduction}
                                </div>
                            </div>
                        </div>
                        <!-- 属性参数 -->
                        <div class="mc hide" data-widget="tab-content" id="p-attr" style="width:990px;min-width: 990px">
                            <div class="detail-correction ac" style="border: 1px solid #ddd; border-top: none;background:#fff;">
                            <table cellpadding="0" cellspacing="1" width="100%" border="0" class="Ptable" style="margin-top: 0px">
                                <tbody id="params">
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!-- 相关证书 -->
                        <div class="mc hide" data-widget="tab-content" id="p-order" style="width:990px;min-width: 990px">
                            <div class="detail-correction ac"></div>
                            <div class="detail-content">
                                <div style="width: 100%">
                                ${goods.shippingOrderUrl}
                                </div>
                            </div>
                        </div>
                        <!-- 商品评价 -->
                        <div class="mc hide" data-widget="tab-content" id="p-review" style="width:990px;min-width: 990px;margin-top: 10px">
                            <div id="comment" class="m m2">
                                <div class="mc">
                                    <div id="i-comment">
                                        <div class="rate">
                                            <strong></strong><br>
                                            <span>好评度</span>
                                        </div>
                                        <div class="percent" style="width: 700px;">
                                            <dl>
                                                <dt>好评<span id="haoping_tip"></span></dt>
                                                <dd style="width: 600px;min-width: 600px">
                                                    <div id="haoping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>中评<span id="zhongping_tip"></span></dt>
                                                <dd class="d1" style="width: 600px;min-width: 600px">
                                                    <div id="zhongping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>差评<span id="chaping_tip"></span></dt>
                                                <dd class="d1" style="width: 600px;min-width: 600px">
                                                    <div id="chaping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="btns">
                                            <div>您可对已购商品进行评价</div>
                                            <a href="${base}/order/review?goodsId=${goods.id}" class="btn-comment" target="_blank" style="margin-top: 15px">发评价</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 评价详细内容 -->
                            <div id="comments-list" class="m" data-widget="tabs" load="true" style=" width: 988px; background: #fbfbfb; border-top: 1px solid #dedfde;">
                                <div class="mt">
                                    <ul class="tab">
                                        <li data-widget="tab-item" class="curr" onclick="showTab('comments-all')"><a href="javascript:;">全部评价<em>(<span id="totalReview"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-haoping')"><a href="javascript:;">好评<em>(<span id="haopingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-zhongping')"><a href="javascript:;">中评<em>(<span id="zhongpingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-chaping')"><a href="javascript:;">差评<em>(<span id="chapingCnt"></span>)</em></a></li>
                                    </ul>
                                </div>
                                <div id="comments-container" style="border-top: 1px solid #ccc;width: 988px;min-width: 988px">
                                    <div id="comments-all" class="mc curr" data-widget="tab-content"></div>
                                    <div id="comments-haoping" class="mc hide" data-widget="tab-content"></div>
                                    <div id="comments-zhongping" class="mc hide" data-widget="tab-content"></div>
                                    <div id="comments-chaping" class="mc hide" data-widget="tab-content"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <span class="clr"></span>
        </div>
        <!-- 左边相关分类 -->
        <div class="left" style="float: left; margin-left:10px; margin-top: 10px;">
            <#if refCatelogList?? && refCatelogList?size &gt; 0>
                <div id="related-sorts" class="m m2">
                    <div class="mt">
                        <h2>相关分类</h2>
                    </div>
                    <div class="mc">
                        <ul class="lh">
                            <#list refCatelogList as cat>
                                <#if cat.cateTypeFlage == 2 >
                                    <li><a href="${base}/list/${cat.grandfather}-${cat.parentId}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                                <#else>
                                    <li><a href="${base}/list/${cat.grandfather}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                                </#if>
                            </#list>
                        </ul>
                    </div>
                </div>
            </#if>
            <div id="related-brands" class="m m2">
                <div class="mt">
                    <h2>同类其他品牌</h2>
                </div>
                <div class="mc">
                    <ul class="lh">
                        <#if brandRefList?? && brandRefList?size &gt; 0>
                            <#list brandRefList as brand>
                                <li><a href="javascript:void(0)" onclick="s('${brand.name}','')"  title="${brand.name}（${brand.sign}）">${brand.name}</a></li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>

    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <#--<form class="registerform" onsubmit="return false">-->
            <div class="pop_win aptab_center_address">

                <ul class="newaddress">
                    <li>
                        <label> <strong style="color: red;">*</strong> 身份证号： </label>
                        <input type="text" id="idcode"  name="idcode" value="" class="inputxt" style="width: 180px;">
                        <span id="checkIdcodeId" class="check_error hide"></span>
                    </li>

                    <li>
                        <input type="submit" value="保 存" onclick="save_idcode()"  class="btn_save  bule_btn" />
                    </li>
                </ul>
            </div>
        <#--</form>-->
    </div>
    </#if>
    <script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/js/product.js"></script>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    var reviewClicked = false;
    $(document).ready(function () {
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#login").hide();
                    $("#loginAfter").show();
                    $("#lg_nickeName").text('Hi! '+data.m.nickName);
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                    $("#isLogin").val(1);

                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                    $("#isLogin").val(0);
                }
            }
        });

        $.ajax({
            type: 'post',
            url: '${base}/goods/ajaxGetGoodStock',
            data: "goodsId=${goods.id}",
            success: function(data) {
                if( data.status == 'success' ){
                    $("#goodsStock_span").text(data.stock);
                }else{

                }
            }
        });

        $(".jqzoom").jqueryzoom({
            xzoom: 400,
            yzoom: 400,
            offset: 10,
            position: "right",
            preload: 1,
            lens: 1
        });
        $("#spec-list").jdMarquee({
            deriction:"left",
            width:360,
            height:61,
            step:5,
            speed:5,
            delay:10,
            control:true,
            _front:"#spec-right",
            _back:"#spec-left"
        });
        $("#spec-list img").bind("mouseover",function(){
            var src=$(this).attr("src");
            $("#spec-n1 img").eq(0).attr({
                src:src.replace("\/n5\/","\/n1\/"),
                jqimg:src.replace("\/n5\/","\/n0\/")
            });
            $(this).css({
                "border":"2px solid #e4393c",
                "padding":"1px"
            });
        }).bind("mouseout",function(){
            $(this).css({
                "border":"1px solid #ccc",
                "padding":"2px"
            });
        });

//        selectedSp();
        $('.float-nav-wrap .tab li').bind('click', function () {
            tabStyle($(this), $('#tab-content').find('.mc'));
        });

        $('#choose .item').bind('click', function () {
            selectedSps($(this));
        });
        $('.spec-items .lh li').bind('mouseover', function () {
            previewImg($(this).children('img'));
        });

        $('#spec-backward').bind('click', imgBackward);
        $('#spec-forward').bind('click', imgForward);
        // 图片放大预览效果
        //CloudZoom.quickStart();
        // 初始化评价视图数据
        initReviewCount();

        // 延时加载评价
        $('#p-review-tab').bind('click', countReviewRate);

        $('#comments-list .tab li').bind('click', function () {
            tabStyle($(this), $('#comments-list li'));
        });

        getGoodsReviewSize($("#goodsId").val());
        getGoodsSystemParameters($("#goodsId").val());

        $("#wuliu_desc").colorbox({title:"运费说明", iframe:true, innerWidth:600, innerHeight:450, opacity: 0.3});

        //异步获取参数
        $.ajax({
            type: 'post',
            url: '${base}/goods/getParamNoGroup',
            data:{goodsId:'${goods.id}'},
            success: function(data) {
                if( data.status == 'success' ){
                   //params
                    var html = '';
                    $.each(data.params,function(i,d){
                        html += '<tr><td class="tdTitle">'+ d.name+'</td>';
                        html += '<td id="'+ d.parameterId+'_'+d.name+'" style="text-align:left;">'+ d.content+'</td>';
                        html += '</tr>';
                    });
                    $("#params").html(html);
                }else{

                }
            }
        });

        $("#goBuyUrl1").hide();
        $("#InitCartUrl1").hide();

        $("#goBuyUrl2").hide();
        $("#InitCartUrl2").hide();

        //获取是否为跨境商品
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/goods/ajaxIsCrossBorderGoods',
            data:{shopId:'${goods.shopId}',catelogId:'${goods.categoryId}'},
            success: function(data) {
                if( data.status == 'success' ){
                    $("#goBuyUrl1").show();
                    $("#InitCartUrl1").show();
                    $("#goBuyUrl2").hide();
                    $("#InitCartUrl2").hide();
                }else{
                    $("#goBuyUrl1").hide();
                    $("#InitCartUrl1").hide();
                    $("#goBuyUrl2").show();
                    $("#InitCartUrl2").show();
                }
            }
        });
    });

    /**
     * 商品详细页tab页切换效果
     * @param li 选中的tab页
     * @param tabContent tab对应的详细内容
     */
    function tabStyle(li, tabContent) {
        li.addClass('curr');
        var subs = li.siblings();
        $.each(subs, function (i, _li) {
            $(_li).removeClass('curr');
        });
        var tmpId = $(li).attr('id');
        var tabContentId = tmpId.substr(0,tmpId.lastIndexOf('-tab'));
        $('#' + tabContentId).removeClass('hide');
        $('#' + tabContentId).siblings('div').addClass('hide');
    }

    <#if goods.stock??  || goods.stock &gt; 0>
        function reduce() {
            var buyNum = $('#buy-num');

            if(parseInt(buyNum.val()) > 1) {
                buyNum.val(parseInt(buyNum.val()) - 1);
            }

            <#if promotionsId??>
                if(("${mt}"=="t"||"${mt}"=="m") && "${mTPromotions.status}"=="ing") {
                    var startNum = ${validObj.startNum};//起购数量
                    if(parseInt(buyNum.val())<parseInt(startNum)) {
                        var msg = "您最少需购买"+ parseInt(startNum) +"件";
                        layer.alert(msg, {icon:5});
                        $('#buy-num').val(startNum);
                        return;
                    }
                }
            </#if>
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
        }
        function add() {
            var buyNum = $('#buy-num');
            buyNum.val(parseInt(buyNum.val()) + 1);
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
        }
        function changeNum() {
            var buyNum = $('#buy-num');
            if(buyNum.val()=="" || buyNum.val()==null) {
                <#if promotionsId??>
                    if(("${mt}"=="t"||"${mt}"=="m")&& "${mTPromotions.status}"=="ing") {
                        layer.alert("您还没有选择需购买的商品数量", {icon:5});
                        $('#buy-num').val("${validObj.startNum}");
                    }
                <#else>
                    $('#buy-num').val("1");
                </#if>
            }
            <#if promotionsId??>
                if(("${mt}"=="t"||"${mt}"=="m") && "${mTPromotions.status}"=="ing") {
                    var startNum = ${validObj.startNum};//起购数量
                    if(parseInt(buyNum.val())<parseInt(startNum)) {
                        var msg = "您最少需购买"+ parseInt(startNum) +"件";
                        layer.alert(msg, {icon:5});
                        $('#buy-num').val(startNum);
                        return;
                    }
                }
            </#if>
        }
    </#if>

    /**
     * 选择规格的效果
     */
    function selectedSps(c) {
        var _id = c.children().eq(0).prop('id');
        var id = _id.substring(0, _id.indexOf('_item'));
        c.addClass('selected');
        var pSubs = c.parent().siblings();    // 选中元素的兄弟元素
        $.each(pSubs, function (i, sp) {
            $(sp).children('.item').removeClass('selected');
        });
    }

    /**
     * 鼠标放到缩略图上可以在id=imgPreview的div上显示中型图片效果
     * @param img 鼠标放上去的缩略图对象
     */
    function previewImg(img) {
        var newImgSrc = $(img).attr('src');
        $('#imgPreview img').attr('src', newImgSrc);
        /*$('#imgPreview').bind('click', function() {
            window.open(newImgSrc)
        });*/
        $(img).addClass('img-hover');   // 当前选中效果

        // 其它兄弟图片元素取消选中效果
        var sibsLi = $(img).parent().siblings();
        $.each(sibsLi, function (i, li) {
            $(li).children('img').removeClass('img-hover');
        });

        // 重新使图片放大预览
        var myInstance = $('#imgPreview img').data('CloudZoom');
        myInstance.loadImage(newImgSrc, newImgSrc);
    }

    /**
     * 图片回退
     */
    var picCounter = 0;
    function imgBackward() {
        var _left = $('.spec-items .lh').css('left');
        var left = parseInt(_left.substring(0, _left.indexOf("px")));
        if (left <= 0) {
            $('#spec-forward').removeClass('disabled');
        }
        var goodsImgesSize = parseInt($('#goodsImgesSize').val());
        var absLeft = Math.abs(left);
        if((absLeft + 62*5) >= goodsImgesSize*62 || goodsImgesSize == 0) {
            $('#spec-backward').addClass('disabled');
        } else {
            $('.spec-items .lh').css('left', (left - 62) + "px");
        }
        if(goodsImgesSize <= 5) {
            $('#spec-forward').addClass('disabled');
        }
    }

    /**
     * 图片前进
     */
    function imgForward() {
        var _left = $('.spec-items .lh').css('left');
        var left = parseInt(_left.substring(0, _left.indexOf("px")));
        var goodsImgesSize = parseInt($('#goodsImgesSize').val());
        if (goodsImgesSize > 5) {
            $('#spec-backward').removeClass('disabled');
        }
        if (left == 0) {
            $('#spec-forward').addClass('disabled');
        } else{
            $('.spec-items .lh').css('left', (left + 62) + "px");
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

        $("#i-comment .rate strong").html(haopinglv.toPercent() + "<span>%</span>");
        $("#haoping_tip").html("(" + haopinglv.toPercent() + "%)");
        $("#haoping_rating").attr("style", "width:" + haopinglv.toPercent() + "%");
        $("#zhongping_tip").html("(" + zhongpinglv.toPercent() + "%)");
        $("#zhongping_rating").attr("style", "width:" + zhongpinglv.toPercent() + "%");
        $("#chaping_tip").html("(" + chapinglv.toPercent() + "%)");
        $("#chaping_rating").attr("style", "width:" + chapinglv.toPercent() + "%");
    }

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
                    var huifuHtml = "";
                    var haopingList = []; var zhongpingList = []; var chapingList = [];
                    $('#totalReview').text(data.length);
                    $.each(data, function(i, review) {
                        huifuHtml = '';
                        if(review.maps != 'undefined' && review.maps != undefined && review.maps != ''){
                            $.each(review.maps, function(i, item) {
                                if(item !="" && item !=undefined){
                                    huifuHtml +="<div class='";

                                    if( i % 2 == 0){
                                        huifuHtml += "repply_second";
                                    }else{
                                        huifuHtml += "repply_first";
                                    }

                                    huifuHtml += "'>";
                                    huifuHtml +="<s class='clr'></s>";
                                    huifuHtml += '<dl><dt>';
                                    if(item.whichSys=='EC'){
                                        huifuHtml += '追加评论';
                                    }else if(item.whichSys=='MCM'){
                                        huifuHtml += '商家回复';
                                    }else if(item.whichSys=='ECM'){
                                        huifuHtml += '商城回复';
                                    }
                                    huifuHtml +="：</dt><dd>" + item.replyContent+"</dd></dl>";
                                    huifuHtml +="<s class='clr'></s><dl><dt>";
                                    huifuHtml +='<dt>';
                                    if(item.whichSys=='EC'){
                                        huifuHtml += '追加';
                                    }else{
                                        huifuHtml += '回复';
                                    }
                                    huifuHtml +='时间：</dt><dd>' + item.replyDate+'</dd></dl>';
                                    huifuHtml +='</div>';
                                }
                            });
                        }

                        var score = parseInt(review.score);
                        //Desc:将评论分数变为小星星显示 Auth:zhangqiang 2015-11-23 Start
                        var starts = "";
                        var flags = "";
                        if(score ==1){
                            starts = "star1";
                            flags = "star1 sa commstar";
                        }else if(score ==2){
                            starts = "star2";
                            flags = "star2 sa commstar";
                        }else if(score ==3){
                            starts = "star3";
                            flags = "star3 sa commstar";
                        }else if(score ==4){
                            starts = "star4";
                            flags = "star4 sa commstar";
                        }else if(score ==5){
                            starts = "star5";
                            flags = "star5 sa commstar";
                        }else{
                            starts = "";
                            flags = "star sa commstar";
                        }

                        if (score > 3) {
                            haopingList.push(review);
                            haopingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //haopingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                haopingHtml +=huifuHtml;
                            }
                            haopingHtml +="</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score > 1 && score < 4) {
                            zhongpingList.push(review);
                            zhongpingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //zhongpingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                zhongpingHtml +=huifuHtml;
                            }
                            zhongpingHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score < 2) {
                            chapingList.push(review);
                            chapingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //chapingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                chapingHtml +=huifuHtml;
                            }
                            chapingHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        }
                        allHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                        if(huifuHtml !="" && huifuHtml !=undefined){
                            //allHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                            allHtml +=huifuHtml;
                        }
                        allHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                    });
                    $('#haopingCnt').text(haopingList.length);
                    $('#zhongpingCnt').text(zhongpingList.length);
                    $('#chapingCnt').text(chapingList.length);
                    $(allHtml).appendTo(all_comments_list);
                    $(haopingHtml).appendTo(haoping_comments_list);
                    $(zhongpingHtml).appendTo(zhongping_comments_list);
                    $(chapingHtml).appendTo(chaping_comments_list);
                    //Desc:将评论分数变为小星星显示 Auth:zhangqiang 2015-11-23 End
                }
            });

            reviewClicked = true;
            $('#comments-all').removeClass('hide');
        }
    }

    /**
     * 选择规格
     */
    function chekedSp(spId,itemId,itemName){
        $('#' +spId).val(itemName);
        $('.item').removeClass("selected");
        $('#' +itemId).parent().addClass('selected');
//        selectedSp();
    }

    function showTab(tab) {
        $("#" + tab + "").removeClass("hide");
        $("#" + tab + "").siblings("div").addClass("hide");
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
            $('#choose-result .dd strong').html(selectedText);
        } else {
            $('#choose-result').html("");
        }
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
    // 用法
    //    var A = 0.358975, B = 0.25554;
    //    alert([A, A.toPercent(3), B, B.toPercent()].join('\n'));

    /**
     * Desc:获取商品评论次数，商品详情页静态化使用
     * Auth:zhangqiang
     * Time:2016-01-18 14:07:35
     * Start
     */
    function getGoodsReviewSize(goodsId){
        $.ajax({
            type: "post",
            url: "${base}/goods/ajaxGetGoodsReviewSize",
            data:{'goodsId':goodsId},
            datatype: 'json',
            error: function () {
                $("#reviewSizeId").text("("+0+")");
            },
            success: function(result) {
                if(result.status=='success'){
                    $("#reviewSizeId").text("("+result.goodsReviewSize+")");
                }else{
                    $("#reviewSizeId").text("("+0+")");
                }
            }
        });

    }

    /**
     * Desc:获取此商品的系统参数(国家;产地;保质期)
     * Auth:zhangqiang
     * Time:2015-11-25 15:50:35
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
                    $("#systemParamsId").html(result.sysParms);
                }else{
                }
            }
        });

    }

    function addGoodsAttention(goodsId,item) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    layer.alert(data.message,{icon:1});
//                    $(item).removeClass("btn-coll").addClass("showattention");
                    $(item).text('已关注');
                    $(item).attr("onclick", "");
                }else if(data.status=='warn'){
                    layer.alert(data.message,{icon:2});
//                    $(item).removeClass("btn-coll").addClass("showattention");
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

    function save_idcode(){
        var idcode = $("#idcode").val();

        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
            $("#checkIdcodeId").text('身份证号不能为空!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        if(idcode.length > 18 || idcode.length < 15){
            $("#checkIdcodeId").text('身份证号长度范围15~18位!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {
            $("#checkIdcodeId").text('身份证号格式错误!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        $("#checkIdcodeId").addClass("hide");

        $.ajax({
            type: "post",
            async: false,
            url: base+"member/username/check",
            data:{'userName':idcode,'property':'iDCode'},
            datatype: 'json',
            error: function () {

            },
            success: function(result) {
                if(result){
                    $("#checkIdcodeId").addClass("hide");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: base+"member/saveMemberIDcode",
                        data:{'idcode':idcode},
                        datatype: 'json',
                        error: function () {

                        },
                        success: function(result) {
                            if(result.status == 'success'){
                                layer.closeAll();
                                addCart($("#gwcGoodsId").val(), $('#buy-num').val(), $("#gwTypeId").val());
                            }else{
                                layer.alert('设置失败',{icon:2});
                            }
                        }
                    });
                }else{
                    $("#checkIdcodeId").text('身份证号已存在,请重新输入!');
                    $("#checkIdcodeId").removeClass('hide');
                }
            }
        });
    }

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
            var time = day+"&nbsp;天&nbsp;&nbsp;";
            time += hour+'&nbsp;时&nbsp;&nbsp;';
            time += minute+'&nbsp;分&nbsp;&nbsp;';
            time += second+'&nbsp;秒';
            $('.endtime').html(time);
            intDiff--;
            if(intDiff==0){
                location.reload();
            }
        }, 1000);
    }
</script>



    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>