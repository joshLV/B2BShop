<#escape x as x?html>
<header>

    <#include "bec/ghj/shortcut.ftl"/>

<div class="head f-cb">
    <div class="f-fl logo"><a href="${base}/index"><img src="${base}/static/bec/project/ghj/img/logo.png" width="290" height="73" alt="广货街交易平台"></a></div>
    <div class="f-fl main">
        <div class="search-box f-cb">
            <select name="search_type" id="search_type">
                <option value="goods">商品</option>
               <#-- <option value="shop">供应商</option>-->
            </select>
            <input class="has_reset" type="text" name="sear_text" id="sear_text" placeholder="请输入您想查找的关键字" value="${keyword}" onkeydown="javascript:if(event.keyCode==13) s($('#sear_text').val(),'');">
            <button class="f-fr" id="sear_btn" onclick="s($('#sear_text').val(),'');return false;"><i class="icon-search"></i>搜索</button>
        </div>
        <div class="search-keyword" id="hotwords">
            热门搜索：
        </div>
    </div>
    <div class="f-fr cart">
        <div class="shoppingcart">
            <i class="icon-shopping-cart"></i><a href="${base}/cart/list">购物车</a><i class="icon-angle-down"></i>
            <div id="shoppingcount"></div>
        </div>
        <div id="cartinfo">
            <div class="nogoods">
                <img src="${base}/static/bec/project/ghj/img/cart.png" width="57" height="49" alt="">购物车中还没有商品，赶紧选购吧！
            </div>
            <div class="goodslist">
                <div class="title">最新加入商品</div>
                <div class="list" id="cartlist">
                    <ul></ul>
                </div>
                <div class="info" id="carttotal">
                    共<span id="counts">123456789</span>件商品，共计<span id="total">￥123456789.00</span><br><a id="gotocart" href="${base}/cart/list">去购物车结算</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: 'post',
            url: '${base}/ajaxGetKeywords',
            success: function(data) {
                var allHtml = "";
                var keyword = $("#sear_text").val();
                var flag = false;
                for(var i=0;i<data.length;i++) {
                    if( data[i]["keywords"] == keyword ){
                        flag = true;
                    }
                }
                for(var i=0;i<data.length;i++){
                    allHtml += "<a href='javascript:void(0)'  onclick=\"searchG('"+data[i]["keywords"]+"','')\" ";

                    if(flag){
                        if(data[i]["keywords"] == keyword){
                            allHtml += " style='color:#ff0000' ";
                        }
                    }else{
                        if(i==0){
                            allHtml += " style='color:#ff0000' ";
                        }
                    }
                    allHtml += ">"+data[i]["keywords"]+"</a>";
                }
                $('#hotwords').append(allHtml);
            }
        });
    });
</script>

