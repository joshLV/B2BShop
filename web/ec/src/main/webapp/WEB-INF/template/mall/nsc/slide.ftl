<#escape x as x?html>
<script type="text/javascript">
    var base=getRootPath()+'/';
    $(window).load(function(e) {
        $("#kinMaxShow").kinMaxShow({
            height:325,
            easing:"swing",
            button:{
                switchEvent:'mouseover',
                showIndex:false,
                normal:{width:'18px',height:'5px',lineHeight:'5px',right:'20px',bottom:'14px',fontSize:'2px',opacity:0.8,background:"#666666",border:"1px solid #999999",marginRight:'6px'},
                focus:{background:"#CC0000",border:"1px solid #FF0000"}
            }
        });
    });
</script>
<div class="g-main">
    <div class="m-imgfocus">
        <div id="kinMaxShow">
			<#list adslides as slideitem>
                <div>
					<a href="${slideitem.url}" target="_blank"><#--_985x323.png-->
						<img src="${slideitem.pic}" width="985" height="323" title="${slideitem.description}" alt="${slideitem.description}">
					</a>
				</div>
			</#list>
        </div>
    </div>
    <div class="m-model1 f-cb">
        <div class="f-fl">
            <div><img src="${base}/static/mall/nsc/img/ad004.jpg" width="210" height="170" alt=""></div>
            <div class="m-content1">
                <div class="u-news-title f-cb">
                    <div class="f-fl u-title u-news-used"><a href="#tab3">商城公告</a></div>
                    <div class="f-fl line"></div>
                    <div class="f-fl u-title"><a href="#tab4">活动</a></div>
                </div>
                <div class="u-news-list">
                    <div class="tabs" id="tab3">
                        <ul>
						<#list notices as notice>
							<li><a href="${base}/serveHall/detail/${notice.id}.html" title="${notice.title}" target="_blank"><strong><span><b>${notice.title}</b></span></strong></a></li>
						</#list>
                        </ul>
                    </div>
                    <div class="tabs" id="tab4">
                        <ul>
						<#list activity as notice>
							<li><a href="${base}/serveHall/detail/${notice.id}.html" title="${notice.title}" target="_blank"><strong><span><b>${notice.title}</b></span></strong></a></li>
						</#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="f-fr m-rx">
            <div class="m-rx-title f-cb">
				<#list tagList as tag>
				<a href="#tab${tag["sign"]}" <#if tag_index==0>class="u-rx-selected"</#if>>${tag["name"]}</a>
				</#list>
			</div>
            <div class="m-rx-content">
				<#list tagGoodsList as tagGoodsMap>
                    <div class="tabs" id="tab${tagGoodsMap["sign"]}">
                    	<ul>
						<#list tagGoodsMap["goodsList"] as goods>
                            <li>
                                <div class="u-rx-goodsimg"><a href="${base}/item/${goods.id}.html" target="_blank"><img alt="${goods.fullName}" src="${goods.pic}_240x230.png"></a></div>
                                <div class="u-rx-goodname"><a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a></div>
                                <div class="u-rx-goodprice f-cb">
                                    <div>市场价:${goods.marketPrice?string('currency')}</div>
                                </div>
                                <div class="u-rx-goodprice f-cb">
                                    <div class="qxj">商城价：<span>${goods.price?string('currency')}</span></div>
                                </div>
                            </li>
						</#list>
                    	</ul>
					</div>
				</#list>
            </div>
        </div>
    </div>
</div>

</#escape>