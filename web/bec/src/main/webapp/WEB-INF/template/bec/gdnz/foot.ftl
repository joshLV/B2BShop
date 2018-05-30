<#escape x as x?html>
<style>
    /*右侧导航菜单*/
    .r_menu{ position:fixed; right:0px; top:35%; height:300px; z-index: 999;}
    .r_menu ul{ height:250px; margin-bottom:10px; right:0px; position:relative; z-index:10; overflow:hidden; background:url(${base}/static/bec/project/gdnz/images/bg_0.8.png) repeat;
        width:50px; border-radius:10px; border-top-right-radius:0px; border-bottom-right-radius:0px;}
    .r_menu ul li{ width:50px; height:50px;}
    .r_menu ul li i{ width:50px; height:50px; opacity:0.8; display:block; cursor:pointer; }
    .r_menu ul li i:hover{ opacity:1;}
    .r_menu ul .up i{ background:url(${base}/static/bec/project/gdnz/images/icons.png) -63px -150px no-repeat;}
    .r_menu ul .qq i{ background:url(${base}/static/bec/project/gdnz/images/icons.png) -63px -20px  no-repeat;}
    .r_menu ul .tel i{ background:url(${base}/static/bec/project/gdnz/images/icons.png) -63px -108px  no-repeat;}
    .r_menu ul .wx i{ background:url(${base}/static/bec/project/gdnz/images/icons.png) -59px -66px  no-repeat;}
    .r_menu ul .down i{ background:url(${base}/static/bec/project/gdnz/images/icons.png) -63px -190px  no-repeat;}
    .r_menu .sliBox{ top:50px; right:-150px; width:150px; height:150px;border-radius:10px; background:url(${base}/static/bec/project/gdnz/images/bg_0.5.png) repeat;
        border-top-right-radius:0px; border-bottom-right-radius:0px; position:absolute; z-index:9; position:absolute;}
    .r_menu .qqBox span{ display:block; padding:10px 25px; line-height:30px; color:#fff; margin-bottom:15px;}
    .r_menu .qqBox a{ width:100px; height:30px; text-align:center; line-height:30px; border-radius:3px; color:#6fb301; transition:all 0.5s; margin:0 auto;  background: #fff; display:block;}
    .r_menu .qqBox a:hover{ background:#FFF; color:#FC0B0F;}
    .r_menu .qqBox p{ margin-bottom: 8px;}
    .r_menu .qqBox p img{ margin-right:8px; margin-top: 7px;}
    .r_menu .qqBox em{ padding-left: 15px; color: #333; float: left;}
    .r_menu .wxBox{ width: 150px; right:-150px;}
    .r_menu .wxBox p{ float: left;line-height: 20px;
        color: #fff;
        font-size: 12px;
        text-align: center;
        float: left;
        width: 130px;    margin-left: 8px;
        margin-top: 3px;}
    .r_menu .wxBox p img {
        width: 110px;
        height: 110px;
        margin: 10px 10px 0px 10px;
    }
    .r_menu .qqBox{top:38px; right:-150px; width:150px; height:162px; padding-top: 18px;}
    .r_menu .telBox span{ padding:0px 15px; margin-top:30px; font-size:16px; color:#fff; display:block; line-height:30px;}
    .r_menu .telBox span em{ font-style: normal; font-size: 17px; font-weight: normal; color: #fff;margin-right: 0;}

    .r_menu .close{ cursor:pointer; opacity:0.8; width:26px; height:26px; display:block; margin-left:15px; transition:transform 0.5s; background:url(${base}/static/bec/project/gdnz/images/icons.png) 0px -640px no-repeat;}
    .r_menu .close:hover{ opacity:1; transform:rotate(180deg);}


</style>
<!--foot_menu-->
<div class="foot_menu" id="footer">
    <div class="gray_box">
        <#list bottomnavigationList as bottomnavigation>
            <#if !bottomnavigation_has_next >
                <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}" >${bottomnavigation.name}</a>&nbsp;&nbsp;
            <#else>
                <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}">${bottomnavigation.name}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            </#if>
        </#list>
        <br>
        <p>陕ICP备15014495号</p>
        <ul class="foot_rz">
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p32.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p33.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p34.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p35.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p36.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p37.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p38.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gdnz/images/temp/p39.png"></a></li>
        </ul>
    </div>
</div>

<!--foot_info-->
<div class="foot_info">
    <p>Copyright (C) 2015-2016&nbsp;&nbsp;陕西丰禾网络科技有限公司&nbsp;&nbsp;版权所有 </p>
</div>
<script type="text/javascript">
    <#if (isindex)>var isindex=true;<#else>var isindex=false;</#if>
</script>
<!--商品分类所用js（allSort.js）-->
<script type="text/javascript" src="${base}/static/bec/project/gdnz/js/allSort.js"></script>

<script type="text/javascript" src="${base}/static/bec/project/gdnz/js/rightMenu.js"></script>

<div class="r_menu">
    <ul style="right: 0px;">
        <li class="up"><i></i></li>
        <li class="qq s_li"><i></i></li>
        <li class="tel s_li"><i></i></li>
        <li class="wx s_li"><i></i></li>
        <li class="down"><i></i></li>
    </ul>
    <div class="sliBox qqBox" style="right: -150px;">
        <#--<p><a href="http://wpa.qq.com/msgrd?v=3&uin=1354670067&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:1354670067:4" alt="客服QQ" align="absmiddle" /><em>客服一</em></a></p>-->
        <#--<p><a href="http://wpa.qq.com/msgrd?v=3&uin=171979920&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:171979920:4" alt="客服QQ" align="absmiddle" /><em>客服二</em></a></p>-->
        <#--<p><a href="http://wpa.qq.com/msgrd?v=3&uin=171979920&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:171979920:4" alt="客服QQ" align="absmiddle" /><em>客服三</em></a></p>-->
        <#--<p><a href="http://wpa.qq.com/msgrd?v=3&uin=1354670067&site=qq&menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=2:1354670067:4" alt="客服QQ" align="absmiddle" /><em>客服四</em></a></p>-->
    <#--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=348863738&site=qq&menu=yes">在线咨询</a>-->
    </div>
    <div class="sliBox telBox" style="right: -150px;">
        <span>咨询热线<br><em>0913－8123025</em>
		<br><em>177 9253 3011</em>
		</span>
    </div>
    <div class="sliBox wxBox" style="right: -150px;">
        <p>
            <#--<img src="${base}/static/bec/project/gdnz/images/weixin_app.png">-->
            58百亩园手机客户端
        </p>
    <#--   <p> <img src="${base}/static/bec/project/gdnz/images/weixin1.png">
           关注锦鹏官方微信
       </p>-->
    </div>
    <span class="close" style="background:url(${base}/static/bec/project/gdnz/images/icons.png) 0px -640px no-repeat;"></span>
</div>

</body>
</html>
</#escape>