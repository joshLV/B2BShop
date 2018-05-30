<#escape x as x?html>
<#include "bec/gdnz/header.ftl"/>
<div id="container" class="f-cb">
    <#include "bec/gdnz/top.ftl"/>
    <div class="main">
        <div class="main_banner f-cb">
            <div class="focusNews-main">
                <!--焦点图-->
                <div class="focusImg">
                    <div class="slidePage">
                        <div id="homeBook-menu20">
                            <h2 class="homemenutitle">
                                <#list adslides as slideitem>
                                    <span <#if slideitem_index == 0>class="on"</#if>>${slideitem_index + 1}</span>
                                </#list>
                            </h2>
                        </div>
                    </div>
                    <#list adslides as slideitem>
                        <div class="homeBook-body20 cWhite" style="z-index: -1;">
                            <a id="3503" href="${slideitem.url}" target="_blank">
                                <img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}_730x375.png"/>
                            </a>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="banner_right">
                <!--未登录状态 start-->
                <div id="login" class="sy_login">
                    <h2><span>还没有采购商帐号？<a class="blue" href="javascript:regist();">免费注册</a></span>采购商登录</h2>
                    <form name="login"  action="" method="" onsubmit="return false;">
                        <form id="formlogin" method="post" onsubmit="return false;">
                            <div class="sy_login_text i_uname item">
                                <span>账号</span>
                                <div style="float: left;position: relative;">
                                    <input type="text" id="userName" name="userName" tabindex="1" class="sy_user" autocomplete="off" value="">
                                    <div class="i-name ico"></div>
                                    <label id="userName_succeed" class="blank invisible"></label>
                                    <label id="userName_error" class="hide"></label>
                                </div>

                            </div>
                            <div class="sy_login_text i_upass item">
                                <span>密码</span>
                                <div style="float: left;position: relative;">
                                    <input type="password" id="password" name="password" class="sy_user" tabindex="2" autocomplete="off" sta="0">
                                    <div class="i-pass ico"></div>
                                    <label id="pwd_succeed" class="blank invisible"></label>
                                    <label id="pwd_error" class="hide"></label>
                                </div>
                            </div>
                            <div class="sy_btn"> <a href="${base}/findPwd" class="blue">忘记密码?</a>
                                <input type="button" class="sy_sub" id="loginsubmit" value="" tabindex="4">
                            </div>
                        </form>
                </div>
                <!--未登录状态 end-->
                <!--已登录状态 zyf 10.28   style="display: none;" Start-->
                <div class="sy_login" style="height: 165px;display: none;" id="loginAfter">
                    <h3><span><a href="${base}/member/logout">[退出]</a></span><a href="#" class="hai"  id="lg_nickeName"></a></h3>
                    <div style="width: 100%; float: left; padding: 25px 0; padding-bottom: 20px;">
                        <a href="${base}/member/index" style=" background: #FFEBEC; border: 1px solid #FFBDBF;border-radius:3px; padding: 4px 11px; color: #E6393D; margin-right: 10px; margin-left: 5px;">我的会员中心</a>
                        <a href="${base}/order/list" style=" background: #FFEBEC; border: 1px solid #FFBDBF;border-radius:3px; padding: 4px 11px; color: #E6393D;">查看我的订单</a>
                    </div>
                    <div class="user_qk"  style="display: block;">
                    <#--Desc:点击进入我的订单 Auth:zhangqiang Time:2015-11-19 11:13:35 Start-->
                        <a href="${base}/order/list?status=wait_buyer_pay" style="border-left: none;">
                            <strong id="lg_orderFuKuanCount"></strong>待付款
                        </a>
                        <a href="${base}/order/list?status=wait_seller_send_goods">
                            <strong id="lg_orderFaHuoCount"></strong>待发货
                        </a>
                        <a href="${base}/order/list?status=wait_buyer_confirm_goods">
                            <strong id="lg_orderConfirmCount"></strong>待确认收货
                        </a>
                    <#--Desc:点击进入我的订单 Auth:zhangqiang Time:2015-11-19 11:13:35 End-->
                    </div>
                </div>
                <!--已登录状态 zyf 10.28   style="display: none;" End-->
                <div class="sy_new"><a target="_blank" title="" >今日爆款</a></div>
                <div class="hot_img">
                    <a target="_blank" title="${tcGoods.fullName}" href="${base}/item/${tcGoods.id}.html">
                        <img  alt="${tcGoods.fullName}" src="${tcGoods.pic}">
                    </a>
                </div>
            </div>
        </div>
        <div class="hot_tit">
            <h2><img src="static/bec/project/gwq/images/index/hot.gif"></h2>
            <a href="#"><img src="static/bec/project/gwq/images/index/hot_more.gif"></a>
        </div>
        <div class="hot_pro">
            <ul class="hot_pro_list">
            <#list tagGoodsList as tagGoodsMap>
                <#if (tagGoodsMap_index > 0)>
                    <#break>
                </#if>
                <#list tagGoodsMap["goodsList"] as goods>
                    <#if (goods_index > 4)>
                        <#break>
                    </#if>
                    <li <#if (goods_index == 4)>class="lase"</#if>><a href="${base}/item/${goods.id}.html"><img alt="${goods.fullName}" src="${goods.pic}"></a></li>
                </#list>
            </#list>
            </ul>
        </div>
    </div>
    <#list typeList as child>
    <!--${child_index+1}F-->
        <#if child['floor_top_'+ (child_index+1)]>
            <div style="width:${child['floor_top_'+'${child_index+1}'].width}px; height: ${child['floor_top_'+'${child_index+1}'].height}px; margin:5px auto; display: block;">
                <a href="${child['floor_top_'+'${child_index+1}'].link}" target="_blank"><img alt="${child['floor_top_'+'${child_index+1}'].name}" src="${child['floor_top_'+'${child_index+1}'].pic}@${child['floor_top_'+'${child_index+1}'].width}w_${child['floor_top_'+'${child_index+1}'].height}h_2e" width="${child['floor_top_'+'${child_index+1}'].width}" height="${child['floor_top_'+'${child_index+1}'].height}"></a>
            </div>
        </#if>
    <div class="main">
        <div class="pro_show floor_${child_index+1}">
            <div class="pro_show_l">
                <div class="floor_tit">${child_index+1}F&nbsp;&nbsp;${child["catelog"].name}</div>
                <ul>
                    <#list child["categrandList"] as cate>
                        <#if (cate_index>7)><#break></#if>
                        <li><a target="_blank" href="${base}/list/${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a></li>
                    </#list>
                    <#list child["brandchildList"] as brandchild>
                        <#if (brandchild_index>7)><#break></#if>
                        <li><a href="javascript:void(0)"  onclick="s('${brandchild.name}','')" ><img src="${brandchild.pic}_88x49.png" alt="${brandchild.name}" width="88" height="49"></a></li>
                    </#list>
                </ul>
            </div>
            <div class="pro_show_r">
                <div class="pro_show_r_top">
                    <ul>
                        <#list child["goodschildList"] as goodschild>
                        <#if (goodschild_index>2)><#break></#if>
                        <li <#if (goodschild_index==2)>class="lase"</#if>><a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}"><img alt="${goodschild.fullName}"  src="${goodschild.pic}_150x150.png"></a> <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}" class="pro_info">${goodschild.fullName}</a>
                            <p>
                                <span class="nologin_price">仅会员可见！</span>
                                <span class="login_price" style="display: none;">
                                    <#if goodschild.batchPrice != null && goodschild.batchPrice != "0.00~0.00">
                                        ￥${goodschild.batchPrice}
                                    <#else >
                                      ${goodschild.price?string("currency")}
                                    </#if>
                                </span>
                                <a class="cart_btn" style="display: none;" onclick="addCart('${goodschild.id}','1');" href="javascript:void(0);" title="加入购物车">
                                    <em class="cart_btn_img"></em>
                                </a>
                            </p>
                        </li>
                        </#list>
                    </ul>
                    <div class="focus_img">
                        <div id="kinMaxShow${child_index+1}">
                            <#if child["floor_right_${child_index+1}"]??>
                            <#list child["floor_right_${child_index+1}"] as frImg>
                             <div><a href="${frImg.link}" target="_blank"><img alt="${frImg.name}" src="${frImg.pic}_330x234.png" width="330" height="234"></a></div>
                            </#list>
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="pro_show_r_down">
                    <ul>
                        <#list child["goodschildList"] as goodschild>
                            <#if (goodschild_index>7)><#break></#if>
                            <#if (goodschild_index>2)>
                            <li <#if (goodschild_index==7)>class="lase"</#if>> <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}"><img alt="${goodschild.fullName}"  src="${goodschild.pic}_150x150.png"></a> <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}" class="pro_info">${goodschild.fullName}</a>
                                <p>
                                    <#if priceHide ="hide" >
                                        仅会员可见！
                                    <#else >
                                        <#if goodschild.batchPrice != null && goodschild.batchPrice != "0.00~0.00">
                                            ￥${goodschild.batchPrice}
                                        <#else >
                                           ${goodschild.price?string("currency")}
                                        </#if>
                                    </#if>
                                </p>
                            </li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </#list>
