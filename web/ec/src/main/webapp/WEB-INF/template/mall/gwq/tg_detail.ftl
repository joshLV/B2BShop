<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<script type="text/javascript" src="${base}/static/mall/gwq/js/jquery-zzjs.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/group_purchase.css?v=<@spring.message 'version'/>">

<script type="text/javascript">
    $(document).ready(function(){

        $("h2").append('<em></em>')

        $(".thumbs a").click(function(){

            var largePath = $(this).attr("href");
            var largeAlt = $(this).attr("title");

            $("#largeImg").attr({ src: largePath, alt: largeAlt });

            $("h2 em").html(" (" + largeAlt + ")"); return false;
        });
    });
</script>
<script type="text/javascript">
    function setTab(name,cursel){
        cursel_0=cursel;
        for(var i=1; i<=links_len; i++){
            var menu = document.getElementById(name+i);
            var menudiv = document.getElementById("con_"+name+"_"+i);
            if(i==cursel){
                menu.className="off";
                menudiv.style.display="block";
            }
            else{
                menu.className="";
                menudiv.style.display="none";
            }
        }
    }
    function Next(){
        cursel_0++;
        if (cursel_0>links_len)cursel_0=1
        setTab(name_0,cursel_0);
    }
    var name_0='one';
    var cursel_0=1;

    var links_len,iIntervalId;
    onload=function(){
        var links = document.getElementById("J_DetailTab").getElementsByTagName('li')
        links_len=links.length;
        for(var i=0; i<links_len; i++){
            links[i].onmouseover=function(){
                clearInterval(iIntervalId);
                this.onmouseout=function(){
                    iIntervalId = setInterval(Next,ScrollTime);;
                }
            }
        }
        document.getElementById("con_"+name_0+"_"+links_len).parentNode.onmouseover=function(){
            clearInterval(iIntervalId);
            this.onmouseout=function(){
                iIntervalId = setInterval(Next,ScrollTime);;
            }
        }
        setTab(name_0,cursel_0);
        iIntervalId = setInterval(Next,ScrollTime);
    }
</script>
<div class="" style="width: 1200px;" >
    <div class="detail-main  clearfix">
        <!-- header -->
        <div class="header clearfix">
            <ul class="crumbs">
                <li><a href="#">今日团购</a></li>
                <span class="arrow"><small></small></span>
                <li><a href="#">商品团</a></li>
                <span class="arrow"><small></small></span>
                <li><a href="#">女装</a></li>
            </ul>
            <a class="bookMark" href="#"><em>查看更多同类商品</em><span></span></a>

        </div>
        <div class="clearfix">
            <div class="main-pic">
                <div class="normal-pic-wrapper clearfix" >
                    <div class="normal-pic ">

                        <div class="item-pic-wrap">
                            <img src="${base}/static/mall/gwq/img/goods1.jpg" id="largeImg">
                        </div>

                    </div>
                    <div class="thumbs">
                        <a href="${base}/static/mall/gwq/img/goods1.jpg" title="Image 2"><img src="${base}/static/mall/gwq/img/goods1.jpg"></a>
                        <a href="${base}/static/mall/gwq/img/goods2.jpg" title="Image 3"><img src="${base}/static/mall/gwq/img/goods2.jpg"></a>
                        <a href="${base}/static/mall/gwq/img/goods1.jpg" title="Image 4"><img src="${base}/static/mall/gwq/img/goods1.jpg"></a>
                        <a href="${base}/static/mall/gwq/img/goods2.jpg" title="Image 5"><img src="${base}/static/mall/gwq/img/goods2.jpg"></a>
                        <a href="${base}/static/mall/gwq/img/goods3.jpg" title="Image 6"><img src="${base}/static/mall/gwq/img/goods3.jpg"></a>
                    </div>
                </div>
            </div>
            <div class="main-box J_mainBox  avil">
                <h2 class="title">
                    【抢！抢！抢！！！】【非常火爆】胖瘦皆宜 纯棉短裤女夏2016宽松高腰糖果色休闲运动热裤大码女裤（每个ID限购5件）
                </h2>
                <div class="biztag ">
                    <label>包邮</label>
                    <label>退货赔运费</label>
                    <label>→抢！抢！抢！！</label>
                </div>
                <div class="description">
                    <ul>
                        <li>精选优质纯棉 夏日纯棉短裤，清爽、舒适、亲肤、清凉一夏</li>
                        <li>12色9码可选 松紧腰设计 S-6XL码，不挑身材，胖瘦皆宜，超值百搭</li>
                        <li>大厂直供 3D立体剪裁好裤子不挑人</li>
                    </ul>

                </div>
                <!--<div class="infobar clearfix">
       <div class="time-banner">
        <div class="icon-time">
        </div>
        <div class="ju-clock J_juItemTimer">
        还剩: <span class="day">2</span>天<span class="hour">15</span>小时<span class="min">50</span>分<span class="sec">39.2</span>秒
        </div>
       </div>
    <div class="numOfPeople J_ItemSold"><span class="icon-fire"></span> <span class="num">14298</span>件已付款
    </div>
