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
                    <span>商品搜索：</span>
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="mid" id="cur_mid" value="${mid}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
                    <input type="hidden" name="orderType" id="cur_orderType" value="${pager.orderType}"/>
                    <input class="has_reset inp_search xj-hy" type="text"  name="cl" id="cl" placeholder="分类" value="${cl}">
                    <input class="has_reset inp_search" type="hidden"  name="mn" id="mn" placeholder="供应商名称" value="${mn}">
                    <input class="has_reset inp_search" type="text"  name="sn" id="sn" placeholder="商品简称" value="${sn}">
                    <input class="has_reset inp_search" type="text"  name="bc" id="bc" placeholder="商品条码" value="${bc}">
                    <input type="button" name="" id="page_search_btn" value="搜&nbsp;索" class="inp_btn" onclick="allG('${mid}',$('#mn').val(),$('#sn').val(),$('#cl').val(),$('#bc').val(),'vt=list');">
                </form>
            </div>
            <div class="f-fr"> 共找到<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个商品 </div>
            </div>
                <div class="f-cb w100 mt13">
                <div class="f-fl"> <span>排序：</span></div>
                <div class="f-fl">
                    <ul class="pro_sort pro_sort2">
                        <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                            <#if pager.orderBy=="sales" && pager.orderType=="desc">
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">销量</a>
                            <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">销量</a>
                            <#else>
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">销量</a>
                            </#if>
                        </li>
                        <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                            <#if pager.orderBy=="price" && pager.orderType=="desc">
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">价格</a>
                            <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                                <a href="javascript:void(0)"  onclick="allG('${mid}','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">价格</a>
                            <#else>
                                <a class="arr_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">价格</a>
                            </#if>
                        </li>
                        <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                            <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                                <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}&vt=list')">评论数</a>
                            <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                                <a class="sort_3" href="javascript:void(0)"  onclick="allG('${mid}','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">评论数</a>
                            <#else>
                                <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${mid}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&vt=list')">评论数</a>
                            </#if>
                        </li>
                        <li><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}')" class="sort_4">普通模式</a></li>
                        <li class="on"><a href="javascript:void(0)" onclick="allG('${mid}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&vt=list')" class="sort_5">批发模式</a></li>
                    </ul>
                </div>
            </div><#-- 排序  end -->
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
                                <td width="140" style="text-align:center">商品规格</td>
                                <td width="220" style="text-align:center">会员价格</td>
                                <td width="210" style="text-align:center">当前价格</td>
                                <td width="144" style="text-align:center">数    量</td>
                                <#--20160505 dzz 隐藏库存显示-->
                                <#--<td width="114" style="text-align:center">库    存</td>-->
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
                                    <p><em>所属商家：</em><a href="javascript:void(0);" onclick="allG('${goods.shopId}','${goods.shopName}','','','','vt=list')" >${goods.shopName}</a></p>
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
                                <td width="220" >
                                    <ul class="price_info">
                                        <li>
                                            <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="商城价" title="商城价"></i>
                                            ￥
                                            <#if goods.enableBatchPrice == '1'>
                                            ${goods.batchPrice}
                                            <#else >
                                            ${goods.price?string("##0.00")}
                                            </#if>
                                        </li>
                                        <li class="red">
                                            <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="会员价" title="会员价"></i>
                                            ￥
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
                                            <i><img src="${base}/static/bec/project/ghj/img/sc.png" alt="商城价" title="商城价"></i>
                                            <span id="${goods.id}_nowPrice">￥
                                                <#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                                ${goods.maxBatchPrice?string("##0.00")}
                                                <#else >
                                                ${goods.price?string('##0.00')}
                                                </#if>
                                            </span>
                                        </li>
                                        <li class="red">
                                            <i><img src="${base}/static/bec/project/ghj/img/hy.png" alt="会员价" title="会员价"></i>
                                            <span id="${goods.id}_nowMemPrice">
                                                ￥<#if goods.batchPrice?? && goods.batchPrice != "0.00">
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
                                        <input ty	����c��ʅk��;lu4Vm�5°%Y�@i��+&	w/��|�ps�[�,e�7�w��_���^�����{����]�w5��R�����M���d/?��Ʋ���;���1Dq�����$�AfY��:}��M���u� ���_����p��t�=ǈ���w�/h.GF�e�[�o���[D�$�G��ߓ��=�ON��oA�g����VfG�&��s0(�f�a|Aϣ����aG�� +���������9�"�˶��V�8ͷO=}]��\�kX;�z����m�������ej΁��t���jG�;zuljm���9"�WH�]F�l��X�~il`n�����2��+��莉����Z	9����Y�ǳ�Ǻ^�H:gks��a��DLX.v����o�J	y~ �}���[0Kꄛ|h��	0bW��l 	��-�1�
̉�VO�b����Ϥ�c>��~�-kZ�RI�_��|�$%��##����������mצ��w;z��[�S���v��3���	�f�|>�8��d۸q@ቝM�߿�6�Xo�:�˗�X��-��,<=���mDx��92 Ҳ��D&E�)���kZkt+`�8�;f�I���.ǯ
��)=�W�0D]kΣ�q�����DQϡ�i��5���ǤHfA�GR�(g|M�EMʸQ����P?J�
x��������n�NS�n�\V�y�v�u��A~ؗ<@}E�n�5,iL~�Yϑ�[��=��ɻ/��IG�W��9�.^V	M!Ƕ[�+�������o�?�)�I=�v
 Q�M���W��ZŻw��pb��fi�?���Of��#cnI�����n���(���^ޏꚶ�K��?�~�Z�n�|����w��H��A��Y��:.����S21��c��ث��
��зS�-ը�������8+������n�䇳t��駤T��R-�ц#~,h��H��j�\RF���K��H,�����W�kB\�-��P�x���hu���	�N@X�@��
���V�9I���%baF�.��PAmC|w9_���W�@�u�aL��F��Ц�6�%�,��#�ٰݪwSu����k{^V�$����9/SMC��nA-���~���.8�;�>�.�E|Ls��bB� ����|p�X�*΁����5�)�b� �j�(�,�0��B�%��������H�����
.�x��|oǬ����=gs2�.�ÅK��b���an�kC�N*���p/~b(�t��
���!1���Mum��G�Z���S_s�﨩�P�a�ñ�u:�
���L���������g	ף�P��"��71�<8�
0�*o��z4����Q(�s���{2g�S�v��ߨ�-=�:ܵ�[w��tƨ��Q�s��v�,{J�J�є�לB��Ǔ���~W߾f�������CX�I��Y�oU}����2LX9�GU5���b�@P��˷6<����}�0$h��P���>NjI9|��w뷤R�Mdd~�xm(9`� ���ɔ���[���j�DZiI�i�Ӝ�ƿ���1��C]K�GU����.4g��=�;J�N�`@=EE���[ti��e����+�EA�l3�\cڧV{���U�Y�E-x����XzA�62~c����ΏA����;Ѫ)�	�m�'1�'���6&\�	F<�x� ������|\��~#qG�����5_Q�#	?�=9��kD1T%9Ň~�U�&P�[9F�=U�����U
�ĘN������y���<Ƿ�.j�Du��E}>�H�6�������
���H�	
.�5�];._������3����?�♖��⧹'�;�����V�%|��!/��{�\Fo�oy���y�&{)fB�V��o�E�n��"�Ť"E��ҫ[�Tt�u�,�|OC�r�^��?>��м*Na�'Ӳ-ױ�\����UBSc}	��iO>M	���vRS��LYnZ�cj� 
�di�L��P�D�E�̋�]ƄG����C�
��ً=dƾUF�y�Xs.u��'�����-�si��A򲖕&���/a�J�+%W]$pDm%�^������۸�i�}�<\���"�4URO��{�xT�c@�b
�{>������i_�
J�G��i.�c~���j�0j�����������;]T_-�F�L�X5:��`��Ui͡&�͛[&��ѳ	-��{�tߵAۺf2���v���^Ʋ���1�!m:��q����FG�AF�����T7���Y�M�f�g��1����WAy��Y�ۣ�2kJ�u��N�~;��֔ߚ�&�-H)7D�����tPC�㘪/wp����"�m��21*����:����\��ӊ�p
M[@��	:M}e�*Щ�WFЋ�ˌ�a;������K]|�.�����Aʨf�_��K��c���Vn��1dP��Ǯ�q^�̾�tF�Cw�X�N��[����~�r�jwX z�O�c!�)�f�}8��1��k�*����^i����Ö����8�j8<�"ڃc�?�!
Q�W��-�Qj��.�7���K��S*s-ݻ�7�.�ςeK��d�]�u��]��U���+�b�)��0��q ���B��Y��
�
/�M��Է�Ǿo��
�����GZ����&��4 i�9F����ʈ�T���ו{�\Zޫ#7WBnf�i�����&ǂ��A`�D�1�2�憊�N��g
v<�	v�'�<A*������	����H,R�^�m�
��o�Q-1A�2�#��n�X���Tf�1�:�(E�U�rj��`z�-h��%�^I?��JV�I��h_K���׻��_�߄3�&$%=�%f��o�����Q�����ק����H������*�������sU��9|�aSp�5��J�$!/�����@��V�LF ��Kw�t�̿�3���50��%?�;����y���F �3K�D*S��R����kM���N2L��-ؐ�J�Ĵ�?rZ�%��B�6��f����E��a�8�y���|r0M�rm�F�,��$�Ё����J�v�m�
�!��Q{�z,	��(s��A�b�~���AC���rdy�W?�X�m/��1Gٝ��k���ȊM�8�\��.%��KzgD�Ǻѻ�1Vw}�_��;�e�q|{
�n/;��T9�A�o����trS��\�OѦ���[�K�H޺��hs�荺h6��
�-DFe���@&�$� u�*
É5k3�ٖK���ᝢ	�;�7�	�B��k���Go]�f��ԖSq���>����lk�q����pڔ$ah�[~��a'^�l�@�lv^��[��~�)�u3�YmA�j�}ْ&�r�J�m8�ɥ_>�jG�+���/��6���Ңpŧf0L�_֏`*q�rx�y�-S*p��0�b#������L~��Aa	��BhcT\}�57Nr�+�˼ VGd	�m ��X����DJ�7�����T��;+�s�fI��|�I#�:��A��H���
bSC�SQV��qn��MEc��8]ن�!/�5���`��[I��<tFן/��ɔ%?�HwO*w"��S� ס��>��@v4���Xy�Bl��e'�jzY. kb�SZrT���^��%�n��h�e�u��R�g):Q���Q�H+��#�E��Kz#��k��5ǌ��[�Q��鈆��am��y�@ᥱ�~d6	��
?3M-`b�y��%�o�]�{y�X?�NEx8D��!�j8��R���A�?3����?��l�3f0��t�~xר2ǎ��ӵ��`H7��TP�Ԁ)�k�:dP��\XѠ0G����p3X�Q"�*�$�����-���� �a�$󵋔�\L�N�`�HҴU�Kc���}_�{�~�Ʒ�o��v+朇�~��zo���.��Nz�ĝ��+E��^���b�f���:q����Y���
o �)<NB���x��\�8*h�>�9�$z�������q�	*�����HD@ռ�=w�9*!!OK�(��p����F#�٠k�5ڤ �x���6~tY�aP�t�=��<g8�����$�վ���P+�W�[oGT���q�ڬ�>ӽ�gӽ	
�,?�g̈�\?K
�����^B��ı+������ e(I {�/]�TmY���Y�Xʥ��~��&{A?�af~��VB"�.�����&�q���F��↛�ׁq;+Ւϗ�v���Oj��Sp1��LQ�9,}ҭ����:�J�o��+�T\9F�y���h.��"�C�;�s��JP�Ӫ����b��֤�_>���P�#K��!��_G��O�Cmƌ��c�o6�`�Z��������c�?��Cʨ���䐧P�Z�AM¥�����_p㮵�R�yT:I��5
I^��GP� �h�!X��~�8xƄ�p�X,uj��4݌ E�T^����/�������ߊ���e$
�c`��n �� bD�IK�<<�F9�p�[QA��䓊���I{�ѷ����Ԥ�r �J��+
o�_`�	$Ƴ���ns)aidX���rTU~o��R>���uD�����d�׃r~&�@�´@�2�c���t�dC�]�����,C�t��@�}�_,����Iя#�����6J��&Gt-q�sɝ�k��f�B��� P݌� �艼Rt��W�6ʈ�m���;��X	�^��-�6~�_Ԟ��QXRe2�cZ2�t�����=Vm  $l��+�I�z��1{⛋@��F�
ՈW��Ӈ�P��Z�Z�Q�j�_��ǃ'4�|R�f.uP�j�a��J�������y�aX��ŕ@M�z�w��}�uh�	D��/0�_	W+4+S�^����"{ȩ��f)��{������qO�JZY�������O�c��m(ؗ��K)��$�K�O����i��e�z��l5���'jܕ�n�D4���k�-���js'�i
G�)r�֐jBB�҃J~����Wr��)��h��5ߒ�p˱��z��߲�iE�;��0*�C�7?�\��3�vݝ;�o�?�#���=��x֜4�L*�����gY��e&�f�;�u�c�n<(��.�-�$I���s�-κՔ5�?q�u�8�8KaIN�y,��aT�EIo��)BεsS�&R�{+(��P�v��x-����-���P;�)��5K��A�Ҋ^��ߧͪ}	����!20�K�_E�YA�E0L�J�Q �J@K��ᔎ����ёկ�-S�y��GJ꠰�Y��.B��g&K�_L
r��ߺ��!�����,�L�_��ޟ0OT-��*�
3���^��}�{	�^U��e03G9�)��n����mG�ߏM9�	�w�f� Y[���ё�X�艠��#�2!/��pG]h-õ<S�wq��Lr!z�gK��kf`�
f3��c6�n��ѫB��k���6���74"����0]�w�g���d���'�~�������/��W��@:�n9Lv���R$8�|�
���䤼t,(�Qzӭ\�hk�5<v5�B��8��-��u�|5��f=�`�#� �6�!:�C־D��?��	-�(�$"��R�[9	0Z����cp�/3�X�j�N���������;-6�����ᩝĤ���l0�ӉpN ��M�K]30�6��@�\�ja��r�d�R��3�c�ԿZ-��n	[�O�N�8�Œ1"�Ӷ�/���xr��L�cj�8��)��i
�>4�v��F�,�K�!h���2�7!�%�""����N�a���Ҷ�|��	x{�j~gf+v�!��߭�\��;��K/�i8;mn�_�X�yv �Ӭuz�¯*T�P��t����ъ��UW�a�G�?᳓P	^���W}��;�^|�)�ȿ����A�[����4D�ŔȉnG.�B�������8��IO��Kg�ˮ+������:Wˑ�V$��r�B��	am'oE��|;P��8�l�T��X�nި��{�b�9��C	3���>ɐh�y��x�0K�`:�S�a5����~A�΄ȅ�����O
Yb'q ɱ1hQ�z��κ8V��ª ���YK�'�>�����:W̒6K��c�0�X�6�~j����짗���P�Fx�?tc~��)a�τ8'Cٓk�Q��ROr;�.��*N�Ũ����/D�~���S�{��b���i�'l�)C����݊�ڡ� g5ಹ�T����)I�hV� T�����
&��J�I[��{~˴��Me)8}NX������͚��EĆe���2�
�&�*Yn_���!�a�	I���c@YgS�r��@�T6��씺�+�3��#���h�DfQ�W#OY�O�����hy��2U�.oHƏ�&z\�\^㎋���f׺} ������(~]�&ي�=l��U�gb����5�ܳ�sY�h>�yo��8u��Ή�y_��`�e!K�{'�Z���<�^S߆ǿ�y� ���{���}�2������h�m�^�U�}�0]���A���~�����l�B)�1m����`��`
��A�ͫ9�2�O�OR�3��d-�p��+�ޫ�S��;U���JVڀ����n-��X7)��Ɯ�	,b�b0o Nk��;�qőfw;6��H<�d��Ї�ދn���1�Ǧd�Ԑqt+MI��Ԇ�T'��_���|T���)y�N\��CXn�L�����=�:����;�|��/�jnv�g��ס0X��-l7ruqdo�p�t^����������
=�>�}�8|�A	y��-�ݍH����x�A�T'+\�����ܮN:O01��0�"2z����]���u��5g��u����V�N����,�3X �aA�w�%27X����n@�4b���k��{�}��s(��kr���ke���5��z9��N���������?��O�M�ѬP	:�U�u�]]�Ǿ��؉mI�MĖ�Kg�W?i�\���_oi�O����D���:�<R�:.�o6Sz�V�����X�Zϙl�����Jo�D��$i��	��)��&���c-�'.��in$]��H9
l��6 �j*�룘���-�����}[���"J��%SxK�y2���@�e,F���)jc�gG��:'�ƫs��_��u-K�}&/̀����KB�jʐ�ٛ�/Ԧ9�,���|s0��g����N\h��9���<��L���ksԶ_b�9�fb���n�393㶬ȡ��;iͰ��3����.�� �>�ң���%� G)c�T�>u�Λ��Dz�~�t����7��z/��yD�[?t �q63`0�; �6s��O]�_��Õ�b9�i\�>�����B��>����s4Q�L�.�����R�>G
*�f��+\.����g	0�#�k��,���zr$�N#��*�s�Ҭ�t���Cz����ƃQ���a���I��6;�~F�����I���O)�k��Zh{]�N��!�\�#����ak���m?��#>�I��K���І�s��e5����3���G/�A˿v��A�%>k�O��;��������R�o������%9nR�lU�t?��V{w�����'Z��hSD5�ߴX>]�ݮ�@!=�VBC
�S�J�m������u�?�c�S��պ�=m�t��/f@;���	�#;q�����]8+���Y�����*Y�U�},>E��;�}Z�y��I��tQA,[��3�I����q�Go��H
�n�闇�t`���Dm^h��!�&'x�`��졕8���,�se��qke�h�MX9��|��Y.$��BJ�����Q�����ᳪ���Z��g�b��F���ejT�3'g��&�#��8�iB�Fc̛
�?��&3���V�Hl7�^L�<��<k`ϸ؈3
x5�y��>��� ��$L�$a=���Ks�HK�溞�o�@�q?�5��ƻ��"�������E�s�6��[��k�z�Zt�0��lV�o{̌�)����(�R�f��Dd$&�~�jm�9.��뢪�.���-P�A_��p�j��ؽ�'��K\L(D�����4�iPE꽃�i�D���u8	]��}�6%݉��0&Di��i�m��\���s�޵��Ff޴��Mʠ��n��j=��l�?l{���`4:�|Z�ܹ`��u��Xuq�ݨ�[��Us2���&&u�j?�{�@�1)��
;���w�`?��� XSg׽�˻�����n��VG�e�u�1쏼�^ʄUB~�����8`@��]�u�ţ�La��u4&	X�7+z��ؤ�ƭ2���U#ɣ��163w|븁�*Ǐ<���^�����<W�����5�����u�l�*�&E�IV��F,6��٥)��Q�Z��0�XY0�芍�D����T*��.��awa��n%3�4$��e����n�3 �ɀ*S�(*G	�tt;?b���殮2���H
 ����V�������Y��,�|j�}�A��/D 6��(�`��!�֮�
1>w���WiY����Hp��I��|�a|L?�r�=��ݳ�y7h���>�ڗp����Dө���7�k-V����3}����j,�j� ��iu�(�l�����k�ɛ�����)7FJ����t�Gj�w �؂ 2�2JP����
yd�F��8�'���9`�j2D��	@{99�u���genk�@�C(�ں��j���۶򦯽ҷ������D�/�č>	�zh�c����AAL�F4ɹ��5ʎ���X�h����(2D��_4�*��֕hmYk�`˳Z�v#�g�

