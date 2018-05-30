<#escape x as x?html>
<!--楼层开始-->
    <#list typeList as child>
<!--${child_index+1}F start -->
<div class="floor">
    <div class="category">
        <div class="pname"><a href="${base}/list/${child["catelog"].id}.html">${child["catelog"].name}</a><#--<span class="penname">IMPORTED FOOD</span>--></div>
        <#list child["categrandList"] as cate>
        <a target="_blank" href="${base}/list/${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a>
            <#if cate_has_next>|</#if>
            <#if cate_index==6><#break></#if>
        </#list>
        <a class="more" href="${base}/list/${child["catelog"].id}.html">
            <img src="static/mall/gwq/img/dot3.gif" width="9" height="9">
        </a>
    </div>
    <div class="content">
        <ul class="f-cb">
        <#list child["goodschildList"] as goodschild>
            <li>
                <dl>
                    <dd class="goodsimg">
                        <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                            <img alt="${goodschild.fullName}" src="${goodschild.pic}@205w_224h.png" width="205" height="224">
                        </a>
                        <div class="subtitle">
                            <div class="f-fl">
                            <#if priceHide == 'hide'>
                                <a onclick="forward();" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                            <#else>
                            <#--Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  Start-->
                                <#if goodschild.crossBorder == '1'>
                                    <a onclick="addCart('${goodschild.id}','1','1');" href="javascript:void(0);" class="car">加入购入车</a>
                                <#else>
                                    <a onclick="addCart('${goodschild.id}','1','0');" href="javascript:void(0);" class="car">加入购入车</a>
                                </#if>
                            <#--Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  End-->
                            </#if>
                            </div>
                            <div class="f-fr"> <a onclick="addGoodsAttention('${goodschild.id}',this);" href="javascript:void(0);" class="gz">关注</a> </div>
                            <#--已关注  <div class="f-fr"> <a href="#" class="gz_on">关注</a> </div>-->
                        </div>

                    </dd>
                    <dt><a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">${goodschild.fullName}</a></dt>
                    <dd class="goodsprice">
                        <em class="f-fl">${goodschild.price?string('currency')}</em>
                        <span class="f-fr"><#if (goodschild.marketPrice)?exists>${goodschild.marketPrice?string('currency')}</#if></span><dd>
                    <dd class="goodsxl">
                    <span>月成交<i>${goodschild.sales}</i>笔</span> <span class="lase">评价数<i>${goodschild.scoreCount}</i>条</span>



                </dd>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </dd>
                </dl>
            </li>
            <#if goodschild_index == 9><#break></#if>
        </#list>
        </ul>
    </div>
    <div class="pinpai">
        <ul class="f-cb">
        <#list child["brandchildList"] as brandchild>
            <li><a href="javascript:void(0)"  onclick="s('${brandchild.name}','')"><img alt="${brandchild.name}" src="<#if brandchild.pic??>${brandchild.pic}@125w_60h.png</#if>" width="125" height="60"></a></li>
            <#if brandchild_index == 8><#break ></#if>
        </#list>
        </ul>
    </div>
