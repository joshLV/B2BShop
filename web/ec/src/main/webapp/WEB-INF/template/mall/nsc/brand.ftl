<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>

    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script type="text/javascript">
        $(window).load(function(e) {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".u-cates-li").hover(function(e) {
                $(this).css("background","#f0f0f0");
                $(this).addClass("u-cates-over").removeClass(".u-cates-li");
            },function(e){
                $(this).removeClass("u-cates-over").addClass(".u-cates-li");
                $(".u-cates-li:even").css("background-color","#fafafa");
            });
            $(".m-floor1-text").idTabs("!mouseover");
            $(".m-floor1-text a").mouseover(function(e) {
                $(this).parent().parent().find("a").removeClass("u-floor1-used");
                $(this).addClass("u-floor1-used");
            });
        });
        function ChangeDiv(divId,divName,zDivCount)
        {
            for(i=0;i<=zDivCount;i++)
            {
                document.getElementById(divName+i).style.display="none";
//将所有的层都隐藏
            }
            document.getElementById(divName+divId).style.display="block";
//显示当前层
        }
    </script>
</head>
<body>
<#assign path="mall/nsc">
<div class="g-doc">
<#--页眉-->
    <div class="g-hd">
    <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
    </div>
<#--页面中间-->
    <div class="g-bd">
        <div class="g-main">
            <div class="banner"> <img src="${base}/static/mall/nsc/img/ppj/banner.jpg"> </div>
            <div class="g_flzq">
                <div class="g_ftit"> 肥料专区 </div>
                <div class="g_zcon">
                    <ul class="f-fl">
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_frimg2"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/r_img03.jpg"></a></div>
                            <div class="g_fname2"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_ftit"> 种子专区 </div>
                <div class="g_zcon">
                    <ul class="f-fl">
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_frimg2"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/r_img03.jpg"></a></div>
                            <div class="g_fname2"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_ftit"> 农药专区 </div>
                <div class="g_zcon">
                    <ul class="f-fl">
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_fimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img02.jpg"></a></div>
                            <div class="g_fname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="g_frimg2"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/r_img03.jpg"></a></div>
                            <div class="g_fname2"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_stit">
                    <h3>即将售卖商品</h3>
                    <a class="current" onmousemove="JavaScript:ChangeDiv('0','JKDiv_',3)" style="cursor:hand;">肥料</a>
                    <a onmousemove="JavaScript:ChangeDiv('1','JKDiv_',3)" style="cursor:hand;">种子</a>
                    <a onmousemove="JavaScript:ChangeDiv('2','JKDiv_',3)" style="cursor:hand;">农药</a>
                    <a onmousemove="JavaScript:ChangeDiv('3','JKDiv_',3)" style="cursor:hand;">农机</a>
                    <a class="more">更多&gt;</a> </div>
                <div class="g_scon" id="JKDiv_0" >
                    <ul >
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                    </ul>
                </div>
                <div class="g_scon" id="JKDiv_1" style="display: none;" >
                    <ul >
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒1</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                    </ul>
                </div>
                <div class="g_scon" id="JKDiv_2" style="display: none;" >
                    <ul >
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒2</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                    </ul>
                </div>
                <div class="g_scon" id="JKDiv_3" style="display: none;" >
                    <ul >
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒3</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                        <li>
                            <div class="g_simg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img03.jpg"></a></div>
                            <div class="g_sname"><a href="#">好汉种业 费玉4号(玉米种子)4400粒</a></div>
                            <div class="g_sl"><a href="#">浏览量 1083</a></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_stit">
                    <h3>即将入驻品牌</h3>
                    <a href="#" class="more">更多&gt;</a> </div>
                <div class="g_zcon">
                    <ul>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                        <li>
                            <div class="g_pimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img04.jpg"></a></div>
                            <div class="g_pname"><a href="#">抗威棉花种 抗病先锋 威力无穷</a></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<#--服务-->
<div class="g-bd2">
    <#include "${path}/service.ftl">
</div>
<#--页脚-->
<#include "${path}/footer.ftl">
</body>
</html>