���#�V�Mt��� �'\��R*ՙ��Z��@PDorՂ��}w~���Ä">]e��峵�o4�Rtݑ����Jb��i3����v5{Fo�o�-�N6F�hM�!w���
@����S���Ң�	
����('!�}���&c��V1a�q���l��bտ
�����?6���y|IT����z<f��%�M�J��~���!��'��.��ThM8ˇ�8X�,�
�����]1�8?+�����l�5{m�ŏ�
F�˒/�_Ȟ�=�2��ˏ�L���pR�.���b^=OC��tpa�^��,�	���-���T�髈%�U^�h�H�~(�B�k���w��Vx�R�[�Ww��Z�J{�ZA��ŉ12_VF�%��%�$�?�z�Yn�uQ�=2o�#1zD9Ӣ��U�����b-�\M�oՀ<�"�БX��~��jB���l��F�WQ_� ��m��[� 3����& É��}~��fƙ��F�ـr%xD��t��8���$6p����V����T󓤶��4��26��t�ǹ�����N�s#��BM��Gst��<��RcH�o>�n��l1M��̎?'�@���Z��%b0Iw���CC'����=w_���"�ǫ��E���m���|���+K~c_�<>�B_�PǟVW,����
�T���py+��)�(`Fa#�q��M�5M��Y�^;�a��e��ɶ�{��@��p�+B�z[���>G����4t���7?��J_ӵ��4�w��hM��vq���"�͙��r����� K����+��&�dIȕs�6�:03$��c�WY��0�G��Y�p˚�c��ˑ9)�c@��k]b:���eM���E����HљZ�I@K�w�������9�j��}�S�	��Vw&%N�#7zp������\����^a�~�!*�7�)6��#�i)=X�@����}��@ΊC�Í�5�Ɋ4��iE��KC��g�2}X��a�T�s�Hϭ�A���W÷�|���������q��N�A���m5�36Of�GT���Rc;�)
 <#�|Z��v뇅��#��� j�OQ�U�:m� �{����VY!'� ջ�vL$!^��g�ܶ�@��׸S���	c�Ӱ��=7K��FE�\a���s22�S��Y���k�bn�(����-|�s?g0��L���
�uɌӕ������؝#�[�3�/��\��\��
����;
�A���s���Yk`YXpiP�Y
�-_�umV�c��l���A�'S�~+��6{�[��g<�����c�N��l�3����kK�y��ד̓��m�St�JE'Xom��8���6~ݧ\T��W��3��d�"��1n�뿜�sD��|�dykIb1��T4o�QM+.�w� ��1V7�/�B�7+r���V�+��)�Dt�`��kj\�[*)ʋ�mR%�
jt=rP$���A�$E��^��kuy�k
�s'�����޽*�{[�{�I|-�.�M��%�um%�G'�:.�^
hhl%'ؤ�3+��������D"�s�UX�!6$����R��
S�|Aļ�v� r(%��ip���Rv'Aݩ���I]�D	�%���&+�sl��3��������{�M[� 
��6�(��H���o�	��yeD�����;��É�	r)n�6-m
��)��-����2LS������F��y�'F��:��[}����T�f�б�M+���B��؂��b��	 ��Q��4"�;���AC �oٴ��,�Ԩ����(R ����5s[�+fC�6_�ި����@v���r.F��WJ���^�u�qN\��J^��
n�Q��-
5�� �őa��p�]�ꉎˤ��uD4��C���S����n�_2�dMWt�5���gj�zO���]���	�L��t����l���ڋ:,�Ӵ[abt���||F�S՞��7R����X���?T�s�/@�&<�m۶m۶�3�m�6c�sƶ=s��{w�o�?]�]����:駒~r�%}7� ���;N�֌�S/��X��MWU�.wU���ԉ��n�Y��D��rj
"�(��F��2�n9�Ҧ��&{]������-���B�b@� &���U`�z-�"���]G���U��3ӗW��BrRh���ñ�-��~��;�~�/��AO�$��6�Ad(h�"*&��bmɺIt�X>(�г�
�lmf��.pŜ7+P<7�nJ���0��R�:��d�-��	�WZ�p��S� 
�T��
"��{.��ycX%�S^	g�cO-fYIc��#.R�v�_�l:,L����O,��u3�n�4н��5��73�2�A�&Ug���1YZM|�����5-cʓ�cn��׸eI'���Y�!�P������g��W0�W�^OKw���������}4l���L��ǀ��-?��~�Y^=�34<��D
Ԩ0Г�Q�y�F<=v�`Yc�1���JnP����j�Ǉ�q3]�?!)yV��Fv�P��|�a�=��<�@u[5�?��"��Ctl�KS�����!\]��>MF\����l��kr�E��*�L�|�(�n��2���ZT5��vW 
��X6��a� ��݇[ e�l�����n4�L�X����c�}B�"���*)��E�Js��C��+��V���s��z�g�B����&u��&L�\�����q��F''�
W<V�
�g�}�H2@��ŝ���%�5���y�#9�y�B7�ĥp0���-4ۛ4x�c��r�9Q�r�i�4�� �pN:�oSj�@4�W�d�y0;�
�	�ʤ4
���1JYDY��q��|[*tKK]eG�M��o�Yz��܏�8��A��q���|6�����A%H�I�r�Y�X2E 
�QY^jrcɷ�ԩǏW ���%^'�ؼ������y��;h��3A��x4e���`_�G�]Y8��0����@fϞ~onma.R�{�+n�
2;�R�f�� 0����6�3�	�p*2�����K	�����o�(��-�]d`����垔�j�]l�t7�	y#\��1Z��ѵȍ=!�?W^���W��t��7tY�o����#� = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
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