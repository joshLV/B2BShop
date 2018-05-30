<#escape x as x?html>

<header>

    <#include "bec/ghj/shortcut.ftl"/>

    <div class="head f-cb">
        <div class="f-fl logo"><a href="${base}/index"><img src="${base}/static/bec/project/ghj/img/logo.png" width="290" height="73" alt="广货街交易平台"></a></div>
        <div class="f-fl main">
            <div class="search-box f-cb">
                <select name="search_type" id="search_type">
                    <option value="goods">商品</option>
                    <option value="shop">供应商</option>
                </select>
                <input class="has_reset" type="text" name="sear_text" id="sear_text" placeholder="请输入您想查找的关键字" value="${keyword}" onkeydown="javascript:if(event.keyCode==13) s($('#sear_text').val(),'');">
                <button class="f-fr" id="sear_btn" onclick="s($('#sear_text').val(),'');return false;"><i class="icon-search"></i>搜索</button>
            </div>
            <div class="search-keyword" id="hotwords">
                热门搜索：
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
                        allHtml += "<a href='javascript:void(0)'  onclick=\"searchG('"+data[i]["keywords"]+"','')\" ";

                        if(flag){
                            if(data[i]["keywords"] == keyword){
                                allHtml += " style='color:#ff0000' ";
                            }
                        }else{
                            if(i==0){
                                allHtml += " style='color:#ff0000' ";
                            }
                        }
                        allHtml += ">"+data[i]["keywords"]+"</a>";
                    }
                    $('#hotwords').append(allHtml);
                }
            });
        });
    </script>

</header>
</#escape>