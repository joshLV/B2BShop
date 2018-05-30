<#escape x as x?html>
<!--top-->
    <#include "bec/gwq/shortcut.ftl"/>
<!--head-->
<!--head-->
<div class="head">
    <h1><a href="${base}/index"><img src="${base}/static/bec/project/gwq/images/index/logo.jpg" width="183" height="83"></a></h1>
    <div class="headr">
        <div class="search">
            <form name="search" id="search" action="" method="">
                <input type="text" name="sear_text" id="sear_text" class="sear_text"  value="搜索 商品/品牌/商家" onFocus="this.value=''" onBlur="if (this.value ==''){value=&quot;搜索 商品/品牌/商家&quot;}">
                <input type="button" name="sear_btn" id="sear_btn" class="sear_btn"  value="搜索" >
            </form>
        </div>
        <ul class="hot_sear">
            <li><strong>热门搜索：</strong></li>
            <li class="red"><a href="javascript:void(0)"  onclick="s('葡萄酒','')" style="color:#ff0000">葡萄酒</a></li>
            <li><a href="javascript:void(0)"  onclick="s('饼干','')">饼干</a></li>
            <li><a href="javascript:void(0)"  onclick="s('奶粉','')">奶粉</a></li>
            <li><a href="javascript:void(0)"  onclick="s('洗发水','')">洗发水</a></li>
            <li><a href="javascript:void(0)"  onclick="s('牙刷','')">牙刷</a></li>
        </ul>
    </div>
</div>
</#escape>