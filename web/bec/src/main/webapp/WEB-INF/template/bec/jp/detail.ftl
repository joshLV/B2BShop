<#include "bec/jp/header.ftl"/>
<#--<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/pro_info.css">-->

<!--购买数量所用js（jquery.spinner.js）-->
<script type="text/javascript" src="${base}/static/bec/project/ghj/js/jquery.spinner.js"></script>

<style type="text/css">
    #code{display:none;width: 100px;height: 100px;background:#CCC; position: absolute; z-index: 2; bottom: 16px; left:-40px;}
    #code img{ width: 100%; }
    .wx{ position: relative;z-index: 1;}
    .wx .wx_ico{ width: 18px; height: 18px;}
</style>

<#--<script type="text/javascript" src="${base}/static/bec/project/ghj/js/proinfo/product.js"></script>-->

<#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 Start-->
<input type="hidden" name="goodsId" value="${goods.id}" id="goodsId" />
<!--<input type="hidden" name="goodsBatchPriceId" value="${goods.batchPrice}" id="goodsBatchPriceId" />-->
<input type="hidden" name="goodsBatchPriceId" value="${goods.enableBatchPrice}" id="goodsBatchPriceId" />
<input type="hidden" name="enableBatchPrice" value="${goods.enableBatchPrice}" id="enableBatchPrice" />
<input type="hidden" name="baseId" value="${base}" id="baseId" />
<input type="hidden" name="isMarketableId" value="${goods.isMarketable}" id="isMarketableId" /><#--是否上架-->
<input type="hidden" name="stockId" value="${goods.stock}" id="stockId" />

<input type="hidden" name="djhmlId" value="${goodsCategoryId}" id="djhmlId" />

