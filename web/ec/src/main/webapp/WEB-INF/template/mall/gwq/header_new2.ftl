<#macro menu id>
<header>
    <div class="top">
        <div>
            <span id="offline">
                <i class="fa"></i><a href="javascript:login();">登录</a>&nbsp;&nbsp;
                <i class="fa"></i><a href="javascript:regist();">免费注册</a>&nbsp;&nbsp;
            </span>
            <span id="online" style="display:none;">
                <i class="fa"></i>
                <span id="welcome">您好,</span>
                <span id="userline"></span>
                <a href="${base}/member/logout">[退出]</a>&nbsp;&nbsp;
            </span>
            <i class="fa fa-bars"></i><a href="${base}/allSort">所有分类</a>&nbsp;&nbsp;
            <i class="fa fa-shopping-cart"></i><a href="${base}/cart/list"><span id="shoping-count">0</span></a>件&nbsp;&nbsp;
            <i class="fa fa-user"></i><a href="${base}/member/index">会员中心</a>&nbsp;&nbsp;
            <a href="${base}/order/list">我的订单</a>&nbsp;/&nbsp;<a href="${base}/help">帮助中心</a> </div>
    </div>
    <div class="f-cb navbar">
        <div class="logo"><a href="${base}/index"><img src="${base}/static/mall/gwq/img/gwqlogo.jpg" width="200" height="100"></a></div>
        <div class="progress clearfix">
            <ul class="progress-${id}">
                <li class="step-1"><b></b>1.我的购物车</li>
                <li class="step-2">2.填写核对订单信息</li>
                <li class="step-3">3.成功提交订单</li>
            </ul>
        </div>
</header>

<!-- main 开头-->
<div class="main">

</#macro>
