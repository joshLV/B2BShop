<style>

    .login-form h3 {
        float: left;
        margin-top: 23px; line-height: 20px;
       width: 250px;
        padding: 0 20px;

    }


    .login-form h3 a.hai {
        color: #E4393C;
        font-size: 15px;
    }
    .login-form h3 span {
        float: right;
        font-size: 12px;
        font-weight: normal;
    }
    .login-form h3 a.hai:hover{ color: #E4393C;}
    .user_qk{ width: 270px; padding: 0 10px; float: left; padding-top: 10px; padding-top: 20px;}
    .user_qk a{ width:87px;float: left;
        margin-left: -1px;    text-align: center;border-left: 1px solid #eeeeee;}
    .user_qk a:hover{ text-decoration:none;color: #E4393C; }
    .user_qk a strong{height: 18px;display: block;
        font-size: 14px;
        color: #E4393C;   text-align: center;}


    .baokuan .mc .p-price {
        margin-left: 20px;
        color: #fc0b0f;
    }
    .p-title h3{color: #86c226;
        font-size: 14px;
        font-weight: bold;
        margin-left: 10px;
    }
    .p-img{ height: 100px; margin-bottom: 10px;}
    .p-img img{width: 100%; height: 100%;}

    /*商城头条*/
  .new_info{ width: 250px; padding: 20px; padding-top: 16px;}
    .new_list{  padding-left:7px; display: block; padding-top: 2px;}
    .new_list li{ width: 100%; height: 24px; line-height:24px; overflow: hidden; font-size: 13px;}
    .new_list li a{ color:#666; padding-left: 12px; background: url("${base}/static/mall/gwq/img/dot1.gif") left 9px no-repeat;}
    .new_list li a:hover{color: #FC0B0F;}

</style>

<#escape x as x?html>
<div class="banner f-cb">
    <div class="f-fl banner-img">
        <div id="banner-img" class="f-dn">
            <#list adslides as slideitem>
            <div>
                <a href="${slideitem.url}" target="_blank"><img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}@900w_400h.png" width="900" height="400" alt="焦点图"></a>
                <p class="title"><a href="${slideitem.url}" style="top:0px;left:0px;" target="_blank">${slideitem.description}</a></p>
            </div>
            </#list>
        </div>
    </div>
    <div class="f-fr login">
        <div id="nologin" class="login-form" style="border-bottom: 1px dotted #dfdfdf; padding-bottom: 5px;">
            <!-- 未登录 -->
            <form action="${base}/member/check" method="post" name="formlogin" id="formlogin">
                <dl>
                    <dt class="f-cb">会员登录<span class="f-fr">还没有会员账号？<a href="javascript:regist();">免费注册</a></span></dt>
                    <dd><i class="fa fa-user"></i><input type="text" name="userName" id="userName" datatype="m"  sucmsg=" " nullmsg="请输入手机号" placeholder="手机号" /></dd>
                    <dd><i class="fa fa-lock"></i><input type="password" name="password" id="password" datatype="*6-32" sucmsg=" " nullmsg="请输入密码" errormsg="密码范围在6~32位之间！"  placeholder="密码"/><span id="msgdemo" style="color: red;"></span></dd>
                    <dd class="f-cb"><button type="submit" name="login-btn" id="login-btn">登　录</button><span class="f-fr"><a href="${base}/findPwd">忘记密码</a></span></dd>
                </dl>
            </form>

        </div>
        <div id="login" class="login-form" style="border-bottom: 1px dotted #dfdfdf; padding-bottom: 5px;display: none;">
                <!-- 已登录 -->
                <h3><a href="javascript:void(0);" class="hai" id="lg_nickeName">${member.nickName}</a><span><a href="${base}/member/logout">[退出]</a></span></h3>
                <div style="width:250px; float: left; padding: 30px 20px; padding-bottom: 20px;">
                    <a href="${base}/member/index" style=" background: #FFEBEC; border: 1px solid #FFBDBF;border-radius:3px; padding: 4px 11px; color: #E6393D; margin-right:30px; margin-left: 5px;">我的会员中心</a>
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



       <#-- <div class="baokuan">
        <#list tcGoodsList as goods>
                <div class="mc">
                    <div class="p-title">
                        <h3>今日爆款</h3>
                    </div>
                    <div class="p-img">
                        <a target="_blank" title="${goods.fullName}" href="${base}/item/${goods.id}.html">
                            <img width="250" height="110" data-img="1" alt="${goods.fullName}" src="${goods.pic}@250w_140h.png" class="err-product">
                        </a>
                    </div>
                    <div class="p-name">
                        <a target="_blank" title="${goods.fullName}" href="${base}/item/${goods.id}.html">${goods.fullName}</a>
                    </div>
                    <div class="p-price">
                        <strong>￥${goods.price}</strong>
                    </div>
                </div>
            <#if goods_index == 0>
            <#break >
            </#if>

        </#list>
            &lt;#&ndash;<a href="#"><img src="${base}/static/mall/gwq/img/baokuan.jpg" width="250" height="180" alt="今日爆款"></a>&ndash;&gt;
        </div>-->
<#--zyf 商城头条 4-11-->
     <div class="new_info">
         <div class="p-title">
             <h3><img src="${base}/static/mall/gwq/img/new.png" alt="Ulife头条"></h3>
         </div>
         <ul class="new_list">
             <#list topNewsList as tn>
                 <li><a href="${base}/help/question/${tn.id}.html" target="_blank">${tn.title}</a></li>
                 <#if tn_index == 5><#break ></#if>
             </#list>
         </ul>
     </div>
    </div>
</div>
</#escape>

<script type="text/javascript">
    setTimeout(function () {if (!$("#userName").val()) {$("#userName").focus();}}, 0);
    $(function(){
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#nologin").hide();
                    $("#login").show();
                    if(typeof(data.m.nickName)=='undefined' ){
                        $("#lg_nickeName").text('Hi! '+data.m.userName);
                    }else{
                        $("#lg_nickeName").text('Hi! '+data.m.nickName);
                    }
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                }else{
                    $("#login").hide();
                    $("#nologin").show();
                }
            }
        });

    });
</script>
