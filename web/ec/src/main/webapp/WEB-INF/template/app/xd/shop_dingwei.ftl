<!DOCTYPE html>
<html>

<head>
<#include "app/xd/head.ftl">
    <style>
        .span_{
            line-height: 18px;
            width: 100%;
            height: 40px;
            margin-bottom: 0px;
            padding: 10px 15px;
            -webkit-user-select: text;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            outline: 0;
            background-color: #fff;
            -webkit-appearance: none;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        #r-result{width:100%;}
        .tangram-suggestion{
            z-index: 989999;
        }
        .mui-table-view-inverted .mui-table-view-cell:after{  background-color:transparent!important;}
        .mui-icon-arrowleft{ color: #333;}
        .right_panel{ color:#333; background: #fff;}
        .mui-table-view-chevron .mui-table-view-cell{ padding-right: 15px;}
        .mui-table-view-cell input,.mui-table-view-cell .span_{ margin-bottom: 0px;border: 1px solid #dfdfdf; padding: 8px 15px;}
        .mui-table-view-cell{  padding: 0 15px; margin-top: 15px;}
        .mui-table-view-inverted:before{background-color:transparent!important;}
        /* 定位 */
        .mui-table-view:after{height: 0px !important; }
        .mui-table-view font{color: #000;}
        .mui-table-view{padding-bottom: 20px; margin-top: 10px; padding-left: 15px; padding-right: 15px; background: none;}
        .mui-table-view:before{height: 0;}

    </style>
</head>
<!--页眉-->
<body style="padding-bottom:55px;">
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        <span style="width: 15px; display: inline-block;padding-right: 5px;"><img src="${base}/static/app/xd/images/dibiao_icon.png" style="width: 100%;"></span>西安市
    </div>
</header>
<div class="mui-content" style="padding-top: 45px;">
    <ul class="" style="background-color: #f5f5f5;height: 100%;overflow: auto">
        <li class="mui-table-view-cell">
            <span id="r-result"><input type="text" value="" id="suggestId" placeholder="搜索写字楼、小区、学校"></span>
            <div id="searchResultPanel" style="border:1px solid #dfdfdf;width:150px;height:auto; display:none;z-index: 999999"></div>
        </li>
        <li class="mui-table-view" style="padding-bottom: 0">
            <span class="mui-icon span_" onclick="acAddress(this)" style="margin-left: 0;" >
                <span style="font-size: 20px;color: #ff8400;" class="mui-icon mui-icon-navigate" ></span>
                    <font style="font-size: 16px;font-family:'Microsoft YaHei'">定位到当前位置</font>
            </span>
        </li>
    </ul>

    <div id="address_list_choose" style=""></div>

</div>


<div id="l-map" style="display: none"></div>
<script src="${path}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rmRI4a2Py259uEP0RU4NGC5F88S6UdZp"></script>

<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        if(ismobile && typeof(plus)!='undefined'){
            plus.navigator.closeSplashscreen();
        }
    }(mui, document));


    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("l-map");
    map.centerAndZoom("陕西",12);                   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        $("#suggestId").blur();//防止选完地址后有弹出输入菜单

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            var pv=local.getResults();
            setChooseVal(myValue,pp.lat,pp.lng,pv.keyword,pv.keyword);//
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
    /**
     *
     * @param value 地址全名称
     * @param lat 纬度
     * @param lng 经度
     * @param pointName 点名称
     * @param ssqj 省市区街道
     */
    function setChooseVal(value,lat,lng,pointName,ssqj){
        $("#defauleAddress").html(pointName)
        $("#suggestId").val(value);

        $("#atitude").val(lat);
        $("#longitude").val(lng);



        $.cookie("defaule_op", "1", { path: "/"});
        $.cookie("defaule_address", value, { path: "/"});
        $.cookie("defaule_atitude", lat+"", { path: "/"});
        $.cookie("defaule_longitude", lng+"", { path: "/"});
        $.cookie("defaule_pointName", pointName, { path: "/"});
        $.cookie("defaule_ssqj", ssqj, { path: "/"});
        //alert($.cookie('defaule_op'));
//        plus.storage.removeItem("defaule_address");
//        plus.storage.removeItem("defaule_atitude");
//        plus.storage.removeItem("defaule_longitude");
//        plus.storage.removeItem("defaule_pointName");
//        plus.storage.removeItem("defaule_ssqj");
//        plus.storage.removeItem("defaule_op");
//
//        plus.storage.setItem("defaule_op","1");
//
//        plus.storage.setItem("defaule_address",value);
//        plus.storage.setItem("defaule_atitude",lat+"");
//        plus.storage.setItem("defaule_longitude",lng+"");
//        plus.storage.setItem("defaule_pointName",pointName);
//        plus.storage.setItem("defaule_ssqj",ssqj);
//        console.log("---------->"+plus.storage.getItem("defaule_address")+"-------"+plus.storage.getItem("defaule_atitude")+"----"+plus.storage.getItem("defaule_longitude"))
        window.location.href='${base}/app_index';
        //hideRigthPanel();
    }



    var InterValObj; //timer变量，控制时间
    var count = 20; //间隔函数，1秒执行
    var curCount;//当前剩余秒数


    function acAddress(o) {
//        curCount = count;
//        //设置button效果，开始计时
//        $(o).removeAttr("onclick")
//        $(o).find("font").html("(" + curCount  + ")定位到当前位置...")
//        InterValObj = window.setInterval(SetRemainTime(o), 1000); //启动计时器，1秒执行一次
//        //获取位置
        //getPosBaidu();
        var map = new BMap.Map("l-map");
        map.centerAndZoom(new BMap.Point(108.8805636877058, 34.23254209937623), 11);//点写死就是陕西的
        var options = {
            onSearchComplete: function(results){
                // 判断状态是否正确
                if (local.getStatus() == BMAP_STATUS_SUCCESS){
                    var s = ''
                    for (var i = 0; i < results.getCurrentNumPois(); i ++){
                        s+='<span class="mui-icon span_" style="margin-left: 0;border-top: none;height: auto" atitude='+results.getPoi(i).point.lat+' longitude='+results.getPoi(i).point.lng+' ssqj='+results.getPoi(i).province+results.getPoi(i).city+' pointName='+results.getPoi(i).province+results.getPoi(i).title+' address='+results.getPoi(i).province+results.getPoi(i).city+results.getPoi(i).province+results.getPoi(i).address+' onclick="setValue(this)">'+
                                '<span style="font-size: 20px;color: #ff8400;" class="mui-icon" ><img src="${base}/static/app/xd/images/dibiao_icon.png" style="width: 15px;margin-right:10px;"></span>'+
                                '<font style="font-size: 14px;font-family:\'Microsoft YaHei\'">'+results.getPoi(i).title+'</font>'+
                                '<h6 style="margin-left:25px;line-height: 16px;">'+results.getPoi(i).address+'</h6>'+
                                '</span>'
                    }
                    $("#address_list_choose").html(s);
                }
            }
        };
        var local = new BMap.LocalSearch(map, options);
        var k=$.cookie('defaule_pointName');//plus.storage.getItem("defaule_ssqj")+plus.storage.getItem("defaule_pointName");'陕西省西安市西安光电园A座308'
        //alert(k)
        local.search(k);
    }


    function setValue(obj){
        var value=$(obj).attr("address");
        var lat=$(obj).attr("atitude");
        var lng=$(obj).attr("longitude");
        var pointName=$(obj).attr("pointName");
        var ssqj=$(obj).attr("ssqj");
        setChooseVal(value,lat,lng,pointName,ssqj)
    }

    //timer处理函数
    function SetRemainTime(o) {
        if (curCount == 0) {
            window.clearInterval(InterValObj);//停止计时器
            $(o).attr("onclick","acAddress(this)");
            $(o).find("font").html("定位到当前位置")
        }
        else {
            curCount--;
            $(o).find("font").html("(" + curCount  + ")定位到当前位置...")
        }
    }

</script>
</body>
</html>
