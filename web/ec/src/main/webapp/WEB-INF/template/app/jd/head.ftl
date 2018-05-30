<#assign path="${base}/static/app/jd"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
<meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<link href="${base}/static/app/jd/theme/red/mui.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${base}/static/app/jd/theme/red/function.css">
<link rel="stylesheet" type="text/css" href="${base}/static/app/jd/theme/red/css.css">
<link href="${path}/theme/red/my.css" rel="stylesheet" />
<link href="${path}/theme/red/mui.listpicker.css" rel="stylesheet" />
<link href="${path}/theme/red/mui.poppicker.css" rel="stylesheet" />
<link href="${path}/theme/red/my2.css" rel="stylesheet" />
<script src="${path}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${path}/js/jquery.form.js" type="text/javascript"></script>
<script src="${path}/js/mui.min.js"></script>
<script src="${path}/js/mui.enterfocus.js"></script>
<script src="${path}/js/app.js"></script>
<script src="${path}/js/mui.listpicker.js"></script>
<script src="${path}/js/mui.poppicker.js"></script>
<script src="${path}/js/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="${path}/js/Validform_v5.3.2.js" type="text/javascript" charset="utf-8"></script>
<script>
    var ismobile=true;
    if(typeof(mui.os.android)=='undefined' && typeof(mui.os.ios)=='undefined'){
        ismobile=false;
    }
    if(typeof(mui.os.plus)=='undefined'){
        ismobile=false;
    }
    var fullpath = "";
    /*获取全路径*/
    function getWebRootPath() {
        fullpath="";
        var url=window.location.protocol+"//"+window.location.host;
        var project='${base}';
        fullpath = url+project;
        return fullpath;
    }
    var hosturl = getWebRootPath();
    /*页面跳转*/
    function jumpto(url) {
        if (ismobile) {
            mui.openWindow({
                url: url,
                show:{
                    autoShow:false,
                    aniShow:'auto'
                },
                createNew:true,
                waiting: {
                    autoShow: true,//自动显示等待框，默认为true
                    title: '正在加载...'//等待对话框上显示的提示内容
                }
            });
        } else {
            window.location.href = url;
        }
    }
</script>