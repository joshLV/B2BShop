<!--商品详情 -->
<!DOCTYPE html>
<html>
<head>
    <title>${goods.fullName} - <@spring.message "project_name"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>

    <script type="text/javascript">
        $(window).load(function(e) {

            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".u-cates-li").hover(function(e) {
                $(this).css("background","#f0f0f0");
                $(this).addClass("u-cates-over").removeClass(".u-cates-li");
            },function(e){
                $(this).removeClass("u-cates-over").addClass(".u-cates-li");
                $(".u-cates-li:even").css("background-color","#fafafa");
            });
            $('.spec-items .lh li').bind('mouseover', function () {
                previewImg($(this).children('img'));
            });
            $('#spec-backward').bind('click', imgBackward);
            $('#spec-forward').bind('click', imgForward);
            CloudZoom.quickStart();
            /**
             * 鼠标放到缩略图上可以在id=imgPreview的div上显示中型图片效果
             * @param img 鼠标放上去的缩略图对象
             */
            function previewImg(img) {
                var newImgSrc = $(img).attr('src');
                $('#imgPreview img').attr('src', newImgSrc);
                $('#imgPreview').bind('click', function() {
                    window.open(newImgSrc)
                });
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
                if((absLeft + 82*4) >= goodsImgesSize*82 || goodsImgesSize == 0) {
                    $('#spec-backward').addClass('disabled');
                } else {
                    $('.spec-items .lh').css('left', (left - 82) + "px");
                }
                if(goodsImgesSize <= 4) {
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
                if (goodsImgesSize > 4) {
                    $('#spec-backward').removeClass('disabled');
                }
                if (left == 0) {
                    $('#spec-forward').addClass('disabled');
                } else{
                    $('.spec-items .lh').css('left', (left + 82) + "px");
                }
            }
            $("#add").bind('click',function(e) {
                var num=parseInt($("#num").val());
                if(num>=stock){
                    $("#num").val(num);
                }else{
                    $("#num").val(num+1);
                }
            });
            $("#minus").bind('click',function(e) {
                var num=parseInt($("#num").val());
                if(num<=1){
                    $("#num").val(num);
                }else{
                    $("#num").val(num-1);
                }
            });
            $(".m-goods-tabs").idTabs("!mouseover");
            $(".m-goods-tabs a").mouseover(function(e){
                $(".m-goods-tabs li").removeClass("u-selected");
                $(this).parent().addClass("u-selected");
            });
        });
        function addCart(goodsId, cnt) {
            window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href;
        }
        function settlement(goodsId, cnt) {
            window.location.href = "${base}/cart/settlement?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href;
        }
    </script>
    <style type="text/css">
        #refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}
    </style>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="g-hd">
    <#include "${path}/shortcut.ftl"/>
    <#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
    <!-- 商品介绍 -->
        <div class="g-main">
        <#if !goods??>
            <div id="refresh">
                不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
            </div>
        <#else>
            <div class="m-goods-info f-cb">
                <!-- 商品图片轮播器-->
                <div class="f-fl m-goods-pics">
                    <div id="preview">
                        <div id="imgPreview">
                        <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                        <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                            <img data-img="1" width="366" height="346" class="cloudzoom" src="${firstImg.pic}" alt="${firstImg.title}"
                                 data-cloudzoom="zoomImage: '${firstImg.pic}', zoomPosition: 4, zoomMatchSize: true"/>
                        <#else>
                            <img data-img="1" width="366" height="346" alt="商家没有上传图片"/>
                        </#if>
                        </div>
                        <!--轮播器-->
                        <div id="spec-list" style="margin-top: 5px">
                            <input type="hidden" id="goodsImgesSize" value="<#if goodsImagesList??>${goodsImagesList?size}<#else>0</#if>">
                            <a href="javascript:;" name="spec-forward" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-forward" style="z-index:2"></a>
                            <a href="javascript:;" name="spec-backward" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-backward" style="z-index:2"></a>
                            <!--轮播器图片地址集合-->
                            <div class="spec-items">
                                <ul class="lh" style="position: absolute; left: 0px; top: 0px; width:1000px;z-index: 1;">
                                    <#list goodsImagesList?sort_by("orderNo") as img>
                                        <#assign cls></#assign>
                                        <#if img_index == 0>
                                            <#assign cls = "class='img-hover'">
                                        </#if>
                                        <li>
                                            <img ${cls} alt="${img.title}" src="${img.pic}" width="70" height="70">
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--商品信息-->
                <div class="f-fl m-goods-text">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr><#--商品名和介绍-->
                            <td colspan="2"><div class="u-goodname">${goods.fullName}</div>
                                <div class="u-goodname2">${goods.description!'该商品无特别说明'}</div>
                            </td>
                        </tr>
                        <tr><#--商品市场价-->
                            <td width="80" align="right"><strong>市场价：</strong></td>
                            <td class="u-price1"><span>￥${goods.marketPrice}</span></td>
                        </tr>
                        <tr><#--商品商城价-->
                            <td width="80" align="right"><strong>商城价：</strong></td>
                            <td class="u-price2"><span>￥${goods.price}</span></td>
                        </tr>
                        <tr><#--商品总评论条数-->
                            <td width="80" align="right"><strong>商品评价：</strong></td>
                            <td>共${fixed}条评论</td>
                        </tr>
                        <tr><#--商品销售区域及运费-->
                            <td width="80" align="right"><strong>销售区域：</strong></td>
                            <td>陕西省&nbsp;&nbsp;&nbsp;&nbsp;运费：<span>0元</span></td>
                        </tr>
                        <tr><#--商品累计售出数量-->
                            <td width="80" align="right"><strong>累计售出：</strong></td>
                            <td>${fixed}件</td>
                        </tr>
                        <tr><#--购买商品数量-->
                            <td width="80" align="right"><strong>购买数量：</strong></td>
                            <td class="f-cb">
                                <div class="f-fl"><#--数量框-->
                                    <input type="text" name="num" id="num" value="1"
                                           onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                                </div>
                                <div class="f-fl u-addbtn"><#--增加-->
                                    <input type="button" name="add" id="add" value="+" title="增加数量"/><#--减少-->
                                    <input type="button" name="minus" id="minus" value="-" title="减少数量"/>
                                </div>
                                <div class="f-fl">库存：<span id="stock">${fixed}</span>件</div>
                            </td>
                        </tr>
                        <tr><#--最低起订-->
                            <td width="80" align="right"><strong>起订数量：</strong></td>
                            <td>最低起订<span id="setnum">1</span>件</td>
                        </tr>
                        <tr><#--物流-->
                            <td align="left" colspan="2"><span class="u-notices">温馨提示：由
                                <span class="companyname">
                                    ${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}'>${shop.name}</a>","本商城")}
                                </span> 发货并提供售后服务。</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="107" valign="middle" align="left">
                                <#--立即购买-->
                                <a onclick="settlement('${goods.id}', $('#num').val());" href="javascript:void(0);">
                                    <img src="${base}/static/mall/images/goods/001.jpg" width="140" height="55">
                                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <#--加入购物车-->
                                <a id="InitCartUrl" onclick="addCart('${goods.id}', $('#num').val());" href="javascript:void(0);">
                                    <img src="${base}/static/mall/images/goods/002.jpg" width="170" height="55">
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <#--商品分类-->
            <div class="m-goods-content f-cb">
                <#--左下-->
                <div class="f-fl m-goods-left">
                    <div class="m-goods-category">
                        <div class="u-goods-category">商品分类</div>
                    </div>
                    <div class="u-goods-cateinfo">
                        <ul>
                            <#list catelogList as grandfather>
                                <li>
                                    <div class="cate-main"><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></div>
                                    <div class="cate-sub f-cb">
                                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a>
                                            <#if father_index==2><#break></#if>
                                        </#list>
                                    </div>
                                </li>
                            </#list>
                        </ul>
                    </div>
                    <div class="m-goods-category mt20">
                        <div class="u-goods-category">热销商品</div>
                    </div>
                    <div class="u-goods-cateinfo2">
                        <ul>
                            <#list hotList as goods>
                                <li class="f-cb">
                                    <div class="f-fl goods-pic">
                                        <a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
                                            <img src="${goods.pic!}" width="83" height="78" title="${goods.fullName!}" alt="">
                                        </a>
                                    </div>
                                    <div class="f-fl goods-info"> <a href="#">${(goods.fullName)!}</a><br>
                                        <strong>￥${goods.price?string(priceFormat)}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span>${goods.marketPrice}</span> </div>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <#--右下-商品具体信息-->
                <div class="f-fr m-goods-right">
                    <div class="m-goods-tabs">
                        <ul class="f-cb">
                            <li class="u-selected"><a href="#tab01">商品介绍</a></li>
                            <li><a href="#tab02">商品参数</a></li>
                            <li><a href="#tab03">商品评论</a></li>
                            <li><a href="#tab04">购买咨询</a></li>
                        </ul>
                    </div>
                    <div class="m-goods-main">
                        <#--商品介绍-->
                        <div class="tabs" id="tab01">
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
                        </div>
                        <#--商品参数-->
                        <div class="tabs" id="tab02">
                            <div class="mc " data-widget="tab-content" id="p-detail" style="width:990px;min-width: 990px">
                                <ul class="detail-list">
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
                        </div>
                        <#--商品评论-->
                        <div class="tabs" id="tab03">
                            <div class="m_pl">
                                <ul>
                                    <li><span>*评分：</span></li>
                                    <li><span>*心得：</span><textarea class="textarea"></textarea></li>
                                    <li class="m_zs">10-500字</li>
                                    <li class="pl_menu"><input type="image" src="${base}/static/mall/images/pl_icon.jpg"></li>
                                </ul>
                            </div>
                            <div class="m_pj">
                                <table border="0">
                                    <tr class="pj_tit">
                                        <td width="500">评价心得</td>
                                        <td width="100">顾客满意度</td>
                                        <td width="100">购买信息</td>
                                        <td width="100">评论者</td>
                                    </tr>
                                    <#if !review??>
                                        <#list goodsReviewList as review>
                                            <tr class="m_pj_main">
                                                <td>
                                                    <p>${review.content}</p>
                                                    <p>${review.buyDate?string("yyyy-MM-dd HH:mm:ss")}</p>
                                                </td>
                                                <td>${review.score}</td>
                                                <td>${review.orderSn}</td>
                                                <td>${review.memberId}</td>
                                            </tr>
                                        </#list>
                                    <#else >
                                            <tr class="m_pj_main">
                                                <td>
                                                    <p>很好很不错，好用，正品，好用好用，很支持</p>
                                                    <p>2015-06-23 16:13</p>
                                                </td>
                                                <td>*****</td>
                                                <td>颜色：绿色</td>
                                                <td>评论者</td>
                                            </tr>
                                    </#if>

                                </table>
                            </div>
                        </div>
                        <#--商品资讯-->
                        <div class="tabs" id="tab04">咨询</div>
                    </div>
                </div>
            </div>
        </#if>
        </div>
    </div>
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
</div>
</body>
</html>