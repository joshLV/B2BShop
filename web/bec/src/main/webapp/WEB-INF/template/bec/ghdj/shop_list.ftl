<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top.ftl"/>
    <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghdj/css/list.css">

<!--main-->
<div class="z_main">
    <div class="list_search f-cb">
        <div class="f-fl">
                <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                <span style="width:85px;">供应商搜索：</span>
                <input type="text" class="inp_search" value="${shop.name}" placeholder="供应商名称/简称" name="sn" id="sn">
                <input type="button" name="" value="搜&nbsp;索" class="inp_btn" onclick="allS($('#sn').val());">
        </div>
        <div class="f-fr"> 共找到<em><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个供应商 </div>
    </div>
    <div class="pro_list f-cb">
        <ul>
        <#if (pager.list?size > 0)>
            <#list pager.list as s>
                <li <#if (s_index + 1) % 2 == 0>class="lase"</#if>>
                    <div class="gys_info">
                        <h2><a href="javascript:void(0)" onclick="goToAllGoods('${s.id}');" class="a_tit" >${s.name}</a>
                            <i>
                            <#if s.qqKeFu??>
                                <#list s.qqKeFuList as qq>
                                    <#if qq_index != 0> <#break ></#if>
                                    <#if qq_index == 0>
                                        <a target=blank href=http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes>
                                            <img border="0" SRC=http://wpa.qq.com/pa?p=2:${qq}:8" alt="点击这里给我发消息">
                                        </a>
                                    </#if>
                                </#list>
                            </#if>
                            </i>
                        </h2>
                        <p><span>店铺电话：</span>${s.telphone}</p>
                        <p><span>联&nbsp;系&nbsp;&nbsp;人：</span>${s.head}</p>
                        <p><span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</span>${s.mobile}</p>
                        <p><span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span>${s.areaPath}${s.address}</p>
                    </div>
                    <div class="gys_pic f-fr"> <a href="javascript:goToAllGoods('${s.id}');"><img src="<#if s.pic??>${s.pic}@152w_146h.png</#if>" title="${s.name}" alt="${s.name}"></a> </div>
                    <#if s.hasRebate == 'yes'><div class="fanli_2"></div></#if>
                </li>
            </#list>
        </#if>
        </ul>
        <div class="page">
            <#if (pager.list?size > 0)>
                <div class="pagin fr">
                    <#import "bec/ghdj/pager.ftl" as p>
                    <#if keyword??>
                            <@p.pager pager = pager baseUrl = "/shopExtend/list.html?name=${s_name}&s=top" />
                    <#else>
                            <@p.pager pager = pager baseUrl = "/shopExtend/list.html?name=${s_name}" />
                    </#if>
                </div>
            <#else>
                <div class="pagin">
                    <div class="searchTip" style="min-height: 390px; padding-top: 12px;">
                        <div class="searchTipContent">
                            <h2>尚未发布任何信息!</h2>
                            <h3>建议您：</h3>
                            <ol id="searchTipSugg">
                                <li>
                                    看看输入的文字是否有误
                                </li>
                                <li>
                                    调整关键词
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div><!-- main end -->
<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>

<script type="text/javascript">
    var priceHide = '${priceHide}';
    var _mid = '';
    $(function () {
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
    });

    function allS(name) {
        //组装查询条件
        var filter = '';
        if($.trim(name) != ''){
            filter += "name=" + encodeURI(encodeURI($.trim(name)));
        }
        if(filter != ''){
            filter = '?' + filter;
        }
        window.location.href = "${base}/shopExtend/list.html" + filter;
    }

    function goToAllGoods(mid){
        _mid = mid;
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
            return;
        }
        window.location.href = '${base}/allG.html?mid='+ mid +'&vt=list';
    }

    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    function goToOrder(){
        goToAllGoods(_mid);
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        if(priceHide != 'hide'){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        priceHide = flag ? "" : "hide";
    }
    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }
</script>

    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>