<#escape x as x?html>
<style>
.floorList{width: 990px;margin:0 0 10px;}
.floorList .floor .mt {border-bottom: 2px solid #666;color: #666;width: 100%;height: 32px;font: 700 22px/32px "microsoft yahei";}
.floorList .floor .mc {width: 100%;}
.floorList .floor .mc .catalogue {background-color: #FFFFFF;}
.floorList .floor .mc .catalogue {width: 210px;height: 424px;float: left;position: relative;border-bottom: 1px solid #e2e2e2;}
.floorList .floor .mc .catalogue .ca-list {width: 190px;overflow: hidden;padding-left: 20px;padding-top: 15px;margin-bottom: 10px;}
.floorList .floor .mc .catalogue .ca-list ul li {float: left;width: 87px;padding-left: 8px;height: 24px;line-height: 24px;overflow: hidden;background: url(${base}/static/mall/img/bg_list_li.png) no-repeat 0 center;}
.floorList .floor .mc .catalogue .ca-list ul li a {float:left;overflow:hidden;width:56px;height:20px;padding-left:0;margin-right:8px;line-height:20px;color:#666;}
.floorList .floor .mc .catalogue .ca-list ul li a:hover{color:#c00;}
.floorList .floor .mc .catalogue .ca-txt {background-color: #FFFFFF;}
.floorList .floor .mc .catalogue .ca-txt {width: 161px;height: 25px;line-height: 25px;padding-left: 25px;overflow: hidden;}
.floorList .floor .mc .catalogue .ca-txt b {color: #fff;float: right;font: 14px/23px "microsoft yahei";margin-right: 7px;}
.floorList .floor .mc .catalogue .ca-txt a {color: #fff;font: 14px/23px "microsoft yahei";}
.floorList .floor .mc .catalogue .ca-ad {width: 210px;height: 210px;position: absolute;bottom: 0;left: 0;overflow: hidden;}
.floorList .floor .mc .con {width: 780px;}
.floorList .floor .mc .con .pro-show {width: 582px;height:424px;position: relative;float: left;overflow: hidden;border-bottom: 1px solid #e2e2e2;}
.floorList .floor .mc .con .pro-show ul {overflow: hidden;zoom: 1;padding:0 11px;}
.floorList .floor .mc .con .pro-show li {float:left;overflow:hidden;width:143px;height:206px;padding:0 22px 5px;text-align:left;margin-right:-1px;}
.floorList .floor .mc .con .pro-show li .p-name{overflow:hidden;width:143px;height:1.5em;}
.floorList .floor .mc .con .pro-show li .p-img{width: 143px;height: 143px;overflow: hidden;margin-bottom: 10px;}
.floorList .floor .mc .con .pro-show ul .line1{border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;}
.floorList .floor .mc .con .pro-show ul .line2{border-right:1px dotted #ccc;border-bottom:0px dotted #ccc;}
.floorList .floor .mc .con .pro-show ul .last{border-right:0px;}
.floorList .floor .mc .con .pro-show ul .hide{display: none;}
.floorList .floor .mc .con .pro-list {width: 196px;height:424px;float: right;background-color: #fff;border-bottom: 1px solid #e2e2e2;border-left: 1px solid #e2e2e2;border-right: 1px solid #e2e2e2;}
.floorList .floor .mc .con .pro-list .pmt {width: 196px;height: 40px;overflow: hidden;border-bottom: 1px solid #f4f4f4;}
.floorList .floor .mc .con .pro-list .pmt ul {width: 200px;}
.floorList .floor .mc .con .pro-list .pmt ul li.curr {color: #69a3eb;}
.floorList .floor .mc .con .pro-list .pmt ul li.curr {font-weight: 700;background-color: #fff;border-bottom: 1px solid #fff;}
.floorList .floor .mc .con .pro-list .pmt ul li {width: 100%;height: 39px;border-right: 1px solid #e2e2e2;border-bottom: 1px solid #e2e2e2;float: left;background-color: #f5f5f5;font: 16px/39px "microsoft yahei";text-align: center;}
.floorList .floor .mc .con .pro-list .pmc {width: 196px;height: 360px;}
.floorList .floor .mc .con .pro-list .pmc ul.p-brands {width: 196px;height: 352px;overflow: hidden;display: none;}
.floorList .floor .mc .con .pro-list .pmc ul.p-brands li {padding: 10px 9px;width: 80px;height: 30px;float: left;border-bottom: 1px solid #f4f4f4;}

.p-img {padding: 5px 0;}
.p-img a:link, .p-img a:visited {text-decoration: none;}
.p-img,.p-name,.p-price,.p-market,.p-detail {overflow: hidden;}
.p-name,.p-detail {word-break: break-all;word-wrap: break-word;}
.p-price {color: #999;word-wrap: break-word; word-break: normal;}
.p-price strong,.p-market strong {color: #E4393C;}

.widepage .floorList{width: 1210px;}
.widepage .floorList .floor .mc .con {width: 1000px;}
.widepage .floorList .floor .mc .con .pro-show {width: 802px;}
.widepage .floorList .floor .mc .con .pro-show li {width:150px;}
.widepage .floorList .floor .mc .con .pro-show li .p-name{width:150px;}
.widepage .floorList .floor .mc .con .pro-show li .p-img{width: 150px;height: 150px;}
.widepage .floorList .floor .mc .con .pro-show ul .hide{display: block;}

.floorBottomAd img{width: 990px;height: 70px;}
.widepage .floorBottomAd img{width: 1210px;height: 70px;}

</style>
<#list typeList as child>
<div class="content m">
	<div class="floorList">
		<div class="floor">
			<div class="mt">
				<b>${child_index+1}F</b>&nbsp;&nbsp;&nbsp;${child["catelog"].name}
			</div><!--mt end-->
			<div class="mc">
				<div class="catalogue fl">
                    <div class="ca-list">
                        <ul>
                            <#list child["categrandList"] as cate>
                            <li><a target="_blank" href="${base}/list/${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a></li>
                            <#if cate_index==15><#break></#if>
                            </#list>
                        </ul>
                    </div>
                    <div class="ca-txt">
                        <b>&gt;</b>
                    </div>
                    <div class="ca-ad">
						<a href="${child['floor_left_'+'${child_index+1}'+'_1'].link}" target="_blank"><img alt="${child['floor_left_'+'${child_index+1}'+'_1'].name}" src="${child['floor_left_'+'${child_index+1}'+'_1'].pic}" width="238px" height="192px"></a>
                    </div>
                </div><!--catalogue end-->
                <div class="con fr">
                    <div class="pro-show">
                        <ul>
                            <#list child["goodschildList"] as goodschild>
                            <li class="line<#if goodschild_index lt 4>1<#else>2</#if><#if (goodschild_index==2 || goodschild_index==6)> hide </#if><#if (goodschild_index==3 || goodschild_index==7)> last </#if>">
                                <div class="p-img">
                                    <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}"><img alt="${goodschild.fullName}" data-img="1" width="150" height="150" src="${goodschild.pic}" class="err-product" /></a>
                                </div>
                                <div class="p-name">
                                    <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">${goodschild.fullName}</a>
                                </div>
                                <div class="p-price">
                                    <strong>${goodschild.price?string('currency')}</strong>
                                    <#if (goodschild.marketPrice)?exists><del>${goodschild.marketPrice?string('currency')}</del></#if>
                                </div>
                            </li>
                            </#list>
                        </ul>
                    </div><!--pro-show end-->
                    <div class="pro-list">
                        <div class="pmc">
                            <ul class="p-brands" style="display: block;">
                                <#list child["brandchildList"] as brandchild>
                                <li><a target="_blank" href="#"><img alt="" width="80" height="30" src="${brandchild.pic}"></a></li>
                                </#list>
                            </ul>
                        </div>
                    </div><!--pro-list end-->
                </div><!--con end-->
			</div><!--mc end-->
		</div><!--floor end-->
		<#if child['floor_bottom_'+'${child_index+1}'+'_1']?exists>
        <div class="floor floorBottomAd">
        	<img alt="${child['floor_bottom_'+'${child_index+1}'+'_1'].name}" src="${child['floor_bottom_'+'${child_index+1}'+'_1'].pic}">
        </div><!--floor floorBottomAd end-->
        </#if>
	</div><!--floorList end-->
	<div class="clr"></div>
</div>
</#list>
</#escape>
