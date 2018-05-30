<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jd/head.ftl">
    <style>
        .mui-btn {
            font-size: 16px;
            padding: 8px;
            margin: 3px;
        }
        h5.mui-content-padded {
            margin-left: 3px;
            margin-top: 20px !important;
        }
        h5.mui-content-padded:first-child {
            margin-top: 12px !important;
        }
        .ui-alert {
            text-align: center;
            padding: 20px 10px;
            font-size: 16px;
        }
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 30%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding: 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">

    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title mui-center">收货地址</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group" action="receiver/save"">
        <!--
        <div class="mui-input-row">
            <label>账号</label>
            <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
        </div>
        -->

        <button id='showCityPicker' class="mui-btn mui-btn-block" type='button'>显示选择城市 ...</button>
        <div id='cityResult' class="ui-alert"></div>

        <div class="mui-input-row">
            <label>详细地址</label>
            <input id='email' name="address" type="email" class="mui-input-clear mui-input" placeholder="请输入您的收货地址">
        </div>
    </form>
    <div class="mui-content-padded">
        <button id='sendMail' class="mui-btn mui-btn-block mui-btn-primary"  onclick="javascript:alert('此功能暂未开放！');">保存</button>
    </div>
</div>
<script>
    (function(mui, doc) {
        mui.init();
        mui.ready(function() {
            //级联示例
            var cityPicker = new mui.PopPicker({
                layer: 2
            });
            cityPicker.setData(cityData);
            var showCityPickerButton = doc.getElementById('showCityPicker');
            var cityResult = doc.getElementById('cityResult');
            showCityPickerButton.addEventListener('tap', function(event) {
                cityPicker.show(function(items) {
                    cityResult.innerText ="你选择的城市是:" + items[0].text + items[1].text;
                });
            }, false);
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
    }(mui, document));
</script>
</body>

</html>