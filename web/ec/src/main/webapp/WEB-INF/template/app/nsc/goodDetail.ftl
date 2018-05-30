<!DOCTYPE html>
<html>

    <head>
		<meta charset="utf-8">
        <#assign path="${base}/static/app/nsc"/>
		<title>${goods.fullName} - <@spring.message "project_name"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

        <script src="${base}/static/app/nsc/js/mui.min.js"></script>
        <script src="${base}/static/app/nsc/js/mui.enterfocus.js"></script>
        <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>

		<!--标准mui.css-->
		<link rel="stylesheet" href="${path}/theme/red/mui.min.css">
		<link href="${path}/theme/red/my2.css" rel="stylesheet" />
        <script>
          //整数正则
		  var regexEnum =/^-?[0-9]{1,}$/;
		  //验证内容是不是整数
		  function checkNum(num){
			return regexEnum.test(num);
		  }
		  //点击加减号
		  function clickNum(){
			if(checkNum(document.getElementById("num").value)){
			  if(parseInt(document.getElementById("num").value)<=1){
				 document.getElementById("num").value=1;
			  }
			}else{
			    document.getElementById("num").value=1;
			}
		  }
		  //手动输入数量校验
		  function checkNum2(){
		   if(!checkNum(document.getElementById("num").value)){
			   document.getElementById("num").value=1;
			}else{
			 if(parseInt(document.getElementById("num").value)<1){
			   document.getElementById("num").value=1;
			 }
		   }
		  }
        </script>

</head>
	<!--页眉-->
