<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <style>
        .help{
            background: url("${base}/static/bec/project/ghdj/images/question.png") no-repeat;
            width: 20px;
            height: 20px;
            /* line-height: 20px; */
            float: left;
            margin-left: 50px;
            background-size: 20px 20px;
            margin-top: 5px;
        }
    </style>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/purchaseOrder/list">采购单管理</a></strong><span>&nbsp;&gt;&nbsp;采购单</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="purchaseOrder_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1>
                <em>采购单</em>
                <a href="${base}/help/question/100111.html" target="_blank" style="height: 38px;line-height: 38px;float: right;margin-right: 30px;"><i class="help"></i>使用帮助</a>
            </h1>
            <div class="user_right p10">
                <div class="user_t">
                    <div class="xiaofei">

                    </div>
                    <div class="user_mt" >
                        <ul class="extra-l">
                            <li class="fore-1"   style="position: absolute">
                                <input class="btn-5-new" type="button" onclick="openUploadWindows();" name="" value="上传采购单" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </li>
                            <div style="position: relative; left:210px; z-index: 30; float: left;">
                                <div style="float: left;">
                                    名称:&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input class="go-input-datepicker_po gmt-receive_po" style="background:none;" type="text" id="title" name="title" value="${title}"><em class="bing-less"></em>
                                </div>
                                <div style="float: left;">
                                上传日期:&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" onchange="searchPurchaseOrder();" required><em class="bing-less"></em>
                                ~ <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+0})}'})" onchange="searchPurchaseOrder();" required><em class="bing-less"></em>&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                                <input class="btn-5-new_po"  type="button" onclick="searchPurchaseOrder();" value="查      询" style="margin-top: 0 !important;" />
                            </div>
                        </ul>

                    </div>
                </div>
                <div class="tb-void" style="margin-top: 10px;">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="goodsDataTable">
                        <tbody>
                        <tr>
                            <th width="150">标题</th>
                            <th width="100">上传时间</th>
                            <th width="100">优惠比例</th>
                            <th width="50">操作</th>
                        </tr>
                        <#if purchaseOrderMap?exists >

                            <#list purchaseOrderMap?keys as key>
                                <#if purchaseOrderMap['${key}']?size &gt; 1>
                                    <#list purchaseOrderMap['${key}'] as list>
                                        <#if list_index == 0 >
                                            <tr>
                                                <td width="150" rowspan="2">${list.title}</td>
                                                <td width="100" rowspan="2">${list.changeTime}</td>
                                                <td width="100">
                                                    <#if list.type = 1>${list.preferentialRatio?string("##0.00")}%<#else>-</#if>
                                                </td>
                                                <td width="50">
                                                    <#if list.type == 1>
                                                        <input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    <#elseif list.type == 2>
                                                        <input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    <#else>
                                                        <input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    </#if>
                                                </td>
                                            </tr>
                                        <#else>
                                            <tr>
                                                <td width="100">
                                                    <#if list.type == 1>
                                                    ${list.preferentialRatio?string("##0.00")}%
                                                    <#else>
                                                        -
                                                    </#if>
                                                </td>
                                                <td width="50">
                                                    <#if list.type == 1>
                                                        <input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    <#elseif list.type == 2>
                                                        <input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    <#else>
                                                        <input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                    </#if>
                                                </td>
                                            </tr>
                                        </#if>
                                    </#list>
                                <#else>
                                    <#list purchaseOrderMap['${key}'] as list>
                                        <tr>
                                            <td width="150">${list.title}</td>
                                            <td width="100">${list.changeTime}</td>
                                            <td width="100">
                                                <#if list.type = 1>
                                                ${list.preferentialRatio?string("##0.00")}%
                                                <#else>
                                                    -
                                                </#if>
                                            </td>
                                            <td width="50">
                                                <#if list.type == 1>
                                                    <input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                <#elseif list.type == 2>
                                                    <input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                <#else>
                                                    <input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail('${list.id}','${list.type}');">
                                                </#if>
                                            </td>
                                        </tr>
                                    </#list>
                                </#if>


                            </#list>

                        <#else>
                        <tr>
                            <td colspan="4">
                                <div class="nocont-box nocont-order">
                                    <b class="icon-order"></b>你还没有采购单！
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if !hasNext>
                                <td colspan="4" align="center" style="color: #ff0000;">没有了...</td>
                            <#else>
                                <td colspan="4" align="center" style="color: #ff0000;">下拉加载更多数据!</td>
                            </#if>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <input type="hidden" id="isCloseId" value="0" />
    <form name="reg1" id="reg1" action="" method="post">
        <div class="pop_win aptab_center_address" style="padding: 0 !important;">
            <ul class="newaddress">
                <li>
                    <form id="myform_file" action="">
                        <table>
                            <tr>
                                <td width="100" align="right">采购单名称<font color="red">*</font>&nbsp;&nbsp;</td>
                                <td><input type="text" name="title" id="upload_title" value="" style="width: 350px;" placeholder="请输入采购单名称，必输">&nbsp;&nbsp;</td>
                                <td id="title_msg">请输入2-20位字符</td>
                            </tr>
                            <tr>
                                <td align="right">选择文件&nbsp;&nbsp;</td>
                                <td colspan="2"><input type="file" name="file" id="file" value="选择文件" style="height: 36px;padding-top: 10px;"></td>
                            </tr>
                        </table>
                    </form>
                </li>
                <li>
                    <input class="btn-5-new" id="button_show"  type="button" onclick="uploadPurchaseOrder();" value="上传采购单" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${base}/purchaseOrder/downloadExcel" style="margin-top: 30px;color: blue;font-size: 14px;font-style: italic;text-decoration:underline">模板下载</a>
                </li>
                <li>
                   <h3>上传采购单提示:</h3>
                    <p>1.上传的采购单文件后缀必须为.xls或.xlsx；</p>
                    <p>2.上传的采购单文件必须为下载的采购单模板；</p>
                    <p>3.采购单模板中的商品条形码,商品名称,商品数量为必填项；</p>
                    <p>4.商品条形码必须为纯数字且大于0,位数不超过16位；</p>
                    <p>5.商品名称长度为1~100位；</p>
                    <p>6.商品数量必须为大于0小于100000的正整数；</p>
                    <p>7.商品单价必须为不大于10000000的数字；</p>
                    <p>8.模板文件的列名以及顺序都不可改变；</p>
                    <p>9.违反以上任意一条则视为无效的采购单。</p>
                </li>
                <li>
                    <span id="show_isYesOrNo" style="color: #ff0000;"></span>
                </li>
            </ul>
        </div>
    </form>
