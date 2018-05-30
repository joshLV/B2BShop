<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <style type="text/css">
        .error_ul li{
            color: #e9314a;
        }
        .error_ul li h2{
            font-size: 16px;
        }
    </style>
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/${base}/toolsHks/list.html">销售数据</a></strong><span>&nbsp;&gt;&nbsp;销售数据导入</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="xssjdr"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>销售数据上传</em></h1>
            <div class="user_right p10">
                <input type="hidden" id="isCloseId" value="0" />
                <div class="pop_win aptab_center_address" style="padding: 0 !important;width: 990px;">
                    <form name="reg1" id="reg1" action="" method="post">
                            <ul class="newaddress"  style="width: 990px;">
                                <li class="wj">
                                    <form id="myform" action="">
                                        <input type="hidden" name="buyerUserName" id="buyerUserName" value="${buyerUserName}">
                                    <#--    <input type="file" name="file" id="file" value="选择文件" style="height: 36px;line-height: 36px;">-->
                                        <input id="file" class="btn_file_molding" size="6" type="file" name="file">
                                        <label for="input_file_molding">
                                            <input value="选择文件" type="button">
                                        </label>

                                    </form>
                                </li>
                                <li style="height: 10px;">&nbsp;</li>
                                <li>
                                    <input class="btn-5-new" id="button_show"  type="button" onclick="uploadPurchaseOrder();" value="上传销售数据" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${base}/toolsHks/downloadExcel" style="font-weight: bold;font-size: 14px;color: #e9314a;">模板下载点击这里</a>
                                </li>
                                <li style="height: 10px;">&nbsp;</li>
                                <li>
                                    <h3>上传销售数据提示:</h3>
                                    <p>1.上传的销售数据文件后缀必须为.xlsx;</p>
                                    <p>2.上传的销售数据文件必须为下载的销售数据模板;</p>
                                    <p>3.销售数据模板中的商品条码,商品名称,品类名称,最后进价,当前售价,销售数量为必填项;</p>
                                    <p>4.商品条形码必须为纯数字且大于0,位数不超过16位;</p>
                                    <p>5.商品名称、品类名称长度为1~60位;</p>
                                    <p>6.最后进价、当前售价必须为长度为1~22位的数字;</p>
                                    <p>7.销售数量必须为大于0小于100000的正整数;</p>
                                    <p>8.模板文件的列名以及顺序都不可改变;</p>
                                    <p>9.违反以上任意一条则视为无效的销售数据文件.</p>
                                </li>
                            </ul>
                    </form>
                </div>
                <div id="">
                    <ul class="newaddress error_ul" id="msg_ul"  style="width: 985px;padding: 0px 0px 0px 30px;"></ul>
                </div>
            </div>

        </div>
    </div>
</div>


<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/purchase_order/ajaxPurchaseOrder.js" type="text/javascript"></script>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    var indexs = null;
    $(function () {
    });


    /**
     * Desc:上传销售数据
     * */
    function uploadPurchaseOrder(){
        var data = $('#myform').serialize();
        var fileName = $("#file").val();
        var actionUrl =${base}/+"toolsHks/uploadExcel?"+data;

        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function (data) {
                if (data.status == 'success') {
                    if (!isEmpty(fileName)) {
                        fileName = fileName.substring(fileName.lastIndexOf('.'), fileName.length);
                        if (fileName == '.xlsx') {
                            $("#button_show").val('拼命上传中...');
                            $("#button_show").addClass("btn-5-new_uploadPurchaseOrder").removeClass("btn-5-new");
                            $("#button_show").attr("disabled", true);

                            var loadindex = layer.load();
                            $.ajaxFileUpload({
                                url: actionUrl,
                                secureuri: true,//是否启用安全提交,默认为false
                                fileElementId: $('input[name=file]'),
                                dataType: 'text',
                                async: true,
                                success: function (data, status) {
                                    data = data.replace(/<pre.*?>/g, '');
                                    data = data.replace(/<PRE.*?>/g, '');
                                    data = data.replace("<PRE>", '');
                                    data = data.replace("</PRE>", '');
                                    data = data.replace("<pre>", '');
                                    data = data.replace("</pre>", '');
                                    data = jQuery.parseJSON(data);
                                    layer.close(loadindex);

                                    $("#button_show").val('上传销售数据');
                                    $("#button_show").addClass("btn-5-new").removeClass("btn-5-new_uploadPurchaseOrder");
                                    $("#button_show").removeAttr("disabled");

                                    if (data.status == "success") {
                                        $("#msg_ul").html('');
                                        layer.alert("上传成功！", {icon: 6});
                                    } else {//message
                                        if(data.data_error) {
                                            layer.msg("上传出现错误", {icon: 5, time: 3000});
                                            $("#msg_ul").html('');
                                            $("#msg_ul").append('<li><h2>错误信息</h2></li>');
                                            $("#msg_ul").append('<li>数据存在问题，请核对修改后再上传。错误信息如下：</li>');
                                            $.each(data.message, function (i, v) {
                                                $("#msg_ul").append("<li>" + (i + 1) + '.' + v + "</li>");
                                            });
                                        }else{
                                            layer.alert(data.message, {icon: 5});
                                        }
                                    }

                                },
                                error: function (data, status, e) { //服务器响应失败时的处理函数
                                    layer.alert("网络异常，请稍后重试！", {icon: 7});
                                }
                            });

                        } else {
                            layer.alert("文件格式错误,只支持Excel2007及以上(*.xlsx)文件格式!", {icon: 7});
                        }
                    } else {
                        layer.alert("请选择采购单!", {icon: 7});
                    }
                } else {
                    window.location.href="${base}/member/login";
                }
            }
        });

    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }

</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>