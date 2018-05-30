<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top.ftl"/>
    <div class="classify_main">

        <div class="classify_left">
          <#list catelogList as grandfather>
            <#if grandfather_index%2==0>
              <div class="classify_m" id="catelog_${grandfather.id}">
                <div class="classify_mt">
                  <h2><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h2>
                </div>
                <div class="classify_mc">
                <#list catelogChildrenMap["${grandfather.id}"] as father>
                  <dl class="fore">
                    <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                    <dd>
                      <#list catelogChildrenMap["${father.id}"] as catelog>
                        <em><a title="${catelog.name}" href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></em>
                      </#list>
                    </dd>
                  </dl>
                </#list>
                </div><!--mc end-->
              </div><!--catelog_1 end-->
            </#if>
          </#list>
        </div>

        <div class="classify_right">
          <#list catelogList as grandfather>
            <#if grandfather_index%2==1>
              <div class="classify_m" id="catelog_${grandfather.id}">
                <div class="classify_mt">
                  <h2><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h2>
                </div>
                <div class="classify_mc">
                  <#list catelogChildrenMap["${grandfather.id}"] as father>
                    <dl class="fore">
                        <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                        <dd>
                          <#list catelogChildrenMap["${father.id}"] as catelog>
                              <em><a title="${catelog.name}" href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></em>
                          </#list>
                        </dd>
                    </dl>
                  </#list>
                </div><!--mc end-->
              </div><!--catelog_1 end-->
            </#if>
          </#list>
        </div>
    </div>
</div>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
</#escape>