<#if goods.enableBatchPrice == '1'>
<input type="hidden" name="" value="${goods.batchPrice}" id="defStartBatchPrice" />
<input type="hidden" name="goodsNumId" value="${goods.startBatchNum}" id="defStartBatchNum" />
<#else >
<input type="hidden" name="" value="${goods.price?string("##0.00")}" id="defStartBatchPrice" />
<input type="hidden" name="goodsNumId" value="${goods.startNum}" id="defStartBatchNum" />
</#if>
<input type="hidden" name="goodsPackageModulus" value="${(goods.packageModulus==0)?string("1",goods.packageModulus)}" id="defPackageModulus" />
<input type="hidden" name="goodsLimitNum" value="${goods.limitNum}" id="defLimitNum" />
<input type="hidden" value="${goods.enableBatchPrice}" name="name" id="ifBatchPriceId" />
<#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 End-->
<div id="container f-cb">
    <#include "bec/jp/top.ftl"/>
    <#if !goods??>
        <div id="refresh" class="content">
            <style type="text/css">#refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}</style>
            不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
        </div>
    <#else>
    <div class="product_box">
        <div class="main">
            <div class="place">
                <#--您现在的位置：<a href="${base}/index">西安港进出口交易中心电子商务平台</a> &nbsp;&gt;&nbsp;-->
                    <#if breadcrumbCatList?? && breadcrumbCatList?size &gt; 0>
                        <#assign c = breadcrumbCatList?first>
                    <#--Desc:显示的商品分类结构不正确(应为三级分类，如:2-202-20204) Auth:zhangqinag Tiem:2015-11-27 16:49:35 Start-->
                        <h1><a href="${base}/list/${c['l1_id']}.html">${c['l1_name']}</a></h1>
                        <#if c['l2_id'] != null>
                            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}.html">${c['l2_name']}</a></span>
                        </#if>
                        <#if c['l3_id'] != null>
                            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}-${c['l3_id']}.html">${c['l3_name']}</a></span>
                        </#if>
                    <#--Desc:显示的商品分类结构不正确(应为三级分类，如:2-202-20204) Auth:zhangqinag Tiem:2015-11-27 16:49:35 End-->
                    </#if>
            </div>
            <div class="pro_info">
                <input type="hidden" value="${goods.id}">
                <div class="pro_info_l">
                    <div id="preview">
                        <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                        <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                        <div class="jqzoom" id="spec-n1" onClick="window.open('#')">
                                <IMG height="420" src="${firstImg.pic}" jqimg="${firstImg.pic}" alt="${firstImg.title}"width="420">
                        </div>
                        <#else>
                            <div class="jqzoom" id="spec-n1">
                                商家没有上传商品图片
                            </div>
                        </#if>
                        <div id="spec-n5">
                            <div class="control" id="spec-left"> </div>
                            <div id="spec-list">
                                <ul class="list-h">
                                    <#list goodsImagesList?sort_by("orderNo") as img>
                                        <li><img alt="${img.title}" src="${img.pic}"></li>
                                    </#list>
                                </ul>
                            </div>
                            <div class="control" id="spec-right"> </div>
                        </div>
                    </div>
                </div>

                <div class="pro_info_r">
                    <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 start-->
                    <h1>
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
                    <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 End-->
                        <#assign isGoBuy=true>
                        <div class="pfj" id="staticAId" style="display:none;">
                            <div class="pfj_t">
                                <span>批&nbsp;发&nbsp;价</span>
                                <em class="red f-fs2" id="staticA1Id">会员可见!</em>
                            </div>
                            <div class="price-interval" id="staticA2Id">
                                <ul>
                                    <#list batchPrices as bp>
                                        <li>
                                            <div class="f-fl" style="width: 200px;">
                                                数量：
                                            <span>${bp.startBatchNum}~${bp.endBatchNum}
                                            </span>
                                            </div>
                                            <div class="detail-price">
                                                价格：
                                                <em>￥
                                                <span id="batchPriceId">
                                                ${bp.batchPrice}
                                                </span>
                                                </em>
                                            </div>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>

                        <div class="pfj" id="staticBId" style="display:none;">
                            <div class="pfj_t">
                                <span>商&nbsp;城&nbsp;价：</span>
                                <em class="red f-fs2" id="staticB1Id">会员可见!</em>
                                <em class="red f-fs2" id="staticB2Id">
                                    <#if goods.price == '0' || goods.price == '0.00'>
                                        <#assign isGoBuy=false>
                                        价格面议
                                    <#else >
                                        ￥${goods.price}&nbsp;
                                    </#if>
                                </em>
                            </div>
                            <div class="pfj_t"><span>市&nbsp;场&nbsp;价</span>
                                <em class="gray f-fs2 f-line" id="staticB3Id">会员可见!</em>
                                <em class="gray f-fs2 f-line" id="staticB4Id"> ￥${goods.marketPrice}&nbsp;</em>
                            </div>
                        </div>
                    <dl>
                        <dt>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</dt>
                        <dd>由 <#if shop.name!=null><a href='${base}/shop/${shop.urlAddress}?pageSize=20'>${shop.name}</a><#else ><em>本商城</em></#if>  发货并提供售后服务
                            <#if shop.qqKeFu??>
                                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${shop.qqKeFuList[0]}&site=qq&menu=yes" >
                                    <img src="http://wpa.qq.com/pa?p=2:${shop.qqKeFuList[0]}:4" alt="客服QQ" align="客服" />
                                </a>
                            </#if>
                            <#if shop.weixinImg??>&nbsp;&nbsp;&nbsp;
                                <a href="javascript:void(0)" onmouseover="display()" onmouseout="disappear()" class="wx">
                                    <img src="${base}/static/img/weixin.jpg" alt="微信二维码" align="微信二维码"  class="wx_ico"/>
                                    <div id="code" onmouseover="display()" onmouseout="disappear()">
                                        <img src="${shop.weixinImg}" alt="微信二维码" align="微信二维码" />
                                    </div>
                                </a>
                            </#if>
                        </dd>
                    </dl>
                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 Start-->
                    <dl>
                        <dt>同类商品</dt>
                        <div class="choose-goods">
                        <#list goodsProductList as gsP>
                            <#if goods.id == gsP.id>
                                <dd class="selected">
                                    <b></b><a title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                </dd>
                            <#else>
                                <dd class="">
                                    <b></b><a href="${base}/item/${gsP.id}.html<#if showView == "success">?showView=true</#if>" title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                </dd>
                            </#if>
                        </#list>
                        </div>
                    </dl>
                        <dl>
                            <ul  id="choose">
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
                                                        <a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">
                                                        ${item.name}<img src="${item.pic}" style="margin-top: 1px;padding-left: 1px;padding-right: 3px" width="16" height="16">
                                                        </a>
                                                    <#else>
                                                        <a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">${item.name}</a>
                                                    </#if>
                                                </div>
                                            </div>
                                            <#assign i = i+1>
                                        </#if>
                                    </#list>
                                </li>
                            </#list>
                            </ul>
                        </dl>
                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 End-->
                    <dl>
                        <dt></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt>购买数量</dt>
                        <dd>
                            <div class="wrap-input f-cb" style="width: 300px; height: 32px; line-height: 32px;">

                                <#if goods.stock <= 0>
                                    <a class="numbtn" title="减少数量">－</a>
                                    <input class="text" id="buy-num" disabled style="float: left"
                                           value="<#if goods.enableBatchPrice == '1'>${goods.startBatchNum}<#else>${goods.startNum}</#if>"
                                           onkeyup="if(this.value.length==0){this.value=this.value.replace(/[^0-9]/g,'');disableBtn();}else{this.value=this.value.replace(/\D/g,'');chengeBatchPriceByBuyNum();disableBtn();}"
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'';chengeBatchPriceByBuyNum();disableBtn();)}else{this.value=this.value.replace(/\D/g,'');chengeBatchPriceByBuyNum();disableBtn();}"
                                           onchange="changeNum()"/>
                                    <a class="numbtn" title="增加数量">＋</a>
                                    <div style="color: red;font-size: 14px;font-weight: bold; margin-left: 15px; float: left; margin-top: 3px;">[无货]</div>
                                <#else>
                                    <a href="javascript:void(0);" onclick="reduce();" class="numbtn" title="减少数量">－</a>
                                    <input class="text" id="buy-num" style="float: left"
                                           value="<#if goods.enableBatchPrice == '1'>${goods.startBatchNum}<#else>${goods.startNum}</#if>"
                                           onchange="changeNum();"
                                           onkeyup="if(this.value.length==0){this.value=this.value.replace(/[^0-9]/g,'');disableBtn();}else{this.value=this.value.replace(/\D/g,'');chengeBatchPriceByBuyNum();disableBtn();}"
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'';chengeBatchPriceByBuyNum();disableBtn();)}else{this.value=this.value.replace(/\D/g,'');chengeBatchPriceByBuyNum();disableBtn();}"/>
                                    <a href="javascript:void(0);" onclick="add();" class="numbtn" title="增加数量">＋</a>
                                </#if>
                            </div>
                        </dd>
                    </dl>
                    <dl id="choose">
                        <ul>
                        <li id="choose-result" style="display: block">
                            <div class="dt"></div>
                            <div class="dd">
                                <em>已选择</em>
                                <strong></strong>
                            </div>
                        </li>
                        </ul>
                    </dl>
                    <dl class="gm">
                        <dt>&nbsp;</dt>
                        <#if goods.isMarketable != 0 && goods.isDelete != '0'>
                        <#--<#if priceHide ="hide" >-->
                            <#--<dd id="buyHideId">
                                <a id="goBuyUrl" href="javascript:login();" class="pro_gms">立即购买</a>
                                <a id="InitCartUrl" href="javascript:login();" class="pro_gms pro_gwcs">加入购物车</a>
                            </dd>-->
                        <#--<#else >-->
                            <#if goods.stock <= 0 || isGoBuy == false>
                                <dd id="stockzeroId">
                                    <button id="goBuyUrl"  class="pro_gms">立即购买</button>
                                    <button id="InitCartUrl"  class="pro_gms pro_gwcs">加入购物车</button>
                                </dd>
                            <#else>
                                <dd id="stocknozeroId">
                                    <button id="goBuyUrl" onclick="addCart('${goods.id}', $('#buy-num').val(),'goBuy');" class="pro_gm">立即购买</button>
                                    <button id="InitCartUrl" onclick="addCart('${goods.id}', $('#buy-num').val(),'add');" class="pro_gm pro_gwc">加入购物车</button>
                                </dd>
                            </#if>
                        <#--</#if>-->
                        <#--<#elseif goods.isMarketable == 0>-->
                        <#--<a class="btn-append" id="InitCartUrl" href="javascript:void(0);" alt="已下架">已下架<b class="btn-append-disable"></b></a>-->
                        </#if>
                    </dl>
                    <dl>
                        <div class="attention-shop"><a onclick="addGoodsAttention('${goods.id}',this);" href="javascript:void(0);">关注该商品</a></div>
                    </dl>
                </div>
            </div>
            <div class="pr">
                <h2>看了又看</h2>
                <div id="box_wwwzzjs_net">
                    <span id="his_up" class="up">up</span>
                    <span id="his_down" class="down">down</span>
                    <div id="his_list">
                        <ul class="list_wwwzzjsnet" id="list_wwwzzjsnet">
                        <#--<#list hisList as his>-->
                            <#--<li id="${his.id}" order="0">-->
                                <#--<a href="${base}/item/${his.goodsId}.html" target="_blank"><img alt="${his.name}" src="${his.image}" title="${his.name}" /></a>-->
                                <#--<a href="${base}/item/${his.goodsId}.html" target="_blank" title="${his.name}" class="pro_info">${his.name}</a>-->
                                <#--<p>-->
                                    <#--<#if priceHide ="hide" >-->
                                        <#--会员可见!-->
                                    <#--<#else >-->
                                        <#--<#if his.sn != null && his.sn != "" && his.sn != "0.00~0.00">-->
                                            <#--¥${his.sn}&nbsp;-->
                                        <#--<#else >-->
                                            <#--¥${his.price}&nbsp;-->
                                        <#--</#if>-->
                                    <#--</#if>-->
                                <#--</p>-->
                            <#--</li>-->
                            <#--</#list>-->
                        </ul>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <!--main-->
    <div class="main f-cb">
        <div class="ml">
            <div class="mltit">大家还买了</div>
            <ul class="mlpic" id="staticCId">
                <#list goodslist as gl>
                <li index="0" sku="${gl.id}" selfservice="0">
                    <a target="_blank" href="${base}/item/${gl.id}.html">
                        <img alt="${gl.fullName}" src="${gl.pic}" title="${gl.fullName}">
                    </a>
                    <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.fullName}" class="pro_info">${gl.fullName}</a>
                    <p>会员可见!</p>
                <#--<#if priceHide ="hide" >-->
                <#--会员可见!-->
                <#--<#else >-->
                <#--<#if gl.sn != null && gl.sn != "" && gl.sn != "0.00~0.00">-->
                <#--¥${gl.sn}&nbsp;-->
                <#--<#else >-->
                <#--¥${gl.price}&nbsp;-->
                <#--</#if>-->
                <#--</#if>-->
                    <p>
                        <#if gl.sn != null && gl.sn != "" && gl.sn != "0.00~0.00">
                            ¥${gl.sn}&nbsp;
                        <#else >
                            <#if gl.price == '0' || gl.price == '0.00'>
                                    价格面议
                            <#else>
                                ¥${gl.price}&nbsp;
                            </#if>
                        </#if>
                    </p>
                </li>
                </#list>
            </ul>
        </div>
        <div class="mr">
            <div id="tabsbox" class="tabsbox">
                <ul class="tab_nav">
                    <li><a href="#tab0" class="selected">商品详情</a></li>
                    <li><a href="#tab1">规格参数</a></li>
                    <li><a href="#tab2">用户评价<span class="red" id="reviewSizeId"></span></a></li>
                    <!--li><a href="#tab4">服务保障</a></li-->
                </ul>
                <div class="tabscont">
                    <div id="tab0">
                        <ul class="detail_list">
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
                        <div class="pro_content">
                            ${goods.introduction}
                        </div>
                    </div>
                    <div id="tab1">
                        <div class="canshu">
                            <table cellpadding="0" cellspacing="0">
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
                                            <th class="tdTitle" colspan="2"><b>${key?substring(key?index_of("_")+1)}</b></th>
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
                    </div>


                    <div id="tab2">
                        <div class="grade_bar">
                            <div class="level-mark f-fl">
                                <div class="score"> <strong class="red" id="avgpj">0</strong>分</div>
                                <div class="star"><span class="bar" id="avgrating" style=""></span></div>
                            </div>
                            <div class="level-view f-fl">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tbody>
                                    <tr>
                                        <td align="right">满意</td>
                                        <td><div class="level"><span class="bar" id="haoping_rating" style=""></span></div></td>
                                        <td><span id="haoping_tip"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">一般</td>
                                        <td><div class="level"><span class="bar" id="zhongping_rating" style=""></span></div></td>
                                        <td><span id="zhongping_tip"></span></td>
                                    </tr>
                                    <tr>
                                        <td align="right">不满意</td>
                                        <td><div class="level"><span class="bar" id="chaping_rating" style=""></span></div></td>
                                        <td><span id="chaping_tip"></span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tip-txt f-fl">
                                <div><p>您可对已购商品进行评价</p></div>
                                <div class="gold"><a href="${base}/order/review?goodsId=${goods.id}" target="_blank" title="发评价" class="btn">发评价</a></div>
                            </div>
                        </div>
                        <div id="tabsbox1" class="tabsbox">
                            <ul class="comment_nav">
                                <li><a href="#tab5" class="selected">全部评价<span class="red">(<span id="totalReview"></span>)</span></a></li>
                                <li><a href="#tab6">好评<span class="gray">(<span id="haopingCnt"></span>)</span></a></li>
                                <li><a href="#tab7">中评<span class="gray">(<span id="zhongpingCnt"></span>)</span></a></li>
                                <li><a href="#tab8">差评<span class="gray">(<span id="chapingCnt"></span>)</span></a></li>
                            </ul>
                            <div class="tabscont">
                                <div id="tab5">
                                    <div id="comments-all" class="comment-table"></div>
                                </div>
                                <div id="tab6">
                                    <div id="comments-haoping" class="comment-table"></div>
                                </div>
                                <div id="tab7">
                                    <div id="comments-zhongping" class="comment-table"></div>
                                </div>
                                <div id="tab8">
                                    <div id="comments-chaping" class="comment-table"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#--<div id="tab4">
                        <div class="service">
                            <dl>
                                <dt>配送服务</dt>
                                <dd>
                                    <div class="tip-txt">我们提供体验馆配送、物流点自提、快递运输三种配送方式，您可根据需求选择最合适的配送服务。</div>
                                </dd>
                                <dd>
                                    <div class="tip-txt">由快递公司送货到您所留的收货地址楼下。请您务必在签收前当场拆包检查，如有购买多件商品请一定拆开清点件数，拆包后如发现商品损坏请当场拒收并及时与我们联系，商品货损与总件数以您签收为准，如果条件允许请您拍照取证。</div>
                                </dd>
                                <dd>
                                    <div class="tip-txt">我们提供体验馆配送、物流点自提、快递运输三种配送方式，您可根据需求选择最合适的配送服务。</div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>贴心包装</dt>
                                <dd> <img src="static/bec/project/gwq/images/temp/p40.png"> </dd>
                            </dl>
                            <dl>
                                <dt>售后服务</dt>
                                <dd>
                                    <div class="tip-txt">所有商品，美乐乐将严格按照国家三包法等有关法律、法规为您提供质保服务。家具类产品、木地板产品、定制门产品、灯饰 照明类、厨卫装修类、五金工具类和五金电器类产品：1年，详情请见《家具保修》，《建材保修政策》；瓷砖和墙纸无质保期。</div>
                                </dd>
                                <dd>
                                    <div class="tip-txt">由快递公司送货到您所留的收货地址楼下。请您务必在签收前当场拆包检查，如有购买多件商品请一定拆开清点件数，拆包后如发现商品损坏请当场拒收并及时与我们联系，商品货损与总件数以您签收为准，如果条件允许请您拍照取证。</div>
                                </dd>
                                <dd>
                                    <div class="tip-txt">我们提供体验馆配送、物流点自提、快递运输三种配送方式，您可根据需求选择最合适的配送服务。</div>
                                </dd>
                            </dl>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
    </div>
    </#if>
