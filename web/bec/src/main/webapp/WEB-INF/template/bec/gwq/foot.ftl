<#escape x as x?html>
<!--foot_menu-->
<div class="foot_menu">
    <div class="gray_box">
        <#list bottomnavigationList as bottomnavigation>
            <#if !bottomnavigation_has_next >
                <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}" >${bottomnavigation.name}</a>&nbsp;&nbsp;
            <#else>
                <a href="<#if "${bottomnavigation.urlType}" == "1">${base}/</#if>${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}">${bottomnavigation.name}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            </#if>
        </#list>
        <br>
        <p>陕ICP备11011220号 </p>
        <ul class="foot_rz">
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p32.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p33.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p34.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p35.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p36.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p37.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p38.jpg"></a></li>
            <li><a href="#" target="_blank"><img src="${base}/static/bec/project/gwq/images/temp/p39.png"></a></li>
        </ul>
    </div>
</div>

<!--foot_info-->
<div class="foot_info">
    <p>地址：西安市西安国际港务区港务大道六号&nbsp;&nbsp;邮编：710026&nbsp;&nbsp;E-mail:xitlp@yahoo.com.cn</p>
    <p>Copyright (C) 2013-2014&nbsp;&nbsp;通联支付网络服务股份有限公司&nbsp;&nbsp;版权所有 </p>
</div>
<script type="text/javascript">
    <#if (isindex)>var isindex=true;<#else>var isindex=false;</#if>
</script>
<!--商品分类所用js（allSort.js）-->
<script type="text/javascript" src="${base}/static/bec/project/gwq/js/allSort.js"></script>
</body>
</html>
</#escape>