﻿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function()
{
	var loadedLangs = {};

	/**
	 * @namespace Holds language related functions.
	 */
	CKEDITOR.lang =
	{
		/**
		 * The list of languages available in the editor core.
		 * @type Object
		 * @example
		 * alert( CKEDITOR.lang.en );  // "true"
		 */
		languages :
		{
			'af'	: 1,
			'ar'	: 1,
			'bg'	: 1,
			'bn'	: 1,
			'bs'	: 1,
			'ca'	: 1,
			'cs'	: 1,
			'cy'	: 1,
			'da'	: 1,
			'de'	: 1,
			'el'	: 1,
			'en-au'	: 1,
			'en-ca'	: 1,
			'en-gb'	: 1,
			'en'	: 1,
			'eo'	: 1,
			'es'	: 1,
			'et'	: 1,
			'eu'	: 1,
			'fa'	: 1,
			'fi'	: 1,
			'fo'	: 1,
			'fr-ca'	: 1,
			'fr'	: 1,
			'gl'	: 1,
			'gu'	: 1,
			'he'	: 1,
			'hi'	: 1,
			'hr'	: 1,
			'hu'	: 1,
			'is'	: 1,
			'it'	: 1,
			'ja'	: 1,
			'ka'	: 1,
			'km'	: 1,
			'ko'	: 1,
			'lt'	: 1,
			'lv'	: 1,
			'mn'	: 1,
			'ms'	: 1,
			'nb'	: 1,
			'nl'	: 1,
			'no'	: 1,
			'pl'	: 1,
			'pt-br'	: 1,
			'pt'	: 1,
			'ro'	: 1,
			'ru'	: 1,
			'sk'	: 1,
			'sl'	: 1,
			'sr-latn'	: 1,
			'sr'	: 1,
			'sv'	: 1,
			'th'	: 1,
			'tr'	: 1,
			'uk'	: 1,
			'vi'	: 1,
			'zh-cn'	: 1,
			'zh'	: 1
		},

		/**
		 * Loads a specific language file, or auto detect it. A callback is
		 * then called when the file gets loaded.
		 * @param {String} languageCode The code of the language file to be
		 *		loaded. If null or empty, autodetection will be performed. The
		 *		same happens if the language is not supported.
		 * @param {String} defaultLanguage The language to be used if
		 *		languageCode is not supported or if the autodetection fails.
		 * @param {Function} callback A function to be called once the
		 *		language file is loaded. Two parameters are passed to this
		 *		function: the language code and the loaded language entries.
		 * @example
		 */
		load : function( languageCode, defaultLanguage, callback )
		{
			// If no languageCode - fallback to browser or default.
			// If languageCode - fallback to no-localized version or default.
			if ( !languageCode || !CKEDITOR.lang.languages[ languageCode ] )
				languageCode = this.detect( defaultLanguage, languageCode );

			if ( !this[ languageCode ] )
			{
				CKEDITOR.scriptLoader.load( CKEDITOR.getUrl(
					'_source/' +	// @Packager.RemoveLine
					'lang/' + languageCode + '.js' ),
					function()
						{
							callback( languageCode, this[ languageCode ] );
						}
						, this );
			}
			else
				callback( languageCode, this[ languageCode ] );
		},

		/**
		 * Returns the language that best fit the user language. For example,
		 * suppose that the user language is "pt-br". If this language is
		 * supported by the editor, it is returned. Otherwise, if only "pt" is
		 * supported, it is returned instead. If none of the previous are
		 * supported, a default language is then returned.
		 * @param {String} defaultLanguage The default language to be returned
		 *		if the user language is not supported.
		 * @param {String} [probeLanguage] A language code to try to use,
		 *		instead of the browser based autodetection.
		 * @returns {String} The detected language code.
		 * @example
		 * alert( CKEDITOR.lang.detect( 'en' ) );  // e.g., in a German browser: "de"
		 */
		detect : function( defaultLanguage, probeLanguage )
		{
			var languages = this.languages;
			probeLanguage = probeLanguage || navigator.userLanguage || navigator.language || defaultLanguage;

			var parts = probeLanguage
					.toLowerCase()
					.match( /([a-z]+)(?:-([a-z]+))?/ ),
				lang = parts[1],
				locale = parts[2];

			if ( languages[ lang + '-' + locale ] )
				lang = lang + '-' + locale;
			else if ( !languages[ lang ] )
				lang = null;

			CKEDITOR.lang.detect = lang ?
				function() { return lang; } :
				function( defaultLanguage ) { return defaultLanguage; };

			return lang || defaultLanguage;
		}
	};

})();
                                                                                                                                                                                      ﻿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.dialog.add('a11yHelp',function(a){var b=a.lang.accessibilityHelp,c=CKEDITOR.tools.getNextId(),d={8:'BACKSPACE',9:'TAB',13:'ENTER',16:'SHIFT',17:'CTRL',18:'ALT',19:'PAUSE',20:'CAPSLOCK',27:'ESCAPE',33:'PAGE UP',34:'PAGE DOWN',35:'END',36:'HOME',37:'LEFT ARROW',38:'UP ARROW',39:'RIGHT ARROW',40:'DOWN ARROW',45:'INSERT',46:'DELETE',91:'LEFT WINDOW KEY',92:'RIGHT WINDOW KEY',93:'SELECT KEY',96:'NUMPAD  0',97:'NUMPAD  1',98:'NUMPAD  2',99:'NUMPAD  3',100:'NUMPAD  4',101:'NUMPAD  5',102:'NUMPAD  6',103:'NUMPAD  7',104:'NUMPAD  8',105:'NUMPAD  9',106:'MULTIPLY',107:'ADD',109:'SUBTRACT',110:'DECIMAL POINT',111:'DIVIDE',112:'F1',113:'F2',114:'F3',115:'F4',116:'F5',117:'F6',118:'F7',119:'F8',120:'F9',121:'F10',122:'F11',123:'F12',144:'NUM LOCK',145:'SCROLL LOCK',186:'SEMI-COLON',187:'EQUAL SIGN',188:'COMMA',189:'DASH',190:'PERIOD',191:'FORWARD SLASH',192:'GRAVE ACCENT',219:'OPEN BRACKET',220:'BACK SLASH',221:'CLOSE BRAKET',222:'SINGLE QUOTE'};d[CKEDITOR.ALT]='ALT';d[CKEDITOR.SHIFT]='SHIFT';d[CKEDITOR.CTRL]='CTRL';var e=[CKEDITOR.ALT,CKEDITOR.SHIFT,CKEDITOR.CTRL];function f(j){var k,l,m=[];for(var n=0;n<e.length;n++){l=e[n];k=j/e[n];if(k>1&&k<=2){j-=l;m.push(d[l]);}}m.push(d[j]||String.fromCharCode(j));return m.join('+');};var g=/\$\{(.*?)\}/g;function h(j,k){var l=a.config.keystrokes,m,n=l.length;for(var o=0;o<n;o++){m=l[o];if(m[1]==k)break;}return f(m[0]);};function i(){var j='<div class="cke_accessibility_legend" role="document" aria-labelledby="'+c+'_arialbl" tabIndex="-1">%1</div>'+'<span id="'+c+'_arialbl" class="cke_voice_label">'+b.contents+' </span>',k='<h1>%1</h1><dl>%2</dl>',l='<dt>%1</dt><dd>%2</dd>',m=[],n=b.legend,o=n.length;for(var p=0;p<o;p++){var q=n[p],r=[],s=q.items,t=s.length;for(var u=0;u<t;u++){var v=s[u],w;w=l.replace('%1',v.name).replace('%2',v.legend.replace(g,h));r.push(w);}m.push(k.replace('%1',q.name).replace('%2',r.join('')));}return j.replace('%1',m.join(''));};return{title:b.title,minWidth:600,minHeight:400,contents:[{id:'info',label:a.lang.common.generalTab,expand:true,elements:[{type:'html',id:'legends',style:'white-space:normal;',focus:function(){},html:i()+'<style type="text/css">'+'.cke_accessibility_legend'+'{'+'width:600px;'+'height:400px;'+'padding-right:5px;'+'overflow-y:auto;'+'overflow-x:hidden;'+'}'+'.cke_browser_quirks .cke_accessibility_legend,'+'.cke_browser_ie6 .cke_accessibility_legend'+'{'+'height:390px'+'}'+'.cke_accessibility_legend *'+'{'+'white-space:normal;'+'}'+'.cke_accessibility_legend h1'+'{'+'font-size: 20px;'+'border-bottom: 1px solid #AAA;'+'margin: 5px 0px 15px;'+'}'+'.cke_accessibility_legend dl'+'{'+'margin-left: 5px;'+'}'+'.cke_accessibility_legend dt'+'{'+'font-size: 13px;'+'font-weight: bold;'+'}'+'.cke_accessibility_legend dd'+'{'+'margin:10px'+'}'+'</style>'}]}],buttons:[CKEDITOR.dialog.cancelButton]};
});
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    atelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">销量</a>
                        <#else>
                            <a class="arr_down" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="price" && pager.orderType=="desc">
                            <a class="arr_down" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">价格</a>
                        <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                            <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">价格</a>
                        <#else>
                            <a class="arr_down" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                            <a class="sort_3 sort_3_down" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">评论数</a>
                        <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                            <a class="sort_3" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">评论数</a>
                        <#else>
                            <a class="sort_3 sort_3_down" href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?listStyle=${listStyle}&orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if><#if shopName??>&shopName=${shopName}</#if><#if goodsShortName??>&goodsShortName=${goodsShortName}</#if><#if goodsCategory??>&goodsCategory=${goodsCategory}</#if><#if barCode??>&barCode=${barCode}</#if>">评论数</a>
                        </#if>
                    </li>
                    <li><a href="javascript:void(0)" onclick="changeJsp();" class="sort_4">普通模式</a></li>
                    <li class="on"><a href="javascript:void(0)" onclick="searchPriceArea('1');" class="sort_5">批发模式</a></li>
                </ul>
            </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pf_list f-cb" id="show">
        <input type="hidden" value="${base}" id="basePath">
        <input type="hidden" value="${isLogin}" id="isLogin">
        <input type="hidden" value="${catelogPath}" id="catelogPath">
        <input type="hidden" value="${priceFlag}" id="priceFlag">
        <input type="hidden" value="${brandFlag}" id="brandFlag">
        <input type="hidden" name="pageSize" id="cur_pageSize" value="${pager.pageSize}"/>
        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
            <ul id="goodsDataTable">
                <#if goodslist?? && goodslist?size &gt; 0>
                    <#list goodslist as goods>
                        <li>
                            <div class="pro_pf_info">
                                <#if goods.enableBatchPrice == '1' && goods.batchPrice != "0.00">
                                    <input type="hidden" name="" value="${goods.batchPrice}" id="defStartBatchPrice_${goods.id}" />
                                    <input type="hidden" name="goodsNumId" value="${goods.startBatchNum}" id="defStartBatchNum_${goods.id}" />
                                <#else >
                                    <input type="hidden" name="" value="${goods.price?string("##0.00")}" id="defStartBatchPrice_${goods.id}" />
                                    <input type="hidden" name="goodsNumId" value="${goods.startNum}" id="defStartBatchNum_${goods.id}" />
                                </#if>

                                <input type="hidden" name="goodsPackageModulus" value="<#if goods.packageModulus??>${(goods.packageModulus==0)?string("1",goods.packageModulus)}<#else>1</#if>" id="defPackageModulus_${goods.id}" />
                                <input type="hidden" name="goodsLimitNum" value="${goods.limitNum}" id="defLimitNum_${goods.id}" />
                            <#---->
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr height="50" class="pro_pf_tr">
                                        <td width="76">&nbsp;</td>
                                        <td width="100">&nbsp;</td>
                                        <td width="300" class="textoverflow">
                                            <a href="${base}/item/${goods.id}.html" title="${goods.name}" target="_blank" >${goods.fullName}</a>
                                        </td>
                                        <td width="140" style="text-align:center">商品规格</td>
                                        <td width="220" style="text-align:center">会员价格</td>
                                        <td width="210" style="text-align:center">当前价格</td>
                                        <td width="144" style="text-align:center">数    量</td>
                                        <!-- 20160505 dzz 注销库存显示 -->
                                        <#--<td width="114" style="text-align:center">库    存</td>-->
                                    </tr>
                                    <tr class="pro_pf_tr2">
                                        <td width="76" class="pro_checkbox">

                                            <input type="checkbox" id="checkbox_${goods.id}" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.shopId}" </#if>/>
                                            <label for="checkbox-1-1"></label>

                                        </td>

                                        <td width="100">
                                            <a target="_blank" href="${base}/item/${goods.id}.html">
                                                <img src="<#if goods.pic??>${goods.pic}@90w_90h.png</#if>" width="90" height="90" alt="${goods.name}" title="${goods.name}" style="border: 1px solid #E6E6E6;">
                                            </a>
                                        </td>
                                        <td width="300"><div class="pro_name">
                                            <#--<p><em>所属商家：</em><a href="javascript:void(0);" onclick="$('#shopName').val('${goods.shopName}');searchGoodsInfo();" >${goods.shopName}</a></p>-->
                                            <p class="textoverflow"><em>商品简称：</em><a href="javascript:void(0);" onclick="$('#goodsShortName').val('${goods.shortName}');searchGoodsInfo();">${goods.shortName}</a></p>
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
                                        <td width="210" >
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
                                                            ￥
                                                            <#if goods.batchPrice?? && goods.batchPrice != "0.00">
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
                                                       class="pro_minus" readonly="true" onfocus="this.blur()"
                                                       onclick="javascript:reduce('${goods.id}');">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                       class="pro_mid" placeholder="1"
                                                       onblur="change('${goods.id}','${goods.price}')"
                                                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       value="<#if goods.enableBatchPrice == '1'>${goods.startBatchNum}<#else>${goods.startNum}</#if>"
                                                       onchange="change('${goods.id}')">
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="pro_add" readonly="true" onfocus="this.blur()"
                                                       onclick="javascript:add('${goods.id}');">
                                            <#else>
                                                <input type="text" name="textfield" id="textfield" value="-"
                                                       class="shop_add" readonly="true" onfocus="this.blur()">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                       class="shop_number" placeholder="1" readonly="ture"
                                                       value="0" onfocus="this.blur()">
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="shop_add" readonly="true" onfocus="this.blur()">
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
                <#else>
                    <li><h2>尚未发布任何信息!</h2></li>
                </#if>

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
        <div class="f-fl moretip" id="tip_notice"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if> </div>
        <a  href="javascript:;" onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));" id="checkout_btn" >加入购物车</a> </div>
