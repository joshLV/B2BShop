/**
 * 获取账户数据
 */
function getOrderAmount(){
    $.ajax({
        type: "post",
        url: baseP + "/payment/ajaxGetOrderAmount",
        data: {orderSn: $("#orderSn").val()},
        success: function(data) {
            if (data.status == 'success') {
                if(parseFloat(data.unpaidAmountTotal) == 0){
                    window.location.href = baseP + '/order/view/' + $("#orderId").val();
                }else{
                    $("#paidAmountTotal_span").text(data.paidAmountTotal.formatMoney(2,"￥"));
                    $("#unpaidAmountTotal_span").text(data.unpaidAmountTotal.formatMoney(2,"￥"));
                    $("#RunpaidAmountTotal_span").text(data.RunpaidAmountTotal.formatMoney(2,"￥"));
                    $("#unpaidAmountTotal").val(data.unpaidAmountTotal.toFixed(2));
                    $("#onlinePayAmount").val(data.unpaidAmountTotal.toFixed(2));
                    $("#RunpaidAmountTotal").val(parseFloat(data.RunpaidAmountTotal).toFixed(2));
                    $("#mpr_account_thisUsedAmount").val('0');
                    unpaidAmountTotal = data.unpaidAmountTotal.toFixed(2);
                }
            }
        }
    });
}

/**
 * 获取账户数据
 */
function getAccount(){
    $.ajax({
        type: "post",
        url: baseP + "/payment/ajaxGetAccount",
        data: "",
        success: function(data) {
            if (data.status == 'success') {
                $("#mpr_account_accountTotal").text(data.account.accountTotal);
                $("#mpr_account_amountAvailable_span").text(parseFloat(data.account.amountAvailable).toFixed(2));
                $("#mpr_account_amountAvailable").val(parseFloat(data.account.amountAvailable).toFixed(2));
                $("#mpr_account_id").val(data.account.id);
            }
        }
    });
}

/**
 * 判断账户数据总额
 */
function changeAccount(){
    var amount = $("#mpr_account_thisUsedAmount").val();
    var surplusAmount = $("#mpr_account_amountAvailable").val();

    judgeAndSetInputAmount("mpr_account_thisUsedAmount", amount, surplusAmount);
}

/**
 * 获取所有的银行授信数据
 */
function getCredit(){
    $.ajax({
        type: "post",
        url: baseP + "/payment/ajaxGetCredit",
        data: "",
        success: function(data) {
            if (data.status == 'success') {
                if( typeof(data.creditReplies) != 'undefined' && data.creditReplies != null && data.creditReplies != '' ){
                    var html = '';
                    $.each(data.creditReplies,function(k,v){
                        html += '<li>';
                        html += '<div class="credit">';
                        html += '<span class="title">'+v.bankName+'</span>';
                        html += '<span class="label">已放款：</span><span class="money">'+v.totalAmount+'</span><span class="unit">元</span>';
                        html += '<span class="label">已使用：</span><span class="money">'+v.usedAmount+'</span><span class="unit">元</span>';
                        html += '<span class="label">本次可用：</span><span class="money">'+v.surplusAmount+'</span><span class="unit">元</span>';
                        html += '<span class="label">本次使用：</span>';
                        html += '<span class="text">';
                        html += '<input class="pay_input credit_pay" type="text" name="creditReplyList['+k+'].thisUsedAmount" id="credit_'+v.id+'" value="0"';
                        html += ' onblur="changeCredit(\''+v.id+'\',\''+v.surplusAmount+'\')" ';
                        html += ' onkeyup="this.value = floatFormat( this.value, \'2\' );"';
                        html += ' onafterpaste="this.value = floatFormat( this.value, \'2\' );" >';
                        html += '<input type="hidden" name="creditReplyList['+k+'].id" id="creditId_'+v.id+'" value="'+v.id+'">';
                        html += '</span><span class="unit">元</span>';
                        html += '</div>';
                        html += '</li>';
                    });

                    $("#credit_ul").html(html);
                }else{
                    $("#credit_ul").html('暂无可用银行授信');
                    $("#credit_empty").show();
                }
            }
        }
    });
}