</div>
<script type="text/javascript" src="${base}/static/bec/project/gwq/js/product.js"></script>
<!--购买数量所用js-->
<script type="text/javascript">
    $('.spinnerExample').spinner({});
</script>
<!--切换面板插件-->
<script type="text/javascript">
    $("#tabsbox ul").idTabs("tabs0");
</script>
<script type="text/javascript">
    $(function() {
        //评价
        judgeBtnAuth('${base}', 'review', 'review_btn');
        //----------------------看了又看点击原点切换---------------
        $($(".pr_dian .on").attr("link")).fadeIn();
        $(".pr_dian span").click(function() {
            $($(".pr_dian .on").attr("link")).hide();
            $(".pr_dian .on").removeClass("on");
            $(this).addClass("on");
            $($(this).attr("link")).fadeIn(200);
        });
        //----------------------看了又看点击原点切换---------------
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


        showOrHidePrice();
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    /*$("#login").hide();
                    $("#loginAfter").show();*/
                    $("#lg_nickeName").text('Hi! '+data.m.realName);
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                    /*$(".nologin_price").hide();
                    $(".login_price").show();*/

                    getGetCommendGoods('1');
//                    getHistoryGoods();
                    getMaxSalesCountGoods('1');
                    getgoodsPriceOrbeatch('1');

                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                    $(".nologin_price").show();
                    $(".login_price").hide();

                    getGetCommendGoods('2');
                    getMaxSalesCountGoods('2');
                    getgoodsPriceOrbeatch('2');
                }

            }
        });

