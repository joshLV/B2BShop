<!DOCTYPE html>
<html>
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
            $("#kinMaxShow").kinMaxShow({
                //设置焦点图高度(单位:像素) 必须设置 否则使用默认值 500
                height:438,
                //设置焦点图 按钮效果
                button:{
                    //设置焦点图切换方式为mouseover 鼠标经过按钮切换图片, 默认为 click， 可选 click[鼠标点击切换]或mouseover[鼠标滑过切换]
                    switchEvent:'mouseover',
                    //设置显示 索引数字  true 显示， 默认为 false 不显示
                    showIndex:true,
                    //按钮常规下 样式设置 ，css写法，类似jQuery的 $('xxx').css({key:value,……})中css写法。
                    //【友情提示：可以设置透明度哦 不用区分浏览器 统一为 opacity，CSS3属性也支持哦 如：设置按钮圆角、投影等，只不过IE8及以下不支持】
                    normal:{width:'18px',height:'18px',lineHeight:'18px',bottom:'16px',fontSize:'12px',opacity:0.8,background:"#666666",border:"1px solid #999999",color:"#CCCCCC",marginRight:'6px'},
                    //当前焦点图按钮样式 设置，写法同上
                    focus:{background:"#CC0000",border:"1px solid #FF0000",color:"#000000"}
                }
            });
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
            <div class="n_box_b" id="show">
                <!--焦点图HTML 结构-->
                <div id="kinMaxShow">

                    <div>
                        <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/njzx/banner001.jpg"   /></a>
                        <p class="title"><span class="title_in">文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力</span></p>

                    </div>

                    <div>
                        <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/njzx/banner001.jpg"   /></a>
                        <p class="title"><span class="title_in">文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力</span></p>

                    </div>

                    <div>
                        <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/njzx/banner001.jpg"   /></a>
                        <p class="title"><span class="title_in">文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力</span></p>

                    </div>

                    <div>
                        <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/njzx/banner001.jpg"   /></a>
                        <p class="title"><span class="title_in">文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力</span></p>

                    </div>

                    <div>
                        <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/njzx/banner001.jpg"   /></a>
                        <p class="title"><span class="title_in">文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力文昌农商场广告宣传助力</span></p>

                    </div>

                </div>
            </div>

            <div class="n_r">
                <div class="today_hq">
                    <h3><img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">${tec["jrhq"].pagetitle}</h3>
                    <#list tec["jrhqarticles"] as article>
                        <p>${article.title}</p>
                    <#if article_index == 0><#break></#if>
                    </#list>
                </div>
                <div class="today_hq m_t">
                    <h3><img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">${tec["rmzx"].pagetitle}</h3>
                    <div class="hot_zx">
                    <#list tec["rmzxarticles"] as article>
                        <p>
                        <div class="h_img"><img src="${base}/static/mall/nsc/img/njzx/hot_img01.jpg"></div>
                        <div class="h_tit"><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></div>
                        <div class="h_time">2014-09-28 17:54:03 阅读3628</div>
                        </p>
                        <#if article_index == 2><#break></#if>
                    </#list>
                    </div>
                </div>
            </div>
        </div>
        <div class="n_box">
            <div class="n_news">
                <div class="n_news_t">
                    <img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">
                    <h3>${tec["news"]["category"].pagetitle}</h3>
                    <div class="n_t_other">
                        <#list tec["news"]["twoCat"] as catTwo>
                            <a href="#">${catTwo.pagetitle}</a>
                        </#list>
                    </div>
                    <a href="#">查看全部></a>
                </div>
                <div class="n_news_m">
                    <ul>
                    <#list tec["news"]["articles"] as article>
                        <li>
                            <div class="n_img"><img src="${base}/static/mall/nsc/img/njzx/news_img.jpg"></div>
                            <div class="n_main">
                                <h3><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></h3>
                                <p>
                                    <#if article.content?length < 60>${article.content}<#else> ${article.content[0..100]}...</#if>
                                </p>
                            </div>
                            <div class="n_time">2014-09-28 17:54:03 阅读3628</div>
                        </li>
                    </#list>
                    </ul>
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
                        <p><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></p>
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
                        <p><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></p>
                        <#if article_index == 5><#break></#if>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
        <div class="n_box">
            <div class="n_news">
                <div class="n_news_t">
                    <img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">
                    <h3>${tec["knowledge"]["category"].pagetitle}</h3>
                    <a href="#">查看全部></a>
                </div>
                <div class="n_news_st">
                    <#list tec["knowledge"]["CatTwo"] as catTwo>
                    <div class="n_st_l">
                        <p>
                            <a href="#"><h5>${catTwo["twoCat"].pagetitle}</h5></a>
                            <#list catTwo["threeCat"] as three>
                             <a href="#">${three.pagetitle}</a>
                            <#if three_index == 4><#break></#if>
                            </#list>
                        </p>
                    </div>
                    </#list>
                </div>
                <div class="n_zsk_m">
                    <#list tec["news"]["articles"] as article>
                        <#if article_index == 0>
                            <div class="n_zsk_l">
                                <div class="zsk_img"><img src="${base}/static/mall/nsc/img/njzx/zsk_img.jpg"></div>
                                <div class="zsk_main">
                                    <h3><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></h3>
                                    <p><#if article.content?length < 60>${article.content} <#else> ${article.content[0..100]}...</#if></p>
                                </div>
                                <div class="n_time">2014-09-28 17:54:03 阅读3628</div>
                            </div>
                        <#else>
                            <#if article_index == 1>
                            <div class="n_zsk_r">
                                <ul>
                            </#if>
                                    <li>
                                        <div class="n_img"><img src="${base}/static/mall/nsc/img/njzx/news_img.jpg"></div>
                                        <div class="n_zsk_main">
                                            <h3><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></h3>
                                            <p><#if article.content?length < 60>${article.content} <#else> ${article.content[0..100]}...</#if></p>
                                        </div>
                                        <div class="n_ztime">2014-09-28 17:54:03 阅读3628</div>
                                    </li>
                            <#if !article_has_next>
                                </ul>
                            </div>
                            </#if>
                        </#if>
                    </#list>
                </div>
            </div>
            <div class="n_r">
                <div class="today_hq m_t">
                    <div class="today_hq m_t">
                        <h3><img src="${base}/static/mall/nsc/img/njzx/t_ico.jpg">${tec["rmnyzs"].pagetitle}</h3>
                        <div class="hot_zx">
                            <#list tec["rmnyzsarticles"] as article>
                                <p>
                                <div class="h_img"><img src="${base}/static/mall/nsc/img/njzx/hot_img01.jpg"></div>
                                <div class="h_tit"><a href="${base}/teccenter/detail/${article.id}.html">${article.title}</a></div>
                                <div class="h_time">2014-09-28 17:54:03 阅读3628</div>
                                </p>
                            </#list>
                        </div>
                    </div>
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