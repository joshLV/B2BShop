<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>
<div id="container">
    <#include "bec/gdnz/top2.ftl"/>
    <div class="reg-box">
    <div class="reg">
        <h1>采购商注册</h1>
        <div class="reg_main">
            <ul class="reg_tit">
                <li class="">第一步：注册基本信息</li>
                <li class="lase on">第二步：公司资质信息</li>
            </ul>
            <div class="reg_tab">
                <form name="reg2" id="reg2" action="" method="post">
                <#--接收采购商基本信息表的ID 有以保存采购商证照表时使用-->
                    <input type="hidden" id="buyerId" name="buyerId" value="${buyerId}"/>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="295">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="yyzz">营业执照</label>：
                            </td>
                            <td align="left">
                                <input type="file" name="file" id="file1" value="" class="inp_text2" datatype="img" nullmsg="请选择营业执照文件扫描件文件！" />
                                <span id="picError1" class="error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="kh">开户许可证</label>：
                            </td>
                            <td align="left">
                                <input type="file" name="file" id="file2" value="" class="inp_text2" datatype="img" nullmsg="请选择开户许可证文件扫描件文件！" />
                                <span id="picError2" class="error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="swdj">税务登记证</label>：
                            </td>
                            <td align="left">
                                <input type="file" name="file" id="file3" value="" class="inp_text2" datatype="img" nullmsg="请选择税务登记证文件扫描件文件！" />
                                <span id="picError3" class="error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="zzjg">组织机构代码证</label>：
                            </td>
                            <td align="left">
                                <input type="file" name="file" id="file4" value="" class="inp_text2" datatype="img" nullmsg="请选择组织机构代码证文件扫描件文件！" />
                                <span id="picError4" class="error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>验 证 码：</td>
                            <td align="left">
                                <div class="fl item-ifo" id="hideYZM">
                                    <input type="text" value="" class="inp_text w120" name="authcode" id="authcode" style="height:36px;"  nullmsg="请输入验证码！"/>
                                    <label class="img"><img id="captchaImage" style="cursor:pointer;width:100px;height:38px; line-height:38px;display:block; float:left;" alt="验证码" src="${base}/captcha.jpg?yys=+new Date().getTime()" onclick="this.src='${base}/captcha.jpg?yys='+new Date().getTime()"></label>
                                    <label class="f-fl" style="line-height:34px; float:left;">&nbsp;看不清？<a href="javascript:void(0)" id="getCaptcha" onclick="document.getElementById('captchaImage').src='${base}/captcha.jpg?yys='+new Date().getTime()" class="flk13">换一张</a></label>
                                    <label id="authcode_succeed" class="blank invisible"></label>
                                    <label id="authcode_error"></label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input type="hidden" value="">
                                <input type="checkbox" class="checkbox" checked="true" id="readme" onclick="agreeonProtocol();">
                                <label for="protocol">我已阅读并同意
                                    <a href="${base}/html/gdnz/protocol.html" class="blue" id="protocol">《采购商注册协议》</a>
                                </label>
                                <label id="protocol_error" class="error hide" style="color: #DB0000;">请接受服务条款</label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" value="资质提交" class="inp_sub inp_sub2" />
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="fl" id = "pic">
                    <img id="image1" width="200" height="350"   onLoad="onLoadImage('1')"/>
                    <img id="image2" width="200" height="350"   onLoad="onLoadImage('2')"/>
                    <img id="image3" width="200" height="350"   onLoad="onLoadImage('3')"/>
                    <img id="image4" width="200" height="350"   onLoad="onLoadImage('4')"/>
                </div>

            </div>
        </div>
    </div>
        </div>
</div>

</div>
<link href="${base}/static/bec/project/gdnz/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script langue="javascript">
    $(function () {
        $("#pic").hide();
        /**
         * 验证form表单中的各个值
         * */
        $("#reg2").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{
                "img":function(gets,obj,curform,regxp) {
                    /*参数gets是获取到的表单元素值，
                      obj为当前表单元素，
                      curform为当前验证的表单，
                      regxp为内置的一些正则表达式的引用。*/
                    var fileId = obj[0].id;
                    var index = fileId.substring(fileId.length-1,fileId.length);
                    var img = new Image();
                    img.src = document.getElementById("image"+index).src;
                    if(img.width>400||img.height>850){
                        return false;
                    }
                    if(img.width==0||img.height==0){
                        return false;
                    }
                    agreeonProtocol();

                    return true;
                }
            },
            beforeSubmit:function(){
                $("#reg2").attr("action",${base}/+"member/saveDetails");
//                /**
//                 * 图片附和规格才能点击提交
//                 * */
//                for(var i=1;i < 5;i++){
//                    var img = new Image();
//                    img.src = document.getElementById("image"+index).src;
//                    if(img.width>400||img.height>850){
//                        return false;
//                    }
//                    if(img.width==0||img.height==0){
//                        return false;
//                    }
//                }
                /**
                 * 同意采购商注册协议后才可点击提交
                 * */
                if ($("#readme").is(':checked')) {
                    fileUpload();
                }
                return false;
            }
        });

        //$("#reg2").Validform({
