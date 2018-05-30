<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top.ftl"/>


<script type="text/javascript" src="${base}/static/My97DatePicker/WdatePicker.js"></script>
<link href="${base}/static/bec/project/ghj/skins/all.css?v=1.0.2" rel="stylesheet">
<script src="${base}/static/bec/project/ghj/js/icheck.js?v=1.0.2"></script>
<style>
    .icheckbox_square-red.checked,.icheckbox_square-red {
        float: left;
        margin-top: 4px; margin-right: 5px;
    }

</style>

<div class="z_main">
    <input type="hidden" id="zhongChouStatus" name="zhongChouStatus" value="${zhongChouStatus}" />
    <div class="list_search">
        <div class="f-cb">
            <div class="f-fl">
                <span>商品搜索：</span>
                <input class="has_reset inp_search" type="text"  name="sn" id="sn" placeholder="商品简称、简称" value="${sn}">

                <span>众筹日期</span>
                <input class="has_reset inp_search Wdate" type="text"  name="ZCStartDate" id="ZCStartDate" placeholder="众筹开始日期" value="${ZCStartDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'ZCEndDate\')}',lang:'zh-cn'})"/>
                <span>-</span>
                <input class="has_reset inp_search Wdate" type="text"  name="ZCEndDate" id="ZCEndDate" placeholder="众筹截止日期" value="${ZCEndDate}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'ZCStartDate\')}',lang:'zh-cn'})"/>

                <input type="button" name="" value="搜&nbsp;索" class="inp_btn" onclick="allG();">
            </div>
            <div class="f-fr"> 共找到<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个众筹项目 </div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>众筹状态：</span></div>
            <div class="f-fl pinpai">
                <ul class="pro_sort f-cb">
                    <li>
                        <input type="checkbox" id="zhongChouStatus1" name="zhongChouStatus" value="1"/>
                        <label for="zhongChouStatus1"></label>
                        <span class="zt">即将开始</span>

                    </li>
                    <li>
                        <input type="checkbox" id="zhongChouStatus2" name="zhongChouStatus"   value="2"   />
                        <label for="zhongChouStatus2"></label>
                        <span class="zt">众筹中</span>
                    </li>
                    <li>
                        <input type="checkbox" id="zhongChouStatus3" name="zhongChouStatus"  value="3" />
                        <label for="zhongChouStatus3"></label>
                        <span class="zt">众筹成功</span>
                    </li>
                    <li>
                        <input type="checkbox" id="zhongChouStatus4" name="zhongChouStatus" value="4"  />
                        <label for="zhongChouStatus4"></label>
                        <span class="zt">众筹失败</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="zc_div f-cb" style="margin-top: 20px;">
        <ul class="zc_ul f-cb">
            <#list zcgoodsList as goods>
                <#assign zcgoods = goods["goods"]/>

                <li <#if ((goods_index+1)%4 == 0 && goods_index>0)>class="lase"</#if>>
                    <a href="${base}/zcgoods/detail/${zcgoods.id}.html?whichclient=whichpc" target="_blank" class="item-a">
                        <#if zcgoods.pic?exists>
                            <img src="${zcgoods.pic}@280w_280h.png">
                        <#else>
                            <img src="${base}/images/loaderror.png">
                        </#if>
                    </a>
                    <h3 class="item-title"><a target="_blank" href="${base}/zcgoods/detail/${zcgoods.id}.html?whichclient=whichpc">${zcgoods.fullName}</a></h3>
                    <div class="zc_price">众筹价格<span>￥${goods.price?string("#00.00")}</span></div>
                    <div class="p-outer">
                        <div class="p-bar">
                            <div style="width: ${goods["zcbfb"]}%" class="p-bar-blue"></div>
                        </div>
                    </div>
                    <div class="p-i-infos">
                        <div class="fore2">
                            <p class="num">￥<#if goods["ycje"]?number&lt;1>${goods["ycjeY"]}元<#else>${goods["ycje"]}万元</#if></p>
                            <p class="p-num">已筹金额</p>
                        </div>
                        <div class="fore1">

                            <p class="num">${goods["zcbfb"]}%</p>
                            <p class="p-num">已达成比例</p>
                        </div>
                        <div class="fore3">
                            <p class="num"><#if 1== goods["syts"]>${goods["sysj"]}<#else>${goods["syts"]}</#if></p>
                            <p class="p-num"><#if 1== goods["syts"]>剩余时间<#else>剩余天数</#if></p>
                        </div>
                    </div>
                    <div class="pro_pic_bg" >
                        <#--${goods.status}${zcgoods.zhongChouStatus}-->
                        <#--//-1_活动未开始，2_进行中，3_已结束-->
                        <#if goods.status=='1'>
                            <span class="fl state_ks">
                                活动未开始
                            </span>
                        <#elseif goods.status=='2'>
                            <span class="fl state">
                                众筹中
                            </span>
                        <#elseif goods.status=='3'>
                            <#if zcgoods.zhongChouStatus=='3'>
                                <span class="fl state_ok">
                                    众筹成功
                                </span>
                            <#elseif zcgoods.zhongChouStatus=='4'>
                                <span class="fl state_sb">
                                    众筹失败
                                </span>
                            </#if>
                        </#if>
                            <!--1_活动未开始-->
                      <#if goods.status=='1'>
                          <span class="fr ng-binding">开始日期:${zcgoods.zcStartTime?string("yyyy年MM月dd日")}</span>
                      <#else>
                          <span class="fr ng-binding">截止日期:${zcgoods.zcEndTime?string("yyyy年MM月dd日")}</span>
                      </#if>
                    </div>
                </li>
            </#list>

        </ul>
        <div class="fy">
            <div class="page">
                <#if (pager.list?size > 0)>
                    <div class="pagin fr">
                        <#import "bec/ghj/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/zcgoods/listZc.html?sn=${sn}&zhongChouStatus=${zhongChouStatus}&ZCStartDate=${ZCStartDate}&ZCEndDate=${ZCEndDate}" />
                    </div>
                <#else>
                    <div class="pagin">
                        <div class="searchTip" style="min-height: 390px; padding-top: 12px; line-height: 2; font-size: 14px; text-align: center;">
                            <div class="searchTipContent">
                                <h2 style="font-size: 16px; color: #e9314a;">尚未发布任何信息!</h2>
                                <h3>建议您：</h3>
                                <ol id="searchTipSugg">
                                    <li>
                                        看看输入的文字是否有误
                                    </li>
                                    <li>
                                        调整关键词，如“全铜花洒套件”改成“花洒”或“花洒 套件”
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>





