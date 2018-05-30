<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>收货地址</title>
<meta name="description" content="收货地址">
<meta name="Keywords" content="收货地址">
<link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<link href="${base}/static/css/addressDialog.css" rel="stylesheet" type="text/css" media="all"/>
 <script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 195px;margin-right: 10px;}
.right {float: right;width: 830px;}
.widepage .right {width:1000px;}
.o-m{ border: 1px solid #cccccc;}
.o-m .o-mb {margin:10px;}
h2, h3 {font-size: 14px;}
a.e-btn:link, a.e-btn:visited, a.e-btn:hover, a.e-btn:active {color: #333;text-decoration: none;}
a.add-btn {display: inline-block;vertical-align: middle;font-weight: bold;padding: 0 14px;height: 28px;line-height: 28px;font-size: 14px;margin: 0 10px 0 0;}
.yellow-btn {-moz-border-radius: 3px 3px 3px 3px;-webkit-border-radius: 3px 3px 3px 3px;border-radius: 3px 3px 3px 3px;background-color: #f5fbef;background-image: -moz-linear-gradient(top,#f5fbef,#eaf6e2);background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0,#f5fbef),color-stop(1,#eaf6e2));filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5fbef,endColorstr=#eaf6e2,GradientType='0');-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5fbef,endColorstr=#eaf6e2);background-image: linear-gradient(to top,#f5fbef 0,#eaf6e2 100%);border: 1px solid #bfd6af;}
.o-m .o-mb h3 span {font-size: 12px;font-weight: normal;line-height: 30px;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
.o-m .o-mb h3 span {font-size: 12px;font-weight: normal;line-height: 30px;}
.ftx-04 {color: #ff6600;}
.o-m .m .mt {padding-left: 10px;line-height: 35px;height: 35px;position: relative;overflow: visible;}
.m4 .mt {border-bottom: 1px solid #e6e6e6;height: 34px;line-height: 34px;padding-left: 16px; border-top: 1px solid #e6e6e6; background: #fbfbfb;}
.m4 .mt h3 {float: left;color: #666666;}
.o-m .m .mt .extra {float: right;margin: 0 10px 0 0;}
.main .mt .extra {float: right;}
.o-m .m .mt .extra a {color: #005ea7;margin: 0 0 0 20px;}
.o-m .m .mt {line-height: 35px;}
.o-m .m .mt h3 .ftx-03 {font-size: 12px;margin-left: 5px;font-weight: normal;}
.o-m .m .mc {padding: 10px;line-height: 22px;width: 808px;}
.o-m .m .mc .new-items {position: relative;display: table;}
.o-m .m .mc {line-height: 22px;}
.o-m .m .mc .item-lcol {width: 450px;border-right: 1px dashed #e5e5e5;}
.o-m .m .mc .item span {float: left;width: 70px;color: #999;text-align: right;}
.o-m .m .mc .item-lcol .fl {width: 360px;}
.fl {float: left;}
</style>


<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/jd/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
        <div id="addressList" class="o-m">
            <div class="o-mb">
                <h3>
                    <a href="javascript:;" class="e-btn add-btn yellow-btn" onclick="alertAddAddressDiag('add')">新增收货地址</a>
                    <span class="ftx-03">您已创建<span class="ftx-04" id="addressNum_top">${receiverList?size} </span>个收货地址，最多可创建<span class="ftx-04">6</span>个</span>
                </h3>
            </div>
            <#--地址循环开始-->
            <#list receiverList as receiver>
            <div class="m m4 " id="addresssDiv-${receiver.id}">
                <div class="mt">
                    <h3>
                        地址信息<span class="ftx-03"></span>
                    </h3>
                    <div class="extra"><a href="javascript:;" id="setDefaultHref-137597826" class="hide" onclick="makeAddressDefault(&#39;137597826&#39;);">设为默认</a><a href="javascript:;" onclick="alertUpdateAddressDiag('${receiver.id}');">修改地址信息</a><a href="javascript:;" class=" del" onclick="alertDelAddressDiag('${receiver.id}')">删除</a></div>
                </div>
                <div class="mc">
                    <div class="items new-items">
                        <div class="item-lcol">
                            <div class="item">
                                <span class="label">收货人：</span>
                                <div class="fl">
                                ${receiver.name}
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="item">
                                <span class="label">地址：</span>
                                <div class="fl">
                                ${receiver.address}
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="item">
                                <span class="label">手机：</span>
                                <div class="fl">
                                ${receiver.mobile}
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="item">
                                <span class="label">固定电话：</span>
                                <div class="fl">
                                ${receiver.phone}
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="item">
                                <span class="label">邮箱：</span>
                                <div class="fl">
                                ${receiver.email}
                                </div>
                                <div class="clr"></div>
                            </div>
                            <div class="item">
                                <span class="label">邮政编码：</span>
                                <div class="fl">
                                ${receiver.zipCode}
                                </div>
                                <div class="clr"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </#list>
        </div>
	</div><!--right end-->
</div>
<#--弹出层开始-->
<div id="LoginBox">
    <div class="thickdiv" id=""></div>
    <div class="thickbox" id="" style="left: 246.5px; top: 276px; width: 762px; height: 543px;">
        <div class="thickwrap" style="width: 760px;">
            <div class="thicktitle" id="" style="width:740"><span id="oper">添加收货地址</span><a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a></div>
            <div class="thickcon" id="" style="width: 740px; height: 490px; padding-left: 10px; padding-right: 10px;">
                <div id="addressDiagDiv">
                <input type="hidden" id="receiverId" value="${receiver.id}">

                    <title id="title">收货地址</title>


                    <div class="m" id="edit-cont">
                        <div class="mc">
                            <div class="form">
                                <div class="item" id="name_div">
                                    <span class="label"><em>*</em>收货人：</span>

                                    <div class="fl"><input id="consigneeName" type="text" name="userName" class="text"
                                                           onblur="checkConsigneeName()"><span id="consigneeNameNote"
                                                                                               class="error-msg hide"></span>
                                    </div>
                                    <div class="clr"></div>
                                </div>
                                <div class="item" id="area_div">
                                    <span class="label"><em>*</em>所在地区：</span>

                                    <div class="field">
											<span id="span_area">
												<input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/>
											</span>
                                        <span class="form-tip"><span class="status error" id="area_div_error"></span></span>
                                    </div>

                                    <div class="clr"></div>
                                </div>
                                <div class="item" id="address_div">
                                    <span class="label"><em>*</em>详细地址：</span>

                                    <div class="fl"><span style="float: left;margin-right: 5px;line-height:32px;"
                                                          id="areaName"></span><input id="consigneeAddress" type="text"
                                                                                      class="text text1" style="width: 469px"
                                                                                      onblur="checkConsigneeAddress()">
                                    </div>
                                    <span class="error-msg" id="consigneeAddressNote"></span>

                                    <div class="clr"></div>
                                </div>
                                <div class="item">
                                    <div class="fl" id="call_div">
                                        <span class="label"><em>*</em>手机号码：</span>
                                        <input id="consigneeMobile" type="text" maxlength="11" class="text"
                                               onblur="checkMobile()">
                                    </div>
                                    <div class="fl"><span class="extra-span ftx-03">或</span></div>
                                    <div class="fl">
                                        <span class="label">固定电话：</span>
                                        <input id="consigneePhone" type="text" class="text" onblur="checkMobile()">
                                        <span class="error-msg hide" id="consigneeMobileNote"></span>
                                        <span class="clr"></span>
                                    </div>
                                    <div class="clr"></div>
                                </div>
                                <div class="item" id="email_div">
                                    <span class="label">邮箱：</span>

                                    <div class="fl"><input id="consigneeEmail" type="text" class="text text1"
                                                           maxlength="50" onblur="checkEmail()"><span
                                            class="error-msg hide" id="emailNote"></span></div>
                                    <div class="clr"></div>
                                </div>
                                <div class="item" id="zipCode_div">
                                    <span class="label">邮政编码：</span>

                                    <div class="fl"><input id="consigneeAlias" type="text" class="text"
                                                           onblur="checkConsigneeAlias()"><span class="ftx-03"></span><span
                                            class="error-msg hide" id="consigneeAliasNote"></span></div>
                                    <div class="clr"></div>
                                </div>
                                <div class="btns"><a href="#" onclick="addAddress();"
                                                     class="e-btn gray-btn save-btn">保存收货地址</a></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <a href="#" class="thickclose" id="">×</a></div>
    </div>
</div>
<#--弹出层开始-->
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script type="text/javascript">
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function () {
    //关闭
    $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
        $("#LoginBox").fadeOut("fast");
        $("#mask").css({ display: 'none' });
    });
	//左侧菜单折叠操作
	$("#leftMenu dt").click(function(){
		$parent=$(this).parent();
		if($parent.hasClass("close")){
			$parent.removeClass("close");
		}else{
			$parent.addClass("close");
		}
	});
});
    function alertAddAddressDiag(type){
        if(type="update"){
            $("#oper").text("修改收货地址");
        }else{
            $("#oper").text("添加收货地址");
        }
        // 地区选择菜单
        $(".lSelect").remove();//移除之前生成的
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        var num =$("#addressNum_top").text();
        if(num>5){
            alert("抱歉，地址信息最多可创建6条。");
            return;
        }
        //弹出地址框
        $("#type").attr("value","uptate");
        $("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").fadeIn("slow");
        $("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        $("#LoginBox").fadeIn("slow");
    }
</script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/easybuy.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
</body>
</html>