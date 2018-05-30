<#escape x as x?html>
<footer>
    <#list bottomnavigationList as bottomnavigation>
        <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}">${bottomnavigation.name}</a>
    </#list>
        <br>
    &nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015-2016&nbsp;&nbsp;
    <a href="javascript:void(0)" target="_blank">陕西帮商乐信息技术有限公司</a>
    &nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;陕ICP备16001873号<br>
    <img src="${base}/static/bec/project/ghdj/img/108_40_zZOKnl.gif" width="108" height="40" alt="">
    <img src="${base}/static/bec/project/ghdj/img/112_40_WvArIl.png" width="112" height="40" alt="">
    <img src="${base}/static/bec/project/ghdj/img/108_40_kxwz.gif" width="108" height="40" alt="">
</footer>
<style>

    /*右侧导航菜单*/
    .r_menu{ position:fixed; right:0px; top:32%; height:300px; z-index: 999;}
    .r_menu ul{ height:250px; margin-bottom:10px; right:0px; position:relative; z-index:10; overflow:hidden; background:url(${base}/static/bec/project/ghdj/img/bg_0.8.png) repeat;
        width:50px; border-radius:10px; border-top-right-radius:0px; border-bottom-right-radius:0px;}
    .r_menu ul li{ width:50px; height:50px;}
    .r_menu ul li i{ width:50px; height:50px; opacity:0.8; display:block; cursor:pointer; }
    .r_menu ul li i:hover{ opacity:1;}
    .r_menu ul .up i{ background:url(${base}/static/bec/project/ghdj/img/icons.png) -63px -150px no-repeat;}
    .r_menu ul .qq i{ background:url(${base}/static/bec/project/ghdj/img/icons.png) -63px -20px  no-repeat;}
    .r_menu ul .tel i{ background:url(${base}/static/bec/project/ghdj/img/icons.png) -63px -108px  no-repeat;}
    .r_menu ul .wx i{ background:url(${base}/static/bec/project/ghdj/img/icons.png) -59px -66px  no-repeat;}
    .r_menu ul .down i{ background:url(${base}/static/bec/project/ghdj/img/icons.png) -63px -190px  no-repeat;}
    .r_menu .sliBox{ top:50px; right:-150px; width:150px; height:150px;border-radius:10px; background:url(${base}/static/bec/project/ghdj/img/bg_0.5.png) repeat;
        border-top-right-radius:0px; border-bottom-right-radius:0px; position:absolute; z-index:9; position:absolute;}
    .r_menu .qqBox span{ display:block; padding:10px 25px; line-height:30px; color:#fff; margin-bottom:15px;}
    .r_menu .qqBox a{ width:100px; height:30px; text-align:center; line-height:30px; border-radius:3px; color:#6fb301; transition:all 0.5s; margin:0 auto;  background: #fff; display:block;}
    .r_menu .qqBox a:hover{ background:#FFF; color:#FC0B0F;}
    .r_menu .qqBox p{ margin-bottom: 8px;}
    .r_menu .qqBox p img{ margin-right:9px;margin-top: 7px;}
    .r_menu .qqBox em{ padding-left: 15px; color: #333; font-size: 14px; font-weight: normal;}
    .r_menu .wxBox{ width: 260px; right:-260px;}
    .r_menu .wxBox p{ float: left;line-height: 20px;
        color: #fff;
        font-size: 12px;
        text-align: center;
        float: left;
        width: 130px;
    }
    .r_menu .wxBox p img {
        width: 110px;
        height: 110px;
        margin: 10px 10px 0px 10px;
    }
    .r_menu .qqBox{top:38px; right:-150px; width:150px; height:162px; padding-top: 18px;}
    .r_menu .telBox span{ padding:0px 15px; margin-top:30px; font-size:16px; color:#fff; display:block; line-height:30px;}
    .r_menu .telBox span em{ font-style: normal; font-size: 17px; font-weight: normal; color: #fff; margin-right: 0;}
    .r_menu .close{ cursor:pointer; opacity:0.8; width:26px; height:26px; display:block; margin-left:15px; transition:transform 0.5s; background:url(${base}/static/bec/project/ghdj/img/icons.png) 0px -640px no-repeat;}
    .r_menu .close:hover{ opacity:1; transform:rotate(180deg);}

</style>

<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/rightMenu.js"></script>

<div class="r_menu">
    <ul style="right: 0px;">
        <li class="up"><i></i></li>
        <li class="qq s_li"><i></i></li>
        <li class="tel s_li"><i></i></li>
        <li class="wx s_li"><i></i></li>
        <li class="down"><i></i></li>
    </ul>
    <div class="sliBox qqBox" style="right: -150px;">
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2685312254&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2685312254:4" alt="客服QQ" align="absmiddle" /><em>采购</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2463291905&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2463291905:4" alt="客服QQ" align="absmiddle" /><em>食品</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2040118178&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2040118178:4" alt="客服QQ" align="absmiddle" /><em>日用</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2431002562&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2431002562:4" alt="客服QQ" align="absmiddle" /><em>售后</em></a></p>
    <#--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=348863738&site=qq&menu=yes">在线咨询</a>-->
    </div>
    <div class="sliBox telBox" style="right: -150px;">
        <span>客服电话<br><em>157 1929 1085</em><br><em>157 1929 1093</em></span>
    </div>
    <div class="sliBox wxBox" style="right: -260px;">
        <p>
           <#-- <img src="${base}/static/bec/project/ghdj/img/weixin_app.jpg">-->
            <img src="${base}/static/bec/project/ghdj/img/weixin_app.jpg">
            广货街移动客户端
        </p>
        <p> <img src="${base}/static/bec/project/ghdj/img/weixin1.jpg">
            关注广货街官方微信
        </p>
    </div>
    <span class="close" style="background:url(${base}/static/bec/project/ghdj/img/icons.png) 0px -640px no-repeat;"></span>
</div>

<#-- 百度站长工具 -->
<script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?2d7bef246d88e5855f470aa5c033af24";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

</body>
</html>
</#escape>