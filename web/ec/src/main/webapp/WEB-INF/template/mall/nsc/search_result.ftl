<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>${keyword} - 商品搜索 --- <@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>,${keyword}">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>,${keyword}">
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/nsc/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/nsc/css/function.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/assets/jquery/jquery.idTabs.min.js"></script>
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"search"};</script>
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
        });
    </script>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="g-hd">
    <#include "${path}/shortcut.ftl"/>
    <#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd m_top">
        <div class="g-main">
            <div class="f-cb">
            <div class="m_left">
                <h3>热销商品</h3>
                <div class="m_leftcon">
                    <ul>
                    <#list hotsList as hl>
                        <li>
                            <div class="m_limg"><a target="_blank" href="${base}/item/${hl.id}.html">
                                <img width="83" height="78" src="${hl.pic}" /></a></div>
                            <div class="m_rwz">
                                <div class="m_rxsp_name"><a target="_blank" href="${base}/item/${hl.id}.html">${hl.fullName}</a></div>
                                <div class="u-good-price">${hl.price?string('currency')}<span>${hl.marketPrice?string('currency')}</span></div>
                            </div>

                        </li>
                    </#list>
                    </ul>
                </div>
            </div>
            <div class="m_right">
                <div class="r_pxfs"> <span>排序方式:</span>
                    <div class="r_px">
                        <a href="#">默认</a>
                        <a href="${base}/search/s/${keyword}?orderBy=sales&pageNumber=${pager.pageNumber}">销量
                            <img src="${base}/static/mall/nsc/img/splb/px_jt.jpg">
                        </a>
                        <a href="${base}/search/s/${keyword}?orderBy=scoreCount&pageNumber=${pager.pageNumber}">人气
                            <img src="${base}/static/mall/nsc/img/splb/px_jt.jpg">
                        </a>
                        <a href="${base}/search/s/${keyword}?orderBy=price&pageNumber=${pager.pageNumber}">价格
                            <img src="${base}/static/mall/nsc/img/splb/px_jt.jpg">
                        </a>
                    </div>
                    <div class="pages">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber + 1}" class="<#if "${pager.pageNumber}" == "${pager.pageCount}">next-disabled<#else>pagesdown</#if>">下一页</a>
                        <a href="${base}/list/${grandCatelog.id}-<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber - 1}"  class="<#if "${pager.pageNumber - 1}" == "0">next-disabled<#else>pagesup</#if>">上一页</a>

                    </div>
                </div>
                <div class="p_lists">
                    <ul>
                    <#list list as gl>
                        <li>
                            <div class="p_lists_box">
                                <div class="big_img">
                                    <a target="_blank" href="${base}/item/${gl.id}.html">
                                        <img width="186" height="280" data-img="1" class="err-product" src="${gl.pic}_186x280.png" title="${gl.fullName}"></div>
                                </a>
                                <div class="small_img"><a href="#"><img data-img="1" class="err-product" src="${gl.pic}" title="${gl.fullName}"></a></div>
                                <div class="p_lists_name"><a target="_blank" href="${base}/item/${gl.id}.html">${gl.fullName}</a></div>
                                <div class="u-good-price f-fl">${gl.price?string('currency')}<span>${gl.marketPrice?string('currency')}</span></div>

                            </div>
                        </li>
                    </#list>
                    </ul>
                </div>
            </div>
        </div>
        </div>
    </div>
    <div class="g-bd2">
    <#include "${path}/service.ftl"/>
    </div>
    <#include "${path}/footer.ftl"/>
</div>
</body>
</html>