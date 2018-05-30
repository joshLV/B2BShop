<#escape x as x?html>
<script type="text/javascript">
    var base=getRootPath()+'/';
    $(function() {
        rload();
        var keyword="请输入您要找的商品名称";
        $("#keyword").focus(function(e) {
            $(this).val("");
        }).blur(function(e) {
            if($(this).val()==""){
                $(this).val(keyword);
            }
        });
        if(window.pageConfig.navId!='home'){
        $(".m-category").hover(function(e){
              $(".u-category").show();
        },function(e){
            $(".u-category").hide();
        });
        }
        $(".u-shopingcart").hover(function(e){
            $(".sc-goods-list").fadeIn();
            rload();
            $(".u-shopingcart-text").css("border-bottom","#FFFFFF solid 1px");
        },function(e){
            $(".sc-goods-list").fadeOut();
            rload();
            $(".u-shopingcart-text").css("border-bottom","#cccccc solid 1px");
        });
        //$(".u-top-ad").animate({height:"131px"},"slow");
        //window.setTimeout('$(".u-top-ad").animate({height:"0"},"slow")',"10000");
        var navselected=$(".u-navselected");
        $(".u-navinfo a").hover(function(e){
            $(".u-navinfo li").removeClass("u-navselected");
            $(this).parent().addClass("u-navselected");
        },function(e){
            $(this).parent().removeClass("u-navselected");
            if(navselected){
                navselected.addClass("u-navselected");
            }
        });
        $(".u-cate-tabs,.u-news-title,.m-rx-title").idTabs("!mouseover");
        $(".u-cate-tabs a").bind("mouseover",function(){
            $(".u-cate-tabs a").removeClass("tabsselected");
            $(this).addClass("tabsselected");
        });
        $(".m-rx-title a").bind("mouseover",function(){
            $(".m-rx-title a").removeClass("u-rx-selected");
            $(this).addClass("u-rx-selected");
        });
        $(".u-title a").bind("mouseover",function(){
            $(".u-title").removeClass("u-news-used");
            $(this).parent().addClass("u-news-used");
        });
        $(".u-cates-li:even").css("background-color","#fafafa");
        $(".u-cates-li").hover(function(e) {
            $(this).css("background","#f0f0f0");
            $(this).addClass("u-cates-over").removeClass(".u-cates-li");
        },function(e){
            $(this).removeClass("u-cates-over").addClass(".u-cates-li");
            $(".u-cates-li:even").css("background-color","#fafafa");
        });

    });
    /**
     * 全站搜索
     */
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
            window.location.href = "${base}/search/s/" + key;
        }
    }
    function getRootPath(){
        var curWwwPath=window.document.location.href;
        var pathName=window.document.location.pathname;
        var pos=curWwwPath.indexOf(pathName);
        var localhostPaht=curWwwPath.substring(0,pos);
        var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
        return(localhostPaht+projectName);
    }
    function rload(){
        $.ajax({
            type: "get",
            url: "${base}/cart/ajaxCartList?r="+Math.random(),
            success: function(data) {
                if(data.status=='success'){
                    var json=eval(data.data);
                    var data='';
                    var totalshop=0;
                    var totalmoney=0;
                    $.each(json,function(i,n){
                        data= data+'<ul id="mcart-sigle">'+
                                '<li>'+
                                '<div class="p-img f-fl">'+
                                '<a href="/ec/item/'+json[i].goodsId+'.html" target="_blank">'+
                                '<img src="'+json[i].pic+'" width="50" height="50" alt="" class="err-product"></a>'+
                                '</div>'+
                                '<div class="p-name f-fl">'+
                                '<a href="/ec/item/'+json[i].goodsId+'.html" target="_blank">'+json[i].name+'</a>'+
                                '</div>'+
                                '<div class="p-detail f-fr ar">'+
                                '<span class="p-price"><strong>￥'+json[i].price+'</strong>×'+json[i].quantity+'</span><br><a class="delete" href="javascript:del(\''+json[i].id+'\');">删除</a>'+
                                '</div>'+
                                '</li>'+
                                '</ul>'+
                                '<ul id="mcart-gift"></ul>';
                        totalshop =	totalshop+ json[i].quantity;
                        totalmoney = totalmoney + json[i].price*json[i].quantity;
                    });
                    var divshow = $("#cartlist");
                    divshow.text("");// 清空数据
                    var divtotal =$("#carttotal");
                    divtotal.text("");// 清空数据
                    var data1='共<b>'+totalshop+'</b>件商品　共计<strong>￥ '+totalmoney+'</strong><br>'+
                            '<a href="/ec/cart/list" title="去购物车结算" id="btn-payforgoods">去购物车结算</a>';
                    divtotal.append(data1);
                    if(data!=''){
                        $("#settleup-content").show();
                        $(".prompt").hide();
                        divshow.append(data);
                    }else{
                        $("#settleup-content").hide();
                        $(".prompt").show();
                    }
                    $("#shopping-amount").html(totalshop);
                }
            }
        });
    }
    function del(cartItemid) {
        $.ajax({
            type: "get",
            url: "${base}/cart/ajaxDeleteCartId",
            data: "id="+cartItemid,
            success: function(data) {
                if(data.status=='success'){
                    rload();
                }
            }
        });
    }
