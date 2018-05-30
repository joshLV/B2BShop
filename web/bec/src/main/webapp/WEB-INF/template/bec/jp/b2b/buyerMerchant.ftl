<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的供应商</title>
<meta name="description" content="我的供应商">
<meta name="Keywords" content="我的供应商">
<link href="${base}/static/bec/base/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/jp/css/header.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/jp/css/supplier_list.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/jp/css/footer.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
 <script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
    <style type="text/css">
        .sup_list_namets{border:1px solid #e8e8e8; background:#f8f8f8; line-height:44px; margin-top:15px; font-size:16px;}
    </style>
</head>
<body>
<#include "bec/jp/shortcut.ftl"/>
<#include "bec/jp/header.ftl"/>
<div class="supplier_main">
    <div class="supplier_left">
      <#include "bec/jp/member/menu.ftl"/>
    </div>
    <div class="supplier_right">
        <div class="sup_r_tit">
            <h5>我的供应商</h5>
        </div>
        <div class="sup_add">
            <h6>目前您拥有 <em>${merchatList?size}</em> 家供应商 近30天有交易的供应商 0 家</h6>
            <a href="#" onclick="show_addMerchant();">添加供应商</a>
        </div>
        <div id="show_merchant" class="hide">
            <input id="merchantName" type="text" class="sup_search_input" value="" placeholder="填写供应商名称">
            <button onclick="submit_merchantName();" class="sup_search_button">确定</button>
        </div>
        <div id="show_addM" class="hide">
        </div>
        <div id="old_search"  class="sup_search">
            <#--<select class="sup_dq sup_styled_select">-->

            <#--</select>-->
            <input type="text" id="search_mechantName" class="sup_search_input" value="" placeholder="请输入供应商名称">
            <button class="sup_search_button" onclick="search_mechantName();">搜索</button>
        </div>
        <div class="sup_list_names">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="480">供应商</td>
                    <td width="162">我的采购记录</td>
                    <td width="150">我的评分</td>
                    <td width="144">操作</td>
                </tr>
            </table>
        </div>
        <div class="sup_list_con">
          <#--地址循环开始-->
          <#list merchatList as merchant>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr class="sup_person">
                    <td colspan="4">${merchant.name}</td>
                </tr>
                <tr>
                    <td width="480">
                        <p><em>所在地区：</em>${merchant.areaPath}</p>
                        <p><em>经营模式：</em>--</p>
                        <p><em>主营产品：</em>--</p>
                        <p><em>联系方式：</em>${merchant.head}<a href="#"><img src="${base}/static/bec/project/jp/images/supplier_list/wangwang_icon_grey.png" class="sup_wangwang_icon"></a></p>
                    </td>
                    <td width="162">暂无记录</td>
                    <td width="150">暂无评价</td>
                    <td width="144" class="sup_operate">
                        <p><a href="#" class="sup_evaluate">邀请评价</a></p>
                        <p><a href="#" onclick="delete_merchant(${merchant.id});">删除</a></p>
                    </td>
                </tr>
            </table>
          </#list>
        </div>
        <#-- 分页条 -->
        <div class="m clearfix">
            <div class="pagin fr">
            <#if pager!false && pager.list?size &gt; 0>
                <#import "bec/jp/pager.ftl" as p>
                <@p.pager pager = pager baseUrl = "/buyerMerchant/list.html?search_mechantName=${search_mechantName}" />
            <#else>
                <div class="noRecord">你还没有供应商！</div>
            </#if>
            </div>
        </div>
        <div class="clr"></div>
    </div>
</div>
<#--弹出层开始-->
<#include "bec/jp/service.ftl"/>
<#include "bec/jp/footer.ftl"/>
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
        if(type=="update"){
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

    function show_addMerchant(){
        $("#show_merchant").addClass("sup_search");
        $("#show_merchant").show();
        $("#old_search").hide();
    }

    function submit_merchantName(){
        var merchantName = $("#merchantName").val();
        if(isEmpty(merchantName)){
            alert('供应商名称不能为空!');
            return;
        }

        if(merchantName.length >20){
            alert('供应商名称长度不超过10!');
            return;
        }

        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/findMerchant",
            data:{'merchantName':merchantName},
            datatype: 'json',
            error: function () {
                alert('err');
            },
            success: function(result) {
                $("#show_merchant").hide();
                $("#show_addM").addClass("sup_list_namets");
                $("#show_addM").show();
                $("#old_search").show();
                var jsonObj=eval(result.list);
                var html = "<span class='choose_gys'>请从以下列表选择要添加的供应商</span>";
                html += "<table border='0' cellpadding='0' cellspacing='0' class='sup_mycgs'>";
                       html+="<tr>";
                         html+="<td align='center' width='100'>序号</td>";
                         html+="<td width='500'>采购商名称</td>";
                         html+="<td width='100'>操作</td>";
                       html+="</tr>";


                $.each(jsonObj, function (i, item) {
                    html+="<tr>";
                      html+="<td align='center'>"+(i+1)+"</td>";
                      html+="<td>"+item.name+"</td>";
                      html+="<td><button class='sup_button' onclick='submit_addMer(\""+item.id+"\");'>确定</button></td>";
                    html+="</tr>";
                });
                $("#show_addM").html(html);
            }
        });
    }

    function submit_addMer(merchantId){
        if(isEmpty(merchantId)){
            alert('请选择供应商!');
            return;
        }
        $("#show_addM").hide();
        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/save",
            data:{'merchantId':merchantId},
            datatype: 'json',
            error: function () {
                alert('error');
            },
            success: function(result) {
                if("success"==result.status){
                    alert('添加成功!');
                    window.location="${base}/buyerMerchant/list";
                }else if("report"==result.status){
                    alert(result.message);
                }else{
                    alert('error')
                }
            }
        });

    }

    function search_mechantName(){
        var search_mechantName = $("#search_mechantName").val();
//        if(isEmpty(search_mechantName)){
//            alert('供应商名称不能为空!');
//            return;
//        }

        if(search_mechantName.length >20){
            alert('供应商名称长度不超过10!');
            return;
        }
        window.location="${base}/buyerMerchant/list?search_mechantName="+search_mechantName;
    }

    function delete_merchant(merchantId){
        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/delete",
            data:{'merchantId':merchantId},
            datatype: 'json',
            error: function () {
                alert('error');
            },
            success: function(result) {
                if("success"==result.status){
                    alert('删除成功!');
                    window.location="${base}/buyerMerchant/list";
                }else{
                    alert('error')
                }
            }
        });
    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }
</script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/easybuy.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
</body>
</html>