//        $(".jqzoom").jqueryzoom({
//            xzoom: 400,
//            yzoom: 400,
//            offset: 10,
//            position: "right",
//            preload: 1,
//            lens: 1
//        });
//        $("#spec-list").jdMarquee({
//            deriction:"left",
//            width:360,
//            height:61,
//            step:5,
//            speed:5,
//            delay:10,
//            control:true,
//            _front:"#spec-right",
//            _back:"#spec-left"
//        });
//        $("#spec-list img").bind("mouseover",function(){
//            var src=$(this).attr("src");
//            $("#spec-n1 img").eq(0).attr({
//                src:src.replace("\/n5\/","\/n1\/"),
//                jqimg:src.replace("\/n5\/","\/n0\/")
//            });
//            $(this).css({
//                "border":"2px solid #e4393c",
//                "padding":"1px"
//            });
//        }).bind("mouseout",function(){
//            $(this).css({
//                "border":"1px solid #ccc",
//                "padding":"2px"
//            });
//        });

        selectedSp();

        $('#choose .item').bind('click', function () {
            selectedSps($(this));
        });

        $("#his_list").jdMarquee({
            deriction:"up",
            width:138,
            height:420,
            step:2,
            speed:5,
            delay:10,
            control:true,
            _front:"#his_up",
            _back:"#his_down"
        });


        $("#tabsbox ul").idTabs();
        initReviewCount();
        getGoodsReviewSize($("#goodsId").val());
    <#--<#if goodsReviewList?? && goodsReviewList?size &gt; 0>-->
    <#--countReviewRate();-->
    <#--</#if>-->

