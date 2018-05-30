<#escape x as x?html>
<style>
#showcase {overflow: hidden}
#showcase .mt {margin-bottom: 0px}
#showcase .mt h2 {display: none}
#showcase .sc-list {*margin-bottom: 10px}
#showcase .sc-list .item {position: relative;float: left;width: 240px;height: 190px;overflow: hidden;margin: 0 10px 10px 0;}
#showcase .sc-list .item .aside {position: absolute;z-index: 1;left: 0;top: 0;width: 100px;height: 160px;padding: 30px 0 0 20px;}
#showcase .sc-list .item .s-link {position: absolute;width: 100%;height: 100%;left: 0;top: 0;z-index: 2;}
#showcase .sc-list .item h3 {color: #333;font-size: 18px;font-family: "microsoft yahei";line-height: 20px;height: 20px;overflow: hidden;margin-bottom: 5px;}
#showcase .sc-list .item .s-name {width: 84px;height: 20px;overflow: hidden;color: #999;font-size: 13px;font-family: "microsoft yahei";line-height: 20px;}
#showcase .sc-list .item .s-ext {margin-top: 2px;line-height: 18px;width: 90px;height: 18px;overflow: hidden;}
#showcase .sc-list .item .s-ext b {display: inline-block;padding: 0 2px;color: #fff;font-size: 12px;font-weight: 400;background: #E4393C;}
#showcase .sc-list .item .s-hotword {padding: 20px 0 0;}
#showcase .sc-list .item .s-hotword li {position: relative;line-height: 18px;padding-left: 6px;height: 18px;overflow: hidden;color: #888;font-family: "microsoft yahei";}
#showcase .sc-list .item .s-hotword li i {position: absolute;display: block;overflow: hidden;vertical-align: middle;left: 0;top: 8px;width: 2px;height: 2px;background: #999;}
#showcase .sc-list .item .s-img {display: block;width: 295px;height: 190px;}
#showcase .sc-list .item .s-img img {display: block;position: absolute;left: 0;top: 0;}
#showcase .sc-list .item.w-bg .aside {filter: progid:DXImageTransform.Microsoft.gradient(enabled='true', startColorstr='#BFFFFFFF', endColorstr='#BFFFFFFF');background: rgba(255,255,255,.75);}
#showcase .sc-list .item.w-bg .s-name {color: #666;}
#showcase .sc-list .item.w-bg .s-ext {margin-top: 0;}
#showcase .sc-list .item.w-bg .s-ext b {padding: 0;color: #ea6365;font-family: "microsoft yahei";background: 0;}
#showcase .sc-bottom .item {width: 990px;}
#showcase .sc-bottom .item img {/*margin-left: -110px;*/}
#showcase.advanced .sc-list .item .s-img img {-webkit-transition: all .3s ease;-moz-transition: all .3s ease;-ms-transition: all .3s ease;-o-transition: all .3s ease;transition: all .3s ease;left: 0;}
#showcase.advanced .sc-list .item:hover .s-img img,#showcase.advanced .sc-list .item:active .s-img img {left: -10px}

.widepage #showcase .sc-list .item {width: 295px;}
.widepage #showcase .sc-bottom .item img {margin-left: 0;}
#showcase .mc {width: 1020px;}
.widepage #showcase .mc {width: 1240px;}
</style>
<div id="showcase" class="content advanced">
	<div class="mt">
		<!-- 广告位 001 -->
		<h2>精彩展示</h2>
		<img data-img="2" alt="" height="24" src="${base}/static/mall/ad/ad-001.png" class="err-product">
		<!-- 广告位 001 end -->
	</div><!-- mt end -->
	<div class="mc">
		<div class="sc-list clearfix">
		<#list wonderfulShow as show>
			<div class="item w-bg">
				<div class="aside">
					<a class="s-link" target="_blank" href="${show.link}"></a>
					<h3>${show.name}</h3>
					<div class="s-name">
						<a target="_blank" href="${show.link}">${show.introduction}</a>
					</div>
					<div class="s-ext">
						<b>${show.point}</b>
					</div>
				</div>
				<a class="s-img" target="_blank" href="${show.link}">
					<img class="err-product" width="305px" height="190px" data-img="2" alt="" src="${show.pic}">
				</a>
			</div><!--item end-->
		</#list>
	<script type="text/javascript">
	    $(function () {
    		var item = {width: 305,height: 190,widthB: 240,heightB: 190};
			item = pageConfig.FN_GetCompatibleData(item);
			$("#showcase .sc-list .item").find("img").attr("width", item.width).attr("height", item.height);
	    });
	</script>
	</div><!-- sc-list end -->
				
		<div id="showcase-promotion-1" class="sc-bottom" style="display:none;">
			<div class="item">
			    <!-- 广告位 index_01_01 -->
			    <script type="text/javascript">
			    $(function () {
                    var imgSrc="";
                    var url="";
                    $.ajax({
                        type: "POST",
                        url: "${base}/ad?sign=floor_1_2&&size=1",
                        datatype: 'json',
                        async:false,
                        success: function(data) {
                            var t = JSON.stringify(data);
                            $.each(data.imgs,function(i,v){
                                imgSrc=v.pic;
                                url= v.link;
                            });
                        }
                    });
			    	var b = [{
				        srcA: "",
				        srcB: imgSrc,
				        href: url,
				        alt: "",
				        id: "index_01_01"
				    }];
				    var c = b[0];
					var adImgConf = {width:1210,height:70,widthB:990,heightB:70};
					adImgConf = pageConfig.FN_GetCompatibleData(adImgConf);
				    var e = '<a target="_blank" href="' + c.href + '" >' + '<img width="'+adImgConf.width+'" height="'+adImgConf.height+'" data-img="2" data-lazyload="' + c.srcB + '" alt="' + c.alt + '">' + '</a>';
				    $("#showcase-promotion-1").children(".item").append(e);
				    document.getElementById("showcase-promotion-1").style.display="block";
			    });
				</script>
			</div>
		</div><!-- sc-bottom end -->
						
	</div><!-- mc end -->
</div><!--showcase end-->
</#escape>
