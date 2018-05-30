<#assign path="${base}/static/app/jp"/>
<#assign path_skin="${base}/static/app/jp/theme/red"/>
<#assign picloading="${base}/static/app/jp/images/picloading.png"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
<meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<link href="${path_skin}/mui.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${path_skin}/function.css">
<link rel="stylesheet" type="text/css" href="${path_skin}/css.css">
<link href="${path_skin}/my.css" rel="stylesheet" />
<link href="${path_skin}/iconfont.css" rel="stylesheet" />
<link href="${path_skin}/mui.listpicker.css" rel="stylesheet" />
<link href="${path_skin}/mui.poppicker.css" rel="stylesheet" />
<link href="${path_skin}/my2.css" rel="stylesheet" />
<script src="${path}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${path}/js/jquery.form.js" type="text/javascript"></script>
<script src="${path}/js/mui.min.js"></script>
<script src="${path}/js/mui.enterfocus.js"></script>
<script src="${path}/js/app.js"></script>
<script src="${path}/js/mui.listpicker.js"></script>
<script src="${path}/js/mui.poppicker.js"></script>
<script src="${path}/js/layer/layer.js"></script>
<#--<script src="${path}/js/city.data.js" type="text/javascript" charset="utf-8"></script>-->
<script src="${path}/js/Validform_v5.3.2.js" type="text/javascript" charset="utf-8"></script>
<script>
    var ismobile=true;
    //微信自动登录地址
    var weixinLoginUrl='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8d3d9c907f99ea2b&redirect_uri=http://www.jp516.com/ec/member/weixinAutoLogin&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';
    /**
     *是否是微信浏览器
     */
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }
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
                    aniShow:'slide-in-right'
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
    function outSet(s) {
        var _dout_ = document.getElementById("outLine");
        if(typeof(s) == 'undefined' || s.trim().length == 0 ){
            _dout_.style.display = 'none';
            return;
        }
        _dout_.innerText = s + "\n";
        (0 == _dout_.scrollTop) && (_dout_.scrollTop = 1);//在iOS8存在不滚动的现象
        _dout_.style.display = 'block';
    }
    var _layer_loading;
    function showWaiting() {
        _layer_loading = layer.open({type: 2});
    }

    function closeWaiting() {
        layer.close(_layer_loading);
    }

    function popAlert(msg) {
        layer.open({
            content: msg,
            style: 'background-color:#888; color:#fff; border:none; margin: 80% auto 0px auto;',
            time:2
        });
    }
    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value) {
        if (value == null || value == "" || value == "undefined" || value == undefined || value == "null") {
            return true;
        }
        else {
            value = (value + "").replace(/\s/g, '');
            if (value == "") {
                return true;
            }
            return false;
        }
    }
    /**
     * 检查是否含有非法字符
     * @param temp_str
     * @returns {Boolean}
     */
    function is_forbid(temp_str) {
        temp_str = temp_str.replace(/(^\s*)|(\s*$)/g, "");
        temp_str = temp_str.replace('*', "@");
        temp_str = temp_str.replace('--', "@");
        temp_str = temp_str.replace('/', "@");
        temp_str = temp_str.replace('+', "@");
        temp_str = temp_str.replace('\'', "@");
        temp_str = temp_str.replace('\\', "@");
        temp_str = temp_str.replace('$', "@");
        temp_str = temp_str.replace('^', "@");
        temp_str = temp_str.replace('.', "@");
        temp_str = temp_str.replace(';', "@");
        temp_str = temp_str.replace('<', "@");
        temp_str = temp_str.replace('>', "@");
        temp_str = temp_str.replace('"', "@");
        temp_str = temp_str.replace('=', "@");
        temp_str = temp_str.replace('{', "@");
        temp_str = temp_str.replace('}', "@");
        var forbid_str = new String('@,%,~,&');
        var forbid_array = new Array();
        forbid_array = forbid_str.split(',');
        for (i = 0; i < forbid_array.length; i++) {
            if (temp_str.search(new RegExp(forbid_array[i])) != -1)
                return false;
        }
        return true;
    }
</script>