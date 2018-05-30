<#escape x as x?html>
<style>
    .index .content {width: 1210px}
    /*help-left*/
    .help-left{width:690px;float:left;}
    /*help-right*/
    .help-right{width:290px;float:right;}
    .breadcrumb {
        height: 20px;
        padding: 10px 0 4px 6px;
        margin-bottom: 10px;
        overflow: hidden;
        line-height: 20px;
        vertical-align: baseline;
    }
    .breadcrumb strong, .breadcrumb h1 {
        font-weight: 700;
        line-height: 20px;
        font-size: 18px;
        font-family: "microsoft yahei";
    }
    /*self-service*/
    #self-service,#man-service,#novice{border:3px solid #40CCF5;}
    #self-service .mt,#novice .mt,#man-service .mt{background:url("images/newhelp_cen.gif") repeat-x scroll 0 -400px;height:35px;border-bottom:1px solid #E1F6FD;}
    #self-service .mt h3,#novice .mt h3,#man-service .mt h3{font:bold 18px/35px "Microsoft Yahei";color:#2398D1;padding-left:20px;}
    #self-service .mc{padding-top:20px;}
    #self-service li{float:left;padding:0 25px 10px;width:121px;height:99px;}
    #self-service li a{background:url('${base}/static/mall/help/newhelp_cen20140224.png') no-repeat;width:121px;height:99px;display:block;line-height:1000px;overflow:hidden;}
    #self-service .fore1 a{background-position:0 0;}
    #self-service .fore2 a{background-position:0 -100px;}
    #self-service .fore3 a{background-position:0 -200px;}
    #self-service .fore4 a{background-position:0 -300px;}
    #self-service .fore5 a{background-position:0 -700px;}
    #self-service .fore6 a{background-position:0 -800px;}
    #self-service .fore7 a{background:url(${base}/static/mall/help/iconjdcard.png) no-repeat;}
    #self-service .fore8 a{background-position:0 -1000px;}
    #self-service .fore9 a{background-position:0 -1100px;}
    #self-service .fore10 a{background-position:0 -1200px;}
    #self-service .fore11 a{background-position:0 -1300px;}
    #self-service .fore12 a{background-position:0 -1400px;}
    #self-service .fore13 a{background-position:0 -1819px;}
    #self-service .fore14 a{background-position:0 -1921px;}
    /*novice*/
    #novice li{background: url("${base}/static/mall/help/newhelp_cen20140224.png") no-repeat -24px -1500px;float:left;height:80px;padding:10px 0 22px 34px;width:102px;}
    #novice li span{width:56px;height:56px;display:block;background:url('${base}/static/mall/help/newhelp_cen20140224.png') no-repeat;margin-bottom:6px;vertical-align:middle;font-size:0;}
    #novice li a{font:14px "Microsoft Yahei";}
    #novice .fore1 span{background-position:0 -1623px;}
    #novice .fore2 span{background-position:-56px -1623px;}
    #novice .fore3 span{background-position:0 -1679px;}
    #novice .fore4 span{background-position:-56px -1679px;}
    #novice .fore5 span{background-position:0 -1735px;}
    #novice .fore5{background:0 none;}
    /*man-service*/
    #man-service{overflow:hidden;}
    #man-service ul{width:685px;}
    #man-service li{padding:24px 11px 0 25px;width:100px;height:159px;float:left;border-right:1px solid #DFF4FC;cursor:pointer;}
    #man-service .curr{background:#edf9fd;}
    #man-service li a:hover{text-decoration:none;}
    #man-service li s,#man-service li b{display:inline-block;width:100px;background:url('${base}/static/mall/help/newhelp_cen20140224.png') no-repeat;}
    #man-service li span{color:#9E9E9C;font-size:12px;height:40px;line-height:18px;display:block;margin-bottom:6px}
    #man-service s{height:36px;margin-bottom:2px}
    #man-service .fore1 s{background-position:0 -435px;}
    #man-service .fore2 s{background-position:0 -475px;}
    #man-service .fore3 s{background-position:0 -511px;height:33px;margin-bottom:3px;}
    #man-service .fore4 s{background-position:0 -545px;}
    #man-service .fore5 s{background-position:0 -581px;}
    /*#man-service .fore1 s{background-position:0 -435px;height:36px;}
    #man-service .fore2 s{background-position:0 -475px;height:35px;margin-bottom:1px;}
    #man-service .fore3 s{background-position:0 -511px;height:33px;margin-bottom:3px;}
    #man-service .fore4 s{background-position:0 -545px;height:34px;margin-bottom:2px;}
    #man-service .fore5 s{background-position:0 -581px;height:32px;}*/
    #man-service li b{background: url("images/newhelp_cen20140224.png") no-repeat 0 -617px;width:64px;height:22px;}
    /*account-safe*/
    #account-safe{padding:15px 10px 0;border:1px solid #B9E8F9;height:133px;}
    #account-safe .mt,#faq .mt{border-bottom:2px solid #E6E6E6;height:23px;position:relative;overflow:visible;margin-bottom:10px;}
    #account-safe .mt h3,#faq .mt h3{position:absolute;top:2px;height:21px;border-bottom:2px solid #44CDF5;font:bold 16px/20px "microsoft yahei";}
    #account-safe .mc{padding-top:10px;}
    /*svc-list*/
    #svc-list{border:1px solid #B9E8F9;height:78px;padding:20px;}
    #svc-list li{width:120px;float:left;margin-bottom:8px;height:24px;}
    #svc-list li a{display:inline-block;padding-left:30px;background:url("${base}/static/mall/help/newhelp_cen20140224.png") no-repeat;line-height:20px;}
    #svc-list .fore1 a{background-position:0 -1500px;height:18px;}
    #svc-list .fore2 a{background-position:0 -1518px;height:20px;}
    #svc-list .fore3 a{background-position:0 -1538px;height:23px;}
    #svc-list .fore4 a{background-position:0 -1561px;height:20px;}
    #svc-list .fore5 a{background-position:0 -1581px;height:22px;}
    #svc-list .fore6 a{background-position:0 -1603px;height:20px;}

    /*faq*/
    #faq{height:610px;border:1px solid #B9E8F9;padding:15px 10px 0;}
    #faq li{float:left;width:266px;height:24px;line-height:24px;}
    #faq li a{display:inline-block;width:246px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;vertical-align:middle;}
    #faq li span {background:url("${base}/static/mall/help/newhelp_cen20140224.png") no-repeat 0 -670px;color:#000;width:14px;height:14px;line-height:14px;margin-right:6px;text-align:center;font-size:12px;font-family:"Arial";display:inline-block;vertical-align:middle;}
    #faq .fore1 span,#faq .fore2 span,#faq .fore3 span {background-position:0 -646px;color:#FFF;}
    .itxt{width:215px;height:23px;line-height:23px;border:1px solid #e3e9ef;border-top:1px solid #abadb3;margin:0 5px 0 0;vertical-align:middle;}
    .s-btn{background:url("i/btn.png") repeat-x;height:23px;border:1px solid #bfd6af;border-radius:3px;display:inline-block;padding:0 8px;line-height:23px;vertical-align:middle;}
    .sch-txt{color:#999;font-size:12px;}
    /*thickbox*/
    .thickbox{background:url("") no-repeat #fff;padding:none;margin:none;border:0 none;overflow:visible;border:2px solid #3fccf5;border-radius:0;}
    .thickwrap{border:0 none;}
    .thickwrap .thicktitle{background:#effcff;height:19px;padding:0;margin:0;padding:0 10px;border:0 none;}
    .thickwrap .thickclose:link,.thickclose:visited{left:302px;top:-2px;width:21px;height:21px;background:url("images/newhelp_cen20140224.png") no-repeat -14px -679px;}
    .thickwrap .thickcon{padding:10px;border:0 none;}
</style>
<!--main start-->
<div class="w main content">
    <div id="Position" class="margin_b6 breadcrumb"><strong><a href="http://help.jd.com/">消费者帮助中心</a></strong></div>
    <div class="help-left">
        <div class="m" id="self-service">
            <div class="mt"><h3>自助服务</h3></div>
            <div class="mc">
                <ul class="clearfix">
                    <li class="fore1"><a target="_blank" clstag="help|keycount|help_center|query_ord_button" href="http://order.jd.com/center/list.action?r=635018107533791250">查询订单</a></li>
                    <li class="fore2"><a target="_blank" clstag="help|keycount|help_center|cancel_ord_button" href="http://order.jd.com/center/list.action?r=635018107533791250">取消订单</a></li>
                    <li class="fore3"><a target="_blank" href="http://myjd.jd.com/repair/orderlist.action">申请退换货</a></li>
                    <li class="fore13"><a target="_blank" href="http://myjd.jd.com/reminder/reminderlist.action">催办订单</a></li>

                    <li class="fore14"><a target="_blank" href="http://myjd.jd.com/afs/helper/amshomehelp.action">查询售后到家</a></li>

                    <li class="fore11"><a target="_blank" href="http://coupon.jd.com/user_quan.aspx">查询优惠券</a></li>
                    <li class="fore9"><a target="_blank" href="http://mymoney.jd.com/finance/recently.action">查询账户余额</a></li>
                    <li class="fore7"><a target="_blank" href="http://giftcard.jd.com/giftcard/index.action">京东礼品卡</a></li>
                    <li class="fore6"><a target="_blank" href="http://help.jd.com/help/distribution-768.html">查询配送服务</a></li>
                    <li class="fore4"><a target="_blank" href="http://myjd.jd.com/afs/help/afshelp.action">查询售后政策</a></li>
                    <li class="fore5"><a target="_blank" href="http://buy.jd.com/priceprotect/JiaBao.aspx">申请价保</a></li>
                    <li class="fore8"><a target="_blank" href="http://safe.jd.com/validate/updatePassword">修改密码</a></li>
                </ul>
            </div>
        </div><!--self-service end-->
        <div class="m"><a target="_blank" href="http://jimi.jd.com/index.action?source=helpCenter"><img width="690" height="120" alt="" src="${base}/static/mall/help/53901a3eN7496bc3e.png"></a></div>
        <div class="m" id="novice">
            <div class="mt"><h3>新手教学</h3></div>
            <div class="mc">
                <ul class="clearfix">
                    <li class="fore1"><a target="_blank" href="http://help.jd.com/nleft/question-755.html"><span></span>免费注册</a></li>
                    <li class="fore2"><a target="_blank" href="http://help.jd.com/nleft/question-756.html"><span></span>搜索商品</a></li>
                    <li class="fore3"><a target="_blank" href="http://help.jd.com/nleft/question-757.html"><span></span>购买流程</a></li>
                    <li class="fore4"><a target="_blank" href="http://help.jd.com/nleft/question-758.html"><span></span>在线支付</a></li>
                    <li class="fore5"><a target="_blank" href="http://help.jd.com/nleft/question-759.html"><span></span>评价晒单</a></li>
                </ul>
            </div>
        </div><!--novice end-->
        <div class="m" id="man-service">
            <div class="mt"><h3>人工服务</h3></div>
            <div class="mc">
                <ul class="clearfix">
                    <li class="fore1"><a target="_blank" href="http://chat.jd.com/jdchat/index.action?token=798"><s></s><span>9:00-24:00在线及时解答您的问题</span><b></b></a></li>
                    <li class="fore2"><a target="_blank" clstag="help|keycount|help_center|email_service_button" href="javascript:void(0);" id="linebtn"><s></s><span>第一时间通过邮件解答您的问题

</span><b></b></a></li>
                    <li class="fore3"><a target="_blank" href="http://myjd.jd.com/opinion/orderList.action"><s></s><span>欢迎您提出宝贵意见和建议

</span><b></b></a></li>
                    <li class="fore4"><a target="_blank" href="http://myjd.jd.com/appoint/telebooking.action"><s></s><span>24小时人工电话解答您的问题

</span><b></b></a></li>
                    <li class="fore5"><a target="_blank" href="http://bankws.jd.com/consume/usergrade.aspx"><s></s><span>24小时为钻石客户提供电话服务</span><b></b></a></li>
                </ul>
            </div>
        </div><!--man-service end-->
    </div><!--help-left end-->
    <div class="help-right">
        <div class="m" id="account-safe">
            <div class="mt"><h3>账户安全设置</h3></div>
            <div class="mc">
                <a target="_blank" href="http://safe.jd.com/user/paymentpassword/safetyCenter.action"><img width="258" height="69" alt="" src="${base}/static/mall/help/1.png"></a>
            </div>
        </div><!--account-safe end-->
        <div class="m" id="svc-list">
            <div class="mc">
                <ul class="clearfix">
                    <li class="fore1"><a target="_blank" clstag="help|keycount|help_center|payway_href" href="http://help.jd.com/help/question-61.html#help1309">支付方式</a></li>
                    <li class="fore2"><a target="_blank" clstag="help|keycount|help_center|quti_or_exchange_href" href="http://help.jd.com/help/question-61.html#help1311">退换货</a></li>
                    <li class="fore3"><a target="_blank" clstag="help|keycount|help_center|sendway_href" href="http://help.jd.com/help/question-61.html#help1310">配送方式</a></li>
                    <li class="fore4"><a target="_blank" href="http://help.jd.com/help/question-100.html">退款说明</a></li>
                    <li class="fore5"><a target="_blank" clstag="help|keycount|help_center|invoice_rule_href" href="http://help.jd.com/help/question-61.html#help1313">发票制度</a></li>
                    <li class="fore6"><a target="_blank" href="http://help.jd.com/help/question-99.html">价格保护</a></li>
                </ul>
            </div>
        </div><!--svc-list end-->
        <div class="m" id="faq">
            <div class="mt"><h3>常见问题</h3></div>
            <div class="mc">
                <input type="text" id="mainwordinput" onkeydown="javascript:if(event.keyCode==13) helpsearch();" name="mainwordinput" value="我要搜索" class="itxt sch-txt"><a href="javascript:helpsearch();" class="s-btn">搜索</a>
                <form action="http://help.jd.com/search/help_search.php" target="_blank" onsubmit="javascript:return checkKeywords();" method="get" id="searchFrom">
                    <input type="hidden" name="mainword" id="mainword">
                    <input type="hidden" value="help" name="sysName" class="text">
                </form>
                <ul>
                    <li class="fore1"><span>1</span><a target="_blank" href="http://help.jd.com/help/question-61.html#xgxx">订单提交成功后还可以修改收货信息吗？</a></li>
                    <li class="fore2"><span>2</span><a target="_blank" href="http://help.jd.com/help/question-61.html#tgfk">团购订单下单后，需要在什么时候付款？</a></li>
                    <li class="fore3"><span>3</span><a target="_blank" href="http://help.jd.com/help/question-61.html#nhdfk">为什么我的页面里选择不了货到付款？</a></li>
                    <li><span>4</span><a target="_blank" href="http://help.jd.com/help/question-61.html#whdhsj">无货商品什么时候可以到货呢？</a></li>
                    <li><span>5</span><a target="_blank" href="http://help.jd.com/help/question-61.html#kjfpf">如何区分京东销售和第三方卖家销售的商品？</a></li>
                    <li><span>6</span><a target="_blank" href="http://help.jd.com/help/question-61.html#ddwftj">为什么我的订单总是无法提交成功？</a></li>
                    <li><span>7</span><a target="_blank" href="http://help.jd.com/help/question-61.html#yujff">购买商品时赠送的优惠券什么时候能收到？</a></li>
                    <li><span>8</span><a target="_blank" href="http://help.jd.com/help/question-61.html#dhyqs">为何商品还没签收而订单中快递单号显示已签收？</a></li>
                    <li><span>9</span><a target="_blank" href="http://help.jd.com/help/question-61.html#qxdd">如何修改/取消订单？</a></li>
                    <li><span>10</span><a target="_blank" href="http://help.jd.com/help/question-61.html#spggxn">商品的规格是什么？性能怎样？</a></li>
                    <li><span>11</span><a target="_blank" href="http://help.jd.com/help/question-61.html#fsfsq">配送费如何收取？</a></li>
                    <li><span>12</span><a target="_blank" href="http://help.jd.com/help/question-61.html#djdpsfw">大家电配送范围？</a></li>
                    <li><span>13</span><a target="_blank" href="http://help.jd.com/help/question-61.html#shfxsh">我的售后返修单为什么审核不通过？</a></li>
                    <li><span>14</span><a target="_blank" href="http://help.jd.com/help/question-61.html#thhed">退换货运费收取额度是多少？</a></li>
                    <li><span>15</span><a target="_blank" href="http://help.jd.com/help/question-61.html#fpnrbx">发票开具非明细内容是否享受保修？</a></li>
                    <li><span>16</span><a target="_blank" href="http://help.jd.com/help/question-61.html#kjzp">开具增票需要哪些条件呢？</a></li>
                    <li><span>17</span><a target="_blank" href="http://help.jd.com/help/question-61.html#xykzj">信用卡分期支付的，怎么办理退款？</a></li>
                    <li><span>18</span><a target="_blank" href="http://help.jd.com/help/question-61.html#spsdsj">订单显示商品已交给快递，何时可以给客户送达？</a></li>
                    <li><span>19</span><a target="_blank" href="http://help.jd.com/help/question-61.html#quddtk">什么时候可以收到退款？</a></li>
                    <li><span>20</span><a target="_blank" href="http://help.jd.com/help/question-61.html#shkythh">我的商品是否可以退换货？</a></li>
                    <li><span>21</span><a target="_blank" href="http://help.jd.com/help/question-61.html#tjshfwd">如何提交售后服务单？</a></li>
                    <li><span>22</span><a target="_blank" href="http://help.jd.com/help/question-61.html#ybyz">验证手机或邮箱时提示已被他人验证了怎么办？</a></li>
                </ul>
            </div>
        </div><!--faq end-->
    </div><!--help-right end-->
    <div class="clr"></div>
</div>
<!--main end-->
</#escape>
