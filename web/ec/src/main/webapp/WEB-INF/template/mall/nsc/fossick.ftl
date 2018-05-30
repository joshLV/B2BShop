<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>"/>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>"/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <link rel="shortcut icon" href="${base}/static/mall/nsc/img/favicon.ico"/>
    <link rel="apple-touch-icon" href="${base}/static/mall/nsc/img/touchicon.png"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>

    <script type="text/javascript">
        $(window).load(function (e) {
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
            $(".m-floor1-text").idTabs("!mouseover");
            $(".m-floor1-text a").mouseover(function(e) {
                $(this).parent().parent().find("a").removeClass("u-floor1-used");
                $(this).addClass("u-floor1-used");
            });
        });
    </script>
    <style type="text/css">
        /*.prev-disabled, .next-disabled {*/
        /*pointer-events:none;*/
        /*color:#afafaf;*/
        /*cursor:default*/
        /*}*/
    </style>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
<#include "${path}/shortcut.ftl"/>
<#include "${path}/header.ftl"/>
    <div class="g-bd">
        <div class="g-main">
            <#assign n = 0 />
            <#list typeList as child>
            <div class="m-floor1">
                <div class="m-floor1-top f-cb">
                    <div class="f-fl m-floor1-num <#if child_index != 0> u-floor${child_index + 1}</#if>">
                        <span>${child_index + 1}F</span>${child.catelog.name}淘</div>
                    <div class="f-fr m-floor1-text">
                        <ul class="f-cb">
                            <#list child.tagList as tag>
                                <li class="f-fl">
                                    <a href="#tab${child_index + 1}${tag_index + 1}" <#if tag_index==0>class="u-floor1-used"</#if>>${tag.name}</a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <div class="m-floor1-main f-cb">
                    <div class="f-fl">
                        <div class="m-floor1-img"><img alt="${child['floor_left_'+'${child_index+1}'+'_1'].name}"
                                                       src="${child['floor_left_'+'${child_index+1}'+'_1'].pic}" width="250"
                                                       height="302"></div>
                        <div class="m-floor1-textlink u-floor${child_index + 1}-text">
                            <ul>
                                <#list catelogChildrenMap["${child.catelog.id}"] as father>
                                    <li class="u-textlink"><a
                                            href="${base}/list/${father.id}-${father.id}.html">${father.name}</a></li>
                                    <#if father_index % 2 == 0>
                                        <li class="u-line2 u-floor${child_index + 1}-line">|</li>
                                    </#if>
                                    <#if father_index==11><#break></#if>
                                </#list>
                            </ul>
                        </div>
                    </div>

                    <div class="f-fr m-floor-goods">
                        <#list child.tagList as tag>
                            <div class="tabs" id="tab${child_index + 1}${tag_index + 1}">
                                <ul class="f-cb">
                                    <#list tag.goodsList as goods>
                                        <li class="f-fl">
                                            <div class="u-good-imgs">
                                                <a href="${base}/item/${goods.id}.html" target="_blank">
                                                    <img width="170" height="200"  alt="${goods.fullName}" src="${goods.pic}">
                                                </a>
                                            </div>
                                            <div class="u-good-name">
                                                <a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a>
                                            </div>
                                            <div class="u-good-price">
                                                ${goods.price?string('currency')}
                                                <span>${goods.marketPrice?string('currency')}</span>
                                            </div>
                                        </li>
                                        <#if goods_index == 9><#break></#if>
                                    </#list>
                                </ul>
                            </div>

                        </#list>
                    </div>
                </div>
            </div>
            <#if (child_index + 1) % 2 == 0>
            <div class="m-ad1">
                <img  alt="${child['floor_left_'+'${child_index+1}'+'_1'].name}" src="${child['floor_left_'+'${child_index+1}'+'_1'].pic}" width="1193" height="120"
                          title="${child['floor_left_'+'${child_index+1}'+'_1'].name}" >
            </div>
            </#if>
            </#list>
        </div>
    </div>
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
</body>
</html>
