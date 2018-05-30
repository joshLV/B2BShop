<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "#www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="#www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单信息确认</title>
<link href="${base}/static/mall/jp/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/jp/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery.min.js" type="text/javascript"></script>
    <!--验证码插件所用js（Validform_v5.3.2.js）-->
    <script type="text/javascript" src="${base}/static/mall/jp/js/Validform_v5.3.2.js"></script>
    <script type="text/javascript">
        $(function(){

            var demo=$(".registerform").Validform({
                tiptype:3,
                label:".label",
                showAllError:true,
                datatype:{
                    "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
                }
            });



            //通过$.Tipmsg扩展默认提示信息;
            //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
            demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";

            demo.addRule([{
                ele:".inputxt:eq(0)",
                datatype:"*"
            },
                {
                    ele:".inputxt:eq(1)",
                    datatype:"*"
                },

                {
                    ele:"select",
                    datatype:"*"
                }
            ]);


            $(".registerform").Validform({
                datatype:{
                    "phone":function(gets,obj,curform,regxp){
                        /*参数gets是获取到的表单元素值，
  obj为当前表单元素，
  curform为当前验证的表单，
  regxp为内置的一些正则表达式的引用。*/

                        var reg1=regxp["m"],
                                reg2=/[\d]{7}/,
                                mobile=curform.find(".mobile");

                        if(reg1.test(mobile.val())){return true;}
                        if(reg2.test(gets)){return true;}

                        return false;
                    }
                }
            });




        })



    </script>
    <!--收货地址所用js-->
    <script type="text/javascript">

        $(function(){
            $("#addresshtml").addClass("current");
            $(".mod_address_book .adr_list li").hover(function() {
                        if ($(this) !== $(".mod_address_book .adr_list li:last-child")) {
                            $(this).addClass("hover_li");
                            if ($(this).find(".using_add").length > 0 && $(this).find(".using_add").is(":visible")) {
                                $(this).find(".edit_box a").eq(1).hide();
                            }
                        }
                    },
                    function() {
                        if( $(this).attr("isDefault") == "false" ){
                            $(this).removeClass("hover_li");
                        }
                    });
        });
        function showTips(receiverId){
//            $("#tips_"+index).show();
            if($('#consignee_radio_'+receiverId).attr("isDefault") == 'true'){
                layer.alert('默认地址无法删除！', {icon: 7, title:'温馨提示'});
            }else{

                layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                            delReceiver(receiverId);
                            layer.close(index);
                        },
                        function(index){
                            layer.close(index);
                        });
            }
        }
        function hideTips(index){
            $("#tips_"+index).hide();
        }
