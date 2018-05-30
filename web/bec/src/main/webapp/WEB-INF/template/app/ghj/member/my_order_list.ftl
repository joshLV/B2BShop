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

    /*新加样式  12-31*/
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
<div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
<div class="mtit">我的订单</div>
<div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>


<div class="mui-content" id="content" style="padding-bottom:50px; margin-top: 48px;">
    <div class="myorder" style="margin-top: 16px;">
<#--新做订单列表-->


    <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
        <ul class="order-filter" style="width:100%;overflow: auto;height: 40px;" >
            <li id="arrowleft" class="arrow" style="width: 20px;position:fixed;left: 0;display: none;"><span class="mui-icon mui-icon-arrowleft" style="margin-top: 9px;font-size: 20px;"></span></li>
            <li id="all"><a name="all" class="mui-control-item <#if ! orderStates?exists>current</#if>" href="javascript:;">全部</a></li>
            <li id="wait_buyer_pay"><a name="wait_buyer_pay" class="mui-control-item <#if orderStates=="wait_buyer_pay">current</#if>" href="javascript:;">待付款<em>(${orderFuKuanCount})</em></a></li>
            <li id="wait_seller_send_goods"><a name="wait_seller_send_goods" class="mui-control-item <#if orderStates=="wait_seller_send_goods">current</#if>" href="javascript:;">待发货<em>(${orderFaHuoCount})</em></a></li>
            <li id="wait_buyer_confirm_goods"><a name="wait_buyer_confirm_goods" class="mui-control-item <#if orderStates=="wait_buyer_confirm_goods">current</#if>" href="javascript:;">待收货<em>(${orderConfirmCount})</em></a></li>
            <li id="wait_buyer_validate_goods"><a name="wait_buyer_validate_goods" class="mui-control-item <#if orderStates=="wait_buyer_validate_goods">current</#if>" href="javascript:;">待验货<em>(${orderValidateCount})</em></a></li>

            <li id="arrowright" class="arrow" style="width: 20px;position:fixed;right: 0;display: none;"><span class="mui-icon mui-icon-arrowright" style="margin-top: 9px;font-size: 20px;"></span></li>
        </ul>
        <div id="order01" class="order_list01">

        <#list orderList as order>
        <dl title="${order.orderStatus}">
            <div class="bh">
                <div style="float:left;">
                    <label><#if order.orderType == 1>众筹订单:<#else>普通订单:</#if></label>
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
            <div class="order-state"><span>收货人：${order.shipName}</span></div>
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
                <div class="tools2"><span>总计：</span><font style="color: #E4393C;">${order.totalAmount?string(priceCurrencyFormat)}</font>&nbsp;&nbsp;<span style="color: #888;">(运费：<font style="color: #E4393C;">${order.deliveryFee?string( priceCurrencyFormat )}</font>)</span>&nbsp;&nbsp;共<font style="color: #E4393C; padding: 0 2px;">${goodsCount}</font>件</div>
                <#if order.orderType == 1>
                    <div class="tools2"><span>定金：<font style="color: #E4393C;">${order.depositMoney?string( priceCurrencyFormat )}</font></div>
                </#if>
                <div class="tools">
                    <#if '${order.isRefund }'== 'N'>
                        <#if '${order.orderStatus}' == 'order_item_exception'><!--普通订单等待支付--->
                            <span style="color:#fc9836;">订单项异常，请重新购买</span>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay'>
                            <#if order.orderType == 1><!--众筹订单-->
                                    <#if '${order.payType}'== 'offlinepay'>
                                        <!--线下支付-->
                                        <a href="javascript:void(0)" onclick="offlinePayDD('${order.orderSn}','${order.id}')" class="JS_order_btn ">上传订单支付凭证</a>
                                    <#else>
                                        <!--线上支付-->
                                        <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">付&nbsp;款</a>
                                    </#if>
                            <#else><!--普通订单-->
                                <#if '${order.payType}'== 'offlinepay'>
                                    <!--线下支付-->
                                    <a href="${base}/payment/merge/offlinePay?orderSns=${order.orderSn}&whichclient=whichapp"  class="JS_order_btn ">上传订单支付凭证</a>
                                <#else>
                                    <!--线上支付-->
                                    <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">付&nbsp;款</a>
                                </#if>
                            </#if>

                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay_deposit'><!--众筹订单等待支付定金--->
                            <#if '${order.payType}'== 'offlinepay'>
                                <!--线下支付-->
                                <a href="${base}/payment/merge/offlinePay?voucherType=deposit&orderSns=${order.orderSn}&whichclient=whichapp"  class="JS_order_btn ">上传定金支付凭证</a>
                            <#else>
			                    <!--线上支付-->
                                <a href="javascript:void(0)" onclick="payDJ('${order.orderSn}', '${order.depositMoney}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">支付定金</a>
			                </#if>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                            <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')" class="JS_order_btn ">确认到货</a>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_validate_goods'>
                            <a href="javascript:void(0)" onclick="validateGoods('${order.id}','${order.handleResultStatu}')" class="JS_order_btn ">确认验货</a>

                            <#if '${order.orderType}'!= '1'>
				<#if '${order.handleResultStatu}' == '0'>
				   <a href="javascript:void(0)" onclick="complainGoods('${order.orderSn}')" class="JS_order_btn " id="complainGoods">申诉</a>
				</#if>
			    </#if>
                            <#if '${order.handleResultStatu}' != '0'> <a href="javascript:void(0)" onclick="viewComplain('${order.orderSn}')" class="JS_order_btn ">查看申诉</a></#if>

                        <#elseif '${order.orderStatus}' == 'trade_finished'>
                            <#if '${order.isReview}' == '0'>
				<#if '${order.orderType}'!= '1'>
                                <a href="javascript:void(0)" onclick="reviewOrder('${order.orderSn}', '${order.id}')" class="JS_order_btn ">评&nbsp;价</a>
				</#if>
                            <#else >
                                <label>已评价</label>
                            </#if>
                        <#elseif '${order.orderStatus}' == 'unconfirm'>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">取消订单</a>
                            </#if>
                            <#--a href="${base}/order/popupcancel/${order.id}&whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="JS_order_btn ">取消订单</a-->
                        </#if>

                        <a href="javascript:void(0)" onclick="viewOrderDetail('${order.id}')" class="JS_order_btn ">查&nbsp;看</a>
                        <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">取消订单</a>
                            </#if>
                        </#if>
                        <#if '${order.paymentStatus}'== 'paid'>
                            <#--<a href="javascript:void(0)" onclick="checkurl('${order.orderSn}','${order.id}', '${order.orderType}');" class="JS_order_btn ">退&nbsp;款</a>-->
                        </#if>
                        <#if '${order.paymentStatus}'== 'refunding'>
                            <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');" class="JS_order_btn ">确认收款</a>
                        </#if>
                        <#--<#if '${order.paymentStatus}'== 'refunded'>
                            <a href="javascript:void(0)" >退款完成</a>
                        </#if>-->
                        <#--<#if ('${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished') && order.paymentMethodName == '在线支付'>
                            <a href="javascript:;" onclick="showExpressLog('${order.id}');" class="JS_order_btn ">物流信息</a>
                        </#|�bJ��wI]>��Yj��[6n��h�v�u5L\�7^�6.��a�+A�2���%Qe�ַq{�>�a-�d���DL�R�q�����톡(�|F׆��[���=������ڱ+o�C���&d)o{2s@8�W��4}]�й>o�K�����Q�Պ���AW�@9�qޚ����\��K#�p�%T�
