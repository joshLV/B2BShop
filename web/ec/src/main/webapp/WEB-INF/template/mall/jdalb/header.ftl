<#escape x as x?html>
<style>
#header {height: 60px;padding: 15px 0}

#logo {float: left;width: 330px}
#logo a:link b,#logo a:visited b {top: 12px;left: 168px;width: 100px;height: 38px;cursor: pointer}

#search {float: left;width: 430px;padding: 4px 86px 0 0}
#search .i-search {z-index: 11;width: 404px;height: 30px;margin-bottom: 3px;border: 3px solid #E4393C}
#search .form {height: 30px;overflow: hidden}
#search input {margin: 0;padding: 0;height: 30px;border: 0}
#search .text {width: 316px;height: 20px;padding: 5px;background-position: 0 -360px;background-color: #fff;background-repeat: repeat-x;line-height: 20px;color: #999;font-family: arial,"\5b8b\4f53";font-size: 14px}
#search .button {width: 78px;background: #E4393C;font-size: 14px;font-weight: 700;color: #fff}
#search .text,#search .button {-webkit-appearance: none;-webkit-border-radius: 0}
#search .text:focus {background-color: #fcfcfc;-webkit-box-shadow: 2px 2px 3px #d2d2d2 inset;-moz-box-shadow: 2px 2px 3px #d2d2d2 inset;box-shadow: 2px 2px 3px #d2d2d2 inset}
#search #shelper {overflow: hidden;position: absolute;top: 32px;left: -3px;width: 308px;border: 1px solid #E4393C;background: #fff;-moz-box-shadow: 0 0 5px #999;-webkit-box-shadow: 0 0 5px #999;box-shadow: 0 0 5px #999}
#search #shelper li.close:hover {background: 0}
#shelper li {overflow: hidden;padding: 1px 6px;line-height: 22px;cursor: pointer}
#shelper .search-item {float: left;width: 190px;white-space: nowrap;text-overflow: ellipsis;overflow: hidden}
#shelper li.fore1 .search-item {width: 170px}
#shelper .search-count {overflow: hidden;color: #aaa;text-align: right;*zoom: 1}
#shelper .close {border-top: 1px solid #efefef;text-align: right}
#shelper .item3 {cursor: default}
#shelper .item3 a {float: left;margin-right: 10px;white-space: nowrap}
#shelper li.fore1 {width: 100%;padding: 0;border-bottom: 1px solid #ddd}
#shelper li.fore1 .item1 {float: none;width: auto;height: 22px;padding: 1px 2px 1px 20px;overflow: hidden;zoom: 1}
#shelper li.fore1 div.fore1 {padding: 0 6px}
#shelper li.fore1 strong {color: #C00}
#shelper li.fore1 .fore1 strong {color: #333}
#shelper li.fore1 .item1 {float: none;width: auto;padding: 1px 6px 1px 20px}
#shelper li.fore1 .item2 {float: none;width: auto;padding: 1px 6px 1px 20px}
#shelper li.fore1 .item3 {float: none;width: auto;color: #9C9A9C}
#shelper li.fore1 span {float: left}
#shelper li:hover {background: #FFDFC6}
#shelper li.fore1:hover,#shelper li.close:hover {background: 0}
#shelper li.fore1 div:hover {background: #FFDFC6}

#hotwords {height: 18px;color: #999;overflow: hidden}
#hotwords span,#hotwords strong {float: left;font-weight: 400}
#hotwords a:link,#hotwords a:visited {float: left;margin-right: 10px;color: #999}
#hotwords a:hover,#hotwords a:active {color: #E4393C}

.widepage #search {width: 610px;padding-right: 126px}
.widepage #search .i-search {width: 594px}
.widepage #search .text {width: 506px}
.widepage #search #shelper {width: 418px}
</style>

