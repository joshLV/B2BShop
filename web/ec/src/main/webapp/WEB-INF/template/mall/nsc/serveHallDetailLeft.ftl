<#escape x as x?html>
<style type="text/css">
    .nch-module .content { overflow: hidden; }

    .nch-sidebar-article-class { font-size: 0px; width: 214px; padding: 4px 0px; margin-left: -1px;}
    .nch-sidebar-article-class li { vertical-align: top; letter-spacing: normal; word-spacing: normal; text-align: center; display: inline-block; padding: 0px 9px; margin: 4px 0px; border-left: 1px dotted #D7D7D7; }
    .nch-sidebar-article-class li {letter-spacing: normal; word-spacing: normal; text-align: center; }
    .nch-sidebar-article-class li a:hover {font-weight: 600; text-decoration: none; color: #FFF; background-color: #2E970F;}
    .nch-sidebar-article-class li a { line-height: 16px; font-size: 12px; color: #555; display: block; width: 85px; height: 16px; padding: 2px 0px;}

    .nch-sidebar-article-list { padding: 4px 0px;}
    .nch-sidebar-article-list li { padding: 4px 9px;}
    .nch-sidebar-article-list li a { height: 20px;}
    .nch-sidebar-article-list li i { background: transparent url("${base}/static/mall/nsc/img/2014shop_background_img.png") no-repeat scroll -80px 0px; vertical-align: middle; display: inline-block; width: 3px; height: 3px; margin-right: 5px;}

    .nch-module { border: solid 1px #D7D7D7; margin-bottom: 10px;}
    .nch-module .title { background-color: #F5F5F5; height: 36px;}
    .nch-module .title h3 { font: normal 14px/20px "microsoft yahei"; color: #333; height: 20px; padding: 8px 10px;}
    .nch-module .title h3 em { color: #2E970F;}
    .nch-module .content { overflow: hidden;}
    .nch-module-style01 { border-top: solid 2px #2E970F;}
    .nch-module-style02 { border-top: solid 2px #C8C8C8;}
</style>
<div class="nch-module nch-module-style01">
    <div class="title">
        <h3>文章分类</h3>
    </div>
    <div class="content">
        <div class="nch-sidebar-article-class">
            <ul>
                <#list catelogs as catelog>
                    <li><a href="${base}/serveHall/list/${catelog.id}.html">${catelog.pagetitle}</a></li>
                </#list>
            </ul>
        </div>
    </div>
</div>
<div class="nch-module nch-module-style03">
    <div class="title">
        <h3>最新文章</h3>
    </div>
    <div class="content">
        <ul class="nch-sidebar-article-list">
            <#list articles as article>
                <li>
                    <i></i>
                    <a href="${base}/serveHall/detail/${article.id}.html">${article.title}</a>
                </li>
                <#if article_index == 4><#break></#if>
            </#list>
        </ul>
    </div>
</div>
</#escape>