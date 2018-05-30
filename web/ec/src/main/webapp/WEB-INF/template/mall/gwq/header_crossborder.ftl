<#escape x as x?html>
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
        <div class="logo"><a href="${base}/index"><img src="${base}/static/mall/gwq/img/logo.png" width="182" height="98"></a> </div>
        <div class="f-fl search">
            <input type="text" name="keyword" id="keyword" value="${keyword}" placeholder="搜一搜" onkeydown="javascript:if(event.keyCode==13) s($('#keyword').val());">
            <a href="javascript:void(0)" onclick="s($('#keyword').val(),'');return false;"><i class="fa fa-search"></i></a>
            <br>
            <span id="hotwords" style="display: block; width: 270px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;-o-text-overflow:ellipsis; "></span>


        </div>
        <ul class="f-fr nav">

        <#--<#list middlenavigationList as middlenavigation>
            <li class="fore" id="nav-home"><a href="<#if "${middlenavigation.urlType}" == "1">${base}/</#if>${middlenavigation.url}" <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
        </#list>-->

            <#list catelogList as grandfather>

                <li class="navinfo<#if grandfather_index==4 || !grandfather_has_next> last</#if>"><a class="nav-main" href="${base}/list/${grandfather.id}.html" >
                ${grandfather.name}<br>
                <#--<span class="en">FRESH FOOD</span>--><img src="${base}/static/mall/gwq/img/jt.png" class="f-dn jt" width="10" height="6"></a>
                    <div class="f-dn menu">
                        <ul class="f-cb">
                            <#list catelogChildrenMap["${grandfather.id}"] as father>
                                <li <#if !father_has_next>lass="last"</#if>>
                                    <dl>
                                        <dt><#--<img src="static/mall/gwq/img/icon1.png" width="27" height="27">&nbsp;&nbsp;--><a href="${base}/list/${grandfather.id}-${father.id}.html" class="color${father_index+1}">${father.name}</a></dt>
                                        <dd>
                                            <#list catelogChildrenMap["${father.id}"] as catelog>
                                                <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a>
                                            </#list>
                                        </dd>
                                    </dl>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </li>
                <#if grandfather_index==4><#break></#if>
            </#list>
        </ul>
    </div>
</header>

<!-- main 开头-->
<div class="main" >

</#escape>
