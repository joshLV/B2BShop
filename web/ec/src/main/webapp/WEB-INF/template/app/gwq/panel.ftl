
<#--<div class="pro_select" id="panel" style="display: none">
    <dl class="pro_item_tit">
        <dt><img src="ec/static/app/gwq/images/001.jpg" /></dt>
        <dd>
            <h2>红牛维生素功能饮料250ml</h2>
            <p>￥<em>12.00</em></p>
        </dd>
    </dl>
    <div class="pro_size">
        <h2>规格：</h2>
        <ul class="pro_size_sel">
            <li class="items">一瓶</li>
            <li class="items selected">两瓶</li>
            <li class="items">三瓶</li>
            <li class="items">四瓶</li>
        </ul>
    </div>
    <dl class="pro_num">
        <dt>数量：</dt>
        <dd>  <input type="text" class="spinnerExample"/></dd>
    </dl>
    <div class="people_id">
        <span><em>*</em>身份证号</span>
        <p class="mui-input-row">
            <input type="text" class="mui-input-clear inp_tex2" placeholder="填写中国大陆18位身份证号" >
        </p>
    </div>
    <div class="pro_btn">
        <a href="#" class="car" onclick="buyNow()">立即购买</a>
        <a href="#" class="ml10" onclick="addCart()">加入购物车</a>
    </div>
    <div class="pro_close"><img src="/ec/static/app/gwq/images/colse.gif" /></div>
</div>-->
<script type="text/javascript" src="${path}/js/jquery.spinner.js"></script>