//        function addAddress(type){
//            $.ajax({ url: "/ucenter/isLastAddress.action", type: "POST", cache: false,
//                success: function(data) {
//                    if(data == 1){
//                        $("#tips_full_"+type).show();
//                    }else{
//                        commonDialog(930,300,'true','添加收货地址','/ucenter/toAddAddress.action');
//                    }
//                }
//            });
//        }
//        function editAddress(id){
//            commonDialog(930,300,'true','编辑收货地址','/ucenter/editPtAddress.action?addressId='+id);
//        }
//        function deleteAddress(obj){
//            var addressid = obj;
//            $.ajax({ url: "/front/deleteAddress.action", type: "POST", cache: false, data: {"addressInfo.id":addressid},
//                success: function(data) {
//                    window.location.href = '/ucenter/acceptAddress.action';
//                }
//            });
//        }
//        function setDefault(obj){
//            var addressid = obj;
//            $.ajax({ url: "/front/setDefault.action", type: "POST", cache: false, data: {"addressInfo.id":addressid},
//                success: function(data) {
//                    location.href="/ucenter/acceptAddress.action";
//                }
//            });
//        }
//        function selectChange(){
//            window.location.href = "/ucenter/acceptAddress.action?province="+$("#province_current").val();
//        }

    </script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"ordercheck"
};
</script>
</head>
<body>
<#include "mall/jp/shortcut.ftl"/>
<style>
.header {padding: 20px 0 10px;}
#logo {padding-left: 5px;float: left}
.progress {padding-top: 6px;}
.progress .progress-1{background:url(${base}/static/mall/img/step1.png) no-repeat;width:481px;padding-top:23px;overflow:hidden;height:23px;}
.progress .progress-2 {background: url(${base}/static/mall/img/step2.png) no-repeat;width: 481px;padding-top: 23px;overflow: hidden;height: 23px;}
.progress ul {width:481px; float:right;}
.progress li {width:160px; height:23px; float:left; color:#bce8a3; line-height:23px; text-align:center;}
.progress li b {width:22px; height:25px; display:none; }
.progress li.step-1{color:#7abd54;}
.progress li.step-2{color:#aaaaaa;width:161px;}
.progress li.step-3{color:#aaaaaa;}
.progress li.complete b {background-position:0 -50px;}

</style>

<style>

#checkout {/*width:988px;*/ border:1px solid #ddd; margin-bottom: 20px; margin-top: 15px;}
#checkout .mt {height:28px; background-color:#f7f7f7;padding-top:7px;}
#checkout .mt h2 {padding-left:10px;font-size: 16px; font-weight: normal;}

.checkout-steps .step {border-top:1px solid #ddd;}

.checkout-steps .step-current {margin:-1px; border:2px solid #e02d2d; position:relative; margin-top: 2px;}
.checkout-steps .step-title {/*height:45px;*/ padding:0 20px; line-height:45px;position:relative;}
.checkout-steps .step-title strong {color:#999; font-size:14px;}
.checkout-steps .step-current .step-title strong, .checkout-steps .step-complete .step-title strong {color:#000;}
.checkout-steps .step-action {padding-left:10px; color:#005ea7; font-size:12px; font-weight:400;}
.checkout-steps .step-action a, .checkout-steps .step-action a:visited, .checkout-steps .step-action a:hover {color:#005ea7;}

.checkout-steps .sbox-wrap {padding:0 42px;}
.checkout-steps .sbox {overflow:hidden;}
.checkout-steps .sbox {padding:0px 0 20px;}
.checkout-steps .step-complete .sbox-wrap {padding:0 44px;}
.checkout-steps .s-content p {line-height:22px;}


.checkout-steps a.return-edit, .checkout-steps a.return-edit:visited {color: #005ea7;}
.checkout-steps a.return-edit, .checkout-steps a.return-edit:visited {color: #005ea7;}
.checkout-steps a.return-edit {float: right;font-size: 12px;font-weight: 400;padding-right: 24px;text-decoration: bottom;}

#checkout .invoice-content {line-height: 22px;}
.ftx-04 {color: #f60;}
.invoice-prompt dt {float: left;width: 60px;}
.invoice-prompt dd {float: left;}
#part-invoice .invoice-note {padding: 1px 0 5px 1px;color: #f60;}

.group {zoom: 1;}
.checkout-buttons {width:1185px; height:50px; background-color:#f5f5f5;position:relative; padding-right: 25px;}
.checkout-buttons .inner {padding-right: 18px;}
.checkout-buttons .checkout-submit {width: 135px;height: 36px;line-height: 100px;overflow: hidden;margin-top: 8px;}
.checkout-buttons .checkout-submit, .checkout-buttons .checkout-submit-disabled {margin-top: 5px;border: 0;float: right;cursor: pointer;}
.checkout-buttons .checkout-submit{background-color:#e00;position:relative;line-height:36px;overflow:hidden;color:#fff;font-weight:bold;font-size:16px;border-radius: 3px;}
.checkout-buttons .checkout-submit b{position:absolute;left:0;top:0;width:135px;height:36px;background:#db0000;cursor:pointer;overflow:hidden; border-radius: 3px;}
.checkout-buttons .checkout-submit:hover{background-color:#EF494D;}
.checkout-buttons .checkout-submit:hover b{background-position:0 -36px;}
.checkout-buttons .checkout-submit-disabled{background-color:#ccc;position:relative;line-height:36px;font-weight:bold;font-size:16px;cursor:not-allowed;}
.checkout-buttons .checkout-submit-disabled b{position:absolute;left:0;top:0;width:135px;height:36px;background:#db0000;cursor:not-allowed; border-radius: 3px;}
.checkout-buttons .total {padding-right: 18px;float: right;line-height: 50px;font-size: 14px;font-weight: 700;}
.checkout-buttons .total strong {color: #e4393c;font-size: 20px;vertical-align: middle;font-weight: normal;}

#order-cart {width:1120px;}
#order-cart .order-review {width:1120px; padding-top:5px;}
#order-cart .order-review table {border-collapse: collapse;border-spacing: 0;}
#order-cart .review-thead {width:100%;  border-top:2px solid #db0000;  border-right:1px solid #e8e8e8; border-left:1px solid #e8e8e8; }
#order-cart .review-thead td {height:40px; /*border-left:1px solid #e8e8e8;*/ color:#666; line-height:40px; text-align:center; background-color:#f5f5f5;}
#order-cart .review-thead .fore1 {}
#order-cart .review-thead .fore2 {width:120px;}
#order-cart .review-thead .fore3 {width:150px;}
#order-cart .review-thead .fore4 {width:100px;}

.order-summary {padding-top: 10px;overflow: hidden;zoom: 1;}
.order-summary .statistic {width: 300px;}
.order-summary .statistic .list {height: 24px;line-height: 24px;overflow: hidden;zoom: 1;}
.order-summary .statistic span {width: 180px;margin-right: 20px;float: left;text-align: right;}
.order-summary .statistic .price {color: #333333;float: left;width: 100px;text-align: right;}
.order-summary .statistic em {color: #e4393c;}

#order-cart .review-block .block-header {background-color: #ddefff;}
#order-cart .review-block .block-header {/*border-bottom: 1px solid #ddd;*/}

#order-cart .review-tbody {border-bottom: 1px dashed #ddd;padding: 10px 0 0 0;}
#order-cart .order-table {width:1118px;border-collapse: collapse;border-spacing: 0; height: 30px; line-height: 30px;}
#order-cart .order-table td {padding-left:1px;}
#order-cart .order-table .fore1 {width:400px; padding:0 10px;}
#order-cart .order-table .p-price {width:110px; padding-right:10px; text-align:center;}
#order-cart .order-table .p-sp {width:200px; padding-right:10px; text-align:center; float: left;}
#order-cart .order-table .p-promotion {width:150px; padding-top:5px;}
#order-cart .order-table .fore2 {width:100px; text-align:center;}
#order-cart .order-table .p-price strong {color:#333;}

#order-cart .p-goods {width:406px;}
#order-cart .p-goods {overflow:hidden; zoom:1;}
#order-cart .p-img {width:50px; height:50px; margin-right:5px; border:1px solid #ddd; padding:0; float:left; overflow:hidden;}
#order-cart .p-detail {width:346px; float:left; line-height:16px;}
#order-cart .p-detail .p-tip {width:60px; float:left; color:#c00;}
#order-cart .p-name {width:245px; height:32px; overflow:hidden; zoom:1;}
#order-cart .p-name a, #order-cart .p-name a:visited, #order-cart .p-name a:hover {color:#005ea7;}
#order-cart .p-more, #order-cart .p-extra {color:#999; line-height:20px;}
#order-cart .p-promotion {text-align:center;}

.p-name, .p-detail {word-break: break-all;word-wrap: break-word;}
.p-img, .p-name, .p-price, .p-market, .p-detail {overflow: hidden;}

</style>

<style>
#consignee .item, #part-invoice .item {height:28px; margin-bottom:5px; overflow:hidden; zoom:1; line-height:28px;}
#consignee .item label b{font-weight:normal;}
#consignee .item-selected label b{font-weight:bold;}
#consignee .item-selected, #part-invoice .item-selected {background-color:#ffefef;}
#consignee .item .hookbox, #part-invoice .item .hookbox {margin:7px 5px 0 8px; *margin:3px 2px 0 5px;}
#consignee-list .item-action {padding-left:20px; color:#999;}
#consignee-list .item-action a, #invoice-list .item-action a {margin:0 5px; color:#005ea7;}
#consignee-list .item-action a:visited, #consignee-list .item-action a:hover,
#invoice-list .item-action a:visited, #invoice-list .item-action a:hover{color:#005ea7;}


#consignee .list,.invoice-form .list{padding:5px 0;overflow:hidden;zoom:1}
#consignee .list .label,.invoice-form .list .label{width:85px;height:26px;margin-right:5px;float:left;color:#666;line-height:26px;text-align:right}
#consignee .list .label em,.invoice-form .list .label em{margin-right:5px;color:#f60;font-family:sans-serif}
#consignee .list .field{height:26px;float:left;line-height:26px}

#consignee .message,.invoice-form .message{border:1px solid #db9a9a;padding:4px 0;background-color:#ffe8e8}
#consignee .message .error,.invoice-form .error{height:26px;padding-left:6px;float:left;color:#c00;line-height:26px}
#consignee .message i,.invoice-form .message i{margin-right:5px;float:left;overflow:hidden;line-height:0;font-size:0}
#consignee .message .error i,.invoice-form .message .error i{width:16px;height:15px;margin-top:5px;background:url(${base}/static/mall/img/icon-error.gif) no-repeat}
#consignee .textbox,.invoice-form .textbox{width:138px;height:16px;border:1px solid #ccc;padding:4px 3px;font-family:Arial,"\5b8b\4f53",sans-serif}
#consignee input.focus,.invoice-form input.focus{border:1px solid #fdd253;background-color:#ffffe6}
#consignee .list-radio .hookbox,.invoice-form .list-radio .hookbox{vertical-align:top;margin:7px 5px 0 0}
#consignee .list-radio label,.invoice-form .list-radio label{margin-right:20px}
#consignee .select-address select,.invoice-form .select-address select{height:22px;margin:2px 5px 0 0}
#consignee .full-address .textbox,.invoice-form .full-address .textbox{width:308px}
#consignee .phone,.invoice-form .phone{float:left}
#consignee .phone span,#consignee .phone em,.invoice-form .phone span,.invoice-form .phone em{float:left}
#consignee .phone em,.invoice-form .phone em{padding:0 20px 0 5px;color:#999}
#consignee .phone span,.invoice-form .phone em{color:#666}

#consignee .form .form-tip {padding-left: 10px;float: left;}
#checkout .form-tip {color: #999;}

#consignee .form-btn {height: 30px;padding-top: 4px;}

#checkout a.btn-submit, #checkout a.btn-submit:visited, #checkout a.btn-submit:hover {color:#fff; text-decoration:none;}
#checkout .btn-submit {height:30px; margin-right:10px; padding-left:20px; float:left; line-height:30px; font-size:14px; font-weight:700;background:#db0000; border-radius: 3px;}
#checkout .btn-submit span {height:30px; padding-right:20px; float:left; cursor:pointer;background:#db0000;border-radius: 3px;}
#checkout .btn-submit:hover {height:30px; margin-right:10px; padding-left:20px; float:left; line-height:30px; font-size:14px; font-weight:700;background:#ed4548;}
#checkout .btn-submit:hover span {height:30px; padding-right:20px; float:left; cursor:pointer;background:#ed4548;}
#invoice-edit-div div{line-height: 34px;}
ul{padding: 0; margin: 0; overflow: hidden;}
.items{line-height: 34px;}
.items:after{display: block;  overflow: hidden;  clear: both;  height: 0;  line-height: 0;  font-size: 0;}
.items li{float: left; letter-spacing: 3px; cursor: pointer; line-height: 34px; margin-top: 3px;}
.btn{color:#ffffff; background: #e54044; padding: 5px 10px 5px 10px;}
.items .radioitem{padding:5px 10px; margin: 0 10px; height: 18px; line-height: 18px; margin-top: 3px;}
.items .selected{border: #f43838 solid 1px; padding: 3px 8px; height: 18px; line-height: 18px;}
.radioitem{border: #E8E8E8 solid 1px; padding: 3px 8px; height: 18px; line-height: 18px;}
.items .item-title{font-weight: bold; padding: 5px; height: 18px; line-height: 18px;}
.items b{font-size: 10px; height: 18px; line-height: 18px; color: #ff3300; margin-left: 3px;}
</style>

<style>
#payment-ship .mc {overflow: visible;}
#payment-ship .item {overflow: hidden;zoom: 1;line-height: 28px;}
#payment-ship .item-selected {background-color:#ffefef;}

#payment-ship .item .label {width: 120px;float: left;}
#payment-ship .item .hookbox {margin: 7px 5px 0 8px;}

#payment-ship .item .field {float: left;max-width: 680px;_width: 680px;}
#payment-ship .item .tip {padding: 0 5px 0 0;color: #999;background: none;border: none;position: static;z-index: inherit;box-shadow: 0;}



#delivery-time {padding-top:0px;}
#delivery-time .left {float: left;width: 110px;}
#delivery-time .middle {float: left;width: 550px;}
#delivery-time .label {width:110px;margin-right:5px; line-height:24px; /*text-align:right;*/float: left;}
#delivery-time .field {float: left;width:500px;}
#delivery-time .hookbox {margin:6px 5px 0 8px; *margin:1px 2px 0 5px;}
/* 商家名称 */
.sj-name{height: 40px; line-height: 40px; width: 1100px; margin: 0 auto; padding-left: 18px; font-size: 14px; font-weight: bold; background: #fff6f6;border-left:1px solid #e8e8e8; border-right:1px solid #e8e8e8; border-top:1px solid #e8e8e8;}
.sj-ps{paddin-left: 18px; padding-top: 10px; padding-bottom: 15px !important;}
.sj-ps textarea{font-size: 12px;}
.sp-list{border: 1px solid #dddddd; padding-bottom: 10px;}

/*收货地址*/
.del_adr{background: url(${base}/static/mall/jp/img/ico_01.png) no-repeat;}
.mod_address_book .adr_list .li_add_addr .btn_add_addr i{    background: url(${base}/static/mall/jp/img/ico_01.png) no-repeat;}
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
.pop_close {background:url(${base}/static/mall/jp/img/ico_address.png) no-repeat;}
.mod_address_book .adr_list li {margin: 0 26px 10px 0;width: 260px;height: 173px;float: left;position: relative;background-position: left -176px;}
.mod_address_book .adr_list li .using_add {width: 28px;height: 28px;position: absolute;right: 0; bottom:0;text-indent: -9999px;background-position: left -360px;}
.mod_address_book .adr_list li.last{ margin-right:0;}
.mod_address_book .adr_list .hover_li,
.mod_address_book .adr_list .address_on { background-position: left top;}
.mod_address_book .adr_list .hover_li .edit_box {display: block;}
.mod_address_book .adr_list li .vcard {margin: 15px 20px 0 23px;}
.mod_address_book .adr_list li .vcard p {line-height: 19px;margin-bottom: 5px;}
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
#popupdiv select { border: 1px solid #e6e6e6;height: 33px;line-height: 33px;width: 110px; border-radius: 0;background: #fff; margin-right:5px;
 }
input.bule_btn{background: #db0000;font-size: 14px; border:0; color:#fff;font-weight: bold;cursor: pointer;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; height:36px!important; line-height:36px!important; border:0!important;cursor: pointer!important;}
input.bule_btn:hover{ background:#ed4548;color:#fff;}
/*******弹出层 common********/
#popupdiv{width:698px;height:420px;position:fixed;z-index:1000; background:#fff;border: 1px solid #db0000; }
.pop_win { width: 700px; background-color: #fff;   line-height: 1.5; color: #666; margin-top:0; }
.title_div { background-color: #db0000; color: #fff; font-size: 14px; font-weight: bold; width:100%; line-height: 35px; float:left;}
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

/*li.address_on .btn_set_common {*/
    /*display :none!important;*/
/*}*/


	/* 表单验证 */
.Validform_checktip{
    margin-left:8px;
    line-height:20px;
    height:20px;
    overflow:hidden;
    color:#999;
    font-size:12px;
}
.Validform_right{
    color:#71b83d;
    padding-left:20px;
    background:url(${base}/static/mall/jp/img/right.png) no-repeat left center;
}
.Validform_wrong{
    color:red;
    /*padding-left:20px;*/
    white-space:nowrap;
    /*background:url(${base}/static/mall/jp/img/error.png) no-repeat left center;*/
}
.Validform_loading{
    padding-left:20px;
    background:url(${base}/static/mall/jp/img/onLoad.gif) no-repeat left center;
}
.Validform_error{
    background-color:#ffe7e7;
}
#Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
#Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
#Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#000;}
#Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
#Validform_msg a.Validform_close:hover{color:#cc0;}
#Validform_msg .Validform_info{padding:8px;border:1px solid #000; border-top:none; text-align:left;}
</style>

<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/jp/img/logo.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="progress clearfix">
		<ul class="progress-2">
			<li class="step-1"><b></b>1.我的购物车</li>
			<li class="step-2">2.填写核对订单信息</li>
			<li class="step-3">3.成功提交订单</li>
		</ul>
	</div>
	<div class="clr"></div>
</div>
<div id="checkout" class="content">
	<div class="mt">
        <h2>填写并核对订单信息</h2>
    </div>
    <div id="wizard" class="checkout-steps">
    	<form id="orderCheckInfo">
    		<input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
            <input type="hidden" id="order_receiverId_back" name="order_receiverId_back" value="${receiver.id}"><!--当新增窗口打开时会清空 order_receiverId的值  新增打开什么都不做 用此处还原之前的选择 -->
    		<#--<input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">-->
            <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethodIds}">

    		<input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
            <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
            <#--<input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeList[0].introduce}">-->
            <input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeIds}">
            <input type="hidden" id="order_deliveryTimeName" name="order_deliveryTimeName" value="${deliveryTimeName}">
            <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->
    		<input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as map><#list map.items as cartItem>${cartItem.id},</#list></#list>">

            <!--当选择配送方式时存放快递ID  Auth:zhangqiang Time:2015-09-25 17:41:35 Start -->
			<input type="hidden" id="deliveryId" name="deliveryId" value="">
            <!--当选择配送方式时存放快递ID Auth:zhangqiang Time:2015-09-25 17:41:35 End -->
            <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 Start -->
            <input type="hidden" id="platform" name="platform" value="2">
            <input type="hidden" id="dataFrom" name="dataFrom" value="1">
            <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 End -->

            <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
            <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
            <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>
    	</form>

    	<div id="step-1" class="step step-complete">
            <div class="columnright">
			<div class="step-title">
                <div class="mod_address_book">
                    <div id="addressListDiv" class="addressListDiv">
                        <input type="hidden" value="1" id="size">
                        <input type="hidden" id="addressNum_top" value="${receiverList?size}">
                        <ul class="adr_list" id="consignee-list">
                        <#list receiverList as receiver>
                            <li class="<#if receiver.isDefault==1>address_on hover_li</#if>" id = "consignee_radio_${receiver.id}" onclick="chooseCurrAddress('${receiver.id}')" isDefault="<#if receiver.isDefault==1>true<#else>false</#if>">
                                <p class="using_add"> 默认地址 </p>
                                <div class="vcard">
                                    <p> <strong>${receiver.name} </strong>&nbsp;&nbsp;&nbsp;收 </p>
                                    <p class="adr"> <span class="street-address"> <strong class="locality"> ${receiver.areaName} </strong> <span class="street-address">${receiver.address}</span> </p>
                                    <p class="tel">  ${receiver.mobile}&nbsp;&nbsp;&nbsp; ${receiver.phone}</p>
                                    <p >  ${receiver.email} </p>
                                    <p > ${receiver.zipCode} </p>
                                </div>
                                <div class="edit_box clearfix">
                                    <button class="del_adr" title="删除地址" onClick="showTips('${receiver.id}');"> 删除 </button>
                                    <a class="aBlu btn_edit" href="javascript:void(0)" id="show" onClick="show_ConsigneeDetail('${receiver.id}')">编辑</a>
                                    <#if receiver.isDefault==1>
                                        <a id="addrDefault" class="btn_set_common" href="javascript:void(0)" onClick="setDefault('${receiver.id}')">默认地址</a>
                                    <#else>
                                        <a class="btn_set_common" onClick="setDefault('${receiver.id}')" href="javascript:void(0)">设置默认地址</a>
                                    </#if>
                                <div class="tips_del" id="tips_${receiver.id}">
                                    <p class="txt"> 确认删除该收货地址吗？ </p>
                                    <div class="btn_box">
                                        <button onClick="delReceiver('${receiver.id}')" class="btn_sure"> <span>确认</span> </button>
                                        <button class="btn_cancle" onClick="hideTips('${receiver.id}');"> <span>取消</span> </button>
                                    </div>
                                </div>
                            </li>
                        </#list>
                            <li type="2" id="address_list_li_3" class="li_add_addr add_adr saveAddress last" isDefault="false">
                                <p> <a class="btn_add_addr"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新收货地址</a> </p>
                                <div class="tips_care" id="tips_full_2">
                                    <p> 地址已满6条，无法再添加新地址 </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
				</div>
			</div><!--step-title end-->
			</div>

		<div id="step-2" class="step step-complete"><a name="payAndShipFocus"></a>
    		<div class="step-title">
				<div id="save-payAndShip-tip" class="step-right"></div>
				<strong>支付及送货时间</strong>
				<span class="step-action" id="payment-ship_edit_action">
					<a href="javascript:void(0);" id="editPayAndShip" onclick="edit_Payment(false)">[修改]</a>
					<a href="javascript:void(0);" id="savePayAndShipTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_PayAndShip()">保存支付及配送方式</a>
				</span>
			</div><!--step-title end-->
			<div class="step-content sbox-wrap">
				<div class="sbox">
					<div class="s-content payment-info" id="payAndShip-content">
						<div class="payment-selected">
							${paymentMethod.name}
						</div>
						<div class="way-list">
							<div class="way-item">
								 <label class="delivery-selected">${deliveryTimeName}</label>&nbsp;&nbsp;<span id="promisetip"><font color="#FF6600;">预计&nbsp;7日内&nbsp;送达</font></span> &nbsp;
							</div>
						</div>
					</div><!--payAndShip-content end-->
					
					<div class="hide" id="payAndShip-edit-div">
						<div id="payment-ship" style="position: static;">
							<div class="payment">
								<h3>支付方式</h3>
								<div style="padding-bottom:10px"></div>
								<div class="mc form">
                                <#list paymentMethodList as payment>
                                    <#if paymentMethodIds ??>
                                        <div class="item <#if payment.id==paymentMethodIds>item-selected</#if>" style="height: 28px;">
                                            <div class="label">
                                                <input type="radio" name="payment" <#if payment.id==paymentMethodIds>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" id="pay-method-${payment.id}" class="hookbox" value="${payment.id}">
                                                <label id="pay-method-label-${payment.id}" for="pay-method-${payment.id}">${payment.name}</label>
                                            </div>
                                            <div class="field">
                                                <span class="tip">${payment.description}</span>
                                            </div>
                                            <span class="clr"></span>
                                        </div>
                                    <#else >
                                        <#if payment.enabled == 1>
                                            <div class="item <#if payment_index==0>item-selected</#if>" style="height: 28px;">
                                                <div class="label">
                                                    <input type="radio" name="payment" <#if payment_index==0>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" id="pay-method-${payment.id}" class="hookbox" value="${payment.id}">
                                                    <label id="pay-method-label-${payment.id}" for="pay-method-${payment.id}">${payment.name}</label>
                                                </div>
                                                <div class="field">
                                                    <span class="tip">${payment.description}</span>
                                                </div>
                                                <span class="clr"></span>
                                            </div>
                                        </#if><!--item end-->
                                    </#if>

                                </#list>
								</div><!--mc end-->
							</div><!--payment end-->
							
							<div id="shipment" style="padding-top:10px;">
								<#--<h3>配送方式</h3>
								<div style="padding-bottom:10px"></div>
								<#list deliveryMethodList as delivery>
								<div class="item <#if delivery_index==0>item-selected</#if>" style="height: 28px;">
									<div class="label">
										<!--当选择配送方式时刷新页面 选择的值不变 Auth:zhangqiang Time:2015-09-25 17:41:35 Start &ndash;&gt;
										<!--<input type="radio" name="delivery" <#if delivery_index==0>checked</#if> onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}" class="hookbox" value="${delivery.id}">&ndash;&gt;
                                        <input type="radio" name="delivery" <#if (didFlag==0 && delivery_index==0) || (delivery.id==didFlag)>checked</#if> onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}" class="hookbox" value="${delivery.id}">
                                        <!--当选择配送方式时刷新页面 选择的值不变 Auth:zhangqiang Time:2015-09-25 17:41:35 End &ndash;&gt;
										<label id="delivery-method-label-${delivery.id}" for="delivery-method-${delivery.id}">${delivery.name}</label>
									</div>
									<div class="field">
										<span class="tip">${delivery.description}</span>
									</div>
									<span class="clr"></span>
								</div><!--item end&ndash;&gt;
								</#list>-->
								<div id="delivery-time">
									<div class="left">
										<span class="label"><h3>送货时间</h3></span>
									</div>
									<div class="middle">
										<#list deliveryTimeList as deliveryTime>
										<div class="field">
                                            <#if deliveryTimeIds??>
                                                <input id="delivery-t3" name="delivery-t" <#if deliveryTimeIds==deliveryTime.id>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.id}');$('#order_deliveryTimeName').val('${deliveryTime.introduce}');$('.delivery-selected').html('${deliveryTime.introduce}');">
                                            <#else >
                                                <input id="delivery-t3" name="delivery-t" <#if deliveryTime_index==0>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.id}');$('#order_deliveryTimeName').val('${deliveryTime.introduce}');$('.delivery-selected').html('${deliveryTime.introduce}');">
                                            </#if>
                                        ${deliveryTime.introduce}
										</div>
										</#list>
									</div>
								</div><!--delivery-time end-->
							</div><!--shipment end-->
							<span class="clr"></span>
							<div class="form-btn group">
								<a href="javascript:void(0);" class="btn-submit" onclick="save_PayAndShip()"><span>保存支付及配送方式</span></a>
							</div>
						</div><!--payment-ship end-->
					</div><!--payAndShip-edit-div end-->
								
				</div>
			</div><!--step-content end-->
		</div><!--step-2 end-->
		
		<div id="step-3" class="step step-complete"><a name="invoiceFocus"></a>
			<div class="step-title">
				<div id="save-invoice-tip" class="step-right"></div>
				<strong>发票信息</strong>
				<span class="step-action" id="part-invoice_edit_action">
					<a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
					<a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_Invoice()">保存发票信息</a>
				</span>
			</div><!--step-title end-->
			<div class="step-content">
				<div id="part-invoice" class="sbox-wrap">
					<div class="sbox">
						<div class="invoice" id="invoice-content">
							<div class="invoice-content">
								发票类型：<span id="invoiceInfo"><#if invoiceInfo.invoiceContent=="no">不开发票<#else><#if invoiceInfo.invoiceType=="normal">普通发票</#if>&nbsp;&nbsp;${invoiceInfo.invoiceTitle}&nbsp;&nbsp;<#if invoiceInfo.invoiceContent=="infos">明细</#if></#if>&nbsp;&nbsp;</span>
							</div>
						</div>
						
						<div class="form hide" id="invoice-edit-div">
							<div><strong>发票信息</strong></div>
							<div><ul class="items"><li class="item-title">发票类型：</li><li class="radioitem <#if invoiceInfo.invoiceType=="normal">selected</#if>" type="invoiceType" value="normal">普通发票</li></ul></div>
                            <div><ul class="items"><li class="item-title">发票抬头：</li><#list memberInvoicesList as invoice><li class="radioitem invoiceTitel <#if invoice.invoiceTitle==memberInvoice.invoiceTitle>selected</#if>" type="invoiceTitle" id="${invoice.id}" value="${invoice.invoiceTitle}"><a href="javascript:;" title="双击修改">${invoice.invoiceTitle}</a><b onclick="deleteInvoice('${invoice.id}','${invoice.invoiceTitle}','${invoice_index}');">X</b></li></#list></ul></div>
                            <div><ul class="items"><li class="hide addnew"><label for="title"><strong><span id="action">新增</span>发票抬头：</strong></label><input type="text" name="title" id="title" style="margin-top: 7px; width: 300px;"/><input type="hidden" name="id" id="id" value=""/></li><li>&nbsp;&nbsp;<a href="javascript:;" class="closeaddnew btn" onclick="addInvoiceTitle();">新增</a>&nbsp;<a href="javascript:;" class="hide addnew btn" onclick="saveInvoiceTitle();">保存</a>&nbsp;<a href="javascript:;" class="hide addnew btn" onclick="closeaddInvoiceTitle();">关闭</a></li></ul></div>
                            <div><ul class="items"><li class="item-title">发票内容：</li><li class="radioitem <#if invoiceInfo.invoiceContent=="no">selected</#if>" type="invoiceContent" value="no">不开发票</li><li class="radioitem <#if invoiceInfo.invoiceContent=="infos">selected</#if>" type="invoiceContent" value="infos">明细</li></ul></div>
                            <div class="form-btn group">
                                <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="btn-submit" onclick="save_Invoice()" style="margin-top: 10px;"><span>保存发票信息</span></a>
                            </div>
                        </div><!--payAndShip-edit-div end-->
					</div>
				</div><!--part-invoice end-->
			</div><!--step-content end-->
		</div><!--step-3 end-->
    	
    	<div id="step-4" class="step step-complete">
    		<div class="step-title">
    			<a href="${base}/cart/list" id="cartRetureUrl" class="return-edit">返回修改购物车</a><strong>商品清单</strong>
    		</div><!--step-title end-->
    		<div class="step-content">
    			<div id="part-order" class="sbox-wrap">
    				<div class="sbox">
    					<div id="order-cart">
    						<div class="order-review"><!--商品清单展示-->
                                <form id="orderGoodsForm">
    							<span id="span-skulist">
    								<table class="review-thead">
										<tbody>
											<tr>
												<td class="fore1">商品</td>
												<td class="fore2">商城价(元)</td>
												<td class="fore3">优惠(元)</td>
												<td class="fore4">数量</td>
												<td class="fore4">库存状态</td>
											</tr>
										</tbody>
									</table>
									<div class="review-body" >
										<div class="review-block review-present">
											<div class="block-header">
												<!--满赠信息-->
											</div>
										</div>

										<#assign total = 0>
                                        <#assign totalPrice = 0>
                                        <#assign discount = 0>
                                        <#assign deliveryFee = 0>
										<#list cartItemList as map>
										<#-- 添加商家名称 TianYu 2015-8-19  -->
										<div class="sj-name">
											<label for="shopcheck"><img src="${base}/static/img/dp_icon.png"> <a href="${base}/shop/${map.shopUrl}.html">${map.shopName}</a></label><br>
										</div>
										<#-- 遍历商品 TianYu 2015-8-19  -->
										<div class="sp-list">
										 <#assign totalPrice = totalPrice+(map.goodsTotal?number)>
										 <#assign discount = discount+(map.discount?number)>
										 <#assign deliveryFee = deliveryFee+(map.deliveryFeeTotal?number)>
											<#list map.items as cartItem>
                                        <#--<#list cartItemList as cartItem>-->
                                       <#-- <#assign totalPrice = totalPrice+(cartItem.price?number)*cartItem.quantity>-->
                                        <#assign total = total+cartItem.quantity>
                                        <!--购物车单品商品-->
										<div class="review-tbody">
											<table class="order-table">
												<tbody>
													<tr >
														<td class="fore1" style=" padding-bottom: 10px;">
															<div class="p-goods">
																<div class="p-img">
																	<a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img height="50" width="50" alt="" src="${cartItem.pic}"></a>
																</div>
																<div class="p-detail">
																	<div class="p-name">
																		<a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a>
																	</div>
																	<#--<div class="p-more">-->
																		<#--商品编号：${cartItem.sn}<br>-->
																	<#--</div>-->
																</div>
															</div>
														</td>
														<td class="p-sp">${cartItem.specification}</td>
														<td class="p-price"><strong>￥${cartItem.price}</strong></td>
														<td class="p-promotion">等级优惠：${(cartItem.price?number * memberRankScale?number)?string('currency')}</td>
														<td class="fore2">x ${cartItem.quantity}</td>
														<td class="fore2 p-inventory" skuid="${cartItem.goodsId}">有货</td>
													</tr>
													<tr>
														<td class="sj-ps" colspan="6" style="vertical-align: top; border-top: 1px dashed #dddddd; background: #f3f3f3; padding-bottom: 10px;"><font style=" margin-left: 10px;vertical-align:20px; ">给卖家留言：</font><textarea id="ps_${cartItem.goodsId}" name="ps_${cartItem.goodsId}" style="width: 1000px;resize: none;margin-top: 10px; color: #585757;" maxlength="100" placeholder="选填：对本次交易的说明（建议填写已经和卖家达成一致的说明）"></textarea></td>
													</tr>
												</tbody>
											</table>
										</div>
										</#list>
                                        </div>
										<#-- 运费按店铺收取 TianYu 2015-8-19  -->
                                            <div style="text-align: right;">
                                                <table class="order-table">
                                                    <tbody>
                                                    <tr>
                                                        <td class="fore1">
                                                            商品合计:&nbsp;&nbsp;&nbsp;${map.goodsTotal?string('currency')}
                                                        </td>
                                                        <td style="width: 200px;">
                                                            优惠合计:&nbsp;&nbsp;&nbsp;${map.discount?string('currency')}
                                                        </td>
                                                        <td style="text-align: right;width: 200px;">运费：${map.deliveryFeeTotal?string('currency')}</td>
                                                        <td  style="text-align: right;">店铺合计:</td>
                                                        <td class="fore2 p-inventory"  style="text-align: right;width: 120px;" >${map.shopTotal?string('currency')}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
										</#list>
									</div>
    							</span>
                                    </form>
    							<div class="order-summary">
									<div class="statistic fr">
										<div class="list">
											<span><em id="span-skuNum">${total}</em> 件商品，总商品金额：</span><em class="price" id="warePriceId" v="${totalPrice?string('currency')}">${totalPrice?string('currency')}</em>
										</div>
                                        <div class="list">
											<span>优惠合计：</span>
                                            <em class="price" id="warePriceId" v="${totalPrice?string('currency')}">${discount?string('currency')}</em>
										</div>
										<div class="list" style="display:none;">
											<span>返现：</span><em class="price" id="cachBackId" v="0.00"> -￥0.00</em>
										</div>
										<div class="list" id="showFreightPrice" style="padding-left:140px;">
											<span id="freightSpan" style="width:40px;">运费：</span> 
											<em class="price" id="freightPriceId"> ${deliveryFee?string('currency')}</em>
										</div>
										<div class="list" id="showCouponPrice" style="display:none;">
											<span>优惠券：</span><em class="price" id="couponPriceId">-￥0.00</em>
										</div>
										<div class="list">
											<span>应付总额：</span><em id="sumPayPriceId" class="price"> ${(totalPrice + deliveryFee - discount)?string('currency')}</em>
										</div>
									</div>
									<div class="span clr"></div>
								</div>
							</div>
    					</div>
    				</div>
    			</div>
    			<div id="checkout-floatbar" class="checkout-buttons group">
					<div class="sticky-wrap">
						<div class="inner">
							<button type="submit" class="checkout-submit" id="order-submit" onclick="javascript:submit_Order();">提交订单</button>
							<span class="total">应付总额：<strong id="payPriceId">${(totalPrice + deliveryFee - discount)?string('currency')}</strong>元 </span>
						</div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
	<div class="clr"></div>
</div>
<!-- 弹出层 -->
<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <form class="registerform" onsubmit="return false">
        <input type="hidden" id="consignee_form_id">
        <input type="hidden" id="isReceiverSubmit" value="false">
        <div class="pop_win aptab_center_address">
            <ul class="newaddress">
                <li>
                    <label> <strong style="color: red;">*</strong> 收&nbsp;&nbsp;货&nbsp;&nbsp;人： </label>
                    <input type="text" id="consignee_name"  name="consigneeParam.name" value="" class="inputxt" maxlength="20" nullmsg="请填写收货人！">
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                    <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                    <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                    <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="26"  class="inputxt" style="word-wrap: break-word; word-break: break-all; " >
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                    <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile" style="width:90px;" >
                    &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                    <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel"  >
                    <span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>
                <#--&nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>-->
                <#--<input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel" style="width: 110px;" ignore="ignore" datatype="phone" errormsg="固电格式如:区号-固话 029-88888888！" >-->
                </li>
                <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                    <label for="set_normal" class="label_set_normal">
                        <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                        设为默认地址 </label>
                </li>
                <li>
                    <label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>
                    <input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;" ignore="ignore" datatype="e" errormsg="邮箱格式错误！">
                </li>
                <li>
                    <label> <strong style="color:#fff;">*</strong> 邮政编码： </label>
                    <input type="text" id="consignee_zipCode" name="consigneeParam.zipCode" value="" id="zipCode_div" style="width:200px;">
                    <span class="form-tip"><span style="color: #ec0202;" id="zipCode_div_error"></span></span>
                </li>
                <li>
                    <input type="submit" value="保 存" onclick="save_Consignee()"  class="btn_save  bule_btn" /> <span id="saveConsigneeTitleDiv"></span>
                </li>
            </ul>
        </div>
    </form>
</div>
<#include "mall/jp/service.ftl"/>
<#include "mall/jp/footer.ftl"/>
<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/order.common.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/order.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    /*宽屏设置*/
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

    $(function () {
        $(".areaSelect").val("");
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        $(".items").on('click','.radioitem',function(){
            $("#"+$(this).attr("type")).val($(this).attr("value"));
            $(this).parent().find(".radioitem").removeClass("selected");
            $(this).addClass("selected");
        });
        $(".items").on('dblclick','.invoiceTitel',function(){
            editInvoice($(this).find("a").text(),$(this).attr("id"));
        });
    });

    /**
     * 编辑支付与配送方式
     */
    function edit_Payment(flag) {
        $("#step-2").addClass("step-current");

        $("#editPayAndShip").hide();
        $("#savePayAndShipTitleMinDiv").show();
        $("#payAndShip-content").hide();
        $("#payAndShip-edit-div").show();

    }

    /**
     * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 Start
     */
    function save_PayAndShip() {
        var order_deliveryTimeName = $("#order_deliveryTimeName").val();
        var paymentMethodId=$("#order_paymentMethodId").val();
        var deliveryTimeId=$("#order_deliveryTime").val();
        var paymentMethodLabel=$("#pay-method-label-"+paymentMethodId).html();
        $(".payment-selected").html(paymentMethodLabel);

        var deliveryMethodId=$("#order_deliveryMethodId").val();
        var deliveryMethodLabel=$("#delivery-method-label-"+deliveryMethodId).html();
        $(".delivery-selected").html(deliveryMethodLabel);

        $("#step-2").removeClass("step-current");
        $("#editPayAndShip").show();
        $("#savePayAndShipTitleMinDiv").hide();
        $("#payAndShip-content").show();
        $("#payAndShip-edit-div").hide();

        var deliveryId = $("#deliveryId").val();
        if (!isEmpty(deliveryId)) {
            window.location.href = "${base}/member/ordercheck?o="+$("#order_cartItemIds").val()+"&deliveryId="+deliveryId+"&paymentMethodId="+paymentMethodId+"&deliveryTimeId="+deliveryTimeId+"&order_deliveryTimeName="+order_deliveryTimeName;
        }
    }
    /**
     * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 End
     */

    /**
     * 选择支付方式
     */
    function chosePayment(id) {
        $("#order_paymentMethodId").val(id);
        if (obj != null) {
            var e = $(obj);
            e.parent().parent().addClass('item-selected');
            e.parent().parent().siblings().removeClass('item-selected');
        }
    }

    /**
     * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 Start
     */

    function choseDelivery(id) {
        $("#deliveryId").val(id);
        /*
    $("#order_deliveryMethodId").val(id);
    var payArr = $("[id^='delivery-method-']");
    for(var i = 0 ;i < payArr.length ;i++){
        $(payArr[i]).parent().parent().removeClass("item-selected");
        if(id==$(payArr[i]).val()){
            $(payArr[i]).parent().parent().addClass("item-selected");
        }
    }


    // 动态计算配送费用
    $.ajax({
        type: "post",
        url: "${base}/member/countDeliveryFee",
        data:$("#orderCheckInfo").formSerialize(),
        dataType: "json",
        success: function (data) {
            $("#freightPriceId").text("￥" + data.toFixed(2));
            var deliveryFee = data.toFixed(2);
            var goodsTotalFee = $("#warePriceId").attr("v");
            var total = parseFloat(deliveryFee) + parseFloat(goodsTotalFee);
            $("#sumPayPriceId").text("￥" + total.toFixed(2));
            $("#payPriceId").text("￥" + total.toFixed(2));
        }
    });*/
    }
    /**
     * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 End
     */


    /**
     * 编辑发票信息
     */
    function edit_Invoice() {
        $("#step-3").addClass("step-current");
        $("#editInvoice").hide();
        $("#saveInvoiceTitleMinDiv").show();
        $("#invoice-content").hide();
        $("#invoice-edit-div").show();
    }


    /**
     * 删除发票抬头
     * */
    function deleteInvoice(id,invoiceTitle,indexNum){
        if(indexNum == '0'){
            layer.alert('默认发票抬头无法删除！', {icon: 7, title:'温馨提示'});
        }else{
            layer.confirm('您确定要删除[' + invoiceTitle + ']这个发票抬头吗？删除后将不可恢复。', {icon: 3, title:'温馨提示'}, function(index){
                $.ajax({
                    type: "post",
                    url: "${base}/member/deleteInvoice",
                    data: "id=" + id,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            $("#" + id).remove();
                            layer.msg(data.msg, {icon: 6});
                        } else {
                            layer.msg(data.msg, {icon: 5});
                        }
                    }
                });
                layer.close(index);
            })
        }

    }

    /**
     * 保存发票内容
     */
    function save_Invoice() {
        if($("#invoiceContent").val()=="no") {
            $.ajax({type: "post",
                url: "${base}/member/saveInvoiceSetting",
                data:"invoiceContent=no",
                dataType: "json",
                success:function(data){
                    if(data.success){
                        layer.msg(data.msg, {icon: 6});
                        $("#invoiceInfo").text($(".selected[type='invoiceContent']").text());
                        $("#invoiceType").val("");
                        $("#invoiceTitle").val("");
                        $("#invoiveContent").val("no");
                        closeInvoiceForm();
                    }else{
                        layer.msg(data.msg, {icon: 5});
                    }
                }
            });
        }else{
            if($(".selected[type='invoiceType']").text()==""){
                layer.alert("请选择发票类型！", {icon: 5, title:"温馨提示"});
            }else if($(".selected[type='invoiceTitle']").text()==""){
                layer.alert("请选择发票抬头！", {icon: 5, title:"温馨提示"});
            }else {
                $.ajax({
                    type: "post",
                    url: "${base}/member/saveInvoiceSetting",
                    data: "invoiceTitle=" + $(".selected[type='invoiceTitle'] a").text() + "&id=" + $(".selected[type='invoiceTitle']").attr("id") + "&invoiceContent=" + $(".selected[type='invoiceContent']").text(),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            layer.msg(data.msg, {icon: 6});
                            var info = $(".selected[type='invoiceType']").text() + "　　" + $(".selected[type='invoiceTitle'] a").text() + "　　" + $(".selected[type='invoiceContent']").text();
                            $("#invoiceInfo").text(info);
                            closeInvoiceForm();
                        } else {
                            layer.msg(data.msg, {icon: 5});
                        }
                    }
                });
            }
        }
    }

    function closeInvoiceForm(){
        $("#step-3").removeClass("step-current");
        $("#editInvoice").show();
        $("#saveInvoiceTitleMinDiv").hide();
        $("#invoice-content").show();
        $("#invoice-edit-div").hide();
    }

    function addInvoiceTitle(){
        $("#action").text("新增");
        $(".addnew").show();
        $(".closeaddnew").hide();
    }
    function closeaddInvoiceTitle(){
        $(".addnew").hide();
        $(".closeaddnew").show();
        $("#title").val("");
        $("#id").val("");
    }

    function editInvoice(title,id){
        $("#id").val(id);
        $("#title").val(title);
        $("#action").text("修改");
        $(".addnew").show();
        $(".closeaddnew").hide();
    }

    function saveInvoiceTitle(){
        if($("#title").val()==""){
            layer.alert("发票抬头不能为空！", {icon: 5, title:"温馨提示"});
            $("#title").focus();
        }else{
            if($("#id").val()!=""){
                if($("#title").val()!=$("#"+$("#id").val()+" span").text()){
                    var ishave = false;
                    $(".radioitem[type='invoiceTitle']").each(function () {
                        if ($("#title").val() == $(this).find("a").text() && $("#id").val()!=$(this).attr("id")) {
                            layer.alert("该发票抬头已经存在！", {icon: 2, title:"温馨提示"});
                            ishave = true;
                        }
                    });
                    if (!ishave) {
                        $.ajax({
                            type: "post",
                            url: "${base}/member/editInvoice",
                            data: "invoiceTitle=" + $("#title").val() + "&id=" + $("#id").val(),
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    layer.msg(data.msg, {icon: 6});
                                    $("#" + $("#id").val() + " a").text($("#title").val());
                                    $("#invoiceTitle").val($("#title").val());
                                    closeaddInvoiceTitle();
                                } else {
                                    layer.msg(data.msg, {icon: 5});
                                }
                            },
                            error: function () {
                                layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                            }
                        })
                    }
                }else{
                    closeaddInvoiceTitle();
                }
            }else {
                var ishave = false;
                $(".radioitem[type='invoiceTitle']").each(function () {
                    if ($("#title").val() == $(this).find("a").text()) {
                        layer.alert("该发票抬头已经存在！", {icon: 5, title:"温馨提示"});
                        ishave = true;
                    }
                });
                if (!ishave) {
                    $.ajax({
                        type: "post",
                        url: "${base}/member/saveInvoice",
                        data: "invoiceTitle=" + $("#title").val(),
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                layer.msg(data.msg, {icon: 6});
                                $(".radioitem[type='invoiceTitle']").removeClass("selected");
                                var html = "<li class=\"radioitem invoiceTitel selected\" type=\"invoiceTitle\" id=\""+data.id+"\" value=\"" + $("#title").val() + "\"><a href=\"javascript:;\" title=\"双击修改\">" + $("#title").val() + "</a><b onclick=\"deleteInvoice('" + data.id + "','" + $("#title").val() + "');\">X<b></li>";
                                $(".radioitem[type='invoiceTitle']").parent().append(html);
                                $("#invoiceTitle").val($("#title").val());
                                closeaddInvoiceTitle();
                                $("#title").val("");
                            } else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        },
                        error: function () {
                            layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                        }
                    })
                }
            }
        }
    }
    /**
     * 提交订单
     */
    function submit_Order(){

        var receiverId=$("#order_receiverId").val();
        if(receiverId.length==0){
            layer.alert("请选择收货人!", {icon: 5, title:"温馨提示"});
            return;
        }

        $.ajax({
            type: "post",
            url: "${base}/order/submit",
            data:$("#orderCheckInfo").formSerialize()+'&'+$("#orderGoodsForm").formSerialize(),
            dataType: "json",
            success: function (data) {
                if (data.status == "success") {
                    if (data.payType == "online" && !data.isEnableConfirm) {
                        window.location.href ="${base}/payment?orderSn="+data.orderSn+"&total="+data.totalAmount+"&key="+data.orderId+"&t="+Math.random();
                    } else {// if(data.payType == "offline" || ) {
//					window.location.href = "${base}/order/view/" + data.orderId + ".html";
                        window.location.href = "${base}/order/list";
                    }
                } else {
                    layer.alert(data.message, {icon: 6, title:"温馨提示"});
                }
            },
            error : function(error) {
                layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                //$("#order-loading").replaceWith(originSubmit);
                //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
                //$("#submit_message").show();
            }

        });
    }

    /**
     * 判断是否是空 Auth:zhangqiang Time:2015-09-25 17:43:35
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
</body>
</html>