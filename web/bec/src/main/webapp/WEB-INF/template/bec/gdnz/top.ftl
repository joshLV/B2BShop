<#escape x as x?html>
<!--top-->
    <#include "bec/gdnz/shortcut.ftl"/>
<!--head-->
<div class="head">
    <h1><a href="${base}/index"><img src="${base}/static/bec/project/gdnz/images/index/logo.png" width="362" height="83"></a></h1>
    <div class="headr">
        <div class="search">
            <#--<form name="search" id="search" action="" method="">-->
                <select  name="search_type" id="search_type" style=" width:81px; padding-left:10px;height:36px; float: left; text-align:center;line-height:36px;font-size:14px;font-family:'微软雅黑','宋体';border:3px solid #0171bc; border-right:0 ; background: url('${base}/static/bec/project/gdnz/images/s_line.gif') right top no-repeat; ">
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
<!--headerNavMain-->
<div class="headbg">
<div class="headerNavMain">
    <!--Sort-->
    <div class="navmain_left">
        <div class="allSort">
            <div class="navCon-cate navCon_on">
                <div class="navCon-cate-title"><a href="${base}/allSort">农资商城</a></div>
                <div class="cateMenu" <#if (!isindex)>style="display: none;" </#if>>
                    <ul>
                        <#list catelogList as grandfather>
                            <#if (grandfather_index>4 && isindex)>
                                <#break>
                            </#if>
                            <li style="border-top:none;">
                                <div class="cate-tag png${grandfather_index+1}"><strong><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></strong>
                                    <div class="listModel">
                                        <p><#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <#if (father_index>1)><#break></#if>
                                            <a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a>
                                        </#list></p>
                                    </div>
                                </div>
                                <div class="list-item hide">
                                    <ul class="itemleft">
                                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                            <dl class="f-cb">
                                                <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                                                <dd>
                                                    <#list catelogChildrenMap["${father.id}"] as catelog>
                                                        <a href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a>
                                                    </#list>
                                                </dd>
                                            </dl>
                                        </#list>
                                    </ul>
                                </div>
                            </li>
                        </#list>
                        </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navmain_right">
        <!--nav-->
        <div class="navbg">
            <ul class="nav">
                <li><a href="${base}/allG.html"  target="_blank">全部商品</a></li>
                <#list middlenavigationList as middlenavigation>
                    <#if (middlenavigation_index>4)>
                        <#break>
                    </#if>
                    <li><a href="<#if "${middlenavigation.urlType}" == "1">${base}/</#if>${middlenavigation.url}"  <#if "${middlenavigation.isBlankTarget}" == "1">target="_blank"</#if>>${middlenavigation.name}</a></li>
                </#list>
            </ul>
            <div id="shop_cart">
                <dl class="">
                    <dt class="ld" ><s></s><span class="shopping"><span id="shopping-amount">0</span></span><a href="" id="settleup-url">去购物车结算</a> <b></b> </dt>
                    <dd>
                        <div class="prompt">
                            <div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>
                        </div>
                    </dd>
                    <dd>
                        <div id="settleup-content">
                            <div class="smt f-cb">
                                <h4 class="f-fl">最新加入的商品</h4>
                            </div>
                            <div class="smc" id="cartlist"> </div>
                            <div class="smb ar" id ="carttotal"> </div>
                        </div>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
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