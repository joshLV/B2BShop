<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/zx/head.ftl">

</head>

<body>

<style>
    .mui-control-content {
        background-color: white;
        min-height: 215px;
    }
    .mui-control-content .mui-loading {
        margin-top: 50px;
    }
    #sliderSegmentedControl>a{
        font-size: 14px;
    }
</style>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">${articles.title}</h1>
</header>

<div class="mui-content" style="padding-top: 45px;height: 100%">

    <div class="mui-content-padded" style="padding:0;width: 100;overflow: hidden;">
    ${content}
    </div>

</div>
<script>
    mui.init({
        swipeBack: false
    });

</script>

</body>