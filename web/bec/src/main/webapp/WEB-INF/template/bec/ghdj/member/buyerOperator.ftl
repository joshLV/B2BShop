<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/buerOperator/list">操作员管理</a></strong><span>&nbsp;&gt;&nbsp;操作员</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="buyerOperator"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>操作员</em></h1>
            <div class="user_right p10">
                <div class="fore0ss">
                    <div class="filter_div">
                        <input type="text" class="filter_input" name="search_userName" id="search_userName" onblur="searchBuyerOperator();" placeholder="用户名(手机号)" value="${search_userName}"/>
                        <a href="javascript:void(0)" class="mn_del" style="top: 8px; right: 0px; display: block;" onclick="$('#search_userName').val('');searchBuyerOperator();"></a>
                    </div>
                    <div class="filter_div">
                        <input type="text" class="filter_input" name="search_realName" id="search_realName" onblur="searchBuyerOperator();" placeholder="真实名称" value="${search_realName}"/>
                        <a href="javascript:void(0)" class="mn_del" style="top: 8px; right: 0px; display: block;" onclick="$('#search_realName').val('');searchBuyerOperator();"></a>
                    </div>
                    <div class="filter_btn_div">
                        <a href="javascript:void(0)" class="search_btn" onclick="searchBuyerOperator();" >查&nbsp;&nbsp;询</a>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="tb-void" style="margin-top: 5px !important;">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="buyerOperatorDataTable">
                        <tbody>
                        <tr>
                            <th width="80">用户名</th>
                            <th width="80">真实姓名</th>
                            <th width="120">邮箱</th>
                            <#--<th width="80">手机号</th>-->
                            <th width="50">是否启用</th>
                            <th width="170">角色</th>
                            <th width="100">创建时间</th>
                            <th width="100">操作</th>
                        </tr>
                        <#if goodslist?? && goodslist?size &gt; 0 >

                            <#list goodslist as list>
                            <tr>
                                <td width="80">${list.userName}</td>
                                <td width="80">${list.realName}</td>
                                <td width="120">${list.email}</td>
                                <#--<td width="80">${list.mobile}</td>-->
                                <td width="50"><#if list.isvalid == 1>启用<#else>未启用</#if></td>
                                <td width="170">${list.roleNameChn}</td>
                                <td width="100">${list.changeTime}</td>
                                <td width="100">
                                    <input class="btn-5ss" type="button" value="编辑" onclick="updateBuyerOperator('${list.id}');">
                                    <#if list.isvalid != 1>
                                        <input class="btn-5ssr" type="button" value="删除" onclick="deleteBuyerOperator('${list.id}','${list.isvalid}');">
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            <#--<tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">-->
                                <#--<#if (goodslist?size==pager.totalCount)>-->
                                    <#--<td colspan="7" align="center" style="color: #ff0000;">没有了...</td>-->
                                <#--<#else>-->
                                    <#--<td colspan="7" align="center" style="color: #ff0000;">下拉加载更多数据!</td>-->
                                <#--</#if>-->
                            <#--</tr>-->

                        <#else>
                        <tr>
                            <td colspan="7">
                                <div class="nocont-box nocont-order">
                                    <b class="icon-order"></b>你还没有添加操作员！
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if goodslist?size==pager.totalCount>
                                <td colspan="7" align="center" style="color: #ff0000;">没有了...</td>
                            <#else>
                                <td colspan="7" align="center" style="color: #ff0000;">下拉加载更多数据!</td>
                            </#if>
                        </tr>
                    </table>
                    <div style="margin-left: 10px; width: 99%; margin-top: 10px; float: left; margin-bottom: 10px;">
                        <input class="btn-5-new" type="button" value="新 增" onclick="newBuyerOperator();">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <form name="reg1" id="reg1" action="" method="post">
    <div class="pop_win aptab_center_address">
        <ul class="newaddress">
            <li id="mob_mess_hide">
                <label> <strong style="color: red;">*</strong>&nbsp;用户名(手机号)： </label>
                <input type="text" id="buyerOperator_userName"  name="buyerOperator_userName" onblur="checkMobiles('0');" value="" class="inputxt" style="width: 200px;" datatype="m" nullmsg="请填写用户名!" errormsg="手机号码格式不正确!">
                <span id="showMOB" class="hide">此号码已经被注册!</span>
            </li>
            <li>
                <label> <strong style="color: red;">*</strong>&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码： </label>
                <input type="password" name="buyerOperator_passwd" id="buyerOperator_passwd" class="inputxt" style="width: 200px;" datatype="*6-20" nullmsg="请填写密码!" />
            </li>
            <li>
                <label> <strong style="color: red;">*</strong>&nbsp;确&nbsp;&nbsp;&nbsp;认&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码： </label>
                <input type="password" name="buyerOperator_repasswd" id="buyerOperator_repasswd" class="inputxt" style="width: 200px;" datatype="*6-20" recheck="buyerOperator_passwd" nullmsg="请填写确认密码!" />
            </li>
            <li>
                <label> <strong style="color: red;">*</strong>&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>
                <input type="text"  id="buyerOperator_email" name="buyerOperator_email" value="" style="width:200px;" datatype="e" maxlength="32" nullmsg="请填写邮箱!" errormsg="邮箱格式错误!">
            </li>
            <li>
                <label> <strong style="color: red;">*</strong>&nbsp;真&nbsp;&nbsp;&nbsp;实&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;名： </label>
                <input type="text"  id="buyerOperator_realName" name="buyerOperator_realName" value="" style="width:200px;" datatype="zh2-4" nullmsg="请填写真实姓名!">
            </li>
            <li id="popupdiv_role">
                <label> <strong style="color: red;">*</strong>&nbsp;角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色： </label>

                <#list roleMap as map>
                <b>
                  <#list map?keys as key>
                    <#if key_index==0>
                      </span><input type="checkbox" id="checkbox-1-${key_index+1}" class="regular-checkbox" name="buyerOperator_roleValue" value="${key}" datatype="need1" nullmsg="请至少分配一个角色!"> <label for="checkbox-1-${key_index+1}" style="width: auto !important;"></label> ${map[key]} &nbsp;&nbsp;
                    <#else>
                      <input type="checkbox" id="checkbox-1-${key_index+1}" class="regular-checkbox" name="buyerOperator_roleValue" value="${key}"><label for="checkbox-1-${key_index+1}" style="width: auto !important;"></label> ${map[key]} &nbsp;&nbsp;
                    </#if>
                  </#list>
                    </b>
                </#list>

                <#--<label id="popupdiv_role"></label>-->
                <#--<input type="checkbox" id="checkbox-1-1" class="regular-checkbox" name="buyerOperator_roleValue" value="buyer" datatype="need1" nullmsg="请至少分配一个角色!"> <label for="checkbox-1-1" style="width: auto !important;"></label>采购员&nbsp;&nbsp;-->
                <#--<input type="checkbox" id="checkbox-1-2" class="regular-checkbox" name="buyerOperator_roleValue" value="payment"><label for="checkbox-1-2" style="width: auto !important;"></label> 付款员&nbsp;&nbsp;-->
                <#--<input type="checkbox" id="checkbox-1-3" class="regular-checkbox" name="buyerOperator_roleValue" value="receipt"><label for="checkbox-1-3"  style="width: auto !important;"></label> 收货员&nbsp;&nbsp;-->
                <#--<input type="checkbox" id="checkbox-1-4" class="regular-checkbox" name="buyerOperator_roleValue" value="inspection"><label for="checkbox-1-4"  style="width: auto !important;"></label> 验货员&nbsp;&nbsp;-->
            </li>
            <li>
                <label> <strong style="color: red;">*</strong>&nbsp;是&nbsp;&nbsp;&nbsp;否&nbsp;&nbsp;&nbsp;启&nbsp;&nbsp;&nbsp;用： </label>
                <input id="radio-1-1"  class="regular-radio" type="radio"  value="1" name="buyerOperator_isvalid" /><label for="radio-1-1" style="width: auto !important;"></label>启用&nbsp;&nbsp;
                <input id="radio-1-2"  class="regular-radio" type="radio"  value="0" name="buyerOperator_isvalid" /><label for="radio-1-2" style="width: auto !important;"></label>未启用&nbsp;&nbsp;
            </li>
            <li>
                <input type="submit" value="保 存"   class="btn_save  bule_btn" />
            </li>
        </ul>
    </div>
    </form>
