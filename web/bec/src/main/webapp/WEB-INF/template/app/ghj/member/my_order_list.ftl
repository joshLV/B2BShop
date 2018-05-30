<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/ghj/head.ftl">
    <link href="${path}/theme/red/ghj_style.css" rel="stylesheet"/>
<style>
    .tools2 {
        margin-top: 13px;
        padding-right: 15px;
        text-align: right;
        font-size: 14px;
        color: #444;
    }
    .tools3 {
        margin-top: 13px;
        padding-right: 15px;
        text-align: right;
        font-size: 14px;
        color: #444;
    }

    /*æ–°åŠ æ ·å¼  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
    21px;margin-top:5px;}
    @-webkit-keyframes fadeInOut {
        0% {
            opacity:1;
        }
        25% {
            opacity:0;
        }
        50% {
            opacity: 0;
        }
        75% {
            opacity:1;
        }
    }
    .arrow {
        -webkit-animation-name: fadeInOut;
        -webkit-animation-timing-function: ease-in-out;
        -webkit-animation-iteration-count: infinite;
        -webkit-animation-duration: 1.5s;
        -webkit-animation-direction: alternate;
    }
</style>

</head>
<body>
<header>
<div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">è¿”å›</a></div>
<div class="mtit">æˆ‘çš„è®¢å•</div>
<div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">ç”¨æˆ·</a></div>
</header>


<div class="mui-content" id="content" style="padding-bottom:50px; margin-top: 48px;">
    <div class="myorder" style="margin-top: 16px;">
<#--æ–°åšè®¢å•åˆ—è¡¨-->


    <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
        <ul class="order-filter" style="width:100%;overflow: auto;height: 40px;" >
            <li id="arrowleft" class="arrow" style="width: 20px;position:fixed;left: 0;display: none;"><span class="mui-icon mui-icon-arrowleft" style="margin-top: 9px;font-size: 20px;"></span></li>
            <li id="all"><a name="all" class="mui-control-item <#if ! orderStates?exists>current</#if>" href="javascript:;">å…¨éƒ¨</a></li>
            <li id="wait_buyer_pay"><a name="wait_buyer_pay" class="mui-control-item <#if orderStates=="wait_buyer_pay">current</#if>" href="javascript:;">å¾…ä»˜æ¬¾<em>(${orderFuKuanCount})</em></a></li>
            <li id="wait_seller_send_goods"><a name="wait_seller_send_goods" class="mui-control-item <#if orderStates=="wait_seller_send_goods">current</#if>" href="javascript:;">å¾…å‘è´§<em>(${orderFaHuoCount})</em></a></li>
            <li id="wait_buyer_confirm_goods"><a name="wait_buyer_confirm_goods" class="mui-control-item <#if orderStates=="wait_buyer_confirm_goods">current</#if>" href="javascript:;">å¾…æ”¶è´§<em>(${orderConfirmCount})</em></a></li>
            <li id="wait_buyer_validate_goods"><a name="wait_buyer_validate_goods" class="mui-control-item <#if orderStates=="wait_buyer_validate_goods">current</#if>" href="javascript:;">å¾…éªŒè´§<em>(${orderValidateCount})</em></a></li>

            <li id="arrowright" class="arrow" style="width: 20px;position:fixed;right: 0;display: none;"><span class="mui-icon mui-icon-arrowright" style="margin-top: 9px;font-size: 20px;"></span></li>
        </ul>
        <div id="order01" class="order_list01">

        <#list orderList as order>
        <dl title="${order.orderStatus}">
            <div class="bh">
                <div style="float:left;">
                    <label><#if order.orderType == 1>ä¼—ç­¹è®¢å•:<#else>æ™®é€šè®¢å•:</#if></label>
                    <a href="${base}/order/view/${order.id}?whichclient=whichapp">${order.orderSn}</a></div>
                <div style="float:right; padding-right:15px; color:#999;">
                    <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                        <strong style="font-weight: normal;">${orderStatusMapping['${order.orderStatus}']}</strong>
                    <#else>
                        ${orderStatusMapping['${order.orderStatus}']}
                    </#if>
                </div>

            </div>
            <dt>
            <div class="order-state"><span>æ”¶è´§äººï¼š${order.shipName}</span></div>
            <div class="order-time"> ${order.createDate?string("yyyy-MM-dd")}&nbsp;${order.createDate?string("HH:mm:ss")}</div>
            </dt>
            <dd>
                <#assign goodsCount = 0>
                <#list orderItemList as orderitem>
                    <#if order.orderSn == orderitem.orderSn>
                    <#assign goodsCount = goodsCount + orderitem.quantity>
                        <div class="order-goods">
                            <div class="face"><a href="${base}/order/view/${order.id}?whichclient=whichapp"><img src="${orderitem.pic}@150w_150h.png"></a></div>
                            <div class="info"> <a href="${base}/order/view/${order.id}?whichclient=whichapp">${orderitem.goodsName}</a>
                                <h4>${orderitem.goodsPrice?string(priceCurrencyFormat)}</h4>
                                <p>x${orderitem.quantity}</p>
                            </div>
                        </div>
                    </#if>
                </#list>
                <div class="tools2"><span>æ€»è®¡ï¼š</span><font style="color: #E4393C;">${order.totalAmount?string(priceCurrencyFormat)}</font>&nbsp;&nbsp;<span style="color: #888;">(è¿è´¹ï¼š<font style="color: #E4393C;">${order.deliveryFee?string( priceCurrencyFormat )}</font>)</span>&nbsp;&nbsp;å…±<font style="color: #E4393C; padding: 0 2px;">${goodsCount}</font>ä»¶</div>
                <#if order.orderType == 1>
                    <div class="tools2"><span>å®šé‡‘ï¼š<font style="color: #E4393C;">${order.depositMoney?string( priceCurrencyFormat )}</font></div>
                </#if>
                <div class="tools">
                    <#if '${order.isRefund }'== 'N'>
                        <#if '${order.orderStatus}' == 'order_item_exception'><!--æ™®é€šè®¢å•ç­‰å¾…æ”¯ä»˜--->
                            <span style="color:#fc9836;">è®¢å•é¡¹å¼‚å¸¸ï¼Œè¯·é‡æ–°è´­ä¹°</span>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay'>
                            <#if order.orderType == 1><!--ä¼—ç­¹è®¢å•-->
                                    <#if '${order.payType}'== 'offlinepay'>
                                        <!--çº¿ä¸‹æ”¯ä»˜-->
                                        <a href="javascript:void(0)" onclick="offlinePayDD('${order.orderSn}','${order.id}')" class="JS_order_btn ">ä¸Šä¼ è®¢å•æ”¯ä»˜å‡­è¯</a>
                                    <#else>
                                        <!--çº¿ä¸Šæ”¯ä»˜-->
                                        <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">ä»˜&nbsp;æ¬¾</a>
                                    </#if>
                            <#else><!--æ™®é€šè®¢å•-->
                                <#if '${order.payType}'== 'offlinepay'>
                                    <!--çº¿ä¸‹æ”¯ä»˜-->
                                    <a href="${base}/payment/merge/offlinePay?orderSns=${order.orderSn}&whichclient=whichapp"  class="JS_order_btn ">ä¸Šä¼ è®¢å•æ”¯ä»˜å‡­è¯</a>
                                <#else>
                                    <!--çº¿ä¸Šæ”¯ä»˜-->
                                    <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">ä»˜&nbsp;æ¬¾</a>
                                </#if>
                            </#if>

                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay_deposit'><!--ä¼—ç­¹è®¢å•ç­‰å¾…æ”¯ä»˜å®šé‡‘--->
                            <#if '${order.payType}'== 'offlinepay'>
                                <!--çº¿ä¸‹æ”¯ä»˜-->
                                <a href="${base}/payment/merge/offlinePay?voucherType=deposit&orderSns=${order.orderSn}&whichclient=whichapp"  class="JS_order_btn ">ä¸Šä¼ å®šé‡‘æ”¯ä»˜å‡­è¯</a>
                            <#else>
			                    <!--çº¿ä¸Šæ”¯ä»˜-->
                                <a href="javascript:void(0)" onclick="payDJ('${order.orderSn}', '${order.depositMoney}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">æ”¯ä»˜å®šé‡‘</a>
			                </#if>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                            <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')" class="JS_order_btn ">ç¡®è®¤åˆ°è´§</a>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_validate_goods'>
                            <a href="javascript:void(0)" onclick="validateGoods('${order.id}','${order.handleResultStatu}')" class="JS_order_btn ">ç¡®è®¤éªŒè´§</a>

                            <#if '${order.orderType}'!= '1'>
				<#if '${order.handleResultStatu}' == '0'>
				   <a href="javascript:void(0)" onclick="complainGoods('${order.orderSn}')" class="JS_order_btn " id="complainGoods">ç”³è¯‰</a>
				</#if>
			    </#if>
                            <#if '${order.handleResultStatu}' != '0'> <a href="javascript:void(0)" onclick="viewComplain('${order.orderSn}')" class="JS_order_btn ">æŸ¥çœ‹ç”³è¯‰</a></#if>

                        <#elseif '${order.orderStatus}' == 'trade_finished'>
                            <#if '${order.isReview}' == '0'>
				<#if '${order.orderType}'!= '1'>
                                <a href="javascript:void(0)" onclick="reviewOrder('${order.orderSn}', '${order.id}')" class="JS_order_btn ">è¯„&nbsp;ä»·</a>
				</#if>
                            <#else >
                                <label>å·²è¯„ä»·</label>
                            </#if>
                        <#elseif '${order.orderStatus}' == 'unconfirm'>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">å–æ¶ˆè®¢å•</a>
                            </#if>
                            <#--a href="${base}/order/popupcancel/${order.id}&whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;è®¢å•å–æ¶ˆç”³è¯·" class="JS_order_btn ">å–æ¶ˆè®¢å•</a-->
                        </#if>

                        <a href="javascript:void(0)" onclick="viewOrderDetail('${order.id}')" class="JS_order_btn ">æŸ¥&nbsp;çœ‹</a>
                        <#if (order.paymentMethodName == 'åœ¨çº¿æ”¯ä»˜' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == 'è´§åˆ°ä»˜æ¬¾' && order.orderStatus == 'wait_seller_send_goods')>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">å–æ¶ˆè®¢å•</a>
                            </#if>
                        </#if>
                        <#if '${order.paymentStatus}'== 'paid'>
                            <#--<a href="javascript:void(0)" onclick="checkurl('${order.orderSn}','${order.id}', '${order.orderType}');" class="JS_order_btn ">é€€&nbsp;æ¬¾</a>-->
                        </#if>
                        <#if '${order.paymentStatus}'== 'refunding'>
                            <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');" class="JS_order_btn ">ç¡®è®¤æ”¶æ¬¾</a>
                        </#if>
                        <#--<#if '${order.paymentStatus}'== 'refunded'>
                            <a href="javascript:void(0)" >é€€æ¬¾å®Œæˆ</a>
                        </#if>-->
                        <#--<#if ('${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished') && order.paymentMethodName == 'åœ¨çº¿æ”¯ä»˜'>
                            <a href="javascript:;" onclick="showExpressLog('${order.id}');" class="JS_order_btn ">ç‰©æµä¿¡æ¯</a>
                        </#|ğbJ¥›wI]>ªëYjšÂ[6n˜—håvŒu5L\ê7^Ó6.øîa¨+Aˆ2âô’%QeœÖ·q{ò>§a-Æd—öÁDLçRîqÓêôÓßí†¡(é|F×†Ì[¡ôº=”¬ç¿ å„Ú±+o½C¸¾Ñ&d)o{2s@8ˆWÓä4}]ˆĞ¹>oÜK‘ÑÜäåQŸÕŠö¸îAW÷@9ØqŞšıèñÉ\ŒüK#øp›%T¥
—*ÙŠçıªÇ„½é+¶†E%†}O×š‹Á¯wm‚¾r½<o—1Ês3õÿ<ZĞã§w¯Ç]ÀSÍ{D€Üóıú~Hp¡Àrğj±kÖ´¤”S*9Œ¼ş1¿Ûn‡ÖğiÚüjkètâÑş~Íİš¡q'¶S¼ÏbU£óC3²áhQNWéßeq!ñ+’/9Ñ+°G²¡é*A¿ïãyÖÜÏùëªÒypÔ¢ Y“±54Rÿ>ñu÷á½ßúaUû3W¯ÓãXZØ;Ï¦?:Y÷şñ¯sû7‹Õfø>càjc¹BocïºÏV¶”ØZÈ_~ïHÜ, öPTš|@.|åÉÛóyÔ²Us)úû!;¸Lä¢İ0ãvªu<h^Û}ÔşĞ‰ÿÒ9^EUÊ=“9É¸øQ1rõg¢ÖA$Ï^’j›écñ«{e\ÊË|»úzOÁ‰IÕ[¼Ì…Z&­j“#ÏùHí8HáßÛüNÜÜı‡‹”zş¤69™y©;BmÕxYãh-ÅªZiˆkÄ‚rW×öÅgt±ÓN’èQtı¢„’~1ÇaÛÏà½Ç“´:"\`¦@ø"°¸D¾:¶Ä÷Fí­dŞÀ?‡ç"¸ı ,¸ Y`¾ĞíA4^#Ö0åı ò/—ŞôIÃùG%Mé"Úº,jlû8º¢8.%@ŞãÃ7"æ‚¸ó
q­[.)|EéP œ¿5Ÿë†öi¦MDÄÅş¦`P'è#y|wúQ™»ˆ®Àhk†|9©‡Ë!]D£šäãŞöÏ¬  âèÃå~ÆÔ6ˆä1Òt;Ìó9¡Õ„!t˜ °{X¡-Hc‹& ˜EĞ€Æóù¶‹ÅÓÁó¹/F‚ˆSí”¥iÛ=s¤§$ì¸`Ë²0+P:„xS´aEú±[J–cö;BŸÃóØÆáIF-'µ×LŠ}BÃ­‚Á}aä7N3ˆâwªÀ$³(û<\*.ÜÖ‰ıjÈç’:¶—úRöıÑå“‚µ¿KtHç&Jº“ûİîÆIm¤|ŒÑíÆıD¨ï•O9\/Úœ;Ç16wb$˜¸`s®á¬}póõow¡l+“psÓOhô%Ìï¦¹1jGÁì÷H{…ì”ıc†qrX3MWàd‚bU˜ø’÷º~Ÿš–0ª
ölô‚ +’[á<?âL‚¾êˆ6êĞÌ¥¯/zÆÙœÄ5Xs¡r`=xçìÌ¬ÆWƒÔû™¦ÖUÕúÌ¨’ç/^Ò›
M0' ± _XyŞÓÏdŞtTBiñÄHwÚj×>Ëß‡Ôõe"ğ¶íØ·Ì¥\K¸Ccğè¨jXbÎ-^oG	z±Â¸GÎ^ÆŞv–­ækò­2õdïàô™½PU…˜.ÜEc
“ì?myÒ·ùlizØ#Fñu„ZPz¾Cë¾e@“Ó[ˆ6ü$°§OoÛû*tñ(ŠSqş®¨vR'¾¥¥sDÓŒèhÓ
Ç!mYk£Æ’å»ì¡uJbæmşç­á ¨\´¬Ò‡&¦
âCçßÊÚï?nµ·ê*Ğœ,t.Ø‚_vk³SÁ2Øùr€g·®d|µm<k:¦ÊL¤^Å£2®\üˆÍÖUÖ5ş€Ùnƒ ‘áœØÕ\¥G:a{hÈèt H^P¿/¼Õc?"lp÷è½ô¥lèz”ŒÈò¼^^”9Mœ/–½EĞ¶.\ÔZà(§é«_,¾+sßü"~Ì÷è,M|p„Ü€ô ?ÇàZ”04öõß_ ËDİÖŒ‹pøN¥8ÀèÓ÷sô‚ÜcºÍ[ØÃĞÕÚ#Ã%HC«íOwE¿Ğ%•p¤Rã‹¥ĞGìèdÑ“/0ü¥n&`‡½W"“9ÈÇ1¡\Ñ˜]µ±˜|˜wœY¥‚¶ëBçx¸ì4ŞÇAP²µñ"†láLÎµAÕgñ>ÖX$õB}±w—àÇ­Ó¾A|~Í†ÅÃhKç¾°Îşğr“æÁô¤£Eö÷ÇÉ ÊCT‰«;')Üqh21Mé”`Sd1¿-Ü)|4ØP
n…ÈŒa.
Ò.\0…”c¬¬!½#k’_Rp¢h¦0i6<<^ã¸%#Ôë~¦7ò:¤ßÆÎ¶1l.d¸–pd#ùx Ü7dÌNØÚaù ÷kº¸ÔXh7ü@Z¸;·'ô d$kC—ÚPaÒ‡ïçDÀV£(œ…|xx@fÍSï›üF1(‰ÌcIRõèÁ„D·Òy—bô‰Œæ7˜˜&Jge‡V°«Áú
ìüEk2ÁÏz‘ËÑe3 c¾±Aâûù[BèOAØ¬ ŸH<1‘3g/‰Ğkš8;ä—ÑKÜwyAÌúñ“z+pêO ­5Õ	°/ä­Ğ8ÕU0u$òÀÜ[ªÂƒµ!ÿàµg…kyªçÔö—\ĞÌOğ»Ø-z–Á§$ÌsRÑH† ¤8¡ğ»š~[¬))hìÒVHwèÒ²XI;N¿<OÚ¯,aèùU(¯;5æŞ^Zúˆ2J§ı…=´'‘—,ˆKárô;õJS.›Ÿ6ûª¡Îp‡(L}êzc_å)‹„¹œËÎy¡)ñéšâ³k?’•2ƒ°†ı[¯Îà;¯³Õ/™ÇrÍ9CŞ\ ¯ôP‡ƒğ­¾…C Z†bDŠúø³{AC!w¥Q°PÍ“:Á;ìPf êÀ; ØP1v+Ğ40×¶”–†=ğß>	n
2
ÄFõöÄÀı¾úÌUë1b‡-o,8°:'€İq
ï1§i?šÿ¨ˆì\ª®é.ÃT©åÏp†ÎgË&’ì¢2èèA¦oZl,ô€'D€Ú^‚	Ö^c¥_3(«€êÇWpÜ¿¿iàªVÄ?ğ@š±§ë…ìÚÛ%ërOpÙš
 vø¥Ó“ˆ÷À÷ÈEëş:ı´ÔeÀél>Éb¼¤ìb†¼0ƒLÑ’/ğVP«˜¸c	¶ËBukÿEÄ–dÀ#'½L§»®æ_‰ón:·ë%µÔ>H´z*ŠDŠzçûU¢fÂgjE[R‰ß#PZäT";ğ€è4ÌŠü‰Q¡<÷ù˜ˆÁµYtQÿUÍ+eå€ªéï;¬!Øòõ!¸ÁrŸ‚ÕEÁQDˆSi@Ó‡„U*ö2Z¬®ı¸ã°¿…’¸¡•û—JÊ@9Æ°£¢)*rKVHÕp£•E¡\…	0èãÍ]™x1©\™²j¯	s8®ÒZ0'ÓãQa¼»¢kKX%yæãÚpU™ÁˆW+Psê•ÙújH;Íéï¬r k«—r¢[ˆşÀ_wäi¡3¡ï¼ø¤Å/_¶‚~¾5%ÇâäºlË3Æ¸ºW†‘$ä:Â°wQƒ=ĞC¹‹³öE=€ÆêTÂiÀëËÙÁ‹Ë_È¨.“½Ş‡µB%‚¹;Ç‘&xÀD|ç%K Üƒ!Cû©¢ÇÇï<Ú(ylJ—ô§À¿¾_$&©‰üz¨´h.>²§gYAz²Æ[V5Û´?£í'¶’:ˆ„1öñÔßß Q=¼"!|S0	IV”h•ÉÈ¤=‘d¬…°àÅ9/SP=¤¬ªLµå‹Ñ&ÑMê+d3t=š9Iæ`Û–Xï˜ÇşÉ¡ï¨,£ÃMŞP`ïuL<#ı;Lu}„#Šji3bÑfçôõãÕåÀOÖda×¤×ÛÊ_à;êO1ƒğZ7©K}/FêCú˜‰YHe}äãe;¤Ç“ÑõğNìEh!¿6Üøw$´˜ f0rB¹S#Ïš4H	¯Ô²]a ÂÆ¥Éb/cI•*9b"Q|H£¶ëxz¸:µvp/;r9ùÍ™íGòqAvàaz|_‚cÓ	ÙªR/ûœj'Ça·}ğÃë'”—’H0y> YE/SÛt…-wSƒyÛ ÷å°jÖrlp°ı,9<°ö’xG‰à‡× nk)³·û–Ñ8İ‡6R½­ˆ ¿}û6@„b`Ü{l½’D°‹“á‹q¡¶BR¦ïé=×`Šş®vÚ1eE ¾\äÕ„Şº|Ó¤„äcJ°¢Ñ<ÈI µã„'cd¼¦³ 95’ôÁ¨vĞ‚Jñš¸Rßv’ÙCäÒdI$Iğëélhú -Or×q…….—<¡v6œ±˜iœ»$‘Ü<Tº ösÃŠ©Ú (÷R+ÖzÔËt'(/ˆ’lhEå‰kòy%¤$evğáSı¥cö™^Û€·¨q±¶cÍ·2(‚X«Ù‹ÅÈ5k-vTL×}¦ŠƒËijQÁNÀ¥¨½W¸x*Í~´T ×Öî×¢¤m·7»òàø¾LEE]Œ˜©š#ĞZAÛ¦!BÄì•¹Ó>ã‚¼=5‡,O¼ck:ıIwİ‡’ó37ÀôÂk…á6×ë,ÖDŒI
åv9 ğç±ëqGJÚ¶q}­j¼…s÷D
Ú@ÌC	.„’$Ò%¢á°	Aã­Äİ%¿õ"Á7¨I­[ÕÕm¼ÿ,ƒS~•”be
xw	ö&„ö°xeôpV—;4Ğ¤ÂÒå¯dr ÆJİ·ªXi}	/.\ô,5~êê\JüA§)ÕûaÜË=ñi–û­€‰Ğ½HÕF—=ÛŸãB £…'XØî'ò5yUX§¨âc¡L´}²&”K‡®ĞM|ıj aû„6}º`G
ÏÉîÚúÛ4ÂÃgŸÈe¬C.Á'®²Ä'Ì`ÙÉÍmª]8à(¦¿ˆ}6|•Ñøä—4¼ŒaÛ¦…6&"Ô>Ã0Œº ®»#ºhÈ(WÛ@-¸©€b€¨+›ı6!ßÂ¤9QA½óH¡ëSYÉµ©lEõÅ‘DwPïÁı’Ö‹‚h{Ë!”—"áşÃ'O~ë7;éã%ÌŞğîƒÒa¢ ™q¼AfO”æj¹ñp¿‡x‡IxÔçoÿzí1Ií P
MÇ-i®äÚV»³T¼õ¯µ”B
ãxùz¾Ï"öÏ'I`ùÇÁ{Ûm{^*SÌL¹XğKI›F×öVwÑôI¢JW8!
e×É7ƒ´‚Â}ºµ$Eö {•Ö›eĞ¯££ƒ0µµi *3•ˆªğæeìßĞ³ÿ­Ez…mB:—Ú†°À4Zâå:%¤m‰ñ×Y×67¯0™î¾3E–S×æ$®TĞ#”§e² L>	zt9é/
IPÚ˜œ4Ü–€cÎ(Kš¾ïúiä£ói#ZE>÷Oo4P©´Kº‡Ï¸”dó92´ 5nâ‚Ñ¦•³t;UY<5Z@şã(ù#š> ¤¯Ğ…g>ÉK^ ¨ÀXpBÖ§‰çÖ€Ô?Æ›ˆnNF7@)½SË€{htÄT-wX5
ÈùÜûŸÊ,(œî—òÔ€shÏÒ—êYåÁP—âh÷Tnİµ˜èÁµ&gpÔ|PDb¤h¹1ú-oQ(
‚cu7_—P¶n¨6õı)¨éàv80xƒ%à0uü9“ ›s¸)õÌ¡ËxÉ©éPO–gt†\èÁsni|ªÕämÇÒ)Ê}O¨:eF½YÙRYIo¢“§¿zà4¡¦zn{OW0¤6…O&"1ªàQæĞ‚ûßÛÑ*zÊ+CàB¾Ù°õqˆÌLô…(œD<D±ûn)Q™k>øéu*Uö•F·{	ŸcYzÙ™ğ:C ÊÃ”B1ğ@ûˆh'Ìı¨’’8Ğ½wE˜aÀ¾>XlçDĞŞ™½±“Lü0Pãf¤ÀF(é5s¿²qù“~{­›NöÜ{NBDŠaKş}7¿£EâWûµ±tö›ôËú\ŞønéùlUş9	S#L°¾a&NÁûƒå¿ˆI[ÔVØ)‹±µ=şpß·w*æò ky4;µTƒ=Ñ‡“v§®Àá¾÷ãe8 ©|¨Ï–WFÉ}CîxjÿMêãZ7n}ØË3n¼ÒPêÆ!cbxnáæİÙâ…¤/”DvY·|J—X6¬äÖ×,ŸşJMßxP¶öwŒÌh
™ßPªıU„ÖX/'3BÙŒ¥ßE)ÂÏ
*nLs&®õMà:Ö¸(²Ti3Î¬±aÈCBÓ›{Š -À{³Úe´tª¤0á !jYÉ”à»úğó+,L2ïàJö:ÎêD¹µIè’UıiY(Ëx ³ÅRõeN¿=•=ãA²ä/4$ğØxJ‘¥5MÜÏSA'~óEÇrzÀ‚ÿÓõMdë¡1WV±„›óş©tC€áX£³Nµ©'qGå£ñ'š#aMK7ƒ$„t„&²&D¨H ¼½Ñ,ÀÛc˜ĞÚåòĞüø3Ó©³õób“º.pÒ”ô=@ñÿ¡ì¯Ãâº¶qpp®Á—`Áİ=¸·àî.ƒ÷$<hîîîÜİİg`€%Ïûü¾÷ÚışØİºæêîšê.9uîsª»«ëN¢®ş
ò	Œ]SÊKÎÒ¾)Mp&VL"wÂX¬ö<Ät4¯6`üsú­ö©SúO
|-F€qel?Ú>8•t¤º0ÌüÖON9'+–u…İ!§Â=¹<º„½‡ì·ó£–ÊQmâzáQÃó¸9°ô
/}õ·7ß
ÁšdßE\°½(“"nŒ2 /p]Ø»"OúSøyIŒ3bRñ•)À"±‡¯1¾+‡¡g§a§È6´áeŸç#)ƒÙ€ÃîUğë‡½Ù¿-¿°åÄc…&~7MßqºE‹Æw³\;lœ±˜/¿ºT2¡f°ßşº¸ı2#ÛKríd?ˆiÂ¶ağk¦å„‚ó ò$2û?rö9!ˆ'Ş_Û«$o(qqñ.˜À<ô<ºOYJXÍ_ </9dØEÈWÍØ´üò‚"’:?Hb¿Œ‘%ëÌ‹í§ë¤zÆı{œÏ´i’Û^¨:Œˆ=¾hğİ´ÚïÜ7FnÚŸµá%
4öçÍ€(ƒL³t	ç7ñ]©„ğŒêXˆu3Bé˜/Öµi…}8÷EqĞİ°åº¨„*šu}&hpSı
´q)Ú÷x Q'o2	L]Y3{òãi.VmØÔêœ¤ÏcƒQ%(vñ IşRşßR°Â"i*ÌÆ"ŞÃ]­äÔGx#°Kˆöû‰ÈO¡dİW|iå?+V™G¶¿6}YLò’æØ½Ú·Tñe¨ìŒâ»Ú™ıR¹éÉƒŒOÚ!Û°U‚_QÙ‡ª|@¤K‰õF¹	$¯“¬å”É$£ŒÀÄÉGrQzÖØÎ¿W?³F©wÏì+<’Œ‡ÑşäKÚ”dí 3/(¿§²çèµ&|µùKjKrŒT2!ßé¼Øv%_â-Ÿ²}”5Ì&ì¯,Aäe†(ºÄ2¬H((´`ì¹~‰úC2ü¶BÇï¿íƒ~:8ı_ÃHhxş‘?ä;§ôYÙü–Äî!,šüN~:¶6—r%(e¢8›H!L«zq•$ÄàÌá`ú}R\œ*‰[9Ø|L¿KHã“ü.Jíœá“¹el}üo…¿dëçğ+Á©¹½ñdúœFÑÒQ’ÙXS AŸÄÍ]5ÇœïcÖ	aëÏÏ€£‡è;ub±7§Ç¡[HU2‹-tâN¡ÆÛ;7åC°Ô1ŸL´Qyzy(§?cQ$(0XadzG²§\’˜5PÂhì6İã/›ƒîÄaÎá7b>N~ô:ÆƒœcßŒï¢|0+4>Õ·‚jün¬=sÁ»!ˆ·AõüC¤.£XlêğPğş&¤Ÿ¿ˆâ^¹”TİF›±\
©Ux¡w¦úÌ#ò8Á(Î‘±Œ¥üÒg	v]àİ.Û¡W9 ªõ{Ea†©?›ûwİ#÷m÷áKÓïÒ+ûÄ&Ìx-üÅÿaV¬ÏÁ¶[ìØ&@¥ÌàD]E nê{"^Šb÷P•`\íAØäÁ7ÆA¨jænˆC(¶{X,Ñ%Ëx¾:¹¨{€Vw.ÌŞÏ}şH/±Øæ#Óğ¹étIF#ş'‘YÖOà½4òÖ„÷c…§®İüDŒIş E?y¸ ş˜,Ä+u\ş½Ëüª[¼¼‹!lé¸áYgeæ5¶{î‚pˆLâ¢³J»Yåõâè“àÃõfxrœ©E,ãyE–s–®EdHÍ6¶9Ä§ˆs@ÖÅ¶å—‚ş­W÷”¦v<áĞVÏÁPGÄYàñäÀOáG¡àÈ.ú¾,_N™GQ3Â°¶Åtw (ÿK$Óysƒ
¦²«)Çş²tz…Í²Ë{eÈ›¡ƒf™upØ©¨³ÀzöS	÷¤šÎ¶CõrFñõ'õ¶ØÌäàµÛLa¥:/^üõ’Ñ‹½¶³¦ç¿9Ka4S=\ùˆQ¦ş	â€ü5ù%|Êó[Š·„™ò°Q¯½ïòj2&©>
½¦{eıb„øêŒ}Zï³2|²5‰õ§sV4Rÿ 0?q6|QçHâ÷’æ·Şy.<ëæ®xŠ{šœ¹¿ÑxAŞ·™£w°JPy:\{ÖºWyç¢<å²°z3ÌîªôÂ Êf»²¸xš€°~Íºû"ŠTáW7áj Â¶‘\™¼i:Ïª`ÅÜŞIJğdÉÙX»ø3! nš•z¶â- Ã£R1)'æ,ºü8‘u!zµw° ü »ß5‰ËïˆğÖTÆ=”ë@ÃÓÛa’*¸OšL…şäÊÖŞ½6ßx7áCf
¿Múw–Ê>f>úÁAó4â
5»>~».ñ–Ùp±Œ«\r`-ô§#Gº·®’uıº›Ñìø†ÙwD’0áã4£Us+P‡)ıöVNá6š]‚>ÿ?‘oêÿÌÖÿÆşßOüPø¿1X-ÆÿáWıŸKDO×|ê*Ì HÎhÖ‰4´?#8´Ğ¥}£qK‰Eç¢'N”°°²ş­i>ôÃÂZİRZ-,ùW3×¦c@v}àÂãË•ˆ_{éNfíDx£ş^À¯óâf}2Àøæ®ıâ@ñrÌ¿İG…Ë3§ÀÖ³–“Š3ã×Gm?>çIá‡:»Šæ"ağf¨ƒŒóÍ8o£1t›ĞA¹_ãqşş¾±³]‰4àvúml?s¨õxÁ¾Uµ²ê|}¾X	âGZ0ô2\ñ9ÈZ9kÜX'Ç€¾•a§mèñ¹õõåi%v³±óÙ·‘_–ÔEjÅ±õlÙ½ç½UæôıªÛ$bdÌÊò	ør“ÓøV£‡®ÌPÑ—«„3îJ¥§—‡Îrèè«¶q€ÇS/ğeÊ>ğq&§¥éş"ğµu<Šï ÓmÙ2Ãa¾ÿâ($çå¶Ø!ÕĞÓÆù¨0uâòz¬İiûï•"ÉG,ÿ`pë&çÕ_ßgï{iw†šÿÉ†õ$è¾vSè-çÖ³ı—A²•ÌèĞmş™ğI'CyÑ,AxYÁøñ/b¶ÏyuË¾Éô\u¬‡qÃ`mŞMn˜UW¶çMv›û¬õÅtëw~¼í¿)#W{lÍí7Yö3(î5Äv\|w³VOĞ~7¢]ˆÃ5£¬+Ê¢Ï·÷Î›“/n~œÙÓÂ«<ÔM—=hK ì/nÄXbÇqĞ CËfÛÍ„[»»¬Şšs/zmÀË¿Y+oX
î"şhÒõêÆgx[›ó\ö|“ójŸ¿éÑZõ°æeŒÆ·¦qvø|Úy«×~P—„‹³@lK¿wŞz1a(~s¨ß	wò·üë!Wå<ÂX\w·`Ü9ïy÷obÌë‘û(a'¸?^¼vZÀAæpãyâoë´Î§Fo»µÊ *ùnæsWûÃº]„ëlIVË‚ñË5!}Û1gîpûİ¼ş
ÃªÇ‚¡§à’øá|ZJûşƒ^©Ëvv3g©Í'dĞ²¬ûY&XhxµëáƒŸ¹öé´ğ“ığÓeÇC{¥ ™ò	î›5xdyí£¹©6=Ä_pNY½Şº’yÕÁêZey,Ó‹B†ÿ–O‚	Õ1q+ç@eŒI¤CëzEhC·'•*ÏGù˜//µ¿®ésSô›';%I?lœß]…ÅÅŒËf”ü¡/‚ i¯R‘åË¶kçŞAº|s­æê.U½’&IK‹Ü·4º»ıwÎå"Ì õG¨>©{r(+…{ONåûâó=/¬¿ëHR	¶İµ7ù#E/“D·jÍ'a¸ÊÖ$uI“ÃÙgQ@›Á}“L‘	ºZ‘§âTbÎê~}>]}LşbòÅõ!"«Š£óaò"´E”µª;ò¡Ê|síG*Ì§ç”~Ì³R¬f®½Ÿ›	)ó*îæd/g7ÙmT™T2±¤Àù—1+‘Ú€çcà]¶Á"aiyóéıç¤TØã]b~½ŠVq$¤½Şp_”Øa«Ø±“.Ç¨~?²ïg4úØ-üh‹ ¢õÔÚ“å¿ï{0Ò¯qwc‚ré’H¬ê^&¯jYßÛ¼BãÈ¿˜V¶ßÛê;µ{”3îf>V,@IØ+®f/N¿PTı¥I‹Xâ?&;n­è÷ô±-Ô(R‰<«Î½ç-mÂŸ‘¡—¢ß[ÏYWk˜„<7¼ú£]ZT}/»àHºZ×ï*Î¿MPFş×wnuğônÉjTâ]«SøÆæİ¶ü]Ûhéš=U»óqn‹ó|ŸåFÏ®¼~ù&Ğû–…öŠ§§`íûœ€÷xctKuòñ¢‚ï=Òüøvº]Å’–qÀçı’/øŸUéHsÃ]†¢o–ÕNØ^€ZWöR×³¯¿×5¶í±kœˆtŞ/ÛéÛ5²z¿>m\Ü°ñ²vEˆÜR&4yĞwè˜{ş•§óï]Uº’ŠjOéı7%ç7ÏÚ´äƒ7iëPNöáÄ€ĞĞ]Ío®Ôè³´z›B°,×‘ÃŠCãÙ<2$»ƒDªZ0©¥ï MŸ¥Ì»dâyV¿Àsh·=–ñnq;æÍŸÈo§™Å3ê6l ˆ;½ÚvÈ²„Û®²&Œ®“S5·P¤N‡ïœŞl¢ À­XÖ¤øé¢SB-™å}dMÉ´oãWV);n<Ÿ{Õ6ÑÚŸ:gyşÉ#É4÷Ñ‹LÇ=÷vT•×ııtÖ~à„ÿ¸¯DÂ²CıÌ¡"âÔ$êÓ±~Kçjâ´?{ôÍTa½İçä>Ñüöƒ´ˆ#”ŸñfRí·ù~¥YÚÿÈò~‡x3/›ª\yö´S©2U9’TæÌw%î÷F„L"ÏG*$µ3W"üV©B‹j¡Hò+o‰S¢]Fâ«cÈˆvC(¦HÚ¤6uA/O$Ñû#FÇ]¹S’ÒÂÇŠš‘äœL¯\9QDƒÜ¢<çI”9;VÊ$5è×–œÿ˜tCÿ9
–€Óà«÷£Îğß ~·ù@–¢8ûª¡EFW=à’-ŞĞ|“ù'Ù÷ÆñB×r'÷	\ÃãÕ4$ú5»HÒ¨çoVñ¬nFùdÿöM`IW0®/&Îİ µÜ#^œ,¢5s¼ov8İ÷Ev¾BzŠ–q‹ÜÂ215­ÏòÓºÜNÓı›+Jæ›^:G"3†‘Õ\œs¢ğw-ºo^Ù ÁŒûÓÍK)iè›uUOiOvÆOz»_ı¢Øäi•¾¹<ğ‹­ÕK«AiÎæ7ã¼ôp5NŠ9vMİhõyH»|v•¤ƒ2K´U†.ö¿x/bt‡¢ÿM)…µ—jô]×Ğ{şû.{4&$øØK²nBîês s§	9ıÛFŸã_³p$	ı(@ò8áÕ¡ÑœZùê7”qêş®
A€Ø²·W;O‡˜œ°ÖØÂ¾õ¹	\¨æöü=_â-ëéJv
y‰"íhØMVØ—ÑQœã½n†4Eè±‹C©î³®¯}®Û½-ÖñÆôW19¤~Í3‹beÌ½CcmÊ}ú,bE¢ö¤›á7äÅÉ-ê¤óê®dµK’HøÁK7ÿÑpUõ¦$`¸8Øt¸ıæâËÓäœÅ—K*?Ê˜¨ÜŞ6'UÄér×ùçVxô´,MJÿ>ÇÙÙ%¸RT¢§ÿK˜s™¾ÊşßÅ’unà›:È‘ıb_0póİ–I¡²±åâb‰†ï0ˆoÒå¾F[‹şª^u•'ˆeb®›’0ü“]xj,E~ -
Ÿ»$p~%
RFÿ¬‚MŒ¤Œš>ÏÇUdªh2Í’Q¿½+QqØxZà²7ìĞ—£Íğ±´]öDæ)³Ù¨œœócày¥S¡wÃä‚üfóÉiù—•è˜¤d4¯vëë­9ğÜP‘‡g,Ês}tü¯úã¬H£æšæ¦‡McXŠU¿¼ONŒÌ¹£×©t9óe
óç^şàZI§Jíeìı<¬ª-$7TcH$ì³«ß)DV3T¯€ HgKµu“â‘¢ökŠKjİ–½ÏåµCôµPˆD Y©¡CÀößB3¶~SÁX9Êãˆ,÷âuÀ¡dÒ©°9¤Æ…Ş>$.Ö}İçà3øoœD\EYhùÒ¸»ƒvÌTå×¯¢ÕLÛ0*çĞP{îÅy©Ü\+«ÓÈÉ¤T¦2ÕpÑ¦‡ëQ6ã°o°“;6ôèğÍŠx) ®†[®=`–û´4$¾~¦Ñ{v˜¬ğZVs1«>´ôJÕ N?oâß t	=àX€æÃt¹¤Éd”c•í³ü+‚üƒ§5$N‚}x~¸ºÖp5¸êí»îÔù¼üÏ6thxÊ##yJ²mÇu	Ÿ*Ï0ê›…FZ>ä?°{m.%|•Uœzg“>f§ÓÓß©£AÓÈßŠ”ñÀëÃø2¬€³Ï\d—!Ê¡gì6ôá(PPquS«x&G!~s\¬…D£˜ï®ßš‚¶HÀ…#+wCÅ
ìÆ‘.ä>#EËDĞ®ú g<7n6dÙ)!UÀt©në”y”Ï.7ç5µ¾Ò)‚‹ÓÚ­âºOºX‡;¿ÍöÑ´ŞæÛØº*S/A2Z6ıJÍ>WÃ³k`hÜw8Î0Xgóf;ËT¤Ïäáş5RV(„<qúUñ±cÍõÈ“i”_M*Ÿ8Õ„g¥ü|U­ÚÕâU3Á5öÉì%vñãştŸù„ıŸ]LW
oÓ©+›¯1 ¿š/È<VŠr·=_vdE®“®kBO[şdİA¹å¸ÆrÜ9B
ç¶Èæ€*…‡[şÕ˜+”Ş¤×£ƒM! åO‹ª¹5±ı*0n{J(¸×qH6Ó²´‹ T¥ÌõL2¨'^N—J)Õ¯ê1N46aÙµŞ®Êœz *»K®ô+=ˆeb†Ñ™Ä…'V®^ø¾ĞEüA3`KfÙ5ÿçG¢¹ÜT^.¸Å®€ªp£+æ9³Å`ô7Ë=Ù+5¨8İh„ÿgÖk¿$áívß)âòÿ#Tp$´IĞò¹Ò²„;…Z8ÄW;ö{B×İÍ¤h'7‘J¥Æ®m–¦Y4Ğ4Eç<›×”t-xUäaÕ­´·ß%cÔ5j’?x(Ûl^>.˜Û¤+FƒH!ÚğÉ?SŒJuVÓŒ¹Ş_^;)¯D5sñ=B:¢hÂ{P=óR?ëOXy‰QC
ye×2U(éÌ>æ_Lx´ŠqVb[Fè¿¶õ©ITåì4_p46ğƒM`T?2ªâì‹Eó"üÜ—1Ã¾ü™\;{—Şd®§/#¡Æ1l&CÌïû›
&ïJşz ÂÛùïà0í¥-”ÆçZãR¢c@ùğ³ÚY¾„øo0¢•ºøn6ªÃå‘Zprß/:İ+dÔ÷ã¦]F•û$j¹&ñ¥j¦'¨|v=GÈ‚|g&¤\"»n1Ñ?¶Â},¢CÄjÙÇ‘îlÖÑşLYô;¢©³‡/J(Ü“»Û^x7ÏºîH¤P»_06Mx—Qf÷lÔè¾†çs·'ê! §À\–ÍT=ˆ5	ÕÕEœy8KÓ<¹ˆ¨û×\ \ËõEpŠdt¦É4Ô/?ğ²#’³KFp/Ú’§„·èÏ R})Ú7İt•ÁVSI%ƒ‡â†¿“(BŒ7`*òkzh²ÚÂ“Oº«ò¢5t1 “Å\ÙëhÃ=_mÌĞ5Îš;ù'ß¸	ëöç~z3[=uDÿ^nÌ].ÁH¾¡ÎhæíœtAŠÀ¾dÈD,ô7#®ØyD|u–ëÍ RÉjzŠšSR0‡±ÎüÀvğ¡ïöï—kÉYÏöZğx¦6(Ül‰¶2MÕáx§‹â
Ë
ŒÙ_1ÕË®«bï¿(şĞ÷YJC,KsĞ^/ş]+m`á
¶Â,‰©Û3EÒ0	×¥9íA!Âô`Ÿ^%‰Å;«CBa!Iüò§Ù”ü•&xqx>I%‡~ Ë;Š˜haj¹ëë*š5Å4zúa©´Ÿmâ·¡
ì£¦¤‡øÆ9ı5@ò×h…m^¼%’Põ%°Ëë,òV"Ó¹Õ3V“­yq0­IgØoÑ¸Î÷¶çAPÇˆäsÁZ•Ç3µ½¤’îv±Ÿv7'mÀÏJZ U¸Uz“ªY½3ûî0J¦ËÖŒØãu"M0òIáNá®’õşÏS´U±ø©íT¹L¿a£¥3ÂÁ}yå¯¥©S'×?k´Jy~Áï­ö+K3ì™}ŞdÈÅÃ§øD£€bìV˜(OÁI£.nnYŒ”÷~úİ"¨o„ZºP‹ûCUõ'¬øLŞÔ)—Z²·`ÅCs˜Ë09nq]èSÒ—dÏ.wAÔÑÕ/Z|àiä%”™ªÏù…â–H.Â(Ì'Ô„Èíš’áîÕ~•C_à<Õ’ ù›Â·â;ª®š$z6è­Ì‹¹%°>Ï2¾à'_!Ã*Ül_Ô½G—O.D¨©ÜV¨şíS»S
.Tú#ÛÁ…BQgñù²‰*?¢KâwS±Dc4û	¼ª¯è0¬H±jæŸ\ã{«sa1º§8Ñ-'Z±Hâ)GAİÃHèê=Œ?i’§İöŠ«&h(ßø¤÷ı	ÅßÙÛcVoõ‰ã rL—‰Ä>Qº@0ÔaaıgõN3´¹I¦3í’€şŒÃQ·Â<¿¿˜å 'ëä×GÓ¾Ÿñ¯Ø%¨¦ÚSä1:àõ—7[–5ñ‰ë8áöõ$Féú€°İWPiÕwãç¼1;RQ±İ6Ù†ÿÌS&­¥+nò™úà3Á]‹Ô`«
ZuF¿nÙÆ¦úl„P<Ò—¦¡+‡à_ùŠ•H˜QÓáÍ¬_áü¡”§„ëkã$Õ³?>úwZt®1M’@¦ıw{Xi"ÌÄ~Ä¬A˜\8¸/Wºİ(•kŸ˜'õ×K]ú¸ÊHéË!Æ|kp%¸.¸Á”#”Á…å¬Dpö™†„ï™r|ñğa•©l°ïà`ÇN”{ğ–lq©(Pêa)‹HıLÉM	zWƒHÃû0<ÎlÎ_#8lâ&]3Ã˜<)£­c*g/â«[[íôS?¹K]4øÊŞ9)Ë®¿îçO`9¿ŠwÔÑyœ*­öƒØ1¸…¿TéíœŒXı×Rú½wx	KÁŞaMø²£/IvÇwAD£	Ÿ,İ·)ò£ËPugíÌÕ¯˜×1s°˜Æã€èğóAo€P´kKşÂer É®NoÏµ…¢¢f?h S\•’ÙÚ¨Û$§ç¹Ïšú0`*„ĞX$¤bBYuŒ-ˆn‘m¥“O™—Î¥Ú[ğş÷>k4EÜWË/«¯áS°¯uíPÛÕbÓb
*ÓŞC¾!S«^¶ıUäsT¾ÏÅş-»ù˜±¤Ø±‰'Ÿ“TÇ½\RÚE[ÅF­lÍU:õ‘ÚşkGùpÂşH ¼Öù5#İ¡nõOtısmE÷ ø©úN!Œ"8ã]Rôí—8xÚçPKÜ1:Xó_ÕJ°¥¨àÕ#j4qMq‚ÕÍ—Û"yv¶ş6ªIåfn¸'Y-Z<íè²[BV¢˜Ì,…¿ï¢z¼Ü8†qîÈ®©Ãö5Hğ´3ßÉ%’¬…ö¤VàØ÷ê@Ÿ1C~ABÓT™­f¤"vi¯ÓÛñ·¾¡_æ„k„A_ù†‰~>Œ/òÅOV3ıuÕµg=+![H±3ËofÒ	À
ÑÙö#¶çËsÈ´ätù Lıİø#Ft„!J6ò¡µc¦ØøŒ–©=™iÚƒØÎEu9,“<¹R’‡wßà£¥h66Y2?RéÅÀõ{ënUãmğçæ„>ïüc:åÉHMz·ò`–äï0©¿ğ­VKÄ›$F
âàq‘^ûäv–+ÛêØ×ÇA|†:ôu9Ñ…öî¨!3•|B×£ÅİÄG–ğòÔ^xÕ¤ôFC9Ğ¿‰‡ÈÉTlG"Áîš'»Q¼¼#ÿ”
Êçqèù“ìÍê‘=Şğ$/epSR%êÎSÛ¤e‡<U‰=ãIÄX±QEÕqp˜ğœe†÷fÇ¹è{pKŠ´<òU
Mìl¤ş%¸Éï¡™ôP> n¿ØÈå‘QNÅM-‰º#¢j6GÎ7İ{U9ş§.$IÈ­vÑj)ÿjwhê¯|³
3»Åê#0øsñáÜ‡ëTo©cjnÓœçñfµ±ğËÔ‘ _DÀÂ• 'ú5h.Ck4:eØ¾˜	:ÑG“.Í¯y3¼°Ô1ÄÆ|ò0ò(ÖXXˆsÚnÂfğ?è\ğ‚½Çô¦³è³H)Âf«¶K!Õ‚ğÈpÈà2ê[-|`ô<9Åw,õæÃ~»Lª?²x<óqÌÁŞ‰4*Ò8×t¹X”ÅTj\¾˜¸ÁŸãšÆKšÀ¦Î…TxÄY«†’«İğÁßMÓéwşˆÇ…Œê—.0Ÿh'°ß¬‘K+¨É2@™%,
¥RÂ]‘4aô\£îŒ|ÿ«th.ƒÌÜO¦¯ËïÖ¸úÀoíû÷å	™Ùõ3Åu÷ßò,ã{`ñ‰Púæì’9üKÏe,“	âz@ÏÌªİTá;<üñOQ…µ”‚£³‹)NƒÏOp-]}.rHOÙA„Ö‡pEO‰Õ¸ık†4‰ëzkG–PEpõ3‹¦È’`ñÛ×90¤	×p!‰g¾	·ƒZ¥mØ “´‰dO:$ûØ‰£S"xÕ½éú!vW9‹Yj`DpW*áî3Üà¶¼w!®1Ff\ü 8dy8AŞdš-òu(<bÛ%ƒ£3O„µ3*ÒõçëÔñ¶'ÿ%É¦Ói ,Ú›o³:’Æˆ$²ößÈMíJÖ(‚ş^S>XAíÉçñ9a¦¦sU(%´)~Ê,ÉDÜäj…6s„>[G^j–°]r‚ó,[q´aŸÒØ—-äÓk¹G¦Úi±¥b0³“+,«äXŠÙıìùñè²q!ËrJ
¶(i:Iš9à'oJîÚÆÁıˆY¼7’pØÂ09Cf°ÀÿĞ£êbÅ2Ægš…éî°”)Â–™ùÙf‹ˆâÅRT”¼öÇDOç+×øa]Œ¾ø!3¿²Ë©ŸøBØìt7æ1ÿÇ'NáãáDÃç%½»îìúÅÍí%!^Ã˜<°ú‡ï¼â×|ÑR"IIØn$ü1ÚPéå0…
¥öé_&#!Ï$y#Ikre9=9Œ¸¯».uúÛ¬TèK{¾'“ˆ³Øç"ço£]ñotJêÚ—´Ÿkn)¢ñtQ;5#„Ë¶é4ææÑ“6»şóŞŸ‘µ)ÿ$¦¿CEAYaÕãÉšÿ6åÍàÚ•æ¾•½›Ä“ ÎsB¯±«°y®ä–#­Xh£©ñÑFÎÈú¸`cŸDœíìÔ°]MwmgO«R=Å$ü^åWkr,Y-úPŞ7t¸ÄV¿5a.$T³`Ù×!R¼j—í`²é’»İ‡jZ|ÔÀ8zªïJ‡ÑŸT£4ì%ãXšá%”­¸’ıg•aá¡çŸÈ!VfòÖ
ğ³5ˆ¶QÖ( §¦3øÆÑ³”h±:—ÊşÉ!:¦ké}³¢ºˆCâ±$´¯€ÖZıšB—$b|^nòz	û¦t@¸·TèÚMhÔ+ÿ„À"Ïu;4½<Ú
ÕfaĞ±<¿°y`ÃØÎÇ°RÃã™ÇN¥ğ‚AŒÇ.Ñ‹8­ª‹Æ1åÎÜï¹‡¤Íä»r0˜®êÑÁçºğg`™c“YjDM±<™º¢½`VšNƒÌ#y¼™q¶~Ü¸¦}nC|±0^ŸÎ,0%Èøq!%ù²ßó£±ÆLƒ"û2à£OŠ‰—yjqĞÒnö´~Ùã°CÊf¯05“á)+còŠ¥|,Ô³àÜ}U/W¸ÅŠHQ×ßD‰—èQ‘Ñ„%fó˜Êu?Ò(!°9N×ºÛ;
ñcÀ½«@Ù3l…¶TõÄìCRj:ìßO\Ü®ö(®	ª€ùU±»(°>„o!6	œçIj#l'—§’E£$ÿd‘íÔ
ÍŒ£#¼f§¿†İ…F>Â\‹¸æú"Ê÷¿œøQ:ÀWÑî&,1¤¿ãùáÏÃû®V ±
æË‹‰¿K‚¸ÖwD¯Í‰0Kn°#;v¬K£tò§îÆ¡á¾VÇ»)ío(+NüFv™'DV,—m­Ø/
”é4xªV¦‹RÔ”½ÎswÄ©‘„›Òµòd“"²Á	“¿ùGeËà~Zû“¼”äN‘8tòï“­¤p<Ğş¹Ègyêôß×bÛ³Ìò8Yùã(ádDã°ÉÔQtã‰k)BŒGŒÊnƒÚTß)Äj’üÍ;^R;hb¸a¤?$ …(l‡X/Óª ´˜pÒ`§@ˆÍSœ)8e0zD.c‰5§¦B³‘á‰æ¾‰ÇÅ™7¼‰½³Äë'Ş¦²ô_ç¥Rë.	J7@)‰nÃ4¤àÿtô×IøÅC…ƒ®Ÿ‚Á‘ì99{ÉûœÄØş·=k,¬‡QÅ“‘/ÿÖÒKùŠ%öB/g¸G´3m¹‚Ùoî´9}Î¼ŸúëŞæÕ 1ºçÑâS×ëØhå$]ç¸Îá«³u;{nè\Aá3–idTÔÚh_CŒ%Pcg-Ô–Û:!Æ=ÌŞM~ Š×ú ±¯z¥è‰êá™®ZÀt»)ëqzKïbº†z7+
Çk¦uBÇƒHbBÂ·w_CÕp°·‘Ipx×s!¨WlãÀd)ƒ8„à¯UÒ‚“Xnæ;ó‚ï·U­³âÅ'2Rèx2$AVèC;ğÆ–„¦˜K¡ƒ¶‹Oµ’n*@\Yº`\À{’."ä4šİ¾úkîj‘™V!jĞ²|j–&E¥8˜ÌËW §?Ğô•ÉkyI!à5z_Z0æÚl ^ôF“€*«|
AØ:÷Døæ"Ê¢¢Ô€@$‘¿/*u$î$Œüé€D¹vŸ˜{éTwÕªUytm …ğ°æ–åu……c§v~=XÌ|Xuîç¢»«½á“ÆŸZ–Y1SGÿEŒ $° W±EûÉzÓzkRÑhtå”2ŸÛ—ÆZ?Àr9Í.æÖİÒŸÿ²~TzJ,¾÷(Ïûwñg3L"Ò8©–*Ş*Vnhx;(0àq-W&‰C	ò½vöéùˆ8,Åe½ÂHÎ“n{$©®ãZKBÑYÌ.™ú2Óh´ü$úcC#	\wmÙW:·ÊÆŒÜ„ıä·°è¦úJ’Ò¡İ3ó¦‰ş^,{AZTİ“yØ2Ãª\îœÆgÇó¹Ø:çïDu_‡+TÀÖ'øcÉö÷«A\ş‹˜®Ûàm¥d’·ƒ %ôşFª€®7gÉ›H®ÌF]ŒôvÆŸº›ğô*§¯qÎü'Öú…~ã(äµÆI‹]‹Æ ì} ãM¼yş/TPŠ9‡è‡ DüOôüÜÑÇ8¼\S`—Wôul]w"UÑ²ÈiãøÆà±f}ÃH'z±÷¢‹	ctÃÿşªğ¤Õş÷÷ÿ%YMçÿïä—(øJ²#ğ•õòæ@åã>;ğ¹ÿ`ß‹æòpšÚçÚÌğ@ö|–Ñ_…	úöŠîåvö˜¡zÉ¿)¦ÙK˜šNÛœ>#‚)öÓ7°¨^«s¨oä6ÏV]__ò+G€¿òëƒ
¢¯­¦Êõy[êºV›İ
eâˆqúâHx¤¢p\!×QŸâÉé"0È’Ußd,¶İe¤!ò¦Ğo°Ÿ¦`İšéd4hrM¼;+tXiğ„©¶™¡óy}i—Âšï JZªµRøÁ¬¯œ-ÄXøé{2!›Q$0G$ ùzotô+:	Í‡fß»?§«ÍìË\Q@Ñ.§uS,-Ù6êOŞÌÆæCëí1ŞÜjÊ ñŞÑŞLÚª{ü¨L>	õÂO´*9"ß€¢éĞƒÛ£©|™8óÛÃiœïB>×}c;©lÆ4‘åúŸÒ¹l
tªMñæÍf-ñ¯ çk­yaƒı1„´#ß\ÏW›åR;ã.„ªRYåá·–SÿÓ+TøÉºµ–(‰Ş{#ß™Ìs0ÿÌäw“ÉÃJîJçBµFÁ¡ù(NWTíy¦'Ÿ%P¯ëÏ´Uğä‰
Ï.ñ‚FÀœÈm7œ)ì§•L#OÕè¸–<Ô½¬İÇJ4˜ d«²[`mõ¾İykQ²H€¯nu’-¸ÿ­?°q¸¿ôÀ·’j4¹î¡
Øú·âLæ¤V›ÖtEı“‡ÕD¦ÍYx8+ÂÆòtä‹#æFÍàA[ÙNİê Ì“ùTiÔNóa©Ú,¢@.IÂ¨Ä"®Úd;÷ç;Ë§>¼Ğ³-ªÓ[/aÓ
E&î&P½8ú#Í“HF`|Gî©gû¢Cõecø%&ªïß„™<öuµ’±R³$Ğ{ÚçüØÍBšd]#(YeĞî[ÿVyY
dTšpŒS‘Z&û×
íJr4{Ø?^C4»K5ù	–±€[‹çÇ»u‘j7Û]À-Ù{Às®ğ@ˆ½ãF€¦ÄÀ,bõbN:»w¢šÜ:ùå×&ß§Í_šá$êR>g1‘À—1ïq>Ãla¿î/s8f×4Ü8f9pNƒmIİ ”º4àé~¸;éŒ*£±©
mŸW»Ne:â©-—Ä@x}ùpõíjó·n	˜Ş¹¬µxÄŞ5Ş!5·~ıÁ’¢Q¬Œ0„ÀLÑİHO3¦Mùİ}›ä´š#¯iòº oè«à€,³µÅh$ËÿyƒîFÁ+ïƒ»¹Rm‘{ü€\ÙC®˜@ÔÙxRfp• ~•‰ø¹lQ‚à¤Œ*Å–¹ã´™†2®¾¿ÄKÅó¥PÏr«—£zAäººn³|Ì²rDÒ€N9‡Lgú‚›Kl¢}7|ÕJWBÚ!ö@iöcÓ¦—+ÓÎŸÉøLZéc…¿Lÿ8Ù±Æ´¶\jpÈ°¡,Tç~yIC*ÍkUøı
ô{8çÙ[®·ÛŞ|ì¥àÿÂ¶XPY™ßÙêuÁãğÃ›7‰,Q0¶2"c9Ğ£N»âCütÏÇ“„KŸ¾ñáúá¯•â©-'Ñ'‹ÕÛÉ9úmÕ²* (Øå"ÓçŒ©…ğuhy@Æ”€çÉíÓ‹$y41é·Nuanş l9zc®ÃYÌAS€‰Hó éßÉ÷œ–ğÀÏØ®9f±WÇ|ò9P(ü}?¦[t›³êócÛ È  w'zú­ã—Ó-½ıë$ØÛs"“ŸÑ–ƒç­†Í/®ƒšz;pŒE¾éÒ‘XªºócéøÖä“›&ËŞJ"áØ’*rZïjº¿ØH0|„à"ö¥ÙŒÚU}mˆ¾b>É¬XOqËÅZRyéÃ×–ËŞR|sÂ\êĞö<Ä¢?á§ÎFºØl®“?À€`Ö—N©ÙÏVªF”›İ}ÏYè¨ûgxqÖ°¬u~cé¤sÛ”Âïï&?-¯uÃz-ß{³Éî¾ÉŞÑ'†m¢‡.V<mRĞëœùMOÍ®¬=Æ3è·8,FğJT…4a}<¤Ÿò\®³QJúe>œ¼$ÍaBóf°¾»ış[¨€@§œ)7E¼Ëy³üüûKï×Û¹Qd‚uNFA.nÆ;qKÕ»~–İüö‹õ˜e³”‚<Ço&‹b»…*ß  +¶­Yø	¿–D«\ûf­/
W¢ê-™íŸ°¯’<öƒE?Za2[¸Ğãd–&¸ß´9:†®ù·^ı”½:òE–í‹.©ŸüEÖìæCXF„Ü×g•9ò]LÚö´Ÿ¾É)gw„˜&;ÿÿÕª «ŒÿAùg"Ñ
Í÷«|`Ûv?cºËÎ 
à¬ÊZr¼å„“ 4kà¸fÃu…D6›Û×­ÕÙh°º© ×ÄAæq'u£|Çóå'©ªò¸«¦Vx!>Ò	~‰”×–Ó‡H1dêEŠï=©“x£²êäOgŠ1+‹Ş¯Œ¦±ç'm%QCâß+tøCVáßû²”æŸ-×ã^î—µİCü[<Ï¢Ä/.2^0lFööØrEï9ïƒ08ŒãYa8¬b3¹~.ı1ê	C‰D#$ Ã^ˆúxı	ÌZcÏã¢¾[„‰ò‘Ò†YI¡Ç¼*{¿#Ú/a>Ñ¶¬=MDRg3ƒø:ˆéi¡ìÁbĞ¤Z¤’ãhş]4”½CwF:}·4…yšÙïÁ÷$‘…TÓ/É%	ÑoÉC^ûîc„NC®ş<£øß¥°³ƒÜÓª)oI–LıÀF·yNç¦	é¢ºqyªèéó”p,ó~ƒ\Ï/víc”"ß R¯ è/¸EìB‡RÀ}H‡ìnø@Ì>9PtºTË‰é™²›
=bõ.³µğáîĞ5€±fE¤¥Oİ»¨âE~‰ÊøŞR‚°Œ!™V2ËØ/h·i÷§¥Q`Ïë¯ünû‚ÙİPj¸FçÈì´§›ıñ˜r½×hGß3&îÆt·?_¦	µ½ø”s­«÷³Y[rµ®¬ }Äîi<W†ò)tÜ(áˆû«,›êmƒQh}ò$½‡Lô ²H¸EL—§Ë‡yPú£”~Ÿ†ı{º…2İş]Ş€"@Ï0Ñ€d|ßêvBäw<Ÿ+$OÿÅ÷]w'IIõÒæÃõ¡¥ù·9ü”Å¹d¢O5aÀíY’—”´L¬•(\!¸5*rõÌk8’bt HæXm@6>|£Š_ñÍÑ•cS|u*¬ôŸ(¡…æèÃWhc¸E‰î=ñğ DˆZ|ê‚'rÅ®²Ná¼šEû•¡T>„¢ª—¼bI˜>$œF¨Ş»ÍPAÏSëgjL0Âù ı?gŒót¤äŒ‘Lnù s]²Ì¦È²ó,qLBàoÊˆIZÁ$æŠ<`Ç<dqy8ä5Ô=í M>4V˜&¬¢O°QPÃ£Mÿ²¶©¤>ª\b(ÔCx‘dŠ‹bA­U¦ÏÚ*©š@ÂËÚú¾n)¶Â í¡‰«{(\Û	9€|x
#pãø„3“‡E# ‚Iånuğ’á‚3`ÑQøa¾…³ÅÂâOîÀí~ºs:y€2ïn-5$#ÕKôş` ˜l|ÀŠ£ß4É\+uù4 KgjÑïáu–ƒ•IKæ{çËãI xîáTÖ<ˆÏ4O^ƒ‚ì‚Š•'»üü°Aú#€”	66Äq‹&¼MÌd&ò+4ğ~É*ÒÚ(È¦½ãé\P0¼YôN’ÔSuJzÙ‹l34)
Í’‹$©^•ù¼J(®éB÷-›äXÍ«>bTàÈ;è~†“FÌä‹µ§	¨_ØHÖ«u^°Ò"ì{DÁ¾‰€$ò„ÑšÎš°èß6©Xü}j)õ0¦mÂƒ0êO7“¢zX”­gƒJ}ÿ¸²²WÅç¯Ø‡&Ÿ·VL²Ö_ÂXrÄû™±¸À‡sÈÑ”»œvıó`_ùË§Îg-j‚À¥(ÄBöT?ä¦(úœZ#x­)¢§6("rñåš
EÑÒä•~Û`JL×¼ë–ÍÍb8ÅÌ³Bû5ôbH8¬Daó{–ÿ‡qÓ×Ñù0jHš(€bWÉµ1—‹KÛ¾üŒòõÀê¤KòÁúÑq{´~¤p"‘f]²›òúoy7—<] ÖuÂEâãa~ÂvoüñŞ7x+……÷[2c¶ÇÅCÚşD\3é8gKtôÔö#¢Ú±C3ÕµS™°X†1fÀ
ÑAÏØĞ×ªNÿˆ(£(Ñ¸Ò¯$»ˆ÷©­•–z JË½›ã¨I{ÓÏ;õ‚şdÁ2Fˆ9{˜®¹“åÎåÿÈßè¼ºvÒ…>’gÓ«¡m›ã¢®ïÏÆ±ùÿº˜³¡pŸ¿5R9`ªÏO1Ñ®ˆ…×æi´œåë¥ö=Å@È8ƒhÏÊn#}ŠûÄ4U=qÜÆ¦`Ô—“ÃUøïYÈtĞû§ŸSš’àY„ñkd¶fÙÕMv±]ÿ›}t£4ƒ«½Tc:`(ºĞ‰Ÿøyä™Ø9N†Óğë±m·ê;Ø$2••>íí÷¸	„ÅÉ^³C³B't‹‡‹0„ÎÆ}Ü÷\d4M¬È›£Ûïà!=é›IÚè—}³dw:¤FU/®‰™!3Qœ¾AÔFşs-‘^Õ‰¤”Ædğ|<Ô§—†v×9$¦)EˆıæR}`ZíÀ8ité=zeyS{Õs yÜ.åÛFïFÈH"ÛxíìÎÊÕÈ}hÊ¶RÃ4îÍ?”¯ô:Ö¨xÈ¿ä›S› #†v3)šP¾( 3&»Ñ¥º2±æ¢¤â—‡P….òeoOÏpSÂï»ôş~_#¹ æÈm	ˆ¥òéÉcÔÀt7”"EN|^\õ“c¸şâÕL.­!ç÷˜Ä‡Uä;¸4a$LÖ8pŒ‰i#?íõŒ¶@½W}–R=\©í=bB6¸0mÑ¶›Û4dØ´×¤0ª7¶ÎD†IŸL ;}GÅ2d“DæR­Z¡­±vÅGşåYµÆù*¹ùÖ÷ŸáÆ1Ä¾r}¹ú.øZ=oø\ÿ•ê%˜Kï¢!×¾(JùEîV©ïi]“uU°^êôÎ,	œ÷c¦ª
“‰2Št¡cî’
c”»g½â„½(¦¬û¢§µMŸ€érPºëé(,­:PğS°´ŞU@Ğ $r¾~+÷m™ºèó†Æ˜¸]èÑ÷8§ó(ÑN˜?&lR!‚£Ÿşš°zZ«épşb?Y¹àÊˆBc4¿qJôûÓ,÷"º(}|÷ëPd™’Ë ¸™Ì¦W@‘g/æì†~:çpm¥W¤™’` hÍ¥h\òÙQÑ¹Di~³Ãƒ9¯Ör¶`
n¢<[spâ"@;…æ€œÜa~Öö:™	ã…D–JAU”¢_jàÃzš#ô‡ ›AQN­Ö‹ßÜËÂs—µ	¨hî@7ĞH·u~çSX¤?GVŸ[üÚ¶ˆûåÚ‡N1+¥|‰TQ8‹{áêUÕnçâ»J¹$ƒ~Sá\œÜĞ­[*»¨:é	9ƒ‰ô†MœlDöØñÁdÔÀœGuZ	ƒó'K÷Ä¤ªçIf¥ E”äJØåşê¬¡L|àÿB’'Sy£nÿsñÂ„
ÚS%Ğ ™ë´ì˜7çt‹ÙşS¸`;÷øêi[ˆgŠ•“êÒ.ÅĞà0‹sõ¼>àÄw°§!%ô¹ñÙ¿	ã!ÃwŒl%İ!ÈjÓÑµÃ,JïvQÅÿdp°¹1\îØ<uíèŞ@™$Y%Ï¹ {x<#^ÂËÁê×Ä[¢©åÈ¿ÇÃé•§2‡Ó›".éı×]ÛN°?ßé°U,´ÁÙ}$zg¤Ğ•Ù
+Ö£•Ksò¹ë/w_^"ÕúùxÄ­!s)^İ¡°-<&\)ôş"yx1ò fÜuh¥,n¢É¸á@è!ƒCñ®®©W)	®„ê¬],WÍ„à§‰„5é‡Ğ
ÇŠ“‘"Ì…å]#%E<Å~ì*uçµ¿ò;ë'
äùo š£°ï!QEä¥–Ôä$n”}ƒÓŞL&d6 !ÊgâòôÇ‘oQÕ3zJ˜®±§‚<9ÂWR]{W<¯[‘7­çXÑnô%—€%2§©.!4•øXª‘®b/Ó²k<HğpV$Qd¸}Èï¾%™+EVE‡lôÄ°bÍp6æåßÆÚ²Ä¯Wd¯€ıÁ÷ğà#“}í?ÓîpC’lû7\¤³nQËdñÂ¢ê73Y]¢Û™ĞóîÒº¯Í=sûÀk^”	²¾Ú=,óÓmWÙLP*ƒc/B:7e+¶ó‰kè!º«v_9º‘é2‡¿‡İ!ŸÁW‡È4‡›{º’Ãj™vÓM^>0²4SäàXVú›÷Ğóü9¡"(âº3ğ"Lè±i!GÑyxÉ¿2o¿ûFÂ}ì¨dmûóÉ`ÓƒjèùJ¿Göú‡M+.˜ØEŸ<)a5:{õôtÑùàá6â!ÜM8µ‹°,;g7ø*ØaW¸7QÿÒòğ¹‹*MG;£Y@	Ù9€ŞtÙŠvŸ6dªØ_6ÃE²lsÔ§LÿD>/éa¸(Ú £$|‘- Ê„â’_wM:}‚S*9ƒˆ4ÑE¤WŒzŞßÈJgª–5)~Ô°wéÛ‚›t"lFOÓ\\J§K€é!«q‡ßC,Ü©¾6¨Zµc0‘9ï†K§÷8Uô¶Ôu’ÛoÂ¾+Øùö×Í«
ŞædŠñ‚O¸fú`»lÜõå&ÑÇuX ¿âñ×˜%dyÇFHƒâv#ÏN¤ú1Ét%ï3UÍ5nÈÑ:ºÔ„h&ÿÿq.¨:ï'F.xpuUŠë"Íj$%´‘[ÙÅö±¾âêü›sŞRk!!¦f«~”é„[…×¨ø…Âf!}Z®ö|YÂï#|-j¾ß‘cşõ+!Ì¨GH](	¥†ßSì%)‚äi±P
«¦Ôœ7ÙM.ôæ¾ÚŒÅÄCC<R\L– 6÷JŸ¾Š«èÄL•Ø@ŠáÂİ™m[0O»Ó¹Şl÷)u®æÖ2ö¿
wKÛüx~ÎÊåà¯&ù$Ö%A¼±/êà4¢ùĞ—ôƒ%Yà·u@‚Æõueæ'­Iğ‘ ÏÜ7{1©º_È¸Bt™:6`<^¡€b°6ı¸¿Uäpï]©…ı0\`¢¸Pù0$ºİˆPé7?xGÈ5å?ÑYdšº‘­l‚Ï-Ù¾2’ƒíÔAš#é™ƒ¢ósÖ]Q¤K¥‘¢ÜŸÌ™•?,¤†Rí(¾º3]ær‘`u³Ì„ô±[Ä<]b.lwª\sÂ0	B…Vëd¨Cò§põç"W(ú~Ü¸¯ïâºMØÕHÂ1LÂxR9æ¿…Bg|Ô±>qì
ˆ	Eg2LÆw‘œ©M
	È ôè‰Oğõc£åóUhp ã<ñs%\{2HãÚU-6í<yåüû¤SWàu5Q5‰Y'Ë@Ú;ÏgëhÂ¸­~¶È÷öİlwÿoşíB5ÁîéA01AÔ@iÍğt¡dãşöNá ©hH=…»NNäù|Ò39²NÑAÆò‰N;b“"|™oã”@@ö"íN-”µ#ïÊËŞ ò÷Ñ…+Ú“ğĞkSêboÿuäe”VKXÆ!À@vmİ¯jñsÅ‘€¤?ıjO»ë×@?Åş«ûwivÙbª”tWŒ	¸Z¨MPø5j½É)ñ0Ã¸!Ë# ÜªYÊ¶ÍõÀ5ph½»ıÆäÅÊË©©±x ©™—?;y3²N_K
İºıTT¯sHz¼^IÆDê£VˆSS‘ßw¯+!‘N5”OÁ“ÆWÜ°ó&‰Úò‚
a@T&L¯.ñi
ïâPº¡+<YøC†)¹Ç¡&‰¿‡YÎ	B`^Ç!q4KÊïVojé¹Z4Ê
ü;%øQnv§ŠdÎ›“Å)(F™ƒz)É.m_Ãy(pì‚­Á7!†ÕŠdè×ÁèH±«3"	ÚO·ööO9Ô¬B«œæ>“"upYèâûA÷!o2îµ
&Ğ(ï ¶ÿ…XTlª\·÷Î6é	áü‹Ÿ¿İ»!<´²æDq!åĞèº'KÒAß…$Ìè£”ı”ª„™ç€á±1[WW<sõÎ³“Tİï"2äÜÍÚS7k®³tx»æàı|.h#ı2˜)93ë¹Ì
FÁhD&(‡	¤Øf›K5qÉ E‚%0¶Dó©¢§–BohªNpÃÊŞ;m…Bõ`d~r¿6ú½NdB¿ğS@²àÑÀß›µZŞmô`Á†÷ÄşYØh‘Š3Xcâ1YÄ÷:œ*Óxİ˜z]ZRRiˆëìZ9\sOö7¼¬„u¯¢™ĞY…~i%A¤f‚¤a}m\©;ÚÉbRÒn$ÒúË]‰.] ÃˆÜ&(YÇ¶áAjÉ]¯øÓÃv¯Èí ÷ mé#ƒÈJ¶Q0I)¶ó›ê×i“…r{˜³¸½ƒŠgBá`Ş-eRqp½nIö…ĞCŒ³-/ãÖw­ª_·a	Ö™|â ¬^ÁJÈû[ 0	ù4Ö7ãJmñZ_¦§+©İ».Â]´¼Í¸ p+¾ıé@Å\İ=#Ï³¨úIÑW¡—é{ÂÒN€kçF	7Zæ»Ap%óCî~/Ân»‘¬F‹8–`¢DkÄåZİIGÓ£hÇœ’ôbèBÈş¸ø97dÓK•ÂLûÆ>2ÈbPúË%C¨išš-ÂÄ(½FæñŞhkævMl—%qì™\‹Ó>ì@.¸°_¬M¥§–T×hXÎJ²rìrâ‘dğØJAğÄÂa½Í0XêR¿Èq©AUè$ù¡öşT¥Ñvô°|_MQ<İÖMæ½iÂÉ¹&~WÄ‰å»Hd.îxPF¾´Ç4=IéuI”q‹
zC5ÔØ¼÷q¥Rä¸Äwcu©‰)pMÏWÚ©ğâH2·3õ˜)ÉEİ}}%”„»0:¨ØE‰fú¢øW'ğ!>×fÖ¾Œ«ˆ÷¥×8Ñú¾º¶øı•]ÆÚĞèåòÆ/¿9¹ZZWÏeÊ2ÑñÚê‘M=”w"*MúAîµŒİ
eÕµ~Øn”¥
Pœä€â~%bøù–%—9†ª„z
ÅÌíZJOÅ]|®.©%!P_e×‘ÿßÇHîİÏ|{¼ãúFCë~kÂ<´K™í\ö yû*¥¢ºÅÕåçªN6±+´LÓ~â¡J‡=”8Êm‹¨+Şö~k*©N¶©ÙØ8d÷¬í¦s+§f¾]éX¡Š<]†ş?Éké„Ã·ı‰GB.b^gğXıƒæ p»>œy¹ˆRf»d&§>íŠ™nŠv? kaAw®ü©*Ã;ttåÕwõ?\‹u°EãÏ6ú0mÿ8½AØó@T˜2ïÈ”Şå|cv¸lÚâ9î:‚ÛÃ‰øËÂöšy¸ÑäÚÕ³şE°jAk	Ò‹ø/V4·]šw°ûõ/p)˜öÃµZõ2l.]u†ÛE uâpêDÒÉJÿ‚BÈezı0qñÖ‹3R½šV 4¡}i°ıZõä®_ßoÃøG^Ô¦Ú%$ó³UsH`Vó‡ O»€sœ ½5jÀ"W
”Ì¤8k¢Ócª¬ìàÒï{İ™Ô”z¤º`õÛnò:^|¯ô§ÿFŸ¶”ØÃÜÕuVkñ‘¯9|ºSTè3„è’´2FX°×àÎİÚCÿ¶¨T«<µ?©Ú­µê¹<'hïjŞã ]YEŸîtz÷¤ıcÉŞäCÎz-Xo¢Äõ—bM)%|Ú‰Øºutªåìb†l<>€›.F[·’¶STÙc/?¤ûâãîÛÚl#Ÿ€-ô_¬4¢_q#n†j&/%=4˜uyûuB»M.{>”¹,ÔUvpÌ+z'Uqë$·æÙ}ô›)Ì9Væmzaëà©!Vc\¾—Òú"Ë-=ÔjI]°Î*ŒSgS…ûªœ{²&°ÀD)øÅ0Ñİ¥uÊæTB(8kqày¾É—·3ş×°Ì57¡ÔŞ¯€¦¸Ø*aŠ×è›;¢˜çu<—…x!Ş­‹‡å*’ëüéµîŠÔµØîB¯ñòà)©§tdÛ>B\äÏ*”5aaá5¼:€×á¹õYØŒãØÉ‡"‹úµ§é<b×\i	ÏƒRïL·7°iàñ	Ò½Ñ³&©mÒk8Ï.@zC›@hØe]ğ‰¥èàô*ÅT$ä §ótÈ	â„ëISn¶* Kb—fÖÍÚa„ã?o/ş²…‹¼Æév_İ!ÇE©s×¸ÛXökLz pQ`jzdı5wĞèµÈØ*[Áôóì‹üÁ½yòü‚›BŸ…ëû·(àÓw WV÷£ •M[M<ıò+ KØÆôµƒ*­‰4³‘Š¦ÕI`E2$ˆİ£6—Ûø±·è§‘f
—R…<œëšlŸ@bñ’ãüé2é¡<¥RòE©Ãµ=oíW¾Yğ÷núbÍ«÷¶èñ7èvK™Ú©•èFç³³ĞöØp£Eº‰¢ÈÑdœ¬×—ÍãÀ•ÇÿõÕ:¢ıåP~³ò¸“¶MYîyur¸ºDbÉzJVØS¼‹3é¥¾Æş24©rCRG¹hÎ‹ğ8ÕĞ™ lŒy˜¹±UxØ]…†!¯4ÿô&=5ÖË‚›jø{T–AJB{†a“g’rí}ˆWÕJşá¸Qøp]¾Cd®r*ZzFv¯âáømêm®¿Ú9+ÍGNµgtí\lÖºÆeR{Eµ¯ákÛ÷iA«nD@[‹ğQ©µ(·»w~Ç¢§C˜Y§9™œW@ÒƒÈ›«Ö›æÕR¿o•–Á~É$d1{›âUğ«Û^v,_ı\Xíz{Éxÿ;p‚’äêJãÅtovi†š#†–À˜¯N<˜\bä¾¯åv¼l4‘7³ínbŸùîì’à#z‡øJ&S}ÃKÔ†F„x³?şJG…Ú‰ªáP¤Šê“"E>ÉşY€ú9†këí´4KZ#<Ïÿ)ûŸ›”–é‹«Ä|»Ãy¥8N¢Oøˆñvl‡–GîÀe#Dc÷Ÿ³ºMşÏîÿ‡`ç7;O×bIq7¥ÔòhP9ÿ?ÃØXMåÆ“ŒV³pú’×½îÿ±±^–“—SQkËåÅ±ËÿÅµBY…ú…àÏªÿW@.yäAN"_tkèİ‚ñÑ([§âEûƒ‘ïIy#4µkîä¬qã~&ğóºáÕèùß#S•ãÀ,x+BsÊ!‘ZtÊÌıâùaã¢èÓ~5@rtxÎ÷X	İÍi—Ğï¼İ/³±W‹n½]¦”p¯ûøö‡__è²)	×Ç§ı~Ùî¨õ¢ã©s‡ìu|@hìŸôr“C®`ù– ö?ü¯¦K©Jÿ¾›%ï¦¨üÍt›øY”å¹Ì5HêV°d•Óî;Î·kóC×Rp«b•íCg‚ì¡ï ›(Qø/ÚnşHÕåòò,™§ÔõèdÇ~Ö6ä&sŸ/É}Zü·ÿíŒJ"ÿ(K£Aºû_ù§KÙÚqıt“”¿p˜B‰€nÈí[W+N…h¬Mí7‚%¹¼‚§Uu³ê
…Ù±Â÷‹Ôåë¾oÙ6í&+ü]4KX£æahX¶-åZ÷Ş¹’h“!qàj ¦I‚µù|íÂğÙHQù‰ê»ó•Äñ÷öŒŠèó7ßÿ–©»ìA#Ä©ÇúóÎ3f‚Ğµœïiõàß  H‡Öª8ÔbbŸ:­ğ ùïÄWEç·ÔT$¢Î;ı„ÆŠÿ–_ÿŒEx;ĞrR‘Á³l?›|¸èµ !şpõW­ğMì‚èÖ—¼œc%—=gØ:¡=Hı'oº€QæwŞL¯$tÕ§F1 FrıÇİ3×ö6CsŠ‰ÜÛäsìùiÛÍ„M÷¼ÂZD|±¾c3íu
‰Sy]rüÆ¡òƒïİœ¶£,9m‚÷ı’Õ¿š™ÍëZ)EûZ8Œ³«h sJ «šºãšºÁƒ-ıŸÖ`Ê^f¾@nß”E[~¢~Á¨Ô®KÙÏØdğyVCE©8Ë3¦$a‡kRø!3™f¼v…ÿGÏ"ÍaèÒ_±¢?ÿèÆ±²?‹8ˆÖ¸d™ÁµáÃX¶ºÑ¾#b¢ìY»õxRY¹”Ûzô]Û(ªç&–sâ÷9š@¼ŞVfÃÖš×Æw¼äb2ñV…¹¦cç±İ¼Ök÷„`­B#ïnaÿA¡üo½„jiÉTo
~QcÊòƒaêŞë”$f¡†2?-Îª?mó ™QDEÓ!‡8³QÀİå$‰èØÌÎDVÇ_Vô,3Û¹eîùÄ™fôNE²«“£L¦ƒ¬àæ<.°úô§´âÓ›¦Ç²şlËÿú’âó,|v–u[,)©]vğ•ÄQ¿°kùòVˆïí´¬†¸ ®t1í†û¨€®'ê¦0™²»ìƒE‡²;_ãg©”‡kóìòj 'ró€\x“B^ÌJö†i›¢Ÿ–¦'.;“gÏ/O•Î[á„5µ"-™±	Y$O×£lƒjÜ<“l‡ö¡~o²Í@ql=ãñÔ®ÇàØºyf÷^œ_<—rsök«>$Ã,®FÑg§Mœ”ÌëOY@H˜ô;Öı†%ÔKÏDĞg{‡ØcE`Ç©£ø4tc×ˆÓ3Şõè³Üq^õ0ÎîWšáF±YwZßGM°/2 /òh]]Ìà¿)Ol§ïp—„ÑÅåÚM”üûÖ·9€Ã¿ÿXMè¯Ï^[-ır1¢ævİÖ<¦³¦x/<è;ê´G˜*3yVìk•eßA>ùÀ¯}—ÄôG_K0ÈÏÎH£nçšxƒô—÷ÖË¦¸jÑàöù+úÀƒÿË[—Ó™ã=äVŒVR‹ïÂÚÓ<Y<ëM}†Ô
‹hbt‰ØÉó¬çV`ß˜Î¸’-Ü>p»3½Ú7nÜc0ƒ&ë!B :%ƒÖÛ¿
7:Fï“ÕúR	mfaZ¶_NcXt°tl±:¦ˆúnXàÿCEMÓÃÖÑ”ûeP†P£®Ğ©íj …f9¾SîÛéıQd2VwïúáüŒ·/l¢#B§BöAºëŞIp¡N¦eºÍiÊògš§óÖ“©(SÇ_áêŞŸ³g”x³ÈFùÖ©·¾Á¿/63ş·ƒöwhå›¥³a,VT`k¯ëÚ@|Ø0	EÿË1Ê¬Aö%Ó:/êÏ6¬Xò?!÷Õvš‡H©¡»¾íH[ú7$¤~„ğ.ñKèâWT|(M«lÖ©´=Í=ÚØŠ¥¾æõ‹Ze/]á,”{ÃàuVt®8¶&)Iã°¶æÍ5-¸âIQây¿f½6¾fSœõ—*†Y,_Ï¡~îï›Iˆs.Ûo„^ÏiÇ‰<Q'(’E®õ¿„ã·ı	4ö\²(‡ÿá—–Ï¯cì6‚ÆRİ‹–Óüd4´¶ŠÔMŠ-H’ŞZì8Qœö°(Ozb<îıZ”nû%²Œ^‰:²‡Á—›¼¥c'=zè¬†<mæjdW^ÿ!°îM«ek”&ÛÒ~-DËäzÍOmèa¶„o©ÀÀêWË¯ÊŠ÷ÿıÅ€¼ kEæ¹YLı7
o³uğfIGeb“Îµ2İÚÏÁÄëË?Kä¶HÀ—´?tBÎş6óıE¤h™\hÂmİ =Ñ.ªı,ñ¾Ÿf¾^º²lƒ;ƒ‰p-"SöqeGâ`CiÜÀº5Ï•#º<¸·»§f»äÖf¤i#$C*cÙã¡pæç:™ıÁâé’KÊ7 É˜Tû¹Uuô°IÅJ­S7¶³±­iÍßÕ`¼7ÈP‚ï^’\Ñ[^Íù—¥V_TõbˆÏ6¿®ºMÏW^#we8œÿiâ{b	Í»ŒX+È­¤ÿ=U„íPå#a0mgõüÀ‰È6±ßV±ßY=áSñŠ)÷š8VÄd~àş a¾›Tö_‡âÎmàß˜­ZCÉaí)ş‰È×*«ë¦ê(Qó›sx}±	Ã–{©QsÛF+× ŠHÇ6°î‡óÙˆiï&(^ñöjëYõ©—Ñ’¤Ø3sCvS´3ß|[ñÆs\ó</Ò¯œöò5PhW4)ô­âHBàøëŞ`W¹Ù®ŠÈ>¹JjïĞ¸ÖĞÂ>£t:<·™Ó¦ÖñÜR±øŠÓCÌ~¡-„Hü‡úböË.,3x‘%zÍ1Xñ/bˆ®²íb?nÁæÛøÉ‰¶JŒ’ìcï®!;lµyÛèdW2àSW^$7[°zl.®dHv‚q\4™¼Ø=ƒ·‰½$¦°û²UNÀ£ª,±ÍNıä7U"qŞ!ŠĞÅ­ãĞ°÷.}Ø´‚Ñ4Jî»Aç¡[@ÏøSöARk<²O*Âwß`é;¨mR(šÉåñµæö¬S f¤ÑªÃêú
ëæ$Ãß„í¦y•İ’¾I¹
ÿÎ×‚7„úîO;^ö4?ë|—€3$öZu¡>BÎ¥a£¯jXu…÷¤ u5‡AÆ<‰3‚i¼u9hÕ¢©Z%ƒ±áéŸÙOÊ˜èØLHì«lãº‰-Q’\öõ³æ(­°áJKß|G:Äa‘8M‰õ¼^ò¾w™ö~¼¢ll‡vÂ–Jé«%?QËóæÈ õ²QÉ`]:¿‘`""kî}\+š.É>F¸¼§FT¥x'p˜ûËJ•l{!:òÜ°Ğ±YÑz~m—(hù ¦F`zúõ•ø™Ç¬šø¼ï×ø¨¤	€¾¯?Bô’–ÃYª$k†ZFí‘/·¦Qºv#ß ÇŞ	¥ÀJ(‹3×$zìpü ÚW«â2Ğıx¥İ†qo‡~ÿ£³~Ë¤ÌGHÍdô¨Ñqg¯“µ¼­OCæR˜òâ½MJ ğ•±d!ô·›
_d_*ÒˆTS`U[ER~Ëó0véÚÿ,Ú—Ze!¥¤š“?ÄèVcÒ„¢Âr‹“\í íšÅ²_×Ë²Â‹wSr/¶W°W}éíÜåè¼¢WÚô‹ qäËP« ÌZ²_âR¦2…o
B p‘7óÁe±pbb¾¡¬Ö¾e\ôú±åØY{“•”f®¦ñÆ49‘Hí<0TH?à’ÑóH.½/v‡+PN(+?Ïb¥cUfWôûUÇÓùè°˜kŒòô—2¤…¢‡ ¢1“¥Ü£ß¢&;¸Q˜&F¸Ê|_†’:wÌnZàQ†é	ğşgT_ {ÍÄ_I/‚GQƒ§€ê‹ğî
 8ıÛ•,ä­’GÅï0ŒÂÑ§¬ Z8Bî€ÍÈb„1ÊÛ²hdb
¡AO†Ò…ô.âùŸ36Ka¡Ä'‰§ú5i¯×›{1DĞôgä%Ì~iT¦¢Æb²¶S}×ªYfåÛş´ı›(úNÂ(Ø\)/Ä_*«Ë—{8$™LÍ®İ´Ä.9ÑÇJÊF»‚:)<Ãk@ıèp+ÛÌ\.¨{Ì0Åóä,wng0ŸSv}·æ2H&9 pNSß¾or6,mß—ËJfkŞV}ĞW ¿ì§·jÆLvq–¨=³Ìä¸İ$ú‚¡O¸Œ ‘Sğg…pÿÔ‘Ú›Tú·‡«^Næ%ŠÀjr¿Ça{Şú2¬ñŞ¬Âv%EÍùVBâÇh†¸š˜ö|‡©Ú/ÌÄu	=J.Qª°‘ïäü;òQÜ5¦{Š÷Äğ(CñÈ¢_(C1²ˆŠÏËõ¶S¯İâ!a"~¬æî/‡x3èÖ)FMïó]‰—8š<·É£ïN†$ñ¼£ó0˜¿Ò”9e.ŠšwB-ËØòĞ‘æ¸ÁÔ¢Ø·r>“éÔixuÿ5÷ô9(î“Ôî*ú¥r5²n‘`lØB]º79ÍÄ×«Ñh`ÕcĞ`¿àšÊ»- ÃÊò?ÑvPt‹•ÙT‚óYƒ²ş~“S³3f‡(qùHem~y0]èZ‹¸Ø¹^DTRn¹,q¤tsuÑÁfíÎ?pŒ@év}È8ˆÜı¯l¸Û÷+µ‡´âá¯a@ò=EéÓ¬UEÛMù1ö’©Ô8Íqš°/X¿/¼w8]“É~Í ®Ï]_JfğZ×@f’Z¾uÍ‡$ßÔş,"ßf¼nwBnH¯!Fˆ9añ^YV<ĞUA¸@üŒdW=·_7ÃÃÕ»‘áÿ!x±>îÂ±ÇVËÊf/¸|pç`°¥ÂVCÖ
1ò<UìŠ•’˜"Ğêâ`«¸NÆcÉ¨åEÚwn24ãäÒúy2x û¸Ï„~†^YÊÛ‘×!hÁ§dÎ³RgQsS„â©ËQÑ¨›]˜ÀÑÈ…i¸RëFÃêmòºjÆêá’i¼õj§¹¸k°*‘Â5Mˆ2|˜j¢h5û˜ ]Û1J3F]bãÀÙÉm.=‡ŞÅç¯•ÒPŒ"íÎ<=·Á$+Õ­€«Í*„Ë`^¤"Â[Õİ—*v%§xĞ£Ş ¬ˆåÙœáÇ´ĞQ£áøû³S¢R˜”C2”'‰’õ¨O( ñõêÈÕ„×r,-´Iña ¦®Ó
j$šñ ·°)Ö ¤)Şu18cµî}W’{£ÅÒN‹'œÓp¡rËÔ(ÃoR‡8v	LaÂ(ôùsP˜Qltæñ•Dj+5`·­ù’}¿g’/{!H’ÁYåã¦íüÁŞƒÂÛ:WlrïáÔ-CXû"´¿hpb9†ÇÖ(òa@\rêè8OCI6¶¤zÓáM@†|¾tâÍç3UNáL¦R†í·³İúR•%#a‘Ë~û!È™ˆ*Î¸Şİ„;(¶Ö[›>¨…Ìxù¦ôHYvÂÙÃì¬'ö]ˆÙ´ÜÙ¶êØÂ#6ñï N•'Ì@ÏÕv-ørŞÑ’µ‹±ï”éá¡¸ˆ»ÀŞ1àıKéB¤p™zÍ'z²Ü:µ“44ÁUX$”¥V'2òÁE
SlÂ|ü&s‘Ï¾…`3Û)nû5:'Ø#å:Oƒ¸r
òÎ“l÷¯Yí_–yÑ
ºrµ˜`†d%ÄœX°gïQR±î´üWEKR19£µxÀ*lF¯-ŸŠÏÁ¦Ü[ŠO²6›ÄõÅĞ£´í*oâQ»Ôæ³T-Ï¶°’™‚ñÜÊ*PQ‚W¼kÍXŞ[ÕZ¡„Qd{1 .#3÷KÏd®j[<¨çÍÌ:à
«VÒƒpTSèRŠJó/…Hh%ÿØ-ĞF…ôáñãËÚà™á8ºªR4¸/ÊïÇQ³É‰uŒ®Ú ©Pwà€}»­­ñ±„§CŒCUCãÕéFnb‰Óv‚)ûDdšòî,²ŞehiÀç{	lx|])à®Å6Â7«›XÏ‡ßÃÕÙS„bbêv²íõpLlïÜ»Àù-!‰qş˜O Õ:JÇ$¬¥ŞÙ%L²¨ƒéêï¬X:§ìliz18òm~s‚î4¯¿õCaÂÂ°†Üjö–ğY¥„-_‰»Nd¯ ïc¹xEd÷á?PIã’Ìb±	ˆ>ˆ~A&Ù™Ä£dÁtsLîÌ‹²‡,räX´—“1Û‘y6)Ë%qûÙÅá»—µ›1¡‚d‘×:ÇAªó(ÌnX~F¦ow¢H®è"¸úİgÑRX¸î–›ÆBÔM5èŸ·xËËíÄÚ|`ÇéSØ§.tƒ‚<¾ğzÀ>êk,³]I§šC×=~*Æî”œ9>®J9ñ»Ã˜Ú“Oû„FP˜e`[½³úÙÌUH‚¥µ!&Ù,Å}§Ä;‘Ê“ta)¬ªY<¶k+¥2wùa8€î¤(W×2÷ğ»UÃø>¸¸êó	Kv­ÅËˆ°í[£øı÷½2Ë:ÆEwDæ+úA''v½œ¦ÅW7İåO#PÜøõbê!Øëß·Ç¯]ÑÔWY·ƒé1ØrOïN©¯éÜîœ|XƒüÖşûÈ’vôFòşÏò¼ *‰Â®ês{Ğ4dp¼”`½¹ šâôù;Xúë1¾q“¥ ‚Í›«Á+â³Ñä´²&·}ã®3cø“ÂC¸ï9îìiú	p¤Wš	.…¦)ÁÀrQœüçeNb<M±
Ô¶¶ï0ri2¦ÅîzÛ,bÏı6`«Õ+Wpa—»¹\2èÃ:-:|©¹|ÏgÑèÔÕZxûv »¯Ø)Éç2lRí“Ñy¹ŒIc¯ŸSú­™"Úï8\Ne9t±"ChNœÿàÂÇ§èÍdjšîˆ›ú";)ÃSÇ
åÃéæÿûq© ˆ&÷Z ¸~mwíÚY$ËÁÙ)Ó>Ë>ÀÔxğ§2,èšoU0™VšôQo*ï„ÚÂ=ŞfƒP-HÑ©Œ ß/ñu]ä³ûÿÎ¿§óäÎ	¸¤(jÒfæ!SâLî’ |@]9Õ†Ñ¹¨’´?°Ãliİ&J1;ôÏÚæ?é‹QÛ²‚şdõñ|Oé½*xÈï7´yİF™Õ5 é>½'ÂOBƒ7‰âF‡×"¥¼H‡ÀÃ¶L%·ù8òIà˜™*w¨Òó±løK®FvÊ-R¤·Ê›T“ÉÎ»RIr]²Ûs¤P?Ma‡CQ\Û¥Œ,†\Zô^–	8RÑ;PW-ïªh	l$òCB4‡oâŞêíÚÒ[ùfObìS$3TÖŸ¥XÅ?RböGåxì¾‚› LI‡áá÷ç*D)ó¡ü)ûüô´ÓÒFŒeÓ2H^nïÏû£iQwÀhi'$‘Á‘ÁˆÑˆ2¨_¿Z>Â›šoâÙÚîâ"#FSÑ™n>WD†l“Uzw%ß)M»;drF´G@^ª~N·{yj•ë”şÉÆ‚a
ÃzDö¤%=#ğB¦¡A_3·ü<
oî±¶¨Ø ¡pBâ´Áé“nMÙ…ó;íÂG}S*É–ÕidîròÜLxqœZkl)äX1xœº<Z5­ôïh°4x¿Qªh€#²RÁgÛÇˆfÇ”¹¶pÈâAH
˜&ô!}O£àI¾-<lè÷8Ğ°Ê.a& 
Sˆ>°è(M¹}#yõÔI2Y¤0ßmbÈµfé:Ôjvb<]ØØPHWUøË/ëaÍß%öÙ<±»L*c, Æ°–juı†`ÌÇç_™¾¿Ww’'¥É<F(\ÌÖÆ–q“L¶SZRGˆ½ëc” nÅçZşT)L›w™ÅşDy*(sE†;;¡Tç*¿*èÔ¿OâÎ•4®7•hµ+Q8D˜ZÖyBÉ^éÔ¡™ÎÑŠ¤²äF‰»$s˜”=TènøÕË¦Şq€‚"ÇÈËlo¤×b±ã»RÇ'¢èF6 Bc²$úTµ„!Q}‹bb	M—Áè§	“d¸q0 UÏçÍ
A5-Åf++½XXgÕè£˜»§Ùı;‰Ğü¯¸+Àcs(#îtúâ¹…îÇ+¡ï/ÆS¶ª^ns‡º÷S]@…Œ¾Lëm°E*E¯Å¦]kç»N[ı†È }¶û9·¸g-aš†Kt;íÜîÍf1³{êàpÈªAşEÀ€ÊÙØk¯JT3fÀ¬aÆá`ssh û·ñÆE#ø­§16)x"Y³«ïÑ¿²fX0BkÊEóÀjÑ¡HÕÓ¨Ë/.á˜ŸAX#Ï•ö¡Ş,çTë=DubA÷ÍÉgn‹øı _Œöíb&ÖÁªW d†ã‰"«Ó9«~B“Áã9YÙÍ=íXí²D;¶p oWß=Ì xõ4¨—DÚWÙâÉäHìç)[ÏØ‚Aq¯ëe´©å}ñÊù,©ùiyê }gù©šğêGKLgßs“Ò+îØò¹Œ­¹Ìì^23”
jQqÿş%r¨XôKÇÏÅ8ğÙ	êKü?¶ª›X|‚äsÛÖ&­¦;^0u&â 
XÅd:Iñ6+äE[X\,"dÊõFôÕzâà‘?O‡4Òğ¸Ì(Dk¡rÛ´(·N‚€`¢n1Ué:g Cé¯Â™cÚì÷ïÈ¿ĞOßÙj—­À+ªV’JåQÒ¨… :|á¸wB±¢©)ôù?Ÿè3í¼–)3bÒ?ŠoÒ.Íy³L™˜>I’ØÉhd2l˜º+¦—C¤:Ñ+üeŒ1¾„«P¼;Ä,ı&Å!FvÜ,5†º7WI@½ß|q¾Í°%¤ÊÅï è	º7…[V¯Z½ŞCŸûÌóëõ;ÒöM'äÎ°a*¯ÌçæÑ:MDÔê[Ò:k8ƒ:/oãLˆL€Ë?Ç?a-ÚœÅ$˜¢áøÜ;œbÀ˜†dá>ö6ÁE¢F±‡¹|º<¢fC1:.FºØ ¬òÙ:µ1 3TY=wkàËê
…à‹%Ù©ï?@¨«mìx-€Ô7Ú#  ğÜóÑl˜{‰-VÚly“ÀPã/Ç˜÷“äkIçÃËÉØöâÊ ?İÀ²O9øãë›ı;%CÚÎr†‘Ó/Û`Z‰.n?U¶³?†÷»§Ï¾Nß/ÌpO{ŸF´Ÿl.Ì0êĞFÌÚª”@Dû–‚İ‹áYUô S¿e7˜“àÜz3Œéµ{àéãi8Öû¥ÊE¯eY‘Û~²t]‘ì{ïyÓÌâx'ª³Ş©dDyÔŒw‚œ¾©qÂ‹J8{¡ÃbVG!÷is1h*D£-Wlœ­ÒPc±´¯†=ˆÌÛõI+l”‘êRt¾F¢¤=­èÅ#nê¿Ø@KÖdÙnUìrT;‚Œ¿äØU˜çûÿğklbí¹¥ÔwU¬¡ò•w¿Ü–¿òÊ¤g5-Œ¨“×şÇ1ô¼†wÉöI Ï|í²¤.`Ã*BŸÇ İVG¦„ÕB¦{]e¿…ù¶Çª"íŒÂ—HC€uûq[Ee%‘†OêV]/ôv]5Mü*1Î[f}Õòƒc¤èh”R]¨”aXÈÿÙ`Wı÷àßæ_Vÿƒ/ÃúßØ¿ŠıŸ²Îÿfğe	÷_ÚA777»ã9ß»ãÏ[óåúwà«µV¯“õv?nt£6oµT6cÖ½|r!oÕ‡‹ãËœÙï+Ó,a¿ål!]í(P4ëºw¶Òè±7ò]Ú!ô`2gáîdM%[ˆ±3¢pü-åd:_v-m'¢‹M)?på
ú–œŸ- Çë¸ú;üòæ`òzÉí`?Ğ}ìg‹ÏeÉ¤ëŞh*›E<|eÆBp±ÑÉ&‚q±Ş^ªÊ:WiÜùÙ\Ä_Çë|•QÈï¾ìFÜi½í§ÖkºäÚJf‹ù(KTÀãX3K$ Åÿ¡7³Ş òüäeØêYnÔá¯Óßè´ñ©ôx[rÃúVüäÉì@Ãs2_^j6ßà°¢…„IÎl¿ÑÑîy¾ª;³y¹Õ[o;÷çñåÙoÕïá¼üMJMÎ[åÍ5ó•ÆÆúöŒ•q$¼óûã'}Q¸õ¤ü ¨w¹nm‘Q'È0¦?‰ZöSëvW0ÜŞã›Ú·R–Œ¿Lf×Û-Tô¼<?Ïw¾	¯ŸIë›”§Ÿû¡ê=Zwš~«§C¹Q{KƒãštºH)Ã¶÷+ºÇíá´^¼\îk•×Ë|`äKiW¦´¦”¦ª¸*{°é@,öØ{ö_¦iİuÑ(n2jâXìÇ
Xâİ¢˜Ï—Á…Ñ3^ç1œO‹Æ:–íîÚNÍ­ƒä~u9 Ç’rVÿ›q^sÒ+Ç–ëôë`nBm#‹YñÑoÁÃÜPâ¶‡u?…"c¤øÇ›'ğNÂÂ"4Æ>X÷ï{”ì¿—Ã¸)÷+Nk^¼Gï0pOëv:_„$bùñ~ôbå„v½f¥DÓwÊ|[a÷]p˜\à›IÑQ…àÀˆlmS]UEó~ºçQajƒÏå[R#™×jõó[¡ìİ_Bv'/ì_Ÿ6^ó.¡l[¥•¶Ct-†                       jQuery("<label />").html("å·²è¯„ä»·")
                                                    .appendTo(jQuery(lasttools));
                                        }
                                    }
                                }
                                jQuery("<a />").addClass("JS_order_btn")
                                        .addClass("mui-control-item")
                                        .prop("href", "javascript:void(0)")
                                        .html("é€€æ¬¾å•")
                                        .bind('tap', function(){refundList (order.orderSn);})
                                        .appendTo(jQuery(lasttools));
                                }
                            }
                            //jQuery(templatedl).find(".tools").last().append(a_btn);
                            var goodsCount = 0;
                            jQuery.each(data.orderItemList, function (index, orderitem) {
                                if (order.orderSn == orderitem.orderSn) {
                                    goodsCount = goodsCount + orderitem.quantity;
                                    // -----create templateGoodsDiv-----
                                    var templateGoodsDiv = jQuery("#template > .order-goods").clone();
                                    jQuery(templateGoodsDiv).find("img").prop('src', orderitem.pic + '@150w_150h.png');
                                    jQuery(templateGoodsDiv).find("a").prop('href', fullpath + "/order/view/" + order.id + ".html?whichclient=whichapp");
                                    jQuery(templateGoodsDiv).find("a").last().html(orderitem.goodsName);
                                    jQuery(templateGoodsDiv).find("h4").html('ï¿¥' + fmoney(orderitem.goodsPrice, 2));
                                    jQuery(templateGoodsDiv).find("p").html('x' + orderitem.quantity);
                                    // ------install templateGoodsDiv to templatedl--------
                                    jQuery(templatedl).find(".tools2").first().before(templateGoodsDiv);
                                    return;
                                }
                            });

                            jQuery(templatedl).find(".tools2").first().html("æ€»è®¡ï¼š<font style='color: #E4393C;'>ï¿¥" + fmoney(order.totalAmount, 2) + "</font>(è¿è´¹ï¼š<font style='color: #E4393C;'>ï¿¥" + fmoney(order.deliveryFee, 2) + "</font>)&nbsp;å…±<font style='color: #E4393C;'>" + goodsCount + "</font>ä»¶");

                            if(order.orderType == 1){
                                jQuery(templatedl).find(".tools").before('<div class="tools3"><span>å®šé‡‘ï¼š<font style="color: #E4393C;">ï¿¥'+fmoney(order.depositMoney, 2)+'</font></div>')
                            }else{
                                jQuery(templatedl).find(".tools3").remove();
                            }

                            // ------install templatedl to page--------
                            jQuery("#order01 > dl").last().after(templatedl);
                        });
                        var current = jQuery(".order-filter a.current");
                        var current_name = jQuery(current).attr('name');
                        if (current_name == 'all') {
                            jQuery("#order01 > dl").show();
                            //jQuery("#loadmore").show();
                        } else {
                            //jQuery("#loadmore").hide();
                            jQuery("#order01 > dl[title!='" + current_name + "']").hide();
                            jQuery("#order01 > dl[title='" + current_name + "']").show();
                        }
                    loadop=true;
                    } else {
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("åŠ è½½å¤±è´¥ï¼Œç¨åå†è¯•");
                    }
                },
                error: function (data) {
                jQuery("#loadmore").attr("style","background-color:#ddd")
                jQuery("#loadmore").html("åŠ è½½å¤±è´¥ï¼Œç¨åå†è¯•");
            }
        });
    }
    /**
     *  éªŒè´§
     * @param orderId
     */
    function validateGoods(orderId,handleResultStatu){
        console.log(orderId);
        if(handleResultStatu=="untreated"){
            popAlert("ç”³è¯‰è¿˜æœªå¤„ç†ï¼Œä¸èƒ½ç¡®è®¤éªŒè´§ï¼");
            return;
        }

        var layer_confrim = layer.open({
            title: 'æç¤ºï¼š',
            content: 'ç¡®è®¤éªŒè´§æ— è¯¯?',
            btn: ['ç¡®è®¤', 'å–æ¶ˆ'],
            shadeClose: false,
            yes: function() {
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: base + 'order/confirmGoods/' + orderId,
                    success: function(data) {
                        if (data.status == 'success') {

                            jumpto(fullpath + "/order/tradingsuccess/" + orderId + "?whichclient=whichapp");

                        }
                        closeWaiting();
                    },
                    error: function(data) {
                        popAlert(data.message);
                        closeWaiting();
                    }
                });
            },
            no: function() {
                closeWaiting();
            }
        });
    }
    /**
     * ç¡®è®¤æ”¶è´§
     * @param orderId è®¢å•Id
     */
    function confirmGoods(orderId) {
        var layer_confrim = layer.open({
            title:'æç¤ºï¼š',
            content:'ç¡®è®¤æ”¶åˆ°äº†è´§ç‰©?',
            btn: ['ç¡®è®¤', 'å–æ¶ˆ'],
            shadeClose: false,
            yes: function(){
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: '${base}/order/validateGoods/' + orderId,
                    success: function (data) {
                        if (data.status == 'success') {
                            jumpto(fullpath + "/order/list?whichclient=whichapp");

                        }
                        closeWaiting();
                    },
                    error:function(data){
                        popAlert(data.message);
                        closeWaiting();
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });
    }



    /**
     *  ç”³è¿°
     * @param orderSn
     */
    function complainGoods(orderSn) {
        console.log(orderSn);
        var complainReason = "";
        var layer_confrim = layer.open({
            title: 'è®¢å•ç”³è¯‰ï¼š',
            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_complainReason" name="layer_complainReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="è¯·è¾“å…¥ç”³è¯‰åŸå› "></textarea><br/><span style="color: red;font-size: 12px;" id="layer_complainReason_msg"></span>',
            btn: ['ç¡®è®¤', 'å–æ¶ˆ'],
            shadeClose: false,
            yes: function() {
                complainReason = jQuery('#layer_complainReason').val(); //å¿…é¡»åœ¨closeä¹‹å‰è·å–
                console.log(complainReason);
                if(complainReason==''){
                    jQuery('#layer_complainReason_msg').html('è¯·å¡«å†™ç”³è¯‰åŸå› ï¼')
                    return false;
                }else if (complainReason.length < 6) {
                    jQuery('#layer_complainReason_msg').html('ç”³è¯‰åŸå› å†™çš„å¤ªå°‘äº†ï¼Œå¤šå†™å‡ ä¸ªå§ï¼')
                    return false;
                } else if (complainReason.length > 100) {
                    jQuery('#layer_complainReason_msg').html('ç”³è¯‰åŸå› å†™çš„å¤ªå¤šäº†ï¼Œå°‘å†™å‡ ä¸ªå§ï¼')
                    return false;
                }else{
                    layer.close(layer_confrim);
                    showWaiting();
                    jQuery.ajax({
                        type: 'post',
                        url: base + '/order/complaint/' + orderSn + '/' + encodeURI(encodeURI(complainReason)),
                        success: function(data) {
                            closeWaiting();
                            if (data.status == 'success') {
                                popAlert('æäº¤ç”³è¯‰æˆåŠŸï¼Œæˆ‘ä»¬ä¼šå°½å¿«å¤„ç†æ‚¨çš„ç”³è¯‰ï¼Œè¯·è€å¿ƒç­‰å¾…!');
				//éšè—ç”³è¯‰æŒ‰é’®
				setTimeout(function(){
				   $("#complainGoods").hide();
				   $("#complainGoods").after('<a href="javascript:void(0)" onclick="viewComplain('+orderSn+')" class="JS_order_btn ">æŸ¥çœ‹ç”³è¯‰</a>');
				}, 3000);
				
                            }
                        },
                        error: function(data) {
                            popAlert(data.message);
                            closeWaiting();
                        }
                    });
                }
            },
            no: function() {
                closeWaiting();
            }
        });
        $("#layer_complainReason").parent().parent().parent().css("vertical-align","top");
        $("#layer_complainReason").parent().parent().css("margin-top","10%");
    }
    /**
     *  æŸ¥çœ‹ç”³è¿°
     * @param orderSn
     */
    function viewComplain(orderSn){
        showWaiting();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: base + "order/viewComplaint/" + orderSn,
            cache: false,
            success: function(data) {
                if (data.status == 'success') {
                    var html = '<div>';
                    html += '<b>ç”³è¯‰å†…å®¹ï¼š</b>' + data.complaint.content + '<br/>';
                    if (data.complaint.handleResultStatu == 'untreated') {
                        html += '<b>ç”³è¯‰çŠ¶æ€ï¼š</b>æœªå¤„ç†<br/>';
                    } else if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>ç”³è¯‰çŠ¶æ€ï¼š</b>å·²å¤„ç†<br/>';
                    }

                    if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>å¤„ç†ç»“æœï¼š</b>' + data.complaint.handleResult + '<br/>';
                    }
                    html += '</div>';
                    closeWaiting();
                    layer.open({
                        title: 'ç”³è¿°ä¿¡æ¯',
                        content: html
                    });

                } else {
                    closeWaiting();
                    layer.open({
                        title: 'é”™è¯¯',
                        content: data.message
                    });
                }
            }
        });
    }
    /**
     * å–æ¶ˆè®¢å•
     * @param orderId è®¢å•Id
     */
     function cancelOrder(orderId, orderType) {
        var cancelReason = "";
        var layer_confrim = layer.open({
		title:'ç¡®è®¤å–æ¶ˆè¯¥è®¢å•?',
		content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="è¯·è¾“å…¥å–æ¶ˆåŸå› "></textarea><br/><span style="color: red;font-size: 12px;" id="layer_cancelOrder_msg"></span> ',
		btn: ['ç¡®è®¤', 'å–æ¶ˆ'],
		shadeClose: false,
		yes: function(){
		cancelReason = jQuery('#layer_cancelReason').val();<#--å¿…é¡»åœ¨closeä¹‹å‰è·å–-->
		
		if(cancelReason == ''){
		   $("#layer_cancelOrder_msg").html("è¯·å¡«å†™å–æ¶ˆåŸå› ï¼");
		   return false;
		}else if( cancelReason.length < 6 ){
		  $("#layer_cancelOrder_msg").html("å–æ¶ˆåŸå› å†™çš„å¤ªå°‘äº†ï¼Œå¤šå†™å‡ ä¸ªå§");
		   return false;
		 }else if( cancelReason.length > 100){
		   $("#layer_cancelOrder_msg").html("å–æ¶ˆåŸå› å†™çš„å¤ªå¤šäº†ï¼Œå°‘å†™å‡ ä¸ªå§");
		   return false;
		 }    
		 layer.close(layer_confrim);
		 showWaiting();
		 jQuery.ajax({
			type: 'post',
			url: '${base}/order/cancle/' + orderId + '/' + encodeURI(encodeURI(cancelReason)),
			success: function (data) {
				if (data.status == 'success') {
				   jumpto(fullpath + "/order/list?whichclient=whichapp");
				} else {
				   jumpto(fullpath + "/order/list?whichclient=whichapp");
				}
				closeWaiting();
			},
			error:function(data){
			       closeWaiting();  
			       popAlert(data.message);    
			 }
		   });
               }, 
               no: function(){
                   closeWaiting();
               }
	      
        })
    }
    /**
     * å–æ¶ˆè®¢å•
     * @param orderId è®¢å•Id
     */
    /*function cancelOrder(orderId, orderType) {
        var showConfirm = true;
        if( orderType == 0 ){
            showWaiting();
            jQuery.ajax({
                type: "POST",
                url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
                datatype: 'json',
                success: function(data) {
                    if(data.data != 3){ 
                        closeWaiting();
                        var statusZh=new Array("Null", "å¾…å‘å¸ƒ", "è¿›è¡Œä¸­", "æˆåŠŸ", "å¤±è´¥", "ä½œåºŸ");
                        var text;
                        if( data.data < 3 ){
                            text = "è¯¥ä¼—ç­¹æ´»åŠ¨è¿˜åœ¨ã€" +statusZh[parseInt(data.data)]+ "ã€‘é˜¶æ®µ,ä¸èƒ½æ”¯ä»˜!";
                        }else{
                            text = "è¯¥ä¼—ç­¹æ´»åŠ¨å·²" +statusZh[parseInt(data.data)]+ ",ä¸èƒ½æ”¯ä»˜!";
                        }

                        popAlert(text);     
                    }else{  
                        var cancelReason = "";
                        var layer_confrim = layer.open({
                            title:'ç¡®è®¤å–æ¶ˆè¯¥è®¢å•?',
                            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="è¯·è¾“å…¥å–æ¶ˆåŸå› "></textarea> ',
                            btn: ['ç¡®è®¤', 'å–æ¶ˆ'],
                            shadeClose: false,
                            yes: function(){
                                cancelReason = jQuery('#layer_cancelReason').val();<#--å¿…é¡»åœ¨closeä¹‹å‰è·å–-->
                                if(cancelReason == ''){
                                    cancelReason = 'ç”¨æˆ·ä¸»åŠ¨å–æ¶ˆ';
                                }else if( cancelReason.length < 6 ){
                                    popAlert("å–æ¶ˆåŸå› å†™çš„å¤ªå°‘äº†ï¼Œå¤šå†™å‡ ä¸ªå§");
                                    return false;
                                }else if( canelReason.length > 100){
                                    popAlert("å–æ¶ˆåŸå› å†™çš„å¤ªå¤šäº†ï¼Œå°‘å†™å‡ ä¸ªå§");
                                    return false;  
                                }
                                layer.close(layer_confrim);
                                showWaiting();  
                                jQuery.ajax({    
                                    type: 'post',
                                    url: '${base}/order/cancle/' + orderId + '/' + encodeURI(encodeURI(cancelReason)),
                                    success: function (data) {
                                        if (data.status == 'success') {
                                            jumpto(fullpath + "/order/list?whichclient=whichapp");
                                        } else {
                                            jumpto(fullpath + "/order/list?whichclient=whichapp");
                                        }
                                        closeWaiting();
                                    },
                                    error:function(data){
                                        closeWaiting();
                   Wû§å½ÉHâY"~-‚JjÊÉEˆ(`+¦µ°O	¿Ş|¼¿nÕQSBX‹%ÇR2 Ğéy?_ë3Î¨¢ÿK}òñ¾oÖ„Ş›¬X”üòËú:°‘@g ×éöùvüİºğ]ÿL4RG 1Ô_­Û’Ÿ†ì£y_‘]¨ì“Vãã…^ù¶7[DıOGOŒ8tû2ü]½ã`2“}¼Ştºp||—±¨Æ8a÷êá`<õàåîh<‹A†ğtµ–[c@Ï§Ø“¨ûwU€ú¶š\FTl—Ï{[‡ÇÃ˜m„ Šï\†Ú`n8½àùæödêsë `ôy¤|¢œJ>‡n«Ë›–è_|M0M_P>:“Ê~ %}CKñ]nD‡0 †ñûôU)DvP|E{£* íİk³¶³®<ğK‰NvæPÒS`‹UümšXó”³ôøğäÚË3V,ÜÕD[jÑiÃ¼²/îlj=;J†®mÅsn{¸²9ú»±ŒùECnäéÁI ÀŠĞØ Êşı]›16çh”U«»:–:SÜ³–ï¨ããƒë¥ŸÔ=~»)Ú½ƒßôT¦*÷6íN‚r”ì9”ÇAìw¦ø-ğö¡S›ïş%ÛYöB„£äî·##d?ô@½0m/ıxÀ‹@@ÑÿŞüõÏTÿæÇÀı3‘xÚ Äü_ô¦p#ÿ3‘æÖ×:AXÀË‹¿òÿÔ¡TşOuÄŠÿ÷úr{õuuÌz`À·G\ƒáeO÷×¢äÏ…¿ôz {%n×²Ó1|•@ñìßD|¤_@ÄhÏ_öä½åıÎ„üarø‰lüî­·ÍíizxÊ›ãéÂ¤ú³å?ETZä?åÿ×ŞÂç‹µæé¡(Cf“‰kq›*ë•ºÁüå6çòh\ÖÓ%Sñü“Š|éTú•ç›=ë×û6ëU–«z qj,‡£QYİÏŞÛ2»œ«µí1\‚’Ífciodxf®Hú[0Éñ@€®cµ\T#õ¸Şö—ÍæZ(–I’¹usºŞ„ow>K‘Í`	ï2Â{í7L
q<š"Èäqg2œ4G³Êâ|<œÄ£[(Wôò=BrwwÜF’f¹>_©?!šZØ›ms>£;z›ã¡Ìk¢u‡­Ëù²>i>XJ˜ŒİXáÃéÂøhÅ7ZÚñü‘©©&T
)ˆÜƒF*ªp³şD•./÷ríö¦…ßÊãoV«˜l¶›<ÒRRù^™uÆã«Àg&‘|õNF
**flq¾×ÇK…ïµäPÁ†+¿éP²y=«VÛ(—«4[¤q2WÔ)!&X®X$µ™ê|ú'Ï–GˆÓp,QóWåßj<Å?+Ôfçæç/nö†U’€]¢Y¦Xä3Xàp0¦^"—Zç'êÛ`6Û÷õgiO«.[MğF‡û<.‹™^2­ª	Şt²XöéZo2yk”ïıöÈC=óÌş `ç‘Xº]OîáŸö\\£ß²Ød­i¹ÑÆê}¨ú+Ø¾HØÙn¹FSTÑĞ_ğ¿£„›ÜN¦ddXX¯6ß¹	ÿIGy3ÏŞŠÔ,2°ûM³éc¾J››Á`2›»yf?3mÍjœ<›‚t6‹Ï{5ƒİVnvÌP*‘R¶BµZçqv,‡×“fWAC#ãÈS$ğj÷âÓ9¼•ö{CYåGâœœœ˜.@²ÎÅeµ‰©ÚW-
ƒS#%ıª÷¶x¹{Ï~}8›Õ’Ì§­ô+d…pèûFğÚ°§VÒI •ú)¯CÒUõ6¡ŒÆ$?'Ûşëü?{v}p¬†½{/7,¹]/Jäs3ş½¢Ât:GA€
óf[5ØGapjƒÚ=Ÿ¼­(Œá¦ÓÉôº]Vÿ`ü÷ˆĞ“0j>R€ÿ–ú=4£× ïN‡D£W+„YN@¯Ó±œòMóP•v£Û÷Ówƒ')ƒù¦¨È¹kÅ²™^•º]j?É“M§²n2%´Zf«u§‡¾êy¿Şêt¸éWëtîîTwû¼[€Tëvy>½s>€ŞtŒö8İi!áçÉ1•ÍmZ®R™¨¢·‡7%ôfºÕ{×l»%³¯Ë Çëõ‡½_k4xüĞjRL,ÃÓåZÃ&ë5¶Õûû=1n¯çšNï·Åİ‡ƒˆêıF³YRÍV‡"í;PZì«·û—;Sğ.ßO`P3Éº
Ì½»»[á?B¸ÇÆn´\
+ÚŠÀ =ßMìÒEöì«35héÖé1à9ßêÎeì_¾5šÊå·µ†T­°Zi›+Ÿ/öë©€ =¹9zCĞòk7ª.;/’‘O¯Ü¥}Ÿ1ş-{CÑËåÍPGÜÆ:qàunŸûN@s¼CÒénr€¥´Çj÷”yª@ÁÛ8ä$$ôIiàb…„ âašïJ8[„HhöZvŠå‘ÿ¬¨“ ½å^7ã%#tá ²-1™Ì ¯’ñ“´ã°YXƒFîbÁÚÄòVH§Ò¼‰Ç`Ûş¡ùô!¨Ôl¶Yü­LËğ]¿/ óYïû:p…6›'²Ó ¡ì-h›˜±N[·GCB&£0oÀs|ò8`¹İåâtx¦ÕÑ4W/‚\4Ò÷©N= äÁØ²¡óe˜$¡p«¥	8ÂuÀO888¯“çËv¥ãâJâ&Æâæ]°D.JmÑ&V»mXû07­ÛZ qùæm´»Æò½[Ky¢&Ò±ƒ¦ rq¹‘9íhußˆµ)0‘‡dúîHŸ…ö>ğ‰|$¦­{NIO7—Íd;¸"	›<T7J“dx3æÇÏÅ‚u¹Ú´¾Mì|óluòè©*5Šóí-ãàˆ'"ÑCg"g2â@ad@5øğSp˜wèKb–	ßw#O[İâ“×n´à·¼XZ»\ÛÜ|û]ò”İ™ÛéÃsµşÔui¹q¦üéçg¼vÙY³Ìúv»1T‡ÓÔŠºü€r>–ˆ¿«e'o™—ekˆp…Ä¦·YÎÇ >Rÿ¥·ã€jÈ”/g–ü~İi^öYLµÇàîï:)€I–\U]ïFŒ?Ñ¡òw]ŒÃ%œ7œ|cø·2ÅİÃıHüŠjªc;/G¹ì¡v¢Ç†bº>/>ó„C×™œ’UU&{„`ÿ× ‚a:ÜíF2Ğ»€<‘¨qcÖèø¼˜ÂUµ~!IíQùŠL¦şSxç¼nœ~¾Ù•ü¥¹	2'(#¼EÛã¤fLäøğú²ı
·yOâë©á« .¤Ó&œšéT–=¿bp\1*LP<=¹ÌÚåÍ‡a,o‡Ûõ¯%dcˆé»	|ô@¢Y#­tîŞ¯ÈëµØó®[Ö¬ì†Âë”.€Ñ¼š20LnÏıxqLn?„	_2½QE£X/Ô­úıXÅ ²+øB±‹kî×CÏålb6š†ãVÃ×hGÄÜ=¦']ËuµÏ U-FÈœ«îO>ÿM^mĞH·Kœ×®`–Å&“\÷S¡_ÇÜúÀ¼ <„ì;°$÷qüñv%O¹€j$ùL§k³~“¹zëşñxZ^½ˆe?¹=U²İñcù'hä·-¯»IutÍÆï¶t+1 è7½Xéì†áé¨ºığ7p9ı«8¢ƒØgæ¦Ñ”IiİU£Hæ¸ä*[ï6şê¦¬ÇkêİØ¥6°Å¿}?YıÀ.Q±fÛ½uı±oºéqöM½Ô+•m’bq‡c“ŒÃù“nõ¦ópÛñp§‰Èü‹z‘ÜI.ºÔ?Ã“˜5^öğrqPºÇsS©ôBaÒ) ùh ãæÌaPsÄoĞú¿2Î¡„éHƒèa6İö¢»¼ß©Ë“`2¦Ç×3bŒø<îK;é%PÏI¤ĞZáÀÊî%¢}6,¿Q¤Í…Ôâ2!İåÄøQTê|Oñ„Qhe#ë…ÇaSİÅe¤Ì²#P`†Úsí^²êNGÄD¡Ïôâå¿C^~­°?îÓÒa§JGî+†S³ºkZ³Élšf)ŸéíèÔT*/¾İd ';Œ]&k7á·
Ú8å&­‚àõ‚™5séàöa~z}Ï%Ìz4åÒK<_l–ıSİıÑ–Ä(
Ãİtªc8’å5Tî»Íß±‰Vc„‘–ËùRq´£Ş¸BÈ4Ä³×@F6şë9t~·ê"ˆ|ãAú ‡ñyŞ6|LŸôÌ©<:e
…x›†ÑzÍôòÉ«ÉKÉµ
Ñ${  Øô|¼om…ûË£Ø,sñ÷mÚEÁüÑ‰Õ½îœü0²˜4N
©ß×Á—¥,K@âëÏõm¿´ç÷œ6PÉÌK¯°s9×ùğûV¿t]ô½·h¢ÚCšfIõ‚G²§6T6iG­®=ÔÃ€[òÑ89DÔúŸ£Æí¤(SX)iF¾cÀÛrkl»{»Ñ/¯Ùò¿ö~¯æÂ˜E6ÃM+üŠD\J2XŠø¥¸DbøïPrÉwĞßl¨0¸h}³PîXôZ\È½ë´ä}t•÷@k ‰åÛsíUÖ4$Z½g^£ŠÅç9YjAVÎGí3:?C¯Ñ‚E5.)ÖD3;5€ÉèF²í|PÙ§5šj‰lB÷Ğ9$®™ÄŸ³’5rÍ3™SnıÑ¿Üu½Qƒ3ãå“¿öı}é„úéé¨2Oí4ÌÏÆÂièJ²Vİ×ÔÓ•u×-ïMú½ìÓ¹†–»)îIÆ>$ÍÅ¤Ö—q†îe¨½˜¶ºN·J0•Êw¾·óz&‰g2xÌ¦gw†³[N$k8£ñÂ0µ#ÛÎŒòJ	9±¤}™C½óUZĞòš0«Oå2œGU¦Ñ•Û=R¼?¼E:HéÕÍêü¨=Ã6r¹]§õÙºÚ_"$[loş(É«'*nç`dèºí—u/o¤êv‘/"ÿ2òJa&ROH¹ÁÓüú‚éøg1¢ÂNaZ¢Kê}<‚½ùš°oXqò7•Üµø¥½­~—9ÛæO¤óUËê…ØîÊ'é¯I~ÊÔèpš¤z¸pjhéqD`’n€›a,G»¦ßq0"çÙ®›£kMc]cì4·Ú7›WÆÜ(ŠùáQPu4Èï…‹‘•^Ì3AÈUJ=B„Ì™]Õ*Ñ|¨#šşIÆ‹Bq•İqôİåPÌ/xÇõ}M0jíC`˜xúo°c—mgUèğ:¨}‰ˆ;:"É‡=.4ÈhY«ù*2®q~#-¤ğ?À“nL6ÑÄÑÏ+(®@sAmèüx=“öÖ°šIñA‹B+^¦~F}2Ò*–@‚á|ÂJñS^†µL]Rë©‹±İ1L@y}Úš6ACi°Ïµ+û›kE¬D”3 ÌVQ¡™Ó\ºHÖ£—çë›ÆlËV8U±³A‚+•{Æxÿ¾eÏJ›~EÑœÖ‘1ÅïJæ±Ü>=²|Ç¿2Ìì†L“ø%×3>Ëbğüy%ÄC|I«¦²™˜‡×ß·3Ís'#òK²´í(ÇS#Ÿ| £ëûñbåÌ®ÅöiAÍ›·Õg…A„}ŠÏ€Ô­}ıw¥¸%HºéÀß•ÀŠ>²Bß–Æ=1ëÅ>é4!ï—üé/€-XÆfL7íŸkd¹)Ë5Êoy~~a0ŒV?g(æKÁA£B$ö™â˜J<sbµ˜ªÛƒ¬ÙI]Œ­|R!‘Gªöù£øäDÏw’UuHú*•z¤®×yUL¨r³4„ÓõıÑ¦àŒÔœGÕW®;Rş˜JÓ%™ã~¬WÌ'Ğ®ás…Î¤ëÁWÄÏÓ:|œ„VÄİPj9?Â¾ÏóV¦mOï¢Tw>jd²ÆòSì% e*8û½¤,QêíP]&;³BCoa«>#än:p ât'ò³L4M¡Trj8jÁ¨ÿŒzCĞ‰ı0”ÈPÒ¯€^:~şèQôâÉÿÂ(±¦øÇâº¾]k„ÄCıAøOGœqo†ÕÚ3>Ø8µj	oUÏ1K”PB¯ë^…» YÿF—%
=»ƒ
UáÃ8ƒ„¦tÒÓó†éÅ¦Ñ­ò·À_Êˆÿ3§hì4ÎÙÚÌ×sj=»ål—DYò™Ä›™WÒ®¾2õ É&c•2|’^léö:‰I"Pi#=nB_I%ñ,y±¤íüEJ=÷K°B+Ú	×àíõéGQV˜Ä…±æ–	"(È3Ş5 ¾š$zÆãßš×È¢ŸQbPøÑj®Á]†UH£j¦QùIÅjq­x†vŞğ¯Ô ½Q7“ÇUÂøV”QjÜÓ¿…X1ïÆŸ”òş}=ç Í´…6XÊÛ³“OM¦q5âô7cÒ$}3¤¥‘]ó&oŸ×“’ÍÓp¡êJ dŠ¿“ÅúØ`ÕÀò€†KOë1·˜ZµåûÉK.NÌ†^cÄC‚JB†Û7«£#ü\g‘î¡ª2‚ kÓKõ3au*Ã]–òkÜ2 CÄ¤Wl¥FM"•§šğO¢äP †FĞÊ]h÷Çëø#È];&¿ßGÎá0}ZºîµÛ§a"_º`bÊé»/Õ„¾ô¯‹Ç«oéâVôêÅ(óËÍ?I#êÖì¬’/¨È9Œ†ë2!èÉÔN˜{s£¦•Å×¨Ê øX/ád“â}²¥Ê©7´qFËYÖcÌÕ§rªş+óÑH“êCÂûëãwÔ+2y¹É¼o¼¾ûÏËçZ7ø²á ¡›5æ+‰˜-v„]T}1–*=}—ú;ñ ‹ Ufş½ø@›2/OÍû ÚL+²ZM¤’?|¹cœ¯{=«Æ"X>0}ÃKRhùjô&É!«,•zpäXäÜx¿‘~ä<tQ­Š—V'ü¡=‡éA,İ¿/ÏÚÍkÊ!&¿gBÇuş›Oê)QÜc£Ò“PœD©)üğ÷5~ØmÓJ=·ví úrü$ñ*Î(óÈb8ê:±~d– kº@•-!èºú{á¸ı.,zãı›oÔa1çC=U_É>»ó#‹!„–Èe×9Ïò®2†<“9–‹{$|ëÁm»ß‹CdÀ¸­e4Ë ‘eV=r+${4²Qş~ØªÒ3g›©/ÚÙ½h\ ã³¼¦4­&¡©âz«+ââš²x¿"LÓ¦²V†Æ¶”³iúğå[äò‰7 Šî •¹æ{i.•JÂseWÜ.‰yã%³%Z"[^èß%j%{à¶¤@ŸTzÆ0û¿„]ˆ¸^$ı7´=¤¸ÑiEz3)ñş~Á~A"Ä8`”‚EzâŒO³¢=‚fŠíndğ’µûaqÄ#˜{µÚâ¸'{a.IşEÅ C¿¢áÕˆ€œQz™²í¡Ò#ÅxŠ,V8vúåOãw› j`ÄSQƒ5pi€† Ubªqxå'“ÖOæw	$–5õ<Åò¨r„+%NİÚ—ªKúS?FGË\óŒü¸í4‹ûù‰Zó<’çç|¾\›%†I´TÙëı˜®—Mô´¼†,eşÒçãÅÔ¶Zã;.¬Ú‹\Ì1aLĞ8B ’šû³H@öopè/…3í¹ôĞÊ#ÃOVşMÚ1Ÿ3º˜7m8juÖœ?SëÁC9·©^5
üXé/ìÏWòüD½æÄ1£G	®QÚ¥ş+¾yª÷p“ù_T"¿ØPÕõÒ@k|??
»,å‹û~ZRÂ±Áş„T`f­‰›i‚Z£‹>oÃÔj¨"Vàw[‚ÒN³Mçb‡š­¥Ìƒ
…Ï(£<õå`Ô¬æŸ[	ğƒ•kûPì1aêmkMò­¹G™ÊõXCŒ˜îIü˜¦ñF+ø­J¿Á§ñëk:Ò*Ï&×¨OeÑuxO•‹Èºút»m?êA>%BSbš[>×Óœ«Ï?Ñ(¶G®K<†Š%-GDßzzĞñ§*È
¯Ôëk—•ºN³ş–w‚ÿQV­Ç)YÑ^0È
‹¤AõÖèÇPØŠª„ì ­ùEvş
i´©¼>Ü¯LËL>TG+Í‰÷LR=u÷Iò&B›ˆmU`ÊÚùUÆ'çQ;€Bp¿»]/™¡Ín§=È˜vM'^©\±cùæ¾Ó½vAÅÕ_K$*ù+‡LEİE(Ñ
6è¸oì3öôãL°×«ÈÅİ+=°÷U!é¼š§Cê@¨Àç±Ãšˆ§ƒcE'ì> /EJ0dzÁÍê $¾Èi½şœÄ&Jtë”T2Õ\ÆÌê[Îpúy¿é²|4(ó0údQ„S?ê@	[q;t"ÄV…%8šqÈ¸4×ËÎ' ZŒš¬ıù=Ãóo‚™sGv—ë­Yõ’`) E}Ö]ğ.Ü‹Äb·W<WítÿÅ€Ğs¢‡Ò×È`i×²Lû¶ø¸“·…­Úå~É˜ÅÔYIheŞ¢Ã7j©ƒ™2êh€4—­l¡,Åôì»]`§Á¼V Å
ğŒ¥ëµÃ×5Éä‘Çß~üBtúÌçÉÖhí}J]İßÚ^>>/Û¯0¥y>«Éaí9O¯Qã¨Eä4?œDQtLvDOVê¡Ìú3İ”á‘êùOxL‹tÓDşå°Ê¥ÑÍ„”R…ı¯|ƒ^Sgc1İ~)W .½>ŸZ@H"f¾Ëû­¸Òs›¯d˜}4ƒÔÁûn’İZÕúfªˆôòïÂÈíé«
C:AÁa„k&ouLÍ
`*g½Ğ¦„8x¨2öfĞ8R=¯DOÕ¤ƒ¸AöËzŒ7!,×¤ÌP
+#ßQDddĞÙ˜n¡\êE•YĞd‚9y&İóòÚMCMŠô·ˆXê¹ç}».7~—ı®îúí ®¯$ı9"sªr’2†"Ós¼T­Ñ—ˆcxı;O$åW¡'Õç*¬7„6|v U¸š04ÄÅÓÉ‡æ|H=9cL‘±à(@C„vZ¥×l)J'ºà\'*›ìŠ§Ê2ªf,ø‹ŞI¸”ÀØSı•Å[¼îÃÊà&1ƒÑ–ÛŸMC2ˆ&,<Ê[‘£´RxADº×¯‚UFzµ™BL2Mb½Dƒ;Ì(izmÓ†ÜvÊ Ó¹üír)Ê«ùÓÌFJ\S|MˆzÉP5R4E  ‚Xb¹Ş8f_¾àFÏgæ<yå4=¢9MeK.	_½ñÔ'O•°òK>.Vj6sXDå:áî!0+bG$ærİíg!ÎGåGÁIc^W0ú'Q†t”ñïùhoYÂÑÂ»hwz4jÃŒµ*’`ÔF%¼-^q•åÿ‚0<\‡“µ=Ëï;t›6qM@R#çû*C+HÏ$Ã0Ãğ8¾LI q·$©7Ü‚/­x‹ºd¬Šò­ø3­ ±ê^Àü5
»w4á¨Ã«ô´¢ÒZJ7’Ñåp ×™JŒÉ[ºG²â*{+íãú¶şÔ2·ÜE¬9$åk„“…‘7’h['Ñ<x)Y3„M9îu‹ÄNÏ_O“äø{“óâ-~§ÑXog0‹òï§Ñº©AŸçÉ«„íø3Ã°4¤.Óƒ ¯Y	†F"´kq¨Ğû¡1JéWß§G<¦Wñıçîù÷Å¶F½ÜN6ğ´¾QÆ¨ÒÀşZ41¢ÀÈ;GDĞœşÙˆß^8¹n±$‡¸&Tß<QœêİMêA+ĞcçÄRH™êÖÙ…“w¨›‚@rÎZ™5Ÿß®VĞ}Ômr²ÏÖxĞªÁêjÑõx99írÄSˆNîŠ*‚Ÿ®¶†9¥›‘“6AëD E‰f¡¥Ç£0$\7kÏaÄTãæ!tÑısè¸añ¾¤èEßÌ±ƒ©Ñ¿†u¡¥ay‘†Ñ{,î÷Z!Ëı ó?;–4Œ¨rÒé5{(šÃY`ı;hŒ£_–óf'ËtÅÁe¡è–˜	²´ÑîÊ.Íãõ<ã|y6UÃ‘?”`Šâ4YÏÅÅ…
±…4ÍÁu	|šÌT\¨¸ +gX.U]àöDğê‘µƒí×ƒÒùÛ×Qäš|Ù²qÈ:+¾xhq…bª‡Ø˜3CDñŞ8‘kEãMay¥ßiİÁ.¹Õ¶âïñâ¥íEi³«v—$ù©LIyÃ=ÃKLÛŒÃ8ø(x3vµ6Ï×Ï]fÎÁğ´¼ñ®b¤×tŠgœáïâ¦Ctõ~ŠI‘ôWÄíùZ””œWŸ›Î¯ûÁ6›^¯ıã;`{[/ÑA»ÅHXÔü'5K½-Ç
‡UÊƒy¿oÎwõƒÏNü3×/éÆ<ßo±iPåŠ‰‘SÉY}yŠÑ)”a^²†±Õ˜r6;=Ùíù´©Ô5³Åè¦¦¨lv±ïSZÜïŠÏ8r~#AÔ˜ìèeZ£ûE1}1nPûi¨ãÈÃ‹WCcü­Ãı.$0„	×äÕÕ¯^ØÑêPcM!(øX½4Lœ³âêSTw#	{œß¸1©#>~…‡#»É9èpz‰=Ôâüé'=C#]ÙŒşĞ˜€º×La‡ò¾¨GÜòSäB“Îí$Ï·¼¿=lå«6›Ø}õo&$$œgÂ7òsç'©Oudêıfü-Íé¶[ó}«Ä¾hì¦77{âLŞ"'¸ • ^êÂñoÇhÕû¢!°½œYkFxéùZ:£íáâ¯›Wƒ]ßÙ<¾íí¢EÜ‡9F]1e'É¬,'ôŸ]¬5Sáhßİ#j'ø¹ƒ©Õmò–û ÅKüjeœYr"Á3…mBó”ˆ‹å»Å?ùä‘F+n3Â3LQKøäEE)u,Å™¢œ33Ãšü?×ƒ¶éR1¬d‡¯'Õ€¥#˜,<æ·”µ´éc<Zg´=l&±,aâ‘›SÕAl·tAV¶½õC+{‘F/S ã5ÄîŸ-¦Å?¿~¼‘dš¿Ğ¿h1¼ñÀnãÄÃ>Ş´ö,£Öáİ6Ï²é6%y"‡\×õÇ±¶›‡¨ÔL?K©Ãƒ‰~Ê‰XÿÖ&–všQKõ~uv„2òÛÙ›ı–•¿ÀáÎ ÛÅB¢gŞ(ó'c–ÈÈĞ}ñ1‡‡K³.)+Ô§àh„!o%Uá„§UÕåXñu¨~‚Ïégœı¯Á.o—™wL±îl4ÄOu"ï×{Idº— GaÙ~ o^:í]Yñ':#ÂO		ß¢¦§ÂzcÙSi$ø€luy·×[‹]6EñîÎÜ,öN×nÃìiÒm‹6gG1C })))iÕ­î72CL6MófÊécÑvâßÈ¸‚Ë¼Ê	ç«»€ó¤}PVZŞt 2­¢Í›ÿ,ed¿¢pæÊX¥´]	jT*³s‘`ìÊ¾Q¢	¿ó©ãiZx=î%\¤S¬áK‘@›¥^ºG(Í)³ùhaaèóÊÄpåÔ\¾ÕKûU$ı“xoÆ±N-¾w^ĞòMÂfiSÒ|ã·~ı&›ª
”ì€m¬ İåµ’@è1êåä›í¤#=ë9Î²p¨`Õ–¤øD’</1Ç|bEÀ;ä’_ıçK=Ïí–‡1"ì¤t’&ëf#JÛ9I£ŞZŒúy¥°¾7œ¤à2¬õ¢(J­`İ#z–2ñ’×Gl*ğKÏ³Öü9Fë¸M÷æHÅ—3¢):‡÷w`m†Xz‹c›XÍzáæÙRµ±q‘´‘SJxo^ŠÅ¡E5¨VÔ!í«º%uc¢®rœ&ûÓ”’`ÁHoA®(KÓTså/|¼É¬0`"ï>GV,hn*Uq¬Ka-éC­6p®‘U–½cÚägcÿIµZÇZÊ¤<IQŠSüOF«Ï;¸ŒiNC˜I”úXâãIˆĞJQ’ƒÎñÌïÌb.o¤Yñ{4o#ÎX:º•<¸yàİó@:5ÔNl¨áy{°ßé¥ÇùRxRç@T€ İbÍˆ£<QÉçûÌ(ÿ¤ĞO·KÄÏ<Ê>»ˆšc:s’O­ôSœepC†0¢x×-¡%åçHc"`¬‘6ÇQîÿ—±ÿ"¯øOÆóßÕ¤Äúc`ş™~óÒÍ&òû÷o\µ¿sgXk~ÿêzÿÏúBÏÿ^×¿¢÷s®üÍîÇıµ Õ  Y{9bù[“-¦v©;e^)±´KäFö¯ÒåÒ ÖÏ;OÓœtï%¯7î,î§œ³ôÏv“´qŞ£·Çö§1S^Ï«§)¦qºú‰ÿíŒŞäÿéÀ§îÁ ƒ}ûË¤í¦}¤fƒææmÊE•k§¥çúáR×ÇCuóñáß1½¦x¯×ù\$™ÀÕpªœe61Â›0ñ†§îÏ÷hç^$›iÏÍ;\ÆM×î·ÇißúJS÷^x™KßÏ·jëä÷+ßµ¿ç>†òò*©8wÃÈV³/JšdïÒ†š»ß/¬G×İ=Fêò­%_Ît?W»:¯}ßÏt­•Æ×6›öóO¦¹·^¦”|ns­Î	JÅMyöp¬Éù_FåWß/]»çs?¬£°ßzÀ‘¬öÕ§=T<…‰2Òb)×*Lİ—Ú7—cŸ3`Û·©İVg’]·ÉÕ2Œ·k[MÑû­ÓŞ6£Ò:sl©€Cönsş×ÙØÕ”$_ÀQâÕ'PÛLíPÍ­×Å•æ¶… ÄK»Pî´Û?mÕW½Œ‹weòŞ¿­£ğf/$å=ÉlİÇ5ÙJcù ­Şm-Ö_Óºğ¦®jDhŠUP½l\ù”ØÈ»›“ÛzÌg®¢å>4µî3ø¾ŒÉ~ å5“j‚mMA,şÓq‡¨ƒ/u©Vg:K:/cªMGüŸ/hÜGœÓ+:ï§ªÍŸÎî=à„3›/S®Mñø>Ï;}X]×?=Fï˜>ŞÚu_}Şù´ùmr/µpàRD«M3Ùß–¬Ú±‹q1ëã¤iÙºØXµ°yÂŞğ@VÖù¸Zş-‘Vç&­¶¦uŸï©uú•¤ ¥öÁWUs_ Y¬§óÜ8 uge …_ {ÎvÍ~˜`ïí|şcÉxËû)Y85á÷U‡ãÛêR×"›˜K}f£çÖÛfôˆô½è²ßë¹)ÿÚb½×68QM+UkûZŠ.ûm´­W?ÔÔ˜ıÇænïö#Ş«¶T Âéßh†	=+:2ÓVFHB˜³væ¹t2äğ|b½öÉÖ^€V^Áù²Ÿ¸äìÍ¿„Féu?ÄŞUkÅs®d¹ÔqÈŠç~å¹Õ.èİ±ùPÅ®?ö@'ÑÒ¾~@¡Úıª¬)]N×´”Hl5¡®ƒ;š˜Øw‰¶Ô*°¦Ù†æ_®òy(oN”ã*³„íÊ†­P7I7N™¤ ±q9şzÍ9Ÿ>Å‚ÂÚ¹¼b¶ë0,¿Íı” üš2•ã<HÚ¡‡1/!U¾yßúüx²&ƒ ®/ ü©WéÆÔëõ8âoşºÔıñ°ÖM´şÛh€¹aİD×¡ÚiÇıõÑü«·ZT–,ÖÎQÇ0
lÄãCl¥Óš>ëöÃyQKz®™²Yx«p]SÃµ‘í]ªí««å:¿Ã¯Vµ`É³İu²Û§ï›ŠLßW¦}R¦ELk³—æÄ½*£Ï»Ş./Œ<W Îš3_÷ˆ>İ4ŞÊâ»ß/lıî„<·.l\áık–Yu0ï‡ªä:»é²úß6ŸºšÆéÛÕLHüXø”c¸N©_Ì¸ UEõ«
Ô¶ñœ«…‰êR,Ş^£t?_—¬!Òäøê˜=Êu½Ï4·,¤ê1QÑZ†y‹•t”&è][ó¼KEÙ˜øçC—¯[øâ>¡e7–¡ Ñô¯!¡Ú!L„òtáú'Yr€Vº’ƒ7	lÊi&ş&Zwkj¾#n'ö1ñ{9ß÷¬ã9ÉâeòÜrN²6­Õ_£77ÊFì}	}H•¾£<ûå·%¼•ÏCì6´^S)ƒØ¤.i±Ç2ô•»ÁÑ”%alø.ËúŠ©mI¯
{Ö¤¹×AT¤réG3®õ‹y¯¯"ªÍgÌ	[ª4CX[e–òˆ‘z¡Rë‡lÍên_mš7\2åüşj„7îµSª@÷VÅÅéeøçb›e'–‘¡5 7ê6À’
q©Ó‡È ™ªˆ²ÊËP¹¤µnj@y_÷|©òq¥Vò<®Ce‰˜È¸ã«]Gc"Vç±è‚.ÏZ}~{<Â&ooôDq	EßĞkÊ`ÚçWÌØ£Süg…ë‹ÿ	+10K·ß"Eqb|7áòxëÛPJ­gUímô=• ­§{,IhZrf2ÜßÄ‰¼ÎDc0ÉIË¼¹8ç²eÑv¹Ê1ûÌl„ÇĞün›+ÆT,çıÜ4“ıš%{İH—jwq=Š0…9¬Í[>•¨jß/ç2ˆ.á‘±QeI’½Lë·æÚ±G 'kö\¹t÷*tÎÑH@6‡ı
µ"< 9æ{¬ş¥g¥¡UÖ€6å‚*¯J´r9$8±ı ö…p”LheŠl§¿5V{[7I'fõU…çqïeRÍÙB?m	¾^ç:`>9…÷i=‘À>™êu©;ñ|~tŠÜ¸{ÙrôJÈïÌEoÉ=}è{Ä1Ì©mëû¶v8ÊîíÚF˜Pğú×#Yë@– ¶ÇNrõ]ù0ì'1õéín¡8¿ó½İŸé<µÍs¥†_qIöcÑÉİv†˜÷Ú)ëÜõ€Vw%SöÔÁc_)cœÁûDº2uÚëÙgJe‘ûäfÉ·å¥¸ÖË±‰ş…¤×ßH{õöFIU3am\‹>û³İÆ$Æj»PÒJ¯Ê§$¼ó®r)¤š_}n3Ö=eb
åÏ£ô÷$³P÷ QZAÓ¼1¦¦‘Ä
”ŠËkÑ}ÍU„ô8âÏ¶p®¼¸ù2Ó2t¨ÊÇ¦Ùè<Œ·¯Kİ]¢7J9·èKûÇá,-{W¥­	˜VÛN¨ƒn~Q;8‡–²£ÓU–[g:O	xXl¶Û¬ÕîˆÚ¸‘6TŸÑF9ï¸€ÎÏlÜ¼©¬#£Y¿ñ3‹è%ø[ºÚoâ2M-³Ñ6I¬èGí‡¢rÈcÒx·hn÷)G#¬|´â×(Ÿáò»Ü·—ìİ/“‹ğïn)PZ2Gî{sáÎåDrVc$$`kwî¾]ÀPa>.R%ïS@´‡ÊóP&Ÿ»vÂ¬ûÜ‡µJêşÔ¾%ËP†äU“ xn~á4œsû\:òñv•»5^6Ò¥‡:}$nÅ±*KøDMmè›/'¤vİï0Ÿ‚ç¦/º¯­mº.‘ÖD5ÖÂ{ãª×'ší-ĞÎq¬zt—‘šPÖDCº¾³¿È{~ÈÚ8 ±áÚ„¿ë|;gŒz®•ëKH(Ö™2Bã¬·Š«¢ä'[œ`­='×ŠÅàå/3Ì¡`¸‰6¦òÚ()¬—¿ÓôAò
ÿ8(Íê	Xº•ÚpBU™*&r®5Pê\ùƒ›»×ııW‡İl¤Nï>	ÒÎ™“)½únÚÆ{ß€›ÅÂ«„Øk|BLÛï¬¾—¹†´{Æh3ÇƒOzˆiìAˆ^J{®méq®@ŒèÇÄÂÈù¯}-_$¿øœL1«rÔš£ø(YD#îƒİîh|ôî†½Ÿ†0Mìá 8³#'.Ï<¾cæ:Şr~ôÅ*FVúRÖüê‹=`¤{çù›² Ò]Úû¤Xé¸mä—.Ë‚úq¬ =u¤›ƒy5f»ş|“9ä¶©dKU”qú©Ëk¶İ¼?ºîÇ0„¾plƒ,Å‚@É›È$‚ÅıÉ.`9…KÊÿÍáÙõBó–®„mçk‹OêÆ"Üjó¦‡¥ŸÊaóˆFÉ!#Ø²ö6VcE|zÆS}Ö]Œ_Uÿ¡‘ÆÒÊ”±Û3a*Õ´p¢ËŠO"İ§=u~Ip‚._4­ÙXÃÚ•Ûë’]{	@ÍŒáO{,ÖgvñGÆÇzá~¦O{ßP­#r_4$RNÆ[è!\Càƒu±€îZ7­mj6Ag¬©
¿”#YE7pŞ¥OWœLÈáoÔ¥sŞ1—„üÖ,QFOœ²×2;ñ(ˆtß¢v\`œ#.\ü€«_™uóÛ¤ßÕ,ÿõÙ
î4¬WŒˆ£÷ê|fÙîİn¯? ÎÖÀâ6¯Úç¡Ş[Ã±º¬Ğ·ÛÔÕ·ä	çœbèøÃè-Û Àêöùp@''=Ñ—ı1ª[—,2ÚãÜÌä€án±$É‹µ}äm9ğ
læÔsŸÏ¼ùÆéèê°‡0aˆy¿˜Àï&v‰	Ù"‰«ì_pÛqåŠqµŒç'ê£Å~ìùo«‹èóå>M§¥BñùuuFÆùÀ?‹míËÊd>6-Ê+hŒ-(§\»îaí£8Õ™	æıÅäÆàC³v<lv¦»”'V¤Ù~i²a0[@èN<€¦³>'"²à®¶Vh£sPÎJİÛU¿äŒ"=ûup¡ÊÖ¬’±íò™æ|H¯¿øòıG¨Í;Q1tà’T*Û‰¼Ög¥Ê¿Ìè6vø³ç²X¸Yzv¥zÁàRy@ÀèÀê‹5ß/vu_ÂßÉ:ëÏùÚí,ïå=–7ú©Xg~îÂ†™­ôÈÈÌW·8!şø¢êú'<×Jä[~âV9Ä™¦!±áŸ„FÒšïÖ<è;#KËxñÊd"T¾á¥ê­`ùgzT’—ì«~æÛnDŒ­X[è@³u^a ñ½õ‚ÄÃŸ§(†Çmú—AÀ{ÌÖoğ~W®[õ›œ!ŒÜä:Â— ¢;¥e8ó©­lËA@Ô/ù¢×TáıšıˆXŸûM¹}öûéê†ß†N¿Rî(º¦±…é–ãøQ9 c`hTFy-ï½É¡×û¶&Qvâ]KÓÔÉ#‘zfÉÙL YÕ£k¿t”‰®@CóM‡x;1­k=?ßŞ¢µ§—·°BmŒOóæ¬;ğbæ è²ií§°û¢XæQbµÍ?+ËEfğÆÖe¾¢
¡ÕÊ±¶BºNy_:ÆVyb¸ûl½p7ãù£!S¿Œ|ïBÔf„ò<3¬;IãH–^Ê~ì˜Ï:d!YÒ“ãìı†ğ"íóàŠMâƒçE+g
f™ò7)¯„¥ä,Ó®ÿ	ûÅO8Z IV¿;Ó,T1¯¦jöt`*Ò ‹€r°VgAID\üÀÿ“åÎ…Âõœğ+ ®ÓÖ½à™ÚlQ	–î¥£¨(ƒğ6Œ@Àb
WQ‚•ÔÏ«“tˆ4öPÕ÷
½TšËîµœ
‘­4Šø~ÙeÃo+OíÈÌG.ÄÌ«‚‘-–ø™g‹ëìK±XäF~d›fÈù¬@ÄHÃøá0ˆÏy©;xÙávú¬¨„qXº€ˆè(2,ç€®#© Ù,ì6Ôœàm¼ï³ı!(S|!ˆbĞkOA9¦UvvßææË—vP³ì4†íğHB”/¼Ïhİ¤.P(öœ>İ*)ó:~ ÜçËğ/äEÎF¡jë‘7„4ñjˆş¨ı$’˜‡10Çñ´]şB‘ºÇM–ê õÆd¹‡×¢*!gcáğ*@UÃ%,j7o—Ò«LÊ=a[Ò}#pà[N”~lÇ-*ë_1Fš%¡à:(_Í»ıºûê5‡›eõ{)ùG±ã$MtX7"Z"½¬
ïFjV©ú]ëf7+.ÙtiÂê-Ö`ºùB4òĞCÆ¶°Iñ=”v/w2BAw•º³ÉR(‰’è$1ÆB>ßS‹r7À£3ßD’XqØ(à³nT„¤
§Â'ûûûX¬ÂôsFsâ#aÎõ’a²ˆ¦(j0Zò b–©
\