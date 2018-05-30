<!DOCTYPE html>
<html>
	<head>
	<#include "app/zx/head.ftl">
        <style>
			.area {
				margin: 20px auto 0px auto;
			}
			.mui-input-group {
				margin-top: 10px;
			}
			.mui-input-group:first-child {
				margin-top: 20px;
			}
			.mui-input-group label {
				width: 30%;
			}
			.mui-input-row label~input,
			.mui-input-row label~select,
			.mui-input-row label~textarea {
				width: 70%;
			}
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				top: 6px;
			}
			.mui-content-padded {
				margin-top: 25px;
			}
			.mui-btn {
				padding: 10px;
			}
			.link-area {
				display: block;
				margin-top: 25px;
				text-align: center;
			}
			.spliter {
				color: #bbb;
				padding: 0px 8px;
			}
			.oauth-area {
				position: absolute;
				bottom: 20px;
				left: 0px;
				text-align: center;
				width: 100%;
				padding: 0px;
				margin: 0px;
			}

			.oauth-area .oauth-btn {
				display: inline-block;
				width: 50px;
				height: 50px;
				background-size: 30px 30px;
				background-position: center center;
				background-repeat: no-repeat;
				margin: 0px 20px;
				/*-webkit-filter: grayscale(100%); */

				border: solid 1px #ddd;
				border-radius: 25px;
			}
			.oauth-area .oauth-btn:active {
				border: solid 1px #aaa;
			}
			.mui-input-group:after {
			position: absolute;
			right: 0;
			bottom: 0;
			left: 0;
			height:0;
			content: '';
			-webkit-transform: scaleY(.5);
			transform: scaleY(.5);
			background-color: #c8c7cc
			}
			/*==========以下部分是Validform必须的===========*/
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
				background:url(../images/right.png) no-repeat left center;
			}
			.Validform_wrong{
				color:red;
				padding-left:20px;
				white-space:nowrap;
				background:url(../images/error.png) no-repeat left center;
			}
			.Validform_loading{
				padding-left:20px;
				background:url(../images/onLoad.gif) no-repeat left center;
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


	</head>
	<body style="background:#FFF; margin-bottom:50px;">
		<header class="mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <div class="mui-center mui-title ">
                <#if msg??>${msg}<#else >招商入驻</#if>
            </div>
        </header>
		<!--描述：招商入驻表单信息-->
    <div style="padding-bottom:100px;" id="content">
		<div class="mui-content-padded" style="font-size:14px; margin-top:50px;">
			  <form id="joinForm" class="mui-input-group registerform" method="post" >
					<div class="mui-input-row" >
						<label>品牌名称</label>
						<input type="text" name="name" id="name" datatype="*"  placeholder="请输入品牌" >
						<#--<div class="Validform_checktip"></div>-->
					</div>
					<div class="mui-input-row">
					  <label>联系人</label>
					  <input type="text" name="head" id="head" datatype="*" placeholder="请输入联系人">
					  </div>
					<div class="mui-input-row">
					  <label>手机号</label>
					  <input type="text" name="mobile" id="mobile"  datatype="m" placeholder="请输入手机号">
					</div>
				  <div class="mui-input-row">
					  <label>固定电话</label>
					  <input type="text" name="telphone" id="telphone"  datatype="*" placeholder="请输入固定电话号">
				  </div>
				  <div class="mui-input-row">
					  <label>详细地址</label>
					  <input type="text" name="address" id="address"  datatype="m" placeholder="请输入详细地址">
				  </div>
				  <div class="mui-input-row">
					  <label>营业执照</label>
					  <input type="text" name="businessLicenseCode" id="businessLicenseCode"  datatype="*" placeholder="请输入营业执照编号">
				  </div>
			    <div class="mui-button-row"  style="border-bottom:none;">
			      <button type="button" id="btnSub" class="mui-btn-bc">保存</button>
			    </div>
		</div>
        <div class="mui-rzfs">
          <h4>入驻方式</h4>
          <p><img src="${base}/static/mall/nsc/img/022.jpg" width="100%"></p>
        </div>
        <div class="mui-rzfs">
          <h4>招商热线</h4>
          <p class="mui-tel">
           <span style="float:left; margin:8px 0 0 10px;line-height:30px;"  id="tel">
           TEL:0951-6025856 <button class="mui-btn-tel">立即拨打</button>
           </span>
          </p>
          <p class="mui-tel">
          <span style="
          float:left; margin:8px 0 0 10px; line-height:30px;"  id="tel1">

           TEL:0951-6013888 <button  class="mui-btn-tel">立即拨打</button>

          </span>
          </p>
        </div>
    </div>
	<#include "app/zx/tools.ftl"/>
        <script>
			/*$(function(){
				$("#joinForm").Validform();
			});*/
            (function(mui, doc) {
				mui.init({
					statusBarBackground: '#ffffff',
					swipeBack: true
				});
				if(ismobile) {
					mui.plusReady(function () {
						//关闭等待框
						plus.nativeUI.closeWaiting();
						//显示当前页面
                        plus.webview.currentWebview().show();
					});
				}
				jQuery("#btnSub").bind('tap', function() {
					var name=doc.getElementById("name").value.trim();
					var head=doc.getElementById("head").value.trim();
					var mobile=doc.getElementById("mobile").value.trim();
					var telphone=doc.getElementById("telphone").value.trim();
					var address=doc.getElementById("address").value.trim();
					var businessLicenseCode=doc.getElementById("businessLicenseCode").value.trim();

					if(name.length<1){
						popAlert('品牌名不能为空！');
						return;
					}
					if(name.length>64){
						popAlert('品牌名不能超过64位字符！');
						return;
					}
					if(head.length<1){
						popAlert('联系人不能为空！');
						return;
					}
					if(head.length>16){
						popAlert('联系人不能超过16位字符！');
						return;
					}
					if(address.length>129){
						popAlert('联系地址不能超过128位字符！');
						return;
					}
					if(businessLicenseCode.length>33){
						popAlert('营业执照不能超过32位字符！');
						return;
					}
					if(mobile.length>=1 && !(/^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$/.test(mobile))){
						popAlert('请输入正确的手机号码！');
						return;
					}
					if(telphone.length>=1 &&  !(/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/.test(telphone))){
						popAlert('请输入正确的电话号码！');
						return;
					}
					showWaiting();
					jQuery.ajax({
						type: "POST",
						url: '${base}/join/save/whichapp',
						data: jQuery('#joinForm').serialize(),
						dataType: 'json',
						cache: false,
						async:false,
						success: function(result){
							closeWaiting();
							popAlert(result.message);
							setTimeout(function(){jumpto(fullpath + '/join/whichapp');}, 2000);
							return;
						},
						error:function(result){
                                                        closeWaiting();
							popAlert(result.message);
							return;
						}
					});
				});

                //客服电话
                document.getElementById("tel").addEventListener('tap',function () {
                    if(ismobile)
                    {
                        plus.device.dial("09516025856");
                    }
                });

            //客服电话
            document.getElementById("tel1").addEventListener('tap',function () {
                if(ismobile)
                {
                    plus.device.dial("09516013888");
                }
            });
            }(mui, document));
        </script>
</body>
</html>
