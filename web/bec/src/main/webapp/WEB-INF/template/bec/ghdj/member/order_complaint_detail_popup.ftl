<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
<#-- 20151130 dzz <!-- <#include "bec/ghdj/top.ftl"/> -->
    <div class="mflex" style="font-size: 12px;">
        <p>
        <table>
            <tr>
                <td style="padding-top: 10px;  width: 100px; vertical-align: top;"><em>申诉内容：</em></td>
                <td style="padding-top: 10px; word-break:break-all; ">
                    ${complaint.content}
                </td>
            </tr>
            <tr>
                <td style="padding-top: 10px; width: 100px; vertical-align: top;"><em>申诉状态：</em></td>
                <td style="padding-top: 10px; word-break:break-all; ">
                    <#if '${complaint.handleResultStatu}'=='untreated'>
                        未处理
                    </#if>
                    <#if '${complaint.handleResultStatu}'=='processed'>
                        已处理
                    </#if>
                </td>
            </tr>
        <#if '${complaint.handleResultStatu}'=='processed'>
            <tr>
                <td style="padding-top: 10px; width: 100px; vertical-align: top;"><em>处理结果：</em></td>
                <td style="padding-top: 10px; word-break:break-all; ">
                ${complaint.handleResult}
                </td>
            </tr>
        </#if>
        </table>
        </p>


    </div>
</div>
</#escape>