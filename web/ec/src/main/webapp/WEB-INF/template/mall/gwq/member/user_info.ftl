<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 14px;font-family: "microsoft yahei";}
    .main{border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;}
    .left {float: left;width: 195px;/*margin-right: 10px;*/margin-bottom: -9999999px; padding-bottom: 9999999px; border-right: 1px solid #E8E8E8; background: #ffffff;}
    .right {float: right;width:1024px; margin-bottom: -9999999px; padding-bottom: 9999999px; background: #ffffff;}
    .right a:link, .right a:visited{
        color: #005ea7;
    }
</style>
<style>
    /**账户信息tab页签样式**/
    #memberinfo{/*padding:0 5px;*/position:relative}#memberinfo td{vertical-align:top}#memberinfo .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#memberinfo .i-ordertrack a{color:#005AA0}
    #memberinfo .tab{height:40px;line-height:40px;overflow:visible; background: #F9F9F9; /*border-bottom: none; border-bottom: 2px solid #C30000;*/}#memberinfo .tab li{/*border-right:1px solid #EED97C;*/cursor:pointer}#memberinfo .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}
    #memberinfo .tab .curr h2{position:relative;height:31px; color:#333; color: #333333;}#memberinfo .mc{padding:5px 8px;}#memberinfo .mc .extra{margin-top:10px;}#memberinfo th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #memberinfo .tab{overflow:hidden;}
    /**账户基本信息**/
    .forms{/*border: 1px solid #E8E8E8; border-top: none;*/}
    .forms .item{display:inline-block;display:block;margin-bottom:20px;line-height:30px; }
    .forms .item span.label{float:left;height:18px;line-height:18px;padding:6px 0;width:100px;text-align:right;font-size:12px}
    .forms em{color:#e4393c}.fl{float:left}
    .forms .itxt-succ{background:url(${base}/static/img/succ-ico.png) right center no-repeat}
    .forms .text{height:18px;width:127px;padding:5px 23px 5px 5px}
    .forms .itxt,.forms .selt,.forms .sele,.forms .area{line-height:18px;border:1px solid #ccc;padding:5px;float:none}
    .forms input{font-size:12px}input{-webkit-rtl-ordering:logical;-webkit-user-select:text;cursor:auto}.clr{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0}
    .forms .item:after{content:".";display:block;height:0;clear:both;visibility:hidden}
    .forms .jdradio{float:left;margin:8px 3px 10px 18px;padding:0}.user-set .birthday-info{width:397px;overflow:hidden}
    .forms .selt1{width:70px}
    .forms .selt{line-height:18px;border:1px solid #ccc;padding:5px;float:none}
    .forms select{font-size:12px}select{-webkit-appearance:menulist;box-sizing:border-box;align-items:center;white-space:pre;-webkit-rtl-ordering:logical;color:black;background-color:white;cursor:default;margin:0;font:-webkit-small-control;letter-spacing:normal;word-spacing:normal;text-transform:none;text-indent:0;text-shadow:none;display:inline-block;text-align:start;-webkit-writing-mode:horizontal-tb}
    .forms .birthday-info label{float:none;font-size:12px}.ml5{margin-left:5px}.mr5{margin-right:5px}
    .forms .itxt1{width:305px}
    .forms .selt,.forms .sele{width:100px}
    .btn-5{border-radius:3px;display:inline-block;height:18px;line-height:18px;background:#86c226;padding:2px 14px 3px; color: #ffffff !important;}.btn-5:link,.btn-5:visited{color:#ffffff;text-decoration:none}
    .btn-5:hover{background:#86c226;}
    .prompt-06{margin-left: 10px;}
</style>
    <#include "mall/gwq/header_new.ftl"/>



<!--左边菜单-->
<div class="left">
    <#import "mall/gwq/member/menu.ftl" as memu>
		<@memu.menu id="zhxx"/>
</div>
<!--右边内容区域-->
<div class="right">
    <div class="breadcrumb">
        <strong><a href="${base}/order/list">会员中心</a></strong><span>&nbsp;&gt;&nbsp;账户信息<span></span></span>
    </div><!--breadcrumb end-->
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
        <div class="forms" style="display: block;"><br><form id="baseInfoFrm">
            <div class="item">
                <span class="label">真实姓名：</span>
                <div class="fl" style="margin-left: -10px;">
                    <input type="text" class="itxt" maxlength="20" id="nickName" name="nickName" value="${member.nickName}" style="margin-left: 11px;width: 200px">
                    <div class="clr"></div><div class="prompt-06"><span id="nickName_msg"></span></div>
                </div>
            </div>
            <div class="item">
                <span class="label">性别：</span>
                <div class="fl">
                    <#if member.sex == 0>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0" checked><label for="sex_0" class="mr10 fl">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10">男</label>
                    <#--<input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>-->
                    <#elseif member.sex == 1>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10 fl">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1" checked><label for="sex_1" class="mr10">男</label>
                    <#--<input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>-->
                    <#elseif member.sex == 2>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10">男</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10 fl">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_2" value="2" checked><label for="sex_2" class="mr10">保密</label>
                    <#else>
                        <input type="radio" name="sex" class="jdradio" id="sex_0" value="0"><label for="sex_0" class="mr10 fl">女</label>
                        <input type="radio" name="sex" class="jdradio" id="sex_1" value="1"><label for="sex_1" class="mr10">男</label>
                    <#--<input type="radio" name="sex" class="jdradio" id="sex_2" value="2"><label for="sex_2" class="mr10">保密</label>-->
                    </#if>
                </div>
            </div>
            <div class="item">
                <span class="label">生日：</span>
                <input type="text" id="birthday" name="member.birthday"  value="${member.birthday?string("yyyy-MM-dd")}">
               <#-- <div class="fl birthday-info">
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
                </#if>-->
            </div>

            <div class="item">
                <span class="label">手机：</span>
                <div class="fl">
                    <input type="text" class="itxt" maxlength="11" name="mobile" disabled id="mobile" value="${member.mobile}" style="margin-left: 0">
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
<script type="text/javascript" src="${base}/static/js/laydate/laydate.js"></script>
<script type="text/javascript">
    $(function () {
        laydate.skin('huanglv');
        laydate({
            elem: '#birthday',
            max: laydate.now(),
            <#if member.birthday?if_exists> start:'${member.birthday}'</#if>
        });
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });
        $("#pe").hide();
        $("#pf").hide();

    });
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
                //mobile: $('#mobile').val(),
                email: $('#email').val()
            },
            success: function (data) {
                if(data.status == 'success') {
                    layer.alert("更新成功",{icon:1});
                }
            }
        })
    }
</script>
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>