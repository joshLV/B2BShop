<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
<#-- 20151130 dzz <!-- <#include "bec/ghdj/top.ftl"/> -->
    <div class="mflex">
        <p>
        <table>

            <tr>
                <td><strong style="color: red;">*</strong>申诉内容：</td>
                <td><textarea rows="10" cols="30" maxlength="50" id="otherReason"></textarea></td>
                <td><span id="otherReason_span" style="color: red;display: none;">请填写申诉内容</span></td>
            </tr>
        </table>
        </p>
        <div class="btns">
            <a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">提交申诉</a>
            <a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">取消申诉</a>
        </div>

    </div>
    <script type="text/javascript">
        $(function(){
            $("#cancelsuccess").click(function (){
                var orderId = '${orderId}';
                var reason = '';
                if($.trim($("#otherReason").val()) == ''){
                    $("#otherReason_span").show();
                    return false;
                }else{
                    $("#otherReason_span").hide();
                    reason = $("#otherReason").val();
                }
                parent.orderComplaint(orderId, reason);
            });

            $("#cancelerror").click(function (){
                parent.cancleComplaint();
            });

        });
    </script>
</div>
</#escape>