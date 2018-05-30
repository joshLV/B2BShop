<#escape x as x?html>

<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item" id="app_index">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>
<#-- <a class="mui-tab-item"  id="app_shop">
        <span class="mui-icon mui-icon-flag"></span>
        <span class="mui-tab-label">世界名品</span>
    </a>-->
    <a class="mui-tab-item" id="app_scjs" >
        <span class="mui-icon iconfont icon-gouwuche"></span>
        <span class="mui-tab-label">购物车</span>
    </a>
    <a class="mui-tab-item" id="app_pcenter">
        <span class="mui-icon mui-icon-person"></span>
        <span class="mui-tab-label">个人中心</span>
    </a>
<#--<a class="mui-tab-item" id="app_news">
        <span class="mui-icon iconfont icon-news"></span>
        <span class="mui-tab-label">新闻中心</span>
    </a>-->
</nav>
    <script>
        jQuery("#app_index").bind('tap', function() {
            var url=fullpath + '/app_index';
           jumpto(url);
        });
        <#-- jQuery("#app_shop").bind('tap', function() {
            var url = fullpath + '/shop/brandShop?pageSize=8&';
            jumpto(url);
        });-->
        jQuery("#app_scjs").bind('tap', function() {
            var url=fullpath +  '/cart/list?whichclient=whichapp&isLogin=${isLogin}';
            jumpto(url);
        });
        jQuery("#app_pcenter").bind('tap', function() {
            var url=fullpath +  '/member/index?whichclient=whichapp';
            jumpto(url);
        });
        <#-- jQuery("#app_news").bind('tap', function() {
             var url=fullpath +  '/join/whichapp';
             jumpto(url);
         });-->
<#--
        if(ismobile){
            jQuery(".mui-content a:not(.mui-control-item)").on('tap',function(e){
                var url = window.location.protocol + "//" + window.location.host;
                var project = "${base}";
                var href = jQuery(this).attr("href");
                var hrefUpper = href.toUpperCase();
                if(href.length == 0
                        ||  href.indexOf("#") == 0
                        || hrefUpper.indexOf("JAVASCRIPT") >= 0){
                    return false;
                }else if( project.length >= 1 && href.indexOf(project) >= 0){
                    url = url + href;
                }else{
                    url = url + project;
                    url = url + href;
                }
                jumpto(url);
                return false;
            });
        }
-->
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#FFFFFF'
            });
            jQuery("nav.mui-bar a").bind('tap',function(){
                jQuery("nav.mui-bar a").each(function(){
                    jQuery(this).removeClass('mui-active');
                });
                jQuery(this).addClass('mui-active');
            });
            var pagename='${cls!}';
            if(pagename!=''){
                if(pagename=='app_index'){
                    jQuery("#app_index").addClass('mui-active');
                }
                if(pagename=='app_shop'){
                    jQuery("#app_shop").addClass('mui-active');
                }
                if(pagename=='app_join'){
                    jQuery("#app_shop").addClass('mui-active');
                }
                if(pagename=='app_introduce'){
                    jQuery("#app_scjs").addClass('mui-active');
                }
                if(pagename=='app_setting1'){
                    jQuery("#app_pcenter").addClass('mui-active');
                }
            }
            if(ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }
        }(mui, document));
    </script>
</#escape>