
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
    <h1 class="mui-title">新闻中心</h1>
</header>

<div class="mui-content" style="padding-top: 45px;">
    <div id="slider" class="mui-slider" >
        <div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <#list articleComn as service>
            <a class="mui-control-item" href="#item${service_index+1}mobile">
                ${service["category"].name}
            </a>
            </#list>
        </div>
        <div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4" style="width: 25%"></div>
        <div class="mui-slider-group" style="height: 100%;">
                <#list articleComn as service>
                    <div id="item${service_index+1}mobile" class="mui-slider-item mui-control-content <#if service_index+1 ==1>mui-active</#if>">
                        <div id="scroll${service_index+1}" class="mui-scroll-wrapper">
                            <div class="mui-scroll">
                                <ul class="mui-table-view mui-table-view-chevron">
                                    <#list service["articles"] as article>
                                    <li class="mui-table-view-cell mui-media" style="width: 85%;">
                                        <a class="mui-navigate-right" href="${base}/play/${article.id}.html?whichclient=whichapp">
                                            <div class="mui-media-body" style="text-align:left;">
                                            ${article.title}
                                                <p class='mui-ellipsis'>${article.seoDescription}</p>
                                            </div>
                                        </a>
                                    </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                </#list>
        </div>
    </div>

</div>
<script>

    (function($) {
        mui.init({
            swipeBack: false
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
        $('.mui-scroll-wrapper').scroll({
            indicators: true //是否显示滚动条
        });
        var item2 = document.getElementById('item2mobile');
        var item3 = document.getElementById('item3mobile');
        var item4 = document.getElementById('item4mobile');
        document.getElementById('slider').addEventListener('slide', function(e) {
            if (e.detail.slideNumber === 1) {
                if (item2.querySelector('.mui-loading')) {
                    setTimeout(function() {
                        //item2.querySelector('.mui-scroll').innerHTML = html2;
                    }, 500);
                }
            } else if (e.detail.slideNumber === 2) {
                if (item3.querySelector('.mui-loading')) {
                    setTimeout(function() {
                        //item3.querySelector('.mui-scroll').innerHTML = html3;
                    }, 500);
                }
            }else if (e.detail.slideNumber === 3) {
                if (item4.querySelector('.mui-loading')) {
                    setTimeout(function() {
                        //item4.querySelector('.mui-scroll').innerHTML = html4;
                    }, 500);
                }
            }
        });
        var sliderSegmentedControl = document.getElementById('sliderSegmentedControl');
        $('.mui-input-group').on('change', 'input', function() {
            if (this.checked) {
                sliderSegmentedControl.className = 'mui-slider-indicator mui-segmented-control mui-segmented-control-inverted mui-segmented-control-' + this.value;
                //force repaint
                sliderProgressBar.setAttribute('style', sliderProgressBar.getAttribute('style'));
            }
        });

    })(mui);
    $(".mui-slider-item").height(window.screen.availHeight-100);
</script>

</body>