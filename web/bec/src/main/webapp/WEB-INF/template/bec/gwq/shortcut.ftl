<#escape x as x?html>
<div class="topbg">
    <div class="top">
        <div class="topl">
            <div id="offline"><span id="welcome">您好</span><!--<span id="useroff">--></span>！欢迎来到<@spring.message "project_name"/>！<a href="javascript:login();">[登录]</a>&nbsp;<a href="javascript:regist();">[免费注册]</a></div>
            <div id="online" class="hide"><span id="welcome">您好</span><span id="userline"></span>！欢迎来到<@spring.message "project_name"/>！</span><a href="${base}/member/logout">[退出]</a></div>
        </div>
        <div class="topr">
            <div class="tlogo"><a href="${base}/index"></a><img src="${base}/static/bec/project/gwq/images/index/tlogo.jpg"></a></div>
            <ul class="quick-menu f-cb">
                <li class="home"><a href="${base}/index" style=" color:#0171bc;">商城首页</a> </li>
                <li class="home">
                    <a  href="${base}/order/list">我的订单</a>
                </li>
                <li class="mytaobao menu-item">
                    <div class="menu"> <a class="menu-hd" href="#">售后服务<b></b></a>
                        <div class="menu-bd w80">
                            <div class="menu-bd-panel">
                                <div> <a href="/bec/help/question/254774863888121856.html">常见问题</a> <a href="/bec/help/question/254774992435150848.html">联系客服</a></div>
                            </div>
                            <s class=r></s><s class=rt></s><s class=lt></s><s class=b></s><s class="b b2"></s><s class=rb></s><s class=lb></s> </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
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