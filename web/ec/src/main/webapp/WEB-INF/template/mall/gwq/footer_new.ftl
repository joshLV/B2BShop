<#escape x as x?html>
<footer>
	<#list bottomnavigationList as bottomnavigation>
    <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}">${bottomnavigation.name}</a>
		<#if !bottomnavigation_has_next >
		<br>
		</#if>
	</#list>
    &nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015-2016&nbsp;&nbsp;
	<a href="http://www.ulife.sx.cn/" target="_blank">西安国际陆港电子商贸有限公司</a>
	&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;陕ICP备15013404号<br>
    <img src="${base}/static/mall/gwq/img/108_40_zZOKnl.gif" width="108" height="40">
	<img src="${base}/static/mall/gwq/img/112_40_WvArIl.png" width="112" height="40">
	<img src="${base}/static/mall/gwq/img/108_40_kxwz.gif" width="108" height="40">
</footer>


</div>   <!--  container end -->

<style>

    /*右侧导航菜单*/
    .r_menu{ position:fixed; right:0px; top:35%; height:300px;}
    .r_menu ul{ height:250px; margin-bottom:10px; right:0px; position:relative; z-index:10; overflow:hidden; background:url(${base}/static/mall/gwq/img/bg_0.8.png) repeat;
        width:50px; border-radius:10px; border-top-right-radius:0px; border-bottom-right-radius:0px;}
    .r_menu ul li{ width:50px; height:50px;}
    .r_menu ul li i{ width:50px; height:50px; opacity:0.6; display:block; cursor:pointer; }
    .r_menu ul li i:hover{ opacity:1;}
    .r_menu ul .up i{ background:url(${base}/static/mall/gwq/img/icons.png) -63px -150px no-repeat;}
    .r_menu ul .qq i{ background:url(${base}/static/mall/gwq/img/icons.png) -63px -20px  no-repeat;}
    .r_menu ul .tel i{ background:url(${base}/static/mall/gwq/img/icons.png) -63px -108px  no-repeat;}
    .r_menu ul .wx i{ background:url(${base}/static/mall/gwq/img/icons.png) -59px -66px  no-repeat;}
    .r_menu ul .down i{ background:url(${base}/static/mall/gwq/img/icons.png) -63px -190px  no-repeat;}
    .r_menu .sliBox{ top:50px; right:-150px; width:150px; height:150px;border-radius:10px; background:url(${base}/static/mall/gwq/img/bg_0.5.png) repeat;
        border-top-right-radius:0px; border-bottom-right-radius:0px; position:absolute; z-index:9; position:absolute;}
    .r_menu .qqBox span{ display:block; padding:10px 25px; line-height:30px; color:#fff; margin-bottom:15px;}
    .r_menu .qqBox a{ width:100px; height:30px; text-align:center; line-height:30px; border-radius:3px; color:#6fb301; transition:all 0.5s; margin:0 auto;  background: #fff; display:block;}
    .r_menu .qqBox a:hover{ background:#FFF; color:#FC0B0F;}
    .r_menu .qqBox p{ margin-bottom: 8px;}
    .r_menu .qqBox em{ padding-left: 5px;}
    .r_menu .wxBox{ width: 260px; right:-260px;}
    .r_menu .wxBox p{ float: left;line-height: 20px;
        color: #fff;
        font-size: 12px;
        text-align: center;
        float: left;
        width: 130px;}
    .r_menu .wxBox p img {
        width: 110px;
        height: 110px;
        margin: 10px 10px 0px 10px;
    }
    .r_menu .qqBox {top: 28px;right: -150px;width: 150px;height: 192px;padding-top: 12px;}
    .r_menu .telBox span{ padding:0px 15px; margin-top:40px; font-size:16px; color:#fff; display:block; line-height:30px;}
    .r_menu .telBox span em{ font-style: normal; font-size: 17px; font-weight: normal;}

    .r_menu .close{ cursor:pointer; opacity:0.5; width:26px; height:26px; display:block; margin-left:15px; transition:transform 0.5s; background:url(${base}/static/mall/gwq/img/icons.png) 0px -640px no-repeat;}
    .r_menu .close:hover{ opacity:1; transform:rotate(180deg);}
	



</style>



<script type="text/javascript" src="${base}/static/mall/gwq/js/commom.js"></script>

<div class="r_menu">
    <ul style="right: 0px;">
        <li class="up"><i></i></li>
        <li class="qq s_li"><i></i></li>
        <li class="tel s_li"><i></i></li>
        <li class="wx s_li"><i></i></li>
        <li class="down"><i></i></li>
    </ul>
    <div class="sliBox qqBox" style="right: -150px;">
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2133005439&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2133005439:4" alt="客服QQ" align="absmiddle" /><em>客服一</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=2256190453&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2256190453:4" alt="客服QQ" align="absmiddle" /><em>客服二</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=981917239&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:981917239:4" alt="客服QQ" align="absmiddle" /><em>客服三</em></a></p>
        <p><a href="http://wpa.qq.com/msgrd?v=3&uin=3356572530&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:3356572530:4" alt="客服QQ" align="absmiddle" /><em>客服四</em></a></p>
		<p><a href="http://wpa.qq.com/msgrd?v=3&uin=2180553440&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:2180553440:4" alt="客服QQ" align="absmiddle" /><em>客服五</em></a></p>
	<#--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=348863738&site=qq&menu=yes">在线咨询</a>-->
    </div>
    <div class="sliBox telBox" style="right: -150px;">
        <span>客服电话<br><em>400-829-8366</em></span>
    </div>
    <div class="sliBox wxBox" style="right: -260px;">
        <p>
            <img src="${base}/static/mall/gwq/img/weixin_app.png">
            港务区移动客户端
        </p>
        <p> <img src="${base}/static/mall/gwq/img/weixin1.jpg">
            关注港务区官方微信
		</p>
    </div>
    <span class="close" style="background:url(${base}/static/mall/gwq/img/icons.png) 0px -640px no-repeat;"></span>
</div>


<#--<link href="${base}/static/mall/css/im.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/mall/gwq/js/im.js" type="text/javascript"></script>
<style type="text/css">
    #wchat{position:fixed;bottom:20px;right:20px;width: 100px;padding: 10px;z-index:9999;background: #eee;border: 1px solid #aeaeae;margin-top:expression(this.style.pixelHeight+document.documentElement.scrollTop)}
    #wchat p {text-align:center;margin: 1px 1px 1px 1px;font-size:12px;}
</style>-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?1359f5a35a6294b64b29f81d32d24c99";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>

</#escape>