</div>
<!--循环焦点图所用js（jquery.kinMaxShow-1.1.min.js）-->
<script type="text/javascript" src="${base}/static/bec/base/js/jquery.kinMaxShow-1.1.min.js"></script>
<!--banner所用js（jquery.cnool.js）-->
<script type="text/javascript" language="javascript" src="${base}/static/bec/project/gwq/js/jquery.cnool.js"></script>
<script type="text/javascript">
    $(function(){

        <#list typeList as child>
        $("#kinMaxShow${child_index+1}").kinMaxShow({
            height:234,
            button:{
                switchEvent:'mouseover',
                showIndex:false,
                normal:{width:'12px',height:'12px',lineHeight:'12px',left: '138px',borderRadius:'50%',bottom:'25px',fontSize:'10px',
                    background:"#000",color:"#666666",textAlign:'center',marginRight:'10px',fontFamily:"Verdana",float:'left',border:'0'},
                focus:{background:"#db0000",color:"#000000",border:'0'}
            }
        });
        </#list>

        if(!$("#userName").val()){$("#userName").focus();}
        var validate = function(){
            var userName=$("#userName").val();
            var password=$("#password").val();
            var valid=true;
            if(validateRules.isNull(userName)){
                $("#userName").addClass("highlight_error");
                $("#userName_error").html("请输入手机号");
                $("#userName_error").addClass("error");
                $("#userName_error").show();
                return false;
            }
            if(!validateRules.isMobile(userName)){
                $("#userName").addClass("highlight_error");
                $("#userName_error").html("手机号格式错误!");
                $("#userName_error").addClass("error");
                $("#userName_error").show();
                return false;
            }
            if(validateRules.isNull(password)){
                $("#password").addClass("highlight_error");
                $("#pwd_error").html("请输入您的登录密码");
                $("#pwd_error").addClass("error");
                $("#pwd_error").show();
                return false;
            }
            if(!validateRules.betweenLength(password,6,20)){
                $("#password").addClass("highlight_error");
                $("#pwd_error").html("登录密码长度在6~20范围内!");
                $("#pwd_error").addClass("error");
                $("#pwd_error").show();
                return false;
            }
            return valid;
        };
        $("#userName").bind("focus", function () {
            $("#userName").removeClass("highlight_error");
            $("#userName").addClass("highlight_success");
            $("#userName_error").html("");
            $("#userName_error").removeClass("error");
            $("#userName_error").hide();
        }).bind("blur", function () {
            $("#userName").removeClass("highlight_success");
        });
        $("#password").bind("focus", function () {
            $("#password").removeClass("highlight_error");
            $("#password").addClass("highlight_success");
            $("#pwd_error").html("");
            $("#pwd_error").removeClass("error");
            $("#pwd_error").hide();
        }).bind("blur", function () {
            $("#password").removeClass("highlight_success");
        });
        $("#loginsubmit").click(function () {
            if(!validate()){
                return;
            }
            $this=$(this);
            $this.attr({ "disabled": "disabled" });
            $.ajax({
                type: "post",
                url: "${base}/member/check",
                data:{'userName':$("#userName").val(),'password':$("#password").val()},
                datatype: 'json',
                error: function () {
                    $("#loginsubmit").removeAttr("disabled");
                    $this.removeAttr("disabled");
                },
                success: function(result) {
                    $this.removeAttr("disabled");
                    if("error"==result.status){
                        $("#pwd_error").html(result.message);
                        $("#pwd_error").addClass("error");
                        $("#pwd_error").show();
                    }else if("false"==result.status){
                        layer.alert(result.message,{icon:2},function(){
                            window.location=${base}/+"member/registerForward?buyerId="+result.buyerId;
                        });
                    }else if("regRep"==result.status){
                        window.location=${base}/+"member/registerForward?buyerId="+result.buyerId;
                    }else{
                        window.location.href=${base}/+result.url;
                    }
                }
            });
        });
        $("#userName,#password, #authcode").bind('keyup', function (event) {
            if (event.keyCode == 13) {
                $("#loginsubmit").click();
            }
        });
        $("#kinMaxShow").kinMaxShow({
            height:375,
            button:{
                switchEvent:'mouseover',
                showIndex:true,
                normal:{width:'18px',height:'18px',lineHeight:'18px',right:'16px',bottom:'16px',fontSize:'12px',opacity:0.8,background:"#666666",border:"1px solid #999999",color:"#CCCCCC",marginRight:'6px'},
                focus:{background:"#CC0000",border:"1px solid #FF0000",color:"#000000"}
            }
        });

        /**
         * 判断是否登录
         */
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#login").hide();
                    $("#loginAfter").show();
                    $("#lg_nickeName").text('Hi! '+data.m.realName);
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                    $(".nologin_price").hide();
                    $(".login_price").show();
                    $(".cart_btn").show();
                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                    $(".nologin_price").show();
                    $(".login_price").hide();
                    $(".cart_btn").hide();
                }
            }
        });


    });

    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }
</script>
<#include "bec/gdnz/service.ftl"/>
<#include "bec/gdnz/foot.ftl"/>
</#escape>