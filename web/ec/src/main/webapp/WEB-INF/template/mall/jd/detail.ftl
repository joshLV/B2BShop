<!DOCTYPE html>
<html>
<head>
    <title>${goods.fullName} - <@spring.message "project_name"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/css/goods_detail.css" rel="stylesheet" type="text/css" />
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/mall/nsc/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>
    <link href="${base}/static/css/cloud-zoom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"detail"};</script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>

<#if !goods??>
<div id="refresh" class="content">
        <style type="text/css">#refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}</style>
        不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
</div>
<#else>
<!--面包屑导航-->
<style>
    .breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
    .breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
    <div class="breadcrumb">
        <#if breadcrumbCatList?? && breadcrumbCatList?size &gt; 0>
            <#assign c = breadcrumbCatList?first>
            <h1><a href="${base}/list/${c['l1_id']}.html">${c['l1_name']}</a></h1>
            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}.html">${c['l2_name']}</a></span>
            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}-${c['l3_id']}.html">${c['l3_name']}</a></span>
        </#if>
    </div>
    <!-- 左边相关分类 -->
    <div class="left" style="float: left">
        <div id="related-sorts" class="m m2">
            <div class="mt">
                <h2>相关分类</h2>
            </div>
            <div class="mc">
                <ul class="lh">
                <#if refCatelogList?? && refCatelogList?size &gt; 0>
                <#list refCatelogList as cat>
                    <li><a href="${base}/list/${c['l1_id']}-${cat.parentId}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                </#list>
                </#if>
                </ul>
            </div>
        </div>
        <div id="related-brands" class="m m2">
            <div class="mt">
                <h2>同类其他品牌</h2>
            </div>
            <div class="mc">
                <ul class="lh">
                    <#if brandRefList?? && brandRefList?size &gt; 0>
                    <#list brandRefList as brand>
                        <li><a href="#" title="${brand.name}（${brand.sign}）">${brand.name}</a></li>
                    </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>

    <!-- 商品介绍 -->
    <div style="margin-left: 13px;float: left;width: 618px;min-width: 618px">
        <!-- 简要说明 -->
        <div id="product-intro" style="min-height: 430px">
            <input type="hidden" value="${goods.id}">
            <div id="name" style="width: 618px">
                <h1 ><#if goods.isMarketable == 0><span style="color: red;">[已下架]&nbsp;&nbsp;&nbsp;</span></#if>${goods.fullName}</h1>
                <strong></strong>
            </div>
            <!-- 简单介绍 -->
            <div class="clearfix">
                <ul id="summary">
                    <li id="summary-price">
                        <div class="dt">商&nbsp;城&nbsp;价：</div>
                        <div class="dd" style=";margin-top: 3px">
                            <strong class="p-price" id="weipu-price">￥${goods.price}&nbsp;</strong><#--<a id="notice-downp" href="#" target="_blank">(降价通知)</a>-->
                        </div>
                    </li>
                    <li id="summary-price">
                        <div class="dt">市&nbsp;场&nbsp;价：</div>
                        <div class="dd" style=";margin-top: 3px">
                            <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${goods.marketPrice}&nbsp;</span>
                        </div>
                    </li>
                    <li id="summary-market">
                        <div class="dt">商品编号：</div>
                        <div class="dd">${goods.sn}</div>
                    </li>
                    <li id="summary-promotion" class="hide">
                        <div class="dt">计量单位：</div>
                        <div class="dd">${goods.unit}</div>
                    </li>
                    <li id="summary-service">
                        <div class="dt">服　　务：</div>
                        <div class="dd">由 ${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}'>${shop.name}</a>","本商城")} 发货并提供售后服务。</div>
                    </li>
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
                    <#-- 用js来渲染选中效果 -->
                    <#--<script type="text/javascript">
                        var currSpItems = ${currSpItems};
                        $.each(currSpItems, function (i, n) {
                            $('#' + n.content + '_item').parent().addClass('selected');
                        });
                        // 去掉重复的规格项
                        var temp = '';
                        $('#choose li a').each(function () {
                            if (temp.indexOf($(this).text()) != -1)
                                $(this).parent().parent().remove();
                            temp += $(this).html();
                        });
                    </script>-->
                    <li id='choose-type'></li>
                    <li id="choose-amount">
                        <div class="dt">购买数量：</div>
                        <div class="dd">
                            <div class="wrap-input" style="width: 100px">
                                <div onclick="reduce();" title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 15px;height: 15px;font-size: 15px;margin-left: -18px;margin-top: 2.4px;margin-right: 3px">－</div>
                                <input class="text" id="buy-num" value="1" style="float: left" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                                <div onclick="add();" title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 15px;height: 15px;font-size: 15px;margin-top: 2.4px;margin-left: 3px">＋</div>
                            </div>
                        </div>
                    </li>
                    <li id="choose-result" style="display: block">
                        <div class="dt"></div>
                        <div class="dd">
                            <em>已选择</em>
                            <strong></strong>
                        </div>
                    </li>
                    <script type="text/javascript">
                        /* var selectedText = "“";
                         var selected = $('#choose .selected');
                         var choose_result = $('#choose-result .dd strong');
                         $.each(selected, function (i, n) {
                             selectedText += $(n).children('a').text();
                             if (i < selected.length - 1) {
                                 selectedText += "，"
                             }
                         });
                         selectedText += "”";
                         if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
                             choose_result.html(selectedText);
                         } else {
                             $('#choose-result').html("");
                         }*/
                    </script>
                    <li id="choose-btns">
                        <div id="choose-btn-append" class="btn">
                            <#if goods.isMarketable == 1>
                            <a class="btn-append " id="InitCartUrl" onclick="addCart('${goods.id}', $('#buy-num').val());" href="javascript:void(0);">加入购物车<b></b></a>
                            <script type="text/javascript">
                                function addCart(goodsId, cnt) {
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
                                        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href
                                    }
                                }
                            </script>
                            <#elseif goods.isMarketable == 0>
                                <a class="btn-append" id="InitCartUrl" href="javascript:void(0);" alt="已下架">已下架<b class="btn-append-disable"></b></a>
                            </#if>
                        </div>
                        <div id="choose-btn-easybuy" class="btn"></div>
                        <div id="choose-btn-divide" class="btn"></div>
                    <#--<div id="choose-btn-coll" class="btn">-->
                    <#--<a href="#" id="coll988900" onclick="mark(988900,4);" class="btn-coll">加关注<b></b></a>-->
                    <#--</div>-->
                        <div id="Fqfk_Tip" class="Tip360" style="display:none;"></div>
                    </li>
                </ul>
                <span class="clr"></span>
            </div>
            <!-- 图片预览 -->
            <div id="preview">
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                <div id="imgPreview"><!-- onclick="window.open('${firstImg.pic}')" -->
                    <img data-img="1" width="350" height="350" class="cloudzoom" style="border: 1px solid #ddd"
                         src="${firstImg.pic}"
                         alt="${firstImg.title}"
                         data-cloudzoom="zoomImage: '${firstImg.pic}', zoomPosition: 4"/>
                </div>
                <#else>
                <div id="imgPreview">
                    <img data-img="1" width="350" height="350" alt="商家没有上传图片"/>
                </div>
                </#if>

                <div id="spec-list" style="margin-top: 5px">
                    <input type="hidden" id="goodsImgesSize" value="<#if goodsImagesList??>${goodsImagesList?size}<#else>0</#if>">
                    <a href="javascript:;" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-forward" style="z-index: 2"></a>
                    <a href="javascript:;" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-backward" style="z-index: 2"></a>
                    <div class="spec-items">
                        <ul class="lh" style="position: absolute; left: 0px; top: 0px; width: 744px;z-index: 1;">
                            <#list goodsImagesList?sort_by("orderNo") as img>
                                <#assign cls></#assign>
                                <#if img_index == 0>
                                    <#assign cls = "class='img-hover'">
                                </#if>
                                <li><img ${cls} alt="${img.title}" src="${img.pic}"
                                                width="50" height="50"></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 详细信息 -->
        <div id="detail-info">
            <div class="right" style="padding-top: 10px">
                <div id="product-detail" class="m m1" data-widget="tabs" clstag="shangpin|keycount|product|detail" load="true">
                    <div class="float-nav-wrap" style="height: 30px;">
                        <div class="mt" style="height: 30px; width: 988px; border-top: 2px solid #949594;">
                            <ul class="tab">
                                <li data-widget="tab-item" id="p-detail-tab" class="curr"><a href="javascript:;" class="toggle-link">商品介绍</a></li>
                                <li data-widget="tab-item" id="p-attr-tab" class=""><a href="javascript:;" class="toggle-link">相关参数</a></li>
                                <li data-widget="tab-item" id="p-order-tab" class=""><a href="javascript:;" class="toggle-link">关单、检疫合格证、原产地证明</a></li>
                                <li data-widget="tab-item" id="p-review-tab" class=""><a href="javascript:;" class="toggle-link">商品评价<span class="hl_blue"> (${goodsReviewList?size}) </span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div style="border-top: 1px solid #ccc;width: 990px;min-width: 990px"></div>
                    <div id="tab-content">
                        <!-- 商品介绍 -->
                        <div class="mc " data-widget="tab-content" id="p-detail" style="width:990px;min-width: 990px">
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
                            <div class="detail-content">
                                <div style="width: 100%">
                                ${goods.introduction}
                                </div>
                            </div>
                        </div>
                        <!-- 属性参数 -->
                        <div class="mc hide" data-widget="tab-content" id="p-attr" style="width:990px;min-width: 990px">
                            <div class="detail-correction ac" style="border-left: 1px solid #ddd;border-right: 1px solid #ddd"></div>
                            <table cellpadding="0" cellspacing="1" width="100%" border="0" class="Ptable" style="margin-top: 0px">
                                <tbody>
                                    <#list parameterMap?keys as key>
                                    <tr>
                                        <th class="tdTitle" colspan="2"><b>${key}</b></th>
                                    </tr>
                                        <#assign params=parameterMap[key] />
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
                                    </#list>
                                </tbody>
                            </table>
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
                            <div id="comments-list" class="m" data-widget="tabs" load="true" style="width: 988px; border-top: 2px solid #949594;">
                                <div class="mt">
                                    <ul class="tab">
                                        <li data-widget="tab-item" class="curr" onclick="showTab('comments-all')"><a href="javascript:;">全部评价<em>(<span id="totalReview"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-haoping')"><a href="javascript:;">好评<em>(<span id="haopingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-zhongping')"><a href="javascript:;">中评<em>(<span id="zhongpingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-chaping')"><a href="javascript:;">差评<em>(<span id="chapingCnt"></span>)</em></a></li>
                                    </ul>
                                </div>
                                <div id="comments-container" style="border-top: 1px solid #ccc;width: 990px;min-width: 990px">
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
    </div>
