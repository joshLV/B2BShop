<#escape x as x?html>
<!--帮助中心左侧-->
<div class="help_l">
    <ul id="help_list">
        <li>
            <h2>帮助中心</h2>
            <ul>
                <#list parentList as plMenu>
                    <li>
                        <h3><i>&nbsp;</i>${plMenu.name}</h3>
                        <ul style="">
                        <#list childList as clMenu>
                            <#if plMenu.id==clMenu.categoryId>
                                <li id="${clMenu.orderNo}" <#if clMenu.id==articles.id>class="on"</#if>><a href="${base}/help/question/${clMenu.id}.html"><i>&nbsp;</i>${clMenu.title}</a></li>
                            </#if>
                        </#list>
                            <#--<li id="left_navi02"><a href="#"><i>&nbsp;</i>新会员注册</a></li>-->
                            <#--<li id="left_navi03" class="on"><a href="#"><i>&nbsp;</i>用户登录</a></li>-->
                            <#--<li id="left_navi05"><a href="#"><i>&nbsp;</i>找回密码</a></li>-->
                        </ul>
                    </li>
                </#list>
                <#--<li>-->
                    <#--<h3 class="on"><i>&nbsp;</i>新手入门</h3>-->
                    <#--<ul style="">-->

                        <#--<li id="left_navi02"><a href="#"><i>&nbsp;</i>新会员注册</a></li>-->
                        <#--<li id="left_navi03" class="on"><a href="#"><i>&nbsp;</i>用户登录</a></li>-->
                        <#--<li id="left_navi05"><a href="#"><i>&nbsp;</i>找回密码</a></li>-->
                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<h3 class=""><i>&nbsp;</i>买家帮助</h3>-->
                    <#--<ul >-->
                        <#--<li id="left_navi08"><a href="#"><i>&nbsp;</i>发布急求购</a></li>-->
                        <#--<li id="left_navi09"><a href="#"><i>&nbsp;</i>订购产品</a></li>-->
                        <#--<li id="left_navi04"><a href="#"><i></i>订单状态说明</a></li>-->
                        <#--<li id="left_navi07"><a href="#"><i></i>购物流程</a></li>-->
                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<h3 class=""><i>&nbsp;</i>卖家帮助</h3>-->
                    <#--<ul >-->
                        <#--<li id="left_navi10"><a href="#"><i>&nbsp;</i>配送范围、时间及费用</a></li>-->
                        <#--<li id="left_navi11"><a href="#"><i>&nbsp;</i>配送服务查询</a></li>-->
                        <#--<li id="left_navi12"><a href="#"><i>&nbsp;</i>如何开店</a></li>-->
                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<h3 class=""><i>&nbsp;</i>支付方式</h3>-->
                    <#--<ul >-->
                        <#--<li id="left_navi13"><a href="#"><i>&nbsp;</i>在线支付</a></li>-->
                        <#--<li id="left_navi14"><a href="#"><i>&nbsp;</i>网上支付</a></li>-->
                        <#--<li id="left_navi15"><a href="#"><i>&nbsp;</i>银行转账</a></li>-->

                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<h3 ><i>&nbsp;</i>售后服务</h3>-->
                    <#--<ul>-->
                        <#--<li id="left_navi18"><a href="#" target="_blank"><i>&nbsp;</i>退款说明</a></li>-->
                        <#--<li id="left_navi28"><a href="#"><i></i>退换货说明</a></li>-->
                        <#--<li id="left_navi20"><a href="#"><i></i>退款政策</a></li>-->

                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<h3 class=""><i></i>企业服务</h3>-->
                    <#--<ul>-->
                        <#--<li id="left_navi30"><a href="#"><i></i>供应商合作</a></li>-->
                        <#--<li id="left_navi31"><a href="#"><i></i>供应商入口</a></li>-->
                        <#--<li id="left_navi30"><a href="#"><i></i>商家入驻</a></li>-->

                    <#--</ul>-->
                <#--</li>-->
            </ul>
        </li>
    </ul>
    <#--<ul class="help_about">
        <li>
            <h2>关于广货街</h2>
            <ul class="about_yyw">
                <li id="left_navi21"><a href="help_about.html"><i>&nbsp;</i>企业简介</a></li>
                <li id="left_navi22"><a href="#"><i>&nbsp;</i>联系我们</a></li>


            </ul>
        </li>
    </ul>-->
</div>

</#escape>
<!--帮助左侧折叠面板所用js（allSort.js）-->
<script type="text/javascript">
    jQuery(function(){

        jQuery("#help_list").find("h3").next("ul").hide();
        //jQuery("#help_list").find("h3").eq(0).addClass("on")
        //jQuery("#help_list").find("h3").eq(0).next("ul").show();
        jQuery("#help_list").find("h3").click(function(){
            var sub_list2 = jQuery(this).next("ul");
            if(sub_list2.is( ":visible")){
                sub_list2.slideUp();
                jQuery(this).removeClass("on");
            }else{
                jQuery("#help_list").find("h3").removeClass("on");
                jQuery("#help_list").find("h3").next().slideUp();
                sub_list2.slideDown();
                jQuery(this).addClass("on");
            }
        });
        jQuery("#help_list").find("li.on").parent("ul").show();
        jQuery("#help_list").find("li.on").parent("ul").prev().addClass("on");
        var h = $(".place").find("a[href='#']").html();
        $("#help_list h3:contains('"+h+"')").addClass("on");
        $("#help_list h3:contains('"+h+"')").next("ul").show();
//左侧导航栏根据滚动条位置判断定位fixed
        var $help_l = $('.help_l'),
                $help_r = $('.help_r'),
                _right_offsetTop = $help_r.offset().top,
                _right_outerHeight = $help_r.outerHeight();
        $(window).scroll(function(){
            var _scrollTop = $(window).scrollTop(),
                    _windowHeight = $(window).height(),
                    _help_l_outerHeight = $help_l.outerHeight();
            if(_right_outerHeight<_help_l_outerHeight || _scrollTop<_right_offsetTop){//右侧页面高度小于左侧菜单栏高度时 或者 滚动到菜单栏top位置之前时不滚动
                $help_l.css({
                    'position':'static',
                    'float':'left'
                });
                $help_r.css({
                    'float':'right',
                    'marginLeft':0
                });
                return;
            }else{//否则改为fixed定位，并固定在距离顶部36px位置
                $help_l.css({
                    "float":"none",
                    "position":"fixed",
                    "top":"0px",
                    "z-index":"9",
                    "background": "#fff"
                });
                $help_r.css({
                    "float":"none",
                    "marginLeft":"200px"
                });
            }
            if(_scrollTop+_windowHeight+150<_right_offsetTop+_right_outerHeight){//滚动高度和当前窗口高度<右侧内容底部距离（即滚动到右侧底部位置之前的时候，始终定位在36px位置）
                $help_l.css('top','0px');
            }else{//滚动到右侧底部之后，定位要随着滚动而改变定位top值，否则菜单栏会遮住底部footer部分
                $help_l.css('top',_right_offsetTop+_right_outerHeight-_scrollTop-_windowHeight-150+'px');
            }
        });

    })
</script>