//评价
        judgeBtnAuth('${base}', 'review', 'review_btn');
    });
    /**
     * 获取浏览历史
     */
    function getHistoryGoods(){
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/goods/ajaxGethistory',
            success: function(data) {
                var allHtml = "";
                if( data.status == 'success' ){
                    $.each(data.list, function(i, item) {
                        if(item !="" && item !=undefined){
                            allHtml +="<li id='"+item.id+"' order='0'>";
                            allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.goodsId+".html' target='_blank'><img alt='"+item.name+"' src='"+item.image+"' title='"+item.name+"' /></a>";
                            allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.goodsId+".html' target='_blank' title='"+item.name+"' class='pro_info'>"+item.name+"</a>";
                            allHtml +="<p>";
                            if(!isEmpty(item.sn) && item.sn != '0.00~0.00'){
                                allHtml +="￥"+item.sn+"&nbsp;";
                            }else{
                                if(item.price == 0){
                                    allHtml +="价格面仪";
                                }else{
                                    allHtml +="￥"+item.price+"&nbsp;";
                                }
                            }
                            allHtml +="</p></li>";
                        }
                    });
                    $("#list_wwwzzjsnet").append(allHtml);
                }else{
                }

            }
        });
    }

    function showOrHidePrice(){
        $("#staticAId").hide();
        $("#staticBId").hide();

        $("#staticA1Id").hide();
        $("#staticA2Id").hide();
        $("#staticB2Id").hide();
        $("#staticB4Id").hide();

        $("#staticB1Id").hide();
        $("#staticB3Id").hide();

        $("#choose-result").hide();
    }

    /**
     * type(1:登录成功, 2:登录失败或未登录)
     */
    function getgoodsPriceOrbeatch(type){
        var isMarketableId = $("#isMarketableId").val();//是否上架
        var stockId = $("#stockId").val();//库存

        if(type == '1'){
            if($("#goodsBatchPriceId").val()=="1"){//启用批发价
                $("#staticAId").show();
                $("#staticA2Id").show();
            }else if($("#goodsBatchPriceId").val()=="0") {//禁用批发价
                $("#staticBId").show();
                $("#staticB2Id").show();
                $("#staticB4Id").show();

                $("#staticB1Id").hide();
                $("#staticB3Id").hide();
            }


            $("#staticCId > li").each(function(){
                $(this).find("p:eq(0)").hide();
            });

            if(isMarketableId == "1"){
                $("#buyHideId").hide();
            }

            if(stockId <= 0){
                $("#stocknozeroId").hide();
            }else{
                $("#stockzeroId").hide();
            }
        }else{

            $("#staticAId").show();
            $("#staticBId").show();

            $("#staticA2Id").hide();
            $("#staticB2Id").hide();
            $("#staticB4Id").hide();

            $("#staticB1Id").show();
            $("#staticA1Id").show();
            $("#staticB3Id").show();


            $("#staticCId > li").each(function(){
                $(this).find("p:eq(1)").hide();
            });

            if(isMarketableId == "1"){
                $("#stockzeroId").hide();
                $("#stocknozeroId").hide();
            }
        }
    }


    /**
     * 更改购买数量，显示对应的 批发价
     */
    function chengeBatchPriceByBuyNum(){
    <#--var buyNum = $('#buy-num');-->
    <#--$.ajax({-->
    <#--type: 'post',-->
    <#--url: '${base}/goods/getGoodsDetailBatchPrice/${goods.id}/'+buyNum.val(),-->
    <#--success: function(data) {-->
    <#--if(data.status == 'success'){-->
    <#--$("#batchPriceId").text(data.batchPrice);-->
    <#--}else{-->
    <#--$(".batchPriceChenge").text('');-->
    <#--}-->
    <#--}-->
    <#--});-->
    }
    <#if goods.stock??  || goods.stock &gt; 0>
    function reduce() {
        //包装系数 TianYu 2016-2-17 09:19:00
        var goodsId = $("#goodsId").val();
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus").val();
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum").val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum").val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice").val());

        var nowGoodsNum = $('#buy-num').val();

        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId").val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(reduceGoodsNum % defPackageModulus != 0){
            var i = parseInt(reduceGoodsNum / defPackageModulus);
            reduceGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }


        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                reduceGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                reduceGoodsNum = defLimitNum;
            }
            $("#buy-num").val(reduceGoodsNum);
        <#--if(ifBatchPrice == '1'){-->
            <#--$.ajax({-->
                <#--type: "get",-->
                <#--url: "${base}/cart/ajaxGetGoodsBatchPrice",-->
                <#--data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),-->
                <#--success: function(data) {-->
                    <#--if(data.status=='success'){-->
                        <#--$("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));-->
                    <#--}-->
                <#--}-->
            <#--});-->
        <#--}-->
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(reduceGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(defStartBatchNum % defPackageModulus != 0){
                    var i = parseInt(defStartBatchNum / defPackageModulus);
                    reduceGoodsNum = ( i + 1 ) * defPackageModulus;
                }else{
                    reduceGoodsNum = defStartBatchNum;
                }
                $("#buy-num").val(reduceGoodsNum);
//                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+reduceGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#buy-num").val(reduceGoodsNum);
//                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
        }else{//无批发价时
            if(reduceGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#buy-num").val( defStartBatchNum );
                return;
            }else{
                $("#buy-num").val(parseInt(reduceGoodsNum));
            }
        }

        chengeBatchPriceByBuyNum();
        disableBtn();
    }
    function add() {
        //包装系数 TianYu 2016-2-17 09:19:00
        var goodsId = $("#goodsId").val();
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus").val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum").val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum").val());
        //默认起批价格
        var defStartBatchPrice = $("#defStartBatchPrice").val();
        //当前商品数量
        var nowGoodsNum = $('#buy-num').val();


        //加1之后的商品数量
        //修改默认值为1的情况下 手动输入和点击加号算法不一致的情况  yuech 2016-02-23 14:23
        var addGoodsNum = parseInt(nowGoodsNum) + defPackageModulus;
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId").val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(addGoodsNum % defPackageModulus != 0){
            addGoodsNum = (parseInt(addGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }
        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                addGoodsNum = defLimitNum;
            }
            $("#buy-num").val(addGoodsNum);
            /*if(ifBatchPrice == '1'){
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
            }*/
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                if(defLimitNum % defPackageModulus != 0){
                    var i = parseInt(defLimitNum / defPackageModulus);
                    addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
                }else{
                    addGoodsNum = defLimitNum;
                }
                $("#buy-num").val(addGoodsNum);
