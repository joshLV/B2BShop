<div class="category_select_container f-cb" index="">
    <div class="keyword_suggest_background"></div>
    <ul class="category_list" level="1">
        <#list catelogs as catelog>
        <li><a href="javascript:;" target="_self" leaf="0" categoryid="${catelog.id}" catelogpath="${catelog.path}" title="${catelog.name}" class="item_p">${catelog.name}</a></li>
        </#list>
    </ul>
    <ul class="category_list" level="2"></ul>
    <ul class="category_list" level="3"></ul>
    <div class="act-cell">
        <em class="go-ico-del close"><a>确定</a></em>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        //鼠标离开后隐藏
        $(".category_select_container").mouseleave(function(){
            $(".close").trigger('click');
        });
    });
</script>