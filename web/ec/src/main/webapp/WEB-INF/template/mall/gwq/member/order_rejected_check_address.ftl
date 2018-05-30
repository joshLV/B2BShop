<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .content{ padding: 0 20px; width: 1160px;}
    .breadcrumb {height: 20px;padding: 10px 0 10px 0;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline; border-bottom: 1px solid #E8E8E8; }
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
    .checkout-submit{ padding: 9px 18px; font-size: 14px; color: #fff; background: #e02d2d; border: 0; margin: 10px 0; margin-left: 55px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
    .left {float: left;width: 150px;margin-right: 10px;}
    .right {float: right;width: 830px;}
    #expressLog{margin-left: 20px;}
    .green{color: #00aa00;}
    .black{color: #000000;}
    .red{color: #ff0000;}
    .blue{color: #0000cc;}
    /**订单信息**/
    #orderinfo{/*border:1px solid #DADADA;*/overflow:visible;}
    #orderinfo .mt{height:40px;line-height:40px;font-size:14px; color: #333333; border-bottom: 1px dotted #dfdfdf;}
    #orderinfo .mt strong{ color: #e52c32;border-left: 3px solid #e52c32; padding-left: 10px; font-size: 14px;}
    #orderinfo .mc{background:#fff;overflow:visible; line-height: 30px;}
    #orderinfo .mc dl{padding:10px 5px;}
    #orderinfo .mc dl.fore{border-top:0;}
    #orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}
    #orderinfo .mc dd{ width: 100%; overflow: hidden; padding-bottom: 5px;}
    #orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}
    #orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial; padding-bottom: 20px;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}
    .img-list .img-box:hover{border-color:#EDD28B;}
    .img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:70px;height:70px;  background: url(${base}/static/mall/gwq/img/default_img.jpg) no-repeat center; background-size: 100%;}
    .ftx04{color:#F00}
    .pay-button{display: block; width: 46px; height: 24px; background: #86c226; color: #ffffff; text-align: center; line-height: 24px; border-radius: 3px; float: left;}
    .fore-in{width:375px; float: left; border-right: 1px dashed #E8E8E8; margin-right: 20px;}
    #choose-amount{padding:4px 0;/* border-bottom: 1px solid #dddddd; padding-bottom: 25px !important;*/}
    #choose-amount .dt,#choose-result .dt{}
    #choose-amount .wrap-input{position:relative;width:36px;padding:0 18px}
    #choose-amount .wrap-input a{position:absolute;top:3px;width:15px;height:15px;overflow:hidden;line-height:50px}
    #choose-amount .btn-reduce{left:0;background-position:-216px -190px}
    #choose-amount .btn-add{right:0;background-position:-232px -190px}
    #choose-amount .btn-reduce:hover{background-position:-216px -206px}
    #choose-amount .btn-add:hover{background-position:-232px -206px}
    #choose-amount .text{width:30px;height:16px;border:1px solid #ccc;padding:2px;text-align:center}

    /*收货地址*/
    .del_adr{background: url("/ec/static/img/ico_01.png") no-repeat;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr i{    background: url("/ec/static/img/ico_01.png") no-repeat;}
    .columnright { width:1138px; margin-bottom:10px; margin-top: 20px;position: relative;z-index:1; }
    .columnright button {cursor: pointer; border: none;}
    .mod_address_book .adr_list {width: 1148px; padding-left:25px; }
    .mod_address_book .adr_list li,
    .mod_address_book .adr_list .hover_li,
    .mod_address_book .adr_list li .using_add,
    .packageNum b,
    .remind_box ul li .no_div,
    .remind_box ul li .yes_div,
    .membercenter_pop i,
    .pop_close {background:url(${base}/static/mall/gwq/img/ico_address.png) no-repeat;}
    .mod_address_book .adr_list li {margin: 0 26px 10px 0;width: 260px;height: 173px;float: left;position: relative;background-position: left -176px;}
    .mod_address_book .adr_list li .using_add {width: 28px;height: 28px;position: absolute;right: 0; bottom:0;text-indent: -9999px;background-position: left -360px;}
    .mod_address_book .adr_list li.last{ margin-right:0;}
    .mod_address_book .adr_list .hover_li,
    .mod_address_book .adr_list .address_on { background-position: left top;}
    .mod_address_book .adr_list .hover_li .edit_box {display: block;}
    .mod_address_book .adr_list li .vcard {margin: 15px 20px 0 23px;}
    .mod_address_book .adr_list li .vcard p {line-height: 19px;margin-bottom: 5px;margin-right: 5px;}
    .mod_address_book .adr_list li .vcard .adr { margin-bottom:0;}
    .mod_address_book .adr_list li p .uc_name { font-size: 14px;}
    .mod_address_book .adr_list li .other_info .tag {float: left;border: 1px solid #E0E0E0;margin-right: 6px;padding: 2px 5px;}
    .mod_address_book .adr_list li .edit_box { width: 212px; display: none; position: absolute; left: 25px; height:25px; bottom: 10px;}
    .mod_address_book .adr_list li .edit_box .del_adr { background-position: left -295px; float: right; padding-left: 19px; color: #999; line-height:18px;}
    .mod_address_book .adr_list li .edit_box .btn_edit { float: left; line-height: 20px;}
    .mod_address_book .adr_list li .edit_box .btn_set_common { background-color: #b2b2b2; color: #fff; position: absolute; right: -13px; top: -123px; text-decoration: none; line-height: 1.2; padding: 1px 4px 2px;}

    .mod_address_book .adr_list li .tips_care {border: 4px solid #E0E0E0;background: #FFF;position: absolute;left: 16px;top: 40px;z-index: 1;width: 220px;padding: 34px 0;text-align: center;display: none;}
    .mod_address_book .adr_list li .tips_care p {display: inline; background-position: left -44px;padding-left: 20px;}
    .mod_address_book .adr_list li .tips_del {width: 160px;height: 80px;border: 5px solid #E0E0E0;position: absolute;left: 45px;top: 30px;background: #FFF;display: none;}
    .mod_address_book .adr_list li .tips_del .txt {text-align: center;margin-top: 18px;}
    .mod_address_book .adr_list li .tips_del .btn_box {text-align: center;margin-top: 10px;}
    .mod_address_book .adr_list li .tips_del .btn_box button {width: 41px;height: 22px;border: 0 none;background: #008bdb;cursor: pointer;margin: 0 3px;display: inline-block;line-height: 20px;color: #fff;}
    .mod_address_book .adr_list li .tips_del .btn_box .btn_cancle {background-color: #b0b0b0;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr { display: block; width: 260px; height: 118px; text-align: center; color: #0171bc; font-size: 14px; font-weight: bold; text-decoration: none; padding-top:55px;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr i { display: block; width: 29px; height: 29px; margin: 0 auto 5px; background-position: left -254px;}
    .mod_address_book .adr_list .hide {display: none;}
    .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
    .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
    .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
    .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto; line-height:34px; margin: 0 5px 0 85px;}
    .pageNavi li .page-start, .pageNavi li .page-end {border: 1px solid #ddd; color: #999; cursor: default;display: inline-block;vertical-align: top; width: 60px;}
    .aBlu{ color:#0171bc;}
    #popupdiv select { border: 1px solid #e6e6e6;height: 33px;line-height: 33px;width: 110px; border-radius: 0;background: #fff; margin-right:5px;}

    input.bule_btn{background: #C30000;font-size: 14px; border:0; color:#fff;font-weight: bold;cursor: pointer;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; height:36px!important; line-height:36px!important; border:0!important;cursor: pointer!important;}
    input.bule_btn:hover{ background:#ed4548;color:#fff;}
    /*******弹出层 common********/
    #popupdiv{width:698px;height:420px;position:fixed;z-index:1000; background:#fff;border: 1px solid #C30000; }
    .pop_win { width: 700px; background-color: #fff;   line-height: 1.5; color: #666; margin-top:0; }
    .title_div { background-color: #C30000; color: #fff; font-size: 14px; font-weight: bold; width:100%; line-height: 35px; float:left;}
    .title_div h2{ float:left; padding-left:25px;}
    .title_div a{ float:right; padding-right:25px; color:#fff;}
    .newaddress{ padding:30px; float:left; width:640px;}
    .newaddress li {padding-top: 6px;color: #999;overflow: hidden; float:left;width:100%;}
    li .using_add {
        display: none;
    }

    li.address_on .using_add {
        display: block;
    }
    .btn_set_common {
        display :block!important;
    }
    .c444{ color: #444; font-size: 13px;}
    .wj{position:relative;cursor: pointer; }
    .wj input{width:120px;height:30px; font-family:"微软雅黑"; color:#666;cursor: pointer;}
    .btn_file_molding{position:absolute;left:0px;top:0;z-index:1;border:0 none;filter:alpha(opacity=0);opacity:0; border:0; cursor: pointer;}
    .wj label{ display: block;}
    .item{ overflow: hidden; padding-bottom: 10px;}
    #img img{ text-align: center; font-size: 14px; color: #999; line-height: 350px; margin-top: 10px; width: 300px; height: 350px; display: block; border: 1px solid #dfdfdf;}
    .inner{ text-align: center; padding: 10px 0;}
    .item span.label{ font-size: 13px;}


    .wl_info{ width: 100%;}
    .wl_info input.input-text{ padding: 0 5px; line-height: 28px; border: 1px solid #dfdfdf; min-width: 150px;}
    .wl_info p{ padding-bottom: 15px; overflow: hidden;}
    .wl_info p.par{ padding-bottom: 0;}
    .wl_info p span{ float: left; padding-right: 7px;}
    .wl_info p input{ float: left; margin-right: 15px;}
    .wl_info p textarea{border: 1px solid #dfdfdf; padding: 5px; min-width: 382px; min-height: 70px; line-height: 1.7;}
    .wl_info span{padding-right: 4px;}
    .wl_info select{padding: 5px;line-height: 28px; border: 1px solid #dfdfdf;min-width: 80px;}
    .wl_info input.input-text2{ margin-top: 15px;}
    .checkout-submit{ padding: 9px 18px; font-size: 14px; color: #fff; background: #e02d2d; border: 0; margin: 10px 0; margin-left: 55px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }

</style>
    <#include "mall/gwq/header_new.ftl"/>
<div style="background: #F5F5F5;">
    <div class="content" style="background: #ffffff; border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;overflow: hidden;">
        <div class="breadcrumb">
            <strong><a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;退货订单：${order.orderSn}<span></span></span>
        </div><!--breadcrumb end-->
    </div>

    <div class="content" style="background: #ffffff; border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8; overflow: hidden; padding-top: 5px;">
        <form id="myform" action="" method="post">
            <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
            <input type="hidden" id="order_receiverId_back" name="order_receiverId_back" value="${receiver.id}"><!--当新增窗口打开时会清空 order_receiverId的值  新增打开什么都不做 用此处还原之前的选择 -->
            <input type="hidden" name="orderSn" id="" value="${order.orderSn}" />
            <input type="hidden" name="shopId" id="" value="${order.shopId}" />
            <input type="hidden" name="orderItemId" id="" value="${orderItem.id}" />
            <input type="hidden" name="goodsId" id="" value="${orderItem.goodsId}" />
            <#if goodsRejected??>
                <input type="hidden" name="rejectedSn" id="" value="${goodsRejected.rejectedSn}" />
                <input type="hidden" name="goodsQuantity" id="" value="${goodsRejectedDetail.goodsQuantity}" />
                <input type="hidden" name="rejectedReason" id="" value="${goodsRejected.rejectedReason}" />
                <input type="hidden" name="deliveryAddressDetail" id="" value="${goodsRejected.deliveryAddress}" />
            </#if>
            <#--退货订单信息-->
            <div class="m" id="orderinfo">
                <div class="mt">
                    <strong>退货订单信息</strong></div>
                <div class="mc" style="overflow: hidden;">
                    <dl>
                        <#--部分退货商品信息填写-->
                        <dt>
                            <span class="c444">退货售后信息服务</span>
                            <div class="clr"></div>
                        </dt>
                        <dd>
                            <#if goodsRejected??>

                                    <ul>
                                        <li class="fl" style="font-size: 13px;">
                                            运费承担方：
                                        </li>
                                        <li class="fl" style="font-size: 13px; font-weight: bold;">
                                            <#if goodsRejected.freightTake=="member">
                                                个人
                                            <#elseif goodsRejected.freightTake=="merchant">
                                                商家
                                            </#if>
                                            <#--<input type="radio" name="freightTake" id="freightTakeMember" value="member" />
                                            <label for="freightTakeMember">个人</label>
                                            <input type="radio" name="freightTake" id="freightTakeMerchant" value="merchant" />
                                            <label for="freightTakeMerchant">商家</label>-->
                                        </li>
                                    </ul>

                            </#if>
                        </dd>

                            <div class="wl_info">
                                <p>
                                    <span>物流名称&nbsp;<font color="red">*</font>：</span>
                                    <input type="text" id="logisticsName" name="logisticsName" class="input-text" />
                                    <span>物流单号&nbsp;<font color="red">*</font>：</span>
                                    <input type="text" id="logisticsNo" name="logisticsNo" class="input-text"  />
                                </p>
                            </div>

                        <div class="ylt">
                            <table cellpadding="0" width="100%">
                                <thead>
                                <tr>
                                    <th>
                                        <div class="item" id="pic">
                                            <span class="label fl" >货物凭证&nbsp;<font color="red">*</font>：</span>
                                            <div class="fl wj">
                                                <input id="file" class="btn_file_molding easyui-validatebox" size=6 type="file" name="file">
                                                <label for="input_file_molding">
                                                    <input value="选择文件" type="button"></label>
                                                <span id="picError1" class="error"></span>
                                            </div>
                                        </div>

                                    </th>
                                    <th>
                                        <div class="item" id="pic2">
                                            <span class="label fl">货物凭证2：</span>

                                            <div class="fl wj">
                                                <input id="file2" class="btn_file_molding easyui-validatebox" size=6 type="file" name="file">
                                                <label for="input_file_molding">
                                                    <input value="选择文件" type="button"></label>
                                                <span id="picError2" class="error"></span>
                                            </div>
                                        </div>

                                    </th>
                                    <th>
                                        <div class="item" id="pic3">
                                            <span class="label fl">货物凭证3：</span>

                                            <div class="fl wj">
                                                <input id="file3" class="btn_file_molding easyui-validatebox" size=6 type="file" name="file">
                                                <label for="input_file_molding">
                                                    <input value="选择文件" type="button"></label>
                                                <span id="picError3" class="error"></span>
                                            </div>
                                        </div>

                                    </th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr id="img">
                                    <td><img id="image1" width="300" height="350"   onLoad="onLoadImage('1')" alt="货物凭证1"/></td>
                                    <td> <img id="image2" width="300" height="350"   onLoad="onLoadImage('2')" alt="货物凭证2"/></td>
                                    <td>   <img id="image3" width="300" height="350"   onLoad="onLoadImage('3')" alt="货物凭证3"/></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </dl>

                            <div id="" class="checkout-buttons group">
                                <div class="sticky-wrap">
                                    <div class="inner">
                                        <button type="button" class="checkout-submit" id="" onclick="rejectedSubmit();">提交退货凭证</button>
                                    </div>
                                </div>
                            </div>

                </div>
            </div>
        </form>
    </div>
</div>




<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function() {
        $(".areaSelect").val("");
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
    });
</script>


<script type="text/javascript">

    $("#file").uploadPreview({ Img: "image1", Width: 0, Height: 0 })
    $("#file2").uploadPreview({ Img: "image2", Width: 0, Height: 0 })
    $("#file3").uploadPreview({ Img: "image3", Width: 0, Height: 0 })
    function validTagImage(index){
        var img = new Image();
        img.src = document.getElementById("image"+index).src;
        if(img.width>400||img.height>850){
            return false;
        }
        if(img.width==0||img.height==0){
            return false;
        }
        return true;
    }

    function rejectedSubmit(){
        if(!checklogisticsName()){
            return ;
        }
        if(!checklogisticsNo()){
            return ;
        }
        if(!checkpic()){
            return;
        }
        if(!validTagImage('1')){
            //$.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于200*400",'warn');
            $("#picError1").html("图片不符合规格,建议规格小于400*850");
            location.href = "#picError1";
            return;
        }else{
            $("#picError1").html("");

            if( document.getElementById("image"+2).src != ''){
                if(!validTagImage('2')){
                    $("#picError2").html("图片不符合规格,建议规格小于400*850");
                    location.href = "#picError2";
                    return;
                }else{
                    $("#picError2").html("");
                }
            }

            if( document.getElementById("image"+3).src != ''){
                if(!validTagImage('3')){
                    $("#picError3").html("图片不符合规格,建议规格小于400*850");
                    location.href = "#picError3";
                    return;
                }else{
                    $("#picError3").html("");
                }
            }
            uploadImg();
        }
    }


    /**
     * 部分退货凭证
     * @return
     */
    function checkpic(){
        var errorFlag = false;
        var errorMessage ="";
        var valuefile = $("#file").val();
        if(isEmpty(valuefile)){
            layer.alert("请您上传货物凭证!", {icon: 5});
        }else{
            errorFlag=true;
        }
        return errorFlag;
    }

    /**
     * 物流公司
     * @return
     */
    function checklogisticsName(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#logisticsName").val();
        if(isEmpty(value)){
            layer.alert("请输入物流公司名称!", {icon: 5});
        }else{
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if(value.length > 16){
                layer.alert("物流公司名称长度不超过16个字!", {icon: 5});
            }else{
                errorFlag=true;
            }
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }
        return errorFlag;
    }

    //验证物流单号
    function checklogisticsNo(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#logisticsNo").val();
        if(isEmpty(value)){
            layer.alert("请输入物流单号!", {icon: 5});
        }else{
            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if(value.length > 32){
                layer.alert("物流单号长度不超过32个字符!", {icon: 5});
            }else{
                errorFlag=true;
            }
            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }

        return errorFlag;
    }


    function uploadImg(){
        $("#btn").attr("disabled","true");
        $("#btn").addClass("disabled");
        $("#btn").val("上传中，请稍候......");
        var data = $('#myform').serialize();
        //处理乱码
        data= decodeURIComponent(data,true);
        //执行上传文件操作的函数
        $.ajaxFileUpload({
            url:"${base}/orderRejected/submitGoodsRejectAddr/${goodsRejected.rejectedSn}?"+data,
            secureuri:true,//是否启用安全提交,默认为false
            fileElementId:$('input[name=file]'),//文件选择框的对象,多个时用[]包含
            dataType:'text',
            async:true,
            success:function(data, status){//服务器响应成功时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                if(data.status=='success'){
                    window.location.href="${base}/orderRejected/listRejected/${order.id}";
                }else{
                    $.easyui.messager.alert('操作提醒',data.message,'error');
                }
            },
            error:function(data, status, e){ //服务器响应失败时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                $.easyui.messager.alert('操作提醒',data.message,'error');
            }
        });
    }

    function onLoadImage(index){
        if(!validTagImage(index)){
            //$.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于400*850",'warn');
            $("#picError" +index).html("图片不符合规格,建议规格小于400*850");
            location.href = "#picError" +index;
        }else{
            $("#picError" +index).html("");
        }
    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        } else {
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#btn_Cancel").colorbox({iframe:true, innerWidth:520, innerHeight:350, opacity: 0.15});
    });
</script>

<script type="text/javascript">
    function reduce() {
        var buyNum = $('#buy-num');
        if(parseInt(buyNum.val()) > 0) {
            buyNum.val(parseInt(buyNum.val()) - 1);
        }
    }
    function add() {
        var buyNum = $('#buy-num');
        if((parseInt(buyNum.val()) < parseInt(${orderItem.quantity}))) {
            buyNum.val(parseInt(buyNum.val()) + 1);
        }
    }
</script>


    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>