//                $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#buy-num").val(parseInt(addGoodsNum));
//                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
        }else{//无批发价时
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于100000!", {icon: 7});
                $("#buy-num").val(1);
                return;
            }else{
                $("#buy-num").val(parseInt(addGoodsNum));
            }
        }
        chengeBatchPriceByBuyNum();
        disableBtn();
    }

    function changeNum(){

        if(isNaN(parseInt($("#buy-num").val()))) { // 20160426 dzz 判断当前商品数量是否为数字
            layer.alert("商品数量不能为空且不能小于起批数量!", {icon: 7});
            $("#buy-num").val(parseInt($("#defStartBatchNum").val()));
            return;
        }

        //包装系数 TianYu 2016-2-17 09:19:00
        var goodsId = $("#goodsId").val();
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus").val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum").val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum").val());
        //默认起批价格
        var defStartBatchPrice = $("#defStartBatchPrice").val();
        //当前商品数量
        var nowGoodsNum = $('#buy-num').val();
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId").val();

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
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                nowGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                nowGoodsNum = defLimitNum;
            }
            $("#buy-num").val(nowGoodsNum);
            /*if(ifBatchPrice == '1'){
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
            }*/
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断改变之后的数量是否小于起批数量
            if(nowGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(defStartBatchNum % defPackageModulus != 0){
                    var i = parseInt(defStartBatchNum / defPackageModulus);
                    nowGoodsNum = ( i + 1 ) * defPackageModulus;
                }else{
                    nowGoodsNum = defStartBatchNum;
                }
                $("#buy-num").val(nowGoodsNum);
//                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else if(nowGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                if(defLimitNum % defPackageModulus != 0){
                    var i = parseInt(defLimitNum / defPackageModulus);
                    nowGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
                }else{
                    nowGoodsNum = defLimitNum;
                }
                $("#buy-num").val(nowGoodsNum);
