/*
 *  Description: 漂浮广告
 *  Author: jjc
 *  Date: 2012.07.04
 */
;(function ( $, window, document, undefined ) {
    var pluginName = 'floatingAd';
    var defaults = {
		step: 1,
		delay: 50, 
		isLinkClosed: false,
		onClose: function(elem){}
    };
    var ads = {
    	linkUrl: '#',
    	'z-index': '100',
    	'closed-icon': '',
    	imgHeight: '',
    	imgWidth: '',
    	title: '',
    	img: '#',
    	linkWindow: '_blank',
    	headFilter: 0.2
    };

    function Plugin(element, options) {
        this.element = element;
        this.options = $.extend(
        	{}, 
        	defaults, 
        	options, 
        	{
        		width: $(window).width(),
				height: $(window).height(),
        		xPos: this.getRandomNum(0, $(window).width() - $(element).innerWidth()), 
				yPos: this.getRandomNum(0, 300),
				yOn: this.getRandomNum(0, 1),
				xOn: this.getRandomNum(0, 1),
				yPath: this.getRandomNum(0, 1),
				xPath: this.getRandomNum(0, 1),
				hOffset: $(element).innerHeight(),
				wOffset: $(element).innerWidth(),
				fn: function(){},
				interval: 0
			}
        );
        this._defaults = defaults;
        this._name = pluginName;
        
        this.init();
    }

    Plugin.prototype = {
    	init: function () {
    		var elem = $(this.element);
    		var defaults = this.options;
    		var p = this;
    		var xFlag = 0;
    		var yFlag = 0;
    		
    		elem.css({"left": defaults.xPos + p.scrollX(), "top": defaults.yPos + p.scrollY()});
    		defaults.fn = function(){
		    	defaults.width = $(window).width();
				defaults.height = $(window).height();
				
				if(xFlag == p.scrollX() && yFlag == p.scrollY()){
					elem.css({"left": defaults.xPos + p.scrollX(), "top": defaults.yPos + p.scrollY()});
					if (defaults.yOn)
						defaults.yPos = defaults.yPos + defaults.step;
					else
						defaults.yPos = defaults.yPos - defaults.step;
				
					if (defaults.yPos <= 0) {
						defaults.yOn = 1;
						defaults.yPos = 0;
					}
					if (defaults.yPos >= (defaults.height - defaults.hOffset)) {
						defaults.yOn = 0;
						defaults.yPos = (defaults.height - defaults.hOffset);
					}
					
					if (defaults.xOn) 
						defaults.xPos = defaults.xPos + defaults.step;
					else
						defaults.xPos = defaults.xPos - defaults.step;
		
					if (defaults.xPos <= 0) {
						defaults.xOn = 1;
						defaults.xPos = 0;
					}
					if (defaults.xPos >= (defaults.width - defaults.wOffset)) {
						defaults.xOn = 0;
						defaults.xPos = (defaults.width - defaults.wOffset);
					}
				}
				yFlag = $(window).scrollTop();
				xFlag = $(window).scrollLeft();
   			};
   			this.run(elem, defaults);
    	},
    	run: function(elem, defaults){
    		this.start(elem, defaults);
    		this.adEvent(elem,defaults);
    	},
    	start: function(elem, defaults){
    		elem.find('div.close').hide();
    		defaults.interval = window.setInterval(defaults.fn,  defaults.delay);
    		window.setTimeout(function(){elem.show();}, defaults.delay);
    	},
    	getRandomNum: function (Min, Max){  
			var Range = Max - Min;  
			var Rand = Math.random();  
			return(Min + Math.round(Rand * Range));  
		},
		getPath: function(on){
			return on ? 0 : 1;
		},
		clear: function(elem, defaults){
			elem.find('div.close').show();
			window.clearInterval(defaults.interval);
		},
		close: function(elem, defaults, isClose){
			elem.unbind('hover');
  			elem.hide();
  			if(isClose)
				defaults.onClose.call(elem);
		},
		adEvent: function(elem, defaults){
			var obj = {
				elem: this,
			  	fn_close: function() {
			   		this.elem.close(elem, defaults, true);
			  	},
			  	fn_clear: function() {
			  		if(this.elem.options.isLinkClosed)
			  			this.elem.close(elem, defaults, false);
			  	}
			};
			
    		elem.find('div.button').bind('click', jQuery.proxy(obj, "fn_close"));
    		
    		elem.find('a').bind('click', jQuery.proxy(obj, "fn_clear"));
    		
    		var stop = {
				elem: this,
			  	over: function(){
			    	this.elem.clear(elem, defaults);
			  	},
			  	out: function(){
					this.elem.start(elem, defaults);
			  	}
			};
    		
    		elem.hover(
			    jQuery.proxy(stop, "over"),
				jQuery.proxy(stop, "out")
			);
		},
		scrollX: function(){
			var de = document.documentElement;
			return self.pageXOffset || (de && de.scrollLeft) || document.body.scrollLeft;
		},
		scrollY: function(){
			var de = document.documentElement;
			return self.pageYOffset || (de && de.scrollTop) || document.body.scrollTop;
		}
	};
    $.fn.floatingAd = function(options) {
        return this.children("div").each(function (i, elem) {
            if (!$.data(this, 'plugin_' + pluginName)) {
                $.data(this, 'plugin_' + pluginName, new Plugin(this, options));
            }
        });
    };
	$.floatingAd = function(options){
		
		if(options){
	    	if(options.ad){
	    		var adDiv = $('#' + pluginName);
	    		
	    		if(adDiv.length <= 0)
		    		adDiv = $('<div>', {
		    			'id': pluginName,
		    			'class': pluginName
		    		}).appendTo('body');
		    		
	    		for(var i in options.ad){
	    			
	    			var ad = options.ad[i];
	    			ad = $.extend({}, ads, ad);
	    			//漂浮层
	    			var div = $('<div>', {
	    				'class': 'ad'
	    			});
	    			
	    			div.css("z-index", ad['z-index']);
	    			
	    			//关闭层
	    			var closeDiv = $('<div>', {
	    				'class': 'close',
	    				'style': (ad.imgWidth ? 'width:' + ad.imgWidth + 'px;' : '')
	    			});
	    			$('<div>', {
	    				'class': 'opacity',
	    				'style': 'opacity: ' + ad.headFilter + ';filter: alpha(opacity = ' + ad.headFilter*100 + ');'
	    			}).appendTo(closeDiv);
	    			
	    			$('<div>', {
	    				'class': 'text'
	    			}).append(
	    				$('<div>', {
	    					'class': 'title',
	    					'text': ad.title
	    				})
	    			).append(
	    				$('<div>', {
	    					'class': 'button',
	    					'style': ad['closed-icon'] ? 'background:url("' + ad['closed-icon'] + '") no-repeat;' : ''
	    				})
	    			).appendTo(closeDiv);
	    			
	    			closeDiv.appendTo(div);
	    			
	    			//内容层
	    			var content = $('<div>');
	    			
	    			$('<a>', {
	    				href: ad.linkUrl,
	    				target: ad.linkWindow,
	    				title: ad.title
	    			}).append(
	    				$('<img>', {
	    					'src': ad.img,
	    					'style': (ad.imgHeight ? 'height:' + ad.imgHeight + 'px;' : '') + 
	    					         (ad.imgWidth ? 'width:' + ad.imgWidth + 'px;' : '')
	    				})
	    			).appendTo(content);
	    			
	    			content.appendTo(div);
	    			
	    			div.appendTo(adDiv);
	    		}
	    		delete options.ad;
	    		$('#' + pluginName).floatingAd(options);
	    	}
	    } 
		else
	      	$.error('漂浮广告错误!');
	};
})(jQuery, window, document);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ef="${base}/item/${goods.id}.html" title="${goods.name}" target="_blank" >${goods.fullName}</a>
                                </td>
                                <td width="140" style="text-align:center">商品规格</td>
                                <td width="220" style="text-align:center">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</td>
                                <td width="210" style="text-align:center">当前价格</td>
                                <td width="144" style="text-align:center">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</td>
                                <#--20160505 dzz 隐藏库存显示-->
                                <#--<td width="114" style="text-align:center">库    存</td>-->
                            </tr>
                            <tr class="pro_pf_tr2">
                                <td width="76" class="pro_checkbox">
                                    <input type="checkbox" id="checkbox_${goods.id}" class="regular-pf-checkbox" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.shopId}" </#if>/>
                                    <label for="checkbox-1-1"></label>
                                </td>
                                <td width="100">
                                    <a target="_blank" href="${base}/item/${goods.id}.html">
                                        <img src="<#if goods.image??>${goods.image}@90w_90h.png</#if>" width="90" height="90" alt="${goods.name}" title="${goods.name}" style="border: 1px solid #E6E6E6;">
                                    </a>
                                </td>
                                <td width="300"><div class="pro_name">
                                    <#--<p><em>所属商家：</em><a href="javascript:void(0);" onclick="allG('${goods.shopId}','${goods.shopName}','','','','vt=list')" >${goods.shopName}</a></p>-->
                                    <p class="textoverflow"><em>商品简称：</em><a href="javascript:void(0);" onclick="allG('${mid}','','${goods.shortName}','','','vt=list')">${goods.shortName}</a></p>
                                    <p><em>商品条码：</em>${goods.barcode}</p>
                                    <p><em>包装规格：</em>${goods.packageModulus}&nbsp;<#if goods.unit?? && goods.unit != ''>${goods.unit}<#else>个</#if>/<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>件</#if></p>
                                </div></td>
                                <td width="140" class="pro_color" >
                                <#if goodsSpList??>
                                    <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                    <div class="f-cb" style="width: 180px; height: 32px;"><em>${sp.name}：</em>
                                    <select name="goodsSp_${goods.id}" spid="${sp.id}" spname="${sp.name}">
                                        <#list goodsSpList["${goods.id}"]["goodsSpItemList"] as item>
                                            <#if item.specificationId == sp.id>
                                                <option value="${sp.name}:${item.name}" <#if item_index==0>selected="selected"</#if>>${item.name}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                    </div>
                                    </#list>
                                </#if>
                                </td>
                                <td width="220">
                                    <input type="hidden" value="${goods.enableBatchPrice}" name="name" id="ifBatchPriceId_${goods.id}" />

                                        <ul class="price_info">
                                            <li>
                                                <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="商城价" title="商城价"></i>
                                                <#if priceHide ="hide" >
                                                 <span>会员可见!</span>
                                                <#else >
                                                    ￥
                                                    <#if goods.enableBatchPrice == '1'>
                                                        ${goods.batchPrice}
                                                    <#else >
                                                    ${goods.price?string("##0.00")}
                                                    </#if>
                                                </#if>
                                            </li>
                                            <li class="red">
                                                <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="会员价" title="会员价"></i>
                                                <#if priceHide ="hide" >
                                                    <span>会员可见!</span>
                                                <#else >
                                                    ￥
                                                    <#if goods.enableBatchPrice == '1'>
                                                    ${goods.batchPrice}
                                                    <#else >
                                                    ${(goods.price*(1 - goods.defaultPrice/100))?string('##0.00')}
                                                    </#if>
                                                </#if>
                                            </li>

                                        </ul>

                                </td>
                                <td width="210">
                                    <ul class="price_info">
                                        <li>
                                            <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="商城价" title="商城价"></i>
                                            <#if priceHide ="hide" >
                                                <span>会员可见!</span>
                                            <#else >
                                            <span id="${goods.id}_nowPrice">￥
                                            <#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                            ${goods.maxBatchPrice?string("##0.00")}
                                            <#else >
                                            ${goods.price?string('##0.00')}
                                            </#if>
                                            </span>
                                            </#if>

                                        </li>
                                        <li class="red">
                                            <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="会员价" title="会员价"></i>
                                            <#if priceHide ="hide" >
                                                <span>会员可见!</span>
                                            <#else >
                                                <span id="${goods.id}_nowMemPrice">
                                                    ￥<#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                                ${((goods.maxBatchPrice?number)*(1 - goods.defaultPrice/100))?string('##0.00')}
                                                <#else >
                                                ${((goods.price?number)*(1 - goods.defaultPrice/100))?string('##0.00')}
                                                </#if>
                                                </span>
                                            </#if>
                                        </li>

                                    </ul>
                                </td>
                                <td width="130" class="pro_number">
                                    <div style="margin: 0 auto; width: 86px; padding-bottom: 2px;">
                                    <#if 0<goods.stock>
                                        <input type="text" name="textfield" id="textfield" value="-"
                                               class="pro_minus" readonly="ture" onfocus="this.blur()"
                                               onclick="javascript:reduce('${goods.id}');">
                                        <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                               class="pro_mid" placeholder="1"
                                               onblur="change('${goods.id}','${goods.price}')"
                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                               value="<#if goods.enableBatchPrice == '1'>${goods.startBatchNum}<#else>${goods.startNum}</#if>"
                                               onchange="change('${goods.id}')">
                                        <input type="text" name="textfield3" id="textfield3" value="+"
                                               class="pro_add" readonly="ture" onfocus="this.blur()"
                                               onclick="javascript:add('${goods.id}');">
                                    <#else>
                                        <input type="text" name="textfield" id="textfield" value="-"
                                               class="shop_add" readonly="ture" onfocus="this.blur()">
                                        <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                               class="shop_number" placeholder="1" readonly="ture"
                                               value="0" onfocus="this.blur()">
                                        <input type="text" name="textfield3" id="textfield3" value="+"
                                               class="shop_add" readonly="ture" onfocus="this.blur()">
                                    </#if>
                                    </div>


                                    <div style="float: none; text-align: center; padding-top: 5px; ">
                                        共&nbsp;&nbsp;
                                        <span id="unitNum_${goods.id}" style="font-weight: bold;color: red;">
                                        <#if goods.enableBatchPrice == '1'>
                                            ${goods.startBatchNum/goods.packageModulus}
                                        <#else>
                                            ${goods.startNum/goods.packageModulus}
                                        </#if>
                                        </span>
                                        &nbsp;&nbsp;<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>件</#if>
                                    </div>
                                </td>
                                <#--20160505 dzz 隐藏库存显示-->
                                <#--<td width="114" class="pro_kc">
                                    <#if goods.stock<=0>
                                        0<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>
                                    <#else>
                                        ${goods.stock?string(',##0')}<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>
                                    </#if>
                                </td>-->
                            </tr>
                        </table>
                    </div>
                    <div class="fanli_2" <#if goods.hasRebate=='no'>style="display:none;"</#if>>返利</div>
                </li>
            </#list>
            </ul>
            </form>
        </div>
        <div class="all_checkbox f-cb"  id="shopping_total" >
            <div class="all_chk_left">
                <div class="chk">
                    <input type="checkbox" id="checkall" value="全选"  name="cartIdAll" />
                    <label for="checkbox-1-6"></label>
                </div>
                <em>全选</em>
            </div>
            <div class="f-fl moretip" id="tip_notice"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if></div>
            <a  href="javascript:;" onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));" id="checkout_btn" >加入购物车</a> </div>
    </div><#-- main end -->
