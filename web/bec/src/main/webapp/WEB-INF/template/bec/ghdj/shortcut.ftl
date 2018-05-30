<#escape x as x?html>

<div class="top">
    <div class="main f-cb">
        <div class="f-fl" id="offline">
            您好，<#--<span id="userinfo"></span>-->欢迎来到<@spring.message "project_name"/>！
            <a href="javascript:login();">[登录]</a>&nbsp;<a href="javascript:regist();">[免费注册]</a>
        </div>
        <div class="f-fl" id="online" class="hide">您好<span><a href="${base}/member/index"  id="userline" target="_blank"></a></span>&nbsp;&nbsp;欢迎来到<@spring.message "project_name"/>！
            <a href="${base}/member/logout">[退出]</a>
        </div>
        <div class="f-fl" id="online" class="hide">
            <a href="http://mcm.ghj168.cn/" target="_blank">[供应商登录]</a>
        </div>
        <div class="f-fr"><a href="${base}/index">商城首页</a>|
            <a href="${base}/cart/list">购物车</a>|
            <a href="${base}/order/list.html?orderType_=0">我的订单</a>|
                <span class="menu">售后服务
                    <i class="icon-angle-down"></i>
                    <ul class="menu-list">
                        <li>
                            <a href="${base}/help/question/254774863888121856.html">常见问题</a>
                        </li>
                        <li>
                            <a href="${base}/help/question/254776214156214272.html">联系我们</a>
                        </li>
                    </ul>
                </span>
                <#--|
                <span class="menu">网站导航 <i class="icon-angle-down"></i>
                    <ul class="menu-list">
                        <li><a href="">全部商品</a></li>
                        <li><a href="">网站地图</a></li>
                    </ul>
                </span>-->
            |<a href="${base}/help/question/1607141709515841840.html">添加桌面快捷方式</a>
        </div>
    </div>
</div><#-- top end-->
<script type="text/javascript">
    $(function () {
        var userNameCookie = $.cookies.get("memberUsername");
        var rememberMeCookie = $.cookies.get("rememberMe4Member");
        var nicknameCookie = $.cookies.get("memberNickname");
        if (userNameCookie != null && userNameCookie != "" && rememberMeCookie != null && rememberMeCookie !="") {
            $("#offline").hide();
            $("#online").show();
            if(nicknameCookie!=null && nicknameCookie!=""){
                $("#userline").html('，'+nicknameCookie)
            }else{
                if(userNameCookie!=null && userNameCookie!=""){
                    $("#userline").html('，'+userNameCookie)
                }
            }
        }else{
            $("#online").hide();
            $("#offline").show();
            if(nicknameCookie!=null && nicknameCookie!=""){
                $("#useroff").html('，'+nicknameCookie)
            }else{
                if(userNameCookie!=null && userNameCookie!=""){
                    $("#useroff").html('，'+userNameCookie)
                }
            }
        }

    });
</script>
</#escape>