//            tiptype:4,
//            label:".label",
//            beforeSubmit:function(){
        //  $("#reg2").attr("action",${base}/+"member/saveDetails");
        /**
         * 图片附和规格才能点击提交
         * */
//                for(var i=1;i < 5;i++){
//                    var img = new Image();
//                    img.src = document.getElementById("image"+index).src;
//                    if(img.width>400||img.height>850){
//                        return false;
//                    }
//                    if(img.width==0||img.height==0){
//                        return false;
//                    }
//                }
        /**
         * 同意采购商注册协议后才可点击提交
         * */
//                if ($("#readme").is(':checked')) {
//                    alert($("#readme").is(':checked'))
////                    fileUpload();
//                }
//                return false;
//            }
//        });


    });

    $("#file1").uploadPreview({ Img: "image1", Width: 0, Height: 0 })
    $("#file2").uploadPreview({ Img: "image2", Width: 0, Height: 0 })
    $("#file3").uploadPreview({ Img: "image3", Width: 0, Height: 0 })
    $("#file4").uploadPreview({ Img: "image4", Width: 0, Height: 0 })
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

    function onLoadImage(index){
        if(!validTagImage(index)){
            layer.alert("图片不符合规格,建议规格小于400*850",{icon:2});
//            $("#picError" +index).html("图片不符合规格,建议规格小于400*850");
//            location.href = "#picError" +index;
            return false;
        }else{
            $("#picError" +index).html("");
            return true;
        }
    }
    /**
     * 上传相应证照(图片)信息
     * */
    function fileUpload(){
        var data = $('#reg2').serialize();
        $.ajaxFileUpload({
            url:"${base}/member/saveDetails?"+data,
            secureuri:true,//是否启用安全提交,默认为false
            fileElementId:$('input[name=file]'),//文件选择框的对象,多个时用[]包含
            dataType:'text',
            async:true,
            success:function(data){
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                if(data.status=='success'){
                    layer.alert('注册成功！审核后我们会及时通知您审核结果。',{icon:1, area: '390px'},function(){
                        window.location=${base}/+"index";
                    });
                }else{
                    layer.alert(data.message,{icon:2});
                }
            },
            error:function(data){ //服务器响应失败时的处理函数
                layer.alert('error',{icon:2});
            }
        });
    }


    function show(popupdiv)
    {
        var Idiv=document.getElementById(popupdiv);
        Idiv.style.display="block";
        Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px";
        Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+document.documentElement.scrollTop-50+"px";
        var procbg = document.createElement("div");
        procbg.setAttribute("id","mybg");
        procbg.style.background = "#000000";
        procbg.style.width = "100%";
        procbg.style.height = "100%";
        procbg.style.position = "fixed";
        procbg.style.top = "0";
        procbg.style.left = "0";
        procbg.style.zIndex = "500";
        procbg.style.opacity = "0.5";
        procbg.style.filter = "Alpha(opacity=50)";

        document.body.appendChild(procbg);
        document.body.style.overflow = "hidden";
        var posX;
        var posY;
        Idiv.onmousedown=function(e)
        {
            if(!e) e = window.event;
            posX = e.clientX - parseInt(Idiv.style.left);
            posY = e.clientY - parseInt(Idiv.style.top);
            document.onmousemove = mousemove;
        }
        document.onmouseup = function()
        {
            document.onmousemove = null;
        }
        function mousemove(ev)
        {
            if(ev==null) ev = window.event;
            Idiv.style.left = (ev.clientX - posX) + "px";
            Idiv.style.top = (ev.clientY - posY) + "px";
        }
    }
    function closeDiv(popupdiv)
    {
        var Idiv=document.getElementById(popupdiv);
        Idiv.style.display="none";
        document.body.style.overflow = "auto";
        var body = document.getElementsByTagName("body");
        var mybg = document.getElementById("mybg");
        body[0].removeChild(mybg);
    }
    //判断采购商注册协议是否同意
    function agreeonProtocol(){
        if ($("#readme").prop("checked") == true) {
            $("#protocol_error").removeClass().addClass("error hide");
            return true;
        }else{
            $("#protocol_error").removeClass().addClass("error");
            return false;
        }
    }
    $("#protocol").colorbox({title:"采购商注册协议", iframe:true, innerWidth:600, innerHeight:500, opacity: 0.15});
</script>
    <#include "bec/gdnz/service2.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
</#escape>