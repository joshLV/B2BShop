<#escape x as x?html>
<style>
#footer {padding-bottom: 30px;text-align: center; margin-top: 20px;}
#footer .links a,#footer .links span {margin: 0 10px}
#footer .links span a {margin: 0}
#footer .copyright {margin: 10px 0}
#footer .authentication a {margin: 0 5px}
</style>
<div class="content">
	<div id="footer">
		<div class="links">
			<#list bottomnavigationList as bottomnavigation>
				<#if !bottomnavigation_has_next >
					<a href="${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}" >${bottomnavigation.name}</a>
				<#else>
					<a href="${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}">${bottomnavigation.name}</a>|
				</#if>
            </#list>
		</div>
		<div class="copyright">
			陕ICP备11011220号&nbsp;&nbsp;<br>
			&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2013-2014&nbsp;&nbsp;华尊立达集团&nbsp;&nbsp;版权所有<br>
		</div>
		<div class="authentication">
			<a href="#" target="_blank"><img width="108" height="40" alt="经营性网站备案中心" src="${base}/static/mall/img/108_40_zZOKnl.gif" class="err-product"></a>
			<a href="#" target="_blank"><img alt="可信网站" name="CNNIC_seal" border="true" width="108" height="40" src="${base}/static/mall/img/108_40_kxwz.gif" class="err-product"></a>
			<a href="#" target="_blank"><img width="112" height="40" src="${base}/static/mall/img/112_40_WvArIl.png" class="err-product"></a>
		</div>
	</div>
</div>
<link href="${base}/static/mall/css/im.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/mall/js/im.js" type="text/javascript"></script>
<style type="text/css">
#wchat{position:fixed;bottom:20px;right:20px;width: 100px;padding: 10px;z-index:9999;background: #eee;border: 1px solid #aeaeae;margin-top:expression(this.style.pixelHeight+document.documentElement.scrollTop)}
#wchat p {text-align:center;margin: 1px 1px 1px 1px;font-size:12px;}
</style>
<div id="wchat">
	<img src="${base}/static/mall/jd/img/qrcode.png" width="100" height="100" alt="机电商城" />
	<p>微信关注</p>
	<p>&nbsp;</p>
    <img src="${base}/static/mall/jd/img/sjcode.png" width="100" height="100" alt="机电商城" />
    <p>手机客户端</p>
</div><!--wchat end-->
</#escape>