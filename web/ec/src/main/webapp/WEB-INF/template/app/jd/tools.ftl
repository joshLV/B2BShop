<#escape x as x?html>

<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item" id="app_index">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <a class="mui-tab-item"  id="app_zs">
        <span class="mui-icon mui-icon-flag"></span>
        <span class="mui-tab-label">招商入驻</span>
    </a>
    <a class="mui-tab-item" id="app_scjs" >
        <span class="mui-icon mui-icon-compose"></span>
        <span class="mui-tab-label">商城介绍</span>
    </a>
    <a class="mui-tab-item" id="app_pcenter">
        <span class="mui-icon mui-icon-person"></span>
        <span class="mui-tab-label">个人中心</span>
    </a>
</nav>
    <script>
        jQuery("#app_index").bind('tap click', function() {
            var url=fullpath + '/app_index';
           jumpto(url);
        });
        jQuery("#app_zs").bind('tap click', function() {
            var url=fullpath + '/join/whichapp';
            jumpto(url);
        });
        jQuery("#app_scjs").bind('tap click', function() {
            var url=fullpath +  '/introduce/whichapp';
            jumpto(url);
        });
        jQuery("#app_pcenter").bind('tap click', function() {
            var url=fullpath +  '/member/index?whichclient=whichapp';
            jumpto(url);
        });
        if(ismobile){
            jQuery(".mui-content a:not(.mui-control-item)").on('tap click',function(e){
                var url = hosturl+jQuery(this).attr("href");
                jumpto(url);
                return false;
            });
        }
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#FFFFFF',
                swipeBack: true
            });
            jQuery("nav.mui-bar a").bind('tap click',function(){
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
                if(pagename=='app_join'){
                    jQuery("#app_zs").addClass('mui-active');
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
                    mui.currentWebview.show();
                });
            }
        }(mui, document));
    </script>
</#escape>