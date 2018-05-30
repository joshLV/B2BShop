<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的供应商</title>
<meta name="description" content="我的供应商">
<meta name="Keywords" content="我的供应商">
<link href="${base}/static/bec/base/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/xd/css/header.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/xd/css/buyer_merchant_popup.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/bec/project/xd/css/footer.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
 <script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"orderlist"
};
</script>
    <style type="text/css">
        .sup_list_namets{border:1px solid #e8e8e8; background:#f8f8f8; line-height:44px; margin-top:15px; font-size:16px; float: left;}
        .btn-err:link, .btn-err:visited, .btn-err:hover, .btn-success:link, .btn-success:visited, .btn-success:hover {color: #333;}
        .btn-h2 {
            line-height: 28px;
            font-weight: bold;
            font-size: 14px;
            display: inline-block;
            text-decoration: none;
            padding-left: 11px;
            padding-right: 11px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            vertical-align: middle;
            border: 1px solid;
            overflow: hidden;
            cursor: pointer;
        }

        .btn-success {
            background: #0171bb;
           /* border-color: #ffffff;*/
            color: #ffffff !important;
            border-radius: 3px;
            border: none;
            height: 30px;
            /*background-image: -webkit-gradient(linear,from(#F5FBEF),to(#EBF6E2));
            background-image: -moz-linear-gradient(top,#F5FBEF,#EBF6E2);
            -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F5FBEF',endColorstr='#EBF6E2');
            background-image: -o-linear-gradient(top,#F5FBEF,#F3F2F2);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F5FBEF',endColorstr='#EBF6E2');*/
        }

        .btn-err {
            background: #bebebe;
            /*border-color: #DDDDDD;*/
            color: #ffffff !important;
            border: none;
            border-radius: 3px;
            height: 30px;
            /*background-image: -webkit-gradient(linear,from(#F7F7F7),to(#F3F2F2));
            background-image: -moz-linear-gradient(top,#F7F7F7,#F3F2F2);
            -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F7F7F7',endColorstr='#F3F2F2');
            background-image: -o-linear-gradient(top,#F7F7F7,#F3F2F2);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F7F7F7',endColorstr='#F3F2F2');*/
        }
    </style>

</head>
<body>
<div class="supplier_main">
    <input id="merchantIds" name="merchantIds" type="hidden" value="${merchantIds}"/>
    <input id="merchantNames" name="merchantNames" type="hidden"  value="${merchantNames}"/>
            <div style="width: 100%;" class="add_suppliers">
                <span onclick="setTab('myMerchant','search')"><a href="javascript:void(0)" id="myMerchant_a" style="background: #0171bb;">我的供应商</a></span>
                <span onclick="setTab('search','myMerchant')"><a href="javascript:void(0)"  id="search_a" >添加供应商</a></span>
            </div>
            <div id="menu_con">
                <div id="search_div" style="float: left; display: block;">
                    <div id="show_merchant" class="supplier_search">
                        <input id="merchantName" type="text" class="supp_search_input" value="${search_mechantName}" placeholder="填写供应商名称">
                        <button onclick="submit_merchantName();" class="sup_searchs_button">搜索</button>
                    </div>
                    <div id="show_addM">
                    </div>

                </div>
                <div id="myMerchant_div"  style="padding-top: 70px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr class="addsup_person">
                            <td width="30" class="sup_operate">
                                <input type="checkbox" name="merchant_cb_all" id="merchant_cb_all" value="" onclick="checkAllMerchant()">
                            </td>
                            <td style="width: 300px;font-weight: bold;" class="sup_info">供应商名称</td>
                            <td style="width: 300px;font-weight: bold;" class="sup_info">所在地区</td>
                        </tr>
                    </table>
                    <div class="sup_lists_con">
                    <#--地址循环开始-->

                    <#list merchatList as merchant>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" id="merchantTable">
                            <tr class="addsup_person">
                                <td width="30" class="sup_operate">
                                    <input type="checkbox" name="merchant_cb" value="${merchant.id}" mname="${merchant.name}"
                                           <#if mids??>
                                            <#list mids as mid>
                                                <#if mid == merchant.id> checked="checked" </#if>
                                            </#list>
                                           </#if>
                                             onclick="isSelect();return true;">
                                </td>
                                <td style="width: 300px;" class="sup_info">${merchant.name}</td>
                                <td style="width: 300px;" class="sup_info">${merchant.areaPath}</td>
                            </tr>
                        </table>
                    </#list>
                    </div>
                    <div class="btns" style="height: 100px;">
                        <span style="color: red;font-weight: bold;" id="tip_span"></span>
                        <a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认</a>&nbsp;&nbsp;&nbsp;
                        <a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">关闭</a>
                    </div>
                </div>
</div>

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

        $("#cancelsuccess").click(function (){
            selectMerchant();

            if($("#merchantIds").val() == ''){
                $("#tip_span").html("您还没有选择");
            }else{
                parent.selectMerchants($("#merchantIds").val(), $("#merchantNames").val());
            }
        });

        $("#cancelerror").click(function (){
            parent.selectMerchantsError();
        });

        $("#myMerchant_div").show();
        $("#search_div").hide();



        var $allcheck1 = $("#merchant_cb_all");// 全选复选框
        var $mechantIds = $("#merchantTable input[name='merchant_cb']");// ID复选框
        // 全选
        $allcheck1.click( function() {
            var $this = $(this);
            $mechantIds.prop("checked", $this.prop("checked"));
        });
    });


    function submit_merchantName(){
        var merchantName = $("#merchantName").val();
        if(isEmpty(merchantName)){
            alert('供应商名称不能为空!');
            return;
        }

        if(merchantName.length >20){
            alert('供应商名称长度不超过20!');
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
                $("#show_addM").addClass("sup_list_namets");
                $("#show_addM").show();
                var jsonObj=eval(result.list);
                var html = "<span class='show_add_sup'>请从以下列表选择要添加的供应商</span>";
                html += "<table border='0' cellpadding='0' cellspacing='0' class='show_sup_table'>";
                       html+="<tr>";
                         html+="<td width='50'>序号</td>";
                         html+="<td width='500'>采购商名称</td>";
                         html+="<td width='100'>操作</td>";
                       html+="</tr>";


                var flag = true;
                $.each(jsonObj, function (i, item) {
                    if(flag){
                        flag = false;
                    }
                    html+="<tr>";
                      html+="<td align='center'>"+(i+1)+"</td>";
                      html+="<td>"+item.name+"</td>";
                      html+="<td><button class='confirm_button' onclick='submit_addMer(\""+item.id+"\");'>添加</button></td>";
                    html+="</tr>";
                });

                if( flag ){
                    html+="<tr>";
                    html+="<td colspan='3'><span style='color: red;font-weight: bold;'>无数据！</span></td>";
                    html+="</tr>";
                }

                html+="</table>";
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
        selectMerchant();
        var merchantIds = $("#merchantIds").val();
        var merchantNames = $("#merchantNames").val();
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
                    window.location="${base}/enquiry/getBuyersPopup?merchantIds="+ merchantIds +"&merchantNames="+encodeURI(encodeURI(merchantNames)) +"&searchName="+encodeURI(encodeURI( $("#merchantName").val() ));
                }else if("report"==result.status){
                    alert(result.message);
                }else{
                    alert('error')
                }
            }
        });

    }


    function selectMerchant(){
        var merchantIds = "";
        var merchantNames = "";
        var i = 0;
        $("input[name='merchant_cb']:checked").each(function(){
            if( i > 0 ){
                merchantIds += ",";
                merchantNames += ",";
            }
            merchantIds += $(this).val();
            merchantNames += $(this).attr("mname");
            i++;
        });
        $("#merchantIds").val(merchantIds);
        $("#merchantNames").val(merchantNames);
    }

    function isSelect(){
        selectMerchant();
        if($("#merchantIds").val()==''){
            $("#tip_span").html("您还没有选择");
        }else{
            $("#tip_span").html("");
        }
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

    function setTab(s,h){
        $("#"+s +"_div").show();
        $("#"+s +"_a").css("background","#0171bb");
        $("#"+h +"_div").hide();
        $("#"+h +"_a").css("background","#a9a9a9");
    }

</script>

</body>
</html>