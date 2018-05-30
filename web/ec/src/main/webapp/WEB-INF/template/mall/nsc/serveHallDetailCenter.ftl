<#escape x as x?html>
<style type="text/css">
    .more_article { border-top: 1px solid #d2d2d2; padding: 10px 0 0 20px; margin-top: 10px; overflow: hidden; }
    .more_article span { color: #3f3f3f; font-weight: normal; margin-bottom: 10px; }
    .more_article span a { color: #006bcd; text-decoration: none;}
    .more_article span a:hover { color: #2E970F; text-decoration: underline; }
    .more_article time { font-size: 11px; color: #999; padding-left: 20px; }

    .nch-article-con { background: #FFF none repeat scroll 0% 0%; display: block; padding: 19px; border: 1px solid #E6E6E6; margin-bottom: 10px; overflow: hidden;}
    .nch-article-con h1 { font: 600 16px/32px "microsoft yahei"; color: #3D3F3E; text-align: center; }
    .nch-article-con h2 { color: #9A9A9A; font-size: 12px; padding: 5px 0px 20px; margin-bottom: 20px; font-weight: normal; text-align: center; border-bottom: 1px solid #D2D2D2;}
    .nch-article-con .default p { display: block; clear: both; padding: 5px;}
    .nch-article-con img { max-width: 930px;}
    .nch-article-con .title-bar h3 { font: 18px/20px "microsoft yahei";}
    .nch-article-con .title-bar { border-bottom: 1px solid #E6E6E6; padding-bottom: 15px; margin-bottom: 15px;}

    .fl { float:left; display:inline;}
    .fr { float:right !important; display:inline;}

    .nch-article-list { }
    .nch-article-list li { line-height: 20px; display: block; height: 20px; padding: 5px 0px;}
    .nch-article-list li i { background: transparent url("${base}/static/mall/nsc/img/2014shop_background_img.png") no-repeat scroll -80px 0px; vertical-align: middle; display: inline-block; width: 3px; height: 3px; margin-right: 10px; }
    .nch-article-list li a { color: #333;}
    .nch-article-list li time { font-size: 11px; color: #AAA; float: right;}

    .tc { text-align: center !important;}
    .mb20 { margin-bottom: 20px;}
    .pagination { display: inline-block; margin: 0px auto;}
    .pagination ul li { vertical-align: top; letter-spacing: normal; word-spacing: normal; display: inline-block; margin: 0px 0px 0px -1px;}
    .pagination li a:hover span, .pagination li a:active span { color: #FFF; text-decoration: none !important; background-color: #D93600; border-color: #CA3300; position: relative; z-index: 9; cursor: pointer;}
    .pagination li a span, .pagination li a:visited span { color: #005AA0; text-decoration: none; background-color: #FFF; position: relative; z-index: 1;}
    .pagination li span { font: 14px/20px "microsoft yahei"; color: #AAA; background-color: #FAFAFA; text-align: center; display: block; min-width: 20px; padding: 8px; border: 1px solid #E6E6E6; position: relative; z-index: 1;}
</style>
<div class="nch-article-con">
    <#if article??>
        <h1>${article.title}</h1>
        <h2>${article.modifyDate}</h2>
        <div class="default">
            <p>
                <#noescape>${article.content}</#noescape>
            </p>
        </div>
        <#--<div class="more_article">-->
        <#--<span class="fl">上一篇：-->
            <#--<a href="http://www.an666.com/shop/index.php?act=article&op=show&article_id=472">浦发信用卡账单查询方式</a>-->
            <#--<time>2015-06-13 16:12</time>-->
        <#--</span>-->
        <#--<span class="fr">下一篇：-->
            <#--<a href="http://www.an666.com/shop/index.php?act=article&op=show&article_id=470">易农宝合作金融机构有哪些？</a>-->
            <#--<time>2015-06-13 16:06</time>-->
        <#--</span>-->
        <#--</div>-->
    <#else>
        <div class="title-bar">
            <h3>${category.pagetitle}</h3>
        </div>
        <ul class="nch-article-list">
            <#list articles as article>
                <li>
                    <i></i>
                    <a href="${base}/serveHall/detail/${article.id}.html">${article.title}</a>
                    <time>${article.modifyDate}</time>
                </li>
            </#list>
        </ul>
    </#if>
</div>
<#if !article??>
<div class="tc mb20">
    <div class="pagination">
        <ul>
            <#if pager.pageNumber == 1>
                <li><span>首页</span></li>
                <li><span>上一页</span></li>
            <#else>
                <li>
                    <a href="${base}/serveHall/list/${category.id}.html?pageNumber=1" class="demo"><span>首页</span></a>
                </li>
                <li>
                    <a href="${base}/serveHall/list/${category.id}.html?pageNumber=${pager.pageNumber - 1}" class="demo"><span>上一页</span></a>
                </li>
            </#if>
            <#list 1..pager.pageCount as n>
                <li>
                    <#if pager.pageNumber == n>
                    <span class="currentpage">${n}</span>
                    <#else>
                    <a class="demo" href="${base}/serveHall/list/${category.id}.html?pageNumber=${n}">
                        <span>${n}</span>
                    </a>
                    </#if>
                </li>
            </#list>
            <#if pager.pageNumber == pager.pageCount>
                <li>
                    <span>下一页</span>
                </li>
                <li>
                    <span>末页</span>
                </li>
            <#else>
                <li>
                    <a href="${base}/serveHall/list/${category.id}.html?pageNumber=${pager.pageNumber + 1}" class="demo">
                        <span>下一页</span>
                    </a>
                </li>
                <li>
                    <a class="demo" href="${base}/serveHall/list/${category.id}.html?pageNumber=${pager.pageCount}"><span>末页</span></a>
                </li>
            </#if>
        </ul>
    </div>
</div>
</#if>
</#escape>