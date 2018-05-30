<#escape x as x?html>
<#list typeList as child>
<div class="g-floors">
    <div class="m-floor-title u-floor${child_index + 1}-bottom f-cb">
        <div class="f-fl u-floor${child_index + 1}-ico">${child["catelog"].name}</div>
        <div class="f-fr">
            <#list child["categrandList"] as cate>
                <a target="_blank" href="${base}/list/${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a></li>
                <#if cate_has_next> | </#if>
                <#if cate_index==6 && cate_has_next><a href="#">更多&gt;</a><#break ></#if>
            </#list>
        </div>
    </div>
    <div class="m-floor">
        <div class="f-fl"><img alt="${child['floor_left_'+'${child_index+1}'+'_1'].name}" src="${child['floor_left_'+'${child_index+1}'+'_1'].pic}" width="175" height="549" alt=""></div>
        <div class="f-fr">
            <#list child["goodschildList"] as goodschild>
            <#if goodschild_index % 5 == 0>
                <ul <#if goodschild_index==0>class="line"</#if>>
            </#if>
                <li>
                    <div class="u-floor-goodsimg">
                        <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                            <img alt="${goodschild.fullName}" data-img="1" src="${goodschild.pic}_200x200.png">
                        </a>
                    </div>
                    <div class="u-floor-goodprice">${goodschild.price?string('currency')}<#if (goodschild.marketPrice)?exists><span>${goodschild.marketPrice?string('currency')}</span></#if></div>
                    <div class="u-floor-goodname">
                        <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                            ${goodschild.fullName}
                        </a>
                    </div>
                </li>
            <#if (goodschild_index + 1) % 5 == 0></ul></#if>
            <#if goodschild_index == 9><#break></#if>
            </#list>
        </div>
    </div>
</div>

</#list>
</#escape>