</div>

<div class="popGeneral_address" id="popupdiv_edit" style="display:none;">
    <form name="reg1" id="reg1_edit" action="" method="post">
        <input type="hidden" name="editid" value="" id="editid">
        <input type="hidden" name="userNameHiddenId" value="" id="userNameHiddenId">
        <div class="pop_win aptab_center_address" style="padding: 0 !important;">
            <ul class="newaddress" style="width: auto !important;">
                <li id="mob_mess_hide_edit">
                    <label> <strong style="color: red;">*</strong>&nbsp;用户名(手机号)： </label>
                    <input type="text" id="buyerOperator_userName_edit"  name="buyerOperator_userName_edit" onblur="checkMobiles('1');" value="" class="inputxt" style="width: 200px;" datatype="m" nullmsg="请填写用户名!" errormsg="手机号码格式不正确!">
                    <span id="showMOB_edit" class="hide">此号码已经被注册!</span>
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码： </label>
                    <input type="password" name="buyerOperator_passwd_edit" id="buyerOperator_passwd_edit" class="inputxt" style="width: 200px;" ignore="ignore" datatype="*6-20" />
                    <b style="color: red;">不填代表不修改!</b>
                </li>
                <#--<li>-->
                    <#--<label> <strong style="color: red;">*</strong>&nbsp;确认密码： </label>-->
                    <#--<input type="password" name="buyerOperator_repasswd_edit" id="buyerOperator_repasswd_edit" class="inputxt" style="width: 200px;" datatype="*0-20" recheck="buyerOperator_passwd" />-->
                <#--</li>-->
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>
                    <input type="text"  id="buyerOperator_email_edit" name="buyerOperator_email_edit" value="" style="width:200px;" datatype="e" maxlength="32" nullmsg="请填写邮箱!" errormsg="邮箱格式错误!">
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;真&nbsp;&nbsp;&nbsp;实&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;名： </label>
                    <input type="text"  id="buyerOperator_realName_edit" name="buyerOperator_realName_edit" value="" style="width:200px;" datatype="zh2-4" nullmsg="请填写真实姓名!">
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色： </label>
                    <#--<label id="popupdiv_edit_role"></label>-->
                    <#list roleMap as map>
                        <b>
                            <#list map?keys as key>
                                <#if key_index==0>
                                    </span><input type="checkbox" id="checkbox-2-${key_index+1}" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="${key}" datatype="need1" nullmsg="请至少分配一个角色!"> <label for="checkbox-2-${key_index+1}" style="width: auto !important;"></label> ${map[key]} &nbsp;&nbsp;
                                <#else>
                                    <input type="checkbox" id="checkbox-2-${key_index+1}" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="${key}"><label for="checkbox-2-${key_index+1}" style="width: auto !important;"></label> ${map[key]} &nbsp;&nbsp;
                                </#if>
                            </#list>
                        </b>
                    </#list>
                    <#--<input type="checkbox" id="checkbox-2-1" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="buyer" datatype="need1" nullmsg="请至少分配一个角色!"><label for="checkbox-2-1"  style="width: auto !important;"></label> 采购员&nbsp;&nbsp;-->
                    <#--<input type="checkbox" id="checkbox-2-2" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="payment"><label for="checkbox-2-2"  style="width: auto !important;"></label> 财会员&nbsp;&nbsp;-->
                    <#--<input type="checkbox" id="checkbox-2-3" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="receipt"><label for="checkbox-2-3"  style="width: auto !important;"></label> 收货员&nbsp;&nbsp;-->
                    <#--<input type="checkbox" id="checkbox-2-4" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="inspection"><label for="checkbox-2-4"  style="width: auto !important;"></label> 验货员&nbsp;&nbsp;-->
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;是&nbsp;&nbsp;&nbsp;否&nbsp;&nbsp;&nbsp;启&nbsp;&nbsp;&nbsp;用： </label>
                    <input id="radio-2-1"  class="regular-radio" type="radio"  value="1" name="buyerOperator_isvalid_edit" /><label for="radio-2-1" style="width: auto !important;"></label>启用&nbsp;&nbsp;
                    <input id="radio-2-2"  class="regular-radio" type="radio"  value="0" name="buyerOperator_isvalid_edit" /><label for="radio-2-2" style="width: auto !important;"></label>未启用&nbsp;&nbsp;
                </li>
                <li>
                    <input type="submit" value="保 存"   class="btn_save  bule_btn" />
                </li>
            </ul>
        </div>
    </form>
