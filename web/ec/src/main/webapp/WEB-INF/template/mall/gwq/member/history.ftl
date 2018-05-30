<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>

<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 14px;font-family: "microsoft yahei";}
    .main{border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;}
    .left {float: left;width: 195px;/*margin-right: 10px;*/margin-bottom: -9999999px; padding-bottom: 9999999px; background: #ffffff; border-right: 1px solid #E8E8E8;}
    .right {float: right;width: 1024px; margin-bottom: -9999999px; padding-bottom: 9999999px; background: #ffffff; }

    .widepage .right {width:1014px;}

    .right a:link, .right a:visited {color: #005ea7;}
    .right a:link, .right a:visited {color: #005ea7;}
    .ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

    #right .mt {
        position: relative;
        background: #f9f9f9;
        height: 41px;
        padding: 0 12px 0 6px;
    }
    #right .mt .icon-left {
        position: absolute;
        top: 0;
        left: 0;
        /*background: url(${base}/static/mall/img/short1.jpg) -100px -82px no-repeat;*/
        height: 41px;
        width: 4px;
    }
    #right .mt h2 {
        font-size: 12px;
        color: #333333;
        float: left;
        width: 104px;
        text-align: center;
        height: 32px;
        line-height: 32px;
        text-align: center;
        margin: 4px 10px 0 0;
    }
    #right .mt .extra {
        float: right;
        overflow: hidden;
    }
    #right .mt .extra .empty {
        color: #323333;
        background:#fcfcfc;
        border: 1px solid #dcdcdc;
        border-radius: 3px;
        width: 120px;
        text-align: center;
        height: 25px;
        line-height: 25px;
        float: left;
        margin: 8px 10px 0 0;
    }
    #right .mt .icon-right {
        position: absolute;
        top: 0;
        right: 0;
        /*background: url(${base}/static/mall/img/short1.jpg) -110px -82px no-repeat;*/
        height: 41px;
        width: 10px;
    }
    #right .mc .item {
        /*border-bottom: 4px solid #efefef;*/
        overflow: hidden;
        zoom: 1;
        padding-bottom: 20px;
    }
    #mc .dity {
        float: left;
        /*border-left: 4px solid #efefef;*/
        overflow: hidden;
        /*  border-right: 4px solid #efefef;*/
    }
    #mc .mod {
        border-bottom: 1px dashed #c7c7c7;
        zoom: 1;
        overflow: hidden;
        padding-left: 10px;
        padding-top: 10px;
        padding-bottom: 10px;
        margin-left: 12px;
    }
    #mc .p-img {
        float: left;
        width: 130px;
        height: 130px;
        padding: 5px 10px;
        border: 1px solid #E8E8E8;
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right: 10px;
    }
    #mc .p-img a{
        background: url(${base}/static/mall/gwq/img/default_img.jpg) no-repeat center;
        background-size: 100%;
        display: block;
    }
    #mc .i-it {
        width: 982px;
        position: relative;
        margin-top: 12px;
    }
    #mc h3 {
        font-size: 14px;
        line-height: 30px;
        height: 30px;
        overflow: hidden;
        width: 500px;
    }
    #mc .p-price {
        color: #999999;
        margin-top: 5px;
    }
    #mc strong {
        font-weight: normal;
        color: #999999;
        font-family: "宋体";
    }
    #mc font {
        color: #cc0000;
        font-weight: bold;
        font-size: 14px;
        padding-right: 20px;
    }
    #mc del {
        text-decoration: line-through;
    }
    #mc .buton {
        position: absolute;
        top: 10px;
        right: 20px;
        width: 94px;
    }
    #mc .buton .buy {
        background: #db0000;
        border-radius: 3px;
        width:87px;
        height: 25px;
        line-height: 25px;
        display: block;
        padding-left: 7px;
        color: #FFF;
    }
    #mc .pay {
        display: none;
        margin-bottom: 8px;
        cursor: pointer;
        background: url(${base}/static/mall/img/short1.jpg) 0 -137px no-repeat;
        width: 77px;
        padding-left: 24px;
        height: 25px;
        line-height: 25px;
        display: block;
        margin-top: 10px;
        border: none;
    }
    .delet{width: 94px; text-align: center; display: block; height: 24px; line-height: 24px;}
</style>

