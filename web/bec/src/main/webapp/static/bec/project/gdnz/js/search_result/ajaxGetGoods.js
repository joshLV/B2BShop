var totalheight = 0;     //å®šä¹‰ä¸€ä¸ªæ€»çš„é«˜åº¦å˜é‡
var flag = true;//æ•°æ®æ˜¯å¦åŠ è½½å®Œäº† true æœªå®Œ  false  å®Œäº†
var isLoad = true;//æ˜¯å¦åŠ è½½ä¸­ï¼Œ true æœªåŠ è½½  false  æ­£åœ¨åŠ è½½ä¸­
$(window).scroll( function() {
    totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //æµè§ˆå™¨çš„é«˜åº¦åŠ ä¸Šæ»šåŠ¨æ¡çš„é«˜åº¦,å‡å»åº•éƒ¨é«˜åº¦

    if ($(document).height() <= totalheight)     //å½“æ–‡æ¡£çš„é«˜åº¦å°äºæˆ–è€…ç­‰äºæ€»çš„é«˜åº¦çš„æ—¶å€™ï¼Œå¼€å§‹åŠ¨æ€åŠ è½½æ•°æ®
    {
        //åŠ è½½æ•°æ®
        loadGoods();
    }
});

$(function(){

    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        //$("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">æ²¡æœ‰äº†...</td></tr>');
        //$("#notices").hide();
    }
});

/**
 * AjaxæŸ¥è¯¢å•†å“ï¼Œå¹¶ç»„è£…åˆ°é¡µé¢
 * TianYu
 * 2016-2-18 15:34:13
 */