�*ي���Ǆ��+��E%�}Oך���wm��r�<o�1�s3��<Z��w��]�S�{D�����~Hp��r��j�kִ��S*9���1��n���i��jk�t���~�ݚ�q'�S��bU��C3��hQNW��eq!�+�/9�+�G���*A����y�������ypԢ�Y��54R�>�u����aU�3W���XZ��;Ϧ?:Y����s�7��f�>c��jc�Boc��V���Z�_~�H�, �PT�|@.|����yԲUs)��!;�L��0�v�u<h^�}��Љ��9^EU�=�9ɸ�Q1r�g��A$�^�j��c��{e\��|��zO��IՁ[�̅Z&�j�#��H�8H�ߍ��N������z��69�y�;Bm�xY�h-ŪZi�kĂrW���gt��N��Qt����~1�a���Ǔ�:"\`�@�"��D�:���F�d��?��"�� ,� Y`���A4^#�0����/���I���G%M�"��,jl�8���8.%@���7"悸�
q�[.)|E�P����5���i�MD����`P'��#y|w�Q������hk�|9���!]D������ύ�  ����~��6��1�t;��9�Մ!t���{X�-Hc�& ��EЀ���������/F��S픥i�=s��$�`˲0+P:�xS�aE��[J�c�;B������IF-'��L�}Bí��}a�7N3��w��$�(�<\*.�։�j��:���R���哂��KtH�&J������Im�|�����D��O9\/ڜ;�16wb$��`s��}p��ow�l+��ps�Oh�%����1jG���H{�씞�c�qrX3MW�d�bU�����~���0�
�l�+�[�<?�L���6��̥�/z�ٜ�5Xs�r`=x��̬�W������U՞�̨���/^��
M0' � _Xy���d�tTBi��Hw�j�>�߇�ԍ�e"��ط̥\K�Cc���jXb�-^oG	z�¸G�^��v���k�2�d�����PU��.�Ec
��?myҷ�liz�#F�u�Z�Pz�C�e@���[�6�$��Oo��*t�(�Sq���vR'�����sD���h�
�!mYk�ƒ��uJb�m���� �\��҇&�
�C�����?�n���*М,t.؂_vk�S�2��r�g��d|�m<k:��L�^ţ2�\����U�5����n� ����\�G:a{h��t H^P�/���c?"lp����l�z����^^�9M�/��Eж.\ԞZ�(��_,�+s��"~���,M|p�܀� ?��Z�04���_ �D�֌�p�N�8����s��c��[�����#�%HC���OwE��%�p�R���G��dѓ/0��n&`��W"�9��1�\ј]���|��w�Y������B�x��4��AP���"�l�LεA�g�>�X$�B}�w��ǭ�ӾA|~͆��hK羰���r������E����� �CT��;')ܐqh21M�`Sd1�-�)|4�P
n�Ȍa.
�.\0���c��!�#�k�_Rp�h�0i6�<<^�%#��~�7�:���ζ1l.d��pd#��x �7d�N��a� �k���Xh7��@Z�;�'� d$kC��Pa҇��D�V�(��|xx@f�S��F1(��cIR����D��y�b��7���&Jge�V����
���Ek2��z���e3 c��A���[B�OAج �H<1�3g/��k�8;��K�wy��A���z+p��O���5�	�/��8�U0u$���[��!��g�ky�����\��O��-z����$�sR�H� �8����~[��))h��VHw�ҲXI;N�<O��,a���U(�;5��^Z��2J���=�'��,�K�r�;�J�S.��6����p�(L}�zc_�)�������y�)���k?��2����[����;���/��r�9C�\����P�����C�Z�bD����{AC!w��Q�P͓:�;�Pf ��; �P1v+�40׶���=�ߏ>	n
2
��F��������U�1b�-o,8�:'��q
�1�i?�����\���.�T���p��g�&��2��A�o�Zl,�'D��^�	�^c�_�3(�����Wpܿ�i�V�?��@�������%�rOpٚ
�v��ӓ�����E��:���e��l>�b���b��0�Lђ/�VP���c	��Buk�EĖd�#'�L����_���n:��%��>H�z�*�D�z��U�f�gjE[R��#PZ�T";���4̊��Q�<������YtQ�U�+e倪��;�!���!��r���E�QD�Si@Ӈ�U*�2Z����㰿�������J�@9����)*rK�VH�p��E�\�	0���]�x1�\��j�	�s8��Z0'��Qa����kKX%y�����pU���W+Ps���jH;���r k��r�[���_w�i�3������/_��~�5%���l��3Ƹ�W��$�:°wQ�=�C����E=���T�i��������_Ȩ.��އ�B%��;��&�x�D|�%K ܃!C������<�(y�lJ������_$&���z��h.>��gYAz��[V5��?��'��:��1����� Q=�"!|S0	IV�h��Ȥ=�d�����9/SP=���L���&�M�+d3t=�9I�`ۖX���ɡ�,��M�P`�uL<#��;Lu}�#�ji3b�f�������O�da�פ���_�;�O1��Z7�K}/F�C���YHe}��e;�Ǔ���N�E�h!�6��w$���f0rB��S#Ϛ4H	�Բ]a �ƥ�b/�cI�*9b"Q|H���xz�:�vp/;r9�͙�G�qAv�az|_�c�	٪R/���j'�a�}���'���H0y>�YE/S�t�-wS�y۠��j�rlp��,9<���xG���נnk)�����8݇6R��� �}�6@�b`�{l��D�����q��BR���=�`���v�1eE ��\�Մ��|Ӥ��cJ���<�I���'cd��� 95����vЂJ��R�v��C��dI�$I���lh� -Or�q��.�<�v6����i��$��<T� �sÊ�� (�R+�z��t'(/���lhE�k�y%�$ev��S��c��^ۀ��q��cͷ2(��X�ً��5k-vTL�}�����ijQ�N����W�x*�~�T ���ע�m�7�����LEE]�����#�ZAۦ!B�읝��ӎ>ゼ=5�,O�ck:�I�w݇��37���k��6��,�D�I
�v9 ���qGJڶq}�j��s�D
�@�C	.��$�%��	A���%��"�7�I�[��m��,�S~��be
xw	�&���xe�pV�;4Н����dr �Jݷ�Xi}	/.\�,5~��\J��A�)���a��=�i�����нH�F�=۟�B���'X��'�5yUX���c�L�}�&��K���M|�j�a��6}�`G
������4��g��e��C.�'���'�`�ɍ�m�]8�(���}6|����4��aۦ�6&"�>�0�����#�h�(W�@-����b��+��6!���9QA��H��SYɵ�lE�őDwP����֋�h{�!��"���'O~�7;��%����ҏa� ��q�AfO��j��p��x�Ix��o�z�1I�P
M�-i���V��T�����B
�x�z��"��'I`���{�m{^*S�L�X�KI�F���Vw��I�JW8!
e��7���}��$E� {�֛eЯ���0���i *3�����e��г���Ez�mB:�چ��4Z��:%�m���Y�67�0��3E�S��$�T�#��e��L>	zt9�/
IPژ�4ܖ�c�(K����i��i#ZE>�Oo4P��K��ϸ�d�92� 5n�Ѧ��t�;UY<5Z@��(�#��>���Ѕg>�K^ ��Xp�B�������?ƛ��nNF7@)��S�ˀ{ht�T-wX5
������,(����sh�җ�Y��P��h�Tnݵ����&gp�|PDb�h�1�-oQ(
�cu7_�P�n�6��)���v80x�%�0u�9���s�)��̡�x���PO�gt�\��sni|���m��)�}O�:eF�Y�RYIo����z�4��zn{OW0�6�O&"1��Q�Ђ����*z�+C�B�ٰ�q��L�(�D<D��n)Q�k>��u*U��F��{	�cYzٙ�:C �ÔB1�@��h'�����8нwE�a���>Xl�D�ޙ���L�0P�f��F(�5�s��q��~�{��N��{NBD�a�K�}7��E�W���t�����\��n��lU�9	S#L��a&N�������I[�V�)���=�p߷w*�� ky4;�T�=ч�v������e8 �|�ϖWF�}C�xj�M��Z7n}�ː3�n��P��!cbxn�������/�DvY�|J�X6����,��JM�xP��w��h
��P��U��X/'3Bٌ��E)��
*nLs&��M�:ָ(�Ti3ά�a�CB��{���-�{��e�t��0� !jYɔ����+,L2��J�:��D��I�U�iY(�x���R�eN�=�=�A���/4$��xJ��5M��SA'~�E�rz�����Md�1WV������tC��X��N��'qG��'�#aMK7�$�t�&�&D��H ���,��c��������3ө���b��.pҔ�=@��������qpp���`��=����.��$<h������g`�%���������ݺ����.9u�s����N���
�	�]S�K�Ҿ)Mp&VL�"w�X��<�t4�6`�s����S�O
|-F�q�el�?�>8�t��0���ON9'�+�u��!���=�<�������Qm�z�Q��9��
/}��7�
���d�E\��(�"n�2 /�p]ػ"O�S�yI�3bR�)�"���1�+��g�a��6��e��#)�ـ��U�뇽ٿ-����c�&~7M�q�E��w�\;l���/��T2�f������2#�Kr�d?��i��a�k�儂� �$2�?r�9!�'�_۫$o(qq�.��<�<�OYJX�_�</9d�E�W�ش���"�:?Hb����%�̋���z��{���i��^�:��=�h�ݴ���7Fnڟ��%
4��̀(�L�t	�7�]�����X�u3B�/ֵi��}8�EqЍݰ庨�*�u}&hpS�
�q)��x�Q'o2	L]Y3{��i.Vm��Ꜥ�c�Q%(v�I�R��R��"i*���"��]���Gx#�K�����O�d�W|i�?+V�G��6}YL��ؽڷT�e���ڙ�R��Ƀ�O�!۰�U�_Qه�|@�K��F�	$���唞�$������GrQz��ο�W?�F�w��+<������Kڔd� 3/(������&|��KjKr�T2!���v%_�-��}�5��&��,A�e�(��2�H((�`�~��C2��B����~:8�_�Hhx��?��;��Y�����!,��N~:�6�r%(�e�8�H!L�zq�$�����`�}R\�*�[9�|L�KH��.J�ᓹel}�o��d����+�����d��F��Q��XS A���]5ǜ�c�	a��π�����;ub��7��ǡ[HU2�-t�N���;7�C��1�L�Qyzy(�?cQ$(0XadzG��\��5P�h�6��/����a��7b>N�~�:���cߌ�|0+4>���j�n�=s��!���A��C�.�Xl��P��&������^��T�F��\
�Ux�w���#�8�(Α�����g	v]��.ۡW9 ���{Ea��?��w�#�m��K���+��&�x-���aV�����[��&@���D]E�n�{"^�b�P��`\�A���7�A�j�n�C(�{X,�%�x�:��{�Vw.���}�H/���#���tIF#�'�Y�O�4��ք�c�����D�I� E?y����,�+�u\�����[���!l���Yge�5�{�p�L⢳J�Y�������fxr��E,�yE�s��EdH�6�9ħ�s@���嗂��W����v<��V��PG�Y����O�G���.��,_N�GQ3°��tw�(�K$�ys�
���)���t�z�Ͳ�{eț��f�upة���z�S	���ζC�rF��'�������La�:/^���ы�����9Ka4S=\��Q��	��5�%|��[�����Q����j2&�>
���{e�b����}Z�2|��5���sV4R��0?q6|Q�H�����y.<��x�{�����xA޷��w�JPy:\{ֺWy�<岝�z3���� ��f���x���~ͺ�"�T�W7�j ¶��\��i:Ϫ`���IJ�d��X��3�!� n��z��- ãR1)'�,��8�u!z�w� � ��5�����T�=��@���a�*�O�L�������6�x7�Cf
�M�w��>f>��A�4�
5�>~�.��p���\r`-��#G����u��������wD�0��4�Us+P�)��VN�6�]�>�?�o��������O�P��1X-����W��KDO�|�*� H�h։4�?#8�Х�}�qK�E�'N�������i>���Z�RZ-,�W3צc@v}���˕�_{�Nf�Dx��^����f}2�����@�r̿�G��3��ֳ���3��Gm?>�I�:���"a�f�����8o�1t��A�_�q�����]��4�v�ml?s��x��U���|}�X	�GZ0�2\�9�Z9k�X'ǀ��a�m�����i%v���ف��_��Ejű�lٽ�U�����$bd���	�r���V����Pї��3�J�����r�諍�q��S/�e�>�q&����"�u<�� �m�2�a���($���!������0u��z��i��"�G,��`p�&��_�g�{iw���Ɇ�$�vS�-�ֳ��A�����m���I'Cy�,AxY���/b��yu˾��\u��q�`m�Mn�UW��Mv������t�w~��)#W{l���7Y�3(�5�v\|w�VO�~7��]��5��+ʢϷ�Λ��/n~�����<�M�=hK �/n�Xb�q���C�f�̈́�[���ޚs/zm�˿Y+oX
�"�h����gx[��\�|��j����Z���e����qv�|��y��~P����@lK�w�z1a(~s��	w���!W�<�X\w�`�9�y�ob���(a'�?^�vZ�A�p�y�o���Fo��� *�n�sW�ú]��lIV˂��5!}�1g�p�ݼ�
êǂ�������|ZJ���^��vv3g��'dв��Y&Xhx��ჟ�������e�C{� ��	�5xdy���6=�_pNY�޺�y���Zey,ӋB���O�	�1q+�@e�I�C�zEhC��'�*�G��//�����sS��';�%I?l�ߐ]�����f���/� i�R��˶k��A��|s���.U��&IK��ܷ�4���w��"̠�G�>�{r(+�{ON����=/���HR	�ݏ�7�#E�/�D�j�'a���$uI���gQ@��}�L�	�Z���Tb��~}>]}L�b���!"����a�"�E���;��|s�G*���~��R�f����	)�*��d/g7�mT�T2�����1+�ڀ�c�]��"aiy����T��]b~��Vq$���p_��a�ر�.Ǩ~?��g4��-�h� ���ړ���{0үqwc�r�H��^&�jY�ۼB����V����;�{�3�f>V,@I�+�f/N�PT��I�X�?&;n�����-�(R�<�ν�-m�����[�YWk��<7���]Z�T}/��H�Z��*οMPF����wnu��n�jT�]�S���ݍ��]�h�=U��qn��|��FϮ�~�&��������`�����xctKu���=���v�]Œ�q�����/��U�H�s�]��o��N�^�ZW�R�׳���5��k��t�/���5�z�>m\���vE��R&4y�w�{������]U���jO��7%�7�ڴ�7i�PN������]�o��賴z�B�,בÊC��<2$��D�Z0��� M��̻d��yV��sh�=��nq;�͞��o���3�6l �;��vȲ�ۮ�&���S5�P��N���l����X֤��SB-��}dMɁ�o�WV);n<�{�6�ڝ�:gy��#�4�ыL�=�vT����t�~�����D²C�̡"��$�ӝ�~K�j�?{��Ta����>ѝ�����#���fR���~�Y����~�x3/��\y��S�2U9�T��w%��F�L"�G*$�3W"��V�B�j�H�+�o�S�]F⫞cȈvC(�Hڤ6uA/O$��#F�]�S���Ǌ���L�\9QD���<�I�9;V�$5�ז���tC�9
��������� ~��@��8���EF�W=��-��|��'����B�r'��	\���4$�5�HҨ�oV�nF�d��M`IW0�/&�� ��#^�,�5s�ov8��Ev�Bz��q�ܝ�215���Ӻ�N���+J�^:G"3���\�s��w-�o^� �����K)i�uUOiOv�Oz�_����i���<����K��AiΏ�7��p5N�9vM�h�y�H�|v���2K�U�.��x/bt���M)���j�]��{��.{4&$��K�nB��s�s�	9���F��_�p$	�(@�8�աќZ��7�q���
A�ز�W;O������¾��	\����=_�-��Jv
y�"�h�MVؗ�Q��n�4E���C�����}��۽-����W19�~�3�be̽Ccm�}�,bE�����7���-����d�K�H��K7��pU��$`�8�t��������ŗK*�?ʞ����6'U��r���Vx��,MJ��>���%�RT���K�s����߁Œun��:ȏ��b_0p�ݖI�����b���0�o��F[���^u�'��e�b���0��]xj,E~ -�
��$p~%
RF���M����>��Ud�h2͒Q��+Qq�xZ�7�������]�D�)��٨���c�y�S�w����f��i�����d4�v��9��P���g,�s}t����H�����McX�U��ON�̹�שt9�e
��^���ZI�J�e���<���-$7TcH$쳫�)DV3T�� HgK���u�③��k�Kjݖ���C��P�D�Y��C���B3�~S�X9��,��u��dҩ�9�ƅ�>$.�}���3�o�D\EYh�Ҹ��v�T�ׯ���L�0*��P{��y���\+���ɤT�2�pѦ��Q6�o��;6���͊x) ��[�=`����4$�~��{v����ZVs1�>��J� N?o�� t	=�X���t���d�c���+����5$N��}x~���p5����������6thx�##yJ�m�u	�*�0ꛅFZ>�?�{m.%|�U�zg�>f���ߩ�A��ߊ������2����\d�!ʡg�6��(PPquS�x&G!~s\��D���ߚ��H��#+wC�
�Ɓ�.�>#E�DЮ� g<7n6d�)!U�t�n�y��.7�5���)���ڭ�O�X�;���Ѵ���غ*S/A2Z6��J�>Wók`h�w8�0Xg�f;�T�����5RV(�<q�U��c��ȓi�_M*�8Մg��|U����U3�5���%v���t�����]LW
o��+��1 ��/�<V�r��=_�vdE���k�B�O[�d�A���r܁9B
���*��[�՘+�ޤף�M!���O���5����*0n{J(��qH6Ӳ���T�̞�L2�'^N�J)կ�1N46aٵޮʜz *�K��+=�eb��э�ą'V�^���E�A3`Kf�5��G���T^.�����p�+�9���`�7�=�+5�8�h��g�k�$��v�)���#Tp$�I��Ҳ�;�Z8�W;�{B��ͤh'7�J�Ʈm��Y4�4E�<�הt-xU�aխ���%c�5j�?x(�l^>.�ۤ+F�H�!���?S�JuVӌ��_^;)�D5s��=B:�h�{P=�R?�OXy�QC
ye�2U�(��>�_Lx��qVb[F迶��IT��4_p46��M`T?2���E�"�ܗ1þ��\;{��d��/#��1l&C����
&�J�z������0�-���Z�R�c@���Y����o0�����n6����Zpr�/:�+d���]F��$j�&��j�'�|v=G��|g&�\"�n1�?��},�C�j�Ǒ�l���LY�;����/J(ܓ��^x7Ϻ�H�P�_06Mx�Qf�l�辆�s�'�!���\��T=�5	��E�y8K�<�����\�\��Ep�dt��4�/?���#��KFp/ڒ����ϠR})�7�t��VSI%��↿�(B�7�`*�kzh����O����5t1 ��\��h�=_m��5Κ;�'߸	���~z3[=uD�^�n�].�H���h��tA���d�D,�7#��yD|u��͝ R�j�z��SR0�����v����k�Y���Z�x�6(�l��2M���x���
�
��_1�ˮ�b�(���YJC,Ks��^/�]+m`��
��,���3E�0	ץ9�A!��`�^%��;�CBa!I��ٔ��&xqx>I%��~���;��haj���*�5���4z�a���mⷝ�
죦�����9�5@��h�m^�%�P�%���,�V"ӹ�3V��yq0�Ig؎oѸ����APǈ�s�Z��3�����v��v7'm��JZ U�Uz��Y�3��0J��֌��u"M0�I�Nᮒ���S��U�����T�L�a��3��}y寥�S'�?k�Jy~���+K3�}��d�����D��b�V�(O�I�.nnY���~��"�o�Z�P��CU�'��L��)�Z��`�Cs��09�nq]�Sҗd�.wA���/Z|�i�%�������H.�(�'Ԅ�횒���~�C_�<Ւ �����;���$z6�̋�%��>�2��'_!�*�l_ԽG�O.D���V���S�S
.T�#����BQ�g����*?�K�wS�Dc4�	�����0�H�j�\�{�sa1��8�-'Z�H�)GA��H��=�?i������&h(�����	����cVo��� �rL���>Q��@0�aa�g�N3��I�3풀���Q��<���� '����GӾ���%���S�1:���7[�5��8���$F�����WPi�w��1;RQ��6ن��S&��+n����3�]��`�
ZuF�n�Ʀ�l�P<җ��+��_���H�Q��ͬ_�������k�$ճ?>�wZt�1M�@��w{Xi"��~ĬA�\8�/W��(�k��'��K]����H��!�|kp%�.����#����Dp�����r|��a��l���`�N�{�lq�(P�a)�H�L�M	zW�H��0<�l�_#8l�&]3Ø<)���c*g/�[[��S?�K]4���9)ˮ���O`9��w��y�*����1���T�휌X��R��w�x	K��aM���/Iv�wAD�	�,ݷ)��Pug��կ��1s�������Ao�P��kK��er ɮNoϵ����f?h S\���ڨ�$�����0`*��X$�bBYu�-�n�m��O�����[���>k4E�W�/���S��u�P��b�b
*��C�!S�^��U�sT����-�����ر�'���Tǽ\R�E[�F��l�U:����kG�p��H ���5#ݡn�Ot�s�mE� ����N!�"8�]R��8x��PK�1:X�_�J�����#j4qMq��͗�"yv��6�I�fn�'Y-Z<��[BV���,���z�ܐ8�q�Ȯ���5H�3��%�����V����@�1C~AB�T��f�"vi������_��k�A_���~>�/��OV3�u�յg=�+![H�3�ofҝ	�
���#���sȴ�t��L���#Ft�!J6���c������=�iڃ��Eu9,�<�R��w�ࣥh66Y2?R����{�nU��m����>��c:��HMz��`���0���VK�ě$F
���q�^��v�+�����A|�:�u9х��!�3�|Bף���G����^xդ�FC9п����TlG"��'�Q��#��
��q�������=��$/epSR%��Sۤe�<U�=�I�X�QE�q�p��e��fǹ�{pK��<�U
M�l��%������P> n����QNōM-��#��j6G��7�{U9��.$Iȭv�j)�j�wh�|�
3���#0�s��܇�To��cjnӜ��f����ԑ _D��'�5�h.Ck4:eؾ�	:�G�.ͯy3���1��|�0�(�XX�s�n�f�?�\���������H)�f��K!Ղ��p��2�[-|`�<9�w,���~�L�?�x<�q��މ4*�8�t�X��Tj\�������K�����Tx�Y�������ߍM��w��ǅ�ꐗ�.0�h'�߬�K+��2@�%,
�R�]�4a�\��|��th.���O�����ָ��o����	���3�u���,�{`�P���9�K�e,�	�z@�̪�T��;�<��OQ�������)N�ϞOp-]}.rHO�A�ևpEO�ո�k�4��zkG��PEp�3��Ȓ`���90�	׏p!�g�	��Z�m� ���dO:$��؉�S"xս���!vW9�Yj`DpW*��3����w!�1Ff\��8d�y8A�d�-�u(<b�%��3O��3*������'�%ɦ�i ,ڛo�:�ƈ$�����M��J�(��^S>XA����9a��sU(%�)~�,�D��j�6s�>[G^j��]r��,[q�a��ؗ-��k�G��i��b0��+,��X�������q!�rJ�
�(i:I�9�'oJ������Y�7�p��09Cf���У�b�2�g����)���f����RT����DO�+��a]���!3������B��t7�1�ǐ�'N���D��%����������%!^Ø<�������|�R"II�n$�1�P��0�
���_&#!�$y#Ikre9=9����.u�۬T�K{�'�����"�o�]��otJ�ڗ��kn)��tQ;5#�˶�4��ѓ6�������)�$��CEAYa��ɚ�6���ڕ澕��ē �sB����y��#�Xh����F�����`c�D����԰]MwmgO�R=�$�^�W�kr,Y-�P�7t��V�5a.$T�`��!R�j��`�钻݇�jZ|��8z��J�џT�4�%�X��%�����g�a����!Vf��
�5��Q�(���3��ѳ�h�:����!:�k�}����C�$����Z��B�$b|^n�z	��t@���T��Mh�+���"�u;4�<�
�faб<��y`���ǰR���N���A��.ы8����1���﹇����r0��������g`�c�YjDM�<����`V�N��#y��q�~ܸ�}nC|�0^���,0%��q!�%������L�"�2�O���yjq��n���~���C�f�05��)+c�|,Գ��}U/W���HQ��D���Q�ф%�f���u?�(!�9N׺�;
�c���@�3�l��T���CRj:��O\ܮ�(�	���U��(�>�o!6	��Ij#l'���E�$�d���
͌�#�f���݅F>�\����"�����Q:�W��&,1���������V �
�ˋ��K���wD�͉0Kn�#;v�K��t��ơ�Vǻ)��o(+N��Fv�'DV,�m��/
��4x�V��R���Νswĩ���ҵ�d�"����	���Ge��~Z������N�8t��p<����g�y����b۳��8Y��(�dD���Qt�k)B�G��n��T�)�j���;^R;hb�a�?$ �(l�X/Ӫ ���p�`�@��S�)8e0zD.c�5��B���澉�ř7�������'ަ��_��R�.	J7@)�n��4���t��I��C��������9�9{�������=k,��Qœ�/���K��%�B/g�G�3m���o�9}μ���ސ�� 1����S׏��h�$]���᫳u;{n�\A�3�idT��h_C�%Pcg-���:!�=��M~�������z���᙮Z�t�)�qzK�b��z7+
��k�uBǃHbB·w_C�p���Ipx�s!�Wl��d)�8��U҂�Xn�;��U����'2R�x2$AV�C;�Ɩ���K����O��n*@\Y�`\�{�."�4�ݾ�k�j��V!jв|j�&E�8���W��?����kyI!�5z_�Z0��l �^�F��*�|
A�:�D��"ʢ�Ԁ@$��/*u$��$���D�v��{�TwժUytm ����u��c�v~=X�|Xu�������ƟZ�Y1SG�E��$� W�E��z�zkR�ht��2�ۗ�Z?��r9�.���ҟ��~TzJ,��(��w�g3L"�8��*�*Vnhx;(0�q-W&�C	�v����8,�e��HΓn{$���Z�K�B�Y�.��2�h��$�cC#	\wm�W:����܄�����J�ҡ�3��^,{�AZTݓy�2ê\��g����:��Du_�+T��'�c����A\������m�d����%��F���7gɛH��F]��v������*��q��'���~�(��I�]����} �M�y�/TP�9�� D�O���я�8�\S`��W�ul]w"UѲ�i�����f}�H'z������	ct����������%YM����(�J�#����@��>;��`ߋ��p������@�|��_�	�����v���zɿ)��K��N��>#�)��7��^�s�o�6�V]__�+G����
������y[�V��
e�q��Hx��p\!�Q����"0ȒU�d,��e�!��o���`ݚ�d4hr�M�;�+tXi�������y}i��JZ��R�����-�X��{2!�Q$0G$ �zot�+:	͇f߻?�����\Q@�.�uS,-ٍ6�O����C��1�܍jʠ����Lڐ�{��L>	��O�*9"����Ѓۣ�|�8���i��B>�}c;�l�4�����ҹl
t�M���f-� �k�ya��1��#�\�W��R;�.����RY�ᷖS��+T�����(��{#ߙ�s0���w���J�J�B�F���(NWT�y�'�%P��ϴU��
�.�F���m7��)징L#O�踖<Խ���J4� d��[`m���ykQ�H��n�u�-���?�q�������j4��
����L�V��tE����D��Yx8+���t�#�F��A[�N�ꍠ�̓��Ti�N�a��,�@.I¨�"��d;��;˧>�г-��[/a�
E&�&P�8�#͓HF`|G�g���C�ec�%&��߄�<�u����R�$�{�����B�d]#(Ye��[�VyY
dT�p�S�Z&��
�Jr4{�?^C4�K5�	���[��ǻu�j7�]�-�{�s��@���F����,b�bN:�w���:���&���_��$�R>g1���1�q>�la��/s8f�4�8f9pN�mI� ��4��~�;�*����
m�W�Ne:�-��@x}�p��j�n	�޹��x��5�!5�~����Q��0��L��HO3�M���}�䴚#�i� o���,���h$���y��F��+�Rm�{��\�C��@��xRfp��~����lQ�ऌ*Ŗ�㴙�2����K��P�r���zA���n�|̲�rDҀN9�Lg���Kl�}7|�JWB�!�@i��cӦ�+�Ο��LZ�c��L�8ٱ���\jpȰ�,T�~yIC*�kU��
�{8��[����|���¶XPY����u���Û7�,Q0�2"c�9УN��C��t�Ǎ��K�����ᯕ⩐-'�'����9�mղ*� (��"�猩��uhy@Ɣ����Ӌ$y41��Nu�an��l9zc��Y�AS��H� ���������خ9f�W�|�9P(�}?�[t����c� � �w'z����-���$��s"��і�����/���z;p�E��ґX���c���䓛&��J"�ؒ*rZ�j���H0|���"��ٌ�U}m��b>ɬXOq��ZRy��ז��R|s�\���<Ģ?᧍�F��l���?��`����N���V�F����}�Y��gxqְ�u~c��s�����&?-�u�z�-�{������'��m��.V<mR���MOͮ�=�3�8,F�JT�4a}<���\��QJ�e>��$�aB�f�����[��@��)7E��y����K��۹Qd�uNFA.n�;qKջ~�������e���<�o&��b��*ߠ +��Y�	��D�\��f�/
W��-�ퟰ��<��E?Za2[���d�&��ߴ9:����^���:�E��.���E���CXF���g�9�]L������)gw��&�;��ժ ����A�g"�
���|`�v?c��� 
��Zr�儓 4kฝf�u�D6��׭��h���� �āA�q'u�|���'�����Vx!>�	~��זӇH1d��E��=��x��ꍍ�Og�1+�ޯ����'m%QC��+t�CV������-��^�C�[<Ϣ�/.�2^0lF���rE�9�08��Ya8�b3�~.�1�	C�D#$��^��x�	̎Zc����[���҆YI�Ǽ�*{�#�/a>Ѷ�=MDRg3��:��i���bФZ���h�]4��CwF:}�4�y�����$��T�/Ɂ%	�oɍC^��c�NC��<��ߥ����Ӟ�)oI�L��F�yN�	颺qy�����p,�~�\�/v�c�"� R� �/�E�B�R�}H��n�@�>9Pt�Tˉ陲�
=b�.������5��fE��O�����E~����R���!�V2��/h�i���Q`���n����Pj�F��촧���r��hG�3&��Ət�?_�	����s����Y[r��� }��i<W��)t܁(���,��m�Qh}�$��L� �H�EL���ˇyP���~���{���2��]ހ"@�0рd|��vB�w<�+$O���]w'II����������9��Źd�O5a��Y�����L��(\!�5*r��k8��bt�H�Xm@6>|��_��ѕcS|u*���(�����Whc�E��=�� D�Z|�'r�Ů�N���E���T>������bI�>$�F�޻�PA�S�gjL0�� �?g��t�����Ln��s]�̦Ȳ�,qLB�oʈIZ�$�<`�<dqy8�5�=�M>4V�&��O��QPãM�����>�\b(�Cx�d��bA�U���*��@�����n�)��� ��{(\�	9��|x
#p���3��E# �I�nu��3`�Q�a������O���~�s:y�2�n-5$#�K��`��l|����4�\+u�4�Kgj���u����IK�{���I�x��T�<��4O^��삊�'����A�#��	66�q�&�M�d&�+4�~�*��(Ȧ���\P0�Y�N��SuJzًl34�)
���$�^����J(��B�-��Xͫ�>bT��;�~���F�䋵�	�_�H֫u^��"�{D����$�њ�����6�X�}j)�0�m��0�O7��zX��g�J}����W��؇&��VL��_�Xr�������s�є��v���`_����g-j����(Ď�B�T?�(��Z#x�)��6("r��
E���~۝`JL׼���b8���B�5�bH8�Da�{���q�ם��0jH�(�bWɵ1��K۾������K����q{�~�p"�f]����oy7�<] �u�E��a~�vo���7x+���[2c���C��D\3�8gKt���#�ڱC3յS��X�1f�
�A���תN���(�(Ѹү$�������z J˽��I{��;���d�2F�9{����������輺v҅>�gӫ�m��������Ʊ������p��5R9`��O1������i�����=�@�8�h��n#}���4U=q�Ʀ`ԗ��U��Y�t����S���Y��kd�f��Mv�]��}t�4���Tc:`(�Љ��y��9N����m��;�$2��>����	���^�C�B't����0���}��\d4M�ț����!=�I��}�dw:�FU/���!3Q��A�F�s-�^Չ���d�|<ԧ��v�9$�)E���R}�`Z���8it�=zeyS{�s y�.��F�F�H"ۍx�������}hʶR�4��?����:֨xȿ�S��#�v3)�P�( 3&�ѥ��2�梤◇P�.�eoO�pS����~_#� ��m	�����c��t7�"EN|^\��c����L.�!����ćU�;�4a$L�8p���i#?����@�W}�R=\��=bB6�0mѶ�ێ4dشפ0�7��D�I�L��;}G�2d�D�R�Z���v�G��Y���*�������1ľr}��.�Z=o�\���%�K�!��(J�E�V��i]��uU�^���,	��c��
���2�t�c�
c��g�ℍ�(������M���rP���(,�:P�S���U@� $r�~+�m����Ƙ�]���8��(�N�?&lR!������zZ��p�b?Y��ʈBc�4�qJ���,�"�(}|��Pd���ˠ��̦W@�g/��~:�pm�W���` hͥh\��QѹDi~�Ã9��r�`
n�<[sp�"@;�怜�a~��:�	�D�JAU��_�j�Ýz�#� �AQN�֋����s��	�h�@7�H�u~�SX�?GV�[�ڶ���ڇN1+�|�TQ8��{��U�n��J�$�~S�\����[*��:�	9���M�lD����d���GuZ	��'K�Ĥ��If��E��J���ꬡL|���B��'Sy�n�s�
ڐS%� ����7�t����S�`;���i[�g������.���0�s��>��w��!%����ٿ	�!�w�l%�!�j�ѵ�,J�vQ��dp��1\��<u���@�$Y%Ϲ {x<#^������[���ȿ��镧2�ӛ".���]�N�?��U,���}$zg�Еٞ
+֣�Ks��/�w_^"���xĭ!s)^ݡ��-<&\)��"y�x1� f�uh�,n�ɸ�@�!�C����W)	����],W����৉��5��
Ǌ��"�̅�]#%E<�~�*u���;�'
��o ����!QE䥖��$�n�}���L&d6� !�g���ǑoQ�3zJ�����<9�WR]{W<�[�7��X��n�%��%2���.!4��X���b/Ӳk<H�pV$Qd�}���%�+EVE�l�İb�p6����ڲįWd��������#�}�?��pC�l�7\��nQ�d�¢�73Y]�ۙ�������=s��k^�	��ڐ=,��mW�LP*�c/B:7e+��k�!��v_9���2����ݐ!��W��4��{���j�v�M^>0��4S��XV������9�"(�3��"L�i!G�yxɿ2o��F�}��dm���`��j��J�G���M+.��E�<)a5:{��t����6�!�M8���,;g7�*�aW�7Q����*MG;�Y@	�9��tيv�6d��_6�E�lsԧL�D>/�a�(���$|�- ʄ�_wM:}�S*9���4эE�W�z���Jg��5)~԰w����t"lFO�\�\J�K��!�q��C,���6�Z�c0�9�K��8U���u��o¾+����ͫ
��d���O�f�`�l���&ю�uX ���ט%dyǁFH��v#�N��1�t%�3U�5n��:�Ԅh&��q.�:�'F.xpu�U��"�j$%��[���������s�Rk!!�f�~��[�ר���f!}Z��|Y��#|-j�ߑc��+!̨GH](	���S�%)��i�P
��Ԝ7�M.�澞ڌ��CC<R\L� 6�J������L��@���ݙm[0O�ӹ�l�)�u���2��
wK��x~����&�$�%A��/��4��З��%Y��u@���ue�'�I� ��7{1���_ȸBt�:6`<^��b�6���U�p�]���0\`��P�0$�݈P�7?xG�5�?��Yd����l��-پ2����A�#陃��s�]Q�K���ܟ̙�?,��R�(��3�]�r�`u�����[Đ<]b.lw�\s�0	B�V�d�C�p��"W(�~ܸ���M��H�1L�xR9濅Bg|��>q�
�	Eg2L�w���M
	Ƞ��O��c���Uhp �<�s%\{2H��U-6�<y����SW�u5Q�5�Y'�@�;�g�h¸�~�����lw�o���B5���A�01A�@i��t�d���N� ��hH=��NN��|�39�N�A��N;b�"|�o�@@�"��N-��#���� ��х+ړ��kS�bo�u�e�VKX�!�@v�m��j�ső��?�jO���@?����wiv�b��tW�	�Z�MP�5j��)�0ø!�#��ܪYʶ����5ph�������˩��x� ���?;y3�N_K
ݺ�TT�sHz�^�I�D�V�SS��w�+!�N5�O���Wܰ�&���
a@T&�L�.�i
��P��+<Y�C�)�ǡ&���Y�	B`^�!q4K��Vo�j鹞Z4�
�;%�Qnv��d����)(F��z�)�.m_�y(p삭�7!�Պd�����H��3"	�O����O9ԬB���>�"upY���A�!o2�
&�(� ���XTl�\���6�	�����ݻ!<���Dq!���'K�A߅$�裔���������1[WW<s�γ�T��"2����S7k��tx�����|.h#�2�)93���
F�hD&(�	��f�K5q� E�%0�D󩢧�Boh�Np���;m�B�`d~r�6��NdB��S@����ߛ�Z�m�`�����Y�h��3Xc�1�Y��:�*�xݘz]ZRRi���Z9\sO��7���u����Y�~i%A�f��a}m\�;��bR�n$���]�.]�È�&(YǶ�Aj�]����v���� ��m�#��J�Q0I)����i��r{������gB�`�-eRqp�nI���C��-/��w��_�a	֙�|� �^�J��[ 0	�4ց7�Jm�Z_��+�ݻ.�]��͸�p+���@�\�=#ϳ��I�W���{�ҎN�k�F	7Z掻Ap%�C�~/�n���F�8�`�Dk��Z�IGӣhǎ���b�B����97d�K���L�Ɓ>2�bP��%C�i��-��(�F��ޏhk�vMl�%q�\��>�@.��_�M����T�hX�J�r�r��d��JA���a��0X�R��q�AU�$����T��v��|_MQ<��M��i�ɹ&~Wĉ�Hd.�xPF���4=I�uI�q�
zC5�ؼ��q��R��wcu���)pM�Wک��H2�3��)�E�}}%���0:��E�f���W'�!>�f��������8���������]�������/�9�ZZW�e�2����M=�w"*M�A�
eյ~�n��
P���~%b���%�9���z
���ZJO�]|�.�%!P_e�����H����|{���FC��~k�<�K��\��y�*��������N6��+�L�~�J�=�8�m��+��~k*�N����8d����s+�f�]�X��<]��?�k�÷��GB.b^g�X��� p�>�y��Rf�d&�>튙n�v?�kaAw���*�;tt��w�?\�u�E��6�0m�8�A��@T�2�Ȕ��|cv�l��9�:��É�����y����ճ�E�jAk	ҋ�/V4�]�w���/p)��õZ�2l.]u��E u�p�D��J��B�ez�0q�֋3R��V 4�}i��Z���_�o��G^Ԧ�%$�UsH`V� O��s� �5j�"W
�̤8k��c������{��Ԕz���`��n�:^|����F�������uVk�9|�ST�3�蒴2FX������C���T�<�?�ڭ��<'h�j�� ]YE��tz���c���C�z-Xo����bM)%|ډغut���b�l<>��.F[���ST�c/?���������l#��-�_�4�_q#n�j&/%=4�uy��uB�M.{>��,�Uv��p�+z'Uq�$���}��)�9V�mza��!Vc\����"�-=�jI]��*�SgS�����{�&����D)��0�ݥu��TB(8kq�y�ɗ�3�װ�57���ޯ����*a���;���u<��x!ޭ���*�����Ե��B����)��td�>B\��*�5aa�5�:����Y،��ɇ"�����<b�\i	σR�L�7�i��	��ҽѳ&�m�k8�.@zC�@h�e]������*�T$� ��t�	��ISn�*�Kb�f���a��?o/�������v_�!�E�s׸�X�kLz pQ`�jzd�5w��ȍ�*[��������y����B�����(��w�WV����M[M<��+�K�Ɲ􁵃*��4�����I`E2$�ݣ�6�����觑f
�R�<��l�@b����2�<�R�E�õ=o��W�Y���n�bͫ����7�vK�ک��F�����p�E�����d��ח��������:���P~�򸓶MY��yur��Db�zJV�S��3饏���24�rCRG�h΋�8����l�y���Ux�]��!�4���&=5�˂�j�{T�AJB{�a�g�r�}�W�J��Q�p]�Cd�r*ZzFv����m�m���9+�GN���gt�\lֺ�eR{E���k��iA�nD@[��Q��(���w~Ǣ�C�Y�9��W@҃ț�֎���R�o���~�$d1{���U���^v,_�\X�z{�x�;p����J��tovi��#�����N<�\b侯�v�l4�7��nb������#z��J�&S}�KԆF�x�?�JG�ډ��P����"E>��Y��9��k���4KZ#<Ϗ�)�����鋫�|��y�8N�O���vl��G��e#Dc����M�����`�7;O�bIq7���hP9�?��XM�Ɠ�V�p��׽����^���SQk��ű��ŵBY����Ϫ�W@.y�AN�"_tk�݂��([��E����Iy#4�k��q�~&�������#S����,x+Bs�!�Zt�����a���~5@rt�x��X	��i����/��W�n�]��p�����__�)	�ǧ�~�����s��u|@h��r�C�`���� �?���K�J���%�令��t��Y���5H�V�d���;ηk�C�Rp�b��Cg��� �(Q�/�n�H����,�����d�~�6�&s�/�}Z����J"��(K�A��_��K��q�t���p�B��n����[�W+N��h�M�7�%����Uu��
�ٱ������o�6�&+�]4KX��ahX�-�Z�޹�h�!q�j �I���|����HQ������������7������A#ĩ����3f�е��i��ߠ� H�֪8�bb�:�� ���WE��T$��;��Ɗ��_��Ex;�rR���l�?�|���!�p�W���M��֗��c%�=g�:�=H�'o���Q�w�L�$tէF1 Fr���3���6Cs�����s��i�̈́M���ZD|��c3�u
�Sy]r�ơ��ݜ��,9m����տ����Z)E��Z8���h�sJ��������-���`�^f�@nߔE[~�~��ԮK���d�yVCE�8�3��$a�kR�!3�f��v��G�"�a�ҏ_��?���Ʊ�?�8�ָd�����X��Ѿ#b��Y��xRY����z�]�(��&�s��9�@�ގVf�֚��w��b2�V���c�ݼ�k��`�B#�na�A��o��jiɞTo
~Qc���a���$f��2?-Ϊ?m�� �QDE�!�8�Q���$�����DV�_V�,3۹e��ęf�NE����L�����<.������ӛ�ǲ�l������,|v�u[,�)�]v��Q��k��V��������t1�����'�0����E��;_�g���k���j�'r��\x�B^�J��i�����'.;�g�/O��[�5�"-��	Y$�Oףl�j�<�l���~o��@ql=������غ�yf�^�_<�rs�k�>$�,�F�g�M�����OY@H��;���%�K�D�g{��cE`����4t�c׈�3�����q^�0��W��F�YwZ�GM�/2 /�h]]���)Ol��p��������M���ַ9�ÿ�XM��^[-�r1��v��<���x/<�;��G�*3yV�k�e�A>���}����G_K0���H�n�x�����֞˦�j����+������[����=�V�VR�����<Y<�M}��
�hbt�����V`ߘθ�-�>p�3��7n�c0�&�!B�:%��ۿ
7:F���R	�mfaZ�_NcXt�tl�:���nX��CEM���є�eP�P��Щ�j �f9�S����Qd2Vw�������/l�#B�B�A���Ip�N�e��i��g����֓�(S�_��ޟ�g�x��F�֩����/63����wh囥��a,VT`k���@|�0	E��1ʬA�%�:/��6�X�?!��v��H�����H[�7$�~��.�K��WT�|(M�l֩�=�=�؊�����Ze/]�,�{��uVt�8�&)I㰶��5-���IQ�y�f�6�fS���*�Y�,_ϡ~��I�s.�o�^��iǉ<Q'(�E������	4�\�(��ᗖϯc�6��R�����d4����M�-H��Z�8Q���(Ozb<��Z�n�%��^�:�������c'=�z謆<m�jdW^�!��M�ek�&���~-D��z�Om�a��o�����W��ʊ���ŀ��kE�YL�7
o�u�fIGeb�ε2����ď��?K�H���?tB��6��E��h�\h�m� =�.��,�f�^��l�;��p-�"S�qeG�`Ci���5ϕ#�<������f���f�i#$C*c��p��:�����K�7�ɘT��Uu��I�J�S7����i���`�7�P��^�\�[^����V_T�b��6���M��W^#we8���i�{b	ͻ�X+ȭ��=U��P�#a0mg�����6�ߍV��Y=�S�)��8V�d~�� a��T�_����m����ZCɎa�)�����*����(Q�sx}�	Ö{�Qs�F+� �H�6���وi�&(^��j�Y���ђ��3sCvS�3�|[��s\�</ү���5PhW4)���HB����`W�ٮ�Ȏ>�Jj�и���>�t:<��Ӧ���R����C�~�-�H���b�ˁ.,3x�%z�1X�/b����b?n����ɉ�J���c�!;l�y��dW2�SW^$7[�zl.�dHv�q\4���=����$����UN���,��N��7U"q�!��ŭ�а�.}ش��4J�A�[@��S�AR�k<�O*�w�`�;�mR(�������S�f�Ѫ���
��$����y�ݒ�I�
��ׂ7���O;^��4?�|��3$�Zu�>BΥa��jXu����u5�A�<�3�i�u9hբ�Z%�����Oʘ��L�H�l㺉-Q�\����(���JK�|G:�a�8M���^�w��~��ll�v��J�%?Q���� ��Q�`]:���`""k�}\+�.�>F����FT�x'p���J�l��{!:�ܰбY�z~m�(h� �F`�z�����Ǭ���������	�����?B����Y�$k�ZF�/��Q�v#� ���	��J(�3�$z�p���W��2��x�݆qo�~���~ˤ�GH�d����qg�����O�C�R���MJ ���d!���
_d_*҈TS`U[ER~��0v���,ڗZe!�����?��Vc҄��r��\� 퐚Ų_�˲wSr/�W�W}����輢W�� q��P� �Z�_�R�2�o
B p�7��e�pbb���־e\�����Y{���f����49�H�<0TH?����H.�/v�+PN(+?�b�cUfW��U���谘k����2���� �1��ܣߢ&;�Q�&F��|_��:w�nZ�Q��	��gT_�{��_I/�GQ������
 8�ە,䭒G��0��ѧ� Z8B���b�1�۲hdb
�AO�҅�.���36Ka��'���5i�כ{1D��g�%�~iT���b��S}תYf������(�N�(�\)/�_*��˗{8$�Lͮݴ�.9��J�F��:)<�k@��p��+��\.�{�0���,wng0�Sv}��2H&9 pNS߾or6,mߗ�Jf�k�V}�W �짷j�Lvq��=����$���O�� �S�g�p�ԑڛT����^N�%��jr��a{��2�����v%E��VB��h�����|���/��u�	=J.Q������;�Q�5�{����(C�Ȣ_(C1�������S���!a"~���/�x3��)�FM��]��8�<�ɣ�N�$��0��Ҕ9e.��wB-��������Ԣطr>���ixu�5��9(���*��r5�n�`l�B]�79��׫�h`�c�`���ʻ- ���?�vPt��َT��Y���~�S�3f�(q�Hem~y0]�Z��؞�^DTRn�,q�tsu��f��?p�@�v}�8����l���+�����a@�=E�Ӭ�UE�M�1����8�q��/X�/�w8]��~� ��]_Jf�Z�@f��Z�u͇$���,"�f�nwBnH�!F�9a�^�YV<�UA�@��dW=�_7��ջ���!x�>�±�V��f/�|p�`���VC�
1�<U슕��"���`��N�cɨ�E�wn24����y2x ��τ~�^Y�ۑ�!h��dγRgQsS���QѨ�]���ȝ�i�R�F��m��j���i��j���k�*��5M�2|�j�h5�� ]�1J3F]b����m.=���篕�P�"��<=��$+խ���*��`^�"�[�ݗ*v%���xУ�����ٜ�Ǵ�Q�����S�R��C2�'����O( ����Մ�r,-�I�a ���
j$�� ��)� �)�u1�8c��}W�{���N�'��p�r��(�oR�8v	La�(��sP�Qlt��Dj+5`����}�g�/{!H��Y�����ރ��:Wlr���-CX�"��hpb9���(�a@\r��8OCI6��z��M@�|�t���3UN�L�R�����R�%#a��~�!ȁ���*���݄;(��[�>���x���HYv����'�]�ٴ�ٶ���#6��N�'�@��v-�r�ђ������������1��K��B�p�z�'z��:��44�UX$��V'2���E
Sl�|�&s�Ͼ�`3�)n�5:�'�#�:O���r
�Γl��Y�_�y�
�r���`�d%ĜX�g��QR���WEKR19��x�*lF�-������[�O�6����У��*o�Q���T-���������*�PQ�W�k�X�[�Z��Qd{1�.#3�K�d�j[<����:�
�V҃pTS�R�J�/�Hh%��-�F����������8��R4�/���Q���u��� �Pw��}��������C�CUC���Fnb��v�)�Dd���,��ehi��{	lx|]�)��6�7��Xχ����S�bb�v���pLl�ܻ���-!�q��O �:J�$����%L������X:��liz18�m~s��4���C�a°��j���Y��-_��Nd� �c�xEd���?PI��b�	�>��~A&ٙģd�tsL�̋��,r�X���1ۑy�6)�%q���ỗ��1��d��:�A��(�nX~F�ow�H��"���g��RX���B�M5蟷x�����|`��Sا.�t��<��z��>�k,�]I��C��=~*�9>�J9���ړO��FP�e�`[�����UH���!&�,�}��;�ʓta)���Y<�k+�2w�a8��(W�2���U��>����	Kv��ˈ��[�����2��:�EwD�+�A''v����W7��O#P���b�!�����ǯ]��WY���1�rO�N�����|X������Ȓv�F����� *��®�s{Џ4dp���`�� ����;X��1�q�� �͛��+��䴲&�}�3c���C��9��i�	p�W�	.��)��rQ���eNb<M�
Զ���0ri2���z�,b��6`��+Wpa���\2��:-:|��|�g����Zx�v ���)���2lR��y���Ic��S���"��8\Ne9t�"ChN����ǧ��dj��";)�S�
������q� �&�Z �~mw�ڞY$���)�>�>��x�2,�oU0�V��Qo*��=��f�P-H���� �/�u]����ο����	��(j�f�!S�L� |@]9Նѹ���?��li�&J1;����?�Q۲��d��|O�*x��7���y�F��5 ��>�'�OB�7��F��"��H��öL%��8�I����*w���l�K�Fv�-R��ʛT��λRI�r]��s�P?Ma�CQ\���,�\Z�^�	8R�;PW-�h	l$��CB4�o�����ҝ[�fOb�S$3T֟�X�?Rb�G�x��� LI�����*D)��)������F�e��2H^n�����iQw�hi'$�����ш2�_�Z>�o�����"#FSљn>WD�l�Uzw�%�)M�;drF�G@^�~N�{yj�띔��Ƃa
�zD��%=#�B��A_3��<
o����ؠ�p�B���nMم�;��G}S*ɖ�id�r��Lxq�Zkl)�X1x��<Z5���h�4x�Q�h�#�R�g���fǔ��p��AH
�&�!}O��I�-<l��8�а�.a&�
S�>��(M�}#y��I2Y�0�mbȵf�:�jvb<]��PHWU��/�a��%��<��L*c, ���ju���`���_���Ww�'��<F(�\��Ɩq�L�SZRG���c��n��Z�T)L�w���Dy*(��s�E�;;�T�*�*�ԿO�Ε4�7�h�+Q8D�Z�yB�^�ԡ���ъ���F��$s��=T�n������q��"���lo��b���R�'��F6 Bc�$�T��!Q}�bb	M���	�d�q0�U����
A5-�f++��XXg�裘�����;�����+�cs(#�t������+��/�S��^ns����S]@���L�m�E*E�Ŧ]k绁N[��Ƞ}���9��g-a��K�t;����f1�{��pȪA�E�����k�JT3�f��a��`ss�h ����E#����16)x"Y���ѿ�fX0Bk�E��j��H�Ө�/.ᘟAX#ώ����,�T�=DubA���gn��� _���b�&���W d��"��9�~B���9Y��=�X���D;��p oW�=� x��4��D�W����H��)[Ϟ؂Aq��e���}���,��iy�}�g�����GKLg�s��+��򹌭����^23�
jQq��%r�X�Kǝ��8��	ꝍK�?���X|��s��&��;^0u&� 
X�d:I�6+�E[X\,"d��F��z���?O�4���(Dk�r۴(�N��`�n1U�:g C�����c����ȿ�O��j���+�V�J�QҨ��:|�wB���)��?��3��)3b�?�o�.�y�L��>I���hd2l��+��C�:�+�e�1���P�;�,�&�!Fv�,5���7WI@��|q���%���� �	�7�[V�Z��C��������;��M'���a*����ю:MD��[�:k8�:/o�L�L��?�?a�-ڜ�$�����;�b����d�>�6�E��F���|�<�fC1:.F�� ��َ:�1 3TY=wk���
���%٩�?@���m�x-��7�#  ����l�{�-V�l�y���P�/ǘ���kI�Ý�������?���O9�����;%C��r���/�`Z�.n?U��?������Ͼ�N��/�pO{�F��l.�0��F�ڪ�@D���݋�YU� �S�e7�����z3���{���i8����E�eY��~�t]��{�y���x'��ީdDyԌw�����qJ8{��bVG!�is1h*D�-Wl���Pc����=��۞�I+l���Rt�F��=���#n��@K�d�nU�rT;�����U�����klb����wU����w�ܖ��ʤg5-������1���w��I �|�.`�*B�� �VG���B�{�]e����Ǫ"�HC�u�q[�Ee�%��O�V]/�v]5M�*1�[f}��c��h�R]��aX���`W�����_V��/���ؿ������f�e	�_�A777���9߻��[���w૝��V���v?nt�6o�T6cֽ|r!oՇ��˜��+�,a��l!]��(P4�w���7�]�!�`2g��dM%[��3�p�-�d:_v-m'��M)?p�
�����-����;���`�z��`?�}�g�ύeɤ��h*�E<|e�Bp���&�q��^���:Wi���ِ\�_��|�Q���F�i���k���Jf���(KT��X3K$����7�� ���e��Yn�������x[r��V����@�s2_^j6��ఢ��I�l����y��;�y��[o;�����o����MJM�[��5�������q$����'}Q���� �w�nm�Q'�0�?�Z�S�vW0����ڷR����Lf��-T��<?�w�	��I뛔�����=Zw�~��C�Q{K��t�H)ö�+����^�\�k���|`�KiW�������*{��@,��{�_�i�u�(n2j�X��
X�ݢ�ϗ���3^�1�O��:����Nͭ��~u9�ǒrV��q^s�+�����`nBm#�Y��o���Pⶇu?�"c����'�N��"4�>X��{�쿗ø)�+N��k^�G��0pO�v:_�$b��~�b�v��f�D�w�|[a�]p�\��I�Q����lmS]UE�~��Qaj���[R#��j��[���_Bv'/�_�6^�.�l[���Ct-�                       jQuery("<label />").html("已评价")
                                                    .appendTo(jQuery(lasttools));
                                        }
                                    }
                                }
                                jQuery("<a />").addClass("JS_order_btn")
                                        .addClass("mui-control-item")
                                        .prop("href", "javascript:void(0)")
                                        .html("退款单")
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
                                    jQuery(templateGoodsDiv).find("h4").html('￥' + fmoney(orderitem.goodsPrice, 2));
                                    jQuery(templateGoodsDiv).find("p").html('x' + orderitem.quantity);
                                    // ------install templateGoodsDiv to templatedl--------
                                    jQuery(templatedl).find(".tools2").first().before(templateGoodsDiv);
                                    return;
                                }
                            });

                            jQuery(templatedl).find(".tools2").first().html("总计：<font style='color: #E4393C;'>￥" + fmoney(order.totalAmount, 2) + "</font>(运费：<font style='color: #E4393C;'>￥" + fmoney(order.deliveryFee, 2) + "</font>)&nbsp;共<font style='color: #E4393C;'>" + goodsCount + "</font>件");

                            if(order.orderType == 1){
                                jQuery(templatedl).find(".tools").before('<div class="tools3"><span>定金：<font style="color: #E4393C;">￥'+fmoney(order.depositMoney, 2)+'</font></div>')
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
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                },
                error: function (data) {
                jQuery("#loadmore").attr("style","background-color:#ddd")
                jQuery("#loadmore").html("加载失败，稍后再试");
            }
        });
    }
    /**
     *  验货
     * @param orderId
     */
    function validateGoods(orderId,handleResultStatu){
        console.log(orderId);
        if(handleResultStatu=="untreated"){
            popAlert("申诉还未处理，不能确认验货！");
            return;
        }

        var layer_confrim = layer.open({
            title: '提示：',
            content: '确认验货无误?',
            btn: ['确认', '取消'],
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
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        var layer_confrim = layer.open({
            title:'提示：',
            content:'确认收到了货物?',
            btn: ['确认', '取消'],
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
     *  申述
     * @param orderSn
     */
    function complainGoods(orderSn) {
        console.log(orderSn);
        var complainReason = "";
        var layer_confrim = layer.open({
            title: '订单申诉：',
            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_complainReason" name="layer_complainReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入申诉原因"></textarea><br/><span style="color: red;font-size: 12px;" id="layer_complainReason_msg"></span>',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function() {
                complainReason = jQuery('#layer_complainReason').val(); //必须在close之前获取
                console.log(complainReason);
                if(complainReason==''){
                    jQuery('#layer_complainReason_msg').html('请填写申诉原因！')
                    return false;
                }else if (complainReason.length < 6) {
                    jQuery('#layer_complainReason_msg').html('申诉原因写的太少了，多写几个吧！')
                    return false;
                } else if (complainReason.length > 100) {
                    jQuery('#layer_complainReason_msg').html('申诉原因写的太多了，少写几个吧！')
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
                                popAlert('提交申诉成功，我们会尽快处理您的申诉，请耐心等待!');
				//隐藏申诉按钮
				setTimeout(function(){
				   $("#complainGoods").hide();
				   $("#complainGoods").after('<a href="javascript:void(0)" onclick="viewComplain('+orderSn+')" class="JS_order_btn ">查看申诉</a>');
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
     *  查看申述
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
                    html += '<b>申诉内容：</b>' + data.complaint.content + '<br/>';
                    if (data.complaint.handleResultStatu == 'untreated') {
                        html += '<b>申诉状态：</b>未处理<br/>';
                    } else if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>申诉状态：</b>已处理<br/>';
                    }

                    if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>处理结果：</b>' + data.complaint.handleResult + '<br/>';
                    }
                    html += '</div>';
                    closeWaiting();
                    layer.open({
                        title: '申述信息',
                        content: html
                    });

                } else {
                    closeWaiting();
                    layer.open({
                        title: '错误',
                        content: data.message
                    });
                }
            }
        });
    }
    /**
     * 取消订单
     * @param orderId 订单Id
     */
     function cancelOrder(orderId, orderType) {
        var cancelReason = "";
        var layer_confrim = layer.open({
		title:'确认取消该订单?',
		content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入取消原因"></textarea><br/><span style="color: red;font-size: 12px;" id="layer_cancelOrder_msg"></span> ',
		btn: ['确认', '取消'],
		shadeClose: false,
		yes: function(){
		cancelReason = jQuery('#layer_cancelReason').val();<#--必须在close之前获取-->
		
		if(cancelReason == ''){
		   $("#layer_cancelOrder_msg").html("请填写取消原因！");
		   return false;
		}else if( cancelReason.length < 6 ){
		  $("#layer_cancelOrder_msg").html("取消原因写的太少了，多写几个吧");
		   return false;
		 }else if( cancelReason.length > 100){
		   $("#layer_cancelOrder_msg").html("取消原因写的太多了，少写几个吧");
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
     * 取消订单
     * @param orderId 订单Id
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
                        var statusZh=new Array("Null", "待发布", "进行中", "成功", "失败", "作废");
                        var text;
                        if( data.data < 3 ){
                            text = "该众筹活动还在【" +statusZh[parseInt(data.data)]+ "】阶段,不能支付!";
                        }else{
                            text = "该众筹活动已" +statusZh[parseInt(data.data)]+ ",不能支付!";
                        }

                        popAlert(text);     
                    }else{  
                        var cancelReason = "";
                        var layer_confrim = layer.open({
                            title:'确认取消该订单?',
                            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入取消原因"></textarea> ',
                            btn: ['确认', '取消'],
                            shadeClose: false,
                            yes: function(){
                                cancelReason = jQuery('#layer_cancelReason').val();<#--必须在close之前获取-->
                                if(cancelReason == ''){
                                    cancelReason = '用户主动取消';
                                }else if( cancelReason.length < 6 ){
                                    popAlert("取消原因写的太少了，多写几个吧");
                                    return false;
                                }else if( canelReason.length > 100){
                                    popAlert("取消原因写的太多了，少写几个吧");
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
                   W����H�Y"~-�Jj��E�(`+���O	��|��n�QSBX��%�R2 Н�y?_�3Ψ��K}��o�քޛ�X�����:��@g�����v�ݺ�]�L4RG�1�_�۝����y_�]��V��^��7[D�OGO�8t�2�]��`2�}��t�p||����8a���`<����h<�A��t��[c@ϧؓ���wU�����\FTl��{[��Øm� ��\��`n8�����d��s�`�y�|��J>�n�˛��_|M0M_P>�:��~ %}CK�]nD�0 ����U)DvP|E{�* ��k����<�K�Nv�P�S`�U�m�X�������3V,��D[j�iü�/�lj=;J��m�sn{��9�����ECn���I����� ���]�16�h�U���:�:Sܳ���マ륟�=~�)ڽ���T�*�6�N�r��9��A�w��-���S����%�Y�B�����##d?�@�0m/�x���@@������T�����3�x� ���_��p#�3����:AX������ԡT�OuĊ���r{�uu̞z`��G\��eO�ע�υ��z�{%nײ�1|�@���D|�_��@�h�_����΄�ar��l���izxʛ��¤���?ETZ�?�����狵��(Cf��kq�*땺���6��h\��%S����|�T���=���6�U��z�qj,��QY����2�����1\���f�ciodxf�H�[0��@��c�\T#�������Z(�I��us���ow>K��`	�2�{�7L
q<�"��qg2�4G����|<�ģ[(W��=Brww�F�f�>_�?!�Z؛ms>�;z���k�u�����>i>XJ����X�����h�7Z������&T
)�܃F*�p��D�./�r�������oV���l��<�RR�^�u���g&�|�N�F
**flq����K���P��+��P�y=�V�(��4[�q2W�)�!&X�X$���|�'ϖG��p,Q�W��j�<�?+�f���/n��U��]�Y�X�3X�p0�^"��Z�'��`6���giO�.�[M�F��<.��^2��	�t�X��Zo2yk�����C=����`��X�]O����\\����d�i����}��+ؾH��n�FST��_𿣄��N�ddXX�6�߹	���IGy3����,2���M��c�J���`2��yf?3m��j�<��t6��{5��Vnv�P*�R�B�Z�q�v,�דfWAC#��S$�j���9���{CY�G✜��.@����e����W-
�S#%�����x�{�~}8��Ւ̧��+d�p��F�ڰ�V�I���)�C�U��6��Ə$?'�����?{v}p���{/7,�]/J�s3����t:GA�
�f[5�Gapj��=���(������]V�`���Г0j>R����=4�� �N�D�W+�YN@�ӱ��M�P�v����w�')����ȹkŲ�^���]j?ɓM��n2%�Zf�u����y�ޏ�t��W�t��Tw��[�T�vy�>�s>��t��8�i!���1��mZ�R������7%�f��{�l�%��ˠ�����_k4x��jRL,���Z�&�5����=1n��N��������F�YR�V�"�;PZ����;S�.�O`P3��
̽��[�?B���n�\
+����=�M��E��35h���1�9���e�_�5��巵�T��Zi�+�/�띞���=�9zC��k7�.;/���O�ܥ}���1�-{C����PG��:q�un��N@s�C��nr����j��y�@��8�$$�Ii�b�� �a��J8[�Hh�Zv������ ��^7�%#t� �-1�� ����YX�F�b����VH������`۝�����!��l�Y��L��]�/ �Y��:p�6�'��Ӡ��-h���N[�GCB&�0o�s|�8`����tx���4W/�\4���N= ��ز��e�$�p��	8�u�O888���ˍv���J�&���]�D.Jm�&V�mX�07��Z�q��m����[Ky�&ұ�� rq��9�hu߈�)0��d���H���>��|$��{NIO7��d;�"	�<T7J�dx3���łu�ڴ�M�|�lu���*5���-���'"�Cg"g2�@ad�@5��Sp�w�Kb�	�w#O[���n�෼XZ�\��|�]�ݙ���s���ui�q����g�vٍY���v�1�T��������r>����e'o��ek�p�Ħ�Y�� >R������jȔ/g��~�i^�YL�����:)�I�\U]�F�?ѡ�w]��%�7�|c��2����H��j�c;/G��v�ǆb�>/>�Cי��UU&{�`�� �a:��F2л�<��qc�����U��~!I�Q��L��Sx�n�~������	2'(#�E��fL������
�yO���� .��&���T�=�bp\1*LP<=����͇a,o����%dc��	|�@�Y#�t�ޯ��������[֬���.�Ѽ�20Ln��xqLn?�	_2�QE�X/ԭ��X� �+�B��k��C��lb6���V��hG��=�']�u�� U-FȜ��O>�M^m�H�K�׮`��&�\�S�_����� <��;�$�q��v%O��j$�L�k�~��z���xZ^��e?�=�U���c�'h�-��Iut��t+1 �7�X���騺��7p9��8���g�єIi�U�H��*[�6�ꦬ�k��إ6�ſ}?Y���.Q�f۝�u��o��q�M��+�m�bq�c������n���p��p�����z���I.��?���5^��rqP��sS��Ba�) �h����aPs�o���2Ρ���H��a6�����ߐ�˓`2���3b��<�K;�%P�I��Z����%�}6,�Q�ͅ��2!����QT�|O�Qhe#��aS��e�̲#P`��s�^��NG�D�ϝ���C^~��?���a�JG�+�S��kZ��l�f)�����T*/��d�';�]&k7�
�8�&������5s���a~z}�%�z4���K<_l��S��і�(
��t�c8��5T��߱�Vc�����Rq��޸B�4ĳ�@F6��9t~��"�|�A����yށ6|L��̩<:e
�x���z���ɫ�Kɵ
�${ ���|�om��ˣ�,s��m�E��щս��0��4N
������,K@�����m�����6P��K��s9����V�t]���h��C�fI��G��6T6iG��=�À[��89D������(S�X)iF�c��rkl�{��/����~��E6�M+��D\J2X����Db���Pr�w��l�0�h}�P�X�Z\Ƚ��}t��@k ���s�U�4$Z�g^����9YjAV�G�3:?C�тE5.)�D3;5���F��|P٧5�j��lB��9$��ğ���5r�3�Sn����u�Q�3�哿��}�����2O�4́����i�J�V���ӕu�-�M���ӹ���)�I�>$�ŏ�֗q��e�����N�J0��w���z&�g2x̦gw��[N$�k�8���0�#�Ό�J	9��}�C��UZ��0��O�2�GU�ѕ�=R�?�E:H������=�6r�]�����_"$[lo�(ɫ'*�n�`d���u/o��v�/"�2�Ja&ROH��������g1��NaZ�K�}<�����oXq�7�ܵ����~�9���O��U�����'鞯I~���p��z��pjh�qD`�n��a,G���q0"�ٮ��kMc]c��4��7��W��(���QPu4���^�3A�UJ=B�̙]�*�|�#��IƋBq��q���P�/x��}M0j�C`�x�o�c�mgU��:�}��;:"ɇ=.4�hY��*2��q~#-��?��nL6����+(�@sAm��x=��ְ�I�A�B+^�~F}2�*�@��|�J�S^��L]R멋���1L@y}ښ6ACi�ϵ+���kE�D�3 �VQ���\�H֣��덛�l�V8U��A�+�{�x��e�J�~Eќ֑1��J��>=�|ǿ2��L���%�3>�b��y%�C|I�������߷3�s'#�K���(�S#�| ������b�̮��iA͛��g�A�}�πԭ}�w��%H���ߕ��>�B���=�1��>�4!���/�-X�fL7�kd�)�5�oy~~a0�V?g(�K�A�B$����J<sb�������I]��|R!�G�������D�w�UuH�*�z���yUL�r�4����Ѧ��ԜG�W�;R��J�%��~�W�'Ю��s������W���:|��V��Pj9?¾��V�mO�Tw>jd���S�% e�*8���,Q��P]&;�BCoa�>#�n:p �t'�L4M�Trj8j����z�C���0���Pү�^:~��Q�����(�����⺾]k��C�A�OG�qo���3>�8�j	oU�1K�PB��^�� Y�F�%
=��
U��8���t����Ŧю���_ʈ�3�h�4�����sj=��l�DY�ě�WҮ�2� �&c��2|�^l��:�I"Pi#=nB_I%�,y����EJ=�K�B+�	�����GQV�ą��	"(�3�5���$z��ߚ�Ȣ�QbP��j��]�UH�j�Q�I�jq�x�v��� �Q7��ǞU��V�Qj�ӿ�X1�ƍ����}=� ʹ�6X�۳�OM�q5��7c�$}3���]�&o�ד���p���J�d������`���KO�1��Z����K.N̆^c�C�JB��7��#�\g�2� k�K�3au*�]��k�2�C��Wl�FM"�����O��P �F��]h����#�];�&�ߍG��0}Z��ۧa"_�`b��/Մ�������o��V���(���?I#����/��9���2!���N�{s����רʝ� �X/�d��}��ʞ�7�qF�Y�c�էr��+��H���C����w�+2y�ɼo�������Z7��ᠡ�5�+��-v�]T}1�*=}��;� ��Uf���@�2/O����L+�ZM��?|�c��{=��"X>�0}�KRh�j�&�!�,�zp�X��x��~�<tQ����V'��=��A,ݎ�/����k�!&�gB�u��O�)Q�c�ғP�D�)���5~�m�J=�v� �r�$�*�(��b8�:�~d� k�@�-!��{��.,z���o�a1�C=U_�>���#�!���e�9��2�<�9��{$|��m�ߋCd���e4ˠ�eV=r+${4�Q�~ت�3g��/�ٽh\�㳼�4�&���z�+�⚲x�"LӦ��V�����i���[���7 �� ���{i.�J�seW�.�y�%�%Z�"[^��%j%{ඤ@�Tz�0���]��^$�7�=���iEz3)��~�~A"�8`��Ez�O��=�f��nd��aq�#�{����'{a�.I�E� C���Ո��Qz����#�x�,V8v��O�w��j`�S�Q�5pi����Ub�qx�'��O�w	$�5�<���r�+%N����K�S?FG�\�����4����Z�<���|�\�%�I�T�������M����,e�����ԶZ�;.�ڋ\�1aL�8B ����H�@�op�/�3����#�OV�M�1�3��7m8ju֜?S��C9��^5
�X�/��W��D���1�G	��Qڥ�+�y��p��_T"��P���@k|??
�,��~ZR�����T`f���i�Z��>o��j�"V�w[��N�M�b����̃
��(�<��`Ԭ�[	���k��P�1a�mkM�G���XC����I����F+��J�����k:�*�&��Oe�uxO��Ⱥ�t�m?�A>%BSb�[>�Ӝ��?�(�G�K<��%-GD�zz��*�
���k���N���w��QV�ǁ)Y�^0�
��A���ǁP؊��� ��Ev��
i���>ܯL�L>TG+͉�LR=u�I��&B��mU`���U��'�Q;�Bp��]/���n�=ȘvM�'^�\�c��ӽvA��_K�$*��+�LE�E(�
6�o�3���L��׫���+=��U!�����C�@��������cE'��> /EJ0dz��� $��i����&Jt�T2�\���[�p�y��|4(�0�dQ�S?�@	[q;t"�V�%8�qȸ4���'��Z�����=��o��s�Gv��Y��`) E}�]�.܋�b�W<W�t�ŀ�s�����`i�ײL����������~ɘ��YIheޢ�7j���2�h�4��l��,����]`����V �
������5����~�Bt�����h�}J]���^>>/ۯ0�y>��a�9O��Q�E�4?�DQtLvDO�V���3ݔ���OxL�t�D��ʥ�̈́�R���|�^�Sgc1�~)W .�>�Z@H"f������s��d��}4����n��Z��f���������
C:A�a�k&ouL�
`*g��Ѝ��8x�2���f�8R=�D�Oդ��A��z�7!,פ̝P
+#�QDdd�٘n�\�E�Y�d�9y&����MCM����X��}�.7~��������$�9"s�r�2�"�s�T�ї�cx�;O$�W�'��*��7�6|v�U��04������|H=9cL���(@C�vZ��l)J'��\'*�슧�2�f,���I����S���[�����&1�і۟MC2�&,<�[���RxAD�ׯ�UFz��BL2�Mb�D�;�(izmӆ�vʠӹ��r)ʫ���FJ\S|M�z�P5R4E���Xb��8f_��F�g�<y�4=�9MeK.	_���'O���K>.Vj6sXD�:��!0+bG$�r��g!�G�G�Ic^W0�'Q�t����hoY��»hwz4jÌ�*�`�F%�-^q����0<\���=���;t�6qM@R#��*C+H�$�0��8�LI q�$�7܂/�x��d�����3� ��^���5
�w4�ë����ZJ7���p יJ��[�G��*{+������2��E�9$�k����7�h['�<x)Y3�M9�u��N�_O���{���-~��Xog0���Ѻ�A��ɫ����3��4��.�Ӄ �Y	�F"�kq����1J�W��G<�W�������ŶF��N6�QƐ����Z41���;GD������^8��n�$��&T�<Q���M�A+Ѝc��RH���م�w����@r�Z�5�ߞ�V�}�mr���xЪ��j��x99�r�S�N�*�����9����6A�D�E�f��ǣ0$\7k�a�T��!t���s�a����E�̱��ѿ�u��ay���{,��Z!����?;�4��r��5{(��Y`�;h��_��f'�t��e�薞�	�����.���<�|�y6UÑ?�`��4Y��Ņ
��4��u	|��T\���+gX.U]��D�ꑵ��׃����Q��|��q�:+��xhq�b��ؘ3�CD��8�k�E�May��i��.�ն�����Ei��v�$��LIy�=�KLی�8�(x3v�6���]f�����b��t�g����Ct�~�I��W���Z���W��ί��6�^���;`{[/ѐA���HX��'5K�-�
�Uʃy�o�w���N�3�/��<�o�iP劉�S��Y}y��)�a^����՘r6;=������5������l�v��SZ���8r~#AԘ��eZ��E1}1nP�i���ËWCc����.$0�	���կ^���PcM!(�X�4L����STw#	{�߸1�#>~��#���9�pz�=�����'=C#]���������La�򐾞�G��S�B���$Ϸ��=l�6��}��o&$$�g�7�s�'�Oud��f�-��[�}�ľh��77{�L�"�'����^���o�h���!���YkFx��Z:���⯁�W�]��<����E܇9F]�1e'ɬ,'��]�5S�h��#j'�����m����K��j�e�Yr"�3�mB󔈋��?��F+n3�3LQK��EE)u,ř��33Ú�?׃��R1�d��'���#�,<淔���c<Zg�=l&�,a⑛S�Al�tAV���C+{�F/S �5��-��?�~��d��пh1���n���>޴�,����6ϲ�6%y"��\��Ǳ�����L?K�Ã�~���X��&�v�QK�~uv�2��ُ���������Π��B�g�(�'c�Ȏ��}�1���K�.)+ԧ�h�!o%UᄧU��X�u�~���g����.o��wL��l4�Ou"��{Id�� Ga�~�o^:�]Y�':#�O		�ߢ���zc��Si$��luy��[�]�6E����,�N�n��i���m�6g�G1C�})))iխ�72CL6M�f��c��v��ȸ�˼�	竻��}PVZ�t�2��͛�,ed��p��X��]	j�T*�s���`�ʾQ�	���iZx=�%\�S��K�@��^�G(�)��haa����p��\��K�U$��xoƱN-�w^��M�fiS�|�~�&��
��m���嵒@�1����#=�9βp�`Ֆ��D��</�1�|bE��;�_��K=�햇1"��t�&�f#J�9I��Z��y����7���2���(J�`�#z�2��Gl*�K����9F�M��H��3�):��w`m�Xz�c�X�z���R��q���SJxo^���E5�V�!�%uc���r�&�Ӕ�`�HoA��(K�Ts�/|�ɬ0`"�>GV,hn*Uq�Ka-�C�6p��U��c��gc�I�Z�Z��<IQ�S�OF��;��iNC�I��X��I��JQ�������b.o�Y�{4o#�X:��<�y����@:5�Nl��y{������RxR�@T� �b���<Q�����(����O�K��<�>���c:�s�O��S�epC�0�x�-�%��Hc"`��6�Q�����"��O���դ��c`��~���&���o\��sgXk~��z���B��^׿��s������� �  Y{9b�[�-�v�;e^)��K�F����Ҡ��;OӜt�%�7�,���v��qޣ����1S^ϫ�)�q����폌�������� ��}�ˤ�}�f���m�E�k�����R��Cu����1��x���\$����p��e610����h��^$�i��;\�M��iߏ�JS�^x��K�Ϸj���+ߵ��>���*�8w��V�/�J�d�҆���/�G���=F��%_�t?W��:�}��t����6���O���^��|ns��	J�My�p���_F�W�/]��s?����z����է=T<���2�b)�*Lݗ�7�c�3`����Vg�]���2��k[M�����6���:sl��C�ns����Ք$_�Q��'P�L��Pͭ���涅��K�P���?m�W���we�޿���f/$�=�l��5�Jc�� ��m-�_Ӻ���jDh�UP�l\���Ȼ���z�g���>4��3����~ �5�j�mMA,��q���/u��V�g:K:/c�MG��/h�G��+:離͟��=��3�/S�M��>�;}X]�?�=F�>ސ�u_}����mr/�p�RD�M3�ߖ�ڱ�q1��iٺ�X��y���@V���Z�-�V�&���u��u����� ���WUs_�Y����8 uge �_ {�v�~�`���|�c�x��)Y85��U����R�"���K}f����f������)��b��68QM+U��k�Z�.�m��W?�������n��#ޫ�T����h�	=+:2�VFHB��v�t�2��|b����^�V^�������Ϳ�F�u?��Uk�s��d��qȊ�~��.�ݱ�PŮ?�@'�Ҿ~@�����)]N״�Hl5���;���w���*��ن�_��y(oN��*���ʆ�P7I7N�� �q9�z�9�>ł�ڹ�b��0,�������2��<Hڡ��1/!U�y���x�&���/ ��W�����8�o������M���h��a�Dס�i�������ZT�,��Q�0
l��Cl���>��ÍyQKz���Yx�p]S����]����:�ïV��`����u�ۧL�W�}R�ELk�����*�ϻ�./�<W�Κ3_��>�4����/l��<�.l\��k�Yu0�:����6������՞LH�X��c�N�_̸ UE��
Զ�����R,�^�t?_��!����=�u��4�,��1QўZ�y��t�&�][�KE٘��C��[��>�e7�� ���!��!L��t���'Yr�V���7	l��i&�&Zwkj�#n'�1�{9����9��e��rN�6��_�77�F�}	}H���<���%���C�6�^S)�ؤ.i��2����є%al��.����mI�
{֤��AT�r�G3���y��"��g�	[�4CX[e��z�R�l��n_m�7\2���j�7�S�@�V���e��b�e'����5 7�6��
q�Ӈ� �������P���nj@y�_�|��q�V�<�Ce��ȸ�]Gc"V��.�Z}~{<&oo�Dq	E��k�`��W�؁�S�g���	+10K��"Eqb|7��x��PJ��gU�m�=� ��{,IhZrf2��ĉ���Dc0�I˼�8�e�v��1��l����n�+�T,���4���%{�H�jwq=�0�9��[>��j�/�2�.���QeI���L��ڱG 'k�\�t�*t��H@6���
�"< 9�{���g��Uր6�*�J�r9$8�� ��p�Lhe�l��5V{[7I'f�U��q�eR��B?m	�^�:`>9��i=��>��u�;�|~t��ܸ{�r�J���Eo�=}�{�1̩�m���v8����F�P���#Y�@����Nr�]�0�'1����n�8�����<��s��_qI�c���v����)����Vw%S���c_)c���D�2u���gJe���fɷ奸�˱������H�{��FIU3am\�>����$�j�P�J�ʧ$��r)��_}n3�=eb
�����$�P��QZA��1�����
���k�}�U��8�϶p�����2�2t��Ǧ��<���K�]�7J9��K���,-{W��	�V�N��n~Q;8�����U�[g:O	xXl�۬��ڸ�6T��F9︀��lܼ��#��Y��3��%�[��o�2M-��6I��G퇢r�c�x�hn�)G#�|���(���ܷ���/����n)PZ2G�{s���DrVc$$`kw�]�Pa>.R%�S@����P&��v¬�܇�J��Ծ%�P��U� xn~�4�s�\:��v��5^6ҥ�:}$nű�*K�DMm�/'�v��0���/���m��.��D5��{��'��-��q�zt���P�DC�����{~��8�������|;g�z���KH(֙2B㬷����'[�`�='׊����/3̡`��6��ځ()�����A�
�8(��	X���pBU�*&r�5�P�\��������W��l�N�>	�Ι�)��n��{߀������k|BL�יִ������{�h3ǃOz�i�A�^J{�m�q�@��������}-_$���L1�rԚ���(Y�D#���h|���0M�� 8�#'.�<�c�:�r~��*FV�R����=`�{���� �]���X�m�.˂�q� =u���y5f��|�9䶩d�KU�q���k�ݼ?���0��pl�,ł@���$����.`9�K������B����m��k�O��"�j󦇥�ʞa�F�!#ز�6V�cE|z�S}�]��_�U������ʔ��3a*�մp����O"�ݧ=u~Ip�._4��X�ڕ��]{	@͌�O{,�gv�G��z�~�O{�P�#r_4$RN�[�!\C��u���Z7�m�j6Ag���
��#YE7pޥOW�L��oԥs�1����,QFO���2;�(�tߢv\`�#.\���_�u�ۤ��,���
�4�W�����|f���n�? ����6����[ñ��з��շ�	�b��Ð�-۠����p@''=���1��[�,2������n�$ɋ�}��m9�
l��s�ϼ����Ʞ�0a�y����&v�	�"���_p�q��q���'��~��o�����>M��B��uu�F���?�m���d>6-�+h�-(�\��a��8ՙ	������C�v<lv���'V��~i�a0[@�N<���>'"�����Vh�sP�J��U��"=�up��֬�����|H�����G��;Q1t��T*ۉ��g�ʿ��6�v���X�Yzv��z��Ry@����5�/vu_���:�����,��=�7��Xg~���������W�8!�����'<��J�[~�V9ę��!�ោFҚ��<�;#K�x��d"T���`�gzT���~��nD��X[�@�u^a ����ß�(��m��A�{��o�~W�[���!����: �;�e8�l�A@�/���T�����X��M�}�����߆N�R�(��������Q9�c`hTFy-�ɡ���&Qv�]K��ɞ#�zf��L�Yգk�t���@C�M�x;1�k=?�ޢ�����Bm�O�欐;�b��i������X��Qb��?+�Ef���e��
��ʱ�B�Ny_:�V�yb��l�p7���!S��|�B�f��<3�;I�H�^�~��:d!Yғ�����"����M��E+g
f��7)����,Ӯ�	��O8Z �IV�;�,T1��j�t`*� ��r�VgAID\�����΅����+ �Ӟֽ���lQ	�����(��6�@�b
WQ���ϫ�t�4�P��
��T��
��4��~�e�o+O���G.�̫��-���g���K�X�F~d�f���@�H���0��y�;x��v����qX����(2,瀮#� �,�6Ԝ��m���!(S|!�b�kOA9�Uvv���˗vP��4���HB�/��h��.P(��>�*)�:~ ����/�E�F�j�7�4�j����$����10��]�B���M�� ��d��ע*!gc��*@U�%,j7o�ҫL�=a[�}#p�[N�~l�-�*�_1F�%��:(_ͻ�����5��e�{)�G��$MtX7"Z"��
�FjV��]�f7+.�ti��-�`��B4��Cƶ�I�=�v/w2BAw����R(���$1�B>�S�r7���3��D��Xq�(�nT��
��'���X���sFs�#a���a���(j0Z� b���
\