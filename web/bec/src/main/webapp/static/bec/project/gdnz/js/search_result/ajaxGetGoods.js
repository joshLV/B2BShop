var totalheight = 0;     //定义一个总的高度变量
var flag = true;//数据是否加载完了 true 未完  false  完了
var isLoad = true;//是否加载中， true 未加载  false  正在加载中
$(window).scroll( function() {
    totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度,减去底部高度

    if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
    {
        //加载数据
        loadGoods();
    }
});

$(function(){

    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        //$("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>');
        //$("#notices").hide();
    }
});

/**
 * Ajax查询商品，并组装到页面
 * TianYu
 * 2016-2-18 15:34:13
 */
function loadGoods(){
    //判断是否加载完
    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        $("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>');
        $("#notices").hide();
    }

    if( !flag ){//加载完了，不需要再加载
        return;
    }else{
        if( !isLoad ){//如果正在加载中，不执行
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
            url: $("#basePath").val() + "/search/getSearchResult/" + encodeURI(encodeURI($.trim($("#keyword_input").val()).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号'))),
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

                                html += '<td width="200" style="text-align:center">商品规格</td>';
                                html += '<td width="115" style="text-align:center">会员价格</td>';
                                html += '<td width="140" style="text-align:center">当前价格</td>';
                                html += '<td width="155" style="text-align:center">数    量</td>';
                                html += '<td width="114" style="text-align:center">库    存</td>';

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
                                html += '<p><em>所属商家：</em><a href="javascript:void(0);" >' + goods.shopName + '</a></p>';
                                html += '<p class="textoverflow"><em>商品简称：</em><a href="javascript:void(0);">' + goods.shortName + '</a></p>';
                                html += '<p><em>商品条码：</em>' + goods.barcode + '</p>';
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
                                    html += '￥' + goods.batchPrice;
                                } else {
                                    html += parseFloat(goods.price).formatMoney(2, "￥");;
                                }
                                html += '</td>';

                                html += '<td width="140" class="pro_prices2" id="' + goods.id + '_nowPrice">';
                                if (goods.batchPrice != '' && goods.batchPrice != "0.00") {
                                    html += parseFloat(goods.maxBatchPrice).formatMoney(2, "￥");;
                                } else {
                                    html += parseFloat(goods.price).formatMoney(2, "￥");
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
                                    html �K�J�����ܶ�M�4
�m��8���P5�Be@ۣ�Y+�?�&	+�8dRi��0W~��p�ǁ���\j���w���"FE�EfE�	K�^���a���F���k��o��G�4����4�1���Hs�.�{bg-pv��
�{&Lb*��)�����W���'�垽�0�s��fPJ��SV~ ����E�v�M��ڳ��9)L��c�`����^���O�(,J���,�PK
    \R�F<vk֛   �   ;   net/sf/ehcache/exceptionhandler/CacheExceptionHandler.class;�o�>#NvvvF��<׊�Ԃ���<F'�����4�Ԍ���T}Wm퓕X���������\�,7�Z3���+8��(9�-3'��A����#1/%'�H����ͲT���2}���������� �,��, +�db` PK
    ]R�F�5�0  �  B   net/sf/ehcache/exceptionhandler/CacheExceptionHandlerFactory.class��1O�0�ߵi��ҁ��[ˀ%�V]**��"��;�A\��r?�	����B�)LH����ޝ���������8$�':�vJhGKB0+VL��:���>as#�̑~\(�-�Ѿ���MuI��9[Q�
N�T)~T����S��26b���7��ҹT�0Oc2,�a1���A���L\�b��j.ǣ�%��躨����~���'w�E��gAB�^"���X$kV6���_�3��]'\%W['/���;tڮ�1v�v��"#pl�v|PK
    ]R�F���u�  �  H   net/sf/ehcache/exceptionhandler/ExceptionHandlingDynamicCacheProxy.class�V�s����Xi�Nl++v�(��
� <B;�8	(����(��kI��2�����oH�Ph��eZ3<�BD�N���L���0C����Z�����{��s���9�݋���W 6�]��U
���*Bx@��<��!�r]�0#0��FAEE{P�
G�I��c�P�aG`�p��aRG�pLڟR1�G<��1�@~��m��]�8��[�d�B���(f�Ѝ�)О�L7�f���ړJធUr�
t�S�:(쫌���|�2&ǇM{�>\6=φ^>��%���n���Xhќ2�	�T���5R6���Y�=RP�
;�-}�d�I�}vej�!�����R`��q^�%�he����G��z��[����#��n�'���2E�~�-VF�nT�j1	�A�k�m��u���w�� c��6gеyP��e���*!C�thk����E�rL��o�3g�J��ޖ{��a����Y��{�M����Cx��M`�☲:t�������L�t|��L�]��AW7���	���W^�?������P𤂧�I�\�E\�S����Q�M5��嗇�Q��[0����{j�t�@ �a�P�rֈ9%1���40&Ez�r��)�@�`e�6�]%��~��7Ƞ4��4$q����gq�M���V������e�)xN��x��kX��=����^��
^��Nhȣ_��j]�a��:@���4Hz�<�;I��&u+9��M>ʬ�F��x�I��[��r"�I����;o���4�'5��	��g��ŵ���k,��\��L�b�,p���MW�2�q��g)L���x�k!ǰV��*�+��4�hT�mQye�I���b�Ǽi�r\ݒ�6�Z���0|�G���C�?�x�����ݜj�~6�y�׈x�XΧb�J��l�,�K#-�e�9<�d�}��דd�XŚ�����z�]�<�L��q��Q^~�H��M��=�KI���6�T���u&��z��H�r� (j@�`.�c)�b���ԙEȟ�>pp3��:!�MX%y��dM�,�QN��x=W�(o�SM	�^Mg<�8.A��vч(v`-W+j�X��ͤUF�.��6w{>�d��@��
��'�!:��C��O�y
{�����n=ZAN��Z�+.2�e��oL���*�lpz6$��	dÉ��DVI��h�F�hND�XrK���F�o�FgКU��ֶ��z� ai%�$��,�D=_'��A�x�����,��e��s|����?I��(y���@�_�^F7y#^EN�����[��?s��!��(�A��\!%K&�eq���w!����nlff7"B+�pn%�kp/n��D0������Dh.?6��[e��˞�Hzq��r7H{@�K?��.�lW��	������;�Rp��{�K�W����R��;�~�w�c�q��ix�*G���(�-B�t�my+z:N�E�\�|����c�jV�ʿ�3����ۃ˃-�w�Alu�񀘹���M�S꼇�|��;:�Ht˒�%n7�8��A�G��G3�݊���Gl��	�'L���3�x� ~�d|�v�����>|��󒶕V6���kX����@C���=�1H�l��笉o7� w^
�!��E�Ą���{(K	�A��Z�/���RŪs���g�>��G�8��뭡PK
    \R�F5����	  �   :   net/sf/ehcache/statistics/LiveCacheStatisticsWrapper.class��	|���o��fBB8D*�!R�
�a`q$	Ქ�ff����ăC��Mk�U���rc��GOj/�i���^V{Y�E�������{��I�|�3����������fr��� 0�U�^��W����@3|-��u���7��ɷH^&�6�wH�[
��{$�'y��U�����G$?&�	�OI^#���$o����$�$�ɯI�$��[$o����w$�'���Ha�S
��O$��=�?����$#�;��$����|H�O�����?$�%9M�?$��GR@RH2����ORLR��e?+@�̔ \A�e~6����oY��:�V��V��7����C�6�ᘖ�7�굵5�V�7SjJ7SzĬ�=Z��m�m�@s�fh�jJcp�� �h�@Hq�(�����e�k������
��N�]�cZK:�FK��k�T����P�:�����Z�d0sh�-K�������Y�����`���r�M1�G�YI�Vh�!ׁ[ɠ���js�n
5�����֍ZҊr��vka��iIӸd��w�RX���� ���)=3��S�Ԣq;���5D"����xLA�_�������I�V\875������Pc��m����E