<body style="padding-bottom:55px;">
    <header class="mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <div class="mui-center mui-title ">
                商品详情
            </div>
        </header>
    <#if !goods??>
        <div id="refresh">
            不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
        </div>
    <#else>
        <!--商品图片-->
        <div id="slider" class="mui-slider" style="font-size:12px; color:#666; margin-top:30px;">
            <div class="mui-slider-group mui-slider-loop">
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                    <#assign lastImg = goodsImagesList?sort_by("orderNo")?last>
                    <div class="mui-slider-item mui-slider-item-duplicate">
                        <img src="${lastImg.pic}_455x354.png">
                    </div>
                    <#list goodsImagesList?sort_by("orderNo") as img>
                        <div class="mui-slider-item">
                            <img alt="${img.title}" src="${img.pic}_455x354.png"/>
                        </div>
                    </#list>
                    <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                    <div class="mui-slider-item mui-slider-item-duplicate ">
                        <img src="${firstImg.pic}_455x354.png">
                    </div>
                </#if>
            </div>
            <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
            <div class="mui-slider-indicator">
            <#list goodsImagesList?sort_by("orderNo") as img>
                <#if img_index == 0>
                    <div class="mui-indicator mui-active"></div>
                <#else>
                    <div class="mui-indicator"></div>
                </#if>
            </#list>
            </div>
            </#if >
        </div>
    </#if><!--商品图片结束-->

    <ul class="mui-table-view">
        <li class="mui-table-view-cell">
            <span>商城价：</span>
            <span style="color:#F00">${goods.price?string(priceCurrencyFormat)}</span>&nbsp;&nbsp;
            <#if (goods.marketPrice)?exists>
            <span>市场价：</span>
            <span>${goods.marketPrice?string(priceCurrencyFormat)}</span>
            </#if>
        </li>
        <li class="mui-table-view-cell">
            <span style=" font-size:14px; font-family:'微软雅黑'">${goods.fullName}</span>
        </li>
        <li class="mui-table-view-cell">
            <span><#if goods.description == "">该商品无特别说明<#else>${goods.description}</#if></span>
        </li>
        <li class="mui-table-view-cell">
            <table border="0" width="100%">
                <tr>
                    <td width="24%">销售区域：</td>
                    <td>陕西省  运费：0元</td>
                </tr>
                <tr>
                    <td>累计售出：</td>
                    <td>${fixed}件</td>
                </tr>
                <tr>
                    <td>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存：</td>
                    <td>${fixed}件</td>
                </tr>
                <tr>
                    <td>起订数量：</td>
                    <td>最低起订1件</td>
                </tr>
                <tr>
                    <td valign="top">温馨提示：</td>

                    <td>由 ${(shop.name?exists)?string("<span class='mui-shopname'>${shop.name}</span>","本商城")} 发货并提供售后服务。</td>
                </tr>
            </table>
        </li>
    </ul>

    <div id="segmentedControl" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-positive" style="background-color:#FAFAFA">
        <a class="mui-control-item mui-active" href="#item1mobile">
            商品介绍
        </a>
        <a class="mui-control-item" href="#item2mobile">
            商品参数
        </a>
        <a class="mui-control-item" href="#item3mobile">
            商品评论
        </a>
        <a class="mui-control-item" href="#item4mobile">
            购买咨询
        </a>
    </div>
    <div id="item1mobile" class="mui-control-content mui-active"  style="background:#FFF">
        ${goods.introduction}
    </div>
    <div id="item2mobile" class="mui-control-content"  style="background:#FFF">
        <div class="mc" data-widget="tab-content" id="p-detail" style="width:990px;min-width: 990px">
            <ul class="detail-list">
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
            <div class="detail-correction ac"></div>
        </div>
    </div>
    <div id="item3mobile" class="mui-control-content"  style="background:#FFF">
        <table border="0" width="100%">
            <tr>
                <td width="35%">评价心得</td>
                <td width="25%">顾客满意度</td>
                <td width="25%">购买信息</td>
                <td width="15%">评论者</td>
            </tr>

            <!--这里可以循环添加数据了！-->
            <#if !review??>
                <#list goodsReviewList as review>
                  <tr height="10">
                    <td colspan="4">
                      <hr style="border : 1px dashed darkgray;width: 100%"/>
                    </td>
                  </tr>
                  <tr style="font-size: 12px;">
                      <td>${review.content}|${review.buyDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                      <td>${review.score}</td>
                      <td>${review.orderSn}</td>
                      <td>${review.memberId}</td>
                  </tr>
                </#list>
            <#else >
                <tr height="10">
                    <td colspan="4">
                        <hr style="border : 1px dashed darkgray;width: 100%"/>
                    </td>
                </tr>
                <tr style="font-size: 12px;">
                    <td>很好很不错，很支持</td>
                    <td>******</td>
                    <td>颜色:绿色</td>
                    <td>某个人</td>
                </tr>
            </#if>
        </table>
    </div>
    <div id="item4mobile" class="mui-control-content"  style="background:#FFF">
        购买咨询
    </div>
    <nav class="mui-bar mui-bar-tab">
        <table border="0" width="100%">
            <tr>
                <td valign="top" align="center">
                    <div class="mui-numbox" style="width: 110px;height: 30px; margin-top: 9px;">
                        <button class="mui-numbox-btn-minus" type="button" onClick="clickNum()">-</button>
                        <input class="mui-numbox-input" type="number"  id="num"  onBlur="checkNum2()" value="1"/>
                        <button class="mui-numbox-btn-plus" type="button">+</button>
                    </div>
                </td>
                <td>
                    <button class="mui-btn mui-btn-primary mui-pull-right" style="margin-right:-30px; display: none;" >
                        <a href="app/nsc/shopping_cart.html">去结算</a>
                    </button>
                </td>
                <td>
                    <button class="mui-btn mui-btn-primary mui-pull-right" onclick="addCart('${goods.id}', $('#num').val());" style="margin-right:5px; background:#f69601; border-color:#f69601;">
                        <a href="javascript:addCart('${goods.id}', $('#num').val());">加入购物车</a>
                    </button>
                </td>
            </tr>
        </table>
    </nav>
</body>
</html>
<script type="text/javascript">
    function addCart(goodsId, cnt) {
        // "&backurl=" + window.location.href+
        //没有中间页面，直接跳到购物车！
        var path="${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&backurl=" + window.location.href+"&whichclient=whichapp";
        //alert(path);
        window.location.href =path;
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#f7f7f7',
            swipeBack: true
        });
        mui.plusReady(function(){
            //关闭等待框
            plus.nativeUI.closeWaiting();
            //显示当前页面
            mui.currentWebview.show();
        });
    }(mui, document));
</script>