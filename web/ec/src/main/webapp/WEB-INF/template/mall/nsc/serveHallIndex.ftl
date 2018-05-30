<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/> - <@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript" ></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script type="text/javascript">
        $(window).load(function(e) {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".p_box_int").idTabs("!mouseover");
        });
    </script>
</head>
<body>
<#assign path="mall/nsc">
<div class="g-doc">
<#--页眉-->
    <div class="g-hd">
    <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
    </div>
    <#--页面中间-->
    <div class="g-bd">
        <div class="g-main">
            <div class="p_box">
                <h3>请选择您遇到的问题：</h3>
                <div class="p_box_in">
                    <div class="p_box_int">
                        <ul>
                            <#list question as ques>
                                <li><a href="#tab${ques["category"].sign}" <#if ques_index == 0>class="selected"</#if>>${ques["category"].name}</a></li>
                            </#list>
                        </ul>
                    </div>
                    <#list question as ques>
                        <div class="p_box_inb tabs" id="tab${ques["category"].sign}">
                            <#list ques["articles"] as article>
                                <#if article_index % 3 == 0>
                                    <div class="p_inbox">
                                </#if>
                                <p>
                                    <a href="${base}/serveHall/detail/${article.id}.html" title="${article.title}" target="_blank" rel="nofollow">
                                        <#if article.title?length &gt; 12 >
                                            ${(article.title)?substring(0,9)}...
                                        <#else>
                                        ${article.title}
                                        </#if>
                                    </a>
                                </p>
                                <#if (article_index + 1) % 3 == 0 || !article_has_next>
                                    </div>
                                </#if>
                                <#if article_index == 14><#break></#if>
                            </#list>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="q_box">
                <h3>自己寻找答案：</h3>
            <#list answer as ans>
                <div class="q_box_in${ans_index + 1}">
                    <div class="q_box_tit">
                        <h4>${ans["category"].name}</h4>
                    </div>
                    <div class="q_boxin">
                    <#list ans["articles"] as article>
                        <#if article_index % 4 == 0>
                        <div class="q_boxin1">
                        </#if>
                        <p>
                            <a href="${base}/serveHall/detail/${article.id}.html" title="${article.title}" target="_blank" rel="nofollow">
                                <#if article.title?length &gt; 10 >
                                ${(article.title)?substring(0,8)}...
                                <#else>
                                ${article.title}
                                </#if>
                            </a>
                        </p>
                        <#if (article_index + 1) % 4 == 0 || !article_has_next>
                        </div>
                        </#if>
                        <#if article_index == 7><#break></#if>
                    </#list>
                    </div>
                </div>
            </#list>
            </div>
            <div class="s_box">
                <h3>常用自助服务:</h3>
                <div class="s_box_in">
                    <ul>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon1.png"><a href="#">激活账户</a></li>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon2.png"><a href="#">修改邮箱名</a></li>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon3.png"><a href="#">重置登陆密码</a></li>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon1.png"><a href="#">重置支付密码</a></li>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon4.png"><a href="#">取消数字证书</a></li>
                        <li><img src="${base}/static/mall/nsc/img/fwdt/icon5.png"><a href="#">修改手机号码</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<#--服务-->
<div class="g-bd2">
<#include "${path}/service.ftl">
</div>
<#--页脚-->
<#include "${path}/footer.ftl">
</body>
</html>