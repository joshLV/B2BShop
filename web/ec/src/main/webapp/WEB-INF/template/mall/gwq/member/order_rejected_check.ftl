<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 10px 0;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline; border-bottom: 1px solid #E8E8E8; }
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

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
    #orderinfo .mc dl.fore{border-top:0;}
    #orderinfo .mc dt{ margin:15px 0 6px 0;font-weight:bold;}
    #orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}
    #orderinfo .mc dt span{ padding-left: 3px; color: #444;}
    #orderinfo .p-list th{padding:10px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #DEDEDE;font-weight:normal;}
    #orderinfo .p-list td{padding:10px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}
    #orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial; padding-bottom: 20px;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}
    .img-list .img-box:hover{border-color:#EDD28B;}
    .img-list .img-box{border:1px solid #e1e1e1;display:block; margin-right:10px;width:70px;height:70px;  background: url(${base}/static/mall/gwq/img/default_img.jpg) no-repeat center; background-size: 100%;}
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
    .content{ padding: 0 20px; width: 1160px;}
</style>

    <#include "mall/gwq/header_new.ftl"/>


<div style="background: #F5F5F5;">
    <div class="content" style="background: #ffffff; border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;">
        <div class="breadcrumb">
            <strong><a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;退货订单：${order.orderSn}<span></span></span>
        </div><!--breadcrumb end-->
    </div>

    <div class="content" style="background: #ffffff; border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;">
        <form id="myform" action="" method="post">
            <input type="hidden" id="applyFlag" name="apply" value="${apply}">
            <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
            <input type="hidden" id="order_receiverId_back" name="order_receiverId_back" value="${receiver.id}"><!--当新增窗口打开时会清空 order_receiverId的值  新增打开什么都不做 用此处还原之前的选择 -->
            <input type="hidden" name="orderSn" id="" value="${order.orderSn}" />
            <input type="hidden" name="shopId" id="" value="${order.shopId}" />
            <input type="hidden" name="orderItemId" id="" value="${orderItem.id}" />
            <input type="hidden" name="goodsId" id="" value="${orderItem.goodsId}" />
            <#if goodsRejectedDetail??>
                <input type="hidden" name="rejectedSn" id="" value="${goodsRejectedDetail.rejectedSn}" />
            </#if>
            <#--退货订单信息-->
            <div class="m" id="orderinfo">
                <div class="mt">
                    <strong>退货订单信息</strong></div>
                <div class="mc" style="overflow: hidden;">

                <#--商品-->
                    <dl>
                        <dt>
                            <span>退货商品清单</span>
                            <div class="clr"></div></dt>
                        <dd class="p-list">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tbody>
                                <tr>
                                    <th width="10%"> 商品图片 </th>
                                    <th width="50%"> 商品名称 </th>
                                    <th width="10%"> 商品简称 </th>
                                    <th width="10%"> 优惠信息 </th>
                                    <th width="10%"> 购买价格 </th>
                                    <th width="10%"> 退货商品数量 </th>
                                </tr>
                                <#list goodsList as goods>
                                    <tr>
                                        <td>
                                            <div class="img-list">
                                                <a class="img-box" target="_blank" href="${base}/item/${goods.id}.html">
                                                    <img width="70" height="70" src="${goods.pic}@70w_70h.png" title="${goods.fullName}">
                                                </a>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <div style="float: left;width: 78%;">
                                                    <div class="al fl">
                                                        <a class="flk13" target="_blank" href="${base}/item/${goods.id}.html"> ${goods.fullName}</a>
                                                    </div>
                                                    <div class="clr"></div>
                                                    <div id="coupon_${goods.sn}" class="fl"></div>
                                                </div>
                                                <div style="float: right;width: 20%;">
                                                    <#list orderItemList as orderItem>
                                                        <#if orderItem.goodsId == goods.id>
                                                            ${orderItem.specification}
                                                        </#if>
                                                    </#list>
                                                </div>
                                                <div></div>
                                            </div>

                                        </td>
                                        <td>
                                            ${goods.shortName}
                                        </td>
                                        <td>
                                            &nbsp;<span class="red">${goods.discount}</span>
                                        </td>
                                        <td>
                                            <span class="ftx04">
                                                ￥
                                                <#list orderItemList as orderItem>
                                                    <#if orderItem.goodsId == goods.id>
                                                        ${orderItem.goodsPrice}
                                                        <#break>
                                                    </#if>
                                                </#list>
                                            </span>
                                        </td>
                                        <td id="choose-amount">
                                            <#list orderItemList as orderItem>
                                                <#if orderItem.goodsId == goods.id>
                                                    <#--${orderItem.quantity}-->
                                                    <div class="dd">
                                                        <div class="wrap-input" style="width: 140px">
                                                            <div onclick="reduce();" title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height: 20px; line-height:20px;font-size: 15px;margin-left: -18px;margin-right: 3px; text-align: center;">－</div>
                                                            <input class="text" style="float: left"
                                                                   id="buy-num" name="goodsQuantity"
                                                                   value="<#if goodsRejectedDetail??>${goodsRejectedDetail.goodsQuantity}<#else>${orderItem.quantity}</#if>"
                                                                   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                                   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                                    />
                                                            <div onclick="add();" title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height:20px;line-height:20px;font-size: 15px;margin-left: 3px; text-align: center;">＋</div>
                                                        </div>
                                                    </div>
                                                    <#break>
                                                </#if>
                                            </#list>
                                        </td>
                                    </tr>
                                    <#--<tr>
                                        <td style="background: #f3f3f3; ><font style="margin-left: 10px;vertical-align: middle;margin-top: 2px">备注：</font></td>
                                        <td colspan="5" style="text-align: left;border-top: 1px dashed #dddddd; background: #f3f3f3; padding-bottom: 10px;">
                                        <span style="width: 1000px;vertical-align: middle;margin-top: 2px; color: #585757;">
                                            <#list orderItemList as orderItem>
                                                <#if orderItem.goodsId == goods.id>
                                                    ${orderItem.ps}
                                                </#if>
                                            </#list>
                                        </span>
                                        </td>
                                    </tr>-->
                                </#list>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                    <dl>
                        <#--部分退货商品信息填写-->
                        <dt>
                            <span>退货售后信息服务</span>
                            <div class="clr"></div>
                        </dt>
                        <dd>
                            <#--<#if goodsRejected??>
                                <div>
                                    <ul>
                                        <li style="float: left;">
                                            运费承担方:
                                        </li>
                                        <li>
                                            <#if goodsRejected.freightTake=="member">
                                                个人
                                            <#elseif goodsRejected.freightTake=="merchant">
                                                商家
                                            </#if>
                                            &lt;#&ndash;<input type="radio" name="freightTake" id="freightTakeMember" value="member" />
                                            <label for="freightTakeMember">个人</label>
                                            <input type="radio" name="freightTake" id="freightTakeMerchant" value="merchant" />
                                            <label for="freightTakeMerchant">商家</label>&ndash;&gt;
                                        </li>
                                    </ul>
                                </div>
                            </#if>-->
                            <div class="wl_info">
                                <p class="par">
                                    <span>退货原因<font color="red">*</font>：</span>
                                    <textarea id="rejectedReason" name="rejectedReason"></textarea>
                                </p>
                            </div>
                            <div class="wl_info">
                                <span>收货地址<font color="red">*</font>：</span>
                                <span id="span_area"><input type="text" id="shipAreaPath" name="deliveryAddress" class="areaSelect hidden" value=""/></span>
                                <br>
                                <span>详细地址<font color="red">*</font>：</span>
                                <input type="text" id="deliveryAddressDetail" name="deliveryAddressDetail" class="input-text input-text2" >
                            </div>

                        </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd>
                            <div id="" class="checkout-buttons group">
                                <div class="sticky-wrap">
                                    <div class="inner">
                                        <button type="button" class="checkout-submit" id="" onclick="rejectedSubmit();">提交退货申请</button>
                                    </div>
                                </div>
                            </div>
                        </dd>
                    </dl>
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


    /**
     * 退货原因
     * @return
     */
    function checkinfo(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#rejectedReason").val();
        if(isEmpty(value)){
            layer.alert("请输入退货原因!", {icon: 5});
        }else{
            /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 Start */
            if(value.length >200){
                layer.alert("退货原因长度不超过200字!", {icon: 5});
            }else{
                errorFlag=true;
            }
            /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 End */
        }

        return errorFlag;
    }

    /**
     * 收货人地址
     * @return
     */
    function checkshipAreaPath(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipAreaPath").val();
        if(isEmpty(value)){
            layer.alert("请选择地区!", {icon: 5});
        }else{
            errorFlag=true;
        }

        return errorFlag;
    }
    /**
     * 详细地址
     * @return
     */
    function checkshipAddress(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#deliveryAddressDetail").val();
        if(isEmpty(value)){
            layer.alert("请输入详细地址!", {icon: 5});
        }else{
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 Start */
            if(value.length > 64){
                layer.alert("详细地址长度不超过64个字!", {icon: 5});
            }else{
                errorFlag=true;
            }
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 End */
        }
        return errorFlag;
    }


    function rejectedSubmit(){
        var num = $("#buy-num").val();//退货数量
        if(num<=0) {
            layer.alert("亲爱的用户您并未对需要退货的商品进行退货, 请选择需要退货的商品数量!", {icon: 5});
            return;
        }

        if(!checkinfo()){
            return ;
        }
        if(!checkshipAreaPath()){
            return ;
        }
        if(!checkshipAddress()){
            return;
        }

        var data = $('#myform').serialize();
        //处理乱码
        data= decodeURIComponent(data,true);
        jQuery.ajax({
            type: "post",
            url: "${base}/orderRejected/submitGoodsReject?"+data,
            dataType: "json",
            success: function (data) {
                if (data.status == "success") {
                    window.location.href="${base}/orderRejected/listRejected/${order.id}";
                }
            },
            error : function(error) {
                layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...");
            }
        });
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
            url:"${base}/orderRejected/submitGoodsReject?"+data,
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