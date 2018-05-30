<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/> - <@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_name"/>">
    <meta name="Keywords" content="<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link rel="stylesheet" href="${base}/static/mall/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript"></script>
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
        <div class="n_search m_top">
            <div class="n_search_l">
                <span>热门搜索：</span>
                <a href="#">西安农业</a>
            </div>
        </div>
        <div class="n_box">
            <div class="n_box_l">
                <h2>${articleMain.title}</h2>
                <div class="n_times">2015-06-06 17:36:59</div>
                <div class="n_box_m">
                    ${articleMain.content}
                </div>
                <#--<div class="n_pages"><a href="#">上一篇： 富硒黑玉米高产有新招</a><a href="#" class="f-fr">下一篇： 甘薯怎样配方施肥</a></div>-->
            </div>
            <div class="n_r">
                <div class="today_hq">
                    <h3><img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">${tec["rmzx"].pagetitle}</h3>
                    <div class="hot_zx">
                    <#list tec["rmzxarticles"] as article>
                        <p>
                        <div class="h_img"><img src="${base}/static/mall/nsc/img/njzx/hot_img01.jpg"></div>
                        <div class="h_tit"><a href="#">${article.title}</a></div>
                        <div class="h_time">2014-09-28 17:54:03 阅读3628</div>
                        </p>
                        <#if article_index == 2><#break></#if>
                    </#list>
                    </div>
                </div>
            </div>
            <div class="n_r">
                <div class="n_r_zd">
                    <div class="n_r_tit">
                        <img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg"><h3>${tec["zdjj"].pagetitle}</h3>
                        <a href="#">查看全部</a>
                    </div>
                    <div class="n_r_main">
                    <#list tec["zdjjarticles"] as article>
                        <p><a href="#">${article.title}</a></p>
                        <#if article_index == 9><#break></#if>
                    </#list>
                    </div>
                </div>
                <div class="n_r_zd">
                    <div class="n_r_tit m_t">
                        <img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg"><h3>${tec["nqyj"].pagetitle}</h3>
                        <a href="#">查看全部</a>
                    </div>
                    <div class="n_r_main">
                    <#list tec["nqyjarticles"] as article>
                        <p><a href="#">${article.title}</a></p>
                        <#if article_index == 5><#break></#if>
                    </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#--服务-->
<div class="g-aq f-cb">
<#include "${path}/service.ftl">
</div>
<#--页脚-->
<div class="g-ft">
<#include "${path}/footer.ftl">
</div>
</body>
</html>