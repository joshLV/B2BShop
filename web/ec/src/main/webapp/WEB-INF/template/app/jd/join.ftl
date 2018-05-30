<!DOCTYPE html>
<html>
	<head>
	<#include "app/jd/head.ftl">
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
			  <form class="mui-input-group registerform" action="${base}/join/save/whichapp" method="post" >
					<div class="mui-input-row" >
						<label>品牌名称</label>
						<input type="text" name="name"  datatype="*"  placeholder="请输入品牌" >
					</div>

					<div class="mui-input-row">
					  <label>联系人</label>
					  <input type="text" name="head" datatype="*" placeholder="请输入联系人">
					  </div>
					<div class="mui-input-row">
					  <label>手机号</label>
					  <input type="text" name="mobile" datatype="m" placeholder="请输入手机号">
					</div>
                  <div class="mui-input-row">
                      <label>固定电话</label>
                      <input type="text" name="telphone" datatype="*" placeholder="请输入固定电话号">
                  </div>
                  <div class="mui-input-row">
                      <label>详细地址</label>
                      <input type="text" name="address" datatype="m" placeholder="请输入详细地址">
                  </div>
                  <div class="mui-input-row">
                      <label>营业执照</label>
                      <input type="text" name="businessLicenseCode" datatype="*" placeholder="请输入营业执照编号">
                  </div>
			    <div class="mui-button-row"  style="border-bottom:none;">
			      <button type="submit" class="mui-btn-bc">保存</button>
			    </div>
			    </form>
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
	<#include "app/jd/tools.ftl"/>
        <script>
            (function(mui, doc) {
                //客服电话
                document.getElementById("tel").addEventListener('tap',function () {
                    if(ismobile)
                    {
                        plus.device.dial("09516025856");
                    }else{
                        alert("使用APP可以直接拨打电话！");
                    }
                });
                jQuery(".registerform").submit(function(){
					alert("保存成功！");
					return false;
				});

            //客服电话
            document.getElementById("tel1").addEventListener('tap',function () {
                if(ismobile)
                {
                    plus.device.dial("09516013888");
                }else{
                    alert("使用APP可以直接拨打电话！");
                }
            });
            }(mui, document));
        </script>
</body>
</html>