</div>
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/purchase_order/ajaxPurchaseOrder.js" type="text/javascript"></script>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    var indexs = null;
    $(function () {
    });

    //弹出div
    function openUploadWindows() {
        $("#file").val('');
        indexs = layer.open({
            type: 1,
            title:'上传采购单',
            area:["700px","400px"],
            scrollbar:false,
            content: $('#popupdiv') //这里content是一个DOM
        });
    }

    /**
     * Desc:查看采购单明细
     * @param:id 采购单ID
     * @param:type 采购单类型 平台以及非平台
     * */
    function getPurchaseOrderDetail(id,type){
        if(!isEmpty(id)){
            window.location="${base}/purchaseOrder/getPurchaseOrder?type="+type+"&purchaseId="+id;
        }else{
            layer.alert("查看失败!",{icon:2});
        }

    }

    /**
     * Desc:上传采购单
     * */
    function uploadPurchaseOrder(){

        var title = $("#upload_title").val();
        if($.trim(title) == ""){
            $("#title_msg").html('<span style="color: red;">采购单名称不能为空</span>');
            $("#title").focus();
            return;
        }else{
            if( title.length < 2 || title.length > 20 ){
                $("#title_msg").html('<span style="color: red;">请输入2-20位字符</span>');
                $("#title").focus();
                return;
            }
        }

        var fileName = $("#file").val();
        var actionUrl = "${base}/purchaseOrder/uploadExcel?title="+encodeURI(encodeURI(title))+"";

        if(!isEmpty(fileName)){
            fileName = fileName.substring(fileName.lastIndexOf('.'),fileName.length);
            if(fileName == '.xlsx'){
                $("#button_show").val('拼命上传中...');
                $("#button_show").addClass("btn-5-new_uploadPurchaseOrder").removeClass("btn-5-new");
                $("#button_show").attr("disabled", true);
//                $("#titlefile").html('已选择文件');

                var loadindex = layer.load();
                $.ajaxFileUpload({
                    url:actionUrl,
                    secureuri:true,//是否启用安全提交,默认为false
                    fileElementId:$('input[name=file]'),
                    dataType:'text',
                    async:true,
                    success:function(data, status){
                        data = data.replace(/<pre.*?>/g, '');
                        data = data.replace(/<PRE.*?>/g, '');
                        data = data.replace("<PRE>", '');
                        data = data.replace("</PRE>", '');
                        data = data.replace("<pre>", '');
                        data = data.replace("</pre>", '');
                        data = jQuery.parseJSON(data);
                        layer.close(loadindex);
                        if(data.status=="SUCCESSA"){
                            var msgs = '';
                            if(!isEmpty(data.message)){
                                msgs = "注意:"+data.message;
                            }
//                            $("#show_isYesOrNo").text('上传采购单成功!'+msgs);
                            pageForward('1',data.purchaseOrderId,data.purchaseOrderOtherId,'上传采购单成功!'+msgs);
//                            layer.alert('导入采购单成功!',{icon:7});
                            <#--layer.confirm('导入采购单成功! '+msgs, {icon: 7, title:'温馨提示'}, function(index){-->
                                <#--window.location="${base}/purchaseOrder/getPurchaseOrder?type=1&purchaseId="+data.purchaseOrderId+"&othserId="+data.purchaseOrderOtherId;-->
                            <#--});-->

                        }else if(data.status=="SUCCESSB"){
//                            $("#show_isYesOrNo").text('上传采购单成功!');
                            pageForward('2',data.purchaseOrderId,'','上传采购单成功!');
//                            layer.alert('导入采购单成功!',{icon:7});
//                            layer.confirm('导入采购单成功!', {icon: 7, title:'温馨提示'}, function(index){
                                <#--window.location="${base}/purchaseOrder/getPurchaseOrder?type=2&purchaseId="+data.purchaseOrderId;-->
//                            });
                        }else{//message
//                            $("#show_isYesOrNo").text('上传采购单失败,原因:'+data.message);
                            pageForward('3','','','上传采购单失败,原因:'+data.message);
//                            layer.alert('导入采购单失败,原因:'+data.message+'',{icon:7});
                            <#--layer.confirm('导入采购单失败,原因:'+data.message+'', {icon: 7, title:'温馨提示'}, function(index){-->
                                <#--window.location="${base}/purchaseOrder/list";-->
                            <#--});-->

                        }

                    },
                    error:function(data, status, e){ //服务器响应失败时的处理函数
                        alert("网络异常，请稍后重试！");
                    }
                });
//                $("#titlefile").text('请选择');

            }else{
                layer.alert("文件格式错误,只支持Excel2007及以上(*.xlsx)文件格式!",{icon:7});
            }
        }else{
            layer.alert("请选择采购单!",{icon:7});
        }



    }

    /**
     * Desc:根据上传采购单状态显示不同内容
     * @param
     *          obj  1:导入成功有平台商品  2:导入成功没有平台商品 3:导入失败
     * @param   paramA 平台采购单ID
     * @param   paramB 分平台采购单ID
     * @param   msg    提示信息
     * */
    function pageForward(obj,paramA,paramB,msg){
        if(!isEmpty(msg)){
            if(msg.length > 100){
                msg = msg.substr(0,100)+"...";
            }
            $("#show_isYesOrNo").text(msg);
        }

        $("#file").val('');
        $("#button_show").val('上传采购单');
        $("#button_show").addClass("btn-5-new").removeClass("btn-5-new_uploadPurchaseOrder");
        $("#button_show").attr("disabled", false);

        $(".layui-layer-setwin a").click(function(){
            if(obj == '1'){
                window.location="${base}/purchaseOrder/getPurchaseOrder?type=1&purchaseId="+paramA+"&othserId="+paramB;
            }else if(obj == '2'){
                window.location="${base}/purchaseOrder/getPurchaseOrder?type=2&purchaseId="+paramA;
            }else{
                window.location="${base}/purchaseOrder/list";
            }
        });
    }

    /**
     * 根据上传时间查采购单数据
     */
    function searchPurchaseOrder(){
        var title = $("#title").val();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
//
//        if(isEmpty(startDate)){
//            layer.alert("开始日期不能为空!",{icon:7});
//            return;
//        }
//
//        if(isEmpty(endDate)){
//            layer.alert("结束日期不能为空!",{icon:7});
//            return;
//        }

        window.location="${base}/purchaseOrder/list?startDate="+startDate+"&endDate="+endDate+"&title="+encodeURI(encodeURI(title));
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