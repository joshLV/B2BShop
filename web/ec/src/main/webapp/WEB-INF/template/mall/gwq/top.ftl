<#escape x as x?html>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>${articles.title!}_<@spring.message "project_name"/>
        <#---<@spring.message "project_description"/>-->
    </title>
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="${articles.seoKeywords!},<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>" />
    <meta name="description" content="${articles.seoDescription!},<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>" />
    <link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE;IE=9;chrome=1" />
    <link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/reset.css?v=<@spring.message 'version'/>">
    <link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/function.css?v=<@spring.message 'version'/>">
    <link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/common.css?v=<@spring.message 'version'/>">
    <link rel="stylesheet" type="text/css" href="${base}/static/mall/gwq/css/index.css?v=<@spring.message 'version'/>">
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/html5shiv.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${base}/static/mall/gwq/js/jquery.min.js"></script>

    <!--判断是PC端还是移动端--->
    <script type="text/javascript" src="${base}/static/mall/gwq/js/uaredirect.js"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/Validform_v5.3.2.js"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/layer/layer.js"></script>
    <!--防止js报错影响后续js执行 start-->
    <script type="text/javascript">
//        ;window.onerror=function(){return!0};
    </script>
    <!--end-->
    <script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/common.js?v=<@spring.message 'version'/>"></script>
    <script type="text/javascript" src="${base}/static/mall/gwq/js/index.js?v=<@spring.message 'version'/>"></script>
    <script type="text/javascript" src="${base}/static/mall/js/base.js?v=<@spring.message 'version'/>" ></script>
    <script type="text/javascript" src="${base}/static/js/jquery.cookies.js"></script>

    <script type="text/javascript">
        $(function () {
            var userNameCookie = $.cookies.get("memberUsername");
            var rememberMeCookie = $.cookies.get("rememberMe4Member");
            var nicknameCookie = $.cookies.get("memberNickname");
            if (userNameCookie != null && userNameCookie != "" && rememberMeCookie != null && rememberMeCookie !="") {
                $("#offline").hide();
                $("#online").show();
                if(nicknameCookie!=null && nicknameCookie!=""){
                    $("#userline").html(nicknameCookie)
                }else{
                    if(userNameCookie!=null && userNameCookie!=""){
                        $("#userline").html(userNameCookie)
                    }
                }
            }else{
                $("#online").hide();
                $("#offline").show();
                if(nicknameCookie!=null && nicknameCookie!=""){
                    $("#useroff").html(nicknameCookie)
                }else{
                    if(userNameCookie!=null && userNameCookie!=""){
                        $("#useroff").html(userNameCookie)
                    }
                }
            }

            rload();

            //如果是特殊用户。
            $.ajax({
                url: '${base}/payment/isCrossborderMember',
                success: function(data) {
                    if (data.isCrossborderMember === true) {
                        $(".fa-bars").next().replaceWith('<a href="/ec/search/sacb?keyword=">跨境商品页面</a>');
                    }
                }
            });

            //搜索关键字
            $.ajax({
                type: 'post',
                url: '${base}/ajaxGetKeywords',
                success: function(data) {
                    var allHtml = "<span style='font-weight: bold;'>热门搜索：</span>";
                    for(var i=0;i<data.length;i++){
                        allHtml += "<a href='javascript:void(0)'  onclick=\"s('"+data[i]["keywords"]+"','')\" ";
                        if(i==0){
                            allHtml += " style='color:#ff0000' ";
                        }
                        allHtml += ">"+data[i]["keywords"]+"</a>";
                        if( i < data.length - 1){
                            allHtml += "&nbsp;&nbsp;|&nbsp; &nbsp; ";
                        }
                    }

                    $('#hotwords').append(allHtml);
                }
            });

        });
        function rload(){
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxCartList?r="+Math.random(),
                success: function(data) {
                    if(data.status=='success'){
                        var json=eval(data.data);
                        var totalshop=0;
                        $.each(json,function(i,n){
                            totalshop =	totalshop+ json[i].quantity;
                        });

                        $("#shoping-count").html(totalshop);
                    }
                }
            });
        }


        /**
         * 全站搜索
         */
        function s(key,param) {
            if (key != undefined && key != "" && key != "搜一搜") {
                if(param.length > 0 && param != null && param != "" && param != "undefined" && param != undefined && param != "null"){
                    window.location.href = base+"search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g,'址达司杠').replace(/\./g,'址达司点号').replace(/\+/g, '址达司加号')))+"?"+param;
                }else{
                    window.location.href = base+"search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g,'址达司杠').replace(/\./g,'址达司点号').replace(/\+/g, '址达司加号')));
                }
            }
        }


        $(document).keyup(function(event) {
            if (event.keyCode == 13) {
                var keyword=$("#keyword").val();
                if(!(keyword=='')) {
                    //$("#sear_btn").trigger("click");
                    s(keyword,'');
                }
            }
        });
    </script>

</head>
<body>



<div class="container">

</#escape>