//                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+nowGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#buy-num").val(nowGoodsNum);
//                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
        }else{//无批发价时
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#buy-num").val( defStartBatchNum );
                return;
            }else{
                $("#buy-num").val(parseInt(nowGoodsNum));
            }
        }
        chengeBatchPriceByBuyNum();
        disableBtn();
    }

    function disableBtn(){
        var buyNum = $('#buy-num');
        if(buyNum.val()==0){
            $("#goBuyUrl").attr("disabled","disabled");
            $("#InitCartUrl").attr("disabled","disabled");
        }else{
            $("#goBuyUrl").attr("disabled",false);
            $("#InitCartUrl").attr("disabled",false);
        }
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
        $("#haoping_tip").html(haopinglv.toPercent() + "%");
        $("#haoping_rating").attr("style", "width:" + haopinglv.toPercent() + "%");
        $("#zhongping_tip").html(zhongpinglv.toPercent() + "%");
        $("#zhongping_rating").attr("style", "width:" + zhongpinglv.toPercent() + "%");
        $("#chaping_tip").html(chapinglv.toPercent() + "%");
        $("#chaping_rating").attr("style", "width:" + chapinglv.toPercent() + "%");
    }

    /**
     * 计算并展示评价内容
     */
    function countReviewRate() {
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
                var scoreCount=0;
                var huifuHtml = "";
                $('#totalReview').text(data.length);
                var start="<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody> ";
                var end="</tbody></table>";
                $.each(data, function(i, review) {
                    var score = parseInt(review.score);
                    scoreCount +=score;

                    huifuHtml = '';
                    if(review.maps != 'undefined' && review.maps != undefined && review.maps != ''){
                        $.each(review.maps, function(i, item) {
                            if(item !="" && item !=undefined){
                                huifuHtml +='<div class="reply">';
                                huifuHtml +='<div class="arrow"></div>';
                                huifuHtml +='<div class="text"><strong>商家回复：</strong>'+item.replyContent+'</div>';
                                huifuHtml +='<div class="time"><strong>回复时间：</strong>'+item.replyDate+'</div>';
                                huifuHtml +='</div>';
                            }
                        });
                    }
                    if (score > 3) {
                        haopingList.push(review);
                        haopingHtml += makeHtml(review,huifuHtml);
                    } else if (score > 1 && score < 4) {
                        zhongpingList.push(review);
                        zhongpingHtml += makeHtml(review,huifuHtml);
                    } else if (score < 2) {
                        chapingList.push(review);
                        chapingHtml += makeHtml(review,huifuHtml);
                    }
                    allHtml +=makeHtml(review,huifuHtml);

                });
                if(data.length>=1) {
                    $("#avgpj").text((scoreCount/data.length).toFixed(1));
                    $("#avgrating").attr("style", "width:" +((scoreCount/data.length).toFixed(2)/5).toPercent()+"%");
                } else {
                    $("#avgpj").text(0);
                    $("#avgrating").attr("style", "width:" + 0 +"%");
                }

                $('#haopingCnt').text(haopingList.length);
                $('#zhongpingCnt').text(zhongpingList.length);
                $('#chapingCnt').text(chapingList.length);
                $(start+allHtml+end).appendTo(all_comments_list);
                $(start+haopingHtml+end).appendTo(haoping_comments_list);
                $(start+zhongpingHtml+end).appendTo(zhongping_comments_list);
                $(start+chapingHtml+end).appendTo(chaping_comments_list);
            }
        });
    }
    function makeHtml(review,objHtml){
        var html="";
        html +='<tr>';
        html +='<td class="user-label"><div class="avatar"><img src="${base}/static/bec/project/gwq/images/product_info/header.png" width="56" height="56"></div>';
        html +='<p class="name"><span class="">'+review.nickName+'</span></p>';
        //html +='<p class="extend"><span class="red">黄金会员</span></p>
        html +='</td>';
        html +='<td class="c-content"><div class="c-tip clearfix">';
        html +='<div class="score f-fl"><span class="star"><span class="bar" style="width:'+(review.score/5).toPercent()+'%;"></span></span><span>'+parseInt(review.score)+'分</span></div>';
        html +='<div class="time f-fr">评论时间：&nbsp;'+review.cdStr+'</div>';
        html +='</div>';
        html +='<p>'+review.content+'</p>';
        if(objHtml !="" && objHtml !=undefined){
            html +=objHtml;

        }
        html +='</td>';
        html +='</tr>';
        return html;
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

    /**
     * 选择规格
     */
    function chekedSp(spId,itemId,itemName){
        $("#choose-result").show();

        $('#' +spId).val(itemName);
        $('.item').removeClass("selected");
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
            $('#choose-result .dd strong').html(selectedText);
        } else {
            $('#choose-result').html("");
        }
    }

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
                    if(parseInt(result.goodsReviewSize) > 0){
                        countReviewRate();
                    }
                }else{
                    $("#reviewSizeId").text("("+0+")");
                }
            }
        });

    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }

    /**
     * 获取爆款商品
     */
    function getGetCommendGoods(obj){
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/goods/ajaxGetCommend',
            success: function(data) {
                var allHtml = "";
                if( data.status == 'success' ){
                    $.each(data.list, function(i, item) {
                        if(item !="" && item !=undefined){
                            if(i == 0){
                                allHtml +="<ul id='tabs1' style='display: none;'>";
                            }

                            if(i == 2){
                                allHtml +="<ul id='tabs2'  style='display: block;'>";
                            }

                            if(i == 4){
                                allHtml +="<ul id='tabs3'  style='display: none;'>";
                            }

                            allHtml +="<li id='"+item.id+"' order='0'>";


                            allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.id+".html' target='_blank'><img alt='"+item.name+"' src='"+item.image+"' title='"+item.name+"' /></a>";
                            allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.id+".html' target='_blank' title='"+item.name+"' class='pro_info'>"+item.name+"</a>";
                            allHtml +="<p class='tm'>条码："+item.barcode+"</p>";

                            if(obj == '1'){
                                allHtml +="<p>";
                                if(!isEmpty(item.sn) && item.sn != '0.00~0.00'){
                                    allHtml +="￥"+item.sn+"&nbsp;";
                                }else{
                                    allHtml +="￥"+item.price+"&nbsp;";
                                }
                                allHtml +="</p></li>";
                            }else{
                                allHtml +="<p>会员可见";
                                allHtml +="</p></li>";
                            }

                            if( (i+1) % 2 == 0 ){
                                allHtml +="</ul>";
                            }

                        }
                    });
                    $("#list_wwwzzjsnet").append(allHtml);
                }else{
                }

            }
        });
    }

    /**
     * 获取销量
     */
    function getMaxSalesCountGoods(obj){
        var id = $("#djhmlId").val();
        if(!isEmpty(id)){
            $.ajax({
                type: 'post',
                async: false,
                data: "ajaxCatelogId="+id+"&r="+ new Date(),
                url: '${base}/goods/ajaxGetMaxSalesCountGoods',
                success: function(data) {
                    var allHtml = "";
                    if( data.status == 'success' ){
                        $.each(data.list, function(i, item) {
                            if(item !="" && item !=undefined){
                                allHtml +="<li index='0' sku='"+item.id+"' selfservice='0'>";


                                allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.id+".html' target='_blank'><img alt='"+item.fullName+"' src='"+item.pic+"' title='"+item.fullName+"' /></a>";
                                allHtml +="<a href='"+$("#baseId").val()+"/item/"+item.id+".html' target='_blank' title='"+item.fullName+"' class='pro_info'>"+item.fullName+"</a>";
                                allHtml +="<p class='tm'>条码："+item.barcode+"</p>";

                                if(obj == '1'){
                                    allHtml +="<p>";
                                    if(!isEmpty(item.sn) && item.sn != '0.00~0.00'){
                                        allHtml +="￥"+item.sn+"&nbsp;";
                                    }else{
                                        allHtml +="￥"+item.price+"&nbsp;";
                                    }
                                    allHtml +="</p></li>";
                                }else{
                                    allHtml +="<p>会员可见";
                                    allHtml +="</p></li>";
                                }

                            }
                        });
                        $("#webuyId").append(allHtml);
                    }else{
                    }

                }
            });
        }
    }
</script>
<script type="text/javascript" language="javascript" >
    <!--
    function display(){
        document.getElementById("code").style.display="block";
    }
    function disappear(){
        document.getElementById("code").style.display="none";
    }
    -->
</script>
<#include "bec/jp/service.ftl"/>
    <#include "bec/jp/foot.ftl"/>