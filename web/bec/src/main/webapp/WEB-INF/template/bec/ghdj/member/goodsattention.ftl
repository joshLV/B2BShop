<#escape x as x?html>
	<#include "bec/ghdj/header.ftl"/>
<div id="container" class="f-cb">
	<#include "bec/ghdj/top.ftl"/>
    <div class="member_content f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;我的关注<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <!-- leftMenu-->
		<#--<#include "bec/ghdj/member/leftmenu.ftl"/>-->
			<#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
			<@leftmenu.menu id="memberB2BGoodsAttention"/>
            <!--leftMenu end-->
        </div>
		<div class="member_right" id="right">
			<div class="mt">
				<div class="icon-left"></div>
				<h2>我的关注</h2>
				<div class="extra">
					<a onclick="javascript:deleteAll();" href="javascript:void(0);" class="empty">清空关注列表</a></div>
				<div class="icon-right"></div>
			</div>
			<div class="mc" id="mc">
				<div class="gz-items">
					<ul id="recenthistory">
						<#if goodsAttentionList?? && goodsAttentionList?size &gt; 0 >
						<#list goodsAttentionList as goodsAttention>
							<#assign isGoBuy=true>
							<li id="${goodsAttention.id}" order="0">
								<div class="dity">
									<div class="mod">
										<div class="p-img">
											<#if goodsAttention.type == '1'>
												<a href="${base}/zcgoods/detail/${goodsAttention.goodsId}.html?whichclient=whichpc" target="_blank">
											<#else>
												<a href="${base}/item/${goodsAttention.goodsId}.html" target="_blank">
											</#if>
												<img width="130" height="130" src="${goodsAttention.image}" class="err-product">
											</a>
											<#if goodsAttention.type == '1'>
												<span class="icon_zc">
													<img src="${base}/static/bec/project/ghdj/img/icon_zc.png" width="40" height="40">
												</span>
											</#if>
										</div>
										<div class="i-it">
											<h3>
												<#if goodsAttention.type == '1'>
													<a href="${base}/zcgoods/detail/${goodsAttention.goodsId}.html?whichclient=whichpc" target="_blank">
												<#else>
													<a href="${base}/item/${goodsAttention.goodsId}.html" target="_blank" >
												</#if>
												${goodsAttention.name}</a>
											</h3>
											<div class="p-price">
												<#if goodsAttention.type != '1'>
												<strong>商城价：</strong>
												<font>
													<#if !goodsAttention.price?? || goodsAttention.price == '0.00'>
														<#assign isGoBuy=false>
													</#if>
													￥${goodsAttention.price}
												</font>
												<#--<strong>市场价：</strong>
												<del>￥${goodsAttention.marketPrice}</del>-->
												</#if>
											</div>
											<div class="buton">
											<#--<a href="javascript:void(0);" onclick="addCart('${goodsAttention.goodsId}');" class="buy" target="_blank" >加入购物车</a>-->
											<#--<a onclick="javascript:deleteOne('${goodsAttention.id}');" href="javascript:void(0);" class="delet" >清除该关注</a>-->
											<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 Start -->
												<#if goodsAttention.type == '1'>
												<a href="${base}/zcgoods/detail/${goodsAttention.goodsId}.html?whichclient=whichpc"  target="_blank" class="buy" style="text-align: center;">查看详情</a>
												<#else>
												<a href="javascript:void(0);" <#if isGoBuy> onclick="addCart('${goodsAttention.goodsId}');" class="buy"<#else>  class="buy-disable" </#if> ><img src="${base}/static/mall/img/gwc_icon.png">加入购物车</a>
												</#if>
												<a onclick="deleteOne('${goodsAttention.id}');" href="javascript:void(0);" class="delet" >清除该关注</a>
											<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 End -->
											</div>
										</div>
										<span class="clr"></span>
									</div>
								</div>
							</li>
						</#list>
						<#else>
							<li>
									<div class="nocont-box nocont-order">
										<b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
									</div>
							</li>
						</#if>
					</ul>
				</div>

                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
						<#if pager!false && pager.list?size &gt; 0>
							<#import "bec/ghdj/pager.ftl" as p>
							<@p.pager pager = pager baseUrl = "/member/goodsattention/list.html" />
						<#else>
                            <div class="noRecord">你还没有订单！</div>
						</#if>
                    </div>
                </div>

			</div>
			<div class="clr"></div>
		</div><!--right end-->

    </div>
</div>

<#include "bec/ghdj/service.ftl"/>
<#include "bec/ghdj/foot.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

    });
    function deleteAll(){
        $.ajax({
            type: "get",
            url: base+"member/goodsattention/ajaxDeleteAllByMemberId",
            success: function(data) {
                if(data.status=='success'){
                    //刷新本页面
                    location.replace("${base}/member/goodsattention/list");
                }
            }
        });
    }
    function deleteOne(id){
        $.ajax({
            type: "get",
            url: base+"member/goodsattention/ajaxDeleteGoodsAttentionId",
            data: "id="+id,
            success: function(data) {
                if(data.status=='success'){
                    $("#"+id).hide();
                }
            }
        });
    }
    function addCart(goodsId) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=1" + "&backurl=" + window.location.href;
    }
</script>
</#escape>