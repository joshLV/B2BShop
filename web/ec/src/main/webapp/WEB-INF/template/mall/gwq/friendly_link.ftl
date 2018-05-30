<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
    <#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
    window.pageConfig={
        compatible:true,
        navId:"memberindex"
    };
</script>
<style>
    .links-content{width:1208px; height:auto; margin:0 auto; border:1px solid #e8e8e8; border-top:2px solid #db0000; margin-top: 10px; background: #ffffff; margin-bottom: 20px;}
    .link_tit{height:40px; line-height:40px; background:#f5f5f5; border-bottom:1px solid #e8e8e8; font-size:16px; padding-left:15px;}
    .link_list{padding:10px 30px 0;}
    .link_list:after {
        content:".";
        display:block;
        height:0;
        clear:both;
        visibility:hidden;
    }
    .link_list{
        display:inline-table;
    }


    .link_list li{padding-left:28px;float:left;width:254px;height:32px;line-height:32px;border-bottom:1px dotted #ccc; white-space:nowrap; overflow:hidden}
    .link_list li a{color:#005ea7;}
    .link_list li a:hover{color:#ff4400; text-decoration:underline;}
</style>

<div class="links-content">
    <h3 class="link_tit">友情链接</h3>
    <ul  class="link_list">
        <#list friendlyLinkList as friend>
            <li><a href="${friend.url}" target="_blank">${friend.name}</a></li>
        </#list>
    </ul>
</div>

<script type="text/javascript">

</script>


    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>