/**
 * 校验授信额度使用
 * @param id
 * @param surplusAmount
 */
function changeCredit(id, surplusAmount){
    judgeAndSetInputAmount("credit_" + id, $("#credit_" + id).val(), surplusAmount);
}




/**
 * 获取所有的银行授信数据
 */
function getPR(){
    $.ajax({
        type: "post",
        url: baseP + "/payment/ajaxGetR",
        data: {orderSn: $("#orderSn").val()},
        success: function(data) {
            if (data.status == 'success') {
                var r_index = 0;
                //平台红包
                if( typeof(data.prs) != 'undefined' && data.prs != null && data.prs != '' ){
                    r_index = installRHTML('pr',data.prs, r_index);
                }else{
                    $("#pr_ul").html('暂无可用平台红包');
                    $("#pr_empty").show();
                }
                //商家红包
                if( typeof(data.mrs) != 'undefined' && data.mrs != null && data.mrs != '' ){
                    r_index = installRHTML('mr',data.mrs, r_index);
                }else{
                    $("#mr_ul").html('暂无可用供应商红包');
                    $("#mr_empty").show();
                }
            }
        }
    });
}

/**
 * 拼接红包HTML
 */
function installRHTML(type, data, r_index){

    var html = '';
    $.each(data,function(k,v){
        html += '<li index="'+ v.id+'">';
        html += '<div class="credit">';
        html += '<span class="title">'+v.amount+'元</span>';
        html += '<span class="label">红包限额：</span><span class="money">'+(parseFloat(v.limitation)==0?'不限额':v.limitation)+'</span><span class="unit">'+(parseFloat(v.limitation)==0?' ':'元')+'</span>';
        html += '<span class="label">单笔限额：</span><span class="money">'+(parseFloat(v.singleMaximum)==0?'不限额':v.singleMaximum)+'</span><span class="unit">'+(parseFloat(v.singleMaximum)==0?' ':'元')+'</span>';
        html += '<span class="label">本次可用：</span><span class="money">'+ v.usedAmount + '</span><span class="unit">元</span>';
        html += '<span class="label">本次使用：</span>';
        html += '<span class="text">';
        html += '<input class="pay_input ' + type + '_pay" type="text" name="redenvelopaccounts['+r_index+'].thisUsedAmount" id="red_'+v.id+'" value="0"';
        html += ' onblur="changeR(\''+v.id+'\',\''+ v.usedAmount +'\')" ';
        html += ' onkeyup="this.value = floatFormat( this.value, \'2\' );" ';
        html += ' onafterpaste="this.value = floatFormat( this.value, \'2\' );" >';
        html += '<input type="hidden" name="redenvelopaccounts['+r_index+'].id" id="redId_'+v.id+'" value="'+v.id+'">';
        html += '<input type="hidden" name="redenvelopaccounts['+r_index+'].limitation" id="redL_'+v.id+'" value="'+v.limitation+'">';
        html += '<input type="hidden" name="redenvelopaccounts['+r_index+'].isEnable" id="redIE_'+v.id+'" value="'+v.isEnable+'">';
        html += '</span><span class="unit">元</span>';
        html += '</div>';
        html += '</li>';

        r_index++;
    });

    $("#"+type +"_ul").html(html);

    return r_index;
}

/**
 * 校验平台红包额度使用
 * @param id
 * @param surplusAmount
 */
function changeR(id, surplusAmount){
    /*
    var $amount = $("#red_" + id);
    var amount = $amount.val();
    if( !isNaN(amount)){
        if(parseFloat(amount) > parseFloat(surplusAmount)){
            //            layer.alert('本次使用金额不能大于可用余额',{icon: 7});
            $amount.val( parseFloat(surplusAmount) );
        }
    }else{
        $amount.val(0);
    }

    $amount.val(getPaidAmount('red_'+id,parseFloat($amount.val())));*/
    judgeAndSetInputAmount("red_" + id, $("#red_" + id).val(), surplusAmount);

    ajaxJudgeR();
}

/**
 * 校验红包可用性
 */