</div>
</#if>
<div id="include-foot">
	<span class="clr"></span>
    <#include "mall/jd/service.ftl"/>
    <#include "mall/jd/footer.ftl"/>
</div>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/index.js" type="text/javascript"></script>
</body>
</html>
<script type="text/javascript">
    var reviewClicked = false;
    $(document).ready(function () {

        selectedSp();
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
        CloudZoom.quickStart();

        // 初始化评价视图数据
        initReviewCount();

        // 延时加载评价
        $('#p-review-tab').bind('click', countReviewRate);

        $('#comments-list .tab li').bind('click', function () {
            tabStyle($(this), $('#comments-list li'));
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
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
    }
    function add() {
        var buyNum = $('#buy-num');
        buyNum.val(parseInt(buyNum.val()) + 1);
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
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
                    var haopingList = []; var zhongpingList = []; var chapingList = [];
                    $('#totalReview').text(data.length);
                    $.each(data, function(i, review) {
                        var score = parseInt(review.score);
                        if (score > 3) {
                            haopingList.push(review);
                            haopingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic'>" + "<span class='star sa" + review.score + "' style='margin-bottom: 5px'></span><span class='fr'>评论时间："+review.cdStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>购买日期：</dt>" + "<dd>" + review.buyDateStr+"</dd>" + "</dl>" + "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score > 1 && score < 4) {
                            zhongpingList.push(review);
                            zhongpingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic'>" + "<span class='star sa" + review.score + "' style='margin-bottom: 5px'></span><span class='fr'>评论时间："+review.cdStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>购买日期：</dt>" + "<dd>" + review.buyDateStr+"</dd>" + "</dl>" + "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score < 2) {
                            chapingList.push(review);
                            chapingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic'>" + "<span class='star sa" + review.score + "' style='margin-bottom: 5px'></span><span class='fr'>评论时间："+review.cdStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>购买日期：</dt>" + "<dd>" + review.buyDateStr+"</dd>" + "</dl>" + "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        }
                        allHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic'>" + "<span class='star sa" + review.score + "' style='margin-bottom: 5px'></span><span class='fr'>评论时间："+review.cdStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>购买日期：</dt>" + "<dd>" + review.buyDateStr+"</dd>" + "</dl>" + "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                    });
                    $('#haopingCnt').text(haopingList.length);
                    $('#zhongpingCnt').text(zhongpingList.length);
                    $('#chapingCnt').text(chapingList.length);
                    $(allHtml).appendTo(all_comments_list);
                    $(haopingHtml).appendTo(haoping_comments_list);
                    $(zhongpingHtml).appendTo(zhongping_comments_list);
                    $(chapingHtml).appendTo(chaping_comments_list);
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
        $('#' +itemId).parent().addClass('selected');
        selectedSp();
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
</script>