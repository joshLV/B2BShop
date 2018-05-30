<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<style type="text/css">
    .order-summary .statistic span {
        margin-right: 10px;
    }
</style>

<div id="container">
    <#include "bec/ghj/top2.ftl"/>
    <div class="main f-cb" style="position: relative;">
        <h1 class="order_tit">填写并核对订单信息</h1>
        <div class="headr" style="position: absolute; right:0; top: -100px; z-index: 99999;">
            <div class="flow-steps">
                <ol class="num5">
                    <li class="done current-prev"><span>1. 我的购物车</span></li>
                    <li class="current"><span>2. 填写核对订单信息</span></li>
                    <li class="last"><span>3. 成功提交订单</span></li>
                </ol>
            </div>
        </div>
        <div class="order_info">
            <h1>收货地址</h1>
            <form id="orderCheckInfo">
                <#--Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用-->
                <input type="hidden" id="createOrderType" name="createOrderType" value="${createOrderType}">

                <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
                <input type="hidden" id="order_receiverId_back" name="order_receiverId_back" value="${receiver.id}"><!--当新增窗口打开时会清空 order_receiverId的值  新增打开什么都不做 用此处还原之前的选择 -->
                <input type="hidden" id="order_areaId" value="${receiver.areaId}">
                <#--<input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">-->
                <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethodIds}">

                <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
                <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
                <#--<input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeList[0].introduce}">-->
                <input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeIds}">
                <input type="hidden" id="order_deliveryTimeName" name="order_deliveryTimeName" value="${deliveryTimeName}">
                <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->
                <input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as map><#list map.items as cartItem>${cartItem.id},</#list></#list>">

                <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 Start  在修改这个的时候 曾经好像在梦中见过 -->
                <input type="hidden" id="platform" name="platform" value="1">
                <input type="hidden" id="dataFrom" name="dataFrom" value="2">
                <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 End -->

                <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
                <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
                <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>

                <input type="hidden" name="hasInsuranceFee" id="hasInsuranceFee" value="${hasInsuranceFee}"/>
                <input type="hidden" name="isMemberPrice" id="isMemberPrice" value="${isMemberPrice}"/>
            </form>
            <div class="columnright">
                <div class="mod_address_book">
                    <div id="addressListDiv" class="addressListDiv">
                        <input type="hidden" value="1" id="size">
                        <input type="hidden" id="addressNum_top" value="${receiverList?size}">
                        <ul class="adr_list" id="consignee-list">
                            <#liseturn c.makeArray(a,this)},selector:"",jquery:"1.4.2",length:0,size:function(){return this.length},toArray:function(){return R.call(this,0)},get:function(a){return a==null?this.toArray():a<0?this.slice(a)[0]:this[a]},pushStack:function(a,b,d){var f=c();c.isArray(a)?ba.apply(f,a):c.merge(f,a);f.prevObject=this;f.context=this.context;if(b===
