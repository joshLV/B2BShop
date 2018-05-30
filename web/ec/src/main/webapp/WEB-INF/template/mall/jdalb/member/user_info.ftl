<!DOCTYPE html>
<html>
<head>
  <title>账户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="账户信息">
    <meta name="Keywords" content="账户信息">
    <link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
    <style>
        .breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
        .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

        .left {float: left;width: 150px;margin-right: 10px;}
        .right {float: right;width: 830px;}
    </style>
    <style>
        /**账户信息tab页签样式**/
        #memberinfo{border:1px solid #EED97C;padding:0 5px;position:relative}#memberinfo td{vertical-align:top}#memberinfo .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#memberinfo .i-ordertrack a{color:#005AA0}#memberinfo .tab{height:30px;line-height:30px;border-bottom:1px solid #EED97C;background:#FFFCEB;overflow:visible;}#memberinfo .tab li{border-right:1px solid #EED97C;cursor:pointer}#memberinfo .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}#memberinfo .tab .curr h2{position:relative;height:31px;background:#fff;color:#333;}#memberinfo .mc{padding:5px 8px;}#memberinfo .mc .extra{margin-top:10px;}#memberinfo th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #memberinfo .tab{overflow:hidden;}
        /**账户基本信息**/
        .form .item{display:inline-block;display:block;margin-bottom:20px;line-height:30px}.form .item span.label{float:left;height:18px;line-height:18px;padding:6px 0;width:100px;text-align:right;font-size:12px}.form em{color:#e4393c}.fl{float:left}.form .itxt-succ{background:url(${base}/static/img/succ-ico.png) right center no-repeat}.form .text{height:18px;width:127px;padding:5px 23px 5px 5px}.form .itxt,.form .selt,.form .sele,.form .area{line-height:18px;border:1px solid #ccc;padding:5px;float:none}.form input{font-size:12px}input{-webkit-rtl-ordering:logical;-webkit-user-select:text;cursor:auto}.clr{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0}.form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden}.form .jdradio{float:left;margin:8px 3px 10px 18px;padding:0}.user-set .birthday-info{width:397px;overflow:hidden}.form .selt1{width:70px}.form .selt{line-height:18px;border:1px solid #ccc;padding:5px;float:none}.form select{font-size:12px}select{-webkit-appearance:menulist;box-sizing:border-box;align-items:center;white-space:pre;-webkit-rtl-ordering:logical;color:black;background-color:white;cursor:default;margin:0;font:-webkit-small-control;letter-spacing:normal;word-spacing:normal;text-transform:none;text-indent:0;text-shadow:none;display:inline-block;text-align:start;-webkit-writing-mode:horizontal-tb}.form .birthday-info label{float:none;font-size:12px}.ml5{margin-left:5px}.mr5{margin-right:5px}.form .itxt1{width:305px}.form .selt,.form .sele{width:100px}.btn-5{border-radius:2px;display:inline-block;height:18px;line-height:18px;border:1px solid #bfd6af;padding:2px 14px 3px}.btn-5:link,.btn-5:visited{color:#323333;text-decoration:none}.btn-5:hover{background-image:linear-gradient(to top,#f6fbf3 0,#eef7e8 100%)}
    </style>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<div class="content">
    <div class="breadcrumb">
        <strong><a href="${base}/order/list">会员中心</a></strong><span>&nbsp;&gt;&nbsp;账户信息<span></span></span>
    </div><!--breadcrumb end-->
</div>

<div class="content">
    <!--左边菜单-->
    <div class="left">
        <#include "mall/jd/member/menu.ftl"/>
    </div>
    <!--右边内容区域-->
    <div class="right">
        <div class="m" id="memberinfo">
        <ul class="tab">
            <li id="baseInfo" class="curr baseInfo">
                <h2> 基本信息</h2>
            </li>
            <li id="headPhoto" class="headPhoto" style="display: none">
                <h2> 头像照片</h2>
            </li>
            <li id="more" class="more" style="display: none">
                <h2> 更多个人信息</h2>
            </li>
        </ul>
        <div class="clr"></div>
        <!--基本信息-->
        <div class="form" style="display: block;"><br><form id="baseInfoFrm">
            <div class="item">
                <span class="label">昵称：</span>
                <div class="fl" style="margin-left: -10px;">
                    <input type="text" class="itxt" maxlength="20" id="nickName" name="nickName" value="${member.nickName}" style="margin-left: 11px;width: 200px">
                    <div class="clr"></div><div class="prompt-06"><span id="nickName_msg"></span></div>
                </div>
            </div>
            <div class="item">
                <span class="label">性别：</span>
                <div class="fl">
                    <#if member.sex == 0>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0" checked><label for="sex_0" class="mr10">男</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>
                    <#elseif member.sex == 1>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10">男</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1" checked><label for="sex_1" class="mr10">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>
                    <#elseif member.sex == 2>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10">男</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_2" value="2" checked><label for="sex_2" class="mr10">保密</label>
                    <#else>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10">男</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>
                    </#if>
                </div>
            </div>
            <div class="item">
                <span class="label">生日：</span>
                <input type="hidden" id="birthday" name="member.birthday">
                <div class="fl birthday-info">
                    <select name="" class="selt selt1" id="birthdayYear">
                        <option value="0" disabled="" selected="selected">请选择：</option>
                    </select>
                    <script type="text/javascript">
                        var yearElement = $('#birthdayYear');
                        var _y = new Date().getFullYear();
                        for (var y = _y; y > (_y - 70); y--) {
                            $("<option value='" + y + "'>" + y + "</option>").appendTo(yearElement);
                        }
                    </script>
                    <label class="ml5 mr5">年</label>
                    <select name="" class="selt selt1" id="birthdayMonth"><option value="0" disabled="" selected="selected">请选择：</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                    <label class="ml5 mr5">月</label>
                    <select name="" class="selt selt1" id="birthdayDay"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option></select>
                    <label class="ml5 mr5">日</label>
                    <span class="ftx03"></span>
                </div>
            <#if member.birthday?if_exists>
                <#assign year=member.birthday?string("yyyy")>
                <#assign month=member.birthday?string("MM")>
                <#assign day=member.birthday?string("dd")>
                <script type="text/javascript">
                    $('#birthdayYear').val(${year});
                    $('#birthdayMonth').val(${month});
                    $('#birthdayDay').val(${day});
                    $('#birthday').val($('#birthdayYear').val() + '-' + $('#birthdayMonth').val() + '-' + $('#birthdayDay').val());
                </script>
            </#if>
            </div>

            <div class="item">
                <span class="label">手机：</span>
                <div class="fl">
                    <input type="text" class="itxt" maxlength="20" name="mobile" id="mobile" value="${member.mobile}" style="margin-left: 0">
                    <div class="clr"></div>
                    <div class="prompt-06"><span id="mobile_msg"></span></div>
                </div>
            </div>

            <div class="item">
                <span class="label">邮箱：</span>
                <div class="fl">
                    <div>
                        <input type="text" class="itxt" maxlength="30" name="email" id="email" style="width: 300px" value="${member.email}">
                        <div class="clr"></div>
                        <div class="prompt-06"><span id="email_msg"></span></div>
                    </div>
                </div>
                <div class="clr"></div>
            </div>

            <#--<div class="item">-->
                <#--<span class="label">真实姓名：</span>-->
                <#--<div class="fl">-->
                    <#--<input type="text" class="itxt itxt-succ" maxlength="20" name="userVo.realName" id="realName" value="${member.}">-->
                    <#--<div class="clr"></div><div class="prompt-06"><span id="realName_msg"></span></div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="item">-->
                <#--<span class="label">所在地：</span>-->
                <#--<div class="fl">-->
                    <#--<select name="userVo.province" class="selt mr5" id="province" value="7">-->
                        <#--<option value="1">北京</option>-->
                        <#--<option value="2">上海</option>-->
                        <#--<option value="3">天津</option>-->
                        <#--<option value="4">重庆</option>-->
                        <#--<option value="5">河北</option>-->
                        <#--<option value="6">山西</option>-->
                        <#--<option value="7">河南</option>-->
                        <#--<option value="8">辽宁</option>-->
                        <#--<option value="9">吉林</option>-->
                        <#--<option value="10">黑龙江</option>-->
                        <#--<option value="11">内蒙古</option>-->
                        <#--<option value="12">江苏</option>-->
                        <#--<option value="13">山东</option>-->
                        <#--<option value="14">安徽</option>-->
                        <#--<option value="15">浙江</option>-->
                        <#--<option value="16">福建</option>-->
                        <#--<option value="17">湖北</option>-->
                        <#--<option value="18">湖南</option>-->
                        <#--<option value="19">广东</option>-->
                        <#--<option value="20">广西</option>-->
                        <#--<option value="21">江西</option>-->
                        <#--<option value="22">四川</option>-->
                        <#--<option value="23">海南</option>-->
                        <#--<option value="24">贵州</option>-->
                        <#--<option value="25">云南</option>-->
                        <#--<option value="26">西藏</option>-->
                        <#--<option value="27">陕西</option>-->
                        <#--<option value="28">甘肃</option>-->
                        <#--<option value="29">青海</option>-->
                        <#--<option value="30">宁夏</option>-->
                        <#--<option value="31">新疆</option>-->
                        <#--<option value="32">台湾</option>-->
                        <#--<option value="42">香港</option>-->
                        <#--<option value="43">澳门</option>-->
                        <#--<option value="84">海外</option>-->
                    <#--</select>-->
                    <#--<select name="userVo.city" class="selt mr5" id="city" value="412"><option value="412">郑州市</option><option value="420">开封市</option><option value="427">洛阳市</option><option value="438">平顶山市</option><option value="446">焦作市</option><option value="454">鹤壁市</option><option value="458">新乡市</option><option value="468">安阳市</option><option value="475">濮阳市</option><option value="482">许昌市</option><option value="489">漯河市</option><option value="495">三门峡市</option><option value="502">南阳市</option><option value="517">商丘市</option><option value="527">周口市</option><option value="538">驻马店市</option><option value="549">信阳市</option><option value="2780">济源市</option></select>-->
                    <#--<select name="userVo.county" class="selt mr5" id="county" value="3545"><option value="413">巩义市</option><option value="415">新密市</option><option value="416">登封市</option><option value="417">中牟县</option><option value="2782">上街区</option><option value="3544">惠济区</option><option value="3545">金水区</option><option value="3546">管城回族区</option><option value="3547">二七区</option><option value="3548">中原区</option><option value="3718">荥阳市</option><option value="4197">高新区</option><option value="4337">郑东新区</option><option value="6911">新郑市（市区内，薛店，航空港区）</option><option value="6912">新郑市（除市区内，薛店，航空港区以外）</option></select>-->
                    <#--<div class="clr"></div><div class="prompt-06"><span id="city_msg"></span></div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="item">-->
                <#--<span class="label">&nbsp;</span>-->
                <#--<div class="fl">-->
                    <#--<input type="text" class="itxt itxt1" name="userVo.address" id="address" value="">-->
                    <#--<div class="clr"></div><div class="prompt-06"><span id="address_msg"></span></div>-->
                <#--</div>-->
            <#--</div>-->
            <div class="item">
                <span class="label">&nbsp;</span>
                <div class="fl">
                    <input id="code" value="970768" style="display:none">
                    <input id="rkey" value="736e6f5f315f67657455736572496e666fb5a5b3b5c9cfb5c4c0edcfeb393730373638" style="display:none">
                    <a href="javascript:void(0)" class="btn-5" onclick="updateUserInfo();">提交</a>
                </div>
            </div>
            </form>
        </div>
    </div>
    </div>
</div>
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $('#nickName').focus(function () {
            $('#nickName_msg').text('4-20个字符，可由中英文、数字、"_"、"-"组成');
        });
        $('#nickName').blur(function () {
            if ($(this).val() != "") {
                $(this).addClass('itxt-succ');
            }
            $('#nickName_msg').text('');
        });

        $('#email').blur(function () {
            var v = $(this);
            var s = v.val();
            var pattern = /^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
            if (s != "") {
                if (!pattern.exec(s)) {
                    v.val("");
                    v.focus();
                    $('#email_msg').text('请输入正确的邮箱地址');
                    v.removeClass('itxt-succ');
                } else {
                    $('#email_msg').text('');
                    v.addClass('itxt-succ');
                }
            } else {
                v.removeClass('itxt-succ');
                $('#email_msg').text('');
            }
        });

        $('#mobile').blur(function () {
            var v = $(this);
            var s = v.val();
            <#--
            var reg0 = /^13\d{5,9}$/;
            var reg1 = /^153\d{4,8}$/;
            var reg2 = /^159\d{4,8}$/;
            var reg3 = /^0\d{10,11}$/;
            var my = false;
            if (reg0.test(s))my = true;
            if (reg1.test(s))my = true;
            if (reg2.test(s))my = true;
            if (reg3.test(s))my = true;
            -->
            var my = false;
            if (s != "" && s.length != 11) {
                if (!my) {
                    v.val("");
                    v.focus();
                    $('#mobile_msg').text('请输入正确的手机号码');
                    v.removeClass('itxt-succ');
                } else {
                    $('#mobile_msg').text('');
                    v.addClass('itxt-succ');
                }
            } else {
                v.removeClass('itxt-succ');
                $('#mobile_msg').text('');
            }
        });

        $('.birthday-info select').bind('change', function () {
            var y = $('#birthdayYear').val();
            var m = $('#birthdayMonth').val();
            var d = $('#birthdayDay').val();
            var birthday = y + '-' + m + '-' + d;
            if (y != undefined && m != undefined && d != undefined) {
                $('#birthday').val(birthday);
            }
        });
    });

    /**
     * 更新账户信息
     */
    function updateUserInfo() {
        $.ajax({
            type: 'post',
            url: '${base}/member/updateMember.html',
            data: {
                nickName: $('#nickName').val(),
                sex: $('#baseInfoFrm [type=radio]:checked').val(),
                birthday: $('#birthday').val(),
                mobile: $('#mobile').val(),
                email: $('#email').val()
            },
            success: function (data) {
                if(data.status == 'success') {
                    alert("更新成功^_^");
                }
            }
        })
    }
</script>