<style>
#nav {position: relative;z-index: 6;height: 40px;padding-left: 210px;margin-bottom: 10px;background: #E4393C;}
#navitems {background: -moz-linear-gradient(top,#E64346,#E13335);background: -webkit-gradient(linear,0 0,0 100%,from(#E64346),to(#E13335));filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#E64346", endColorstr="#E13335");-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr="#E64346", endColorstr="#E13335")";}
#navitems,#navitems li,#navitems li a {height: 40px;}
#navitems li {float: left;position: relative;width: 73px;}
#navitems li a {position: absolute;top: 0;left: 0;width: 75px;text-align: center;color: #fff;font: 700 15px/40px "microsoft yahei";text-decoration: none;}
#navitems .curr,#navitems .hover {z-index: 1;}
#navitems .curr a,#navitems .hover a {background: #A40000;}
.widepage #navitems li {width: 83px;}
.widepage #navitems li a {position: absolute;top: 0;left: 0;width: 85px;}

#categorys .mt b,#categorys h3,#categorys s,#categorys.hover .mt b {background-image: url(${base}/static/mall/img/shortcut_bg.png);background-repeat: no-repeat;}
#categorys {position: absolute;top: 0;left: 0;width: 210px;height: 40px;}
#categorys .mt {background: #CD2A2C;}
#categorys .mt a {display: block;height: 40px;padding-left: 20px;line-height: 40px;color: #fff;}
#categorys .mt b {top: 10px;right: 10px;width: 20px;height: 20px;background-position: -65px 0;}
#categorys .mc {display: none;position: absolute;top: 40px;left: 0;width: 203px;height: 546px;padding: 3px 3px 3px 0;background: #FAFAFA;border: solid #E4393C;border-width: 0 2px 2px;overflow: visible;}
#categorys .item {width: 200px;height: 28px;border-top: 1px solid #FFF;}
#categorys .fore1 {border-top: 0;}
#categorys span {display: block;width: 203px;position: absolute;z-index: 1;}
#categorys h3 {width: 186px;height: 26px;line-height: 26px;padding-left: 13px;border-width: 1px 0;background-image: none;font-weight: 400;}
#categorys h3 a:link,#categorys h3 a:visited {color: #333;}
#categorys h3 a:hover,#categorys h3 a:active {color: #E4393C;font-weight: 700;}
#categorys s {display: block;position: absolute;top: 10px;left: 189px;width: 6px;height: 9px;background-position: -110px -45px;}
#categorys .item .i-mc {display: none;position: absolute;left: 198px;top: 3px;width: 705px;border: 2px solid #DDD;background: #fff;overflow: visible;-moz-box-shadow: 0 0 10px #DDD;-webkit-box-shadow: 0 0 10px #DDD;box-shadow: 0 0 10px #DDD;}
#categorys .item dt {padding: 3px 6px 0 0;font-weight: 700;color: #E4393C;}
#categorys .item dd {padding: 3px 0 0;overflow: hidden;zoom: 1;}
#categorys .subitem {float: left;width: 477px;min-height: 370px;padding: 0 4px 0 8px;}
#categorys .fore13 .subitem {min-height: 382px;}
#categorys .subitem dl {border-top: 1px solid #EEE;padding: 6px 0;overflow: hidden;zoom: 1;}
#categorys .subitem .fore1 {border-top: 0;}
#categorys .subitem dt {float: left;width: 54px;line-height: 22px;text-align: right;}
#categorys .subitem dd {overflow: hidden;*zoom: 1;}
#categorys .subitem em {float: left;height: 14px;margin: 4px 0;line-height: 14px;padding: 0 8px;border-left: 1px solid #ccc;}
#categorys .subitem dt a {color: #E4393C;text-decoration: underline;}
#categorys .subitem dd a {white-space: nowrap;}
#categorys .fr {width: 210px;padding-bottom: 2010px;margin-bottom: -2000px;}
#categorys .fr dl {width: 194px;padding: 6px 8px;}
#categorys .fr a {color: #666;}
#categorys .fr dd {padding-top: 6px;line-height: 20px;overflow: hidden;}
#categorys .fr img {margin-bottom: 4px;}
#categorys .categorys-brands li {float: left;width: 97px;}
#categorys .mc .extra {display: none;}
#categorys .close {position: absolute;top: -1px;left: 706px;z-index: 14;width: 26px;height: 26px;background: rgba(0,0,0,.6);text-align: center;line-height: 26px;color: #fff;cursor: pointer;font-size: 26px;background-color: transparent\9;filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, startColorstr='#60000000', endColorstr='#60000000');}
#categorys .loading-style1 {margin-top: 10px;}
#categorys .fore1 .categorys-brands li,#categorys .fore13 .categorys-brands li {width: 194px;}
#categorys .fore13 .i-mc {top: 23px;}
#categorys .fore13 .categorys-brands li {width: 97px;}
#categorys .fore14 .categorys-brands li {width: 194px;}
#categorys .hover span {z-index: 13;width: 160px;}
#categorys .hover h3 {border: solid #DDD;border-width: 2px 0;background-color: #fff;overflow: hidden;-moz-box-shadow: 0 0 8px #DDD;-webkit-box-shadow: 0 0 8px #DDD;box-shadow: 0 0 8px #DDD;}
#categorys .hover s {top: 0px;width: 7px;height: 28px;background: #fff;overflow: hidden;left: 199px;}
#categorys .fore1.hover s {top: 2px;}
#categorys .hover .i-mc {display: block;z-index: 12;}
#categorys.hover .mt b {background-position: -65px -23px;}
#categorys.hover .mc {display: block;}
*html #categorys .item dd {padding-bottom: 6px;}
*html #categorys .subitem {height: 382px;}
*html #categorys .fore13 .subitem {height: 382px;}
#categorys .categorys-links {padding: 10px 8px;}
#categorys .categorys-links a {display: block;width: 194px;height: 30px;line-height: 80px;overflow: hidden;}
#categorys-links-diy a {background-position: 0 0;}
#categorys-links-dpg a {background-position: 0 -30px;}
#categorys-links-cellphone a {background-position: 0 -60px;}
#categorys-links-jzc a {background-position: 0 -90px;}
#categorys .item-col2 .subitem {width: auto;padding: 0 8px;}
#categorys .sub-item-col {width: 334px;}
#categorys .sub-item-col .fore1 {padding-top: 0;}
#categorys .sub-item-col0 {border-right: 1px solid #eee;margin-right: 8px;margin-bottom: 8px;padding-right: 8px;min-height: 370px;}
*html #categorys .sub-item-col0 {height: 370px;}

