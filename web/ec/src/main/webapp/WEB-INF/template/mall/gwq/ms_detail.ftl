<link href="${base}/static/mall/gwq/css/goods_detail.css" rel="stylesheet" type="text/css" />

	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<style>
    .main{ overflow: inherit;}
    #product-detail .detail-list{ border-bottom: 0;padding: 15px;}
    .detail-content{ border:0; padding: 20px; line-height: 2; }
    .right .tab .curr a{ height: 45px; line-height: 45px;padding: 0 20px; font-size: 14px;}
    .tab a{height: 45px; line-height: 45px;}
    .right{ width: 100%;}
    #detail-info{ width: 1200px; margin: 20px 0; float: none;border-top: 1px solid #e5e5e5;background: #fff;
        border-bottom: 1px solid #e5e5e5;
        -webkit-box-shadow: 1px 1px 4px #d3d3d3;
        -moz-box-shadow: 1px 1px 4px #d3d3d3;
        box-shadow: 1px 1px 4px #d3d3d3;}
    .ms_main{ width: 1200px; margin: 0 auto;}
    .right .mt,#product-detail .detail-list{ border: 0;}
    .float-nav-wrap{ border-bottom: 1px solid #e2e2e2;}
    #product-detail .tab{ font-size: 14px;}
    .right .tab .curr{ background-color: #e52c32;}
    .tab li a:hover{ color: #e52c32;}
    .tab a{ padding: 0 20px;}
    #comment{ border-top: 0;}
    #comment .mc{ border:0; border-bottom: 1px solid #e5e5e5;}
    #comments-list{ margin-bottom: 0;}
    #comments-list .mt{height: 35px;line-height: 35px;}
   #comments-list .mt .tab .curr a,#comments-list .tab a{ height: 35px;line-height: 35px;}
    #comments-container{ padding: 20px;}
    .btn-comment{ background: #e52c32!important;}
</style>
    <div class="ms_main">
	<div class="deal_main f-cb">
		<div class="deal_main_l">
			<h1>${goods.fullName}</h1>
			<p>
                <img  src="<#if goods.pic??>${goods.pic}_700x525.png</#if>" width="700" height="525">
            </p>
		</div>
		<div class="deal_main_r">
			<div class="deal_main_r_time">
                <div class="times">
                    <p>距离秒杀
                        <#assign endtime = 0>
                        <#if mTPromotions.status == 'ing'>
                            <#assign endtime = mTPromotions.intervalEndTime>
                            <strong>结束</strong>
                        <#elseif mTPromotions.status == 'before'>
                            <#assign endtime = mTPromotions.intervalStartTime>
                            <strong>开始</strong>
                        </#if>
                    还有</p>
                    <div class="endtime" value="${endtime}"></div>
                </div>
			</div>
			<div class="deal_main_r_info">
				<div class="deal_main_price">
					<span>
                        <em>￥</em>${promotionsGoods.promotionsPrice}
                    </span>
                    <del>￥${promotionsGoods.goodsPrice}</del>
				</div>
                <div class="deal_main_people">
                    <span class="peo">已购买人数 <em>${goods.sales}</em></span><span class="pl">评论数 <em>${goods.scoreCount}</em></span>
                </div>
				<div class="deal_main_xinxi">
                    <p id="systemParamsId"></p>
					<p>服&nbsp;&nbsp;&nbsp;务：由<i>西安港进出口商品交易中心</i>发货并提供售后服务。</p>
					<p>预计送达时间：${goods.predictDay}</p>
				</div>
				<div class="deal_main_num">
                    <span>购买数量：</span><input type="text" class="spinnerExample"/><em>（库存 ${goods.stock}）</em>
				</div>
				<div class="deal_main_buy">
					<a href="#" class="a_jr">加入购物车</a><a href="#">立即购买</a>
				</div>
			</div>
		</div>
	</div>
		<!-- 详细信息 -->
		<div id="detail-info">
			<div class="right">
				<div id="product-detail" class="m1" data-widget="tabs" clstag="shangpin|keycount|product|detail" load="true">
					<div class="float-nav-wrap" style="height:45px;">
						<div class="mt" style="height:45px; line-height: 45px;background: #fbfbfb;width: 1198px; margin: 0 auto;">
							<ul class="tab">
								<li data-widget="tab-item" id="p-detail-tab" class="curr"><a href="javascript:;" class="toggle-link">商品介绍</a></li>
								<li data-widget="tab-item" id="p-attr-tab" class=""><a href="javascript:;" class="toggle-link">相关参数</a></li>
								<li data-widget="tab-item" id="p-order-tab" class=""><a href="javascript:;" class="toggle-link">关单、检疫合格证、原产地证明</a></li>
							</ul>
						</div>
					</div>

					<div id="tab-content">
						<!-- 商品介绍 -->
						<div class="mc " data-widget="tab-content" id="p-detail">
							<ul class="detail-list">
								<li title="${goods.name}">商品名称：${goods.name}</li>
								<#list brandMap["${goods.brandId}"] as brandName>
									<li>品牌：${brandName}</li>
								</#list>
								<li>上架时间：${goods.createDate?datetime}</li>
								<#list goodsParamList as pm>
									<#assign c = pm["content"]/>
									<#assign parameterId = pm["parameterId"]/>
									<#if c != "">
										<#list parameterMap?values as vals>
											<#list vals as val>
												<#if val.id = parameterId>
													<li>${val.name}：${c}</li>
												</#if>
											</#list>
										</#list>
									</#if>
								</#list>
							</ul>

							<div class="detail-content">
								<div style="width: 100%">
								${goods.introduction}
								</div>
							</div>
						</div>
						<!-- 属性参数 -->
						<div class="mc hide" data-widget="tab-content" id="p-attr" >
							<div class="detail-correction ac" style="background:#fff; padding: 20px;">
								<table cellpadding="0" cellspacing="1" width="100%" border="0" class="Ptable" style="margin-top: 0px">
									<tbody id="params">
									</tbody>
								</table>
							</div>
						</div>
						<!-- 相关证书 -->
						<div class="mc hide" data-widget="tab-content" id="p-order" >
							<div class="detail-content">
								<div style="width: 100%">
								${goods.shippingOrderUrl}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<span class="clr"></span>
		</div>
    </div>
	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>

<script type="text/javascript" src="${base}/static/mall/gwq/js/jquery.spinner.js"></script>
<script type="text/javascript">
    $(function(){
        timer(parseInt($(".endtime").attr('value')));
    });

    function timer(intDiff){
        window.setInterval(function(){
            var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
            if(intDiff > 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var time = day+"天";
            time += hour+'时';
            time += minute+'分';
            time += second+'秒';
            $('.endtime').html(time);
            intDiff--;
        }, 1000);
    }
</script>

<script type="text/javascript" src="${base}/static/js/product.js"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    var reviewClicked = false;
    $(document).ready(function () {
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#login").hide();
                    $("#loginAfter").show();
                    $("#lg_nickeName").text('Hi! '+data.m.nickName);
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                    $("#isLogin").val(1);

                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                    $("#isLogin").val(0);
                }
            }
        });


        selectedSp();
        $('.float-nav-wrap .tab li').bind('click', function () {
            tabStyle($(this), $('#tab-content').find('.mc'));
        });

        $('#choose .item').bind('click', function () {
            selectedSps($(this));
        });


        $('#comments-list .tab li').bind('click', function () {
            tabStyle($(this), $('#comments-list li'));
        });

        getGoodsSystemParameters($("#goodsId").val());

        $("#wuliu_desc").colorbox({title:"运费说明", iframe:true, innerWidth:600, innerHeight:450, opacity: 0.3});

        //异步获取参数
        $.ajax({
            type: 'post',
            url: '${base}/goods/getParamNoGroup',
            data:{goodsId:'${goods.id}'},
            success: function(data) {
                if( data.status == 'success' ){
                    //params
                    var html = '';
                    $.each(data.params,function(i,d){
                        html += '<tr><td class="tdTitle">'+ d.name+'</td>';
                        html += '<td id="'+ d.parameterId+'_'+d.name+'" style="text-align:left;">'+ d.content+'</td>';
                        html += '</tr>';
                    });
                    $("#params").html(html);
                }else{

                }
            }
        });

        $("#goBuyUrl1").hide();
        $("#InitCartUrl1").hide();

        $("#goBuyUrl2").hide();
        $("#InitCartUrl2").hide();

        //获取是否为跨境商品
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/goods/ajaxIsCrossBorderGoods',
            data:{shopId:'${goods.shopId}',catelogId:'${goods.categoryId}'},
            success: function(data) {
                if( data.status == 'success' ){
                    $("#goBuyUrl1").show();
                    $("#InitCartUrl1").show();
                    $("#goBuyUrl2").hide();
                    $("#InitCartUrl2").hide();
                }else{
                    $("#goBuyUrl1").hide();
                    $("#InitCartUrl1").hide();
                    $("#goBuyUrl2").show();
                    $("#InitCartUrl2").show();
                }
            }
        });
    });

    /**
     * 商品详细页tab页切换效果
     * @param li 选中的tab页
     * @param tabContent tab对应的详细内容
     */
    function tabStyle(li, tabContent) {
        li.addClass('curr');
        var subs = li.siblings();
        $.each(subs, function (i, _li) {
            $(_li).removeClass('curr');
        });
        var tmpId = $(li).attr('id');
        var tabContentId = tmpId.substr(0,tmpId.lastIndexOf('-tab'));
        $('#' + tabContentId).removeClass('hide');
        $('#' + tabContentId).siblings('div').addClass('hide');
    }

	<#if goods.stock??  || goods.stock &gt; 0>

	</#if>

    /**
     * 选择规格的效果
     */
    function selectedSps(c) {
        var _id = c.children().eq(0).prop('id');
        var id = _id.substring(0, _id.indexOf('_item'));
        c.addClass('selected');
        var pSubs = c.parent().siblings();    // 选中元素的兄弟元素
        $.each(pSubs, function (i, sp) {
            $(sp).children('.item').removeClass('selected');
        });
    }



    /**
     * 选择规格
     */
    function chekedSp(spId,itemId,itemName){
        $('#' +spId).val(itemName);
        $('#' +itemId).parent().addClass('selected');
        selectedSp();
    }

    function showTab(tab) {
        $("#" + tab + "").removeClass("hide");
        $("#" + tab + "").siblings("div").addClass("hide");
    }

    function selectedSp(){
        var selectedText = "“";
        if($('input[name="goodsSp"]').length > 0){
            var i = 0;
            $('input[name="goodsSp"]').each(function(){
                if($(this).val() != ''){
                    if(i > 0){
                        selectedText += ","
                    }
                    selectedText += $(this).val();
                    i++;
                }
            });
        }
        selectedText += "”";
        if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
            $('#choose-result .dd strong').html(selectedText);
        } else {
            $('#choose-result').html("");
        }
    }

    /**
     * 数字百分比格式化
     * @param n 保留几位小数
     * @returns {string}
     */
    Number.prototype.toPercent = function (n) {
        n = n || 0;
        var result = (Math.round(this * Math.pow(10, n + 2)) / Math.pow(10, n) ).toFixed(n);
        return !isNaN(result) ? result : 0;
    }
    // 用法
    //    var A = 0.358975, B = 0.25554;
    //    alert([A, A.toPercent(3), B, B.toPercent()].join('\n'));

    /**
     * Desc:获取此商品的系统参数(国家;产地;保质期)
     * Auth:zhangqiang
     * Time:2015-11-25 15:50:35
     */
    function getGoodsSystemParameters(goodsId){
        $.ajax({
            type: "post",
            url: "${base}/goods/ajaxGetGoodsSystemParameters",
            data:{'goodsId':goodsId},
            datatype: 'json',
            error: function () {
            },
            success: function(result) {
                if(result.status=='success'){
                    $("#systemParamsId").html(result.sysParms);
                }else{
                }
            }
        });

    }

    function save_idcode(){
        var idcode = $("#idcode").val();

        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
            $("#checkIdcodeId").text('身份证号不能为空!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        if(idcode.length > 18 || idcode.length < 15){
            $("#checkIdcodeId").text('身份证号长度范围15~18位!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {
            $("#checkIdcodeId").text('身份证号格式错误!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        $("#checkIdcodeId").addClass("hide");

        $.ajax({
            type: "post",
            async: false,
            url: base+"member/username/check",
            data:{'userName':idcode,'property':'iDCode'},
            datatype: 'json',
            error: function () {

            },
            success: function(result) {
                if(result){
                    $("#checkIdcodeId").addClass("hide");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: base+"member/saveMemberIDcode",
                        data:{'idcode':idcode},
                        datatype: 'json',
                        error: function () {

                        },
                        success: function(result) {
                            if(result.status == 'success'){
                                layer.closeAll();
                                addCart($("#gwcGoodsId").val(), $('#buy-num').val(), $("#gwTypeId").val());
                            }else{
                                layer.alert('设置失败',{icon:2});
                            }
                        }
                    });
                }else{
                    $("#checkIdcodeId").text('身份证号已存在,请重新输入!');
                    $("#checkIdcodeId").removeClass('hide');
                }
            }
        });
    }



</script>
<script type="text/javascript">
    $('.spinnerExample').spinner({});
</script>