<script>
    var panelTemplateHtml =
             '<div class="pro_select" id="panel">'
            +'    <dl class="pro_item_tit">'
            +'        <dt><img src="{{goods.img}}" /></dt>'
            +'        <dd>'
            +'            <h2>{{goods.name}}</h2>'
            +'            <p><em>￥</em><em>{{goods.price}}</em></p>'
            +'        </dd>'
            +'    </dl>'
            +'    {{spInfoHtml}}'
            +'    <dl class="pro_num">'
            +'        <dt>数量：</dt>'
            +'        <dd><input type="text" class="spinnerExample"/></dd>'
            +'    </dl>'
            +'    {{IDCodeHtml}}'
            +'    <div class="pro_btn">'
            +'        <a href="#" class="car" onclick="_buyNow()">立即购买</a>'
            +'        <a href="#" class="ml10" onclick="_addCart()">加入购物车</a>'
            +'    </div>'
            +'    <div class="pro_close"><img src="${path}/images/colse.gif" /></div>'
            +' <input type="hidden" id="_panel_goodsId" value="{{_panel_goodsId}}"/>'
            +'</div>';


    function getSpInfoHtml(data){
        if( typeof(data.spInfoMap.goodsSpList) != 'undefined' && typeof(data.spInfoMap.goodsSpItemList) != 'undefined'){
            var spInfo = '';
            var spInfoHtml = '<div class="pro_size">';
            jQuery.each(data.spInfoMap.goodsSpList, function (spIndex, sp) {
                spInfoHtml += ('<h2>' + sp.name + '：</h2><ul class="pro_size_sel">');
                var i = 0;
                jQuery.each(data.spInfoMap.goodsSpItemList, function(itemIndex, item){
                    if(sp.id == item.specificationId ){
                        if(i == 0){
                            var itemli = '<li class="items selected" spName="{{sp.name}}">{{item.name}}</li>';
                            itemli = itemli.replace('{{sp.name}}', sp.name);
                            itemli = itemli.replace('{{item.name}}', item.name);
                            spInfoHtml += itemli;
                            spInfo += sp.name + ':' + item.name + ',';
                        }else{
                            var itemli = '<li class="items" spName="{{sp.name}}">{{item.name}}</li>';
                            itemli = itemli.replace('{{sp.name}}', sp.name);
                            itemli = itemli.replace('{{item.name}}', item.name);
                            spInfoHtml += itemli;
                        }
                        ++i;
                    }
                });
                spInfoHtml += '</ul>';
            });
            spInfo = spInfo.substring(0, spInfo.length - 1);
            spInfoHtml += '<input type="hidden" value="' + spInfo + '" id="_panel_spinfo"/></div>';
            return spInfoHtml;
        }else{
            return "";

        }
    }
    function getIDCodeHtml(data){
        if(data.hasIdCode){//是否已经输入了身份证
            return "";
        }else{
            var IDCodeHtml = '    <div class="people_id">'
            +'        <span><em>*</em>身份证号</span>'
            +'        <p class="mui-input-row">'
            +'            <input type="text" class="mui-input-clear inp_tex2" id="_panel_idCode" placeholder="填写中国大陆18位身份证号" >'
            +'        </p>'
            +'    </div>';
            return IDCodeHtml;
        }
    }

    function addCartOrBuyNow( type ){
        console.log('-------', type);
        var goodsId = jQuery("#_panel_goodsId").val();
        var cnt = jQuery('.spinnerExample').val();
        var sp = jQuery("#_panel_spinfo").val();
        if(typeof(sp) == "undefined"){
            sp = "";
        }

        var idCode = "";
        if(jQuery("#_panel_idCode").is("input")){
            idCode = jQuery("#_panel_idCode").val();
            var res = checkIdcode(idCode);
            if( res.result == false) {
                popAlert(res.msgcc);
                return;
            }else{
                jQuery.ajax({
                    type: "post",
                    async: false,
                    url: "${base}/member/saveMemberIDcode",
                    data:{'idcode':idCode},
                    datatype: 'json',
                    error: function () {
                        popAlert('网络异常，请稍候再试!');
                    },
                    success: function(result) {
                        if(result.status == 'success'){
                            if( type == 'addCart' ){
                                ajaxAddCart(goodsId, cnt, sp);
                            }else if(type == 'buyNow'){
                                var path=fullpath+"/cart/add?whichclient=whichapp&gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html";
                                jumpto(path);
                            }

                        }else{
                            popAlert('绑定身份证失败!');
                        }
                    }
                });
            }
        }else{
            if( type == 'addCart' ){
                ajaxAddCart(goodsId, cnt, sp);
            }else if(type == 'buyNow'){
                var path=fullpath+"/cart/add?whichclient=whichapp&gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html";
                jumpto(path);
            }

        }
    }


    function _buyNow() {
        addCartOrBuyNow( 'buyNow' );
    }

    function _addCart() {
        addCartOrBuyNow( 'addCart' );
    }

    function ajaxAddCart(goodsId, cnt, sp){
        jQuery.ajax({
            type: "post",
            async: false,
            url: "${base}/cart/ajax/add",
            data:{'gid':goodsId, 'cnt':cnt, 'sp':sp},
            datatype: 'json',
            error: function () {
                popAlert('加入购物车失败，请稍后再试!');
            },
            success: function(result) {
                if(result.status == 'success'){
                    layer.closeAll();
                    popAlert('加入购物车成功!');
                }else{
                    popAlert(result.message);
                }
            }
        });
    }

    function checkIdcode(idcode){
        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){

            return {
                msgcc:'身份证号不能为空!',
                result:false
            };
        }

        if(idcode.length > 18 || idcode.length < 15){


            return {
                msgcc:'身份证号长度范围15~18位!',
                result:false
            };
        }

        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {

            return {
                msgcc:'身份证号格式错误!',
                result:false
            };

        }
        return {
            msgcc:'',
            result:true
        };
    }
    function fmoney(s, n) {
        if (!jQuery.isNumeric(s)) {
            return "0.00";
        }
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
        var l = s.split(".")[0].split("").reverse();
        var r = s.split(".")[1];
        t = "";
        for(i = 0; i < l.length; i ++ )
        {
            t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
        }
        return t.split("").reverse().join("") + "." + r;
    };
    function openPanel(html){
        //console.log(html);
        var panel = layer.open({
            type: 1,
            shadeClose: true,
            content: html,
            anim: true,
            style: 'position:fixed; bottom:0; left:0; width:100%; padding:10px 0; border:none;',
            success: function(elem){

                jQuery(elem).find(".spinnerExample").spinner({value:1, min:1});

                jQuery(elem).find(".pro_close").on("click", function(){ layer.close(panel); });

                jQuery(elem).find(".items").on('click',function(event){

                    jQuery(event.target).siblings(".selected").removeClass("selected");
                    jQuery(event.target).addClass("selected");

                    var spinfo = "";
                    jQuery.each(jQuery(elem).find(".pro_size_sel"), function(index, ul){
                        jQuery.each(jQuery(ul).find("li"), function(i, li){
                            if(jQuery(li).hasClass("selected")){
                                spinfo += jQuery(li).attr("spName")+":"+jQuery(li).text() + ","
                            }
                        })
                    });
                    if( spinfo != ""){
                        spinfo = spinfo.substring(0, spinfo.length - 1);
                    }
                    jQuery(elem).find("#_panel_spinfo").val(spinfo);

                });
            }
        });

    }

    function openCrossMsgLayer(data, html){
        var layer_CrossMsg = layer.open({
            title: [
                '提示信息',
                'background-color:#8DCE16;color:#fff;margin-top:-5px;'
            ],
            content: data.crossGoodsTip,
            btn: ['确认'],
            shadeClose: false,
            yes: function () {
                layer.close(layer_CrossMsg);
                openPanel(html);
            }

        });

    }
    function addgwc(goodsId){

        var html = panelTemplateHtml;

        jQuery.ajax({
            type: 'post',
            async: false,
            url: '${base}/goods/getData4AddCartPanel',
            data: {goodsId: goodsId},
            success: function (data) {

                if (data.status == 'success') {
                    html = html.replace('{{_panel_goodsId}}', goodsId);
                    html = html.replace('{{goods.img}}', data.goods.pic + '@50w_50h.png');
                    html = html.replace('{{goods.name}}', data.goods.fullName);
                    html = html.replace('{{goods.price}}', fmoney(data.goods.price, 2));
                    html = html.replace('{{spInfoHtml}}', getSpInfoHtml(data));
                    if(data.isCross){//跨境商品
                        if(data.isLogin){//当前会员是否已登录
                            html = html.replace('{{IDCodeHtml}}', getIDCodeHtml(data));
                            openCrossMsgLayer(data, html);

                        }else{
                            layer.open({
                                title: [
                                    '提示',
                                    'background-color:#8DCE16; color:#fff;margin-top:-5px'
                                ],
                                shadeClose: false,
                                content: '跨境商品需要登录后，才可以加入购物车！<br>去登录',
                                btn:['OK'],
                                yes: function(){
                                    //没有登录跳到登录页面
                                    if(isWeiXin()){
                                        jumpto(weixinLoginUrl);
                                    }else{
                                        jumpto("${base}/member/login?whichclient=whichapp");
                                    }
                                }

                            });


                        }
                    }else{//非跨境商品，直接打开面板
                        html = html.replace('{{IDCodeHtml}}', "");
                        openPanel(html);
                    }
                }else{
                    popAlert(data.message);
                }
            }
        });

    }

    jQuery(document).ready(function(){

        jQuery(".add-gwc").on("click", function(event){
            var goodsId;
            if(jQuery(event.target).is("img")){
                goodsId = jQuery(event.target).parent("a").attr("goodsId");
            }else{
                goodsId = jQuery(event.target).attr("goodsId");
            }

            /**
             * 验证是否是团购中的商品，如果是的话就跳转到商品详情页再加入购物车，否则就直接打开面板
             */
            jQuery.ajax({
                type: "post",
                async: false,
                url: "${base}/cart/ajaxCheckP",
                data:{'gid':goodsId},
                datatype: 'json',
                error: function () {
                    popAlert('加入购物车失败，请稍后再试!');
                },
                success: function(result) {
                    if(result.status == 'warn'){
                        jumpto('${base}/item/whichapp/'+goodsId+'.html')
                    }else{
                        addgwc(goodsId);
                    }
                }
            });
        });
    });

</script>