<style>
    .ftx-04 {color: #ff6600;}

    /**pagin**/
    .pagin a,.pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
    .pagin .text,.pagin .current {border: 0;padding: 4px 11px;}
    .pagin a:link,.pagin a:visited {color: #005aa0;}
    .pagin a:hover,.pagin a:active {background: #005aa0;color: #fff;text-decoration: none;}
    .pagin .current,.pagin .current:link,.pagin .current:visited {color: #f60;font-weight: 700;}
    .pagin b {display: block;position: absolute;top: 9px;width: 5px;height: 9px;background-image: url(${base}/static/mall/img/bg5.gif);background-repeat: no-repeat;overflow: hidden;}
    .pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
    .pagin .prev-disabled,.pagin .next-disabled {color: #ccc;cursor: default;}
    .pagin .prev,.pagin .prev-disabled {padding-left: 12px;}
    .pagin .prev b {left: 3px;background-position: -68px -608px;}
    .pagin .prev-disabled b {left: 3px;background-position: -80px -608px;}
    .pagin .next,.pagin .next-disabled {padding-right: 12px;}
    .pagin .next b {right: 3px;background-position: -62px -608px;}
    .pagin .next-disabled b {right: 3px;background-position: -74px -608px;}
    .pagin-m a,.pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
    .pagin-m b {top: 5px;}
    .pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled {padding-top: 3px;height: 14px;line-height: 14px;*line-height: 16px;}

    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  Start*/
    .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
    .popGeneral_address .aptab_center_address .newaddress{margin-top: 20px; margin-left: 20px;}
    .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
    .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
    .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto;  line-height:34px; margin: 10px 5px 0 85px; text-align: center; background: #db0000; border: none !important; color: #FFFFFF; border-radius: 3px;}

    .check_error{color: #DB0000; margin-left: 10px;}
    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  End*/
</style>

	<#include "mall/gwq/header_new.ftl"/>


<div class="left">
	<#import "mall/gwq/member/menu.ftl" as memu>
		<@memu.menu id="llls"/>
</div><!--left end-->
<#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  Start-->
<input id="crossBorderId" type="hidden" value="" />
<#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  End-->
<div class="right" id="right">
    <div class="breadcrumb">
        <strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;浏览历史<span></span></span>
    </div><!--breadcrumb end-->
    <div class="mt">
        <div class="icon-left"></div>
        <h2>浏览历史</h2>
        <div class="extra">
            <a onclick="javascript:deleteAll();" href="javascript:void(0);" class="empty">清空浏览历史</a></div>
        <div class="icon-right"></div>
    </div>
    <div class="mc" id="mc">
        <div class="item">
            <ul id="recenthistory">
				<#if hisList?? && hisList?size &gt; 0 >
					<#list hisList as his>
                        <li id="${his.id}" order="0">
                            <div class="dity">
                                <div class="mod">
                                    <div class="p-img">
                                        <a href="${base}/item/${his.goodsId}.html" target="_blank"><img width="130" height="130" src="${his.image}@130w_130h.png" class="err-product"></a>
                                    </div>
                                    <div class="i-it">
                                        <h3><a href="${base}/item/${his.goodsId}.html" target="_blank" >${his.name}</a></h3>
                                        <div class="p-price">
                                            <strong>商城价：</strong><font>￥${his.price}</font>
                                            <strong>市场价：</strong>
                                            <del>￥${his.marketPrice}</del>
                                        </div>
                                        <div class="buton">
                                        <#--Desc:判断是否为跨境商品 his.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  Start-->
                                            <#if his.crossBorder == '1'>
                                                <a href="javascript:void(0);" onclick="addCart('${his.goodsId}','1','1');" class="buy" ><img src="${base}/static/mall/img/gwc_icon.png"> 加入购物车</a>
                                            <#else>
                                                <a href="javascript:void(0);" onclick="addCart('${his.goodsId}','1','0');" class="buy" ><img src="${base}/static/mall/img/gwc_icon.png"> 加入购物车</a>
                                            </#if>
                                        <#--Desc:判断是否为跨境商品 his.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  End-->

										<#--<a href="javascript:void(0);" onclick="addCart('${his.goodsId}');" class="buy" target="_blank" >加入购物车</a>-->
										<#--<a onclick="javascript:deleteOne('${his.id}');" href="javascript:void(0);" class="delet" >清除该浏览历史</a>-->
										<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 Start -->
                                            <#--<a href="javascript:void(0);" onclick="addCart('${his.goodsId}');" class="buy" ><img src="${base}/static/mall/img/gwc_icon.png"> 加入购物车</a>-->
                                            <a onclick="deleteOne('${his.id}');" href="javascript:void(0);" class="delet" >清除该浏览历史</a>
										<#--去掉target="_blank"会引起出现两个窗口 以及javascript:不需要 Auth:zhangqiang Time:2015-09-22 14:22:35 End -->
                                        </div>
                                    </div>
                                    <span class="clr"></span>
                                </div>
                            </div>
                        </li>
					</#list>

				<#else>
                    <li>
                        <div class="nocont-box nocont-order">
                            <b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
                        </div>
                    </li>
				</#if>

            </ul>
        </div>


        <div class="mymoney_pages f-cb" >
            <div class="pagin fr" style="margin-right: 10px; margin-bottom: 10px;">
				<#if pager!false && pager.list?size &gt; 0>
					<#import "mall/gwq/pager.ftl" as p>
					<@p.pager pager = pager baseUrl = "/member/history/list.html" />
				<#else>
                    <div class="noRecord">你还没有订单！</div>
				</#if>
            </div>
        </div>

    </div>
    <div class="clr"></div>
</div><!--right end-->
<#--Desc:弹出DIV设置身份证号 Auth:zhangqiang Time:2016-01-30 Start-->
<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <div class="pop_win aptab_center_address">

        <ul class="newaddress">
            <li>
                <label> <strong style="color: red;">*</strong> 身份证号： </label>
                <input type="text" id="idcode"  name="idcode" value="" class="inputxt" style="width: 180px;">
                <span id="checkIdcodeId" class="check_error hide"></span>
            </li>

            <li>
                <input type="submit" value="保 存" onclick="save_idcode()"  class="btn_save  bule_btn" />
            </li>
        </ul>
    </div>
</div>
<#--Desc:弹出DIV设置身份证号 Auth:zhangqiang Time:2016-01-30 End-->

<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

    });
    function deleteAll(){
        $.ajax({
            type: "get",
            url: "${base}/member/history/ajaxDeleteAllByMemberId",
            success: function(data) {
                if(data.status=='success'){
                    //刷新本页面
                    location.replace("${base}/member/history/list");
                }
            }
        });
    }
    function deleteOne(id){
        $.ajax({
            type: "get",
            url: "${base}/member/history/ajaxDeleteHisId",
            data: "id="+id,
            success: function(data) {
                if(data.status=='success'){
                    $("#"+id).hide();
                }
            }
        });
    }
    /**
     * Desc:加入购物车操作
     * Auth:zhangqiang
     * Time:2016-01-30
     * Param:
     *       goodsId        商品ID
     *       cnt            加入购物车的商品数量
     *       ifCrossBorder  是否为跨境商品标识  1:是跨境商品  0:不是跨境商品
     */
    function addCart(goodsId, cnt,ifCrossBorder) {
        if(ifCrossBorder == '1'){//是跨境商品时
            var message = '';
            //是跨境商品 获取弹出提示信息
            $.ajax({
                type: 'post',
                async: false,
                url: '${base}/goods/ajaxGetSystemCrossMsg',
                success: function(data) {
                    if( data.status == 'success' ){
                        message = data.msg;
                    }else{
                    }
                }
            });
            //弹出提示信息
            layer.confirm(message, {icon: 7, title:'温馨提示'}, function(index){
                if(ifMemberIDcode()) {//判断此会员是否设置了身份证号
                    //设置了后执行加入购物车操作
                    window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
                }else{//未设置身份证时
                    //将此商品的ID存储下来，并弹出设置身份证号的DIV层
                    $("#crossBorderId").val(goodsId);
                    layer.open({
                        type: 1,
                        title:'设置会员本人身份证号',
                        area:["500px","210px"],
                        scrollbar:false,
                        content: $('#popupdiv') //这里content是一个DOM
                    });
                }
                layer.close(index);
            });
        }else{//不是跨境商品直接执行加入购物车操作
            window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
        }

    }
    /**
     * Desc:判断会员是否设置了身份证号
     * Auth:zhangqiang
     * Time:2016-01-30
     * Return:
     *        true  设置了身份证号
     *        false 没有设置
     */
    function ifMemberIDcode(){
        var flags = false;
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/member/getMemberIDcode',
            success: function(data) {
                if( data.status == 'success' ){
                    flags = true;
                }else if(data.status == 'error'){
                    flags = false;
                }else{//没有登录时页面跳到登录页
                    location.href = "${base}/member/login";
                    return;
                }
            }
        });
        return flags;
    }
    /**
     * Desc:跳转到登录页面
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function forward(){
        location.href = "${base}/member/login";
    }
    /**
     * Desc:保存身份证号
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function save_idcode(){
        //获取到身份证号
        var idcode = $("#idcode").val();
        //判断身份证号是否存在
        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
            $("#checkIdcodeId").text('身份证号不能为空!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }
        //判断身份证号长度是否符合要求 旧身份证号15位纯数字 二代身份证号18位 最后一位可能是字母X
        if(idcode.length > 18 || idcode.length < 15){
            $("#checkIdcodeId").text('身份证号长度范围15~18位!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }
        //正则表达式判断身份证号格式是否正确
        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {
            $("#checkIdcodeId").text('身份证号格式错误!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        $("#checkIdcodeId").addClass("hide");
        //验证身份证号是否已经存在
        $.ajax({
            type: "post",
            async: false,
            url: base+"member/username/check",
            data:{'userName':idcode,'property':'iDCode'},
            datatype: 'json',
            error: function () {

            },
            success: function(result) {
                if(result){
                    $("#checkIdcodeId").addClass("hide");
                    //保存身份证号
                    $.ajax({
                        type: "post",
                        async: false,
                        url: base+"member/saveMemberIDcode",
                        data:{'idcode':idcode},
                        datatype: 'json',
                        error: function () {

                        },
                        success: function(result) {
                            if(result.status == 'success'){
                                layer.closeAll();
                                window.location.href = "${base}/cart/add?gid=" + $("#crossBorderId").val() + "&cnt=" +1 + "&backurl=" + window.location.href
                            }else{
                                layer.alert('设置失败',{icon:2});
                            }
                        }
                    });
                }else{
                    $("#checkIdcodeId").text('身份证号已存在,请重新输入!');
                    $("#checkIdcodeId").removeClass('hide');
                }
            }
        });
    }
</script>
	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>