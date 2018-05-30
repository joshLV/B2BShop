//兼容其他浏览器，如果浏览器的Function没有bind方法，自定义一个bind方法
if (!Function.prototype.bind) {
    Function.prototype.bind = function (obj, args, appendArgs) {
        var method = this;
        return function () {
            var callArgs = args || arguments
            if (appendArgs === true) {
                callArgs = Array.prototype.slice.call(arguments, 0);
                callArgs = callArgs.concat(args);

            } else if (typeof appendArgs == "number") {
                callArgs = Array.prototype.slice.call(arguments, 0);
                // copy arguments first
                var applyArgs = [appendArgs, 0].concat(args);
                // create method call params
                Array.prototype.splice.apply(callArgs, applyArgs);
                // splice them in
            }
            return method.apply(obj || window, callArgs);
        };
    };
}

//判断使用权限
function judgeAuth(base, auth, fn){
    judgeAuth4Type(base, auth, false, fn);
}

//判断使用权限
function judgeAuthReload(base, auth, fn){
    judgeAuth4Type(base, auth, true, fn);
}

//判断使用权限
function judgeAuth4Type(base, auth, isReload, fn){
    if( typeof(auth) == 'undefined' || $.trim(auth) == ''){
        return false;
    }
    $.ajax({
        type: 'post',
        url: base + '/member/judgeOperatorAuth',
        data: {auth: auth},
        success: function(data) {
            if( data.status == 'success' ){
                if( data.hasAuth ){
                    fn();
                }else{
                    layer.msg(data.message, {icon:7,time:2000});
                    if( isReload ){
                        setTimeout('window.location.reload()',3000);
                    }
                }
            }else{
                layer.msg('登录已过期，请重新登录', {icon:2,time:2000});
                setTimeout('window.location.reload()',3000);
            }
        }
    });
}


//判断使用权限，隐藏显示按钮
function judgeBtnAuth(base, auth, btnClass){
    if( typeof(auth) == 'undefined' || $.trim(auth) == ''){
        return false;
    }
    $.ajax({
        type: 'post',
        url: base + '/member/judgeOperatorAuth',
        data: {auth: auth},
        success: function(data) {
            if( data.status == 'success' ){
                if( data.hasAuth ){
                    $("." + btnClass).show();
                }else{
                    $("." + btnClass).hide();
                }
            }else{
                $("." + btnClass).hide();
            }
        }
    });
}
