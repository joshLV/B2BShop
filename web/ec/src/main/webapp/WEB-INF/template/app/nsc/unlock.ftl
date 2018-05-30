
<!DOCTYPE html>
<html>

<head>
    <#assign path="${base}/static/app/nsc"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link href="${path}/theme/red/mui.min.css" rel="stylesheet" />
    <style>
        html,
        body {
            background-color: #efeff4;
            overflow: hidden;
        }
        .mui-locker {
            margin: 35px auto;
        }
        #forget {
            display: block;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <h1 class="mui-title">解锁</h1>
</header>
<div class="mui-content">
    <div class="mui-content-padded" style="margin: 10px 0px;">
        <div class="mui-locker" data-locker-options='{"ringColor":"rgba(221,221,221,1)","fillColor":"#ffffff","pointColor":"rgba(0,136,204,1)","lineColor":"rgba(0,136,204,1)"}' data-locker-width='320' data-locker-height='320'>
        </div>
    </div>
    <a id='forget'>忘记手势密码？</a>
</div>
<script src="${path}/js/mui.min.js"></script>
<script src="${path}/js/mui.locker.js"></script>
<script src="${path}/js/app.js"></script>

<script>
    (function($, doc) {
        $.init();
        $.plusReady(function() {
            var settings = app.getSettings();
            var forgetButton = doc.getElementById("forget");
            var locker = doc.querySelector('.mui-locker');
            var clearStateAndToLogin = function() {
                settings.gestures = '';
                settings.autoLogin = false;
                app.setSettings(settings);
                var state = app.getState();
                state.token = '';
                app.setState(state);
                $.openWindow({
                    url: 'login.html',
                    id: 'login',
                    show: {
                        aniShow: 'pop-in'
                    },
                    waiting: {
                        autoShow: false
                    }
                });
            };
            forgetButton.addEventListener('tap', function(event) {
                clearStateAndToLogin();
            });
            var tryNumber = 5;
            locker.addEventListener('done', function(event) {
                var rs = event.detail;
                if (settings.gestures == rs.points.join('')) {
                    $.openWindow({
                        url: 'main.html',
                        id: 'main',
                        show: {
                            aniShow: 'pop-in'
                        },
                        waiting: {
                            autoShow: false
                        }
                    });
                    rs.sender.clear();
                } else {
                    tryNumber--;
                    rs.sender.clear();
                    if (tryNumber > 0) {
                        plus.nativeUI.toast('解锁手势错误，还能尝试 ' + tryNumber + ' 次。');
                    } else {
                        clearStateAndToLogin();
                    }
                }
            }, false);
            var backButtonPress = 0;
            $.back = function(event) {
                backButtonPress++;
                if (backButtonPress > 1) {
                    plus.runtime.quit();
                } else {
                    plus.nativeUI.toast('再按一次退出应用');
                }
                setTimeout(function() {
                    backButtonPress = 0;
                }, 1000);
                return false;
            };
        });
    }(mui, document));
</script>
</body>

</html>