</div>     -->
                <div class="status-banner J_statusBanner">
                    <div class="currentPrice">
                        <small>¥</small>23.90
                    </div>
                    <div class="oprice ">
                        <div class="zgjicon"><small>专柜价</small></div>
                        <del class="originPrice">¥198.00</del>
                    </div>
                    <form class="J_BuySubForm"  action="" method="post">
                        <input name="_tb_token_" type="hidden" value="5kj5iU855Lh65c8">
                        <input type="hidden" name="_input_charset" value="utf-8">
                        <input type="hidden" name="itemId" value="528908011353">
                        <input type="hidden" name="id" value="10000025049445">
                        <input type="hidden" name="tgType" value="0">
                        <button type="submit" class="buyaction J_BuySubmit"><span>马上抢</span></button>
                    </form>
                </div>
                <div class="botbar">
                    <div class="operation">
                        <a target="_blank" style="display: inline-block;" href="#" class="ju-detail-cart J_CartPluginTrigger">
                            <span></span><em>加入购物车</em>
                        </a>
                        <input type="hidden" id="" value="">
                        <a href="#" class="add-jucollect J_AddToJuCollect" ><span></span><em>加入收藏</em></a>
                        <a class="J_ItemShare share"  href="#"><span></span><em>分享</em></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="ju-wrapper">
        <div id="detail-left">
            <div class="detail-title">
                相关推荐
            </div>
            <div class="recommend">
                <div class="recom-list J_RememList">
                    <div class="tab-content" style="height: 152px; overflow: hidden; width: 212px;">
                        <div style="position: absolute; height: 912px; overflow: hidden; top: 0px; -webkit-transition-duration: 0.5s; transition-duration: 0.5s; -webkit-transform: translate3d(0px, 0px, 0px); -webkit-backface-visibility: hidden;">
                            <ul>
                                <li class="tab-pannel" style="float: none; overflow: hidden; height: 152px; display: block;">
                                    <a target="_blank" href="#"><img src="${base}/static/mall/gwq/img/goods2.jpg">
                                        <div class="look-price"><span>¥1352.00</span><h5>GEOX/健乐士2016春季新款女鞋气质通勤中跟羊皮单鞋</h5>
                                        </div>
                                    </a>
                                </li>
                                <li class="tab-pannel" style="float: none; overflow: hidden; height: 152px; display: block;">
                                    <a target="_blank" href="#"><img src="${base}/static/mall/gwq/img/goods2.jpg">
                                        <div class="look-price"><span>¥1352.00</span><h5>GEOX/健乐士2016春季新款女鞋气质通勤中跟羊皮单鞋</h5>
                                        </div>
                                    </a>
                                </li>
                                <li class="tab-pannel" style="float: none; overflow: hidden; height: 152px; display: block;">
                                    <a target="_blank" href="#"><img src="${base}/static/mall/gwq/img/goods2.jpg">
                                        <div class="look-price"><span>¥1352.00</span><h5>GEOX/健乐士2016春季新款女鞋气质通勤中跟羊皮单鞋</h5>
                                        </div>
                                    </a>
                                </li>
                                <li class="tab-pannel" style="float: none; overflow: hidden; height: 152px; display: block;">
                                    <a target="_blank" href="#"><img src="${base}/static/mall/gwq/img/goods2.jpg">
                                        <div class="look-price"><span>¥1352.00</span><h5>GEOX/健乐士2016春季新款女鞋气质通勤中跟羊皮单鞋</h5>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="detail-right">
            <div class="sub-box">
            </div>
            <div class="detail-detail" id="J_DetailTab">
                <div class="dd-header J_DetailTab">
                    <ul>
                        <li id="one1" class="current" onclick="setTab('one',1)">宝贝详情<span class="triangle"></span></li>
                        <li id="one2" onclick="setTab('one',2)">历史评价<strong>50</strong><span class="triangle"></span></li>
                    </ul>
                </div>
                <div class="dd-content">
                    <div id="con_one_1"><h4>详情详情详情详情详情详情详情详情</h4></div>
                    <div id="con_one_2"><h4>评价评价评价</h4></div>
                </div>
            </div>
        </div>
    </div>
</div>


	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>