<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>

    <#include "bec/ghj/b2b/spfl.ftl"/>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghj/js/allGoods/ajaxGetAllGoods.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script type="text/javascript">
    var priceHide = '${priceHide}';
    var _mid= '${mid}';
    var _mn= '${mn}';
    $(function () {
        $("#cartListForm").on("ifChanged",function(){
            if($("#product-list input[name='cartId']").length > 0){
                var checked = true;
                $("#product-list input[name='cartId']").each(function(){
                    if(!this.checked){
                        return checked = false;
                    }
                });
                if(checked){
                    $("#checkall").iCheck("check");
                }else{
                    $("#checkall").iCheck("uncheck");
                }

            }
        });
        $("#checkall").on("ifClicked",function(event){
            $("#product-list input[name='cartId']").iCheck(this.checked ? "uncheck" : "check");
        });
        $("#toSettlement").on('click', function(){
            judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));
        });
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15,scrolling:false});
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
        }
        changeShoppingCartTotal();
        $(window).scroll(function(){
            changeShoppingCartTotal();
        });


        //分类
        $(".xj-hy").on('click',function(){
            $(".category_select_container").show().css({top:$(this).offset().top+37+"px",left:$(this).offset().left+"px"}).attr("index",$(this).parents("tr").index());
        });
        $(".close").on('click',function(){
            $(".category_list").eq(0).find("li").removeClass("current");
            $(".category_list").eq(1).html("");
            $(".category_list").eq(2).html("");
            $(this).parents(".category_select_container").hide().removeAttr("index");
            $("#page_search_btn").trigger("click");

        });
        $(".category_list").on('click','li',function(){
            $(this).parent("ul").find("li").removeClass("current");
            $(this).addClass("current");
            var id=$(this).find("a").attr("categoryid");
            var level=$(this).parent("ul").attr("level");
            var path=$(this).find("a").attr("catelogpath");
            var pathname="";
            $("#clp").val(path);
            if(level<3) {
                $.ajax({
                    url: "${base}/getSons",
                    data: {id: id},
                    success: function (data) {
                        if (data.status == "exception") {
                            alert(data.message);
                        } else if (data.status == "success") {
                            level++;
                            $(".category_list").eq(level-1).html("");
                            $(".category_list").eq(level).html("");
                            var html = "";
                            var itemclass = "class=\"item_p\"";
                            if (level == 3) {
                                itemclass = "";
                            }
                            $.each(data.sons, function (index, catelog) {
                                html += "<li><a href=\"javascript:;\" target=\"_self\" leaf=\"0\" categoryid=\"" + catelog.id + "\" catelogpath=\"" + catelog.path + "\" title=\"" + catelog.name + "\" " + itemclass + ">" + catelog.name + "</a></li>";
                            })
                            $(".category_list").eq(level-1).html(html);
                            if(level==2){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">";
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==3){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">";
                                pathname = $(".category_list").eq(1).find(".current > a").text();
                            }
                            $(".xj-hy").val(pathname);
                        } else {
                            $(this).removeClass("item_p");
                            if(level==1){
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==2){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text();
                                pathname = $(".category_list").eq(1).find(".current > a").text();
                            }
//                            $(".xj-id").val(id);
//                            $("#clp").val(path);
                            level++;
//                            $(".category_list").eq(level-1).html("");
//                            $(".category_list").eq(level).html("");
                            $(".xj-hy").val(pathname);
                        }
                    },
                    error: function () {
                        alert("获取服务器数据失败！请刷新后重试！");
                    }
                });
            }else{
//                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">" + $(this).find("a").text();
                pathname = $(this).find("a").text();
//                $(".xj-id").val(id);
//                $(".xj-path").val(path);
            }
            $(".xj-hy").val(pathname);
        });
    });



    //购物车结算效果
    function changeShoppingCartTotal(){
        var wh=$(window).height();
        var top=$(window).scrollTop();
        //console.log($(window).height()+" "+$(window).scrollTop());
        var it=$("#show").offset().top;
        var ih=$("#show").height();
        if(((wh+top)-(it+ih+100))>0){
            $("#shopping_total").css("position","static");
        }else{
            $("#shopping_total").css({"position":"fixed","bottom":"-28px","z-index":"99999"});
        }
    }





    /** -------------------------加入购物车  Start -------------------------------*/


    function goToGoodsCars(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var goodsIds = '';
                var i = 0;
                $(selected).each(function(){
                    if(i > 0){
                        goodsIds += '--';
                    }
                    goodsIds += $(this).val();
                    goodsIds += "_"+$("#nowGoodsNum_"+$(this).val()).val();

                    //组装规格
                    if( $('select[name="goodsSp_'+ $(this).val() +'"]').length > 0 ){
                        var sp = '';
                        var j = 0;
                        $("select[name='goodsSp_"+ $(this).val() +"']").each(function(){
                            if(j > 0){
                                sp += ","
                            }
                            sp += $(this).val();
                            j++;
                        });
                        goodsIds += '_' + sp;
                    }

                    i++;
                });
                window.location.href = "${base}/cart/addBatch?goodsIds=" + goodsIds + "&backurl=" + window.location.href

            }catch (e) {
            }
        }else{
            layer.alert("请至少选中一件商品!",{icon:7});
        }
    }

    /**
     * Desc:商品数量执行减去操作
     * @param goodsId
     * @param goodsPrice
     */
    function reduce(goodsId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus_"+goodsId).val();
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(reduceGoodsNum % defPackageModulus != 0){
            reduceGoodsNum = (parseInt(reduceGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            packagingConversion(goodsId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(reduceGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(reduceGoodsNum>0) {
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    packagingConversion(goodsId);
                }
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+reduceGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(reduceGoodsNum);
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            packagingConversion(goodsId);
                        }
                    }
                });
            }
        }else{//无批发价时
            if(reduceGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
                packagingConversion(goodsId);
                return;
            }else{
                $("#nowGoodsNum_"+goodsId).val(parseInt(reduceGoodsNum));
                packagingConversion(goodsId);
            }
        }
    }

    /**
     * Desc:商品数量执行改变操作
     * @param goodsId
     * @param goodsPrice
     */
    function change(goodsId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());

        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = parseInt($("#nowGoodsNum_"+goodsId).val());
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(nowGoodsNum % defPackageModulus != 0){
            nowGoodsNum = (parseInt(nowGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        /**
         * 如果限购数量为零，说明启用了限购数量
         *  超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
         *  TianYu 2016-2-17 10:17:17
         */
        if( defLimitNum != 0 && nowGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            packagingConversion(goodsId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断改变之后的数量是否小于起批数量
            if(nowGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(reduceGoodsNum>0) {
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    packagingConversion(goodsId);
                }
                return;
            }else if(nowGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                packagingConversion(goodsId);
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+nowGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(nowGoodsNum);
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            packagingConversion(goodsId);
                        }
                    }
                });
            }
        }else{//无批发价时
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
                packagingConversion(goodsId);
                return;
            }else{
                $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
                packagingConversion(goodsId);
            }
        }
    }

    function add(goodsId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = $("#defStartBatchPrice_"+goodsId).val();
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //加1之后的商品数量
        //修改默认值为1的情况下 手动输入和点击加号算法不一致的情况  yuech 2016-02-23 14:23
        var addGoodsNum = parseInt(nowGoodsNum) + defPackageModulus;
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(addGoodsNum % defPackageModulus != 0){
            var i = parseInt(addGoodsNum / defPackageModulus);
            addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            packagingConversion(goodsId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(defStartBatchPrice).toFixed(2));
                packagingConversion(goodsId);
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                            packagingConversion(goodsId);
                        }
                    }
                });
            }
        }else{//无批发价时
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(1);
                packagingConversion(goodsId);
                return;
            }else{
                $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                packagingConversion(goodsId);
            }
        }
    }

    //计算大包装数量
    function packagingConversion(goodsId){
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        var nowGoodsNum = parseInt($("#nowGoodsNum_"+goodsId).val());
        $("#unitNum_"+goodsId).text(nowGoodsNum / defPackageModulus);
    }
    /** -------------------------加入购物车  end -------------------------------*/


    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    function highlight(key) {
        var html=$("#plist").html();
        var key = key.split('|');
        for (var i=0; i<key.length; i++) {
            var content = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
        }
        $("#plist").html(content);
    }
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }

    function allG(mid,mn,sn,cl,bc,param) {
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
            return false;
        }

        var clp = $("#clp").val();

        if( mn == '' ){
            mn = $("#mn").val();
        }
        if( sn == '' ){
            sn = $("#sn").val();
        }
        if( bc == '' ){
            bc = $("#bc").val();
        }
        if( cl == '' ){
            cl = $("#cl").val();
        }
        //如果存在用供应商ID查询的精准查询，需要判断供应商名称是否和查询条件中的一致，
        // 如果不一致，说明查询条件已修改,查询时不组装此条件
        if( _mid != '' && _mn != $.trim(mn)){
            _mid = '';
            mid = '';
        }

        //组装查询条件
        var filter = '';
        if($.trim(mn) != ''){
            filter += "mn=" + encodeURI(encodeURI($.trim(mn)));
        }
        if($.trim(sn) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "sn=" + encodeURI(encodeURI($.trim(sn)));
        }
        if($.trim(bc) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "bc=" + encodeURI(encodeURI($.trim(bc)));
        }
        if($.trim(cl) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "cl=" + encodeURI(encodeURI($.trim(cl)));
        }
        if($.trim(clp) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "clp=" + clp;
        }
        if( mid != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "mid=" + mid;
        }

        if(filter != '' && param != ''){
            filter += '&' + param;
        }else if(filter == '' && param != ''){
            filter += param;
        }

        if(filter != ''){
            filter = '?' + filter;
        }
        window.location.href = "${base}/allG.html" + filter;
    }


    function goToOrder(){
        loadGoods();
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        if(priceHide != 'hide'){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        priceHide = flag ? "" : "hide";
    }
    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
        window.location.href = window.location.href;
    }

</script>

<script>
    $(document).ready(function(){
        $('input:checkbox').iCheck({
            checkboxClass: 'icheckbox_square-red',
            radioClass: 'iradio_square-red',
            increaseArea: '20%'
        });
    });
</script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>