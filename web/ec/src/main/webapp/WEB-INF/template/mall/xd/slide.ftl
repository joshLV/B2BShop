<#escape x as x?html>
<style>
    .slide-center {float: left;overflow: hidden;/*padding-left: 210px;*/}
    .slide {width: 550px;height: 270px;background-color: #F5F5F5;}
    .slide {float:left;overflow:hidden;position:relative;font-size:0;line-height:0;}
    .slide-items-wrap {position:absolute;top:0;left:0;width:100%;}
    .slide-item {overflow:hidden;position:relative;height:270px;}
    .slide-item .brick {position:absolute;}
    .slide-nav-bg {position:absolute;bottom:0;left:0;width:100%;height:30px;filter:alpha(opacity=30);-moz-opacity:.3;opacity:.3;}
    .slide-nav {position:absolute;bottom:5px;right:7px;}
    .slide-nav li {float:left;display:inline;width:18px;height:18px;margin:0 3px;background:#FFF;border:1px solid #e6e6e6;font-size:12px;line-height:18px;text-align:center;cursor:default;}
    .slide-nav .cur {background:#404040;border-color:#404040;color:#FFF;font-weight:700;}

    .widepage .slide {width: 760px;}

    .slide-right {float: right;width: 210px;}
    .widepage .slide-right{width:215px; position: absolute; right: 0; top: 0; z-index: 99; background: rgba(255, 255, 255, 0.9);
        filter: progid:DXImageTransform.Microsoft.gradient( GradientType = 0,startColorstr = '#90000000',endColorstr = '#90000000');height: 450px;}

    /**********************hot-region**********************/
    .hot-region{width: 550px;}
    .hot-region{clear:both;overflow:hidden;}
    .hot-region-hd{overflow:hidden;border-right:1px solid #e6e6e6}
    .hot-region-nav{width:550px;}
    .hot-region-nav{background:#f7f7f7;font-family:"Microsoft YaHei";font-size:14px}
    .hot-region-nav li{width:182px;height:38px;}
    .hot-region-nav li{float:left;padding:1px 0 0;border:1px solid #e6e6e6;border-right:0 none;line-height:38px;font-weight:normal;text-align:center;cursor:pointer; font-size: 15px;}
    .hot-region-nav li.cur{none;padding:0; color:#ff3d40; font-weight:bold; border-bottom:2px solid #ff3d40; padding-top: 1px;height: 37px;}
    .hot-region-bd{height: 258px;background: #fff;overflow:hidden;border:1px solid #DEDEDE;border-top:0 none;position:relative}
    .products{height: 236px; padding-top: 15px; padding-left: 5px;}
    .products li{width:200px;float:left;display:inline;}
    .products .pic{overflow:hidden;position:relative;text-align:center;width:178px;height:178px;margin:2px auto 2px}
    .products .pic img{width:178px;height:178px}
    .products .name{    padding: 5px 5px 0px 12px;overflow:hidden;height:24px; line-height:24px;margin-bottom:2px; font-size:13px;word-break:break-all;word-wrap:break-word;}
    .products .price{padding:0px 5px 0px 12px;color: #999;height: 18px;overflow: hidden;}
    .products .price strong {display: inline-block;font-family: verdana;font-size: 12px;margin-right: 5px;line-height: 18px;overflow: hidden;vertical-align: middle;color: #e4393c;}

    .widepage .hot-region{width: 1210px;}
    .widepage .hot-region-nav{width:1210px;}
    .widepage .hot-region-nav li{width:241px;}

    /**********************news**********************/
    .news{width: 208px;margin:0 0 8px;float:right;overflow:hidden;position:relative;}
    .news-hd{height:35px;padding:0 10px;background:#fff;line-height:35px;border-top: 1px solid #f1f1f1;border-bottom: 1px solid #f1f1f1;}
    .news-hd h2{float:left}
    .news-hd .extra {float:right;}
    .news-hd .extra a:link,.news-hd .extra a:visited,.news-hd .extra a:link,.news-hd .extra a:visited {color: #005EA7;}
    .news-list{overflow:hidden;margin:0 10px;padding:5px 0 0;}
    .news-list li{overflow:hidden;height:24px;padding:0 0 0 5px;line-height:24px;/*background:url(${base}/static/mall/xd/img/dian.gif) 0 11px no-repeat;*/}
    .news-list li a:hover{ color: #db0000; text-decoration: none;}
    .widepage .news{width: 215px;}

    /**********************car-file**********************/
    .car-file {width:210px;height:228px;float:right;overflow:hidden;position:relative;}
    .car-file .mt{height:22px;font-size:16px;color:#333;}
    .car-file .mt h2{float:left;height:20px;line-height:20px;font-size:16px;font-weight:normal;color:#333;}
    .car-file .mc{overflow:hidden;height:196px;padding:0 15px;border-width:2px 1px 1px;border-style:solid;border-color:#52668D #DEDEDE #DEDEDE;}
    .car-file .mc .prompt{position:relative;overflow:hidden;width:208px;height:50px;padding:4px 0 7px;background:url(${base}/static/mall/img/acda-bg.jpg) no-repeat 0 -49px;}
    .car-file .mc .select{width:178px;height:24px;padding:0;margin-bottom:10px;line-height:20px;font-family:verdana;color:#666;}

    .car-file .mc .btn-find{display:block;overflow:hidden;width:70px;height:25px;background:url(${base}/static/mall/img/btn7.png) 0 -55px no-repeat;text-align:center;font:bold 12px/25px \5b8b\4f53;color:#333;}
    .car-file .mc .btn-find-disable{ background:url(${base}/static/mall/img/btn6.png) no-repeat;color:#ccc;font:normal 12px/25px \5b8b\4f53; cursor:default;}
    .car-file .mc .btn-find:hover{text-decoration:none;}

    .widepage .car-file{width:238px;}
    .widepage .car-file .mc .prompt{width:206px;left:0;background-position:0 4px;}
    .widepage .car-file .mc .select{width:206px;}
    /**********************car-file end**********************/

    /**********************jrbk**********************/
    .jrbk {width:210px;float:right;overflow:hidden;position:relative; /*border: 1px solid #E8E8E8;*/}
    .jrbk .mt{height:30px;font-size:14px;color:#333; line-height: 30px; padding-left: 15px;}
    .jrbk .mt h2{float:left;height:30px;line-height:30px;font-size:14px;font-weight:normal;color:#333;}
    .jrbk .mc{position:relative; padding-left: 140px;overflow:hidden;height:151px;border-width:2px 1px 1px;border-style:solid;border-color:#52668D #DEDEDE #DEDEDE;}
    .jrbk .p-img{position: absolute; width:130px; height: 130px; left: 5px; top: 5px;}
    .jrbk .p-name{overflow:hidden; padding-top: 15px;width:65px;height:90px;line-height: 18px; margin-bottom: 10px;}
    .jrbk .p-price{}

    .widepage .jrbk{width:238px;}
    .widepage .jrbk .mc{padding-left: 150px;}
    .widepage .jrbk .p-img{left: 10px;}
    .widepage .jrbk .p-name{width: 75px;}



    /*10.28  zyf*/
    .sy_login{width:195px; height:auto;padding:10px;  margin-bottom:5px; float:left;}
    .sy_login h1 {width: 100%; text-align: center;font-size:16px; padding:2px 0 10px 0;color:#E4393C; font-weight:bold;}
    .sy_login h2{ width:100%; float:left; line-height:18px; padding-top:7px; font-size:15px; font-weight:normal;}
    .sy_login h2 span{ color:#666;font-size:12px; font-weight:normal; margin-top: 2px;}
    .sy_login h2 span a.blue,.sy_btn a.blue{ color:#0171bc; text-decoration:underline;}
    .sy_login_text{ height:32px; line-height:32px; border:1px solid #e6e6e6; width:164px; padding-left:30px; float:left; color:#999; font-size:14px; margin-top:12px;}
    .i_uname{ background:#fff url(${base}/static/mall/xd/img/i_uname.gif) 7px 6px no-repeat;}
    .i_upass{ background:#fff url(${base}/static/mall/xd/img/i_upass.gif) 7px 6px no-repeat;}
    .sy_user{ width:107px; padding:0 5px 0 13px;height:32px; line-height:32px; border:0;font-size:14px; font-family:"微软雅黑","宋体"; color:#bbb; float:right; }
    .sy_btn{ width:100%; float:left; height:28px; line-height:28px; padding-top:15px;}
    .sy_sub{ width:85px; height:28px; background:url(${base}/static/mall/xd/img/dl.gif) no-repeat; cursor:pointer; border:none;}
    .sy_btn a.blue{ float:right; padding-right:5px;}
    .item span{ float: left; font-size: 13px;}
    .item{ position: relative;}
    #login .error{ font-size:12px;position: absolute;width: 204px;padding: 2px 0px 2px 10px;left: -70px;top: 32px; color: #E6393D;
        background: #FFEBEC none repeat scroll 0% 0%;line-height:14px;float: none;z-index: 100;height:14px;
        border: 1px solid #FFBDBF;

    }

    .sy_login h3{ float: left; margin-top:25px; width:190px;  padding-left: 3px;}
    .sy_login h3 span{ float: right; font-size: 12px; font-weight: normal;}
    .sy_login h3 span a{ color: #999;}
    .sy_login h3 a.hai{ color: #E4393C;font-size: 15px;}
    .sy_login h3 a:hover {text-decoration: none;}

    .user_qk{ width: 100%; float: left; padding-top: 10px;}
    .user_qk a{ width: 65px;float: left;
        margin-left: -1px;    text-align: center;border-left: 1px solid #eeeeee;}
    .user_qk a:hover{ text-decoration:none;color: #E4393C; }
    .user_qk a strong{height: 18px;display: block;
        font-size: 14px;
        color: #E4393C;   text-align: center;}
/*zyf  3-24*/
    #kinMaxShow{z-index:10; height:450px; overflow:hidden;display: none;}
    .w11210{ width: 1210px; margin: 0 auto;  margin-top: -450px;position: relative; z-index: 100;}
    .tj_info{margin: 0 auto; margin-top:465px;width: 1210px; overflow: hidden;}

    /*用户头像 4-5 zyf*/
.user_img{ width:100%; height:60px; overflow: hidden; border-bottom: 1px dashed #dfdfdf;  }
    .user_img img{width: 50px; height:50px; float: left; margin-right: 10px; border-radius: 50%;}
    .user_img p{  padding-top:3px; font-size: 13px; line-height:1.7;}
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
 <script type="text/javascript">
    window.pageConfig={
        compatible:true,
    navId:"memberlogin"
    };
    </script>



    /**********************jrbk end**********************/

</style>
<#--自适应banner-->
<script type="text/javascript" src="${base}/static/js/jquery.kinMaxShow-1.1.min.js"></script>

<div style="width: 100%; position: relative; height:769px;">



<#--自适应banner-->
<div class="banner" id="kinMaxShow">
    <#list adslides as slideitem>
        <div><a href="${base}/${slideitem.url}"><img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}@1920w_450h_2e.png"></a></div>
    </#list>
</div>




    <div class="w11210">

            <div class="slide-right">
                <!--<div class="news">
			<div class="news-hd">
				<h2>商城快报</h2>
				<div class="extra">
					<a href="${base}/notice/list" target="_blank">更多&nbsp;&gt;</a>
				</div>
			</div>
			<ul class="news-list">
		    <#list notices as notice>
			<li><a href="${base}/play/${notice.id}.html" target="_blank"><strong><span <#if notice.isTop==1>style="color:red;"</#if>><b>${notice.title}</b></span></strong></a></li>
		    </#list>
		    <#--<#list notices as notice>
			<li><a href="${base}/play/${notice.id}.html" target="_blank"><strong><span <#if notice.isTop==1>style="color:red;"</#if>><b>${notice.title}</b></span></strong></a></li>
		    </#list>-->
			</ul>
		</div>-->

                <!--news end-->


                <!-- 首页会员登录 modifyBy hks 10.28 start-->
                <!--未登录状态 zyf 10.28 -->
                <div class="sy_login" id="login">
                    <h1>会员登录</h1>
                    <div class="user_img">
                        <img src="${base}/static/mall/xd/img/user_img.jpg">
                        <p>hi! 你好<br>欢迎来到喜都云商城！</p>
                    </div>

                    <h2><span>还没有会员帐号？<a class="blue" href="javascript:regist();">免费注册</a></span></h2>
                    <form id="formlogin" method="post" onsubmit="return false;">
                        <div class="sy_login_text i_uname item">
                            <span>手机号</span>
                            <div class="item-ifo" style="float: left;position: relative;">
                                <input type="text" id="userName" name="userName" tabindex="1" class="sy_user" autocomplete="off" value="">
                                <div class="i-name ico"></div>
                                <label id="userName_succeed" class="blank invisible"></label>
                                <label id="userName_error" class="hide"></label>
                            </div>
                        </div>
                        <div class="sy_login_text i_upass item">
                            <span>密&nbsp;&nbsp;&nbsp;码</span>
                            <div class="item-ifo"  style="float: left;position: relative;">
                                <input type="password" id="password" name="password" class="sy_user" tabindex="2" autocomplete="off" sta="0">
                                <div class="i-pass ico"></div>
                                <label id="pwd_succeed" class="blank invisible"></label>
                                <label id="pwd_error" class="hide" style="margin-left: -2px;"></label>
                            </div>
                        </div>
                        <div class="sy_btn"> <a href="${base}/findPwd" class="blue">忘记密码?</a>


                            <input type="button" class="sy_sub" id="loginsubmit" value="" tabindex="4">

                        </div>
                    </form>
                </div>
                <!--未登录状态 zyf 10.28 End-->
                <!--已登录状态 zyf 10.28   style="display: none;"-->
                <div class="sy_login" id="loginAfter" style="margin-bottom: 0;">
                    <div class="user_img" style="height: 80px;">
                      <img src="${base}/static/mall/xd/img/user_img.jpg" style="margin-top:10px;">

                        <p> <a class="hai" id="lg_nickeName" style="color: #E4393C; font-weight: bold;"></a><br>欢迎来到 jp516.com<br>
                            <a href="${base}/member/logout">[退出]</a>
                        </p>

                    </div>

                    <div style=" float: left; padding-top: 15px; padding-left: 5px;">
                        <a href="${base}/member/index" style=" background: #FFEBEC;  float:left; margin-bottom:10px;border: 1px solid #FFBDBF;border-radius:3px; padding: 5px 16px; color: #E6393D; margin-right: 10px; margin-left: 5px;">会员中心</a>
                        <a href="${base}/order/list" style=" background: #FFEBEC;float:left;margin-bottom:10px; border: 1px solid #FFBDBF;border-radius:3px; padding: 5px 16px; color: #E6393D;">查看订单</a>
                        <a href="${base}/member/consumehistory/list" style=" background: #FFEBEC;float:left;margin-bottom:10px; border: 1px solid #FFBDBF;border-radius:3px; padding: 5px 16px; color: #E6393D; margin-right: 10px; margin-left: 5px;">消费记录</a>
                        <a href="${base}/member/receiver" style=" background: #FFEBEC;float:left; margin-bottom:10px;border: 1px solid #FFBDBF;border-radius:3px; padding: 5px 16px; color: #E6393D;">收货地址</a>
                    </div>
                    <div class="user_qk"  style="display: block; padding-top: 0;">
                    <#--Desc:点击进入我的订单 Auth:zhangqiang Time:2015-11-19 11:13:35 Start-->
                        <a href="${base}/order/list?status=wait_buyer_pay" style="border-left: none;">
                            <strong id="lg_orderFuKuanCount"></strong>待付款
                        </a>
                        <a href="${base}/order/list?status=wait_seller_send_goods">
                            <strong id="lg_orderFaHuoCount"></strong>待发货
                        </a>
                        <a href="${base}/order/list?status=wait_buyer_confirm_goods">
                            <strong id="lg_orderConfirmCount"></strong>待收货
                        </a>
                    <#--Desc:点击进入我的订单 Auth:zhangqiang Time:2015-11-19 11:13:35 End-->
                    </div>
                </div>
                <!--已登录状态 zyf 10.28   style="display: none;" End-->
                <!-- 首页会员登录 modifyBy hks 10.28 end-->



            <#--  <div style="width: 238px; height:153px; float: left; margin-bottom:5px;">
                  <a href="#">
                      <img src="${base}/static/mall/xd/img/p5.jpg" width="238" height="153">

                  </a>




              </div>-->

       <div class="news" style="height:206px;" id="new_div">
            <div class="news-hd">
                <h2>商城快报</h2>
                <div class="extra">
                    <a href="${base}/notice/list" target="_blank">更多&nbsp;&gt;</a>
                </div>
            </div>
            <ul class="news-list">
                <#list notices as notice>
                    <li><a href="${base}/play/${notice.id}.html" target="_blank"><#if notice.isTop==1></#if>${notice.title}</a></li>
                </#list>
            <#--<#list notices as notice>
            <li><a href="${base}/play/${notice.id}.html" target="_blank"><strong><span <#if notice.isTop==1>style="color:red;"</#if>><b>${notice.title}</b></span></strong></a></li>
            </#list>-->
            </ul>
        </div>


            </div>

    </div>

    <div class="tj_info">

    <#--今日特价处-->
        <div class="hot-region" id="hot-region">
            <div class="hot-region-hd">
                <ul id="hot-region-nav" class="hot-region-nav clearfix">
                    <#list tagList as tag>
                        <li class="<#if tag_index==0>cur<#elseif tag_index==3>hide</#if>">${tag["name"]}</li><!--${tag["sign"]}-->
                    </#list>
                    <li class="hide">今日爆款</li>
                </ul>
            </div>
            <div class="hot-region-bd" >
                <#list tagGoodsList as tagGoodsMap>
                    <ul class="products" style="display: <#if tagGoodsMap_index==0>block<#else>none</#if>;">
                        <#list tagGoodsMap["goodsList"] as goods>
                            <li class="fore${goods_index} <#if goods_index==5>hide</#if>">
                                <p class="pic">
                                    <a href="${base}/item/${goods.id}.html" target="_blank"><img alt="${goods.fullName}" src="${goods.pic}@160w_160h.png"></a>
                                </p>
                                <p class="name"><a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a></p>
                                <p class="price">
                                    商城价:
                                    <strong>
                                        <#if goods.price == '0'>
                                            价格面议
                                        <#else>
                                        ${goods.price?string('currency')}
                                        </#if>
                                    </strong>
                                </p>
                            </li>
                            <#if goods_index == 5><#break ></#if>
                        </#list>
                    </ul>
                </#list>
                    <ul class="products" style="display: none；">
                        <#list tcGoodsList as goods>
                            <li class="fore${goods_index} <#if goods_index==5>hide</#if>">
                                <p class="pic">
                                    <a href="${base}/item/${goods.id}.html" target="_blank"><img alt="${goods.fullName}" src="${goods.pic}@160w_160h.png"></a>
                                </p>
                                <p class="name"><a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a></p>
                                <p class="price">
                                    商城价:
                                    <strong>
                                        <#if goods.price == '0'>
                                            价格面议
                                        <#else>
                                        ${goods.price?string('currency')}
                                        </#if>
                                    </strong>
                                </p>
                            </li>
                            <#if goods_index == 5><#break ></#if>
                        </#list>
                    </ul>
            </div>
        </div><!--hot-region end-->



    </div>



<#--原banner处-->
<#--
    <div class="slide m" id="adslide">
        <div class="slide-items-wrap" style="top: 0px;">
            <ul class="slide-items" id="J-slide-items">
                <#list adslides as slideitem>
                    <li class="slide-item">
                        <a class="brick" href="${slideitem.url}" style="top:0px;left:0px;" target="_blank">
                            <img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}"/>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
-->


</div>
</#escape>

<!--10.28 zyf-->
<script src="${base}/static/mall/js/jdValidate.js" type="text/javascript"></script>
<script type="text/javascript">
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    setTimeout(function () {if (!$("#userName").val()) {$("#userName").get(0).focus();}}, 0);
    $(function () {
      /*自适应banner*/
        $("#kinMaxShow").kinMaxShow({
            height:'450',
            button:{
                showIndex:false,
                normal:{background:'url('+base+'/static/img/button.png) no-repeat -14px 0', width:'14px', height:'14px',marginRight:'9px',border:'0',right:'45%',bottom:'30px'},
                focus:{background:'url('+base+'/static/img/button.png) no-repeat 0 0',border:'0'}
            },
        });
            $.ajax({
                type: 'post',
                url: '${base}/member/getCurrM',
                success: function(data) {
                    if( data.status == 'success' ){
                        $("#login").hide();
                        $("#loginAfter").show();
                        $("#new_div").css("height","206px");
                        if(typeof(data.m.nickName)=='undefined' ){
                            $("#lg_nickeName").text('Hi! '+data.m.userName);
                        }else{
                            $("#lg_nickeName").text('Hi! '+data.m.nickName);
                        }
                        $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                        $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                        $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                    }else{
                        $("#loginAfter").hide();
                        $("#login").show();
                        $("#new_div").css("height","168px");
                    }
                }
            });


        var validate = function(){
            var userName=$("#userName").val();
            var password=$("#password").val();
            var valid=true;
            if(validateRules.isNull(userName)){
//                valid=false;
                $("#userName").addClass("highlight_error");
                $("#userName_error").html("请输入手机号");
                $("#userName_error").addClass("error");
                $("#userName_error").show();
                return false;
            }
            if(!validateRules.isMobile(userName)){
//                valid=false;
                $("#userName").addClass("highlight_error");
                $("#userName_error").html("手机号格式错误!");
                $("#userName_error").addClass("error");
                $("#userName_error").show();
                return false;
            }

            if(validateRules.isNull(password)){
//                valid=false;
                $("#password").addClass("highlight_error");
                $("#pwd_error").html("请输入您的登录密码");
                $("#pwd_error").addClass("error");
                $("#pwd_error").show();
                return false;
            }
            if(!validateRules.betweenLength(password,6,20)){
//                valid=false;
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
                    }else{
                        window.location.href=base+result.url;
                    }
                }
            });
        });

        $("#userName,#password, #authcode").bind('keyup', function (event) {
            if (event.keyCode == 13) {
                $("#loginsubmit").click();
            }
        });


    });
</script>