<script type="text/javascript">

    $(function() {
        var zhongChouStatus = $("#zhongChouStatus").val();
        if(zhongChouStatus) {
            $.each(zhongChouStatus.split(","), function(i, n) {
                $("#zhongChouStatus"+n.trim()).attr("checked", true);
            });
        }
    })

    function allG() {
        /*if(!isLogin()  && param.indexOf("vt=list") > 0) {
            $("#cartLogin").trigger("click");
            return false;
        }*/
        var sn="";
        var zhongChouStatus="";
        var ZCStartDate="";
        var ZCEndDate="";
        if( sn == '' ){
            sn = $("#sn").val();
        }
        if( zhongChouStatus == '' ){
            for(var i=0;i < document.getElementsByName('zhongChouStatus').length;i++) {
                if(document.getElementsByName('zhongChouStatus')[i].checked){
                    if(zhongChouStatus=='')
                        zhongChouStatus += document.getElementsByName('zhongChouStatus')[i].value;
                    else
                        zhongChouStatus += ',' + document.getElementsByName('zhongChouStatus')[i].value;
                }
            }
        }
        if( ZCStartDate == '' ){
            ZCStartDate = $("#ZCStartDate").val();
        }
        if( ZCEndDate == '' ){
            ZCEndDate = $("#ZCEndDate").val();
        }

        //组装查询条件
        var filter = '';
        if($.trim(sn) != ''){
            filter += "sn=" + encodeURI(encodeURI($.trim(sn)));
        }
        if($.trim(zhongChouStatus) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "zhongChouStatus=" + encodeURI(encodeURI($.trim(zhongChouStatus)));
        }
        if($.trim(ZCStartDate) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "ZCStartDate=" + encodeURI(encodeURI($.trim(ZCStartDate)));
        }
        if($.trim(ZCEndDate) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "ZCEndDate=" + encodeURI(encodeURI($.trim(ZCEndDate)));
        }

        if(filter != ''){
            filter = '?' + filter;
        }
        window.location.href = "${base}/zcgoods/listZc.html" + filter;
    }

</script>
<script>
    $(document).ready(function(){
        $('.pro_sort li input').iCheck({
            checkboxClass: 'icheckbox_square-red',
            radioClass: 'iradio_square-red',
            increaseArea: '20%'
        });
    });
</script>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>