function loadGoods(){
    //åˆ¤æ–­æ˜¯å¦åŠ è½½å®Œ
    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        $("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">æ²¡æœ‰äº†...</td></tr>');
        $("#notices").hide();
    }

    if( !flag ){//åŠ è½½å®Œäº†ï¼Œä¸éœ€è¦å†åŠ è½½
        return;
    }else{
        if( !isLoad ){//å¦‚æœæ­£åœ¨åŠ è½½ä¸­ï¼Œä¸æ‰§è¡Œ
            return;
        }
        isLoad = false;
        var loadindex = layer.load();
        var pageNum = parseInt($("#cur_pageNumber").val()) + 1;
        var data={
            pageNumber:pageNum,
            orderBy:$("#cur_orderBy").val(),
            orderType:$("#cur_orderType").val()
        };
        var loadindex = layer.load();

        $.ajax({
            type: "post",
            url: $("#basePath").val() + "/search/getSearchResult/" + encodeURI(encodeURI($.trim($("#keyword_input").val()).replace(/\//g, 'å€è¾¾å¸æ ').replace(/\./g, 'å€è¾¾å¸ç‚¹å·'))),
            data: data,
            success: function(data) {

                if (data.status == 'success') {

                    if( data.priceHide == 'hide' ){
                        isLoad = true;
                        layer.close(loadindex);
                        $("#cartLogin").trigger("click");
                        return;
                    }else{

                        $("#cur_pageNumber").val(data.pager.pageNumber);
                        $("#cur_pageCount").val(data.pager.pageCount)
                        $("#checkall").prop("checked",false);
                        $("#show").show();
                        $("#shopping_total").parent("div").delay(300).fadeIn();
                        $("#totalResult").text(data.totalResult);
                        var html = '';
                        if(data.totalResult>0) {
                            $.each(data.list, function (goods_index, goods) {
                                html += '<li>';
                                html += '<div class="pro_pf_info">';
                                if (goods.enableBatchPrice == '1') {
                                    html += '<input type="hidden" name="" value="' + goods.batchPrice + '" id="defStartBatchPrice_' + goods.id + '" />';
                                    html += '<input type="hidden" name="goodsNumId" value="' + goods.startBatchNum + '" id="defStartBatchNum_' + goods.id + '" />';
                                } else {
                                    html += '<input type="hidden" name="" value="' + goods.price + '" id="defStartBatchPrice_' + goods.id + '" />';
                                    html += '<input type="hidden" name="goodsNumId" value="' + goods.startNum + '" id="defStartBatchNum_' + goods.id + '" />';
                                }

                                html += '<input type="hidden" name="goodsPackageModulus" value="' + (goods.packageModulus == 0 ? 1 : goods.packageModulus) + '" id="defPackageModulus_' + goods.id + '" />';
                                html += '<input type="hidden" name="goodsLimitNum" value="' + goods.limitNum + '" id="defLimitNum_' + goods.id + '" />';


                                html += '<table border="0" cellspacing="0" cellpadding="0">';
                                html += '<tr height="50" class="pro_pf_tr">';
                                html += '<td width="76">&nbsp;</td>';
                                html += '<td width="400" class="textoverflow">';
                                html += '<a href="' + $("#basePath").val() + '/item/' + goods.id + '.html" target="_blank" title="' + goods.name + '">';
                                html += goods.name;
                                html += '</a>';
                                html += '</td>';

                                html += '<td width="200" style="text-align:center">å•†å“è§„æ ¼</td>';
                                html += '<td width="115" style="text-align:center">ä¼šå‘˜ä»·æ ¼</td>';
                                html += '<td width="140" style="text-align:center">å½“å‰ä»·æ ¼</td>';
                                html += '<td width="155" style="text-align:center">æ•°    é‡</td>';
                                html += '<td width="114" style="text-align:center">åº“    å­˜</td>';

                                html += '</tr>';

                                html += '<tr class="pro_pf_tr2">';
                                html += '<td width="76" class="pro_checkbox">';
                                html += '<input type="checkbox" id="checkbox_' + goods.id + '" value="' + goods.id + '" ';
                                if (goods.stock <= 0) {
                                    html += ' disabled="true" ';
                                } else {
                                    html += ' name="cartId" shopid="' + goods.shopId + '" />';
                                }
                                html += '<label for="checkbox-1-1"></label>';
                                html += '</td>';

                                html += '<td width="400"><div class="pro_name">';
                                html += '<p><em>æ‰€å±å•†å®¶ï¼š</em><a href="javascript:void(0);" >' + goods.shopName + '</a></p>';
                                html += '<p class="textoverflow"><em>å•†å“ç®€ç§°ï¼š</em><a href="javascript:void(0);">' + goods.shortName + '</a></p>';
                                html += '<p><em>å•†å“æ¡ç ï¼š</em>' + goods.barcode + '</p>';
                                html += '</div></td>';

                                html += '<td width="180" class="pro_color" >';
                                if (typeof(data.goodsSpList) != "undefined" && data.goodsSpList != null) {
                                    $.each(data.goodsSpList, function (key, value) {
                                        if (goods.id == key) {
                                            $.each(value.goodsSpList, function (sp_index, sp) {
                                                html += '<div class="f-cb" style="width: 180px; height: 32px;"><em>' + sp.name + ':</em>';
                                                html += '<select name="goodsSp_' + goods.id + '" spid="' + sp.id + '" spname="' + sp.name + '">';
                                                $.each(value.goodsSpItemList, function (item_index, item) {
                                                    if (item.specificationId == sp.id) {
                                                        html += '<option value="' + sp.name + ':' + item.name + '" ';
                                                        if (item_index == 0) {
                                                            html += 'selected="selected"';
                                                        }
                                                        html += '>' + item.name + '</option>'
                                                    }
                                                });
                                                html += '</select></div>';
                                            });
                                        }
                                    });
                                }
                                html += '</td>';

                                html += '<td width="115" class="pro_prices">';
                                html += '<input type="hidden" value="' + goods.enableBatchPrice + '" name="name" id="ifBatchPriceId_' + goods.id + '" />';
                                if (goods.enableBatchPrice == '1') {
                                    html += 'ï¿¥' + goods.batchPrice;
                                } else {
                                    html += parseFloat(goods.price).formatMoney(2, "ï¿¥");;
                                }
                                html += '</td>';

                                html += '<td width="140" class="pro_prices2" id="' + goods.id + '_nowPrice">';
                                if (goods.batchPrice != '' && goods.batchPrice != "0.00") {
                                    html += parseFloat(goods.maxBatchPrice).formatMoney(2, "ï¿¥");;
                                } else {
                                    html += parseFloat(goods.price).formatMoney(2, "ï¿¥");
                                }
                                html += '</td>';

                                html += '<td width="155" class="pro_number">';
                                html += '<div style="margin: 0 auto; width: 86px; padding-bottom: 2px;">';
                                if (0 < goods.stock) {
                                    html += '<input type="text" name="textfield" id="textfield" value="-"';
                                    html += '       class="shop_add" readonly="ture" onfocus="this.blur()"';
                                    html += '       onclick="javascript:reduce(\'' + goods.id + '\');">';
                                    html += '<input type="text" name="textfield2" id="nowGoodsNum_' + goods.id + '"';
                                    html += '       class="shop_number" placeholder="1"';
                                    html += '       onblur="change(\'' + goods.id + '\',\'' + goods.price + '\')"';
                                    html += '       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,\'\')}else{this.value=this.value.replace(/\\D/g,\'\')}"';
                                    html += '       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'\')}else{this.value=this.value.replace(/\\D/g,\'\')}"';
                                    html += '       value="';
                                    if (goods.enableBatchPrice == '1') {
                                        html += goods.startBatchNum;
                                    } else {
                                        html += goods.startNum;
                                    }
                                    html += '"';
                                    html += '       onchange="change(\'' + goods.id + '\')" ;>';
                                    html += '<input type="text" name="textfield3" id="textfield3" value="+"';
                                    html += '       class="shop_add" readonly="ture" onfocus="this.blur()"';
                                    html += '       onclick="javascript:add(\'' + goods.id + '\');">';
                                } else {
                                    html += '<input type="text" name="textfield" id="textfield" value="-"';
                                    html += '       class="shop_add" readonly="ture" onfocus="this.blur()">';
                                    html += '<input type="text" name="textfield2" id="nowGoodsNum_' + goods.id + '"';
                                    html ÄKìJåú­ú¤Ü¶²M÷4
ŒmîË8§£ÃP5şBe@Û£ÊY+ğ?Ë&	+ç©8dRi ƒ0W~²µpêÇ§Œ\júßíw¥©ˆ"FE¦EfEæ	KÏ^›ğòaŞÇØF¦óğkÈñoØÃGø4„²œó4Ö1®¼áHs•.è{bg-pvØü
œ{&Lb*ò¦)à€âÍW¶»ê'¼å½„0Ûs¥ÉfPJ†ó…SV~ §²½ÓE¦vÌMµ¶Ú³ı…9)L²˜c·`ç­˜í§^ğŠ—O¬(,J¾¡ô,üPK
    \R–F<vkÖ›   ö   ;   net/sf/ehcache/exceptionhandler/CacheExceptionHandler.class;õo×>#NvvvFîü<×ŠäÔ‚’Ìü<F'Ÿ¼Ôıâ4ıÔŒäÄäŒT}Wmí“•X–¨Ÿ“˜—®ïŸ”•š\‚,7ÁZ3Œ‘+8¿´(9Õ-3'•‘AÊ¤®À#1/%'µH¤—‘ÁÍ²T˜²ˆ2}¬šĞÃÆÈÀÈÀÄ Œ,ŒÌ, +db` PK
    ]R–F÷5Õ0  è  B   net/sf/ehcache/exceptionhandler/CacheExceptionHandlerFactory.class¥‘1OÃ0…ßµi¡ĞÒ¡[Ë€%ÖV]**†ˆ"º;îA\…¤r?‹	‰ÀBØ)LHàáîó“ŞîıãõÀúšè†è…8$´':×vJhGKB0+VLèÆ:çËê>as#“Ì‘~\(™-¥Ñ¾ÿ‚MuI˜Æ9[QŞ
N•T)~T¼±ºÈS™¯26bæñù7½ØÒ¹T¶0OcÂ‘2,ía1Œ×òAŠÊêL\™bÃÆj.Ç£¿%º¨èº¨Œâ¹öó~›ëÔ'w E˜ügAB¯^"“ùX$kV6 á®à_ä3œ¶]'\%W['/ çú;tÚ®á1vœv¶ì"Â#pl¿v|PK
    ]R–F‚ ğu•    H   net/sf/ehcache/exceptionhandler/ExceptionHandlingDynamicCacheProxy.class¥VûsÕş®õXiµNl++v‚(È
 <B;8	(‘€ó¨(¬×kI±¼2»ëÄæıoH¡Ph›´eZ3<“BDÒNŸÂLşŒş0C¾»’ÇZ¦‘îŞ{îÙsÎıÎ9ßİ‹ÿıÇW 6â]øU
ËÙı*Bx@Á¯<¨à!•r]Å0#0ŒÆFAEE{P’
GŒIåÆc°P‰aG`«pàÊaRGåpLÚŸR1G<ªà1@~ïİmùŠ]È8åÑ[dò•BÁ´·(fÑĞ¢)Ğ·L7ãŒfê’ÌÎÚ“Já’Ur·
t¤Sê:(ì«ŒĞĞÒ|É2&Ç‡M{¿>\6=Ï†^>¨Û%¹®ƒn±äìXhÑœ2Ì	·T±Šº5R6íÌÎYÁ=RP²
;¦-}¼dôIõ}vejš!ÆÛÔİÚR`ãâq^å”%ëheŒ‘¦òGô£z¦¬[…ÌŞá#¦án™'±ÍÑ2E™~Ó-VF¶nTîj1	†AÛkæmõ•uÇéÓwî„ò cæô6gĞµyP‰ÜeõšŒ*!CŸthkù¼ÍıE»rLËıo›3göJÕùŞ–{‡¿aÓØô“Yéó{‘MÔÒĞæ‡CxÜÃM`Õâ˜²:t»Àêˆû ËÊLºt|ŸéL–]æAW7Æúõ	¯ºØW^í?® —åıPğ¤‚§ØIê\àE\›S®­î“Q¯M5‚Şå—‡¨QÔå[0ÑÇ‰ÿ{jÜt½@ Ôa³P²rÖˆ9%1­‘ú40&EzŒr½±)Ù@ê`eÒ6Ì]%Ùë~ºî7È 4ü‡4$q­†§ñŒ†gqœM¸ ÌVø¾Àöÿ¿e×)xNÃóx°kX™=Ÿ¢Óğ^Öğ
^ÕğNhÈ£_ ój]¡a®è:@ğìò4Hz<¦;I«â&u+9§œM>Ê¬ÿFÃëxƒI×ğ[¼Ér"àI€†·ğ;oã¿Ç4ü'5œÂ	Òğgü…Åµ°à®k,ÔÜ\ÎõLûbå,pÛÿÔMWÄ2ËqŸg)L·çxªk!Ç°V—Ì*ä+úˆ4hT«mQyeãIêÄÚb™Ç¼iÎr\İ’Œ6œZÄÎá†0|¾GòÜìCÉ?—xÛåÑıñİœj¸~6Ñy×ˆxåXÎ§b•Jı³l°,åK#-¯eèˆ9<Éd§}¨È×“dXÅšÇøÛ½¯z¹]¾<“L›ëqÖŞQ^~ÄH¾—M«à=“KI‹ÛØ6ÁT®‹´u&‡zõ®Hår¾ (j@—`.„c)¶b³ø¢Ô™EÈŸ¤>pp3¿š:!°MX%y„ŸdM’,ùQNŞâx=W»(oâSM	‘^Mg<İ8.A€ãvÑ‡(v`-W+jÚX‡àÍ¤UF‰.¤ë6w{>€dºŠ@Áà¿
Äü'”!:ŠœCô„OÏy
{úı­ön=ZAN½‘Z´+.2’e¶ÈoL¦î*Ôlpz6$—ç¡	dÃ‰ğäDVI„ªhÎF‘hNDªXrK³ŠÈF‘oËFgĞšUÿÖ¶¶„zñ ai%¡$¢ç±,ˆD=_'‚§A€x´ÒÿÄ,‡®eäˆs|†«ãÜ?Iç(y˜¿@Œ_ä‰^F7y#^ENğí×ùş[´ğ?sßÄ!²ò(ŞA‰Ä\!%K&èeqèÆâ»w!ƒ›˜Ñnlff7"B+ëpn%êkp/nÃíD0û±‰²Dh.?6îà[Â›e±ÅËÍHzq€·r7H{@áK?¤à.ÛlWĞÇ	„‚—˜Ûè‚;ìRp·‚{€KŒW½ŠçÒR®ù;´~ÏwÓcqíáixÖ*GÄ“Œ(ı-Bâtºmy+z:NÉE‡\¬|¨§£·cëjVÖÊ¿¢3½ºŠöÛƒËƒ-ÉwAluïñ€˜¹ôïãM¢Sê¼‡ˆ|ô¦;:«HtË’«%n7Ú8şA¼GğŞG3óİŠã‡èÀGl	â'LÁ§ø3Âx† ~Ìd|Îvø‚ŸÅ>|Éó’¶•V6„ì¥ÍkX¼û˜Ù@C¸é=ä1H™lËìç¬‰o7á w^
–!şEüÄ„øíâ{(K	ĞAêÕZë/•´‡RÅªsèø­g¼>¹ÜG›8şÒë­¡PK
    \R–F5ÿ¯ªÑ	  û   :   net/sf/ehcache/statistics/LiveCacheStatisticsWrapper.class˜	|ÕÇÿo²ÉfBB8D*¶!RÑ
ˆa`q$	á²¥ÃffîìÆÄƒC«âMk­U­ ‚rcˆ‚GOj/íiµ—Õ^V{YíEûÿÏÎÎÎÎ{ïóIø|à·3ÿ÷şß÷Ÿÿû¿÷frêôñ 0U ^òÃWàƒ¯–@3|-€òuºúÉ7©áÉ·H^&ù6ÉwH¾[
‹á{$ß'y…äU’üäG$?&ù	ÉOI^#ùÉë$oüœä$¿$ùÉ¯IŞ$ùÉ[$o“ü–äw$¿'ùƒşHa¿S
“áO$ï’ù=’?“ü…ä¯$#ù;Éû$ÿ Î|HòO’‘ü›ä?$ÿ%9Mò?$ŒÄGR@RH2Œ¤ˆÄORLR‚ée?+@ÓÌ” \A¿e~6ÜÏÊŒoY¯‡:šV‚›V·µ7´‡ÚÚCÁ6õá˜–ª7»êµµ5²V«7SjJ7SzÄ¬ë=ZŒmmÅ@s£fhİjJcpáĞ ¡hÂ@Hq§(š­ÇôÔeªk¼¨¦Ìï¬É
ƒñNì]ÖcZK:ºFK¶«k´T†ãÕèP“:İÛÆÂÔZİd0shÁ-Kª‰„–Äø†YİŒ•…Ä`”©¥r®M1¸G®YIáVh–!×[É ‘õÍjÂs¤n
5“±ïø¤ÖZÒŠr©©vkaºiIÓ¸d¹w°RX€¦Ã ĞÔÑ)=3ı¬S”Ô¢q;•öè¼5D"é¤é£…¬xLA¡_·Øó‚­…­šIêV\875“ÃëÔµŞPcİõm©¤ë¦ÒE