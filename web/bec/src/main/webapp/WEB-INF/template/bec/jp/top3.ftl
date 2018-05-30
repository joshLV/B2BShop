<#escape x as x?html>
<!--top-->
    <#include "bec/jp/shortcut.ftl"/>
<!--head-->
<!--head-->
<style type="text/css">
    .head h1, .head h1 img {
        width: 362px;
        height: 83px;
        float: left;
    }

    .headr {
        float: left;
        height: 83px;
        overflow: hidden;
        width: 580px;
        margin-left: 50px;
    }
    .search input.sear_text {
        width: 385px;
        padding: 0 5px;
        height: 30px;
        line-height: 30px;
        border: 3px solid #0171bc;
        border-left: 0;
        font-size: 14px;
        font-family: "微软雅黑","宋体";
        color: #bbb;
        float: left;
    }
</style>
<div class="head">
    <h1><a href="${base}/index"><img src="${base}/static/bec/project/jp/images/index/logo.png" width="362" height="83"></a></h1>
    <div class="headr">
        <div class="search">
        <#--<form name="search" id="search" action="" method="">-->
            <select  name="search_type" id="search_type" style=" width:81px; padding-left:10px;height:36px; float: left; text-align:center;line-height:36px;font-size:14px;font-family:'微软雅黑','宋体';border:3px solid #0171bc; border-right:0 ; background: url('${base}/static/bec/project/jp/images/s_line.gif') right top no-repeat; ">
                <option value="goods" selected="selected">商品</option>
                <option value="shop">供应商</option>
            </select>
            <input type="text" name="sear_text" id="sear_text" class="sear_text"  value="${keyword}" autocomplete="off"
                   onkeydown="javascript:if(event.keyCode==13) s($('#sear_text').val(),'');">
            <input type="button" name="sear_btn" id="sear_btn" onclick="s($('#sear_text').val(),'');return false;" class="sear_btn"  value="搜索" >
        <#--</form>-->
        </div>
        <ul class="hot_sear" id="hotwords">
            <li><strong>热门搜索：</strong></li>
        <#--<li class="red"><a href="javascript:void(0)"  onclick="s('葡萄酒','')" style="color:#ff0000">葡萄酒</a></li>-->
        <#--<li><a href="javascript:void(0)"  onclick="s('饼干','')">饼干</a></li>-->
        <#--<li><a href="javascript:void(0)"  onclick="s('奶粉','')">奶粉</a></li>-->
        <#--<li><a href="javascript:void(0)"  onclick="s('洗发水','')">洗发水</a></li>-->
        <#--<li><a href="javascript:void(0)"  onclick="s('牙刷','')">牙刷</a></li>-->
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: 'post',
            url: '${base}/ajaxGetKeywords',
            success: function(data) {
                var allHtml = "";
                var keyword = $("#sear_text").val();
                var flag = false;
                for(var i=0;i<data.length;i++) {
                    if( data[i]["keywords"] == keyword ){
                        flag = true;
                    }
                }
                for(var i=0;i<data.length;i++){
                    allHtml += "<li><a href='javascript:void(0)'  onclick=\"searchG('"+data[i]["keywords"]+"','')\" ";

                    if(flag){
                        if(data[i]["keywords"] == keyword){
                            allHtml += " style='color:#ff0000' ";
                        }
                    }else{
                        if(i==0){
                            allHtml += " style='color:#ff0000' ";
                        }
                    }
                    allHtml += ">"+data[i]["keywords"]+"</a></li>";
                }
                $('#hotwords').append(allHtml);
            }
        });
    });
</script>
</#escape>