</div><#-- main end -->
<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
    <#include "bec/ghj/b2b/spfl.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/jydz.css">
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghj/js/list3/ajaxGetListGoods.js" type="text/javascript"></script>
<script type="text/javascript">
    var priceHide = '${priceHide}';
    $(function () {
        $("#product-list").on("ifChanged",function(){
            if($("#product-list input[name='cartId']").length > 0){
                var checked = true;
                $("#product-list input[name='cartId']").each(function(){
                    if(!this.checked){
                        checked = false;
                        return;
                    }
                });
                if(checked){
                    $("#checkall").iCheck("check");
                }else{
                    $("#checkall").iCheck("uncheck");
                }
            }
        });
        $("#checkall").on("ifClicked",function(){
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
        if($(".pinpai").outerHeight() <= 37){
            $("#morepinpai").hide();
        }
        $(".more").click(function(){
            $(this).hide();
            $(".shouqi").show();
            $(".pinpai").addClass("pinpaiopen");
        });
        $(".shouqi").click(function(){
            $(this).hide();
            $(".more").show();
            $(".pinpai").removeClass("pinpaiopen");
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
            var path=','+$(this).find("a").attr("catelogpath");
            var pathname="";
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
                            $("#catelogPath").val(path);
                        } else {
                            $(this).removeClass("item_p");
                            if(level==1){
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==2){
//                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text();
                                pathname = $(".category_list").eq(1).find(".current > a").text();
                            }
//                            $(".xj-id").val(id);
                            $("#catelogPath").val(path);
                            level++;
//                            $(".category_list").eq(level-1).html("");
//                            $(".category_list").eq(level).html("");
                            $(".xj-hy").val(pathname);
                            $("#catelogPath").val(path);
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
                $("#catelogPath").val(path);
            }
            $("#catelogPath").val(path);
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
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                packagingConversion(goodsId);
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
                            packagingConversion(goodsId);
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
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                packagingConversion(goodsId);
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
                            packagingConversion(goodsId);
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

    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
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

    /**
     * Desc:搜索商品信息
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function searchGoodsInfo(){
        //获取商品简称
        var goodsShortName = $("#goodsShortName").val();
        //获取商家名称
        var shopName = $("#shopName").val();

        var merchantId = $("#merchantId").val();
        var shopName = $("#shopName").val();
        var goodsShortName = $("#goodsShortName").val();
        var goodsCategory = $("#goodsCategory").val();
        var barCode = $("#barCode").val();

        var orderBy=$("#cur_orderBy").val();
        var order=$("#cur_orderType").val();
        var catelogPath = $("#catelogPath").val();

        var ids = '';
        if(catelogPath != ''){
            ids = catelogPath.substring(1).replace(/,/g,'-')
        }
        if($.trim(ids) == ''){
            ids = '${ids}';
        }


        if(goodsShortName.length > 50){
            layer.alert("商品简称长度不能超过50个字符!", {icon: 7});
            return;
        }

        if(shopName.length > 50){
            layer.alert("商家名称长度不能超过50个字符!", {icon: 7});
            return;
        }

        //组装查询条件
        var filter = '';
        if($.trim(shopName) != ''){
            filter += "shopName=" + encodeURI(encodeURI($.trim(shopName)));
        }
        if($.trim(goodsShortName) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "goodsShortName=" + encodeURI(encodeURI($.trim(goodsShortName)));
        }
        if($.trim(goodsCategory) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "goodsCategory=" + encodeURI(encodeURI($.trim(goodsCategory)));
        }
        if($.trim(barCode) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "barCode=" + encodeURI(encodeURI($.trim(barCode)));
        }

        if($.trim(orderBy) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "orderBy=" + encodeURI(encodeURI($.trim(orderBy)));
        }
        if($.trim(order) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "order=" + encodeURI(encodeURI($.trim(order)));
        }

        filter += "&listStyle=${listStyle}";
        filter += "&price=${priceFlag}";
        filter += "&brand=${brandFlag}";

        if(merchantId != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "merchantId=" + merchantId;
        }

        if(filter != ''){
            filter = '?' + filter;
        }

        window.location.href = "${base}/list/"+ids+".html" + filter;
        // window.location.href = "${base}/list/${ids}.html?listStyle=${listStyle}&goodsShortName="+goodsShortName+"&shopName="+shopName+"&orderBy="+$("#cur_orderBy").val()+"&order="+$("#cur_orderType").val()+"&price=${priceFlag}&brand=${brandFlag}";

    }

    function searchPriceArea() {
        //获取商品简称
        var goodsShortName = $("#goodsShortName").val();
        //获取商家名称
        var shopName = $("#shopName").val();
        var priS = $("#priS").val();
        var priE = $("#priE").val();
        var srcUrl = "${base}/list/${ids}";
        srcUrl += ".html?price=";
        if(priS) {
            srcUrl +="M" + priS;
        }
        if(priE) {
            srcUrl += "L" + priE;
        }

        window.location.href = srcUrl+"&listStyle=${listStyle}&goodsShortName="+goodsShortName+"&shopName="+shopName+"&orderBy="+$("#cur_orderBy").val()+"&order="+$("#cur_orderType").val()+"&price=${priceFlag}&brand=${brandFlag}";
    }

    /**
     * Desc:页面切换
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function changeJsp(obj) {
        window.location.href = "${base}/list/${ids}.html";
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