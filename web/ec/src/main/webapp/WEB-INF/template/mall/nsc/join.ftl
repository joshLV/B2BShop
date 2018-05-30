<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <#--<link href="${base}/static/mall/nsc/css/base.css" rel="stylesheet" type="text/css" media="all"/>-->

    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
    <script src="${base}/static/mall/nsc/js/Validform_v5.3.2.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script src="${base}/static/mall/nsc/js/Area.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/AreaData_min.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"join"
        };
    </script>
    <script type="text/javascript">
        $(function() {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".u-cates-li").hover(function(e) {
                $(this).css("background","#f0f0f0");
                $(this).addClass("u-cates-over").removeClass(".u-cates-li");
            },function(e){
                $(this).removeClass("u-cates-over").addClass(".u-cates-li");
                $(".u-cates-li:even").css("background-color","#fafafa");
            });
            $(".m-floor1-text a").mouseover(function(e) {
                $(this).parent().parent().find("a").removeClass("u-floor1-used");
                $(this).addClass("u-floor1-used");
            });



        });

    </script>
</head>
<body>
<#assign path="mall/nsc">
<div class="g-doc">
    <#--页眉-->
    <div class="g-hd">
        <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
            <div class="g-main">
                <form id="ibInfo" class="registerform">
                    <div class="u-zsrz">
                        <div class="u-zsrz-form">
                            <ul>
                                <li><span>商家名称<font color="red">*</font>：</span><input type="text" datatype="*" id="name" name="name" class="u-input"></li>
                                <#--<li><span>所属地区：</span>-->
                                    <#--<select id="province" name="province" onChange="changeComplexProvince(this.value, sub_array, 'city');"></select>-->
                                    <#--<select id="city" name="city"></select>-->
                                <#--</li>-->
                                <li><span>详细地址<font color="red">*</font>： </span><input type="text" id="address" name="address" class="u-input"></li>
                                <li><span>负责人<font color="red">*</font>：</span><input type="text" id="head" name="head" class="u-input"></li>
                                <li><span>手机号<font color="red">*</font>：</span><input type="text" id="mobile" name="mobile" class="u-input"></li>
                                <li><span>固定电话：</span><input type="text" id="telphone" name="telphone" class="u-input"></li>
                                <li><span>营业执照编码<font color="red">*</font>：</span><input type="text" id="businessLicenseCode" name="businessLicenseCode" class="u-input"></li>
                                <li><span>备注：</span><textarea id="remarks" name="remarks" class="u-input"></textarea></li>
                                <li style="text-align: center; padding-top: 20px;">
                                    <#--<input type="submit" value="" onclick="submitForm();" style="background:url(${base}/static/mall/nsc/img/btn.png) center center no-repeat; width:362px; height:47px; border:#ffffff solid 0px;"/>-->
                                    <button type="submit" onclick="return submitInfo();" style="background:url(${base}/static/mall/nsc/img/btn.png) center center no-repeat; width:362px; height:47px; border:#ffffff solid 0px;"></button>
                                    <span id="msgdemo2" style="margin-left:30px;"></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="u_qj">
                <h3>农资电商前景</h3>
                <div class="u_qj_in">
                    <img src="${base}/static/mall/nsc/img/021.jpg">
                </div>
            </div>
            <div class="u_qj">
                <h3>入驻方式</h3>
                <div class="u_qj_in">
                    <img src="${base}/static/mall/nsc/img/022.jpg">
                </div>
            </div>
            <#include "${path}/service.ftl"/>
    </div>
    <#include "${path}/footer.ftl"/>
</div>

<script type="text/javascript">
    function submitInfo(){
        if($("#name").val() == ""){
            alert("商家名称不能为空，请填写完整信息！");
            $("#name").focus();
            return false;
        }
        if($("#address").val() == ""){
            alert("详细地址不能为空，请填写完整信息！");
            $("#address").focus();
            return false;
        }
        if($("#head").val() == ""){
            alert("负责人不能为空，请填写完整信息！");
            $("#head").focus();
            return false;
        }
        if($("#mobile").val() == ""){
            alert("手机号不能为空，请填写完整信息！");
            $("#mobile").focus();
            return false;
        }
        if($("#businessLicenseCode").val() == ""){
            alert("营业执照编码不能为空，请填写完整信息！");
            $("#businessLicenseCode").focus();
            return false;
        }
        $.ajax({
            type: "post",
            url: "${base}/join/save/whichweb",
            data:$("#ibInfo").formSerialize(),
            dataType: "json",
            async:false,
            success: function (data) {
                alert(data.message);
                window.location.href = "${base}/join/index/whichweb";
            },
            error : function(error) {
                alert(error.message);
            }
        });
    }
</script>

</body>
</html>