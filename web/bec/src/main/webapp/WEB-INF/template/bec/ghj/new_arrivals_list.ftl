<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top.ftl"/>
<link href="${base}/static/bec/project/ghj/skins/all.css?v=1.0.2" rel="stylesheet">
    <!--main-->
    <div class="z_main" id="product-list">
        <div class="list_search f-cb">
            <div class="f-cb">
            <div class="f-fl">
                <form name="" action="">
                    <span>å•†å“æœç´¢ï¼š</span>
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="mid" id="cur_mid" value="${mid}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
                    <input type="hidden" name="orderType" id="cur_orderType" value="${pager.orderType}"/>
                    <input class="has_reset inp_search xj-hy" type="text"  name="cl" id="cl" placeholder="åˆ†ç±»" value="${cl}">
                    <input class="has_reset inp_search" type="hidden"  name="mn" id="mn" placeholder="ä¾›åº”å•†åç§°" value="${mn}">
                    <input class="has_reset inp_search" type="text"  name="sn" id="sn" placeholder="å•†å“ç®€ç§°" value="${sn}">
                    <input class="has_reset inp_search" type="text"  name="bc" id="bc" placeholder="å•†å“æ¡ç " value="${bc}">
                    <input type="button" name="" id="page_search_btn" value="æœ&nbsp;ç´¢" class="inp_btn" onclick="allG('${mid}',$('#mn').val(),$('#sn').val(),$('#cl').val(),$('#bc').val(),'vt=list');">
                </form>
            </div>
            <div class="f-fr"> å…±æ‰¾åˆ°<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>ä¸ªå•†å“ </div>
            </div>
                <div class="f-cb w100 mt13">
                <div class="f-fl"> <span>æŽ’åºï¼š</span></div>
                <div class="f-fl">
                    <ul class="pro_sort pro_sort2">
                        <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                            <#if pager.orderBy=="sales" && pager.orderType=="desc">
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">é”€é‡</a>
                            <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">é”€é‡</a>
                            <#else>
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">é”€é‡</a>
                            </#if>
                        </li>
                        <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                            <#if pager.orderBy=="price" && pager.orderType=="desc">
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">ä»·æ ¼</a>
                            <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">ä»·æ ¼</a>
                            <#else>
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">ä»·æ ¼</a>
                            </#if>
                        </li>
                        <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                            <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                                <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">è¯„è®ºæ•°</a>
                            <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                                <a class="sort_3" href="javascript:void(0)"  onclick="allG('${mid}','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">è¯„è®ºæ•°</a>
                            <#else>
                                <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">è¯„è®ºæ•°</a>
                            </#if>
                        </li>
                        <li><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}')" class="sort_4">æ™®é€šæ¨¡å¼</a></li>
                        <li class="on"><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&vt=list')" class="sort_5">æ‰¹å‘æ¨¡å¼</a></li>
                    </ul>
                </div>
            </div><#-- æŽ’åº  end -->
        </div>
        <div class="pro_pf_list f-cb" id="show">
            <input type="hidden" value="${isLogin}" id="isLogin">
            <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
            <ul id="goodsDataTable">
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
                                <td width="140" style="text-align:center">å•†å“è§„æ ¼</td>
                                <td width="220" style="text-align:center">ä¼šå‘˜ä»·æ ¼</td>
                                <td width="210" style="text-align:center">å½“å‰ä»·æ ¼</td>
                                <td width="144" style="text-align:center">æ•°    é‡</td>
                                <#--20160505 dzz éšè—åº“å­˜æ˜¾ç¤º-->
                                <#--<td width="114" style="text-align:center">åº“    å­˜</td>-->
                            </tr>
                            <tr class="pro_pf_tr2">
                                <td width="76" class="pro_checkbox">
                                    <input type="checkbox" id="checkbox_${goods.id}" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.shopId}" </#if>/>
                                    <label for="checkbox-1-1"></label></td>
                                <td width="100">
                                    <a target="_blank" href="${base}/item/${goods.id}.html">
                                        <img src="<#if goods.pic??>${goods.pic}@90w_90h.png</#if>" width="90" height="90" alt="${goods.name}" title="${goods.name}" style="border: 1px solid #E6E6E6;">
                                    </a>
                                </td>
                                <td width="300"><div class="pro_name">
                                    <p><em>æ‰€å±žå•†å®¶ï¼š</em><a href="javascript:void(0);" onclick="allG('${goods.shopId}','${goods.shopName}','','','','vt=list')" >${goods.shopName}</a></p>
                                    <p class="textoverflow"><em>å•†å“ç®€ç§°ï¼š</em><a href="javascript:void(0);" onclick="allG('${mid}','','${goods.shortName}','','','vt=list')">${goods.shortName}</a></p>
                                    <p><em>å•†å“æ¡ç ï¼š</em>${goods.barcode}</p>
                                    <p><em>åŒ…è£…è§„æ ¼ï¼š</em>${goods.packageModulus}&nbsp;<#if goods.unit?? && goods.unit != ''>${goods.unit}<#else>ä¸ª</#if>/<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>ä»¶</#if></p>
                                </div></td>
                                <td width="140" class="pro_color" >
                                <#if goodsSpList??>
                                    <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                    <div class="f-cb" style="width: 180px; height: 32px;"><em>${sp.name}ï¼š</em>
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
                                <td width="220" >
                                    <ul class="price_info">
                                        <li>
                                            <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="å•†åŸŽä»·" title="å•†åŸŽä»·"></i>
                                            ï¿¥
                                            <#if goods.enableBatchPrice == '1'>
                                            ${goods.batchPrice}
                                            <#else >
                                            ${goods.price?string("##0.00")}
                                            </#if>
                                        </li>
                                        <li class="red">
                                            <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="ä¼šå‘˜ä»·" title="ä¼šå‘˜ä»·"></i>
                                            ï¿¥
                                            <#if goods.enableBatchPrice == '1'>
                                            ${goods.batchPrice}
                                            <#else >
                                            ${(goods.price*(1 - goods.defaultPrice/100))?string('##0.00')}
                                            </#if>
                                        </li>

                                    </ul>
                                </td>
                                <td width="210">
                                    <ul class="price_info">
                                        <li>
                                            <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="å•†åŸŽä»·" title="å•†åŸŽä»·"></i>
                                            <span id="${goods.id}_nowPrice">ï¿¥
                                                <#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                                ${goods.maxBatchPrice?string("##0.00")}
                                                <#else >
                                                ${goods.price?string('##0.00')}
                                                </#if>
                                            </span>
                                        </li>
                                        <li class="red">
                                            <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="ä¼šå‘˜ä»·" title="ä¼šå‘˜ä»·"></i>
                                            <span id="${goods.id}_nowMemPrice">
                                                ï¿¥<#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                            ${((goods.maxBatchPrice?number)*(1 - goods.defaultPrice/100))?string('##0.00')}
                                            <#else >
                                            ${((goods.price?number)*(1 - goods.defaultPrice/100))?string('##0.00')}
                                            </#if>
                                            </span>
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
                                        <input ty	Œÿ‚c¹ÎÊ…kéö;lu4Vm¨5Â°%Y‘@i¦ö+&	w/´®|ƒps³[ÿ,eþ7ÿwÁÍ_—þû^ÿ·ÙÝÿ{Äÿ¹÷]ßw5¿ûRÇÿ•ïÿMëîód/?‡§Æ²·®Ê;ªóæ1Dq»á×ÐÛ$¥AfYÐð:}÷‘M¿êuý ²×¢_¼žp÷âtÒ=Çˆ€¡×w¨/h.GF“eø[ oËÂõ[D·$·GÚÛß“ÌÊ=ÙONåÏoAÿg¿·–ûVfG™&Ìès0(×fÁa|AÏ£äùÙæaGÓ× +Œ¢ÚÂõ€½úË9Ò"ÇË¶•ÚVï©8Í·O=}]÷ÿ\âkX;‘zþœØìmÕä¥À¶•ÈÝejÎ’t­ýšjG©;zuljm·ÐÃ9"úWHñ]F‚l–•XÏ~il`n°Ž™ÒÄ2²‚+üâ˜èŽ‰š±åëZ	9©ÌðˆYÊÇ³ÈÇº^øH:gks‚½aÓæDLX.v‚ò¨ÇùoÛJ	y~ Ÿ}Ü°œ[0Kê„›|h¼Ï	0bW½„l 	ÉÁ-¥1ƒ1>v¼‡Û@jé”Ð¢¾WEKî$e‰Þ>*"ò÷ƒ=ïêÖûÆcåÀZ|­	”Ôó%Ðž¯«‹œ²4É¸Q]kMìgòsàÚv´w|+£Þ‹þFdÿ:@‡us1_j:°¦”$?nùÙËÒ\¹j¶ç:í÷HÜßæÚßý†¹>™‰Ù[ÿÙâe¥uéõ-ì©~{³v¥’2ÆµÍ’§Šõ+OCÏM6À¬Á”MJ	Bâ¼öñBlAÙ¸Õ]Œjp:ít>2®ë\ÚšŠ©o¯§ÜÍ(²fÃŠL¡Ÿ(yÿúÈ5;]I4ôµ51ù™ÅA_
Ì‰‹VOýbº˜ÙÀÏ¤Ûc>ŸÀ~¶-kZ¼RIí_®Ü|Å$%«¦##‘ÏœœÈÔÉñ½m×¦ûï‰w;zÑë–[êS®Ââv·õ3ÄðÙ	Ëf®|>ã8‘ÿdÛ¸q@á‰M§ß¿˜6’Xoì:åË—«X„ò-ˆ¸,<=×ÄÑmDx•½92 Ò²¿±D&E¯)²çükZkt+`å8€;fŒI­ÅÑ.Ç¯
•¬)=W¥0D]kÎ£´q‰ìÂ™‹¸ÇDQÏ¡†iµŽ5åßë¤Ç¤HfAøGRï³(g|MÊEMÊ¸Q®¸¯‘P?JÞ
x”íüº¬äðn»NSÐnû\V¬y¶v”u¿³A~Ø—<@}E nó5,iL~ßYÏ‘ž[×=–ûÉ»/÷åIG¦WÁä9.^V	M!Ç¶[ù+Áá¦ËÊÏäûoÅ?)èI=©v›zÏ§²ê_¼þ_lŠLl„›Ä„še™éŒxX·–Aó ×Ö¨¶=\e	·X]Ï»êö/Üçßœ‚{ŠWÑ¸‰êaOù_Öj1ïP¦45nÕ U{ã‹ÕÓmëñÚjô›‰ò=ä·šzüðßWž³7g•<§ë`À0˜‰_$Ùb®ÒÑÚfd¹>ßØäqüŸ=ÚÓçi•üŸåñ³ô,ôªt)â½EËåñèÒ²)n]ª4(PÇïjs¢ì:kn6¹y43Ï_Ã-¡£Ë]1oÊþfÓu7ÌìÁ#;áüxì„‘¾‰»¿ùð„BS|ßB|
 QžM«‘ûW­—ZÅ»w®ÝpbéÀfi¥?×þžOfûÿ#cnIö˜©þõn´—°(õ^Þêš¶ûK™ó?~úZ×nº|®ðžú˜w“°HšA»ÂYÜó´¤:.©êÍÓS21§ñc„„Ø«•ðJ±ƒÒÁb
ðÝÐ·SÙ-Õ¨¡äÁùìžÀë8+ÞœÇñ¦øn·ä‡³t¼šé§¤TÙÈR-¸Ñ†#~,h€ÞHüÓjµ\RFéü‹K®…H,©Ÿ¡‹·WêkB\å-¼ïP¥x„åÒhu¾ÃÂ	­N@X¨@ÂÌ
¼¢•VÆ9I…„Ó%baF”.ùìPAmC|w9_œíàWñ@‹uéaL™ëF–Ð¦Í6Ž%¡,¶¬#øÙ°ÝªwSuÉù£²k{^VÊ$íÎ’¶9/SMCƒ¥nA-¿ÃÉ~éÏ.8ƒ;ú>Ù.â¼E|LsÛÅbBç õ³‚|p„Xß*Î¦³‰¾5)”b¢ §jæ(Þ,‰0•úBÛ%–•Š¼žÝÇHþ¤“ž•
.ˆx†•|oÇ¬–¨¢…=gs2¤.¾Ã…KÞÄböè¥Õan’kCÝN*¶³ßp/~b(út—°k„(SéÎB‘'³Ò¡•jÉhªŽ”ŠHHÅ\¬UÿnŽüÎ’ƒ%2Kl^ŠK5V"ð¾¨]úÌxDô¬,'… :#â”Ôš}ê‹&%-NÍº±èêêR$JÝL Ý‰œ›'HÉš×cEâU[$z`@p':ˆ‚ç2”WNú¼ÁÍ5Pƒå1KDõ<dwyôÝ›qòM¸aÜ„'±ô–¹aO^©ýÞ”ž×|/lµÀ×(‘X@
¼¶æ!1ÿî«üMum¤—GÕZ©¥”S_sêï¨©Pèa®Ã±Çu:Št4Îó›çÿû¶¼mbú·Å¤·íB—?^jñT¶›\åk¸î9ÇäÈËZø»úŸh?U/âÓOÜýC·Ål”£ó¶H%iX\bSÅ;ï®…È|¨Cn#fÍg¨ªsë[í&¥¯¥êá½6‡Ëž,»ñ£³Ü}¹#¾ZJ­4P×û—§„§×Ð>z,]ÇºüW‚õ`Ð[ßSp,_›ÏÙW)!wàÆ“ãâ"-tÍ«)Ùä@b_")ä0F™Ã(@ÈöQ¿ÝêÞ-aöäRß¬V¯Ïçdx·Êl}5ûÉ)ATøÞoè3ëÌ™)ú\•¹Ÿ8ì0xçÅi"_Rïû|x)ÄIJyó÷ñ‰®dÒöeBÒJµãV¾yí*ñÝå²Ê(ß–0™¸¡˜Úw1µõ{ˆÿûrümç-ÇþíUw>2Õi8±L1  EÎK‘q½18(xÇ=U¢µ«ö2ØÝß¦Ö+Ld_þwƒ|xpBœÿmMí(;»è{gØo—K&ŠoðÞ¢¥¬!ð½EQÞ=›Ð&%dƒFB™ 1ñ™«yLƒÓ}|\ÞÖÍVW2o*÷Ø[ì¿¡ßé¯ÔTõ*iŸß…Çç¼ækì,~3YÙÿwp\íØ€&I$r4)þÅ‚ºbªã´Ýµ2cß‰¶s%PJ›É«íÔ]æ|9t{ËB‚m‹Ë1qëa³2QŸçþ÷m;ÜG‘d§Ôm¸Í6¿ó‰$/†þPpLC/ZHjÍÚÔÉ e°ø§ˆ&èÓ‹„Ds¥íÈ¶'Õø+D³§Ëã4ñåã…/¾ýÿ›+0°B@äÅf¯£Å(gZ*ìªê¢G46õ$–)ÐÆ²NP›
€ª‘LÁ§¼Šœ¿ÕâÅg	×£ÞPÐ"¶‘71µ<8ËÂ‘
0™*o²âz4–ª÷ƒQ(Ýsì‘È{2g”SÅvŸÅß¨ç-=¦:Üµß[w¿¤tÆ¨ëæQÖsýþvõ,{JÉJÑ”¯×œBøÅÇ“ö½Ž~Wß¾f©úžïçéƒCX¨IÙëYÿoU}ßÛÑÊ2LX9ÊGU5¼ßïb±@PæíË·6<Œªàë}Ü0$hýë¼P‘ˆ†>NjI9|§Ãwë·¤RõMddï‡±~†xm(9`† ½´ìÉ”ÕÓè[Èñßj‚DZiIá¹i±ÓœœÆ¿žêå1ˆªC]K GU¡éá.4g¶¯=¯;JèNŒ`@=EE®òðº±[ti¡­e£ÜŸ+žEAìl3°\cÚ§V{ž¼¥UíYç‚E-x÷“’¶XzAï62~c”ßèßÎAª¼ž¦;Ñª)—	µÂ–m¼'1™'Ïâ©Ü6&\Ú	F<¡xå ½„Êúçâ|\è®Â~#qG’—ÜŠ‰5_Q®#	?Ê=9õï¦kD1T%9Å‡~Uý&PÞ[9F±=U‹Öþâ™ÜU
›Ä˜N¹¿®¦Äy–á–Ò<Ç·ª.jÀDu¯‰E}>¢Hð6¬ñùŠåÑýçY51æM­Š>½šbbª;)Ã[”.+ìê$Ô²[ØP¶‹ Úý¯!÷¢¬/ôO'ÁTs_Sh¡Õªô8Ì'VÐ•ÑÛÆãK§eøûÚ+å´``!"õ²’ðO-µ‡6M¦Më›s	òo´M†l)yã˜y–•#1UG+b*HFé[wu¸ÇŽÇ‰È6«&¯Zö$ÞG
ëÄÐHš	Û6oÊ1ýO‹ÚÕ¨œöµŠ¸¸²GOKË^-*ÙW0]bËŠœ	Kð]©rÇ¦¨MmSsý/,©—¼áQMQ‰rõÚ5uÀ9WBEùÁq[x°6*TÞ=‡¶“·ï«t¾vã»¹”Î\"×¿WH»sˆ8–Á‚²µ‘¢H*³G*ÛaC°¯ãQé7^¿ãá k™?©WåÈ.>¾vô—®X€}‚¦£::¢,h 6‹ô‚Zß
.‡5ì];._€›öƒ¹3ª»¼¬?ÿâ™–¿æâ§¹'•;“¿½‹ßVì%|ïî!/šÑ{¢\FoºoyÏò³´µyñ&{)fB™Væ±oôEönª¼"ôÅ¤"E¡ÇÒ«[³Ttñu¢,õ|OC¢r³^›—?>’ÏÐ¼*Na§'Ó²-×±ê\ø¢²¶UBÂ‹Sc}	îáƒiO>M	¨¤á™vRS¯ÂLYnZ…cjÂ ¦Ol¾m¾f”âñØÝÁÊ
ë®di§LñÆP¥DëE¢Ì‹Ž]Æ„G…•¸•CÄ
ÝóÙ‹=dÆ¾UF«yðXs.u©¥'˜‡²¥ª- si¦þAò²–•&ãâÊ/aÎJª+%W]$pDm%…^í©ÿŽ×Û¸¡iß}å³<\žÃë"Å4URO¿ù{ÞxT‡c@Çbï+Œ´ÅRê‡p2ZÏad`e½'!eLÄúÅí6ñžçÔ-‘Å)Q+“6ßý,ÂŸýžVì‚¼<	O×ïlzõ“*èÚ 
¤{>ÔÑèÓÆöi_™j'\Ì¼°¤CÞŒ( t
JœG¯ñ½i.ÿc~«ËÃjû0jñ¿ðžº®ÀÞçžÃþ;]T_-ùF£LœX5:Îä`¹¨UiÍ¡&ÎÍ›[&þ×Ñ³	-§ç{žtßµAÛºf2õãæv’‚‹^Æ²’’˜1¬!m:ÞÒq¤©»ÑFG’AF¡§¤ûìT7ÖÔþYM÷fþg»1ý¶ó ëˆWAy«ðYÛ£å2kJûu‚žNÛ~;¯—Ö”ßšè£&å-H)7DžŒ–ÿó°tPCçã˜ª/wp´ïâé"ïmìæ21*¡†“ñž:óÎÂ\À†ÓŠ¨p§pG9¯Ùÿp÷ãS‰ýüR•ôfíz@±m,©]ÖÓ„Yã†¨“Ù£ÅË¨N(Úƒ
M[@–™	:M}eÒ*Ð©®WFÐ‹ÍËŒÆa;˜ÔØàŽûK]|é.‰›à¬×AÊ¨f÷_ÔÇKØÛcºÿVnëÙ1dP£»Ç®œq^éÌ¾ŒtFµCw‘Xæ›NÝë‰[„—žû~€rÝjwX z“O†c!í)øf}8¬1Ìêk‘*ý¶•Ä^ið¸ÿ²Ã–ã£ÀÞô8Ðj8<Î"Úƒcù?ž!”8•yéæ§hhç>a‘­
QŒW€Ð-áQj²….Ÿ7ö»ÎKþ¨S*s-Ý»ù7ž.ˆÏ‚eK×ó„dõ]¡uû]þÏU±—¥+½b)„¨0¶ßq †¶èBÌàY‰°‡}ÓQ˜
¤ÉDèø<®Ì&7í]÷“+§*ÛÈ¯M¡T^Té†Á‰ˆ¢ÑhLfô0½îª¥ã÷ÐÑñ3ìqXÜ@Dªì^i…,Ì&Åo8ÉÍáD˜O>ÔŠöüww‘hyENäß—èPÉ8ŒÇcÿÌ0ü{Ÿz]É_æëÿ1Aþép¯oÁƒyÝ$¾Ÿ†ÙO)r7b'Íê‹ó0Â4)î³¡Ns+u1˜2˜ípì'˜šÄ,J°Ê3‘Ü2øà¥¥Z¶òßÇ³“êI1È¥ç'e‹ú–95îèa®OB(xq)Ò¬(C˜Ë>·ççµÊæÀH}Zo¿á•A!ŸW¿${¸IÏy˜Sƒ®*:8'Cpß_ô«èj^ØKêÎKïøÏÏ%‘M2Žl÷]¡ÞÂ¡S–›VhIµ¦{ö/1µœãóé6¥È¸¥Üøt{^×õó³~Î±y(î¨­Ž†9PØÉj:8Œ9.ÌCâ;àkhÿ°\c(E±)	žÊ/e9ãâÅäÅÕyßº]¬>º»‹ãg¢c“•8Ù¹û]^dà&2cÏ7ÖÐtw8Uè²ÁxH§’!+†éFÃ:•A.a—ã¼tã´?ë÷8ÆyÇÜ”ž±AîRùà¥‡µ‚5¤½ô`=Æó·¼–¿Âùu/+YùQ>t%T%;…ã *"z,¬žiœâÑ‰už<û<\|é`Í>D5ñr…¬g@90vCK¬ˆa7´³]=ôJ›´$énó.ÛHÎV¼¾«çåoƒkËòÈÙÌƒ¡§á{ÿVóu5î‚Ë´rŠh	·$&YÁ…9*ôTç½ÆZ(5§§Ðð·ÙÊÂ¼|d¥\iCîp¼ Á[/€WÛžpïÚb»od»Sø7‰zI(yiM¯~œY-'ñ|>·/}Ÿ~×Ï¼Æuþ„ÅÐ­&xtBC‹}œ0? ÿb°Uy€`™Ì»ólÿñ',ú‘»ZÉ0×–ÙVÌÙ¬fF\4lçw;[ÙšZšÓuU÷›…»­$úû‘x<h”TújÏ©p®S/ú¸]¥ó:2
/×MÇæÔ·¸Ç¾oµàDT¶èý¡¦×Ï‡Gv’¶ä!Œ­QÑYÕièqýc„sç¦Ýû¹×ÁMí*¯m	2’ÑºÂ^ÞJ1·‹öÿ„Fÿ}¼˜"©›ÞMO•¯-}øŠ«¼d!%çYWàóëë<ÿˆ_÷ŠÎ½Uf@‘Í•ê(ó¬x«[m,N­íßxZÇ~4•¡¤S%aVz=‰Þ¹»¤Í9;J˜C(#[…¥M’ ³XúÁêiëUd„Ê†:LO(?ðN)vAìG4ª&‘(A5!®®—|+G³†1¬uáS¥)ßÒ´’©‘%Nl\z-àuàÅú~ýÒ#½Ê|ŒËHuÙ˜äÇÒq$N”B•afÓÂŠÍŽ4êS˜‘µ„dN"¥aáNNDRY4âô{š¥²/
§Ô·ÉóGZœ˜³âƒ&žú4 i9F“Š¤õÊˆ¯T¾ñø×•{È\ZÞ«#7WBnfÔi¿¥˜ÆÊ&Ç‚–˜A`ƒDÐ1ñ—Ÿ2„æ†ŠNŸëgóë¨wìRä7ž­"×|qôÿÖ+þéäÇ{õýÒÓÙä”±<…8ð¨ä]¼cu$¬Û¸mò˜nLm&E3èV0ÉULXæøtÐ”ªÖ¾4P3*ÛÚ×qæ´WSWðÓè×3½ãÑ·1Cø3oxP%ÝÅñýQE¹P½ùˆA­ Ä”0—·bÁìPúbPY*iÚ{[‰>Æt›ÔËÖäkþõ‡•ïPpò-Î“±¢ýX
v<ƒ	v¨'ô<A*…©ìÊßÒ	ûúœ‘H,R‘^ìmí¿!=ïûZ†2˜½Jlí©ÙÕ§ÿÀ/Ýºë m?KÂÔœJ4·³™ü1öé' ¸PIJh&kÈìÕphý$[…tn{¨pä‹ªÍ¿Igî¾ß™Ù
ìëoªQ-1A’2¤#…ŠnÒX§çÞTfæ1Ü:û(EùU¤rjžå`z³-h’©%Ê^I?‚·JV½I©éh_Kø‡Ì×»òÄ_¾ß„3ç&$%=«%fŠÍo’ÁËÌûQ‘Þµ¥—×§ÃñÓúHè­”£÷È*ÿæ¥ÛÔàôßsUÄú9|êaSpÓ5˜èJÛ$!/ôûëöÏ@ÌæVÆLF ¤ÑKw¢tèÌ¿¨3™õ»50Åá%?Û;ÙýÆùyÄþF ð3K¸D*S®´R¡­ækMüàøN2L‘‹-ØÒJ„Ä´î¤?rZ®%§ŠB×6ÓâfúŸ€õE¦·a÷8ŒyÝî•Ö|r0M°rm‘FÔ,¬¼$áÐø±´“JÛvámÉ
Œ!ÓQ{Éz,	¿ï˜©Ò(sßÏAßb~ûéÂACÅ®‹rdyµW?ÌX¤m/¤—1GÙôõkö²áÈŠM¦8¶\´†.%°™KzgDÁÇºÑ»é1Vw}‚_¹Ý;Ùeïq|{M‹'élç	PågÀi%WVÅ¨MwÐp3ßn-À4•¯^E"¼žVõ”ôÜòß„—O[xð¾J3'ÛKº´–†ö‚µ;ªGÛ)‚û"ûb=V¹QâÕ>%ÒPTEI¤oÄò´*lL`ŠOñê,KSº61
€n/;ðÚT9ˆAóo¦ÿºtrSŒÓ\ÖOÑ¦€‡ [—KïHÞº†ÕhsËèºh6›
·-DFe°˜Ê@&“$ì uš*
Ã‰5k3ÑÙ–KâûÊá¢	û;Ü7ª	ˆBóÂkÂÅûGo]ýfÛÅÔ–SqÀÛñ»>àýßÞlkŠqÙ÷éÚpÚ”$ahÕ[~Ôöa'^°ló@Ólv^å¿[›ÿ~Ï)™u3YmA¶jñ}Ù’&àr¥J×m8¸É¥_>«jGœ+÷ü/ÝÁ6èì¦Ò¢pÅ§f0LÀ_Ö`*qärxºyà-S*p—€0‚b#ø‚¸€­è¢L~Û¨Aa	‘ÑBhcT\}—57Nr+ÿË¼ VGd	Àm à‹X ’ÐDJ7ìµÉ¡ÞTŒï;+½sžfIµœ|ÅI#è‚:›™A˜ÔH·¶ûU· èÍ Û¾õÌs(ŽqÍÖë+ÎIº‹näý+ëßmLï¦£Z«ˆ˜	4’V9[Ñƒ#¾)djn÷4z±`-H2î·©ø\­ÜpQÊ–¹D-æ0Cu/­irªäÇ„â­‡EZÛI`AnõAEI—É–Ä4@Q<ÆéíêyÙàWžŒíæ¶ã‡NÀ81\ã ©@HõÚº->C]ö«ŠÀHÙ´aC©1Ó/˜eÞI{Î;®«†—2Á¨š”Ìöùìæa3˜!’g{Àm¹¹Wà$TÃ·S&šÆª¨ñçÌyœãi°Î¢	I%Ôê7ˆ˜J”¡õþÅ¹Â"óæïŸçaô	å6¹€'&¦[”ä[¼h úàŽ›XTí‡ ä4*¿à ‚n–€Xp·Òïîh¢›S¾'q£¨šÚj‹*{Ié/;ö¨òE³iˆv<Æe'Årf¢ ç‹þ†¤‰Ÿoæ4<I¤¨¨‘¾=û~ÃÃ9ŽE>›æ¦›ÐX­SWH¿ÅÆŒž‰P	õ³ëp-AÈëËyC€NíÔ•p“Žêþ$É(‹÷‚?Qwe*ö)F¬ñ®Âº¬®[ÊY,ÞérQ…Z‘½jÜwo£èç@âá&í§±ý{Ák-µÖ}³Øñ•§}êÉñª©ÚmÇñMCk;ûóUÕ{^ùú:ÀÔg6Z3_»áÞÜ\ç: îk¡5ÌyjùÊnºiqmURò€ìïÙÇ3e-ŸÏØ“ÁŠáZHWûé”>`{‰vý‰“¾lýÄ§RXó³Èw$k¨guä.ÒSw'O.çòÓT¥ó{f×¥ýûN}À¥¼ˆ}¢ž¾”—«nI7"½qP­wß>‹we6þ„Î=79ÿÞßlê¨ëùjyë´ºW5ÐŠúó³¿Ó¶ÞEOÿ©u,%x Ž´GL0¨=ké<Ç½i Þã…èk¢ã]*2IŸJëZðmjøŠ£žC)W™‚’vÂI3}Ç#!üÀ@fò¿¥Šx5`¨	‚&Tý6¦  ¤…~“ÂÌ- |!£XÈK¡îqgø¦1=üÀxuD´jC¶÷ƒï=8+ó{ewë<ÅjeÄqœç¾ëÅ¿ÏÃ0D”å—BŸØ%zæ˜5A2¿DéSJKŠ%›×©Mi.k.K§½Çà/´Ÿ,­´®mö¾àB€d?h>0$A3º»ŸYLÉ”É:¤H—Í–MwëK]y
bSCáSQV¦÷qn×ïMEc¥¦8]Ù†Æ!/¹5üÒÚ`Î[Iž¦<tF×Ÿ/ÿÉ”%?üHwO*w"ÿÈSü ×¡þ«>¯—@v4õ‘‰XyµBlãÒe'âjzY. kbÿSZrTà•¯^ªç%÷nñ÷h‹eçuâÝRð£g):Q§˜ŠQ¨H+àŒ#õE—óKz#ÜËk†È5ÇŒ¹—[„Q÷—éˆ†ú¾am‚Éy×@á¥±è~d6	©Ä
?3M-`bŽyØîœŸ%ßoï]°{yÉX?§NEx8DÀÍ!Ðj8ÖÀR–‰ŒA«?3áÕÖé?ÏõlÈ3f0•Ìt„~x×¨2ÇŽ÷óÓµ…ß`H7 ™TPÂÔ€)Œk³:dPîÓ\XÑ 0Gœ‰…Þp3XŽQ"‰*$«ûìƒÎÎ-‰žÉ Ša’$óµ‹”ê\LÖNÒ`ì«HÒ´UËKc½”Ž}_ù{ß~èÆ·šoëúv+æœ‡…~ŒÎzo§Úþ.¼ŽNz”Ä”ü+EŒ‘^š¿Ïbê›f¡ªð:q‡´ÊYž‡æ
o ê)<NBÑåñx˜î£›\—8*hý>³9¼$z§¢Êíúòqä	*óñ’˜²€HD@Õ¼‡=wí‹9*!!OKš(õ¨pÃÿ‰çF#¸Ù ké5Ú¤ °xúå³6~tYœaP¡t=®—<g8‚©¯Žô$®Õ¾€ñ‹P+¬Wƒ[oGTåÂóµq–Ú¬Ÿ>Ó½¨gÓ½	
´,?ÇgÌˆ±\?KÍë*Mñ1*Ì7ÜÕ•&”ï&,ÍÅi?]¹a|ñu’ÿZEnÜÉzÛèï?®3sÐáP€ëWÕc-jª¦î‘§ezÞë ÝM62aéêe…¢×÷Ó£ü,EÁ½+³ñPÔ?=îRÞß*ÒO[8OÞq™õy8™q(ÞõžE­
„Ÿª¨ü^B¥ä½Ä±+î¥Êüž e(I {”/]‰TÂ‡mY€µÇYÍXÊ¥ý~š›&{A?öaf~¤¦VB"È.©¿¼õ÷&ñq’³»F¾šâ†›Ð×q;+Õ’Ï—ÒvêÝÑOjùàSp1ÍÆLQ’9,}Ò­¼‘à¤å:ŽJöo©ñ+ÍT\9F±yœØÁh.à™"§CÐ;ÖsùÖJP¢Óª¦öÅbã¼²Ö¤˜_>ÅðPÆ#KŠà!…¾_G°êOçCmÆŒÕ³c‘o6‡`„Z¿¯÷ðá¸ôúcÏ?÷âCÊ¨šËïä§PäZ€AMÂ¥¾²•¤£_pã®µëRÿyT:IªÝ5
I^¿åGP¿ •hí!X½Ñ~è8xÆ„ÐpÚX,ujå×4ÝŒ E†T^þ½´æ/¿àÐÄÆàŸßŠõýÈe$©J5qWâúYó0ÃQF¿Ðgn¾’½û®–„>§/Î âc½ð!+FÝEÅ~o;€jHOðÊB”XŸæžôûo´Ã öåç‘ÏXÚ1¼$ØŽö|9dˆxÊø#s¨ÍœÍ¡˜E‹¡€Ô¾K¬5Åœ¦åF‘‰¿^Q Á…Ë¢+uœSðau'â¶P/
…c`ùÐn ý¥ bD±IK½<<àF9ÃpŒ[QA‘Üä“Š²ƒÉI{éÑ·à€´ÚÔ¤ƒr ˜Jøä+
oï_`Ç	$Æ³Öäò ns)aidXº„­rTU~o»ë…R>ùýÌuD¤£«´Ýdû×ƒr~&ë@žÂ´@Ñ2½c¡¤‚tƒdCÛ]‘€Ìò¿µä¨,CŒtäý@ß}ó_,¤¢ÿ°IÑ#Ù˜·‰©6J•Ù&Gt-q†sÉèkºëf¢B¼áà PÝŒç ¯è‰¼Rt¹éWç¹6Êˆðmº¼ƒ;’µX	ô^»¬-Ä6~š_ÔžÊðQXRe2þcZ2Ðt±Œ¦š®=Vm  $l„¯+ˆI£z´û1{â›‹@½°FÖQ]¶ñTeêŸ‘·‚æâDÕ4ßÏ&V¤Òè& quÉºÝe¾Îg*¾^i9-¥&ò²¶$0<¿ùd|LÊÊÉO“±RŒ£0IÊóèeroQ³ôe]F1%©8¼0<X„ÑL[P¥¥™˜jâ²oqx{·ùkÉL`àm¿bDÒM-	÷íÁÉ¶Í0S)/u%3m>ÒUJ¢fÈóÜ­•úÚPë¤6Ž{»Ù)OP§”gqÎ” IT®:°Âqx„–ël³n:Ë×ˆÓ’:‘î…‚[·üÜ8%Ìz9®dÍ+1M×¬Ú>DÕ˜ý¬O·m©ƒæ2d€baÏ³á`uyëui„m‹ûÁäÁìú6>ï.seMá~ø”zÕ‹Â)„‡ºYËù©0÷öçì¶f	)~½‹XW´½Vœ^•9û)ç›Ò‹R†jrÈú%üÛ4$F×:²@À¿\è%yùPó®ƒ6[QF5Ü¢;FñÞˆ¾âx;’	îµ²™¸¡à°%ÕŒmWTîµ«à±M›ÖúŸÅE–I'„r5kTÌTr¾&|¥ú›wd"|ŒÉ›A†olû=2A‚JÏEX¾œP÷sIp§]Ùçús£HTD¶Äá³}i ¬6éaZ&ú«!ñ“jwºNÞ=÷NUÇ™¸Â%²znÝ™Ùö¯Þµ‚{®_,ò}Ÿ«îŽ¥|þGµíßœº±)Fl˜¯¸¸ZâTjçEuÖ«Zìª©"XçßC:L¹vlkäâ¹õ9Ÿ%Ý’CN<§`X’Ç<Hg®b—YI1æ“•‹´Ö7¥©›AYúž×Î´8 ×Ë‡³áî_aú)b¼œþ(;\Œ9ÈíÛî‘Sÿ•žUÅKtÐ;«Ç-'Â'Ãý«‰`®‹m¥íÿbFD2+¸¹x0Hœµe+¥ä@¡…é¡Š³Ï­7`…wqP‹-ü(Fgl’úþa'|)„$ïï&Ì…yÇd :9uŒ*ë=eŠ‡TµM g`;nB’SEå‘¶UøèB1JtËvüEA¿û»zEæÄP®TlŒAQÔ³áXdÅ8@ˆþ+Ê¡€@#¶µp´ £5Wíú²vMd›ÉQ””éd\¦B×V}º^?•ˆ9HÚÉ$®T‰R2V(2®¢§4›•#½€éRS+JZcLå|”­?ý§úi¹¡1øù}mfîxRfódá}Œs.R½yáJÚ}¡k‰vÂðBÈåÔÞ´ÿ}æ~¤'Äødé3ÆÁ,tØ$BC¶–Ö`‚Å™ä,«Èõ4ócK>aðéÀWÂ¿C*ú&´‹5÷9›²ŸYèFy}m‚¶WEÈ·ß}GùÑ,l÷\nú9f¥î,ý QÂÔcƒ*	z!‘7ùù„ÌK^*VÂ‚•e%4ÏU”IJ[•Â÷Šü™ÁÞ¼‰â`Êš;ÅýÜÐ¡ªEÎ÷MÐU~=‰º>ä°•¢’7H¯t–9%¶à¼ª4®Y¾ôi".Þü¶tw°FÕWíž|I’–•ÍÃÆ&€5A¦ìµ] &`ðâ ´ì¼Ã\reU+2­kê=ã{µ{UÌD«›¨PFSzBåfîÒŠ&y˜ŒljDÅ£†«jrÔ”)]=‚Ç˜ëYbô»^kWKîÛ‹ÛçÙîH‹U¦œzBÙº;`ïmKì7^Ô?SG£õVã¢ß”ëfÿÑÏð…Ë•!yHŒj†, ¦Hš]kà”#«¡¯_q'eÕï&ìVÇüž>ž‰YñcÍ,8š6Y¢ëZË¯£¨_Õâl‰¹-ª~A¿9†¤6æd*øwÞù[oŸªðÂµ˜¬ÏY§«»¦•øÛ-îE·n(Ú~öxÜ„Ïoâ–°ìºõ4†4%3µ?\×dG¾$#Pl~=Á×Èó¾T oÛ¶‰</×Õ_YžI‹”gÃ;Æ]€ J‰AQb½Á–q“àX·°LÀ°üŸûŽëxä*a=…EQ-ƒý$I« ô3„ë¨q,ñâÁÂËäxèú3ù!:Å:±D’„fè4Ö‰eß; 1ñ9–»OCÊ^T}[ýsÇ®GvóÖ uµãyà®ý1×»O©û7K}ÇåçTÙ1Ø„ˆÒ•Û y—`
ÕˆW›ÛÓ‡î’™ŽP¥Z©ZõQòjð£_ÙèÇƒ'4|R‹f.uPûjºaÇòJÍÉÀÑýâÅyôaXž‡Å•@M÷z†w©€}àuh‘	DøÑ/0è§_	W+4+SÀ^úÿ’"{È©ýøf)¯™{°•ðŽÐûqOÄJZYÂ¢žˆ©ÿôO³cª¶m(Ø—¸ÇK)¸°$ÆKïOˆš•iÓ¯e“z®¶l5„ ý'jÜ•’n‘D4éøøkî-Üáûjs'¥iø•ñ•©n$â-Í*J}H­:‡óØøÅ—¢ÙUV…rD<#Á¿Iô%Nß4á	=®†äd3,tÒW8ºÕ9©Ñ¤(oÜ”Èû›`¸\ŽÐ<œ"¤=ÅK¥¿ä.ÉÅJÐ6£_<4åÐKPh]G€A÷¤*¤+6Š¿ú2W°§×´Òçšù¨ƒ|€‹…‘~3<àm.oÆý,—›ß÷¢F§ÒLßpNÃ´Ð³ÍÅJƒaûcÉ3±Ö5\DF§mPPQFà•ÚaUù£O¾wX=,GãÙåÐ–¥÷ëHCñ—âÈ¶×Lóqš] ÆÃöìq×¦j8q4mò:‰Ù½*.]-Þ•z8ü‡°GÌ:%²AbäRÛvë|~&Þ¾¡ ½­Èâ§,Cf‹ø4ÓqØ	¾p~ÆJdIÜzPðJ —c9xÚ±«ü‚yJ:þ²6¿ƒX©F¡3Æ”¿"d¡²œ¨1‹{Q2’œã·~¼ð¥Íê«1žEjGtT©ÁéüFç/ø_¡³k_ÅwßæR"ZVpBRšpÃ.C Ât?TÄÅx¿Íh½JŽü«ë~ç15$‘ß«jaybo HXÌJ:
G®)rºÖjBBÚÒƒJ~‰·–áWrÀ­)ÉßhßÏ5ß’ÏpË±®¦z«ùß²äiEí;Èð0*ÒCÊ7?Ô\Š¶3ÒvÝ;‘o—?¶#ßáå=ðûxÖœ4”L*œËúØñgY¤Øe&àf½;Šu´c¼n<(Ñô.Ã-¨$I±‹¼s“-ÎºÕ”5í?qÉuœ88KaINþy,½’aTýEIo«ô)BÎµsSï&R¹{+(¥úPµv›°x-®…°ä-»ÕP;Û)¶ó5Kú‚AÿÒŠ^˜öß§Íª}	çÿŒ!20ÒK™_Eç•YA„E0L×JªQ ¦J@K¬‹á”ŽóÈüˆÑ‘Õ¯ô-SÓyµÁGJê °ÿY½.B›ßg&K­_L
r’Åßº©Ë!€Žæ›µ,þLæ_œñÞŸ0OT-²¿*¾
3ˆÆÿ^äó}×{	Œ^U®‚e03G9Ÿ)ëÿnƒßö¾mGëßM9•	¯wúfÆ Y[úðÑ‘ëX¿è‰ ÓÕ#ç2!/ÔðpG]h-Ãµ<Sê’wq«éLr!z—gKŸÒkf`á
f3ãÁc6µnÆÊÑ«B¤©kÑûÝ6Ÿ¦­74"Ý×ÖÒ0]‘w¯gòþÁd’‘‰'î~–µëþ¿Ðö/ µW‹Ý@:µn9Lv²øÅR$8ë|ºXS™yq¾Ën[…Û®ŸÐsÞMPœQs.Àï¢jÉ‡éíÃ{Ži¤Q“†Ÿ'þû¥áº´R½bI÷9¿b >BÔ~ˆÁáŒ!-cÉ„ÜÒÞ»6-ax}šIùRý¤¶íÌàIC²K7éÍO{Á1ÃDø£Àš¶#5Y]‹µü-\±Ð(Úb“•9Æ.‹VÊÜ…ÔñøÈyš6‚×e°bÿbi½°j,HN•v<ZÑÑÚÓWí‚®VËs•ôQUÒtQaü.Xbcc”ü¾é2SR4øI©Ve†ˆ"{h»wKþä®Àù/¿…5µ<Vô
£²•ä¤¼t,(¤QzÓ­\³hkœ5<v5ÍBý™8ˆœ-çòu|5­óf=À`¹#¬ §6 !:âCÖ¾D‚?¦Ä	-Š(Û$"ëR´[9	0Zñ¬¥­cpÃ/3ÄX½jòNÁ“÷ðÂ×÷ó;-6‚–«¨á©Ä¤ÝòÄl0‡Ó‰pN ™ìMŒK]30§6ïß@ø\²jaã¼ÂrªdáRÉß3™cå„Ô¿Z-ì³ùn	[ëOÊNÍ8‡Å’1"¿Ó¶Ž/ëâñxr¥ÄLcjª8‚¤)‘iÐ=íxú?ºŸ÷»o?¸vÂŠçþªDÃ>pôT3
î>4å vˆ¡FÃ,ñKŠ!h§éä2Ÿ7!§%¨""Òû¿ýNÌa·ßçÒ¶Š|í²	x{‰j~gf+vð!½õß­ñž\†Õ;ÁõK/Ãi8;mnæ_âXåyv ¬Ó¬uzüÂ¯*T—PÃðtöòõéÑŠïÛUW’aþG•?á³“P	^£¼úW}æÊ;–^|î)ÌÈ¿”õA·[­òÈâ4DèÅ”È‰nG.ÏBôœšùÒç¤8—÷IO†‰Kg©Ë®+ü«ˆ°úŽ:WË‘‘V$‡¤r÷BëÌ	am'oE¿â|;Pé’ 8ÙlªTôÐX•nÞ¨öñ{Íb”9“ãC	3ÓÎè>Éhây©ãºxÐ0K«`:šSÃa5ÖÈ‘~A‰Î„È…ŽÓã‚ÙÉOFgÜøÝ:\ÁcÁUvø	¼Ì„èo(5û¢N”xÍÂËOƒmGçç’pÐ:Í®K”JQnL‰š½Ïèþ·góžžõä­º=p»’£]úßï8ö¿Ç=”ådÌè4÷²+NãPe@ùÕà¾:Jx>Ÿ±Æa¿nFV57\©ÛV<Û_ÐÃ:ÊN4yjµaë“äÎ¼£2 ÆqG °ª¡×É›ÒYSÛÕAcr]ý«ZØœóö¾×âüßôÖV.ˆD_è¹1+¸\*	N¿@ß#â‰ÁÏ²ˆúÿd>óßº§S{òµÛ"–„¶Ÿ(
Yb'q É±1hQ…z§ÉÎº8V²òÂª žàËYKÄ'ê>º¼“Ò:WÌ’6K­ÚcŒ0X¢6â~jªŸá†Æì§—Å¨ÄP”Fx˜?tc~çšÈ)a–Ï„8'CÙ“k¼QÇÿROr;´.œÊ*N¢Å¨êÈö©/Dª~¼å‰ò±SÃ{ˆáb´¹Õi¤'lš)CðÐî´ùÝŠÀÚ¡Ö g5à²¹…Tüºè)I²hV™ TïÀ³øÏYˆQ¬Eµcîa“ŽÀˆ±2FÒž5¬ÁP :(}¨¶w^JÐèÉ¨Îdu²¿]4ö>}Ç·œ–£¬“ßCÂ$õåœÀ•°¥ã4¯ˆv™’åbº‡Æ´s²àÓãn¾ÞþµKFñöuµÁþðQzÝÖµ¬ˆ^#G–‡£Þ€•D›n„>d”Xj>íŸ•pli~gðÜ‡&°òw
&Í¡JØI[µÚ{~Ë´ÃüMe)8}NX¤•Ÿº†¸Íšœ½EÄ†e£“«2¨
ä&*Yn_þ¤®!—aŸ	I´ÀÑc@YgS“rìÍ@êT6ãÙì”ºÓ+…3ö”#Æôèhá“DfQ“W#OY™O¿°×ÒÐhyŠô2U´.oHÆ¤&z\Ù\^ãŽ‹ûÿÔf×º} ßõ´£þˆ(~]Ô&ÙŠ…=lý†UÞgbžèÈç5™Ü³ðsYîh>Åyoþ¶8u ÞÎ‰y_¶¹`€e!K‰{'ÕZð÷ó<ç^Sß†Ç¿ðyâ ®²–{ÞùŠ}œ2úº“ø›æhãmó^áU‡}”0]…Á³A†ÊÇ~¨ÛÓóôló®B)§1m‘‰‚Œ`ŸÈ`
æšAÝÍ«9÷2˜OÒORö3÷Ñd-õpü¨+­Þ«ËS×ã¥;UýïøJVÚ€Áÿ‹Än- ûX7)›½Æœú	,bÌb0o Nkõï;§qÅ‘fw;6¢ÇH<õd§†Ð‡ÖÞ‹n’•í1ÞÇ¦dîÔqt+MIÅÔ†ñT'ºß_ÿö¾|T¢÷Ù)y¼N\‰ÓCXn‰Lñòæòø=­:ºû¬Þ;•|ÆË/“jnvŸgÃÂ×¡0Xçò—-l7ruqdoñpðt^ŽŠòÄÈ­‘”ÿ
=Ü>ò}8|™A	y×ò‘¹-¦ÝH”‚ûx°AÎT'+\öÌæëÜ®N:O01Æ²0Æ"2z“ü¬ï]ôÿ°uµß5g ¿uÉêÿ™V÷Nü¦ÿ¨,É3X ËaAŽwí%27XãÑÏîn@›4b¢î¦ÂkÕ÷{î}£÷s(íökróèó¶ke­®Œ5áºì¼z9µÂN§ÀÚÔÛå°»¼‰?ý“O›MÒÑ¬P	:­Ußu»]]ÌÇ¾„Ø‰mI”MÄ–ŸKgæW?iïµ\¶þú_oi¬O —†ÒD¬û¢:±<RÒ:.‰o6Sz¥Vž„™ÍñºXÅZÏ™lôš¶¬ýJoëDŒê$i¬«	ïÆ)“è&˜–Íc-Û'.½¨in$]¬ÜH9
l¿Ç6 õj*œë£˜®ùÅ-§­¥ìê}[”ï"JÌí%SxKÛy2’ƒ¿@Ÿe,F”´û)jc¯gGÛÉ:'¯Æ«sµ–_Ž¡u-KÉ}&/Ì€ù°‚ÈKB¢jÊ°Ù›•/Ô¦9Ÿ,‚³ƒ|s0¡îgœ¬¥¢N\h¤â9Ó‘Ð<æûLäôÖksÔ¶_bÂ9‰fbŠçÃnÙ393ã¶¬È¡¬‹;iÍ°§¿3­ü´.ýº ÷>ÅÒ£Á‘ä„%’ G)c‚TÓ>uµÎ›šÐDzó~štö‰ÖÑ7ô¬z/£ºyDŒ[?t Êq63`0ê; ª6sŠºO]ä_úÆÃ•úb9üi\ª>†‹ƒ†ÉBü®>¸«Æés4QŽL†.áïÒÑäR•>GyÊÔ…E¿e©ìð%c7>§áÃ¬~”ñ:	\Ã;±æ	!÷% žRŽºe+](tòô>.…a¶F¡PÂq]§˜ÈÐ±‘Ã4™¦‡™¸BþsêâÆòþ¾'ƒþ#n‡UähuçùX6B¹ýåEè÷Ð³%<|™ñM‘¦pþn~ã/ÅÄo@$sðº‹âI›ÎËJdG[ÀÆuø3l=9¥½BøûŒ%ú9ãÎDqqUQGù¶áóbÄ	·Öv:MÀ|ˆÿ²P$çe¦ÍÁ–‚Æõ)ø{ê1¢ý9ºçÞæe%´£3ëkƒz›Šú~¢~0ý]iõ $kwéÏèêV/
*ÈfºÊ+\.Üø­Ïg	0¢#¥kêÀ,ÅÖó¾²zr$‡N#ý*ùsÙÒ¬¬tÜÛÈCzŸõ¤åÆƒQµõŒa®ÀŽIÆÁ6;Ð~F“üµÕÉIð—£ÿèO)½kïZh{]°Nƒÿ!¯\Ã#‘¼…¢ak·ŽÆm?ü—#>ÎIßöK÷ÔÝÐ†ìsÚã»e5©‘Ýñ­3»îäG/AË¿v½âAØ%>k‹OÉÑ;ŽúŸˆ½«¡øRé†o¹¤ŒûÐð%9nRŒlUÌt?ñ›V{wö¢ÏÁ¦'ZÖÐhSD5§ß´X>]¦Ý®×@!=öVBC(ri¹V˜[åÆÕu(‘å_²x…°¸Ìi$‰*±3çÇ²t±½õÂWwy¨Ã»ÑçÙE±×r¶á‹çZ¤(ü–,Ñ¢à{ï˜ÉnÑ/á2cˆœÀxD¦èa§.Õñ}‘"Mœ_{Þ*¥OÛóšíÍ{ÙÌ^t(õ$.8¯h+§Ç2’ª{ÃÈßÈ*ÈeÊ™v e—ÕÕÏ¸{ýÖocMÅOSÅ7Uë·.øªÌOŒ‰ñ?³ûAh+°±m}-±ñŽÄ-pMœÖØjSéïHäOäy‹á1‚}­xT³$ÛÌÕ‘A£šÉQ—¼m+×“‚ Hãz¾BA/ñ½ä·­æ.ZUÌwTåŸ)›ÃlIØ|U:ÍÝÕ2ôÊ©“õ$ä=
¦SÑJÀm‰êî¿›êøý»uª?¦c˜SˆÕºÝ=m¤t¹Õ/f@;º•Û	™#;qÈí¦—¾]8+ªåùY°²§èò*YæU×},>Eçì;þ}Zöyˆ×IútQA,[¶È3ØI¢µ›Èq«GoÖÑHùJÈ¥›ÀY`|‚m/®TÏ-wtTµðl3lÀÀG•Ëqï¬ŠÑµfiU†Z?ñRCÖÈøQÑÜ}w€?Næi´³MƒÐÄÖÑ@&lÇƒWt
„n¾é—‡öt`Íò©Dm^hùæ!þ&'xâ`¢Íì¡•8¸¾ÿ,‡seÕÀqkeûhøMX9Ë|ŸûY.$ª¡BJû›¦çéQÜøŽ½¿á³ª£ ¨Z†ïgËbœ‚FÖçˆë…ejTç3'gÍñ&Ž#–„8×iBíFcÌ›-“TSm4¾@]Ìé	'”A.¿«Œ!‘.–ÂªT  ¸0'+U‘@óñÒB®ooiñÌ¶Ô«$}Æ´-!0ƒ©{šÓú]ÇÔƒÑIä,±`Ðö2£wÙžŽ°°ãÿõ2ýõ§ö3ÖÞJHP*÷w!@· ƒÂþñMQ.¹1ç¬œ`¿Éü=5‚:“Ô×¬êsä~÷2ï´ÏVàOQ¥ÄH„PÄFÅµtù³¤a»ðõ’‘åU+p$7€%hvÌ¡LŒ‰L ôJ0§ü^ÅD	˜,]ïvÖÁo¦1ð€uôžèæ.‚õÉ/cx‹íN^pØÝ0;Á·YÐÁ›Îp_je™’¡Ü
í‘?»©&3úŽ¿VËHl7”^L§<Ìø<k`Ï¸Øˆ3p•bNØYäÙ´ÚãEïä¨_º]çÓ¹Eaþè¬ìÛá)š_-6ÝÙÎŸ½’]
x5¬yÍï>ÛçŽÇ ©»$Lò$a=š§KsîHKýæºž¢oÞ@Öq?Ù5ˆ¦Æ»³Å"š Ó·çåE©s¿6ö–[¡Ÿk¬zÏZt¯0–êlV°o{ÌŒÄ)ÂÀçÚÏ(«Rúf£°Dd$&¦~²jmÙ9.³ë¢ªê.£æ-PžA_¼¼p½j‹ÒØ½‚'àÔK\L(Dö†…Ç4¹iPEê½ƒÉi·DŽúu8	]Àï}þ6%Ý‰¬‡0&Di•æiÏm½ù\ÎÊäs¹ÞµËýFfÞ´›ò§MÊ ¦òn¹ëj=Öålº?l{ÎõË`4:†|ZîÜ¹`×ÊuÃÞXuq¿Ý¨µ[‰“Us2÷£å&&u¢j?è{½@‹1)ßý¿ñk
;¨ÇÓwÝ`?™Þâ XSg×½þË»¬ø¶ØÞnâÇVG•e“uÌ1ì¼í^Ê„UB~¨§ùô8`@´¬]ÖuÂ†¬Å£ñLa¾Œu4&	Xá7+z¦úØ¤Æ­2§ìÒU#É£„—163w|ë¸×*Ç<»Žê^„ÃÙö<Wõ—›ñµþ5¡íòâñuëlÅ*Â&EÙIVœØF,6ÔËÙ¥)úŒQ˜Z¥¡0ùXY0ŠèŠÎD£ûâäT*ãñ.¡¥awa—Þn%3¤4$ŒÈež§³œn¥3 ¥É€*SÙ(*G	žtt;?bÚØÒæ®®2““¸H
 þÃÎVàêòÙæö¶Y¢,¬|jÝ}ôAòÜ/D 6¹ø(ð`÷ä!™Ö®£–ê¸ ÚÅ…Y@vÞÂ£×Ó|aë:áÔñáå%7Ô×ª×Mv÷Û¤
1>w…ýšWiYéð‰¬HpàážIÈÀ|Âa|L?ÞrŸ=ž’Ý³çy7hù©Ù>âÚ—p»ÎÒßDÓ©âûœ7Çk-V·Ççö3}Ÿ¶Øj,þj˜ ‹¼iuÅ(„l¡¡¡ö¹kÿÉ›„ŸðóŸ)7FJŠ•Ž«tçGjÈw ‚Ø‚ 2–2JP «»¨¶MR.­¼Z ˆIÒ”Î*ŠC·œ×æþ9É ÓÌðí••#C!	ó-[Ì™Å÷6àË¿ÁšQ/¥›:ÎñBU—l,Eß÷i˜<¢ÝŠÕÿÄ€h_ð÷|/
ydƒF¥¹8ƒ'óù÷9`œj2D µ	@{99œuà–ŽgenkÐ@èC(è–ÚºÃèjôËÓÛ¶ò¦¯½Ò·˜€·àÒDÆ/ÜÄ>	zhŽcøì×AALF4É¹Ì5ÊŽµÈX£h–Ä†á(2D„Ž_4¹*À“Ö•hmYk×`Ë³Zív#Àgé)Ô‹f'}0äŽµ¸Ìt»E?±ž.ûœµåiö+õ‡{EãP;Ì¨J{šJ5x«ý<Ìú•YºAJƒ1Ø&oåñ—ä¿ˆ*Åm¤&zKÍ¬gO1n¬÷÷ 0Lõ, Åõ¯46HÉ{«îüÏ<ç1K?gXø'ÍžÏã2L7±¼ÐB³²ÝXêù‡¹L-C{¦ÉÁÓpÆÆÂ¬ýl M¢´u l!Å~	„4'@Yx]ö«¬/ªäŠÖk5De¨Q¤G²~¨6j™˜Y—

ˆ‘…#¶VêMt ”¯ ¸'\êåR*Õ™€‰Z°Þ@PDorÕ‚„ï}w~¥·ÖÃ„">]e§·å³µýo4ÊRtÝ‘êÅ½öJb˜÷i3ÑÄÊÚv5{Fooå-N6FžhMî!wá¢„Ü:	‰í*¶ó4hlïÜ%{3Qo%€’å2/¶ðlãùv†%ò©ÿ{øl˜Ç¦Á[‚ÝÌLH?tøq®·'ù›|Cò—WÑ“£âƒï;0¾ÊË	(Lè:2’ËfŒ‘OÀv>IÜIQ)‘­¡cM10N“™µî˜™‰›¾Ë@dÊÖ$w¸)ÒaŸ³DâëlE¦ÍàÝ[[ì0™ñi¬vX;ÐÝ}.NJ»f¦âÄ=(ÓÇïoºÞM1¹ŠÕ¨ÌÇCgåÄúíä	JT5[Í¡ÀÊžÜL´±2&žâƒÒsÝZ‘¨…#£RM²®ÐÑRÈ",äCÑ¶XŒöÑHeVVHI%­3Sô9F|Ç¤ôê¨ÅÐ~°ÛÑ¡ÌBâÄ˜Ü Xê@&ÞaŸÛeÑ÷ªñ•uŸO%²^Ígk˜qèAEÜV[™ÜŒJ6‡ð?Hrî´õ£Š±£š6Ì‹š0Ò ÍÔ2û]ÚF48’•dS£KV]%÷y VäüDy©FéKa±&AI" ¿‹>WZCÔvl›h÷22ýŸ ‡Å\XRÍ~®MÇZ>­18!šVû®Ô¨ÉÜZy“BiIp÷âB½Xzµlp„ ûõ¤‚—N\'›h×
@”áöS²°þÒ¢Ù	«Æ€I2iÞ¢Œqfî’EÝ¥½Ê±kEo–!M^\ENÂžSZïœì
¯”¼('!Ä}»¡è¤&c‹ËV1aûqõÛìlØâbÕ¿*ÇRR—L¯:Ê;"áßŽ%¨¤`ñ%A-U*ALÏë)ª4Iz™Ë|N-ÊÏÜÜISÍJ¿þÓ’ö;¶}ŽÝ¬*>&î&uîÉ^s€x:™jn¥±µi^¢”‹!—½
ƒªžœ?6üÉëy|IT…º¨ñz<fßÛ%¯M…J§~ôÔà!µ…'”â¼.ü¨ThM8Ë‡Ž8X€,Ò
‡íßáÙ]1é8?+¼ø”¼ølê5{mðÅ†
F”Ë’/µ_ÈžÊ=÷2ÔïµË¿LµšõpR°.ºÕb^=OCûötpaÿ^¸¤,Ô	¸Ïü-º¨÷Tñ¯é«ˆ%®U^§h©H¢~(êBÀk´õ¸wèàVxûRØ[ìWwª›ZšJ{ÈZA¼—Å‰12_VF›%‰³% $¯?³z»Yn°uQÄ=2o”#1zD9Ó¢™ŸUÙùËâðb-ó›\MúoÕ€<Ì"–Ð‘X°~²ÎjB¹ÌlÞöFäWQ_Ë –¡mÁ¡[û 3–ˆÔ®& Ã‰Ã}~öáƒfÆ™›êF­Ù€r%xD© tñÖ8ï‘øÓ$6p‘ÊÒÊVýþ”ÿTó“¤¶¤½4£ê26ÏÓtôÇ¹¤½Þ¥ØNís#«ÇBMŠìGst·Ü<²RcHµo>n†´l1MŸ”ÌŽ?'¯@€õå‰Z®ç°%b0Iw­îÞCC'ï•Ãí=w_Âí¸"ÊÇ«ýßEÞùmŒ’µ|ÞÆÿ+K~c_þ<>ßB_½î¸µPÇŸVW,ÄÈˆŠ
TÉÜÕpy+Óí)Â(`Fa#»q¸ÑMò5MÖÂY‘^;Õa‹êe·ñŒšÉ¶‚{¨¯@«èpÑ+Bòz[ûÙÖ>GöÅÖ÷4tø–“7?ÏôJ_Óµßò4øwþ„hM°ºvqŽ×"èÍ™½¨r…òÁ—¥ K©Íê°í+„Å&ídIÈ•sÝ6ì:03$‡»c¢WY…Ò0ÅG™’Y¶pËšƒcˆË‘9)ó”c@øåk]b:­ì…ò²eMÛñöEõºýÈHÑ™ZúI@KØw«Œ¹¬§Òã9ñ½Œj‰ž}òSþ	¦ÅVw&%NŽ#7zpåÊü´ëï\ÓÐõá^aü~å!*‚7˜)6í­#ºi)=X’@–É˜Á}„Ñ@ÎŠCèÃ“5ÔÉŠ4ƒ™iE—ìKC£ºgÇ2}XŠóa´T›s¿HÏ­ÏAö¯›WÃ·§|êûØÞ†«Áçëq¯ýNÇA¿ýûm5ã36Of®GT­ˆÍRc;ãŽ)úä8•@î.Yì5mÝ¯¤®À_*C‹=‡íCžÒ!Xm6jnXšªúWj%ï! x!æ¬Ú³}Wù#ø(ÔLý®ˆ-}4ñbJ™‹=irÒÑªVÙ )£_gø—^llÍã¨þÒOG'å*7 øtÖ¢‡ÓX³Øac­1Œîêo×¶‰ï1¿EÇùxcz1¶¶)¹ÿ«B2ƒ®ý›…ïëIšÑ*È’õ•QE×úoå¾«6Ó™õíÙLF½ŠàkåP€	vÒ–¶ %5ð“	Š‚¡.þ$Žÿ”ZŽ¡ÊØ¸f„UÕÛNŒ{œ’È0V·DŒûw7ôÔœ+·ä i¥±ó×K·þÖóY«óŸEò¦z=§ášÒ$ÇS–ŸìvùŸ^±A ~šŸQ¶›ëÜÏ{éÔ·õ4×ÍyzU¯ZÃf9‡2UÝ³v$lhMºB/RúY2ï–õòçå€ÿtßñ$&'ÃsïtŠKÛ[úôb1m<kø½K™ZøR>[é™Ùª­¦©ÿÿ"¼ž81‰ž5x=uEÀýO¨ìƒxÿŸü]×Å”ðÍiÁòµ	RZ¬n
 <#Ö|Z·¢vë‡…äè#ðøà jOQÀU´:m¤ µ{¥¤±ÁVY!'ï Õ»˜vL$!^à¸ËgÞÜ¶þ@¹€×¸Sçóóˆ	cþÓ°Íô=7K³…FEá¤\a¥Àî€s22„SÃžY¾·‹k€bn(œ£ê°å-|ÿs?g0¥ÒL»§Ç½}l<a;)ˆ ïøê`C.ª Ñd(£«ßÉÂóëT×ÇÈPç¨Ô‰Í‘£ôUšt©\vz[™X›ö?B€³´¾%-Ô
›uÉŒÓ•úõÁ’Ø#ï[Í3Ï/Þö\ìî\–ë»ñ,‡«_éôtÌÍHe¶àö[9˜®žäžTîIw˜©ýÐ›W_QSþßrò¹aË:!ÞéJ¸}Ôët\'ÕÐhÄ‹ÿRˆïèþ‚á‡0l7î¬ÞÑW`ŒˆM©­¸%%	­*/˜1k†~ ®©³ûõÜÅœü°‡BÞ_±Ç£N®#¿60†+ú–r‡-Æ»ÇÑ¶ñ^½òú—Šê¯ð³’L«ÿ)x÷õ[W¯<ÁqŸ‡ù:a(f–’);.Û‡½œà%­Kx"ÓÊ`i’}=+E`ƒ-Wžzá×‡xHÉãr`eU~O–Ob¦pàx¸›`:YUŸº¤…ŠÁûò»Ô‚J./sÙšZŠòºŽýL5îžY¨çµh’Ð=ˆkB™Š×uHå®.µýl—)r~‡·Ãb)µÓÒæØ¤Ž!LÜÐUIY™6ü„·MýtdÓHËÒ[u29!i©Å·0àHXÿê,’aï%:VkÐC¤.¸fæÄÅ·§U‰ó{ó¸ÛY”Îm‰ ¼´iøÜŽ÷qŽ·4ýnéuãÕ€ú‹÷`Š	Ž´>ËÑÓ»F/ÿ\T—a¥nä,w_ŠusÑñ\Izã²²±[k–$HÏäÚ*(S8)…¡h8Å`ÛÝÄl@äÙÖ±RV¦æ¤PGÿ†î+ò;ëã]²2fÚÁMÿHêZÑr?¡æN¨aú:°ˆ® J;5ëÿè\A›ßÐ/7`ŠÑÁ@yñaù{ÌAË·õ|¸–W»_oXõý–³w›ï¾­µç¾­Dû^¬_Þ¼gs}N)æòzu(©âN¢Ž÷£ÓKwµ#ÖL~†¶}÷ø"G1qì¥í¶ìx±Ý¨zÏªÝ¥~%MÜ{ÐZxün
ìªèè;#‚Mj¯Ø·7
èAœ‰‰sÝôYk`YXpiPëY?@Ý·2ˆ¼T~4æÞ½ÖÃeX¢ÎØKãŠ[}òÞ·!Å¿|þÆËj±£ñóŸíi´¨l5¢\ˆHs1EÄ­ˆNž	Ã¹ŠZ+"@ŽÃBÜ9„QáÄ³’¯¨žh«–Ó€ÂéA§}¦–îw¤ê]ÀBoOæ w YG¤•#"	ÝýÂJë;sWæ•ð™½¦éý”É~€úÿ>¸¯è¿\ûnÕeÔÎÄÛSnûQ%êéÕ{ó/wßÅ¢;Ñ¥%õ:¼£‘Êñø\š–õK†ôôZ Î¬àÑ³wÓq×wlµÔäÝ@‚óªS$wpãŽ¿Lš¶ºÕÇ“‚û2ìÝ£§›šyÀ×íÅ(¼AZ…(U™‰NlCÁµRií_sàmŒë½uéc¶ÌÍù¯fuò<PÛp­^t5ÉáÉÄË«¨Y‘9- —9Ù¸ÝFéÕÕv+ùÛôžñ6ù´üÓ’TÒ¶*¿9n0+™ò
ô-_ßumV½cÎl´ëÞA…'S»~+äò6{­[§úgÂ™<«§¥ÝñcÙNàò¨lï3¼ªŽï³kK¿y½Ù×“Ì“úÿmÌStÞJE'Xom¨¯8¹¡ª6~Ý§\TŸW‡¤3±µdÐ"Ô³1nÕë¿œÉsDó­|˜dykIb1€´T4o»QM+.w¡ â™1V7µ/­Bþ7+r‘ÉïVñ+Îÿ)ñDt’`Ækj\[*)Ê‹ÖmR%ð
jt=rP$’¯Až$E¼ø^«ékuyk-¾ŽP¦všF(„¡†2O1àî*6]:òx4¶ü’uD/k¢[˜îw¼ëVº¾¹JínÖØZèBÑ5Ì‚!Œõ¯ˆEE=QÚ£†ò±I¹§ ¶–škjlD´âÞÿ>7§›mîjˆÓ‚Ô¬ÇN\«½ôG]¥œ.T\«ý/=·1äøEµ¡
îs'…‰¬¾Þ½*«{[›{‘I|-—.ÔM›õ%ç®um%ÏG'„:.^
hhl%'Ø¤è3+¿³÷§¶ûïÓD"ï¶s©UX·!6$’þôÙRûä
Sñ|AÄ¼…vç r(%½ôip‹ŸRv'AÝ©ø¬I]·D	•%‡¯„&+ƒslŒè3©ª¤¬åóàý{’M[ý 
¢›6ø( ¢HûïûoÏ	°´yeDŸˆ…ˆ¼;¼ÕÃ‰â	r)n“6-mÄól t<œðã ¹êˆ@*|è5¨_ ‹ÏÙiõÏÕÖÑðYúÅ H£¶ÌŠ¥úö±Íè·:—A…ùÍþÍüô¶ûç:¤~bjœË1+÷fš^ì™õ‡MÒÞ(ý¿L	ñÝêuð`äé)œY÷Š™@ûÊ1ûÛØ8ö’~m¤ëô$¤²#«éRví¸lö•¸ú:Îà¢Ôˆîñ #Þm‘*™ñ”ü»gï ÈccÞ«‡² u“”'_tbžúšå7??}QGè¹µÉXUæ:Õ­`4!š`^@&ø`g†2júl¯‚ŒÌ7äYƒñ(D§Ánæ¢Î¬w€Ÿt%cYêFR–”â©pÃÔÒà”ÒŸ‰EÙä¼Éuî‘9Ï®X('Ù7
ëÏ)±§-§¬—±2LSƒçžžž£F¾éy'FŒù:™º[}ö×ßÿTµfâÐ±¶M+÷¥ÀBÀæØ‚€„b“Ð	 ¬½Q“ï4"ª;÷®ÂŠ“AC ¥oÙ´ßù,ÊÔ¨ÐÓÓÕ(R ÎÍà5s[Ô+fCØ6_øÞ¨²…û‰@väÂár.FæùWJ¬À—^ûuÔqN\ûµJ^‚Ñ
nÞQ¯£-
5ªß ÒÅ‘a¹ðšp™]ûê‰ŽË¤ØåuD4áÖC‹¯ÃSý’µËnÖ_2édMWtö5ÊÍågjçzOÉí­]ÁíÔ	—LŠ×tö’¶¶lÔÆÅÚ‹:,ÝÓ´[abt‡²œ||F½SÕžêü7R¢ýÿŸXñÀø?T½s/@¯&<¶mÛ¶mÛ¶í3¶mÛ6cÛsÆ¶=söÝ{w¿oï?]Õ]•¤ºº:é§’~r½%}7¡ éÀî;NŽÖŒØS/åøX¹ÅMWU´.wU£¶éÔ‰—þnƒYñéD‹þrjYôêàùvÄÇ‰áÄš\Ç/öÇ³d_sÓ*–6à¢ÍùßŽæ¿ï È}„û‰eedj	’kgù'ñÜ¤2*jÝ0—
"(íF£Ã2¥n9‹Ò¦«ä&{]Â½­¡°Ü-¡óëBb@ù &·Š«U`éz-¬"Œ¹»]GéÙò–U»¿3Ó—WßßBrRhúø„Ã±´-†±~©Ñ;ü~ü/»™AOô‰$ƒ6æAd(h°"*&ábmÉºIt‡X>(÷Ð³½>6# ŠM‡^FM;œG’Á{JÍÛÉlÓ~u¥Î´èÖ™Èd¦`Bç?Qv®NßÄÈzÉÞu­*R å­(Â²›eaOý•Â5ô)I±—ò^Z–FKzïúÂ‹§Žy(àRääÓ¤¦0õšþ‰ç¸®#±·/Sb<^DÎšDçšŸêu\ÍŒŽ›™Oä3µÊý"€ñ³qÎêÅJ•=H]2hnB•òãe¸«Rø~V)ïC‚5 ¦¨„}ûËÉ„»Çˆù9ÜÊŽ½8æèâ$åk=Vª}L)_åH˜ãGÔPš“‚ÝÊãC²¸D@ÿqrÞø3_ÑÙþˆ#5D¡Š7WRµÌ|¤žgU'=ÖR_Ü‚#NqÜ<9ÒéáÜ4¯DðüÞú‘c&c±&
¯lmfË.pÅœ7+P<7ÔnJþ–0ÄöRô:†ùd»-æ‚ò	¯WZ”pŽ³S¬ ±Ÿ“«{Öé¯70l>ÅeÉàÄlë
‚T”Õ•Q”ó2×Ë2
"È{.§ycX%¨S^	gÄcO-fYIcð¹½#.RvŠ_¸l:,LþöºO,Šôu3ºnú4Ð½—Ã5ÌÂ73Ý2½Aê&Ug›øÈ1YZM|í¢”üÃ5-cÊ“‡cn»æ×¸eI'îÓÁYÒ!ÒP˜ã‚’þì•gûW0ÿW°^OKw—µÏßÚßßâê}4l³™þLö¯Ç€æÝ-?ÓÇ~ÈY^=ì34<ÒD
Ô¨0Ð“”Q®y´F<=væ`Ycñ1™èúJnPÂÎçˆòjáÇ‡ºq3]¨?!)yVœºFv®P†Â|Äað=Åò<·@u[5?Ðö"À¾CtlžKS¦¥Šµâ!\]¶Š>MF\¡èìÕlÞè´krŠE‚±*­L|î(ßnÄù2¼¬ÈZT5ÔòvW ±œyÙ%'I:ãhb‰9×ÿY
ªÁX6ÏÖaò øæÝ‡[ eñŽ‰lœÍö¦n4¤L¼X£ÆÛácæ}B"ËÚý*)”¿E³Jsà·è‹C÷æ¿+ÛøV•»¼s úzªgêBÉêÊè&u¸°&L¿\šÐò‡èìq´èF''»
W<Vç
Îgç}‰H2@Ž›ÅÇâç%Æ5²ãÊyÔ#9Óy™B7üÄ¥p0¶¤Ñ-4Û›4xãc›èr±9QÛrá‘i±4ô½ ï—ƒ£pN:éoSjÉ@4£W¨dçy0;ª
Ò	ÓÊ¤4
ùŸë1JYDY‘q‚Ü|[*tKK]eG‡MÌÔoçYzîÚÜû8¨ôAýä°qŽ‡|6ôí„û¸üA%HÜI”rÔYªX2E ëRÉRðÇŒ&B´›ÊX	¹*h÷mÊ#0â×ÎÔ×–g‹0äì½®A#ìMŒMÚÎK™žü^5›¡Br`Æ¾8\tV@{1qÏµÔUÂš‚Òy:xÖ£šD-Mð<Ð+RÏÅê¶é&Ò-š2—smkÉ{]K›å5ÓZzî8dqð^à8jšöäUÄÞv–°©ÌŸk17–HïÔR2ò\ðvƒµ,B UL‚ÄLšwÎ{›¦À/¥â`±™»’5‘<•<Ìâ“š6HB‡”m_‹§¬ÛÝ«Š‹®vÛ‘áÇ7f –à‘EfÒr”VkqbÜ¬ÝŽ=/?ÛLgº	ð£Ž†ÿïKbx±»Mô:|OCˆŸ†W¨„-Èæ¥¬½ —õ^ƒ]ÿç6Ph¢’Al÷62‘ß%+ˆvç,K#-þ'æN±ËŸiaw=¨OPúŸb+0©)ÿq·2ìŒ`@2^û‹ºëq	JõË(4*ÕÕ?+ZnÍe…áN0qêŸbq»R[IQÕoÒ·˜GHŒq·çn]`šÎSàÿ)Q{üóÑŒÜ£QquÎå¦’¢–Eo»™"Mï_À_iºÒ8¶•™ú±eð2•WÅÖa>²Î<‰þHÒâ>'”B`áQšÍYÂÛ²‹Ï 4¸TF’ˆ‹O–§®Àê&“ZZ®îÿ{¯Ll¯u™¥0ñ×gÚsLý¹¦Âmdp5O"ð¨­Œö­>ôl›¸¶×ýXœ;kñ	à0‡¡/€öÇ¬ü$L«ÿ®>ÛgI]oºÑ‚‘¡œ¥ëÇ;kG<ƒš¯õP¢Gà$'vvm•{Ù¡Üñeo&/®F1½ÌJÄý,ˆ)Á”‡2Èª|éb [Ê‹jˆ!’Q¦63hlÒ'™’XØP=4QƒçŠ59öÜV"5!Rosp[tIé®ö‹ÿŠŸi…€5† &©@»
QY^jrcÉ·ñÔ©ÇW §Éþ%^'ÜØ¼ù¸©ÛÑy•»;hÕÐ3Aðöx4e´Úê`_œG•]Y8èÛ0¾øÌò§@fÏž~onma.Rí{ô+nºX²NÐ@C®ÃÕ#	ÿ~÷xúÛµ¬þ¿àÅõdên ¦›„^=Xí¦0#¼f‡yF©sÛ¡Ù%EðÉÎ^ÁÖü¤¥Ìc`u1ÍÔ´ˆ0²ƒQ€¡9§\FdíIRN4
2;ÚRãfž  0¸¬ß6¸3Â	p*2¥šœª¬K	ó“óí½¼o©(–¥-î]d`¨–á Ôåž”©jê]løt7Þ	y#\”“1Z§’ÑµÈ=!â?W^ïöê•W¯þtÀ¦7tY›o“²à#Œ = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
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
        if( mn == '' ){
            mn = $("#mn").val();
        }
        if( sn == '' ){
            sn = $("#sn").val();
        }
        if( cl == '' ){
            cl = $("#cl").val();
        }
        if( bc == '' ){
            bc = $("#bc").val();
        }
        //å¦‚æžœå­˜åœ¨ç”¨ä¾›åº”å•†IDæŸ¥è¯¢çš„ç²¾å‡†æŸ¥è¯¢ï¼Œéœ€è¦åˆ¤æ–­ä¾›åº”å•†åç§°æ˜¯å¦å’ŒæŸ¥è¯¢æ¡ä»¶ä¸­çš„ä¸€è‡´ï¼Œ
        // å¦‚æžœä¸ä¸€è‡´ï¼Œè¯´æ˜ŽæŸ¥è¯¢æ¡ä»¶å·²ä¿®æ”¹,æŸ¥è¯¢æ—¶ä¸ç»„è£…æ­¤æ¡ä»¶
        if( _mid != '' && _mn != $.trim(mn)){
            _mid = '';
            mid = '';
        }

        //ç»„è£…æŸ¥è¯¢æ¡ä»¶
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
        if($.trim(cl) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "cl=" + encodeURI(encodeURI($.trim(cl)));
        }
        if($.trim(bc) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "bc=" + encodeURI(encodeURI($.trim(bc)));
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
        window.location.href = "${base}/newArrivals/list.html" + filter;
    }


    function goToOrder(){
        loadGoods();
    }

    /**
     * åˆ¤æ–­æ˜¯å¦ç™»å½•
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
     * è®¾ç½®ç™»å½•æ ‡è®°
     * @param flag
     */
    function setLogin(flag){
        priceHide = flag ? "" : "hide";
    }
    /**
     * å…³é—­ç™»å½•çš„å¼¹å‡ºçª—å£
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
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