</script>
<div class="m-header f-cb">
    <div class="f-fl u-logo"><a href="${base}"><img src="${base}/static/mall/nsc/img/logo.png" alt="<@spring.message "project_name"/>" width="249" height="52"></a></div>
    <div class="f-fl u-search">
        <form action="" name="serach-form" method="get">
            <div class="u-search-input f-cb">
                <div class="f-fl">

                    <input type="text" name="keyword" id="keyword" onkeydown="javascript:if(event.keyCode==13){ s($('#keyword').val());return false;}" value="${keyword}" class="u-input-keyword">
                </div>
                <div class="f-fr">

                    <input type="button" name="search" id="search" class="u-button-search" value="搜索" onclick="s($('#keyword').val());return false;">
                </div>
            </div>
        </form>
        <div class="u-search-keyword">
			<span>热门搜索：</span>
			<a href="${base}/search/s/化肥" target="_blank">化肥</a>
			<a href="${base}/search/s/农药" target="_blank">农药</a>
			<a href="${base}/search/s/种子" target="_blank">种子</a>
		</div>
    </div>
    <div class="f-fr f-cb u-shopingcart"> <span class="shopping f-cb"><span id="shopping-amount">0</span></span>
        <div class="f-fl u-shopingcart-icon"></div>
        <div class="f-fl u-shopingcart-text">我的购物车</div>
        <div class="sc-goods-list">
            <div class="prompt">
                <div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>
            </div>
            <div id="settleup-content">
                <div class="smt">
                    <h4 class="fl">最新加入的商品</h4>
                </div>
                <div class="smc" id="cartlist"> </div>
                <div class="smb ar" id ="carttotal"> </div>
            </div>
        </div>
    </div>
</div>
<div class="m-nav">
    <div class="u-nav f-cb">
        <div class="f-fl m-category "> <span class="m-fl-tit"><a href="${base}/allSort">所有商品分类</a></span>
            <div class="u-category" style="display: none;">
                <div class="u-cate-tabs"> <a href="#tab1" class="tabsselected">农资类</a>
                    <div class="line"></div>
                    <a href="#tab2">养殖类</a>
				</div>
                <div class="u-cate-con">
                    <div class="tabs" id="tab1">
                        <ul class="u-cates">
                            <#assign n = 0 />
                            <#list catelogList as grandfather>
                            <#if grandfather.catelogType == "agricultural">
                            <li class="u-cates-li">
                                <div class="menu"> <span class="u-ico f-fl"><img src="${base}/static/mall/nsc/img/category-pic-1.jpg" width="16" height="16" alt=""></span>
                                    <h4 class="f-fl"><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h4>
                                	<span class="u-recommend f-fl">
									<#list catelogChildrenMap["${grandfather.id}"] as father>
                                        <a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a>
										<#if father_index==2><#break></#if>
									</#list>
                                    </span>
								</div>
                                <div class="m-category-text f-cb">
									<#list catelogChildrenMap["${grandfather.id}"] as father>
                                    <div class="f-fl">
                                        <ul class="f-cb">
											<li class="f-fl m-category-p"><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></li>
											<#list catelogChildrenMap["${father.id}"] as catelog>
											<li class="f-fl m-category-s"><a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></li>
											</#list>
                                        </ul>
                                    </div>
									</#list>
                                </div>
                            </li>
                            ${n = n + 1}
                            <#if n == 4><#break></#if>
                            </#if>
						</#list>

                        </ul>
                    </div>
                    <div class="tabs" id="tab2">
                        <ul class="u-cates">
                            <#assign n = 0 />
                            <#list catelogList as grandfather>
                            <#if grandfather.catelogType == "farm">
                                <li class="u-cates-li">
                                    <div class="menu"> <span class="u-ico f-fl"><img src="${base}/static/mall/nsc/img/category-pic-1.jpg" width="16" height="16" alt=""></span>
                                        <h4 class="f-fl"><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h4>
                                	<span class="u-recommend f-fl">
                                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a>
                                            <#if father_index==2><#break></#if>
                                        </#list>
                                    </span>
                                    </div>
                                    <div class="m-category-text f-cb">
                                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <div class="f-fl">
                                                <ul class="f-cb">
                                                    <li class="f-fl m-category-p"><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></li>
                                                    <#list catelogChildrenMap["${father.id}"] as catelog>
                                                        <li class="f-fl m-category-s"><a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></li>
                                                    </#list>
                                                </ul>
                                            </div>
                                        </#list>
                                    </div>
                                </li>
                                ${n = n + 1}
                                <#if n == 4><#break></#if>
                            </#if>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="f-fl u-navinfo">
            <ul>
			<#list middlenavigationList as middlenavigation>
				<li <#if middlenavigation_index == 0>class="u-navselected"</#if>><a href="<#if middlenavigation_has_next>${base}/</#if>${middlenavigation.url}" <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
			</#list>
            </ul>
        </div>
    </div>
</div>
</script>

</#escape>
