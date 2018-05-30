@charset "utf-8";

*:focus {outline: none;}
/* fade */
.jbox-fade{background-color:#000000;}
/* drag */
.jbox-drag{border:1px dashed #8e0674;}
/* jbox */
div.jbox {padding:0px;border:none;font-size:12px;}
/* border */
div.jbox .jbox-border{background: none repeat scroll 0 0 #000000;filter:alpha(opacity=20);-moz-opacity:0.2;opacity:0.2;}
/* container */
div.jbox .jbox-container{background-color:#ffffff;border:1px solid #999999;}
/* title-panel */
div.jbox .jbox-title-panel{background: #8e0674;background: -webkit-gradient(linear, left top, left bottom, from(#9a1f82), to(#72055d));background: -moz-linear-gradient(top,  #9a1f82,  #72055d);filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#9a1f82', endColorstr='#72055d');border-bottom:1px solid #999999;}
div.jbox .jbox-title{font-weight:bold;color:#ffffff;}
div.jbox .jbox-title-icon{background:url(images/jbox-title-icon.gif) no-repeat scroll 3px 5px transparent;}
div.jbox .jbox-close,div.jbox .jbox-close-hover{background:url(images/jbox-close1.gif) no-repeat scroll 0px 0px transparent;}
div.jbox .jbox-close-hover{background-position:-16px 0;}
/* content */
div.jbox .jbox-content{min-height:24px;line-height:18px;color:#444444;}
div.jbox .jbox-content-loading{background-color:#E6E6E6;}
div.jbox .jbox-content-loading-image{background:url(images/jbox-content-loading.gif) no-repeat bottom center;}
/* button-panel */
div.jbox .jbox-button-panel{border-top:1px solid #CCCCCC;background-color: #EEEEEE;}
div.jbox .jbox-bottom-text{text-indent:10px;color:#444444;}
div.jbox .jbox-button{background: #8e0674;background: -webkit-gradient(linear, left top, left bottom, from(#9a1f82), to(#72055d));background: -moz-linear-gradient(top,  #9a1f82,  #72055d);filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#9a1f82', endColorstr='#72055d');border:#47033a 1px solid;color:#fff;border-radius:3px 3px 3px 3px;margin:1px 7px 0px 0px;height:22px;cursor:default;}
div.jbox .jbox-button-hover{background: #8e0674;background: -webkit-gradient(linear, left top, left bottom, from(#8e0674), to(#550446));background: -moz-linear-gradient(top,  #8e0674,  #550446);filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#8e0674', endColorstr='#550446');}
div.jbox .jbox-button-active{background: -webkit-gradient(linear, left top, left bottom, from(#550446), to(#8e0674));background: -moz-linear-gradient(top,  #550446,  #8e0674);filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#550446', endColorstr='#8e0674');}
div.jbox-warning .jbox .jbox-button-panel{background-color: #FFFFFF;}
/* tip-color */
div.jbox .jbox-tip-color{background: #8e0674;background: -webkit-gradient(linear, left top, left bottom, from(#8e0674), to(#550446));background: -moz-linear-gradient(top,  #8e0674,  #550446);filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#8e0674', endColorstr='#550446');border-color:#47033a;border-radius:3px 3px 3px 3px;color:#fff;}
/* icons */
div.jbox span.jbox-icon{background:url(images/jbox-icons.png) no-repeat scroll 0 0 transparent;_background:url(images/jbox-icons-ie6.gif) no-repeat scroll 0 0 transparent;}
div.jbox span.jbox-icon-info {background-position:0 0;}
div.jbox span.jbox-icon-question {background-position:-36px 0;}
div.jbox span.jbox-icon-success {background-position:-72px 0;}
div.jbox span.jbox-icon-warning {background-position:-108px 0;}
div.jbox span.jbox-icon-error {background-position:-144px 0;}
div.jbox span.jbox-icon-none {display: none; overflow:hidden;}
div.jbox span.jbox-icon-loading {background:url(images/jbox-loading1.gif) no-repeat scroll 0 0 transparent;}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           <div class="apiDetail">
<div>
	<h2><span>Function(treeId, treeNode)</span><span class="path">setting.callback.</span>beforeMouseUp</h2>
	<h3>概述<span class="h3_info">[ 依赖 <span class="highlight_green">jquery.ztree.core</span> 核心 js ]</span></h3>
	<div class="desc">
		<p></p>
		<div class="longdesc">
			<p>用于捕获 zTree 上鼠标按键松开之前的事件回调函数，并且根据返回值确定触发 onMouseUp 事件回调函数</p>
			<p>默认值：null</p>
		</div>
	</div>
	<h3>Function 参数说明</h3>
	<div class="desc">
	<h4><b>treeId</b><span>String</span></h4>
	<p>对应 zTree 的 <b class="highlight_red">treeId</b>，便于用户操控</p>
	<h4 class="topLine"><b>treeNode</b><span>JSON</span></h4>
	<p>鼠标按键松开时所在节点的 JSON 数据对象</p>
	<p class="highlight_red">如果不在节点上，则返回 null</p>
	<h4 class="topLine"><b>返回值</b><span>Boolean</span></h4>
	<p>返回值是 true / false</p>
	<p class="highlight_red">如果返回 false，将仅仅无法触发 onMouseUp 事件回调函数，对其他操作无任何影响</p>
	</div>
	<h3>setting & function 举例</h3>
	<h4>1. 禁止 onMouseUp 事件</h4>
	<pre xmlns=""><code>function zTreeBeforeMouseUp(treeId, treeNode) {
    return false;
};
var setting = {
	callback: {
		beforeMouseUp: zTreeBeforeMouseUp
	}
};
......</code></pre>
</div>
</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  GIF89a  �     ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������fff���                                                                                                                                                                                                                                                                                                                                                   !�  � ,       � =H� AG�(\�p�#'#J�!���\�Q#�2)@����I�2;�4i��
�����`�JrB� cE*F�X�Iō�#V��� B�?@��t�9�4jĨ���ƌa⨎�@[�Mk���%8Vlm4e�1JN8�s������N�ITD��u�7n8b@��!ƍ��A������ώh4 ���@.4س����A�`�}��#>_�$J�9">�p����\�[����Q�0a�վ�@��x��)�Շ4[�,X��?~�l]Dd�V68�<���N�3=��B�Pp�v(��9��ȃ�@ !#9@ A.$��#�P�.�1B	d� d�(�dp �:��"s�0Gs�q@�<bQ�#<L0� D�a�������dr��B!�a��92��ly�TP�c: ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>CKFinder käyttöohje</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="../../files/other/help.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="../../files/other/help.js"></script>
	<meta name="robots" content="noindex, nofollow" />
</head>
<body>
	<h1>
		Lataa palvelimelle -nappi
	</h1>
	<p>
		Lataa palvelimelle -nappi* <a href="005.html">työkalurivillä</a> avaa
		"Lataa palvelimelle" -ruudun, jonka avulla lisätään uusia tiedostoja valittuun kansioon.
		Tässä kuvaruutukaappaus: </p>
	<p style="text-align: center">
		<img height="153" src="images/012.gif" width="404" />&nbsp;</p>
	<p>
		Napsauta "Peru"-nappia sulkeaksesi ruudun, tai napsauta uudelleen "Lataa palvelimelle"-nappia
		työkalurivillä.</p>
	<p>
		* "<strong>Lataa palvelimelle</strong>" -termi tarkoittaa tiedoston siirtämistä paikalliselta
		tietokoneelta palvelimelle.</p>
	<h2>
		Latauksen vaiheet</h2>
	<ol>
		<li>Valitse tiedosto koneeltasi "Selaa..."-napilla. Napin teksti vaihtelee selaimittain,
			mutta se sijaitsee aina heti kentän "Valitse ladattava tiedosto" jälkeen.</li>
		<li>Napsauta nappia "Lataa valittu tiedosto". Lataamisesta kertova viesti-ikkuna ilmestyy näkuviin.
		</li>
		<li>Lataamisen loputtua Lataa palvelimelle -ruutu sulkeutuu automaattisesti ja ladattu tiedosto
			muuttuu aktiiviseksi <a href="004.html">tiedostoruudussa</a>.</li>
	</ol>
	<h2>
		Latausviestit</h2>
	<p>
		Voit nähdä seuraavia viestejä lataustapahtuman aikana:</p>
	<h3>
		Samanniminen tiedosto on jo olemassa. Palvelimelle ladattu tiedosto on nimetty:
		"tiedostonimi(1).xxx"</h3>
	<p>
		Viesti tarkoittaa, että samanniminen kuin lataamasi tiedosto on jo tallennettu hakemistoon.
		Ristiriidan estämiseksi tiedostonimen perään lisätään juokseva numero "(1)".</p>
	<h3>
		Tiedosto ei kelpaa</h3>
	<p>
		Palvelin ei hyväksy ladattavaa tiedostoa. </br></br>
		Yleensä kysymys on siitä, että CKFinder on asetettu estämään tiettyjen tiedostotyyppien
		lataaminen. Ne tunnistetaan tiedostotarkenteen perusteella. Lataaminen
		estetään tietoturvasyistä. Vaihtoehtoisesti tiedostokoko voi olla liian suuri. Siinä
		tapauksessa palvelin on konfiguroitava hyväksymään isompia tiedostoja.
	</p>
	<h3>Palvelimelle lataaminen on peruttu turvallisuussyistä. Tiedosto sisältää HTML-tyylistä dataa.</h3>
	<p>Ladattava tiedosto sisältää HTML-koodia. Tietoturvasyistä vain määrätyillä tiedostotarkenteilla
		varustetut tiedostot saavat sisältää HTML-koodia.</br></br>

		Ota yhteyttä pääkäyttäjään selvittääksesi, mitkä ovat hyväksyttäjä tiedostotyyppejä, ja mikä
		on niiden suurin sallittu koko.</p>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  