</div>

<script src="${base}/static/bec/project/ghdj/js/buyer_operator/ajaxBuyerOperator.js" type="text/javascript"></script>
<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        /**
         * 验证form表单中的各个值
         * */
        $("#reg1").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{
                "need1":function(gets,obj,curform,regxp){
                    var need=1,
                            numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
                    alert('numselected='+numselected);
                    return  numselected >= need ? true : "请至少选择"+need+"项！";
                }
            },
            beforeSubmit:function(){
                $("#reg1").attr("action",${base}/+"buerOperator/save?r=" + Math.random());

            },
            callback:function(data){
                layer.closeAll();
                if(data.status=='success'){
                    layer.alert("创建成功!",{icon:7});
                    window.location="${base}/buerOperator/list";
                }else{
                    layer.alert(data.message,{icon:2});
                }
            }
        });

        $("#reg1_edit").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{
                "need1":function(gets,obj,curform,regxp){
                    var need=1,
                            numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
                    return  numselected >= need ? true : "请至少选择"+need+"项！";
                }
            },
            beforeSubmit:function(){
                $("#reg1_edit").attr("action",${base}/+"buerOperator/update?r=" + Math.random());

            },
            callback:function(data){
                layer.closeAll();
                if(data.status=='success'){
                    layer.alert("编辑成功!",{icon:7});
                    window.location="${base}/buerOperator/list";
                }else{
                    layer.alert(data.message,{icon:2});
                }
            }
        });

    });

    /**
     * Desc:根据用户名或真实姓名查询操作员
     * */
    function searchBuyerOperator(){
        var search_userName = $("#search_userName").val();
        var search_realName = $("#search_realName").val();

//        if(isEmpty(search_userName) && isEmpty(search_realName)){
//            layer.alert("请填写用户名或真实姓名!",{icon:7});
//            return;
//        }

        if(!isEmpty(search_userName)){
            var mbFormat = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if(!mbFormat.test(search_userName)){
                layer.alert("手机号格式错误，请重新填写!",{icon:7});
                return;
            }
        }

        if(!isEmpty(search_realName)){
            var mbFormat = /^[\u4e00-\u9fa5]{2,4}$/;
            if(!mbFormat.test(search_realName)){
                layer.alert("真实姓名必须为2到4个汉字!",{icon:7});
                return;
            }
        }

        window.location="${base}/buerOperator/list?search_userName="+search_userName+"&search_realName="+search_realName;

    }

    /**
     * Desc:新增操作员弹出DIV
     * */
    function newBuyerOperator() {
        $("#reg1 div ul input").each(function() {
            $(this).removeClass("Validform_error");
        });

        $("#reg1 div ul span span").each(function() {
            $(this).removeClass("Validform_wrong");
            $(this).removeClass("Validform_right");
            $(this).text('');
        });

        $("#reg1 div ul b span").each(function() {
            $(this).removeClass("Validform_wrong");
            $(this).removeClass("Validform_right");
            $(this).text('');
        });

        $("input[name='buyerOperator_roleValue']").each(function(){
            this.checked = false;
        });
        $("input[name='buyerOperator_isvalid']").each(function(){
            if($(this).val() == 1){
                this.checked = true;
            } else {
                this.checked = false;
            }
        });
//
//        $("#popupdiv_role span").each(function(){
//            this.remove();
//        });

        <#--$.ajax( {-->
            <#--type : "POST",-->
            <#--async: false,-->
            <#--dataType : "json",-->
            <#--url : ${base}/+ "buerOperator/getAllRole",-->
            <#--data : {},-->
            <#--cache : false,-->
            <#--success : function(data) {-->
                <#--if(data.status=="success"){-->
                    <#--var html = '';-->
                    <#--if(!isEmpty(data.allRole)){-->
                        <#--var allRole= new Array();-->
                        <#--allRole = data.allRole.split("--");-->
                        <#--for(var i=0;i<allRole.length;i++){-->
                            <#--html += '<input type="checkbox" id="checkbox-1-'+(i+1)+'" class="regular-checkbox" name="buyerOperator_roleValue" value="';-->
                            <#--var allRoleValue = new Array();-->
                            <#--allRoleValue = allRole[i].split("_");-->
                            <#--for(var j=0;j<allRoleValue.length;j++){-->
                                <#--if(j== 0){-->
                                    <#--html += allRoleValue[j]+'"';-->
                                <#--}-->

                                <#--if(i==0 && j== 0){-->
                                    <#--html += ' datatype="need1" nullmsg="请至少分配一个角色!" ';-->
                                <#--}-->

                                <#--if(j== 0){-->
                                    <#--html += ' >';-->
                                <#--}-->
                                <#--if(j== 1){-->
                                    <#--html += ' <label for="checkbox-1-'+(i+1)+'" style="width: auto !important;"></label>'+allRoleValue[j]+'&nbsp;&nbsp;';-->
                                <#--}-->
                            <#--}-->

                        <#--}-->
                        <#--$("#popupdiv_role").append(html);-->
                    <#--}-->
                <#--}-->
            <#--},-->
            <#--error : function(XMLHttpResponse) {-->
                <#--alert("网络异常，请稍后重试！");-->
            <#--}-->
        <#--});-->

        $("#buyerOperator_userName").val('');
        $("#buyerOperator_passwd").val('');
        $("#buyerOperator_repasswd").val('');
        $("#buyerOperator_email").val('');
        $("#buyerOperator_realName").val('');

        layer.open({
            type: 1,
            title:'新增操作员',
            area:["700px","405px"],
            scrollbar:false,
            content: $('#popupdiv') //这里content是一个DOM
        });
    }

    /**
     * Desc:点击编辑操作员 获取操作员数据
     * */
    function updateBuyerOperator(id){
        if(!isEmpty(id)){
            $("#buyerOperator_userName_edit").val('');
            $("#buyerOperator_passwd_edit").val('');
            $("#buyerOperator_repasswd_edit").val('');
            $("#buyerOperator_realName_edit").val('');
            $("#buyerOperator_email_edit").val('');

            var actionUrl =${base}/+"buerOperator/edit";
            $.ajax({
                type : "POST",
                dataType : "json",
                url : actionUrl,
                data : {"buyerOperatorId":id},
                cache : false,
                async : false,//设置同步
                success : function(data) {
                    $("#userNameHiddenId").val(data.buyerOperator.userName);
                    $("#buyerOperator_userName_edit").val(data.buyerOperator.userName);
//                    $("#buyerOperator_passwd").val(data.buyerOperator.passwd);
//                    $("#buyerOperator_repasswd").val(data.buyerOperator.passwd);
                    $("#buyerOperator_email_edit").val(data.buyerOperator.email);
                    $("#buyerOperator_realName_edit").val(data.buyerOperator.realName);
                    $("#editid").val(data.buyerOperator.id);
//                    $("#buyerOperator_roleValue").val(data.buyerOperator.roleValue);
//                    $("#buyerOperator_isvalid").val(data.buyerOperator.isvalid);

                    $("input[name='buyerOperator_isvalid_edit']").each(function(){
                        if($(this).val() == data.buyerOperator.isvalid){
                            this.checked = true;
                        } else {
                            this.checked = false;
                        }
                    });

//                    $("#popupdiv_edit_role input").each(function(){
//                        this.remove();
//                    });
//
//                    $("#popupdiv_edit_role label").each(function(){
//                        this.remove();
//                    });
//
//                    $("#popupdiv_edit_role b").each(function(){
//                        this.remove();
//                    });

                    <#--$.ajax( {-->
                        <#--type : "POST",-->
                        <#--async: false,-->
                        <#--dataType : "json",-->
                        <#--url : ${base}/+ "buerOperator/getAllRole",-->
                        <#--data : {},-->
                        <#--cache : false,-->
                        <#--success : function(data) {-->
                            <#--if(data.status=="success"){-->
                                <#--var html = '';-->
                                <#--if(!isEmpty(data.allRole)){-->
                                    <#--var allRole= new Array();-->
                                    <#--allRole = data.allRole.split("--");-->
                                    <#--for(var i=0;i<allRole.length;i++){-->
                                        <#--html += '<input type="checkbox" id="checkbox-2-'+i+'" class="regular-checkbox" name="buyerOperator_roleValue_edit" value="';-->
                                        <#--var allRoleValue = new Array();-->
                                        <#--allRoleValue = allRole[i].split("_");-->
                                        <#--for(var j=0;j<allRoleValue.length;j++){-->
                                            <#--if(j== 0){-->
                                                <#--html += allRoleValue[j]+'"';-->
                                            <#--}-->

                                            <#--if(i==0 && j== 0){-->
                                                <#--html += ' datatype="need1" nullmsg="请至少分配一个角色!" ';-->
                                            <#--}-->

                                            <#--if(j== 0){-->
                                                <#--html += ' >';-->
                                            <#--}-->
                                            <#--if(j== 1){-->
                                                <#--html += ' <label for="checkbox-2-'+i+'" style="width: auto !important;"></label><b>'+allRoleValue[j]+'&nbsp;&nbsp;</b>';-->
                                            <#--}-->
                                        <#--}-->

                                    <#--}-->
                                    <#--$("#popupdiv_edit_role").append(html);-->
                                <#--}-->
                            <#--}-->
                        <#--},-->
                        <#--error : function(XMLHttpResponse) {-->
                            <#--alert("网络异常，请稍后重试！");-->
                        <#--}-->
                    <#--});-->

                    var roleArray = new Array();
                    var roleValues = data.buyerOperator.roleValue;
                    if(!isEmpty(roleValues)){
                        roleArray = roleValues.split(",");
                        if(roleArray.length > 0){
                            $("input[name='buyerOperator_roleValue_edit']").each(function(){
                                if(roleArray.indexOf($(this).val()) != -1){
                                    this.checked = true;
                                } else {
                                    this.checked = false;
                                }
                            });
                        }
                    }


                },
                error : function(XMLHttpResponse) {
                    alert("网络异常，请稍后重试！");
                }
            });

            $("#reg1_edit div ul input").each(function() {
                $(this).removeClass("Validform_error");
            });

            $("#reg1_edit div ul span span").each(function() {
                $(this).removeClass("Validform_wrong");
                $(this).text('');
            });

            $("#reg1_edit div ul b span").each(function() {
                $(this).removeClass("Validform_wrong");
                $(this).text('');
            });


            layer.open({
                type: 1,
                title:'编辑操作员',
                area:["700px","450px"],
                scrollbar:false,
                content: $('#popupdiv_edit') //这里content是一个DOM
            });

        }else{
            layer.alert("编辑失败!",{icon:2});
        }
    }

    /**
     * Desc:删除操作员
     * */
    function deleteBuyerOperator(id,state){
        if(state == 1){
            layer.alert('已启用的操作员不可删除!',{icon:3});
            return;
        }
        if(!isEmpty(id)){
            layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                $.ajax( {
                    type : "POST",
                    async: false,
                    dataType : "json",
                    url : ${base}/+ "buerOperator/delete",
                    data : {"buyerOperatorId":id},
                    cache : false,
                    success : function(data) {
                        if(data.status=="success"){
                            layer.alert("删除成功!",{icon:7});
                            window.location="${base}/buerOperator/list";
                        }
                    },
                    error : function(XMLHttpResponse) {
                        alert("网络异常，请稍后重试！");
                    }
                });

                layer.close(index);
            },
            function(index){
                layer.close(index);
            });
        }else{
            layer.alert("删除失败!",{icon:2});
        }

    }

    /**
     * 校验手机号是否被注册
     * @param value
     */
    function checkMobiles(obj){
        var checkMobile = '';
        if('0' == obj){
            checkMobile = $("#buyerOperator_userName").val();
        }else{
            checkMobile = $("#buyerOperator_userName_edit").val();
            var oldMobile = $("#userNameHiddenId").val();
            if(checkMobile == oldMobile){
                return;
            }
        }
        var state = "1";
        if(!isEmpty(checkMobile)){
            $.ajax({
                type: "post",
                async: false,
                url: ${base}/+"buerOperator/checkMobile",
                data:{'mobile':checkMobile},
                datatype: 'json',
                error: function () {
                },
                success: function(result) {
                    if("success"==result.status){
                        state = "0";
                    }
                }
            });
            if(state=="1"){
                if('0' == obj){
                    $("#showMOB").addClass("Validform_checktip Validform_wrong");
                    $("#showMOB").text('此号码已经被注册!');
                    $("#showMOB").show();
                    $("#mob_mess_hide").find("span").eq(1).hide();
                }else{
                    $("#showMOB_edit").addClass("Validform_checktip Validform_wrong");
                    $("#showMOB_edit").text('此号码已经被注册!');
                    $("#showMOB_edit").show();
                    $("#mob_mess_hide_edit").find("span").eq(1).hide();
                }
                return false;
            }
        }
    }


    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }

</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>