function ajaxJudgeR(){
    //禁用提交按钮
    $("#btnNext_disable").show();
    $("#btnNext").hide();

    //组装提交的数据
    var redStrs = '';
    $("#pr_ul>li").each(function(i){
        var id = $(this).attr("index");
        if(i > 0){
            redStrs += ',';
        }
        redStrs += $("#redId_"+id).val();
        redStrs += '_'+ $("#red_"+id).val();
        redStrs += '_'+ $("#redL_"+id).val();
    });
    redStrs = redStrs==''?'':redStrs+',';
    $("#mr_ul>li").each(function(i){
        var id = $(this).attr("index");
        if(i > 0){
            redStrs += ',';
        }
        redStrs += $("#redId_"+id).val();
        redStrs += '_'+ $("#red_"+id).val();
        redStrs += '_'+ $("#redL_"+id).val();
    });

    $.ajax({
        type: "post",
        url: baseP + '/payment/ajaxJudegeR',
        data: {"redStrs": redStrs,"orderGoodsAmount":$("#RunpaidAmountTotal").val()},
        success: function(data) {
            if (data.status == 'success') {
                if( typeof(data.rs) != 'undefined' && data.rs != null && data.rs != '' ){
                    $.each(data.rs,function(k,v){
                        if(v.isEnable == 'Y'){
                            $("#red_" + v.id).removeAttr("readonly");
                            $("#red_" + v.id).removeClass("onlyRead");
                            $("#redIE_" + v.id).val("Y");
                        }else if(v.isEnable == 'N'){
                            $("#red_" + v.id).attr("readonly", "readonly");
                            $("#red_" + v.id).addClass("onlyRead");
                            $("#redIE_" + v.id).val("N");
                        }
                    });
                }
            }

            //释放提交按钮
            $("#btnNext_disable").hide();
            $("#btnNext").show();
        }
    });
}

/**
 * 校验第三方支付金额
 */
function changeOnlinePayAmount(){

    $("#btnNext_disable").show();
    $("#btnNext").hide();
    var $amount = $("#onlinePayAmount");
    var amount = $amount.val();
    if( isNaN(amount)){
        amount = 0;
    }

    $amount.val(getPaidAmount('',parseFloat(amount)));

    //释放提交按钮
    $("#btnNext_disable").hide();
    $("#btnNext").show();
}

/**
 * 校验输入，并把校验后的值填充到输入中
 * @param id
 * @param amount
 * @param surplusAmount
 */
function judgeAndSetInputAmount(id, amount, surplusAmount){
    $("#btnNext_disable").show();
    $("#btnNext").hide();
    var $amount = $("#"+id);
    if( !isNaN(amount)){
        if(parseFloat(amount) > parseFloat(surplusAmount)){
            //            layer.alert('本次使用金额不能大于可用余额',{icon: 7});
            $amount.val( parseFloat(surplusAmount) );
            amount = surplusAmount;
        }
    }else{
        $amount.val(0);
        amount = 0;
    }

    $amount.val(getPaidAmount(id,parseFloat(amount)));

    //释放提交按钮
    $("#btnNext_disable").hide();
    $("#btnNext").show();
}

/**
 * 计算本次支付情况
 * 1、如果 本次支付后 ，累计支付金额 大于 剩余应付金额， 返回 剩余应付金额 - 累计支付金额
 * 2、如果 本次支付后， 累计支付金额 不大于 剩余应付金额， 返回 本次支付金额
 * 3、同时为 本次累计支付金额 重新赋值
 */
function getPaidAmount(thisId, thisAmount){
    var paidAmount = 0.00;

    $(".pay_input").each(function(){
        if($(this).attr("id") != thisId && !isNaN($(this).val())){
            paidAmount += parseFloat($(this).val());
        }
    });

    if(thisAmount + paidAmount > unpaidAmountTotal){
        thisAmount = unpaidAmountTotal - paidAmount;
        paidAmount = unpaidAmountTotal;
    }else{
        paidAmount += thisAmount;
    }

    $("#paidAmount").text((Number(paidAmount)).toFixed(2));
    $("#onlinePayAmount").val((unpaidAmountTotal - paidAmount).toFixed(2));

    return parseFloat(thisAmount+'').toFixed(2);
}


