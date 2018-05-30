<#escape x as x?html>
<style>
/*leftMenu*/
#leftMenu .mt{height:32px;padding:0 6px;background-color:#CCCCCC;border-top:2px solid #B5B5B5;line-height:32px;color:#fff;}
#leftMenu .mt h2{float:left;background:none;padding-top:0;height:auto;line-height:32px}
#leftMenu .mt a{color:#fff;}
#leftMenu .mt .extra{cursor:pointer;float:right;width:22px;height:22px;overflow:hidden;line-height:0;font-size:0;background-image:url(${base}/static/mall/img/left.png);margin-top:5px}
#leftMenu .mt .extra:hover{background-position:-23px 0}
#leftMenu .mc{border:solid #E6E6E6;border-width:1px 1px 1px;overflow:hidden;}
#leftMenu dl dt{position:relative;margin-bottom:-1px;height:30px;padding:0 12px;font-weight:bold;line-height:30px;cursor:pointer;color:#333333;background-color:#F9F9F9}
#leftMenu dl dt b{display:block;position:absolute;top:12px;left:125px;width:9px;height:5px;background:url(${base}/static/mall/img/left.png) -64px 0;font-size:0;line-height:0;overflow:hidden}
#leftMenu dl.close dt{background-color:#F1F1F1;margin-bottom:1px}
#leftMenu dl dt:hover{background-color:#F1F1F1;}
#leftMenu dl.close dt b{background:url(${base}/static/mall/img/left.png) -64px -6px;}
#leftMenu dl.close dd{display:none;}
#leftMenu dd{padding:4px 0 5px;}
#leftMenu dd .item{padding:2px 0 2px 24px;}
#leftMenu dd .curr{font-weight:bold;}
#leftMenu dl dd a:link,#leftMenu dl dd a:visited{color:#333333}
#leftMenu dl dd a:hover{color:#E4393C}

</style>
<div id="leftMenu" class="m">
	<div class="mc"> 
		<#list parentList as plMenu>
		<dl tag="${plMenu.orderNo}">
			<dt tag="${plMenu.orderNo}">${plMenu.name}<b></b></dt>
			<dd>
				<#list childList as clMenu>
					<#if plMenu.id==clMenu.categoryId>
					<div class="item <#if clMenu.id==articles.id>curr</#if>">
                        <a href="${base}/help/question/${clMenu.id}.html" tag="${clMenu.orderNo}">${clMenu.title}</a>
                    </div>
					</#if>
				</#list>
			</dd>
		</dl>
		</#list>
	</div><!--mc end-->
</div><!--leftMenu end-->
</#escape>