/**-子分类显示宽度增加，不显示品牌-start-**/
#categorys .fr {display: none;width: 0px/*210px*/;}
#categorys .subitem {width: 687px/*477px*/;}
#categorys .mc .extra {display: none/*block*/;}
/**-子分类显示宽度增加，不显示品牌-end-**/

/**汽配城显示3个分类样式重写**/
#categorys .item {border-bottom: 1px dotted #ccc;}
#categorys .fatheritem1 {height: 120px;}
#categorys .fatheritem2 {height: 120px;}
#categorys .fatheritem3 {height: 120px;}
#categorys .fatheritem4 {height: 100px;}
#categorys .fatheritem5 {height: 80px;border-bottom: 0px;}
#categorys .item .con{position:relative;*zoom:1;background:#fff;line-height:22px;padding:26px 0 4px 13px;overflow:hidden;border-bottom:0px dotted #ccc;margin:0 8px;}
#categorys .item .con a{float:left;overflow:hidden;width:66px;height:20px;padding-left:0;margin-right:8px;line-height:20px;color:#666;}
#categorys .item .con a:hover,#sortlist .item li a:hover{color:#c00;}
</style>
<div id="headerDiv">
	<div class="content" id="header">
		<div id="logo" class="ld">
			<a href="${base}/index"><b></b><img src="${base}/static/mall/jd/img/logo_index.png" width="270" height="60" alt="<@spring.message "project_name"/>"></a>
		</div><!--logo end-->
		<div id="search">
			<div class="i-search ld">
				<ul id="shelper" class="hide" style="display: none;"></ul>
				<div class="form">
                    <input type="text" class="text" id="kw" autocomplete="off"
                           onkeydown="javascript:if(event.keyCode==13) s($('#kw').val());"
                           style="color: rgb(153, 153, 153);" value="${keyword}">
                    <input type="button" value="搜索" class="button" onclick="s($('#kw').val());return false;">
				</div>
			</div>
			<div id="hotwords">
				<strong>热门搜索：</strong>
				<a href="${base}/search/s/车床" target="_blank" style="color:#ff0000">车床</a>
				<a href="${base}/search/s/轴承" target="_blank">轴承</a>
				<a href="${base}/search/s/电焊机" target="_blank">电焊机</a>
				<a href="${base}/search/s/电阻焊机" target="_blank">电阻焊机</a>
				<a href="${base}/search/s/钢管" target="_blank">钢管</a>
			</div>
		</div>
		<!--search end-->
		<div id="settleup-2013">
			<dl class="">
				<dt class="ld" ><s></s><span class="shopping"><span id="shopping-amount">0</span></span><a href="" id="settleup-url">去购物车结算</a> <b></b> </dt>
				<dd><div class="prompt"><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div></div></dd>
				<dd>
					<div id="settleup-content">
						<div class="smt">
							<h4 class="fl">最新加入的商品</h4>
						</div>
						<div class="smc" id="cartlist">
						</div>
						<div class="smb ar" id ="carttotal">
						</div>
					</div>
				</dd>
			</dl>
		</div>
		<!--settleup end-->
	</div><!--header end-->
	
	<div class="content">
		<div id="nav">
			<div id="categorys">
				<div class="mt ld">
					<h2><a href="${base}/allSort">全部商品分类<b></b></a></h2>
				</div>
				<div id="_ALLSORT" class="mc" >
					<#list catelogList as grandfather>
					<div class="item fore${grandfather_index+1} fatheritem${grandfather_index+1}"> 
    					<span><h3><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h3><s></s></span> 
						<div class="con">
							<#list catelogChildrenMap["${grandfather.id}"] as father>
							<a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a>
							<#if grandfather_index==0 && father_index==7><#break></#if>
							<#if grandfather_index==2 && father_index==9><#break></#if>
							</#list>
						</div>
						<div class="i-mc" style="top: 3px;">
							<div onclick="$(this).parent().parent().removeClass('hover')" class="close">
								&times;
							</div>
							<div class="subitem">
								<#list catelogChildrenMap["${grandfather.id}"] as father>
								<dl class="fore${father_index+1}">
									<dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
									<dd>
									<#list catelogChildrenMap["${father.id}"] as catelog>
									<em><a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></em>
									</#list>
									</dd>
								</dl>
								</#list>
							</div><!--subitem end-->
							<div class="cat-right-con fr">
								<dl class="categorys-brands">
									<dt>推荐品牌</dt>
									<dd><ul><li><a href="${base}" target="_blank"><@spring.message "project_name"/></a></li></ul></dd>
								</dl>
							</div><!--cat-right-con end-->
						</div><!--i-mc end-->
    				</div><!--item end-->
    				<#if grandfather_index==4><#break></#if>
					</#list>
					<div class="extra">
						<a href="${base}/allSort">全部商品分类</a>
					</div>
				</div><!--_ALLSORT end-->
			</div><!--categorys end-->
			<ul id="navitems">
				<#list middlenavigationList as middlenavigation>
	               <li class="fore" id="nav-home"><a href="${base}/${middlenavigation.url}" <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
	            </#list>
	               <li class="fore" id="nav-home"><a href="http://117.34.72.80:8283/" target="_blank">论坛</a></li>
			</ul><!--navitems end-->
		</div><!--nav end-->
	</div>
</div>
<script type="text/javascript">
$(function () {
	rload();
	$("#settleup-url").attr("href", "${base}/cart/list?r="+Math.random());
    $("#settleup-2013 dl").Jdropdown({delay: 200},function() {
		rload();
	});
});
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
		        			 '<div class="p-img fl">'+
		        			 '<a href="${base}/item/'+json[i].goodsId+'.html" target="_blank">'+
		        			 '<img src="'+json[i].pic+'" width="50" height="50" alt="" class="err-product"></a>'+
		        			 '</div>'+
		        			 '<div class="p-name fl">'+
		        			 '<a href="${base}/item/'+json[i].goodsId+'.html" target="_blank">'+json[i].name+'</a>'+
		        			 '</div>'+
		        			 '<div class="p-detail fr ar">'+
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
	                		  '<a href="${base}/cart/list" title="去购物车结算" id="btn-payforgoods">去购物车结算</a>';
	                divtotal.append(data1);
	                if(data!=''){
	                	divshow.append(data);
	                }else{
	                	$("#settleup-content").hide();
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

/**
 * 全站搜索
 */
function s(key) {
    if (key != undefined && key != "") {
        window.location.href = "${base}/search/s/" + key;
    }
}
</script>
</#escape>