"find")f.selector=this.selector+(this.selector?" ":"")+d;else if(b)f.selector=this.selector+"."+b+"("+d+")";return f},each:function(a,b){return c.each(this,a,b)},ready:function(a){c.bindReady();if(c.isReady)a.call(s,c);else Q&&Q.push(a);return this},eq:function(a){return a===-1?this.slice(a):this.slice(a,+a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(R.apply(this,arguments),"slice",R.call(arguments).join(","))},map:function(a){return this.pushStack(c.map(this,
function(b,d){return a.call(b,d,b)}))},end:function(){return this.prevObject||c(null)},push:ba,sort:[].sort,splice:[].splice};c.fn.init.prototype=c.fn;c.extend=c.fn.extend=function(){var a=arguments[0]||{},b=1,d=arguments.length,f=false,e,j,i,o;if(typeof a==="boolean"){f=a;a=arguments[1]||{};b=2}if(typeof a!=="object"&&!c.isFunction(a))a={};if(d===b){a=this;--b}for(;b<d;b++)if((e=arguments[b])!=null)for(j in e){i=a[j];o=e[j];if(a!==o)if(f&&o&&(c.isPlainObject(o)||c.isArray(o))){i=i&&(c.isPlainObject(i)||
c.isArray(i))?i:c.isArray(o)?[]:{};a[j]=c.extend(f,i,o)}else if(o!==w)a[j]=o}return a};c.extend({noConflict:function(a){A.$=Sa;if(a)A.jQuery=Ra;return c},isReady:false,ready:function(){if(!c.isReady){if(!s.body)return setTimeout(c.ready,13);c.isReady=true;if(Q){for(var a,b=0;a=Q[b++];)a.call(s,c);Q=null}c.fn.triggerHandler&&c(s).triggerHandler("ready")}},bindReady:function(){if(!xa){xa=true;if(s.readyState==="complete")return c.ready();if(s.addEventListener){s.addEventListener("DOMContentLoaded",
L,false);A.addEventListener("load",c.ready,false)}else if(s.attachEvent){s.attachEvent("onreadystatechange",L);A.attachEvent("onload",c.ready);var a=false;try{a=A.frameElement==null}catch(b){}s.documentElement.doScroll&&a&&ma()}}},isFunction:function(a){return $.call(a)==="[object Function]"},isArray:function(a){return $.call(a)==="[object Array]"},isPlainObject:function(a){if(!a||$.call(a)!=="[object Object]"||a.nodeType||a.setInterval)return false;if(a.constructor&&!aa.call(a,"constructor")&&!aa.call(a.constructor.prototype,
"isPrototypeOf"))return false;var b;for(b in a);return b===w||aa.call(a,b)},isEmptyObject:function(a){for(var b in a)return false;return true},error:function(a){throw a;},parseJSON:function(a){if(typeof a!=="string"||!a)return null;a=c.trim(a);if(/^[\],:{}\s]*$/.test(a.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return A.JSON&&A.JSON.parse?A.JSON.parse(a):(new Function("return "+
a))();else c.error("Invalid JSON: "+a)},noop:function(){},globalEval:function(a){if(a&&Va.test(a)){var b=s.getElementsByTagName("head")[0]||s.documentElement,d=s.createElement("script");d.type="text/javascript";if(c.support.scriptEval)d.appendChild(s.createTextNode(a));else d.text=a;b.insertBefore(d,b.firstChild);b.removeChild(d)}},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,b,d){var f,e=0,j=a.length,i=j===w||c.isFunction(a);if(d)if(i)for(f in a){if(b.apply(a[f],
d)===false)break}else for(;e<j;){if(b.apply(a[e++],d)===false)break}else if(i)for(f in a){if(b.call(a[f],f,a[f])===false)break}else for(d=a[0];e<j&&b.call(d,e,d)!==false;d=a[++e]);return a},trim:function(a){return(a||"").replace(Wa,"")},makeArray:function(a,b){b=b||[];if(a!=null)a.length==null||typeof a==="string"||c.isFunction(a)||typeof a!=="function"&&a.setInterval?ba.call(b,a):c.merge(b,a);return b},inArray:function(a,b){if(b.indexOf)return b.indexOf(a);for(var d=0,f=b.length;d<f;d++)if(b[d]===
a)return d;return-1},merge:function(a,b){var d=a.length,f=0;if(typeof b.length==="number")for(var e=b.length;f<e;f++)a[d++]=b[f];else for(;b[f]!==w;)a[d++]=b[f++];a.length=d;return a},grep:function(a,b,d){for(var f=[],e=0,j=a.length;e<j;e++)!d!==!b(a[e],e)&&f.push(a[e]);return f},map:function(a,b,d){for(var f=[],e,j=0,i=a.length;j<i;j++){e=b(a[j],j,d);if(e!=null)f[f.length]=e}return f.concat.apply([],f)},guid:1,proxy:function(a,b,d){if(arguments.length===2)if(typeof b==="string"){d=a;a=d[b];b=w}else if(b&&
!c.isFunction(b)){d=b;b=w}if(!b&&a)b=function(){return a.apply(d||this,arguments)};if(a)b.guid=a.guid=a.guid||b.guid||c.guid++;return b},uaMatch:function(a){a=a.toLowerCase();a=/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version)?[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||!/compatible/.test(a)&&/(mozilla)(?:.*? rv:([\w.]+))?/.exec(a)||[];return{browser:a[1]||"",version:a[2]||"0"}},browser:{}});P=c.uaMatch(P);if(P.browser){c.browser[P.browser]=true;c.browser.version=P.version}if(c.browser.webkit)c.browser.safari=
true;if(ya)c.inArray=function(a,b){return ya.call(b,a)};T=c(s);if(s.addEventListener)L=function(){s.removeEventListener("DOMContentLoaded",L,false);c.ready()};else if(s.attachEvent)L=function(){if(s.readyState==="complete"){s.detachEvent("onreadystatechange",L);c.ready()}};(function(){c.support={};var a=s.documentElement,b=s.createElement("script"),d=s.createElement("div"),f="script"+J();d.style.display="none";d.innerHTML="   <link/><table></table><a href='/a' style='color:red;float:left;opacity:.55;'>a</a><input type='checkbox'/>";
var e=d.getElementsByTagName("*"),j=d.getElementsByTagName("a")[0];if(!(!e||!e.length||!j)){c.support={leadingWhitespace:d.firstChild.nodeType===3,tbody:!d.getElementsByTagName("tbody").length,htmlSerialize:!!d.getElementsByTagName("link").length,style:/red/.test(j.getAttribute("style")),hrefNormalized:j.getAttribute("href")==="/a",opacity:/^0.55$/.test(j.style.opacity),cssFloat:!!j.style.cssFloat,checkOn:d.getElementsByTagName("input")[0].value==="on",optSelected:s.createElement("select").appendChild(s.createElement("option")).selected,
parentNode:d.removeChild(d.appendChild(s.createElement("div"))).parentNode===null,deleteExpando:true,checkClone:false,scriptEval:false,noCloneEvent:true,boxModel:null};b.type="text/javascript";try{b.appendChild(s.createTextNode("window."+f+"=1;"))}catch(i){}a.insertBefore(b,a.firstChild);if(A[f]){c.support.scriptEval=true;delete A[f]}try{delete b.test}catch(o){c.support.deleteExpando=false}a.removeChild(b);if(d.attachEvent&&d.fireEvent){d.attachEvent("onclick",function k(){c.support.noCloneEvent=
false;d.detachEvent("onclick",k)});d.cloneNode(true).fireEvent("onclick")}d=s.createElement("div");d.innerHTML="<input type='radio' name='radiotest' checked='checked'/>";a=s.createDocumentFragment();a.appendChild(d.firstChild);c.support.checkClone=a.cloneNode(true).cloneNode(true).lastChild.checked;c(function(){var k=s.createElement("div");k.style.width=k.style.paddingLeft="1px";s.body.appendChild(k);c.boxModel=c.support.boxModel=k.offsetWidth===2;s.body.removeChild(k).style.display="none"});a=function(k){var n=
s.createElement("div");k="on"+k;var r=k in n;if(!r){n.setAttribute(k,"return;");r=typeof n[k]==="function"}return r};c.support.submitBubbles=a("submit");c.support.changeBubbles=a("change");a=b=d=e=j=null}})();c.props={"for":"htmlFor","class":"className",readonly:"readOnly",maxlength:"maxLength",cellspacing:"cellSpacing",rowspan:"rowSpan",colspan:"colSpan",tabindex:"tabIndex",usemap:"useMap",frameborder:"frameBorder"};var G="jQuery"+J(),Ya=0,za={};c.extend({cache:{},expando:G,noData:{embed:true,object:true,
applet:true},data:function(a,b,d){if(!(a.nodeName&&c.noData[a.nodeName.toLowerCase()])){a=a==A?za:a;var f=a[G],e=c.cache;if(!f&&typeof b==="string"&&d===w)return null;f||(f=++Ya);if(typeof b==="object"){a[G]=f;e[f]=c.extend(true,{},b)}else if(!e[f]){a[G]=f;e[f]={}}a=e[f];if(d!==w)a[b]=d;return typeof b==="string"?a[b]:a}},removeData:function(a,b){if(!(a.nodeName&&c.noData[a.nodeName.toLowerCase()])){a=a==A?za:a;var d=a[G],f=c.cache,e=f[d];if(b){if(e){delete e[b];c.isEmptyObject(e)&&c.removeData(a)}}else{if(c.support.deleteExpando)delete a[c.expando];
else a.removeAttribut                        <#if isMemberPrice != 'yes'>
                            <a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
                            <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_Invoice()">保存发票信息</a>
                            </#if>
                        </span>
                    </div><!--step-title end-->
                    <div class="step-content">
                        <div id="part-invoice" class="sbox-wrap">
                            <div class="sbox">
                                <div class="invoice" id="invoice-content">
                                    <div class="invoice-content">
                                        发票类型：<span id="invoiceInfo"><#if invoiceInfo.invoiceContent=="no">不开发票<#else><#if invoiceInfo.invoiceType=="normal">普通发票</#if>&nbsp;&nbsp;${invoiceInfo.invoiceTitle}&nbsp;&nbsp;<#if invoiceInfo.invoiceContent=="infos">明细</#if></#if>&nbsp;&nbsp;</span>
                                    </div>
                                </div>
                                <div class="form hide" id="invoice-edit-div" style="position: relative; right: 0px; top: 0px; width:100%;">
                                    <div>
                                        <ul class="items">
                                            <li class="item-title">发票类型：</li>
                                            <li class="radioitem <#if invoiceInfo.invoiceType=="normal">selected</#if>" type="invoiceType" value="normal">普通发票</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h3 class="item-title" style="float: left;">发票抬头：</h3>
                                        <ul class="items" id="fptt" style="width: 1000px">
                                            <#list memberInvoicesList as invoice>
                                                <li class="radioitem invoiceTitel <#if invoice.invoiceTitle==memberInvoice.invoiceTitle>selected</#if>" type="invoiceTitle" id="${invoice.id}" value="${invoice.invoiceTitle}">
                                                    <a href="javascript:;" title="双击修改">${invoice.invoiceTitle}</a>
                                                    <b onclick="deleteInvoice('${invoice.id}','${invoice.invoiceTitle}','${invoice_index}');" class="close-color"></b>
                                                </li>
                                            </#list>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul class="items">
                                            <li class="hide addnew">
                                                <label for="title" class="fl"><span id="action">新增</span>发票抬头：</label>
                                                <input type="text" name="title" id="title" style="height:28px; line-height:28px;border:#e8e8e8 solid 1px;padding:0 5px; width:260px; margin-top: 2px;"/>
                                                <input type="hidden" name="id" id="id" value=""/>
                                            </li>
                                            <li class="f-cb">
                                                <a href="javascript:;" class="add-items f-fl closeaddnew" onclick="addInvoiceTitle();">新增</a>
                                                <a href="javascript:;" class="add-items f-fl addnew" style="margin-left: 10px; display: none;" onclick="saveInvoiceTitle();">保存</a>
                                                <a href="javascript:;" class="add-items f-fl addnew" style="margin-left: 10px; display: none;"  onclick="closeaddInvoiceTitle();">关闭</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul class="items" id="fpcontext">
                                            <li class="item-title">发票内容：</li>
                                            <li class="radioitem <#if invoiceInfo.invoiceContent=="no">selected</#if>" type="invoiceContent" value="no">
                                                不开发票
                                            </li>
                                            <li class="radioitem <#if invoiceInfo.invoiceContent=="infos">selected</#if>" type="invoiceContent" value="infos" style="margin-left: 2px;">
                                                明细
                                            </li>
                                        </ul>
                                    </div>
                                </div><!--payAndShip-edit-div end-->

                            </div>
                        </div><!--part-invoice end-->
                    </div><!--step-content end-->
                </div>
            </div>

            <h1>商品清单<#if createOrderType != '1'><a href="${base}/cart/list" style="float: right;padding-right: 20px;font-size: 12px;">返回修改购物车</a></#if></h1>
            <div class="step-content checkout-steps">
                <div id="part-order" class="sbox-wrap">
                    <div class="sbox">
                        <div id="order-cart">
                            <div class="order-review">
                                <!--商品清单展示-->
                                <form id="orderGoodsForm">
                <span id="span-skulist">
                <table class="review-thead">
                    <tbody>
                    <tr>
                        <th class="fore1">商品</th>
                        <th class="fore2"><#if isMemberPrice == 'yes'>会员价<#else>商城价</#if>(元)</th>
                        <th class="fore3">优惠(元)</th>
                        <th class="fore4">数量
                        <#--20160505 dzz 隐藏库存显示-->
                        <#--</td>
                            <th class="fore4">库存状态
                        </td>-->
                    </tr>
                    <tr class="row-border">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <#--<td class="tube-postage"></td>-->
                    </tr>
                    </tbody>
                </table>
                <div class="review-body">
                    <div class="review-block review-present">
                        <div class="block-header">
                            <!--满赠信息-->
                        </div>
                    </div>

                    <#assign total = 0>
                    <#assign totalPrice = 0>
                    <#assign discount = 0>
                    <#assign deliveryFee = 0>
                    <#assign hasDF = true>
                    <#assign packageCount = 0>
                    <#if hasInsuranceFee == 'yes'>
                        <#assign insuranceFee = 0>
                    </#if>
                    <#list cartItemList as map>
                        <div class="sj-name">
                           <#-- <label for="shopcheck"><a href="${base}/shop/${map.shopUrl}.html">商家：${map.shopName}</a></label>-->
                               <label for="shopcheck"><a>商家：陕西帮商乐信息技术有限公司</a></label>
                            <br>
                        </div>
                        <div class="sp-list">
                            <#assign totalPrice = totalPrice+(map.goodsTotal?number)>
                            <#assign discount = discount+(map.discount?number)>
                            <#assign deliveryFee=d.shift();f=new RegExp("(^|\\.)"+d.slice(0).sort().join("\\.(?:.*\\.)?")+"(\\.|$)")}e=c.data(this,"events");d=e[a.type];if(e&&d){d=d.slice(0);e=0;for(var j=d.length;e<j;e++){var i=d[e];if(b||f.test(i.namespace)){a.handler=i.handler;a.data=i.data;a.handleObj=i;i=i.handler.apply(this,arguments);if(i!==w){a.result=i;if(i===false){a.preventDefault();a.stopPropagation()}}if(a.isImmediatePropagationStopped())break}}}return a.result},props:"altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY originalTarget pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),
fix:function(a){if(a[G])return a;var b=a;a=c.Event(b);for(var d=this.props.length,f;d;){f=this.props[--d];a[f]=b[f]}if(!a.target)a.target=a.srcElement||s;if(a.target.nodeType===3)a.target=a.target.parentNode;if(!a.relatedTarget&&a.fromElement)a.relatedTarget=a.fromElement===a.target?a.toElement:a.fromElement;if(a.pageX==null&&a.clientX!=null){b=s.documentElement;d=s.body;a.pageX=a.clientX+(b&&b.scrollLeft||d&&d.scrollLeft||0)-(b&&b.clientLeft||d&&d.clientLeft||0);a.pageY=a.clientY+(b&&b.scrollTop||
d&&d.scrollTop||0)-(b&&b.clientTop||d&&d.clientTop||0)}if(!a.which&&(a.charCode||a.charCode===0?a.charCode:a.keyCode))a.which=a.charCode||a.keyCode;if(!a.metaKey&&a.ctrlKey)a.metaKey=a.ctrlKey;if(!a.which&&a.button!==w)a.which=a.button&1?1:a.button&2?3:a.button&4?2:0;return a},guid:1E8,proxy:c.proxy,special:{ready:{setup:c.bindReady,teardown:c.noop},live:{add:function(a){c.event.add(this,a.origType,c.extend({},a,{handler:oa}))},remove:function(a){var b=true,d=a.origType.replace(O,"");c.each(c.data(this,
"events").live||[],function(){if(d===this.origType.replace(O,""))return b=false});b&&c.event.remove(this,a.origType,oa)}},beforeunload:{setup:function(a,b,d){if(this.setInterval)this.onbeforeunload=d;return false},teardown:function(a,b){if(this.onbeforeunload===b)this.onbeforeunload=null}}}};var Ca=s.removeEventListener?function(a,b,d){a.removeEventListener(b,d,false)}:function(a,b,d){a.detachEvent("on"+b,d)};c.Event=function(a){if(!this.preventDefault)return new c.Event(a);if(a&&a.type){this.originalEvent=
a;this.type=a.type}else this.type=a;this.timeStamp=J();this[G]=true};c.Event.prototype={preventDefault:function(){this.isDefaultPrevented=Z;var a=this.originalEvent;if(a){a.preventDefault&&a.preventDefault();a.returnValue=false}},stopPropagation:function(){this.isPropagationStopped=Z;var a=this.originalEvent;if(a){a.stopPropagation&&a.stopPropagation();a.cancelBubble=true}},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=Z;this.stopPropagation()},isDefaultPrevented:Y,isPropagationStopped:Y,
isImmediatePropagationStopped:Y};var Da=function(a){var b=a.relatedTarget;try{for(;b&&b!==this;)b=b.parentNode;if(b!==this){a.type=a.data;c.event.handle.apply(this,arguments)}}catch(d){}},Ea=function(a){a.type=a.data;c.event.handle.apply(this,arguments)};c.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){c.event.special[a]={setup:function(d){c.event.add(this,b,d&&d.selector?Ea:Da,a)},teardown:function(d){c.event.remove(this,b,d&&d.selector?Ea:Da)}}});if(!c.support.submitBubbles)c.event.special.submit=
{setup:function(){if(this.nodeName.toLowerCase()!=="form"){c.event.add(this,"click.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="submit"||d==="image")&&c(b).closest("form").length)return na("submit",this,arguments)});c.event.add(this,"keypress.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="text"||d==="password")&&c(b).closest("form").length&&a.keyCode===13)return na("submit",this,arguments)})}else return false},teardown:function(){c.event.remove(this,".specialSubmit")}};
if(!c.support.changeBubbles){var da=/textarea|input|select/i,ea,Fa=function(a){var b=a.type,d=a.value;if(b==="radio"||b==="checkbox")d=a.checked;else if(b==="select-multiple")d=a.selectedIndex>-1?c.map(a.options,function(f){return f.selected}).join("-"):"";else if(a.nodeName.toLowerCase()==="select")d=a.selectedIndex;return d},fa=function(a,b){var d=a.target,f,e;if(!(!da.test(d.nodeName)||d.readOnly)){f=c.data(d,"_change_data");e=Fa(d);if(a.type!=="focusout"||d.type!=="radio")c.data(d,"_change_data",
e);if(!(f===w||e===f))if(f!=null||e){a.type="change";return c.event.trigger(a,b,d)}}};c.event.special.change={filters:{focusout:fa,click:function(a){var b=a.target,d=b.type;if(d==="radio"||d==="checkbox"||b.nodeName.toLowerCase()==="select")return fa.call(this,a)},keydown:function(a){var b=a.target,d=b.type;if(a.keyCode===13&&b.nodeName.toLowerCase()!=="textarea"||a.keyCode===32&&(d==="checkbox"||d==="radio")||d==="select-multiple")return fa.call(this,a)},beforeactivate:function(a){a=a.target;c.data(a,
"_change_data",Fa(a))}},setup:function(){if(this.type==="file")return false;for(var a in ea)c.event.add(this,a+".specialChange",ea[a]);return da.test(this.nodeName)},teardown:function(){c.event.remove(this,".specialChange");return da.test(this.nodeName)}};ea=c.event.special.change.filters}s.addEventListener&&c.each({focus:"focusin",blur:"focusout"},function(a,b){function d(f){f=c.event.fix(f);f.type=b;return c.event.handle.call(this,f)}c.event.special[b]={setup:function(){this.addEventListener(a,
d,true)},teardown:function(){this.removeEventListener(a,d,true)}}});c.each(["bind","one"],function(a,b){c.fn[b]=function(d,f,e){if(typeof d==="object"){for(var j in d)this[b](j,f,d[j],e);return this}if(c.isFunction(f)){e=f;f=w}var i=b==="one"?c.proxy(e,function(k){c(this).unbind(k,i);return e.apply(this,arguments)}):e;if(d==="unload"&&b!=="one")this.one(d,f,e);else{j=0;for(var o=this.length;j<o;j++)c.event.add(this[j],d,i,f)}return this}});c.fn.extend({unbind:function(a,b){if(typeof a==="object"&&
!a.preventDefault)for(var d in a)this.unbind(d,a[d]);else{d=0;for(var f=this.length;d<f;d++)c.event.remove(this[d],a,b)}return this},delegate:function(a,b,d,f){return this.live(b,d,f,a)},undelegate:function(a,b,d){return arguments.length===0?this.unbind("live"):this.die(b,null,d,a)},trigger:function(a,b){return this.each(function(){c.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0]){a=c.Event(a);a.preventDefault();a.stopPropagation();c.event.trigger(a,b,this[0]);return a.result}},
toggle:function(a){for(var b=arguments,d=1;d<b.length;)c.proxy(a,b[d++]);return this.click(c.proxy(a,function(f){var e=(c.data(this,"lastToggle"+a.guid)||0)%d;c.data(this,"lastToggle"+a.guid,e+1);f.preventDefault();return b[e].apply(this,arguments)||false}))},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}});var Ga={focus:"focusin",blur:"focusout",mouseenter:"mouseover",mouseleave:"mouseout"};c.each(["live","die"],function(a,b){c.fn[b]=function(d,f,e,j){var i,o=0,k,n,r=j||this.selector,
u=j?this:c(this.context);if(c.isFunction(f)){e=f;f=w}for(d=(d||"").split(" ");(i=d[o++])!=null;){j=O.exec(i);k="";if(j){k=j[0];i=i.replace(O,"")}if(i==="hover")d.push("mouseenter"+k,"mouseleave"+k);else{n=i;if(i==="focus"||i==="blur"){d.push(Ga[i]+k);i+=k}else i=(Ga[i]||i)+k;b==="live"?u.each(function(){c.event.add(this,pa(i,r),{data:f,selector:r,handler:e,origType:i,origHandler:e,preType:n})}):u.unbind(pa(i,r),e)}}return this}});c.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error".split(" "),
function(a,b){c.fn[b]=function(d){return d?this.bind(b,d):this.trigger(b)};if(c.attrFn)c.attrFn[b]=true});A.attachEvent&&!A.addEventListener&&A.attachEvent("onunload",function(){for(var a in c.cache)if(c.cache[a].handle)try{c.event.remove(c.cache[a].handle.elem)}catch(b){}});(function(){function a(g){for(var h="",l,m=0;g[m];m++){l=g[m];if(l.nodeType===3||l.nodeType===4)h+=l.nodeValue;else if(l.nodeType!==8)h+=a(l.childNodes)}return h}function b(g,h,l,m,q,p){q=0;for(var v=m.length;q<v;q++){var t=m[q];
if(t){t=t[g];for(var y=false;t;){if(t.sizcache===l){y=m[t.sizset];break}if(t.nodeType===1&&!p){t.sizcache=l;t.sizset=q}if(t.nodeName.toLowerCase()===h)lse>
                                                    ${(totalPrice + deliveryFee - discount)?string('currency')}
                                                </#if>
                                            </em>
                                        </div>
                                    </div>
                                    <div class="span clr"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="checkout-floatbar" class="checkout-buttons group">
                    <div class="sticky-wrap">
                        <div class="inner">
                            <#if hasDF>
                                <button type="submit" class="checkout-submit" id="order-submit" onclick="submit_Order();">提交订单<b></b></button>
                            <#else>
                                <button type="submit" class="checkout-submit" id="order-submit" onclick="submit_Order_ERROR();">提交订单<b></b></button>
                            </#if>
                            <span class="total">应付总额：
                                <strong id="payPriceId">
                                <#if hasInsuranceFee == 'yes'>
                                    ${(totalPrice + deliveryFee + insuranceFee - discount)?string('currency')}
                                <#else>
                                    ${(totalPrice + deliveryFee - discount)?string('currency')}
                                </#if>
                                </strong>元
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <form class="registerform" onsubmit="return false">
            <input type="hidden" id="consignee_form_id">
            <input type="hidden" id="isReceiverSubmit" value="false">
            <div class="pop_win aptab_center_address">
                <ul class="newaddress">
                    <li>
                        <label> <strong style="color: red;">*</strong> 收&nbsp;&nbsp;货&nbsp;&nbsp;人： </label>
                        <input type="text" id="consignee_name"  name="consigneeParam.name" value="" class="inputxt" maxlength="20">
                        <span class="form-tip"><span style="color: #ec0202;" id="name_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                        <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                        <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                        <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="60"  class="inputxt" style="width: 350px;">
                        <span class="form-tip"><span style="color: #ec0202;" id="address_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                        <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile"  ignore="ignore" >
                        &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                        <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel"  >
                        <span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>
                    </li>
                    <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                        <label for="set_normal" class="label_set_normal">
                            <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                            设为默认地址 </label>
                    </li>
                    <#--<li>-->
                        <#--<label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>-->
                        <#--<input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;" ignore="ignore" datatype="e" errormsg="邮箱格式错误！">-->
                    <#--</li>-->
                    <li>
                        <label> <strong style="color:#fff;">*</strong> 邮政编码： </label>
                        <input type="text" maxlength="6" id="consignee_zipCode" name="consigneeParam.zipCode" value="" id="Email" style="width:200px;">
                    </li>
                    <li>
                        <input type="submit" value="保 存" onclick="save_Consignee()"  class="btn_save  bule_btn" /> <span id="saveConsigneeTitleDiv"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div style="display:none;">
        <form action="${base}/member/reloadOrderCheck" method="post" id="reloadForm">

        </form>
    </div>

    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
    <script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
    <script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/order.common.js" type="text/javascript"></script>
    <script src="${base}/static/bec/project/ghj/js/order_new.js?v=1.0.1" type="text/javascript"></script>
    <script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
 <script type="text/javascript">

$(function(){

      /* var demo=$(".registerform").Validform({
           tiptype:3,
           label:".label",
           showAllError:true,
           datatype:{
               "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
           }
       });*/

       <#if !hasDF>
           submit_Order_ERROR();
       </#if>


   /*    //通过$.Tipmsg扩展默认提示信息;
       //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
       demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";

       demo.addRule([{
           ele:".inputxt:eq(0)",
           datatype:"*"
       },
           {
               ele:".inputxt:eq(1)",
               datatype:"*"
           },

           {
               ele:"select",
               datatype:"*"
           }
       ]);
*/

/*
       $(".registerform").Validform({
           datatype:{
               "phone":function(gets,obj,curform,regxp){
                   */
/*参数gets是获取到的表单元素值，
obj为当前表单元素，
curform为当前验证的表单，
regxp为内置的一些正则表达式的引用。*//*


                   var reg1=regxp["m"],
                           reg2=/[\d]{7}/,
                           mobile=curform.find(".mobile");

                   if(reg1.test(mobile.val())){return true;}
                   if(reg2.test(gets)){return true;}

                   return false;
               }
           }
       });
*/




   })



</script>-->
    <!--收货地址所用js-->
    <script type="text/javascript">

        $(function(){
            $("#addresshtml").addClass("current");
            $(".mod_address_book .adr_list li").hover(function() {
                        if ($(this) !== $(".mod_address_book .adr_list li:last-child")) {
                            $(this).addClass("hover_li");
                            if ($(this).find(".using_add").length > 0 && $(this).find(".using_add").is(":visible")) {
                                $(this).find(".edit_box a").eq(1).hide();
                            }
                        }
                    },
                    function() {
                        if( $(this).attr("isDefault") == "false" ){
                            $(this).removeClass("hover_li");
                        }
                    });
        });
        function showTips(receiverId){
//            $("#tips_"+index).show();
            if($('#consignee_radio_'+receiverId).attr("isDefault") == 'true'){
                layer.alert('默认地址无法删除！', {icon: 7, title:'温馨提示'});
            }else{

                layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                            delReceiver(receiverId);
                            layer.close(index);
                        },
                        function(index){
                            layer.close(index);
                        });
            }
        }
        function hideTips(index){
            $("#tips_"+index).hide();
        }

    </script>
    <script type="text/javascript">
        /*宽屏设置*/
        //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

        $(function () {
            $(".areaSelect").val("");
            $(".areaSelect").lSelect({
                url: "${base}/area/ajaxChildren"// Json数据获取url
            });
            $(".items").on('click','.radioitem',function(){
                $("#"+$(this).attr("type")).val($(this).attr("value"));
                $(this).parent().find(".radioitem").removeClass("selected");
                $(this).addClass("selected");
            });
            $(".items").on('dblclick','.invoiceTitel',function(){
                editInvoice($(this).find("a").text(),$(this).attr("id"));
            });

            //判断收货地址
            judgeD();
        });

        function judgeD(){
            var areaArray = new Array('610102','610103','610104','610111','610112','610113','610116');
            var areaId = $("#order_areaId").val();
            var flag = true;
            $.each(areaArray, function(i, v){
                if( areaId == v ){
                    flag =  false;
                }
            });

            if(flag){
                if( $("#delivery-method-1605111012254171155").attr("checked") == 'checked' ||  $("#delivery-method-1605111012254171155").attr("checked") == true){
                    choseDelivery('1605111013390861177');
                }
                $("#delivery-method-div-1605111012254171155").hide();
            }
        }

        /**
         * 编辑支付与配送方式
         */
        function edit_Payment(flag) {
            $("#step-2").addClass("step-current");

            $("#editPayAndShip").hide();
            $("#savePayAndShipTitleMinDiv").show();
            $("#payAndShip-content").hide();
            $("#payAndShip-edit-div").show();

        }

        /**
         * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 Start
         */
        function save_PayAndShip() {
            var order_deliveryTimeName = $("#order_deliveryTimeName").val();
            var paymentMethodId=$("#order_paymentMethodId").val();
            var deliveryTimeId=$("#order_deliveryTime").val();

            var paymentMethodLabel=$("#pay-method-label-"+paymentMethodId).html();
            $(".payment-selected").html(paymentMethodLabel);

            var deliveryMethodId=$("#order_deliveryMethodId").val();
            var deliveryMethodLabel=$("#delivery-method-label-"+deliveryMethodId).html();
            $(".delivery-selected").html(deliveryMethodLabel);

            $("#step-2").removeClass("step-current");
            $("#editPayAndShip").show();
            $("#savePayAndShipTitleMinDiv").hide();
            $("#payAndShip-content").show();
            $("#payAndShip-edit-div").hide();

            var deliveryId = $("#deliveryId").val();
            if (!isEmpty(deliveryId)) {
                window.location.href = "${base}/member/ordercheck?o="+$("#order_cartItemIds").val()+"&deliveryId="+deliveryId+"&paymentMethodId="+paymentMethodId+"&deliveryTimeId="+deliveryTimeId+"&order_deliveryTimeName="+order_deliveryTimeName;
            }
        }
        /**
         * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 End
         */

        /**
         * 选择支付方式
         */
        function chosePayment(id) {
            $("#order_paymentMethodId").val(id);
        }

        /**
         * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 Start
         */

        function choseDelivery(id) {
            $("#order_deliveryMethodId").val(id);

            reloadThisPage();
        }
        /**
         * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 End
         */

        /**
         * 是否启用会员价
         */
        function choseIsMemberPrice() {
            if($("#isMemberPrice_checkbox").is(":checked")){
                $("#isMemberPrice").val("yes");
                $("#invoiceContent").val("no");
                $("#invoiceTitle").val("");
                $("#invoiceType").val("");
            }else{
                $("#isMemberPrice").val("no");
            }

            reloadThisPage();
        }

        /**
         * 是否保价
         */
        function choseHasInsuranceFee() {
            if($("#hasInsuranceFee_checkbox").is(":checked")){
                $("#hasInsuranceFee").val("yes");
            }else{
                $("#hasInsuranceFee").val("no");
            }

            reloadThisPage();
        }

        /**
         * 编辑发票信息
         */
        function edit_Invoice() {
            $("#step-3").addClass("step-current");
            $("#editInvoice").hide();
            $("#saveInvoiceTitleMinDiv").show();
            $("#invoice-content").hide();
            $("#invoice-edit-div").show();
        }


        /**
         * 删除发票抬头
         * */
        function deleteInvoice(id,invoiceTitle,indexNum){
            if(indexNum == '0'){
                layer.alert('默认发票抬头无法删除！', {icon: 7, title:'温馨提示'});
            }else{
                layer.confirm('您确定要删除[' + invoiceTitle + ']这个发票抬头吗？删除后将不可恢复。', {icon: 3, title:'温馨提示'}, function(index){
                    $.ajax({
                        type: "post",
                        url: "${base}/member/deleteInvoice",
                        data: "id=" + id,
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                $("#" + id).remove();
                                layer.msg(data.msg, {icon: 6});
                            } else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        }
                    });
                    layer.close(index);
                })
            }

        }

        /**
         * 保存发票内容
         */
        function save_Invoice() {
            if($("#invoiceContent").val()=="no") {
                $.ajax({type: "post",
                    url: "${base}/member/saveInvoiceSetting",
                    data:"invoiceContent=no",
                    dataType: "json",
                    success:function(data){
                        if(data.success){
                            layer.msg(data.msg, {icon: 6});
                            $("#invoiceInfo").text($(".selected[type='invoiceContent']").text());
                            $("#invoiceType").val("");
                            $("#invoiceTitle").val("");
                            $("#invoiveContent").val("no");
                            closeInvoiceForm();
                        }else{
                            layer.msg(data.msg, {icon: 5});
                        }
                    }
                });
            }else{
                if($(".selected[type='invoiceType']").text()==""){
                    layer.alert("请选择发票类型！", {icon: 5, title:"温馨提示"});
                }else if($(".selected[type='invoiceTitle']").text()==""){
                    layer.alert("请选择发票抬头！", {icon: 5, title:"温馨提示"});
                }else {
                    $.ajax({
                        type: "post",
                        url: "${base}/member/saveInvoiceSetting",
                        data: "invoiceTitle=" + $(".selected[type='invoiceTitle'] a").text() + "&id=" + $(".selected[type='invoiceTitle']").attr("id") + "&invoiceContent=" + $(".selected[type='invoiceContent']").text(),
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                layer.msg(data.msg, {icon: 6});
                                var info = $(".selected[type='invoiceType']").text() + "　　" + $(".selected[type='invoiceTitle'] a").text() + "　　" + $(".selected[type='invoiceContent']").text();
                                $("#invoiceInfo").text(info);
                                closeInvoiceForm();
                            } else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        }
                    });
                }
            }
        }

        function closeInvoiceForm(){
            $("#step-3").removeClass("step-current");
            $("#editInvoice").show();
            $("#saveInvoiceTitleMinDiv").hide();
            $("#invoice-content").show();
            $("#invoice-edit-div").hide();
        }

        function addInvoiceTitle(){
            $("#action").text("新增");
            $(".addnew").show();
            $(".closeaddnew").hide();
        }
        function closeaddInvoiceTitle(){
            $(".addnew").hide();
            $(".closeaddnew").show();
            $("#title").val("");
            $("#id").val("");
        }

        function editInvoice(title,id){
            $("#id").val(id);
            $("#title").val(title);
            $("#action").text("修改");
            $(".addnew").show();
            $(".closeaddnew").hide();
        }

        function saveInvoiceTitle(){
            if($("#title").val()==""){
                layer.alert("发票抬头不能为空！", {icon: 5, title:"温馨提示"});
                $("#title").focus();
            }else{
                if($("#id").val()!=""){
                    var titleStr = $("#title").val();
                    if(titleStr.length > 50){
                        layer.alert("发票抬头长度不超过50字符！", {icon: 5, title:"温馨提示"});
                        $("#title").focus();
                        return;
                    }
                    if($("#title").val()!=$("#"+$("#id").val()+" span").text()){
                        var ishave = false;
                        $(".radioitem[type='invoiceTitle']").each(function () {
                            if ($("#title").val() == $(this).find("a").text() && $("#id").val()!=$(this).attr("id")) {
                                layer.alert("该发票抬头已经存在！", {icon: 2, title:"温馨提示"});
                                ishave = true;
                            }
                        });
                        if (!ishave) {
                            $.ajax({
                                type: "post",
                                url: "${base}/member/editInvoice",
                                data: "invoiceTitle=" + $("#title").val() + "&id=" + $("#id").val(),
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        layer.msg(data.msg, {icon: 6});
                                        $("#" + $("#id").val() + " a").text($("#title").val());
                                        $("#invoiceTitle").val($("#title").val());
                                        closeaddInvoiceTitle();
                                    } else {
                                        layer.msg(data.msg, {icon: 5});
                                    }
                                },
                                error: function () {
                                    layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                                }
                            })
                        }
                    }else{
                        closeaddInvoiceTitle();
                    }
                }else {
                    var titleStr = $("#title").val();
                    if(titleStr.length > 50){
                        layer.alert("发票抬头长度不超过50字符！", {icon: 5, title:"温馨提示"});
                        $("#title").focus();
                        return;
                    }

                    var ishave = false;
                    $(".radioitem[type='invoiceTitle']").each(function () {
                        if ($("#title").val() == $(this).find("a").text()) {
                            layer.alert("该发票抬头已经存在！", {icon: 5, title:"温馨提示"});
                            ishave = true;
                        }
                    });
                    if (!ishave) {
                        $.ajax({
                            type: "post",
                            url: "${base}/member/saveInvoice",
                            data: "invoiceTitle=" + $("#title").val(),
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    layer.msg(data.msg, {icon: 6});
                                    $(".radioitem[type='invoiceTitle']").removeClass("selected");
                                    var html = "<li class=\"radioitem invoiceTitel selected\" type=\"invoiceTitle\" id=\""+data.id+"\" value=\"" + $("#title").val() + "\"><a href=\"javascript:;\" title=\"双击修改\">" + $("#title").val() + "</a><b onclick=\"deleteInvoice('" + data.id + "','" + $("#title").val() + "');\" class=\"close-color\">&nbsp;&nbsp;<b></li>";
                                    $(".radioitem[type='invoiceTitle']").parent().append(html);
                                    $("#invoiceTitle").val($("#title").val());
                                    closeaddInvoiceTitle();
                                    $("#title").val("");
                                } else {
                                    layer.msg(data.msg, {icon: 5});
                                }
                            },
                            error: function () {
                                layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                            }
                        })
                    }
                }
            }
        }
        /**
         * 提交订单
         */
        function submit_Order(){

            var receiverId=$("#order_receiverId").val();
            if(receiverId.length==0){
                layer.alert("请选择收货人!", {icon: 5, title:"温馨提示"});
                return;
            }

            $.ajax({
                type: "post",
                url: "${base}/order/submit",
                data:$("#orderCheckInfo").formSerialize()+'&'+$("#orderGoodsForm").formSerialize(),
                dataType: "json",
                success: function (data) {
                    if (data.status == "success") {
                        if (data.payType == "online" && !data.isEnableConfirm) {
                            window.location.href ="${base}/payment?orderSn="+data.orderSn+"&total="+data.totalAmount+"&key="+data.orderId+"&t="+Math.random();
                        } else {// if(data.payType == "offline" || ) {
//					window.location.href = "${base}/order/view/" + data.orderId + ".html";
                            window.location.href = "${base}/order/list";
                        }
                    } else {
                        layer.alert(data.message, {icon: 6, title:"温馨提示"});
                    }
                },
                error : function(error) {
                    layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                    //$("#order-loading").replaceWith(originSubmit);
                    //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
                    //$("#submit_message").show();
                }

            });
        }

        /**
         * 判断是否是空 Auth:zhangqiang Time:2015-09-25 17:43:35
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


        function submit_Order_ERROR(){
            layer.alert("当前的配送方式不符合微货通的配送范围，请您与管理员联系！",{icon:7});
        }
    </script>
</#escape>