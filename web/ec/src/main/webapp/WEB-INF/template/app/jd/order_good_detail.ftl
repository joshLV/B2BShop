<!DOCTYPE html>
<html>
<head>
<#include "app/jd/head.ftl">
    <script>
        function ready(){
            document.getElementById("fuwu").addEventListener("tap",function(){
                move("content1","content2");
            });
            document.getElementById("xiangqing").addEventListener("tap",function(){
                move("content3","content4");
            });
        }

        //把一个元素内的内容放入另一个元素
        function move(from, to){
            var contentFrom=document.getElementById(from).innerHTML;
            var contentTo=document.getElementById(to).innerHTML;
            if(contentFrom==""){
                document.getElementById(from).innerHTML=contentTo;
                document.getElementById(to).innerHTML="";
            }else{
                document.getElementById(to).innerHTML=contentFrom;
                document.getElementById(from).innerHTML="";
            }
        }
        //倒计时
        function GetRTime(){
            var NowTime = new Date();
            var EndTime = new Date('2015/06/30 18:00:00');
            var t =EndTime.getTime() - NowTime.getTime();
            var d=Math.floor(t/1000/60/60/24);
            var h=Math.floor(t/1000/60/60%24);
            var m=Math.floor(t/1000/60%60);
            var s=Math.floor(t/1000%60);

            document.getElementById("t_d").innerHTML = d + "天";
            document.getElementById("t_h").innerHTML = h + "时";
            document.getElementById("t_m").innerHTML = m + "分";
            document.getElementById("t_s").innerHTML = s + "秒";
        }
        setInterval(GetRTime,1000);
    </script>


</head>
<!--页眉-->
<body onLoad="ready()">

<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        商品详情
    </div>
</header>

<div class="mui-content" style="font-size:12px;">
    <!--商品图片-->
    <div id="slider" class="mui-slider">
        <div class="mui-slider-group mui-slider-loop">
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/yuantiao.jpg"></a>
            </div>
            <div class="mui-slider-item">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/shuijiao.jpg"></a>
            </div>
            <div class="mui-slider-item">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/muwu.jpg"></a>
            </div>
            <div class="mui-slider-item">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/cbd.jpg"></a>
            </div>
            <div class="mui-slider-item">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/yuantiao.jpg"></a>
            </div>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/shuijiao.jpg"></a>
            </div>
        </div>
        <div class="mui-slider-indicator">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
        </div>
    </div>
    <!--商品图片结束-->

    <ul class="mui-table-view ">
        <li class="mui-table-view-cell">
            <table border="0" width="100%">
                <tr>
                    <td>
                        <span style="color:red; font-size:16px;">￥65.00</span>
                    </td>
                    <td>
                        <span style="background:#F00; color:#FFF;">闪购</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="background:#F00; color:#FFF;">手机专项</span>
                    </td>
                    <td>
                        <div style="color:red;">(比电脑买便宜13元)</div>
                    </td>
                </tr>
                <tr style="color:#999">
                    <td>距活动结束</td>
                    <td>
                        <span id="t_d">00天</span>
                        <span id="t_h">00时</span>
                        <span id="t_m">00分</span>
                        <span id="t_s">00秒</span>
                    </td>
                </tr>
            </table>
        </li>
    </ul>

    <ul class="mui-table-view mui-table-view-chevron">
        <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" id="xiangqing">
				<span style="color:#FFF; background:#63C">
					海外购
				</span>&nbsp;
                <span id="content3">
					点击查看详细介绍  123商品详细名称商品详细名称商品详细名称商品详细名称商品详细名称商品详细                    名称商品详细名称商品123
				</span>
            </a>

            <ul class="mui-table-view mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <table>
                        <tr>
                            <td id="content4"></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </li>
    </ul>


    <ul class="mui-table-view ">
        <li class="mui-table-view-cell">
              <span style="color:red;">
               	【包邮】正牌大汇聚，韩国直邮。防晒遮瑕，高效持久。
              </span>
        </li>
    </ul>



    <ul class="mui-table-view mui-table-view-chevron">
        <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">
                <span style="color:#666">促销</span>&nbsp;
                <span style="color:#FFF; background:#F90">免运费</span>&nbsp;
                <span style="color:#FFF; background:#F90">返云钻</span>&nbsp;
                <span style="color:#666">点击查看详细</span>&nbsp;
            </a>
            <ul class="mui-table-view mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <table>
                        <tr>
                            <td>今天打一折</td>
                        </tr>
                        <tr>
                            <td>明天打二折</td>
                        </tr>
                        <tr>
                            <td>后天打三折</td>
                        </tr>
                    </table>
                </li>
            </ul>
        </li>
    </ul>


    <ul class="mui-table-view ">
        <li class="mui-table-view-cell">
            <table border="0" width="100%">
                <tr>
                    <td width="15%"><span style="color:#666">送至</span> </td>
                    <td width="15%">陕西</td>
                    <td width="15%">西安</td>
                    <td width="55%">新城区</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <span style="color:#666">免运费</span>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </li>
    </ul>

    <ul class="mui-table-view mui-table-view-chevron">

        <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" id="fuwu">
                <span style="color:#666">服务</span>&nbsp;
					<span style="color:#666" id="content1">
						由“韩城美妆海外专营店” 销售和发货，并提供售后服务
					</span>&nbsp;
            </a>
            <ul class="mui-table-view mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <table>
                        <tr>
                            <td id="content2"></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </li>

    </ul>
</div>
</body>
</html>
