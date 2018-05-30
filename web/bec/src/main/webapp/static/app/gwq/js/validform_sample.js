var tipmsg={//默认提示文字;
    tit:"提示信息",
    w:{
        "*":"不能为空！",
        "*6-16":"请填写6到16位任意字符！",
        "n":"请填写数字！",
        "n6-16":"请填写6到16位数字！",
        "s":"不能输入特殊字符！",
        "s6-18":"请填写6到18位字符！",
        "p":"请填写邮政编码！",
        "m":"请填写手机号码！",
        "e":"邮箱地址格式不对！",
        "url":"请填写网址！",
        "*6-20": "请填写6到20位任意字符！",
        "zh2-4":"请输入2到4个中文字符!",
        "tel":"固定电话格式不对",
        "pwd":"请填写6到20位任意字符！",
        img:"图片格式不正确(gif|jpg|png)"
    },
    def:"请填写正确信息！",
    undef:"datatype未定义！",
    reck:"两次输入的内容不一致！",
    r:"通过信息验证！",
    c:"正在检测信息…",
    s:"请{填写|选择}{0|信息}！",
    v:"所填信息没有经过验证，请稍后…",
    p:"正在提交数据…"
};
var DataType = {
    "*":/[\w\W]+/,
    "*6-16":/^[\w\W]{6,16}$/,
    "n":/^\d+$/,
    "n6-16":/^\d{6,16}$/,
    "s":/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]+$/,
    "s6-18":/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]{6,18}$/,
    "p":/^[0-9]{6}$/,
    "m":/^13[0-9]{9}$|14[0-9]{9}$|15[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$/,
    "e":/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
    "url":/^(\w+:\/\/)?\w+(\.\w+)+.*$/,
    "*6-20": /^[^\s]{6,20}$/,
    "zh2-4":/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,4}$/,
    "tel":/^0\d{2,3}-\d{5,9}|0\d{2,3}-\d{5,9}$/,
    "pwd": /^[^\s]{6,20}$/,
    "img":/^[\w\W]+\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/
};
function checkFormItem(id, callback) {
    var item = jQuery('#'+id);
    var value = item.val();
    var i = 0;
    while(value.indexOf('\\') >= 0){
        value = value.replace('\\', "/");
        i++;
        if(i >= 100){//防止死循环
            return;
        }
    }
    var errorFlag = false;
    var regex = DataType[item.attr('datatype')];
    if (isEmpty(value)) {
        outSet(item.attr('placeholder'));
    } else {
        if (!regex.exec(value)){
            var label = item.parent().find('label').prop('innerText');
            label = label.replace('\n', "");
            outSet( label + ' ' + tipmsg.w[item.attr('datatype')]);
        } else if(typeof(item.attr('recheck')) != 'undefined') {
            var reck = jQuery('#' + item.attr('recheck'));
            if (value != reck.val()) {
                var label = item.parent().find('label').prop('innerText');
                label = label.replace('\n', "");
                outSet(label + ' ' + tipmsg.reck);
            } else {
                outSet("");
                errorFlag = true;
            }
        } else if('img' == item.attr('datatype')){
            errorFlag = true;
            var imageWidth = item.attr('width');
            var imageHeight = item.attr('height');
            if(typeof(imageWidth) == 'undefined' ){
                imageHeight = 800;
            }
            if(typeof(imageHeight) == 'undefined' ){
                imageHeight = 600;
            }
            var index = id.substring(id.length-1,id.length);
            var img = new Image();
            img.src = jQuery('#image'+index).prop('src');
            var label = jQuery('#'+id).parent().find('label').prop('innerText');
            if(typeof(label) == 'undefined'){
                label = '';
            }else{
                label = label.replace('\n', "");
            }
            if(img.width > imageWidth || img.height > imageHeight){
                errorFlag = false;
                outSet(label + " 图片不符合规格,建议规格小于800*600");
            }
            if(img.width == 0 || img.height == 0){
                errorFlag = false;
                outSet(label + " 图片不能为空");
            }
        }else{
            outSet("");
            errorFlag = true;
        }
    }
    if(errorFlag && typeof(callback) == 'function'){
        errorFlag = callback();
    }
    if( errorFlag ){
        outSet("");
    }
    if(!errorFlag){
        closeWaiting();
    }
    return errorFlag;
};