</div>

    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <div class="pop_win aptab_center_address">

            <ul class="newaddress">
                <li>
                    <label> <strong style="color: red;">*</strong> 身份证号： </label>
                    <input type="text" id="idcode"  name="idcode" value="" class="inputxt" style="width: 180px;">
                    <span id="checkIdcodeId" class="check_error hide"></span>
                </li>

                <li>
                    <input type="submit" value="保 存" onclick="save_idcode()"  class="btn_save  bule_btn" />
                </li>
            </ul>
        </div>
    </div>
    <#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  Start-->
    <input id="crossBorderId" type="hidden" value="" />
    <#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  End-->
    <!--鼠标放上出现购物车效果-->
    <script type="text/javascript">
        $(".goodsimg").each(function(){
            var self = $(this), delay;
            self.mouseover(function(){
                delay = setTimeout(function(){ delay = null; self.find(".subtitle").stop().animate({"bottom":7}, 300);},300);
            }).mouseout(function(){
                if(delay){
                    clearTimeout(delay);
                }else{
                    setTimeout(function(){self.find(".subtitle").stop().animate({"bottom":-40}, 300);},300);
                }
            });
        });
        /**
         * Desc:跳转到登录页面
         * Auth:zhangqiang
         * Time:2016-01-30
         */
        function forward(){
            location.href = "${base}/member/login";
        }
        /**
         * Desc:加入购物车操作
         * Auth:zhangqiang
         * Time:2016-01-30
         * Param:
         *       goodsId        商品ID
         *       cnt            加入购物车的商品数量
         *       ifCrossBorder  是否为跨境商品标识  1:是跨境商品  0:不是跨境商品
         */
        function addCart(goodsId, cnt,ifCrossBorder) {
            //是跨境商品时
            if(ifCrossBorder == '1'){
                var message = '';
                //是跨境商品 获取弹出提示信息
                $.ajax({
                    type: 'post',
                    async: false,
                    url: '${base}/goods/ajaxGetSystemCrossMsg',
                    success: function(data) {
                        if( data.status == 'success' ){
                            message = data.msg;
                        }else{
                        }
                    }
                });
                //弹出提示信息
                layer.confirm(message, {icon: 7, title:'温馨提示'}, function(index){
                    //判断此会员是否设置了身份证号
                    if(ifMemberIDcode()) {
                        //设置了后执行加入购物车操作
                        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
                    }else{//未设置身份证时
                        //将此商品的ID存储下来，并弹出设置身份证号的DIV层
                        $("#crossBorderId").val(goodsId);
                        layer.open({
                            type: 1,
                            title:'设置会员本人身份证号',
                            area:["500px","210px"],
                            scrollbar:false,
                            content: $('#popupdiv') //这里content是一个DOM
                        });
                    }
                    layer.close(index);
                });
            }else{//不是跨境商品直接执行加入购物车操作
                window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
            }

        }

        function addGoodsAttention(goodsId,item) {
            $.ajax({
                type: "get",
                url: "${base}/goods/addToGoodsAttention",
                data: "goodsId="+goodsId,
                success: function(data) {
                    if(data.status=='success'){
                        layer.alert(data.message,{icon:1});
                        $(item).removeClass("btn-coll").addClass("showattention");
                        $(item).text('已关注');
                        $(item).attr("onclick", "");
                    }else if(data.status=='warn'){
                        layer.alert(data.message,{icon:2});
                        $(item).removeClass("btn-coll").addClass("showattention");
                        $(item).text('已关注');
                        $(item).attr("onclick", "");
                    }else if(data.status=='NOLOGIN'){
                        layer.alert("登录后才可关注商品",{icon:2},function(){
                            window.location="${base}/member/login";
                        });
                    }else{
                        layer.alert(data.message,{icon:2});
                    }

                }
            });
        }
        /**
         * Desc:判断会员是否设置了身份证号
         * Auth:zhangqiang
         * Time:2016-01-30
         * Return:
         *        true  设置了身份证号
         *        false 没有设置
         */
        function ifMemberIDcode(){
            var flags = false;
            $.ajax({
                type: 'post',
                async: false,
                url: '${base}/member/getMemberIDcode',
                success: function(data) {
                    if( data.status == 'success' ){
                        flags = true;
                    }else if(data.status == 'error'){
                        flags = false;
                    }else{//没有登录时页面跳到登录页
                        location.href = "${base}/member/login";
                        return;
                    }
                }
            });
            return flags;
        }

        /**
         * Desc:保存身份证号
         * Auth:zhangqiang
         * Time:2016-01-30
         */
        function save_idcode(){
            //获取到身份证号
            var idcode = $("#idcode").val();

            //判断身份证号是否存在
            if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
                $("#checkIdcodeId").text('身份证号不能为空!');
                $("#checkIdcodeId").removeClass('hide');
                return ;
            }

            //判断身份证号长度是否符合要求 旧身份证号15位纯数字 二代身份证号18位 最后一位可能是字母X
            if(idcode.length > 18 || idcode.length < 15){
                $("#checkIdcodeId").text('身份证号长度范围15~18位!');
                $("#checkIdcodeId").removeClass('hide');
                return ;
            }

            //正则表达式判断身份证号格式是否正确
            var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            if (!re.test(idcode)) {
                $("#checkIdcodeId").text('身份证号格式错误!');
                $("#checkIdcodeId").removeClass('hide');
                return ;
            }

            $("#checkIdcodeId").addClass("hide");

            //验证身份证号是否已经存在
            $.ajax({
                type: "post",
                async: false,
                url: base+"member/username/check",
                data:{'userName':idcode,'property':'iDCode'},
                datatype: 'json',
                error: function () {

                },
                success: function(result) {
                    if(result){
                        $("#checkIdcodeId").addClass("hide");
                        //保存身份证号
                        $.ajax({
                            type: "post",
                            async: false,
                            url: base+"member/saveMemberIDcode",
                            data:{'idcode':idcode},
                            datatype: 'json',
                            error: function () {

                            },
                            success: function(result) {
                                if(result.status == 'success'){
                                    layer.closeAll();
                                    window.location.href = "${base}/cart/add?gid=" + $("#crossBorderId").val() + "&cnt=" +1 + "&backurl=" + window.location.href
                                }else{
                                    layer.alert('设置失败',{icon:2});
                                }
                            }
                        });
                    }else{
                        $("#checkIdcodeId").text('身份证号已存在,请重新输入!');
                        $("#checkIdcodeId").removeClass('hide');
                    }
                }
            });
        }
    </script>

<!--${child_index+1}F end   -->
</#list>
</#escape>
