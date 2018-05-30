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
�*ي���Ǆ��+��E%�}Oך���wm��r�<o�1�s3��<Z��w
q�[.)|E�P����5���i�MD����`P'��#y|w�Q������hk�|9���!]D������ύ�  ����~��6��1�t;��9�Մ!t���{X�-Hc�&
�l�+�[�<?�L���6��̥�/z�ٜ�5Xs�r`=x��̬�W������U՞�̨���/^��
M0' � _Xy���d�tTBi��Hw�j�>�߇�ԍ�e"��ط̥\K�Cc���jXb�-^oG	z�¸G�^��v���k�2�d�����PU��.�Ec
��?myҷ�liz�#F�u�Z�Pz�C�e@���[�6�$��Oo��*t�(�Sq���vR'�����sD���h�
�!mYk�ƒ��uJb�m���� �\��҇&�
�C�����?�n���*М,t.؂_vk�S�2��r�g��d|�m<k:��L�^ţ2�\����U�5���
n�Ȍa.
�.\0���c��!�#�k�_Rp�h�0i6�<<^�
���Ek2��z���e3 c��A���[B�OAج �H<1�3g/��k
2
��F��������U�1b�-o,8�:'��q
�1�i?�����\���.�T���p��g�&��2��A�o�Zl,�'D��^�	�^c�_�3(�����Wpܿ�i�V�?��@�������%�rOpٚ
�v��ӓ�����E��:���e��l>�b���b��0�Lђ/�VP���c	��Buk�EĖd�#'�L����_���n:��%��>H�z�*�D�z��U�f�gjE[R��#PZ�T";���4̊��Q�<������YtQ�U�+e倪��;�!���!��r���E�QD�Si@Ӈ�U*�2Z����㰿�������J�@9����)*rK�VH�p��E�\�	0���]�x1�\��j�	�s8��Z0'��Qa����kKX%y�����pU���W+Ps���jH;���r k��r�[���_w�i�3������/_��~�5%���l��3Ƹ�W��$�:°wQ�=�C����E=���T�i��������_Ȩ.��އ�B%��;��&�x�D|�%K ܃!C������<�(y�lJ������_$&���z��h.>��gYAz��[V5��?��'��:��1����� Q=�"!|S0	IV�h��Ȥ=�d�����9/SP=���L���&�M�+d3t=�9I�`ۖX���ɡ�,��M�P`�uL<#��;Lu}�#�ji3b�f�������O�da�פ���_�;�O1��Z7�K}/F�C���YHe}��e;�Ǔ���N�E�h!�6��w$���f0rB��S#Ϛ4H	�Բ]a �ƥ�b/�cI�*9b"Q|H���xz�
�v9 ���qGJڶq}�j��s�D
�@�C	.��$�%��	A���%��"�7
xw	�&���xe�pV�;4Н����dr �Jݷ�Xi}	
������4��g��e��C.�'���'�`�ɍ�m�]8�(���}6|����4��aۦ�6&"�>�0�����#�h�(W�@-����b��+��6!���9QA��H��SYɵ�lE�őDwP����֋�h{�!��"���'O~�7;��%����ҏa� ��q�AfO��j��p��x�Ix��o�z�1I��P
M�-i���V��T�����B
�x�z��"��'I`���{�m{^*S�L�X�KI�F���Vw��I�
e��7���}��$E� {�֛eЯ���0���i *3�����e��г���Ez�mB:�چ��4Z��:%�m���Y�67�0��3E�S��$�T�#��e��L>	zt9�/
IPژ�4ܖ�c�(K����i��i#ZE>�Oo4P��K��ϸ�d�92� 5n�Ѧ��t�;UY<5Z@��(�#��>���Ѕg>�K^ ��Xp�B�������?ƛ��nNF7@)��S�ˀ{ht�T-wX5
������,(����sh�җ�Y��P��h�Tnݵ����&gp�|PDb�h�1�-oQ(
�cu7_�P�n�6��)���v80x�%�0u�9���s�)��̡�x���PO�gt�\��sni|���m��)�}O�:eF�Y�RYIo����z�4��zn{OW0�6�O&"1��Q�Ђ����*z�+C�B�ٰ�q��L�(�D<D��n)Q�k>��u*U��F��{	�cYzٙ�:C �ÔB1�@��h'�����8нwE�
��P��U��X/'3Bٌ��E)��
*nLs&��M�:ָ(�Ti3ά�a�CB��{���-�{��e�t��0� !jYɔ����+,L2��J�:��D��I�U�iY(�x���R�eN�=�=�A���/4$��xJ��5M��SA'~�E�rz�����Md�1WV������tC��X��N��'qG��'�#aMK7�$�t�&�&D��H ���,��c��������3ө���b��.pҔ�=@��������qpp���`��=����.��$<h������g`�%���������ݺ����.9u�s����N���
�	�]S�K�Ҿ)Mp&VL�"w�X��<�t4�6`�s����S�O
|-F�q�el�?�>8�t��0���ON9'�+�u��!���=�<�������Qm�z�Q��9��
/}��7�
���d�E\��(�"n�2 /�p]ػ"O�S�yI�3bR�)�"���1�+��g�a��6��e��#)�ـ��U�뇽ٿ-����c�&~7M�q�E��w�\;l���/��T2�f������2#�Kr�d?��i��a�k�儂�
4��̀(�L�t	�7�]�����X�u3B�/ֵi��}8�EqЍݰ庨�*�u}&hpS�
�q)��x�Q'o2	L]Y3{��i.Vm��Ꜥ�c�Q%(v�I�R��R��"i*���"��]���Gx#�K�����O�d�W|i�?+V�G��6}YL�
�Ux�w���#�8�(Α�

