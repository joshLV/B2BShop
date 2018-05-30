<#escape x as x?html>
<style>
    #header {padding: 15px 0}

    #logo {float: left;width: 400px}
    #logo a:link b,#logo a:visited b {top: 12px;left: 168px;width: 100px;height: 38px;cursor: pointer}

    #search {float: left;width: 540px; padding: 24px 86px 0 0}
    .widepage #search .i-search {width: 540px !important;}
    #search .i-search {z-index: 11;width:404px;height: 30px;margin-bottom: 3px;border: 3px solid #E4393C}
    #search .form {height: 30px;overflow: hidden}
    #search input {margin: 0;padding: 0;height: 30px;border: 0}
    #search .text {width: 506px;height: 20px;padding: 5px;background-position: 0 -360px;background-color: #fff;background-repeat: repeat-x;line-height: 20px;color: #999;font-family: arial,"\5b8b\4f53";font-size: 14px}
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
    #hotwords a:hover,#hotwords a:active {color: #ff0000;text-decoration: underline; }

    .widepage #search {width: 540px;padding-right: 126px}
    .widepage #search .i-search {width: 540px;}
    .widepage #search .text {width: 452px}
    .widepage #search #shelper {width: 418px}
    #settleup-2013{margin-top:26px;}
</style>

<style>
    #nav {position: relative;z-index: 6;height: 40px;/*padding-left: 210px;margin-bottom: 10px;*/border-bottom:2px solid #b1191a;}
    #navitems {/*background: -moz-linear-gradient(top,#E64346,#E13335);background: -webkit-gradient(linear,0 0,0 100%,from(#E64346),to(#E13335));filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#E64346", endColorstr="#E13335");-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr="#E64346", endColorstr="#E13335")";*/ width:980px; /*padding-left:20px;*/}
    #navitems,#navitems li,#navitems li a {height: 40px; display:block; width:auto; float:left;}
    #navitems li {float: left;width:auto; display:block;}
    #navitems li a {width: auto;text-align: center;color: #ffffff;font:normal 15px/40px "microsoft yahei";text-decoration: none; display:block;}
    #navitems li a:hover{color: #DB0000;}
    #navitems .curr,#navitems .hover {z-index: 1;}
    #navitems .curr a,#navitems .hover a {background: #A40000;}
    .widepage #navitems li {width:auto; float:left;display:block;}
    .widepage #navitems li a {width:auto; display:block; padding-left:20px; padding-right:20px;}

    #categorys .mt b,#categorys h3,#categorys s,#categorys.hover .mt b {background-image: url(${base}/static/mall/img/shortcut_bg.png);background-repeat: no-repeat;}
    #categorys {/*position: absolute;top: 0;left: 0;width: 210px;*/height: auto; }
    #categorys .mt {background: #CD2A2C;}
    #categorys .mt a {display: block;height: 40px;padding-left: 20px;line-height: 40px;color: #fff;}
    #categorys .mt b {top: 10px;right: 10px;width: 20px;height: 20px;background-position: -65px 0;}
    #categorys .mc {display: none;/*position: absolute;*/top: 0;left: 0;width: 210px;height: auto; float:left;  padding: 3px 0 3px 0;/*border:1px solid #E8E8E8;*/overflow: visible; border-right: none; background: #c81623;}
    #categorys .item {width: 209px;height: 28px;/*border-top: 1px solid #FFF;*/}
    #categorys .fore1 {border-top: 0;}
    #categorys span {display: block;width: 203px;position: absolute;z-index: 1;}
    #categorys span a:hover{color: #ffffff !important;}
    #categorys h3 {width: 186px;height: 26px;line-height: 26px;padding-left: 13px;border-width: 1px 0;background-image: none;font-weight: 400;}
    #categorys h3 a:link,#categorys h3 a:visited {color: #ffffff;}
    #categorys h3 a:hover,#categorys h3 a:active {color: #E4393C;font-weight: 700;}
    #categorys s {display: block;position: absolute;top: 10px;left: 189px;width: 6px;height: 9px;background-position: -110px -45px;}
    #categorys .item .i-mc {display: none;position: absolute;left: 209px;top:0px;width: 762px;/*border: 2px solid #e4393c;*/background: #fff;overflow: visible;/*-moz-box-shadow: 0 0 10px #DDD;-webkit-box-shadow: 0 0 10px #DDD;box-shadow: 0 0 10px #DDD;*/}
    #categorys .item dt {padding: 3px 6px 0 0;font-weight: 700;color: #E4393C;}
    #categorys .item dd {padding: 3px 0 0;overflow: hidden;zoom: 1;}
    #categorys .subitem {float: left;width: 740px;/*min-height: 370px;*/padding: 0 4px 0 8px; height: 560px;-moz-box-shadow:0 0 8px #DDD;-webkit-box-shadow:0 0 8px #DDD;box-shadow:0 0 8px #DDD; border: 1px solid #DB0000; border-left: none; border-top: none;}
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
    #categorys .hover span a {color: #DB0000 !important;}
    #categorys .hover .con {/*border:2px solid #e4393c; border-right: none !important; border-left: none !important;border-width: 2px 0;*/background-color: #fff;overflow: hidden;}
    #categorys .hover .con a{color: #666666 !important;}
    /*#categorys .hover s {top: 2px;width: 7px;height: 107px;background: #fff;overflow: hidden;left: 198px;}
#categorys .fore1.hover s {top: 2px;}*/
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
    #categorys .subitem {width: 740px/*477px*/;}
    #categorys .mc .extra {display: none/*block*/;}
    /**-子分类显示宽度增加，不显示品牌-end-**/

    /**汽配城显示3个分类样式重写**/
    #categorys .item {/*border-bottom: 1px dotted #ccc;*/border-bottom:1px solid #e41a29;}
    #categorys .fatheritem1 {height: 110px;}
    #categorys .fatheritem2 {height: 110px; /*background: #f9f7f8;*/}
    #categorys .fatheritem3 {height: 110px;}
    #categorys .fatheritem4 {height: 110px;/* background: #f9f7f8;*/}
    #categorys .fatheritem5 {height: 110px;border-bottom: none !important;}
    #categorys .item .con{position:relative;*zoom:1;/*background:#fff;*/line-height:26px;padding:25px 0 4px 13px;overflow:hidden; /*margin:0 8px;*/ height: 80px;}
    #categorys .item .con a{float:left;overflow:hidden;width:66px;height:26px;padding-left:0;margin-right:8px;line-height:26px;color:#ffffff;}
    #categorys .item .con a:hover,#sortlist .item li a:hover{color:#ffffff;}



    /* 页面新样式 */
    .width_fullscreen{width: 100% !important;}
    .nav_in{width: 1210px; margin: 0 auto;}
    .nav_in li a{color: #333333 !important;}
    .nav_in li a:hover{color: #DB0000 !important;}
    .all_fl{float: left; line-height: 40px; width: 210px; background: #b1191a; text-align: center; margin-top: 2px;}
    .all_fl a{color: #ffffff;}
    .all_fl h2{font-size: 15px;}
</style>

<body class="widepage">
<div id="headerDiv">
	<div class="content" id="header" >
		<div id="logo" class="ld">
			<a href="${base}/index"><b></b><img src="${base}/static/mall/gwq/img/gwqlogo.jpg" height="88"  width="183" alt="<@spring.message "project_name"/>"></a>
		</div><!--logo end-->
		<div id="search">
			<div class="i-search ld">
				<ul id="shelper" class="hide" style="display: none;"></ul>
				<div class="form">
                    <input type="text" class="text" id="kw" autocomplete="off"
                           onkeydown="javascript:if(event.keyCode==13) s($('#kw').val(),'');"
                           style="color: rgb(153, 153, 153);" value="${keyword}">
                    <input type="button" value="搜索" class="button" onclick="s($('#kw').val(),'');return false;">
				</div>
			</div>
			<div id="hotwords">
				<strong>热门搜索：</strong>
				<#--<a href="javascript:void(0)"  onclick="s('葡萄酒','')" style="color:#ff0000">葡萄酒</a>-->
				<#--<a href="javascript:void(0)"  onclick="s('饼干','')">饼干</a>-->
				<#--<a href="javascript:void(0)"  onclick="s('奶粉','')">奶粉</a>-->
				<#--<a href="javascript:void(0)"  onclick="s('洗发水','')">洗发水</a>-->
				<#--<a href="javascript:void(0)"  onclick="s('牙刷','')">牙刷</a>-->
                <#--<#list keywordsList as key>-->
                    <#--<a href="javascript:void(0)"  onclick="s('${key.keywords}','')"  <#if key_index == 0>style="color:#ff0000"</#if>>${key.keywords}</a>-->
                <#--</#list>-->
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
	<div class="content width_fullscreen">
		<div id="nav">
			<div class="nav_in">
			<ul id="navitems" class="prosul">
					<div class="mt ld all_fl">
						<div>
							<h2><a href="${base}/allSort">全部商品分类<b></b></a></h2>
						</div>
					</div>
					<#list middlenavigationList as middlenavigation>
					   <li class="fore" id="nav-home"><a href="<#if "${middlenavigation.urlType}" == "1">${base}/</#if>${middlenavigation.url}" <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
					</#list>
					   <!--li class="fore" id="nav-home"><a href="http://117.34.72.80:8283/" target="_blank">论坛</a></li-->
					</ul><!--navitems end-->
		</div><!--nav end-->
        </div>
	</div>
</div>
<script type="text/javascript">
$(function () {
	rload();
	$("#settleup-url").attr("href", "${base}/cart/list?r="+Math.random());
    $("#settleup-2013 dl").Jdropdown({delay: 200},function() {
		rload();
	});

    $.ajax({
        type: 'post',
        url: '${base}/ajaxGetKeywords',
        success: function(data) {
            var allHtml = "";
            var keyword = $("#kw").val();
            var flag = false;
            for(var i=0;i<data.length;i++) {
                if( data[i]["keywords"] == keyword ){
                    flag = true;
                }
            }
            for(var i=0;i<data.length;i++){
                allHtml += "<a href='javascript:void(0)'  onclick=\"s('"+data[i]["keywords"]+"','')\" ";

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
function s(key,param) {
    if (key != undefined && key != "" && key != "搜一搜") {
        /*alert('34434'+key.replace('/',''));
         window.location.href = "${base}/search/s/" + key.replace('/','');*/
        if(param.length > 0 && param != null && param != "" && param != "undefined" && param != undefined && param != "null"){
            window.location.href = base+"search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g,'址达司杠').replace(/\./g,'址达司点号').replace(/\+/g, '址达司加号')))+"?"+param;
        }else{
            window.location.href = base+"search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g,'址达司杠').replace(/\./g,'址达司点号').replace(/\+/g, '址达司加号')));
        }
    }
}
</script>
</#escape>
</body>