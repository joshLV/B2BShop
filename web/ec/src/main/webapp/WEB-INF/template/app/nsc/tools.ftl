<#escape x as x?html>

<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item <#if 'app_index'==cls>mui-active</#if> " data-href="${base}/app_index" id="home">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <a class="mui-tab-item <#if 'app_join'==cls>mui-active</#if>" data-href="${base}/join/whichapp"  id="zhaoshang">
        <span class="mui-icon mui-icon-flag"></span>
        <span class="mui-tab-label">招商入驻</span>
    </a>
    <a class="mui-tab-item <#if 'app_introduce'==cls>mui-active</#if>" data-href="${base}/introduce/whichapp" id="scjs" >
        <span class="mui-icon mui-icon-compose"></span>
        <span class="mui-tab-label">商城介绍</span>
    </a>
    <a class="mui-tab-item <#if 'app_setting1'==cls>mui-active</#if>"  data-href="${base}/member/index?whichclient=whichapp" id="setting1">
        <span class="mui-icon mui-icon-person"></span>
        <span class="mui-tab-label">个人中心</span>
    </a>
</nav>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script>
        var fullpath = "";
        var ismobile=true;
        if(typeof(mui.os.android)=='undefined' && typeof(mui.os.ios)=='undefined'){
            ismobile=false;
        }
        if(typeof(mui.os.plus)=='undefined'){
            ismobile=false;
        }
        function getWebRootPath() {
            var webroot=document.location.href;
            var header = webroot.substring(0, webroot.indexOf('//')+2);
            webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
            var serverName = webroot.substring(0, webroot.indexOf('/')+1);
            webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
            webroot=webroot.substring(0,webroot.indexOf('/'));
            var rootpath="/"+webroot;
            fullpath = header  + serverName + webroot;
            return header  + serverName;
        }
        var hosturl = getWebRootPath();
        jQuery("#home").bind('tap click', function() {
            var url=fullpath + '/app_index';
            if(ismobile){
                mui.openWindow({
                    url: url,
                    id:'home'
                });
            }else {
                window.location.href = url;
            }
        });
        jQuery("#zhaoshang").bind('tap click', function() {
            var url=fullpath + '/join/whichapp';
            if(ismobile){
                mui.openWindow({
                    url: url,
                    id:'zhaoshang'
                });
            }else {
                window.location.href = url;
            }
        });
        jQuery("#scjs").bind('tap click', function() {
            var url=fullpath +  '/introduce/whichapp';
            if(ismobile){
                mui.openWindow({
                    url: url,
                    id:'scjs'
                });
            }else {
                window.location.href = url;
            }
        });
        jQuery("#setting1").bind('tap click', function() {
            var url=fullpath +  '/member/index?whichclient=whichapp';
            if(ismobile){
                mui.openWindow({
                    url: url,
                    id:'setting1'
                });
            }else {
                window.location.href = url;
            }
        });
        if(ismobile){
            jQuery(".mui-content a:not(.mui-control-item)").on('tap',function(e){
                var url=hosturl + jQuery(this).attr("href");
                mui.openWindow({
                    url: url,
                    show:{
                        autoShow:false
                    }
                });
                return false;
            });
        }
    </script>
</#escape>