</header>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/list.css">
<!--商品分类所用js（allSort_head.js）-->
<script type="text/javascript" src="${base}/static/bec/project/ghj/js/allSort_head.js"></script>
<#--导航-->
<nav>
    <div class="main f-cb">
        <div class="f-fl">
            <div class="allSort">
                <div class="navCon-cate navCon_on">
                    <div class="navCon-cate-title"><a href="${base}/allSort">全部商品分类</a></div>
                    <div class="cateMenu hide">
                        <ul>
                        <#list catelogList as grandfather>

                            <li <#if grandfather_index == 0>style="border-top:none;"</#if>>
                                <div class="cate-tag png${grandfather_index+1}"><strong><a href="${base}/list/${grandfather.id}.html?price=&page=1&listStyle=detailList">${grandfather.name}</a></strong>
                                    <div class="listModel">
                                        <p>
                                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <a href="${base}/list/${grandfather.id}-${father.id}.html?price=&page=1&listStyle=detailList">${father.name}</a>
                                            <#if (father_index==2)><#break></#if>
                                        </#list>
                                        </p>
                                    </div>
                                </div>
                                <div class="list-item hide">
                                    <#--<ul class="itemleft">
                                    <#list catelogChildrenMap["${grandfather.id}"] as father>
                                        <dl>
                                            <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                                            <dd>
                                            <#list catelogChildrenMap["${father.id}"] as catelog>
                                                <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a>
                                            </#list>
                                            </dd>
                                        </dl>
                                        <div class="f-cb"></div>
                                    </#list>
                                    </ul>-->
                                <div class="col f-fl">
                                <#list catelogChildrenMap["${grandfather.id}"] as father>
                                    <#if father_index % 3 == 0>
                                    <dl>
                                        <dt><a href="${base}/list/${grandfather.id}-${father.id}.html?price=&page=1&listStyle=detailList">${father.name}</a></dt>
                                        <dd>
                                            <#list catelogChildrenMap["${father.id}"] as catelog>
                                                <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html?price=&page=1&listStyle=detailList">${catelog.name}</a>
                                            </#list>
                                        </dd>
                                    </dl>
                                    <div class="f-cb"></div>
                                    </#if>
                                </#list>
                                </div>
                                        <div class="col f-fl">
                                            <#list catelogChildrenMap["${grandfather.id}"] as father>
                                                <#if father_index % 3 == 1>
                                                    <dl>
                                                        <dt><a href="${base}/list/${grandfather.id}-${father.id}.html?price=&page=1&listStyle=detailList">${father.name}</a></dt>
                                                        <dd>
                                                            <#list catelogChildrenMap["${father.id}"] as catelog>
                                                                <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html?price=&page=1&listStyle=detailList">${catelog.name}</a>
                                                            </#list>
                                                        </dd>
                                                    </dl>
                                                    <div class="f-cb"></div>
                                                </#if>
                                            </#list>
                                        </div>
                                        <div class="col f-fl">
                                            <#list catelogChildrenMap["${grandfather.id}"] as father>
                                                <#if father_index % 3 == 2>
                                                    <dl>
                                                        <dt><a href="${base}/list/${grandfather.id}-${father.id}.html?price=&page=1&listStyle=detailList">${father.name}</a></dt>
                                                        <dd>
                                                            <#list catelogChildrenMap["${father.id}"] as catelog>
                                                                <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html?price=&page=1&listStyle=detailList">${catelog.name}</a>
                                                            </#list>
                                                        </dd>
                                                    </dl>
                                                    <div class="f-cb"></div>
                                                </#if>
                                            </#list>
                                        </div>
                            </li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="f-fl nav-right">
            <#--<ul class="navinfo">
                <li><a href="${base}/allG.html"  target="_blank">全部商品</a></li>
            <#list middlenavigationList as middlenavigation>
                <li><a href="<#if "${middlenavigation.urlType}" == "1">${base}/</#if>${middlenavigation.url}"  <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
                <#if (middlenavigation_index==5)><#break></#if>
            </#list>
            </ul>-->
                <ul class="navinfo" id="navinfo">
                    <li class="mainlevel" id="mainlevel_01"><a href="${base}/allG?orderBy=sales&orderType=desc&vt=list" target="_blank">全部商品</a>
                        <ul id="sub_01"></ul>
                    </li>

                    <#--<li class="mainlevel" id="mainlevel_02" style="display: none;"><a href="${base}/shopExtend/list.html" target="_blank">供应商</a>
                        <ul id="sub_02"></ul>
                    </li>-->

                    <li class="mainlevel" id="mainlevel_03"><a href="${base}/zcgoods/listZc.html" target="_blank">众筹</a>
                        <ul id="sub_03"></ul>
                    </li>
                    <#--<li class="mainlevel" id="mainlevel_03"><a href="${base}/list/11.html" target="_blank">首页</a>
                        <ul id="sub_03"></ul>
                    </li>-->

                    <li class="mainlevel" id="mainlevel_04"><a href="javascript:void(0)">生鲜</a>
                        <ul id="sub_04">
                            <li><a href="${base}/list/11.html?price=&page=1&listStyle=detailList" target="_blank">鲜活</a></li>
                            <li><a href="${base}/list/12.html?price=&page=1&listStyle=detailList" target="_blank">生食</a></li>

                            <li><a href="${base}/list/13.html?price=&page=1&listStyle=detailList" target="_blank">熟食</a></li>
                            <li><a href="${base}/list/14.html?price=&page=1&listStyle=detailList" target="_blank">散货</a></li>

                        </ul>
                    </li>

                    <li class="mainlevel" id="mainlevel_05"><a href="javascript:void(0)" >食品</a>
                        <ul id="sub_05">
                            <li><a href="${base}/list/15.html?price=&page=1&listStyle=detailList" target="_blank">烟酒饮料</a></li>
                            <li><a href="${base}/list/16.html?price=&page=1&listStyle=detailList" target="_blank">冲调食品</a></li>
                            <li><a href="${base}/list/17.html?price=&page=1&listStyle=detailList" target="_blank">休闲食品</a></li>
                            <li><a href="${base}/list/18.html?price=&page=1&listStyle=detailList" target="_blank">粮油调味</a></li>
                            <li><a href="${base}/list/19.html?price=&page=1&listStyle=detailList" target="_blank">冷冻冷藏</a></li>

                        </ul>
                    </li>

                    <li class="mainlevel" id="mainlevel_06"><a href="javascript:void(0)">日用</a>
                        <ul id="sub_06">
                            <li><a href="${base}/list/20.html?price=&page=1&listStyle=detailList" target="_blank">个人护理</a></li>
                            <li><a href="${base}/list/21.html?price=&page=1&listStyle=detailList" target="_blank">洗涤清洁</a></li>
                            <li><a href="${base}/list/22.html?price=&page=1&listStyle=detailList" target="_blank">针纺用品</a></li>
                            <li><a href="${base}/list/23.html?price=&page=1&listStyle=detailList" target="_blank">日杂用品</a></li>
                            <li><a href="${base}/list/24.html?price=&page=1&listStyle=detailList" target="_blank">小电器</a></li>
                        </ul>
                    </li>
                    <li class="mainlevel" id="mainlevel_07"><a href="${base}/list/1607061129522152838.html" target="_blank">进口商品</a>
                        <ul id="sub_06">
                            <li><a href="${base}/list/1607061130196032840.html" target="_blank">进口食品区</a></li>
                            <li><a href="${base}/list/1607061429053443490.html" target="_blank">进口非食区</a></li>
                        </ul>
                    </li>
                    <li class="mainlevel" id="mainlevel_08"><a href="${base}/join/whichwebl" target="_blank">招商入驻</a>
                        <ul id="sub_07"></ul>
                    </li>
                    <#list middlenavigationList as middlenavigation>
                        <li class="mainlevel" id="mainlevel_0${middlenavigation_index+8}" <#if middlenavigation.id=="1604251457541371419">liId="supplyId${middlenavigation.id}" style="display: none;" </#if>>
                            <a href="<#if middlenavigation.urlType == '1'>${base}/</#if>${middlenavigation.url}"  <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a>
                        </li>
                        <#if (middlenavigation_index==4)><#break></#if>
                    </#list>

                </ul>







        </div>
    </div>
</nav>
<script type="text/javascript">
   $(function() {
       $('li.mainlevel').hover(function () {
           $(this).find('ul').stop().slideDown();
           $(this).find('a:first').css("color", "#ffffff");
           $(this).css("background-color", "#fc3951");

       }, function () {
           $(this).find('ul').stop().slideUp(100);
           $(this).css("background-color", "");
           $('li.mainlevel>a').css("color", "#444");
       });
   });

</script>

</#escape>