���{e�b����}Z�2|��5���sV4R��0?q6|Q�H�����y.<��x�{�����xA޷��w�JPy:\{ֺWy�<岝�z3���� ��f���x���~ͺ�"�T�W7�j ¶��\��i:Ϫ`���IJ�d��X��3�!� n��z��- ãR1)'�,��8�u!z�w� � ��5�����T�=��@���a�*�O�L�������6�x7�Cf
�M�w��>f>��A�4�
5�>~�.��p���\r`-��#G����u��������wD�0��4�Us+P�)��VN�6�]�>�?�o��������O�P��1X-����W��KDO�|�*� H�h։4�?#8�Х�}�qK�E�'N�������i>���Z�RZ-,�W3צc@v}���˕�_{�Nf�Dx��^����f}2�����@�r̿�G��3��ֳ���3��Gm?>�I�:���"a�f�����8o�1t��A�_�q�����]��4�v�ml?s��x��U���|}�X	�GZ0�2\�9�Z9k�X'ǀ��a�m�����i%v���ف��_��Ejű�lٽ�U�����$bd���	�r���V����Pї��3�J�����
�"�h����gx[��\�|��j����Z���e����qv�|��y��~P����@lK�w�z1a(~s��	w���!W�<�X\w�`�9�y�ob���(a'�?^�vZ�A�p�y�o���Fo��� *�n�sW�ú]��lIV˂��5!}�1g�p�ݼ�
êǂ�������|ZJ���^��vv3g��'dв��Y&Xhx��ჟ�������e�C{� ��	�5xdy����6=�_pNY�޺�y���Zey,ӋB���O�	�1q+�@e�I�C�zEhC��'�*�G��//�����sS��';
��������� ~��@��8���EF�W=��-��|��'����B�r'��	\���4$�5�HҨ�oV�nF�d��M`IW0�/&�� ��#^�,�5s�ov8��Ev�Bz��q�ܝ�215���Ӻ�N���+J�^:G"3���\�s��w-�o^� �����K)i�uUOiOv�Oz�_����i���<����K��AiΏ�7��p5N�9vM�h�y�H�|v���2K�U�.��x/bt���M)���j�]��{��.{4&$��K�nB��s�s�	9���F��_�p$	�(@�8�աќZ��7�q���
A�ز�W;O������¾��	\����=_�-��Jv
y�"�h�MVؗ�Q��n�4E���C�����}��۽-����W19�~�3�be̽Ccm�}�,bE�����7���-����d�K�H��K7��pU��$`�8�t�������
��$p~%
RF���M����>��Ud�h2͒Q��+Qq�xZ�7�������]�D�)��٨���c�y�S�w����f��i�����d4�v��9��P���g,�s}t����H�����McX�U��ON�̹�שt9�e
��^���ZI�J�e���<���-$7TcH$쳫�)DV3T�� HgK���u�③��k�Kjݖ���C��P�D�Y��C���B3�~S�X9��,��u��dҩ�9�ƅ�>$.�}���3�o�D\EYh�Ҹ��v�T�ׯ���L�0*��P{��y���\+���ɤT�2�pѦ��Q6�o��;6���͊x) ��[�=`����4$�~��{v����ZVs1�>��J� N?o�� t	=�X���t���d�c����+����5$N��}x~���p5�����������6thx�##yJ�m�u	�*�0ꛅFZ>�?�{m.%|�U�zg�>f���ߩ�A��ߊ������2����\d�!ʡg�6��(PPquS�x&G!~s\��D���ߚ��H��#+wC�
�Ɓ�.�>#E�DЮ� g<7n6d�)!U�t�n�y��.7�5���)���ڭ�O�X�;���Ѵ���غ*S/A2Z6��J�>Wók`h�w8�0Xg�f;�T�����5RV(�<q�U��c��ȓi�_M*�8Մg��|U����U3�5���%v���t�����]LW
o��+��1 ��/�<V�
���*��[�՘+�ޤף�M!���O���5����*0n{J(��qH6Ӳ���T�̞�L2�'^N�J)կ�1N46aٵޮʜz *�K��+=�eb��э�ą'V�^���E�A3`Kf�5��G���T^.�����p�+�9���`�7�=�+5�8�h��g�k�$��v�)���#Tp$�I��Ҳ�;�Z8�W;�{B��ͤh'7�J�Ʈm��Y4�4E�<�הt-xU�aխ���%c�5j�?x(�l^>.�ۤ+F�H�!���?S�JuVӌ��_^;)�D5s��=B:�h�{P=�R?�OXy�QC
ye�2U�(��>�_Lx��qVb[F迶��IT��4_p46��M`T?2���E�"�ܗ1þ��\;{��d��/#��1l&C����
&�J�z������0��-���Z�R�c@���Y����o0�����n6����Zpr�/:�+d���]F��$j�&��j�'�|v=G��|g&�\"�n1�?��},�C�j�Ǒ�l���LY�;����/J(ܓ��^x7Ϻ�H�P�_06Mx�Qf�l�辆�s�'�!���\��T=�5	��E�y8K�<�����\�\��Ep�dt��4�/?���#��KFp/ڒ����ϠR})�7�t��VSI%��↿�(B�7�`*�kzh���
�
��_1�ˮ�b�(���YJC,Ks��^/�]+m`��
��,���3E�0	ץ9�A!��`�^%��;�
죦�����9�
.T�#����BQ�g����*?�K�wS�Dc4�	�����0�H�j�\�{�sa1��8�-'Z�H�)GA��H��=�?i������&h(�����	����cVo��� �rL���>Q��@0�aa�g�N3��I�3풀���Q��<���� '����GӾ���%���S�1:���7[�5��8���$F�����WPi�w��1;RQ��6ن��S&��+n����3�]��`�
ZuF�n�Ʀ�l�P<җ��+��_���H�Q��ͬ_�������k�$ճ?>�wZt�1M�@��w{Xi"��~ĬA�\8�/W��(�k��'��K]����H��!�|kp%�.����#����Dp�����r|��a��l���`�N�{�lq�(P�a)�H�L�M	zW�H��0<�l�_#8l�&]3Ø<)���c*g/�[[��S?�K]4���9)ˮ���O`9��w��y�*����1���T�휌X��R��w�x	K��aM���/Iv�wAD�	�,ݷ)��Pug��կ��1s�������Ao�P��kK��er ɮNoϵ����f?h S\���ڨ�$�����0`*��X$�bBYu�-�n�m��O�����[���>k4E�W�/���S��u�P��b�b
*��C�!S�^��U�sT����-�����ر�'���Tǽ\R�E[�F��l�U:����kG�p��H ���5#ݡn�Ot�s�mE� ����N!�"8�]R��8x��PK�1:X�_�J�����#j4qMq��͗�"yv��6�I�fn�'Y-Z<��[BV���,���z�ܐ8�q�Ȯ���5H�3��%�����V����@�1C~AB�T��f�"vi������_��k�A_���~>�/��OV3�u�յg=�+![H�3�ofҝ	�
���#���sȴ�t��L���#Ft�!J6���c������=�iڃ��Eu9,�<�R��w�ࣥh66Y2?R����{�nU��m����>��c:��HMz��`���0���VK�ě$F
���q�^��v�+�����A|�:�u9х��!�3�|Bף���G����^xդ�FC9п����TlG"��'�Q��#��
��q�������=��$/epSR%��Sۤe�<U�=�I�X�QE�q�p��e��fǹ�{pK��<�U
M�l��%������P> n����QNōM-��#��j6G��7�{U9��.$Iȭv�j)�j�wh�|�
3���#0�s��܇�To��cjnӜ��f����ԑ _D��'�5�h.Ck4:eؾ�	:�G�.ͯy3���1��|�0�(�XX�s�n�f�?�\���������H)�f��K!Ղ��p��2�[-|`�<9�w,���~�L�?�x<�q��މ4*�8�t�X��Tj\�������K�����Tx�Y�������ߍM��w��ǅ�ꐗ�.0�h'
�R�]�4a�\��|��th.���O�����ָ��o����	���3�u���,�{`�P���9�K�e,�	�z@�̪�T��;�<��OQ�������)N�ϞOp-]}.rHO�A�ևpEO�ո�k�4��zkG��PEp�3��Ȓ`���90�	׏p!�g�	��Z�m� ���dO:$��؉�S"xս���!vW9�Yj`DpW*��3����w!�1Ff\��8d�y8A�d�-�u(<b�%��3O��3*������'�%ɦ�i ,ڛo�:�ƈ$�����M��J�(��^S>XA����9a��sU(%�)~�,�D��j�6s�>[G^j��]r��,[q�a��ؗ-��k�G��i��b0��+,��X�������q!�rJ�
�(i:I�9�'oJ������Y�7�p��09Cf���У�b�2�g����)���f����RT
���_&#!�$y#Ikre9=9����.u�۬T�K{�'�����"�o�]��otJ�ڗ��kn)��tQ;5#�˶�4��ѓ6�������)�$��CEAYa��ɚ�6���ڕ澕��ē �sB����y��#�Xh����F�����`c�D����԰]MwmgO�R=�$�^�W�kr,Y-�P�7t��V�5a.$T�`��!R�j��`�钻݇�jZ|��8z��J�џT�4�%�X��%�����g�a����!Vf��
�5��Q�(���3��ѳ�h�:����!:�k�}����C�$����Z��B�$b|^n�z	��t@���T��Mh�+���"�u;4�<�
�faб<��y`���ǰR���N���A��.ы8����1���﹇����r0��������g`�c�YjDM�<����`V�N�
�c���@�3�l��T���CRj
͌�#�f���݅F>�\����"�����Q:�W��&,1���������V �
�ˋ��K���wD�͉0Kn�#;v�K��t��ơ�Vǻ)��o(+N��Fv�'DV,�m��/
��4x�V��R���Νswĩ���ҵ�d�"����	���Ge��~Z������N�8t��p<����g�y����b۳��
��k�uBǃHbB·w
A�:�D��"ʢ�Ԁ@$��/*u$��$���D�v��{�TwժUytm ����u��c�v~=X�|Xu�������ƟZ�Y1SG�E��$� W�E��z�zkR�ht��2�ۗ�Z?��r9�.���ҟ��~TzJ,��(��w�g3L"�8��*�*Vnhx;(0�q-W&�C	�v����8,�e��HΓn{$���Z�K�B�Y�.��2�h��$�cC#	\wm�W:����܄�����J�ҡ�3��^,{�AZTݓy�2ê\��g����:��Du_�+T��'�c����A\������m�d����%��F���7gɛH��F]��v������*��q��'���~�(��I�]����} �M�y�/TP�9�� D�O���я�8�\S`��W�ul]w"UѲ�i�����f}�H'z������	ct����������%YM����(�J�#����@��>;��`ߋ��p������@�|��_�	�����v���zɿ)
������y
e�q��Hx��p\!�Q����"0ȒU�d,��e�!��o���`ݚ�d4hr�M�;�+tXi�������y}i��JZ��R�����-�X��{2!�Q$0G$ �zot�+:	͇f߻?�����\Q@�.�uS,-ٍ6�O����C��1�܍jʠ����Lڐ�{��L>	��O�*9"����Ѓۣ�|�8���i��B>�}c;�l�4�����ҹl
t�M���f-� �k�ya��1��#�\�W��R;�.����RY�ᷖS��+T�����(��{#ߙ�s0���w���J�J�B�F���(NWT�y�'�%P��ϴU��
�.�F���m7��)징L#O�踖<Խ���J4� d��[`m���ykQ�H��n�u�-���?�q�������j4��
����L�V�
E&�&P�8�#͓HF`|G�g���C�ec�%&��߄�<�u����R�$�{�����B�d]#(Ye��[�VyY
dT�p�S�Z&��
�Jr4{�?^C4�K5�	���[��ǻu�j7�]�-�{�s��@���F����,b�bN:�w���:���&���_��$�R>g1���1�q>�la��/s8f�4�8f9pN�mI� ��4��~�;�*����
m�W�Ne:�-��@x}�p��j�n	�޹��x��5�!5�~����Q��0��L��HO3�M���}�䴚#�
�{8��[����|���¶XPY����u���Û7�,Q0�2"c�9УN��C��t�Ǎ��K�����ᯕ⩐-'�'����9�m
W��-�ퟰ��<��E?Za2[���d�&��ߴ9:����^���:�E��.���E���CXF���g�9�]L������)gw��&�;�
���|`�v?c��� 
��Zr�儓 4kฝf�u�D6��׭��h���� �āA�q'u�|���'��
=b�.������5��fE��O�����E~����R���!�V2��/h�i���Q`���n����Pj�F��촧���r��hG�3&��Ət�?_�	����s����Y
#p���3��E# �I�nu��3`�Q�a������O���~�s:y�2�n-5$#�K��`
�
E���~۝`JL׼���b8��
�A���תN���(�(Ѹү$�������z J˽��I{��;���d�2F�9{����������輺v҅>�gӫ�m��������Ʊ������p��5R9`��O1������i�����=�@�8�h��n#}���4U=q�Ʀ`ԗ��U��Y�t����S���Y��kd�f��Mv�]��}t�4���Tc:`(�Љ��y��9N����m��;�$2��>����	���^�C�B't����0���}��\d4M�ț����!=�I��}�dw:�FU/���!3Q��A�F�s-�^Չ���d�|<ԧ��v�9$�)
���2�t�c�
c��g�ℍ�(������M���rP���(,�:P�S���U@� $r�~+�m����Ƙ�]���8��(
n�<[sp�"@;�怜�a~��:�	�D�JAU��_�j�Ýz�#� �AQN�֋����s��	�h�@7�H�u~�SX�?GV�[�ڶ���ڇN1+�|�TQ8��{��U�n��J�$�~S�\����[*��:�	9���M�lD����d���GuZ	��'K�Ĥ��If��E��J���ꬡL|���B��'Sy�n�s�
ڐS%� ����7�t����S�`;���i[�g������.���0�s��>��w��!%����ٿ	�!�w�l%�!�j�ѵ�,J�vQ��dp��1\��<u���@�$Y%Ϲ {x<#^������[���ȿ��
+֣�Ks��/�w_^"���xĭ!s)^ݡ��-<&\)��"y�x1� f�uh�,n�ɸ�@�!�C����W)	����],W����৉��5��
Ǌ��"�̅�]#%E<�~�*u���;�'
��o ����!QE䥖��$�n�}���L&
��d���O�f�`�l���&ю�uX ���ט%dyǁFH��v#�N��1�t%�3U�5n��:�Ԅh&��q.�:�'F.xpu�U��"�j$%��[�����
��Ԝ7�M.�澞ڌ��CC<R\L� 6�J������L��@���ݙm[0O�ӹ�l�)�u���2��
wK��x~����&�$�%A��/��4
�	Eg2L�w���M
	Ƞ��O��c���Uhp �<�s%\{2H��U-6�<y����SW�u5Q�5�Y'�@�;�g�h¸�~�����lw�o���B5���A�01A�@i��t�d���N� ��hH=��NN��|�39�N�A��N;b�"|�o�@@�"��N-��#���� ��х+ړ��kS�bo�u�e�VKX�!�@v�m��j�ső��?�jO���@
ݺ�TT�sHz�^�I�D�V�SS��w�+!�N5�O���Wܰ�&���
a@T&�L�.�i
��P��+<Y�C�)�ǡ&���Y�	B`^�!q4K��Vo�j鹞Z4�
�;%�Qnv��d����)(F��z�)�.m_�y(p삭�7!�Պd�����H��3"	�O����O9ԬB���>�"upY���A�!o2�
&�(� ���XTl�\���6�	�����ݻ!<���Dq!���'K�A߅$�裔���������1[WW<s�γ�T��"2����S7k��tx�����|.h#�2�)93���
F�hD&(�	��f�K5q� E�%0�D󩢧�Boh�Np���;m�B�`d~r�6��NdB��S@����ߛ�Z�m�`�����Y�h��3Xc�1�Y��:�*�xݘz]ZRRi���Z9\sO��7���u����Y�~i%A�f��a}m\�;��bR�n$���]�.]�È�&(YǶ�Aj�]����v���� ��m�#��J�Q0I)����i��r{������gB�`�-eRqp�nI���C��-/��w��_�a	֙�|� �^�J��[ 0	�4ց7�Jm�Z_��+�ݻ.�]��͸�p+���@�\�=#ϳ��I�W���{�ҎN�k�F	7Z掻Ap%�C�~/�n���F�8�`�Dk��Z�IGӣhǎ���b�B����97d�K���L�Ɓ>2�bP��%C�i��-��(�F��ޏhk�vMl�%q�\��>�@.��_�M����T�hX�J�r�r��d��JA���a��0X�R��q�AU�$����T��v��|_MQ<��M��i�ɹ&~Wĉ�Hd.
zC5�ؼ��q��R��wcu���)pM�Wک��H2�3��)�E�}}%���0:��E�f���W'�!>�f��������8���������]�������/�9�ZZW�e�
eյ~�n��
P���~%
���ZJO�]|�.�%!P_e�����H��
�̤8k��c������{��Ԕz���`��n�:^|����F�������
�R�<��l�@b����2�<�R�E�õ=o��W�Y���n�bͫ����7�vK�ک��F�����p�E�����d��ח��������:�
�ٱ������o�6�&+�]4KX��ahX�-�Z�޹�h�!q�j �I���|����HQ������������7������A#ĩ����3f�е��i��ߠ� H�֪8�bb�:�� ���WE��T$��;��Ɗ��_��Ex;�rR���l�?�|���!�p�W���M��֗��c%�=g�:�=H�'o���Q�w�L�$tէF1 Fr���3���6Cs�����s��i�̈́M���ZD|��c3�u
�Sy]r�ơ��ݜ��,9m����տ����Z)E��Z8���h�sJ��������-���`�^f�@nߔE[~�~��ԮK���d�yVCE�8�3��$a�kR�!3�f��v��G�"�a�ҏ_��
~Qc���a���$f��2?-Ϊ?m�� �QDE�!�8�Q���$�����DV�_V�,3۹e��ęf�NE����L�����<.������ӛ�ǲ�l������,|v�u[,�)�]v��Q��k��V����������t1�����'�0����E��;_�g���k���j�'r��\x�B^�J��i�����'.;�g�/O��[�5�"-��	Y$�Oףl�j�<�l���~o��@ql=������غ�yf�^�_
�hbt�����V`ߘθ�-�>p�3��7n�c0�&�!B�:%��ۿ
7:F���R	�mfaZ�_NcXt�tl�:���nX��C
o�u�fIGeb�ε2����ď��?K�H���?tB��6��E��h�\h�m� =�.��,�f�^��l�;��p-�"S�qeG�`Ci���5ϕ#�<������f���f�i#$C*c��p��:�����K�7�ɘT��Uu��I�J�S7����i���`�7�P��^�\�[^����V_T�b��6���M��W^#we8���i�{b
��$�����y�ݒ�I�
��ׂ7���O;^��4?�|��3$�Zu�>BΥa��jXu����u5�A�<�3�i�u9hբ�Z%�����Oʘ��L�H�l㺉-Q�\����(���JK�|G:�a�8M���^�w��~��ll�v��J�%?Q���� ��Q�`]:���`""k�}\+�.�>F����FT�x'p���
_d_*҈TS`U[ER~��0v���,ڗZe!�����?��Vc҄��r��\� 퐚Ų_�˲wSr/�W�W}����輢W�� q��P� �Z�_�R�2�o
B p�7��e�pbb���־e\�����Y{���f����49�H�<0TH?����H.�/v�+PN(+?�b�cUfW��U���谘k����2���� �1��ܣߢ&;�Q�&F��|_��:w�nZ�Q��	��gT_�{��_I/�GQ������
 8�ە,䭒G��0��ѧ� Z8B���b�1�۲hdb
�AO�҅�.���36Ka��'���5i�כ{1D��g�%�~iT���b��S}ת
1�<U슕��"���`��N�cɨ�E�wn24����y2x ��τ~�^Y�ۑ�!h��d
j$�� ��)� �)�u1�8c��}W�{���N�'��p�r��(�oR�8v	La�(��sP�Qlt��Dj+5`����}�g�/{!H��Y�����ރ��:Wlr���-CX�"��hpb9���(�a@\r��8OCI6��z��M@�|�t���3UN�L�R������R�%#a��~�!ȁ���*���݄;(��[�>���x���HYv����'�]�ٴ�ٶ���#6��N�'�@��v-�r�ђ������������1��K��B�p�z�'z��:��44�UX$��V'2���E
Sl�|�&s�Ͼ�`3�)n�5:�'�#�:O���r
�Γl��Y�_�y�
�r���`�d%ĜX�g��QR���WEKR19��x�*lF�-������[�O�6���
�V҃pTS�R�J�/�Hh%��-�F����������8��R4�/���Q���u��� �Pw��}��������C�CUC���Fnb��v�)�Dd���,��ehi��{	lx|]�)��6�7��Xχ����S�bb�v���pLl�ܻ���-!�q��O �:J�$����%L������X:��liz18�m~s��4���C�a°��j���Y��-_��Nd� �c�xEd���?PI�
Զ���0ri2���z�,b��6`��+Wpa���\2��:-:|��|�g����Zx�v ���)���2lR��y���Ic��S���"��8\Ne9t�"ChN����ǧ��dj��";)�S�
������q� �&�Z �~mw�ڞY$���)�>�>��x�2,�oU0�V��Qo*��=��f�P-H���� �/�u]����ο����	��(j�f�!S�L� |@]9Նѹ���?��li�&J1;����?�Q۲��d��|O�*x��7���y�F��5 ��>�'�OB�7��F��"��H��öL%��8�I����*w���l�K�Fv�-R��ʛT��λRI�r]��s�P?Ma�CQ\���,�\Z�^�	8R�;PW-�h	l$��CB4�o�����ҝ[�fOb�S$3T֟�X�?Rb�G�x��� LI�����*D)��)������F�e��2H^n���
�zD��%=#�B��A_3��<
o����ؠ�p�B���nMم�;��G}S*ɖ�id�r��Lxq�Zkl)�X1x��<Z5���h�4x�Q�h�#�R�g���fǔ��p��AH
�&�!}O��I�-<l��8�а�.a&�
S�>��(M�}#y��I2Y�0�mbȵf�:�jvb<]��PHWU��/�a��%��<��L*c, ���ju���
A5-�
jQq��%r�X�Kǝ��8��	ꝍK�?���X|��s��&��;^0u&� 
X�d:I�6+�E[X\,"d��F��z���?O�4���(Dk�r۴(�N��`�n1U�:g C�����c����ȿ�O��j���+�V�J�QҨ��:|�wB���)��?��3����)3b�?�o�.�y�L��>I���hd2l��+��C�:�+�e�1���P�;�,�&�!Fv�,5���7WI@��|q���%���� �	�7�[V�Z��C��������;��M'���a*����ю:MD��[�:k8�:/o�L�L��?�?a�-ڜ�$�����;�b����d�>�6�E��F���|�<�fC1:.F�� ��َ:�1 3TY=wk���
���%٩�?@���m�x-��7�#  ����l�{�-V�l�y���P�/ǘ���kI�Ý�������?���O9�����;%C��r���/�`Z�.n?U��?������Ͼ�N��/�pO{�F��l.�0��F
�����-����;���`�z��`?�}�g�ύeɤ��h*�E<|e�Bp���&�q��^���:Wi���ِ\�_��|�Q���F�i����k���Jf���(KT��X3K$����7�� ���e��Yn�������x[r��V����@�s2_^j6��ఢ��I�l����y��;�y��[o;�����o����MJM�[��5����
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
                   W����H�Y
q<�"��qg2�4G����|<�ģ[(W
)�܃F*�p��D�./�r�������oV���l��<�RR�^�u���g&�|�N�F
**flq����K���P��+��P�y=�V�(��4[�q2W�)�!&X�X$���|�'ϖG��p,Q�W��j�<�?+�f���/n��U��]�Y�X�3X�p0�^"��Z�'��`6���giO�.�[M�F��<.��^2��	�t�X��Zo2yk�����C=����`��X�]O����\\����d�i����}��+ؾH��n�FST��_𿣄��N�ddXX�6�߹	���IGy3����,2���M��c�J���`2��yf?3m��j�<��t6��{5��Vnv�P*�R�B�Z�q�v,�דfWAC#��S$�j���9���{CY�G✜��.@����e����W-
�S#%�����x�{�~}8��Ւ̧��+d�p��F�ڰ�V�I���)�C�U��6��Ə$?'�����?{v}p���{/7,�]/J�s3����t:GA�
�f[5�Gapj��=���(������]V�`���Г0j>R����=4�� �N�D�W+�YN@�ӱ��M�P�v����w�')����ȹkŲ�^���]j?ɓM��n2%�Zf�u����y�ޏ�t��W�t��Tw��[�T�vy�>�s>��t��8�i!���1��mZ�R������7%�f��{�l�%��ˠ�����_k4x��jRL,���Z�&�5����=1n��N��������F�YR�V�"�;PZ����;S�.�O`P3��
̽��[�?B���n�\
+����=�M��E��
�yO���� .��&���T�=�bp\1*LP<=����͇a,o����%dc��	|�@�Y#�t�ޯ��������[֬���.�Ѽ�20Ln��xqLn?�	_2�QE�X/ԭ��X� �+�B��k��C��lb6���V��hG��=�']�u�� U-FȜ��O>�M^m�H�K�׮`��&�\�S�_����� <��;�$�q��v%O��j$�L�k�~��z���xZ^��e?�=�U���c�'h�-��Iut��t+1 �7�X���騺��7p9��8���g�єIi�U�H��*[�6�ꦬ�k��إ6�ſ}?Y���.Q�f۝�u��o��q�M��+�m�bq�c������n���p��p�����z���I.��?���5^��rqP��sS��Ba�) �
�8�&������5s���a~z}�%�z4���K<_l��S��і�(
��t�c8��5T��߱�Vc�����Rq��޸B�4ĳ�@F6��9t~��"�|�A����yށ6|L��̩<:e
�x���z���ɫ�Kɵ
�${ ���|�om��ˣ�,s��m�E��щս��0��4N
������,K@�����m�����6P��K��s9����V�t]���h��C�fI��G��6T6iG��=�À[��89D�������(S�X)iF�c��rkl�{��/����~��E6�M+��D\J2X����Db���Pr�w��l�0�h}�P�X�Z\Ƚ��}t��@k ���s�U�4$Z�g^����9YjAV�G�3:?C�тE5.)�D3;5���F��|P٧5�j��lB��9$��ğ���5r�3�Sn����u�Q�3�哿��}�����2O�4́����i�J�V���ӕu�-�M���ӹ���)�I�>$�ŏ�֗q��e�����N�J0��w���z&�g2x̦gw��[N$�k�8���0�#�Ό�J	9��}�C��UZ��0��O�2�GU�ѕ�=R�?�E:H������=�6r�]�����_"$[lo�(ɫ'*�n�`d���u/o��v�/"�2�Ja&ROH��������g1��NaZ�K�}<�����oXq�7�ܵ����~�9���O��U�����'鞯I~���p��z��pjh�qD`�n��a,G���q0"�ٮ��kMc]c��4��7��W��(���QPu4���^�3A�UJ=B�̙]�*�|�#��IƋBq��q���P�/x��}M0j�C`�x�o�c�mgU��:�}��;:"ɇ=.4�hY��*2��q~#-��?��nL6����+(�@sAm��x=��ְ�I�A�B+^�~F}2�*�@��|�J�S^��L]R멋���1L@y}ښ6ACi�ϵ+���kE�D�3 �VQ���\�H֣��덛�l�V8U��A�+�{�x��e�J�~Eќ֑1��J��>=�|ǿ2��L���%�3>�b��y%�C|I�������߷3�s'#�K���(�S#�|
=��
U��8���t����Ŧю���_ʈ�3�h�4�����sj=��l�DY�ě�WҮ�2� �&c��2|�^l��:�I"Pi#=nB_I%�,y����EJ=�K�B+�	�����GQV�ą��	"(�3�5���$z��ߚ�Ȣ�QbP��j��]�UH�j�Q�I�jq�x�v��� �Q7��ǞU��V�Qj�ӿ�X1�ƍ����}=� ʹ�6X�۳�OM�q5��7c�$}3���]�&o�ד���p���J�d������`���KO�1��Z����K.N̆^c�C�JB��7��#�\g�2� k�K�3au*�]��k�2�C��Wl�FM"�����O��P �F��]h����#�];�&�ߍG��0}Z��ۧa"_�`b��/Մ�������o��V���(���?I#����/��9���2!���N�{s����רʝ� �X/�d��}��ʞ�7�qF�Y�c�էr��+��H���C����w�+2y�ɼo�������Z7��ᠡ�5�+��-v�]T}1�*=}��;� ��Uf���@�2/O����L+�ZM��?|�c��{=��"X>�0}�KRh�j�&�!�,�zp�X��x��~�<tQ����V'��=��A,ݎ�/����k�!&�gB�u��O�)Q�c�ғP�D�)���5~�m�J=�v� �r�$�*�(��b8�:�~d� k�@�-!��{��.,z���o�a1�C=U_�>���#�!���e�9��2�<�9��{$|��m�ߋCd���e4ˠ�eV=r+${4�Q�~ت�3g��/�ٽh\�㳼�4�&���z�+�⚲x�"LӦ��V�����i���[���7 �� ���{i.�J�seW�.�y�%�%Z�"[^��%j%{ඤ@�Tz�0���]��^$�7�=���iEz3)��~�~A"�8`��Ez�O��=�f��nd��aq�#�{����'{a�.I�E� C���Ո��Qz�����#�x�,V8v��O�w��j`�S�Q�5pi����Ub�qx�'��O�w	$�5�<���r�+%N����K�S?FG�\�����4����Z�<���|�\�%�I�T�������M����,e�����ԶZ�;.�ڋ\�1aL�8B ���
�X�/��W��D���1�G	��Qڥ�+�y��p��_T"��P���@k|??
�,��~ZR�����T`f���i�Z��>o��j�"V�w[��N�M�b����̃
��(�<��`Ԭ�[	���k��P�1a�mkM�G���XC����I����F+��J�����k:�*�&��Oe�uxO��Ⱥ�t�m?�A>%BSb�[>�Ӝ��?�(�G�K<��%-GD�zz��*�
���k���N���w��QV�ǁ)Y�^0�
��A���ǁP؊��� ��Ev��
i��
6�o�3���L��׫���+=��U!�����C�@��������cE'��> /EJ0dz��� $��i����&Jt�T2�\��
������5����~�Bt�����h�}J]���^>>/ۯ0�y>��a�9O��Q�E�4?�DQtLvDO�V���3ݔ���OxL�t�D��ʥ�̈́�R���|�^�Sgc1�~)W .�>�Z@H"f������s��d��}4����n��Z��f���������
C:A�a�k&ouL�
`*g��Ѝ��8x�2���f�8R=�D�Oդ��A��z�7!,פ̝P
+#�QDdd�٘n�\�E�Y�d�9y&����MCM����X��}�.7~���������$�9"s�r�2�"�s�T�ї�cx�;O$�W�'��*��7�6|v�U��04������|H=9cL���(@C�vZ��l)J'��\'*�슧�2�f,���I����S���[���
�w4�ë����ZJ7���p יJ��[�G��*{+������2��E�9$�k����7�h['�<x)Y3�M9�u��N�_O���{���-~��Xog0���Ѻ�A��ɫ����3��4��.�Ӄ �Y	�F"�kq����1J�W��G<�W�������ŶF��N6�QƐ����Z41���;GD������^8��n�$��&T�<Q���M�A+Ѝc
��4��u	|��T\���+gX.U]��D�ꑵ��׃����Q��|��q�:+��xhq�b��ؘ3�CD��8�k�E�May��i��.�ն�����Ei��v�$��LIy�=�KLی�8�(x3v�6���]f�����b��t�g����Ct�~�I��W���Z���W��ί��6�^���;`{[/ѐA���HX��'5K�-�
�Uʃy�o�w���N�3�/��<�o�iP劉�S��Y}y��)�a^����՘r6;=������5������l�v��SZ���8r~#AԘ��eZ��E1}1nP�i���ËWCc����.$0�	���կ^���PcM!(�X�4L����STw#	{�߸1�#>~��#���9�pz�=�����'=C#]���������La�򐾞�G��S�B���$Ϸ��=l�6��}��o&$$�g�7�s�'�Oud��f�-��[�}�ľh��77{�L�"�'����^���o�h���!���YkFx��Z:���⯁�W�]��<����E܇9F]�1e'ɬ,'��]�5S�h��#j'�����m����K��j�e�Yr"�3�mB󔈋��?��F+n3�3LQK��EE)u,ř��33Ú�?׃��R1�d��'���#�,<淔���c<Zg�=l&�,a⑛S�Al�tAV���C+{�F/S �5��-��?�~��d��пh1���n���>޴�,����6ϲ�6%y"��\��Ǳ�����L?K�Ã�~���X��&�v�QK�~uv�2��ُ���������Π��B�g�(�'c�Ȏ��}�1���K�.)+ԧ�h�!o%UᄧU��X�u�~���g����.o��wL��l4�Ou"��{Id�� Ga�~�o^:�]Y�':#�O		�ߢ���zc��Si$��luy��[�]�6E����,�N�n��i���m�6g�G1C�})))iխ�72CL6M�f��c��v��ȸ�˼�	竻��}PVZ�t�2��͛�,ed��p��X��]	j�T*�s���`�ʾQ�	���iZx=�%\�S��K�@��^�G(�)��haa����p��\��K�U$��xoƱN-�w^��M�fiS�|�~�&��
��m���嵒@�1�����#=�9βp�`Ֆ��D��</�1�|bE��;�_��K=�햇1"��t�&�f#J�9I��Z��y����7���2���(J�`�#z�2��Gl*�K����9F�M��H��3�):��w`m�Xz�c�X�z���R��q���SJxo^���E5�V�!���%uc���r�&�Ӕ�`�HoA��(K�Ts�/|�ɬ0
l��Cl��
Զ�����R,�^�t?_��
{֤��AT
q�Ӈ� �������P���nj@y�_�|��q�V�<�Ce��ȸ�]Gc"V��.�Z}~{<&oo�Dq	E��k�`��W�؁�S�g���	+10K��"Eqb|7��
�"< 9�{���g��Uր6�*�J�r9$8�� ��p�Lhe�l��5V{[7I'f�U��q�eR��B
�����$�P��QZA��1�����
���k�}�U��8�϶p�����2�2t��Ǧ��<���K�]�7J9��K���,-{W��	�V�N��n~Q;8�����U�[g:O	xXl�۬��ڸ�6T��F9︀��lܼ��#��Y��3��%�[��o�2M-��6I��G퇢r�c�x�hn�)G#�|���(���ܷ���/����n)PZ2G�{s���DrVc$$`kw�]�Pa>.R%�S@����P&��v¬�܇�J��Ծ%�P��U� xn~�4�s�\:��v��5^6ҥ�:}$nű�*K�DMm�/'�v��0���/���m��.��D5��{��'��-��q�zt���P�DC�����{~��8�������|;g�z���KH(֙2B㬷����'[�`�='׊����/3̡`��6��ځ()�����A�
�8(��	X���pBU�*&r�5�P�\��������W��l�N�>	�Ι�)��n��{߀������k|BL�יִ������{�h3ǃOz�i�A�^J{�m�q�@��������}-_$���L1�rԚ���(Y�D#���h|���0M�� 8�#'.�<�c�:�r~��*FV�R��
��#YE7pޥOW�L��oԥs�1����,QFO���2;�(�tߢv\`�#.\���_�u�ۤ��,���
�4�W�����|f���n�? ����6����[ñ��з��շ�	�b��Ð�-
l��s�ϼ����Ʞ�0a�y����&v�	�"���_p�q��q���'��~��o�����>M��B��uu�F���?�m���d>6-�+h�-(�\��a��8ՙ	������C�v<lv���'V��~i�a0[@�N<���>'"�����Vh�sP�J��U��"=�up��֬�����|H�����G��;Q1t��T*ۉ��g�ʿ��6�v���X�Yzv��z��Ry@����5�/vu_���:�����,��=�7��Xg~���������W�8!�����'<��J�[~�V9ę��!�ោFҚ��<�;#K�x��d"T���`�gzT���~��nD��X[�@�u^a ����ß�(��m��A�{��o�~W�[���!����: �;�e8�l�A@�/���T�����X��M�}�����߆N�R�(��������Q9�c`hTFy-�ɡ���&Qv�]K��ɞ#�zf��L�Yգk�t���@C�M�x;1�k=?�ޢ�����Bm�O�欐;�b��i��
��ʱ�B�Ny_:�V�yb��l�p7���!S�
f��7)����,Ӯ�	��O8Z �IV�;�,T1��j�t`*� ��r�VgAID\�����΅����+ �Ӟֽ���lQ	�����(��6�
WQ���ϫ�t�4�P��
��T��
��4��~�e�o+O���G.�̫��-���g���K�X�F~d�f���@�H���0��y�;x��v����qX����(2,瀮#� �,�6
�FjV��]�f7+.�ti��-�`��B4��Cƶ�I�=�v/w2BAw����R(���$1�B>�S�r7���3��D��Xq�(�nT��
��'���X���sFs�#a���a���(j0Z� b���
\