/*
 Date: 2014-01-21 
 */
function login() {
    return location.href = "https://passport.jd.com/new/login.aspx?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F"),
    !1
}
function regist() {
    return location.href = "https://reg.jd.com/reg/person?ReturnUrl=" + escape(location.href),
    !1
}
function createCookie(a, b, c, d) {
    var d = d ? d: "/";
    if (c) {
        var e = new Date;
        e.setTime(e.getTime() + 1e3 * 60 * 60 * 24 * c);
        var f = "; expires=" + e.toGMTString()
    } else var f = "";
    document.cookie = a + "=" + b + f + "; path=" + d
}
function readCookie(a) {
    for (var b = a + "=",
    c = document.cookie.split(";"), d = 0; d < c.length; d++) {
        for (var e = c[d];
        " " == e.charAt(0);) e = e.substring(1, e.length);
        if (0 == e.indexOf(b)) return e.substring(b.length, e.length)
    }
    return null
}
function addToFavorite() {
    var a = "http://www.jd.com/",
    b = "\u4eac\u4e1cJD.COM-\u7f51\u8d2d\u4e0a\u4eac\u4e1c\uff0c\u7701\u94b1\u53c8\u653e\u5fc3";
    document.all ? window.external.AddFavorite(a, b) : window.sidebar && window.sidebar.addPanel ? window.sidebar.addPanel(b, a, "") : alert("\u5bf9\u4e0d\u8d77\uff0c\u60a8\u7684\u6d4f\u89c8\u5668\u4e0d\u652f\u6301\u6b64\u64cd\u4f5c!\n\u8bf7\u60a8\u4f7f\u7528\u83dc\u5355\u680f\u6216Ctrl+D\u6536\u85cf\u672c\u7ad9\u3002"),
    createCookie("_fv", "1", 30, "/;domain=jd.com")
}
function search(a) {
    var b = "http://search.jd.com/Search?keyword={keyword}&enc={enc}{additional}",
    c = search.additinal || "",
    d = document.getElementById(a),
    e = d.value;
    if (e = e.replace(/^\s*(.*?)\s*$/, "$1"), e.length > 100 && (e = e.substring(0, 100)), "" == e) return window.location.href = window.location.href,
    void 0;
    var f = 0;
    "undefined" != typeof window.pageConfig && "undefined" != typeof window.pageConfig.searchType && (f = window.pageConfig.searchType);
    var g = "&cid{level}={cid}",
    h = "string" == typeof search.cid ? search.cid: "",
    i = "string" == typeof search.cLevel ? search.cLevel: "",
    j = "string" == typeof search.ev_val ? search.ev_val: "";
    switch (f) {
    case 0:
        break;
    case 1:
        i = "-1",
        c += "&book=y";
        break;
    case 2:
        i = "-1",
        c += "&mvd=music";
        break;
    case 3:
        i = "-1",
        c += "&mvd=movie";
        break;
    case 4:
        i = "-1",
        c += "&mvd=education";
        break;
    case 5:
        var k = "&other_filters=%3Bcid1%2CL{cid1}M{cid1}[cid2]";
        switch (i) {
        case "51":
            g = k.replace(/\[cid2]/, ""),
            g = g.replace(/\{cid1}/g, "5272");
            break;
        case "52":
            g = k.replace(/\{cid1}/g, "5272"),
            g = g.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
            break;
        case "61":
            g = k.replace(/\[cid2]/, ""),
            g = g.replace(/\{cid1}/g, "5273");
            break;
        case "62":
            g = k.replace(/\{cid1}/g, "5273"),
            g = g.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
            break;
        case "71":
            g = k.replace(/\[cid2]/, ""),
            g = g.replace(/\{cid1}/g, "5274");
            break;
        case "72":
            g = k.replace(/\{cid1}/g, "5274"),
            g = g.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}");
            break;
        case "81":
            g = k.replace(/\[cid2]/, ""),
            g = g.replace(/\{cid1}/g, "5275");
            break;
        case "82":
            g = k.replace(/\{cid1}/g, "5275"),
            g = g.replace(/\[cid2]/, "%3Bcid2%2CL{cid}M{cid}")
        }
        b = "http://search.e.jd.com/searchDigitalBook?ajaxSearch=0&enc=utf-8&key={keyword}&page=1{additional}";
        break;
    case 6:
        i = "-1",
        b = "http://music.jd.com/8_0_desc_0_0_1_15.html?key={keyword}"
    }
    if ("string" == typeof h && "" != h && "string" == typeof i) {
        var l = /^(?:[1-8])?([1-3])$/;
        i = "-1" == i ? "": l.test(i) ? RegExp.$1: "";
        var m = g.replace(/\{level}/, i);
        m = m.replace(/\{cid}/g, h),
        c += m
    }
    if ("string" == typeof j && "" != j && (c += "&ev=" + j), "undefined" != typeof $o.click && $o.click !== !1 && "undefined" != typeof $o.lastKeyword && $o.lastKeyword !== !1) try {
        JA.tracker.ngloader("search.000002", {
            prefix: $o.lastKeyword,
            keyword: e,
            pos: $o.click
        })
    } catch(n) {}
    e = encodeURIComponent(e),
    sUrl = b.replace(/\{keyword}/, e),
    sUrl = sUrl.replace(/\{enc}/, "utf-8"),
    sUrl = sUrl.replace(/\{additional}/, c),
    ("undefined" == typeof search.isSubmitted || 0 == search.isSubmitted) && (setTimeout(function() {
        window.location.href = sUrl
    },
    10), search.isSubmitted = !0)
}
window.pageConfig = window.pageConfig || {},
pageConfig.wideVersion = function() {
    return screen.width >= 1210
} (),
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "root61"),
pageConfig.FN_getDomain = function() {
    var a = location.hostname;
    return /360buy.com/.test(a) ? "360buy.com": "jd.com"
},
pageConfig.FN_GetUrl = function(a, b) {
    return "string" == typeof a ? a: pageConfig.FN_GetDomain(a) + b + ".html"
},
pageConfig.FN_StringFormat = function() {
    var a = arguments[0],
    b = arguments.length;
    if (b > 0) for (var c = 0; b > c; c++) a = a.replace(new RegExp("\\{" + c + "\\}", "g"), arguments[c + 1]);
    return a
},
pageConfig.FN_GetDomain = function(a) {
    var b = "http://{0}.jd.com/{1}";
    switch (a) {
    case 1:
        b = this.FN_StringFormat(b, "item", "");
        break;
    case 2:
        b = this.FN_StringFormat(b, "book", "");
        break;
    case 3:
        b = this.FN_StringFormat(b, "mvd", "");
        break;
    case 4:
        b = this.FN_StringFormat(b, "e", "");
        break;
    case 7:
        b = this.FN_StringFormat(b, "music", "")
    }
    return b
},
pageConfig.FN_GetImageDomain = function(a) {
    var b, a = String(a);
    switch (a.match(/(\d)$/)[1] % 5) {
    case 0:
        b = 10;
        break;
    case 1:
        b = 11;
        break;
    case 2:
        b = 12;
        break;
    case 3:
        b = 13;
        break;
    case 4:
        b = 14;
        break;
    default:
        b = 10
    }
    return "http://img{0}.360buyimg.com/".replace("{0}", b)
},
pageConfig.FN_ImgError = function(a) {
    for (var b = a.getElementsByTagName("img"), c = 0; c < b.length; c++) b[c].onerror = function() {
        var a = "",
        b = this.getAttribute("data-img");
        if (b) {
            switch (b) {
            case "1":
                a = "err-product";
                break;
            case "2":
                a = "err-poster";
                break;
            case "3":
                a = "err-price";
                break;
            default:
                return
            }
            this.src = "http://misc.360buyimg.com/lib/img/e/blank.gif",
            this.className = a
        }
    }
},
pageConfig.FN_SetPromotion = function(a) {
    if (0 != a) {
        var b = "\u9650\u91cf,\u6e05\u4ed3,\u9996\u53d1,\u6ee1\u51cf,\u6ee1\u8d60,\u76f4\u964d,\u65b0\u54c1,\u72ec\u5bb6,\u4eba\u6c14,\u70ed\u5356",
        c = b.split(",")[parseInt(a) - 1],
        d = "<b class='pi{0}'>{1}</b>";
        switch (c.length) {
        case 1:
            d = d.replace("{0}", " pix1 pif1");
            break;
        case 2:
            d = d.replace("{0}", " pix1");
            break;
        case 4:
            d = d.replace("{0}", " pix1 pif4")
        }
        return d.replace("{1}", c)
    }
},
pageConfig.FN_GetRandomData = function(a) {
    for (var b, c = 0,
    d = 0,
    e = [], f = 0; f < a.length; f++) b = a[f].weight ? parseInt(a[f].weight) : 1,
    e[f] = [],
    e[f].push(c),
    c += b,
    e[f].push(c);
    d = Math.cei&&p.has(n)||u.push(n):n&&n.length&&"string"!==r&&i(n)})})(arguments),n?o=u.length:r&&(s=t,c(r))}return this},remove:function(){return u&&b.each(arguments,function(e,t){var r;while((r=b.inArray(t,u,r))>-1)u.splice(r,1),n&&(o>=r&&o--,a>=r&&a--)}),this},has:function(e){return e?b.inArray(e,u)>-1:!(!u||!u.length)},empty:function(){return u=[],this},disable:function(){return u=l=r=t,this},disabled:function(){return!u},lock:function(){return l=t,r||p.disable(),this},locked:function(){return!l},fireWith:function(e,t){return t=t||[],t=[e,t.slice?t.slice():t],!u||i&&!l||(n?l.push(t):c(t)),this},fire:function(){return p.fireWith(this,arguments),this},fired:function(){return!!i}};return p},b.extend({Deferred:function(e){var t=[["resolve","done",b.Callbacks("once memory"),"resolved"],["reject","fail",b.Callbacks("once memory"),"rejected"],["notify","progress",b.Callbacks("memory")]],n="pending",r={state:function(){return n},always:function(){return i.done(arguments).fail(arguments),this},then:function(){var e=arguments;return b.Deferred(function(n){b.each(t,function(t,o){var a=o[0],s=b.isFunction(e[t])&&e[t];i[o[1]](function(){var e=s&&s.apply(this,arguments);e&&b.isFunction(e.promise)?e.promise().done(n.resolve).fail(n.reject).progress(n.notify):n[a+"With"](this===r?n.promise():this,s?[e]:arguments)})}),e=null}).promise()},promise:function(e){return null!=e?b.extend(e,r):r}},i={};return r.pipe=r.then,b.each(t,function(e,o){var a=o[2],s=o[3];r[o[1]]=a.add,s&&a.add(function(){n=s},t[1^e][2].disable,t[2][2].lock),i[o[0]]=function(){return i[o[0]+"With"](this===i?r:this,arguments),this},i[o[0]+"With"]=a.fireWith}),r.promise(i),e&&e.call(i,i),i},when:function(e){var t=0,n=h.call(arguments),r=n.length,i=1!==r||e&&b.isFunction(e.promise)?r:0,o=1===i?e:b.Deferred(),a=function(e,t,n){return function(r){t[e]=this,n[e]=arguments.length>1?h.call(arguments):r,n===s?o.notifyWith(t,n):--i||o.resolveWith(t,n)}},s,u,l;if(r>1)for(s=Array(r),u=Array(r),l=Array(r);r>t;t++)n[t]&&b.isFunction(n[t].promise)?n[t].promise().done(a(t,l,n)).fail(o.reject).progress(a(t,u,s)):--i;return i||o.resolveWith(l,n),o.promise()}}),b.support=function(){var t,n,r,a,s,u,l,c,p,f,d=o.createElement("div");if(d.setAttribute("className","t"),d.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",n=d.getElementsByTagName("*"),r=d.getElementsByTagName("a")[0],!n||!r||!n.length)return{};s=o.createElement("select"),l=s.appendChild(o.createElement("option")),a=d.getElementsByTagName("input")[0],r.style.cssText="top:1px;float:left;opacity:.5",t={getSetAttribute:"t"!==d.className,leadingWhitespace:3===d.firstChild.nodeType,tbody:!d.getElementsByTagName("tbody").length,htmlSerialize:!!d.getElementsByTagName("link").length,style:/top/.test(r.getAttribute("style")),hrefNormalized:"/a"===r.getAttribute("href"),opacity:/^0.5/.test(r.style.opacity),cssFloat:!!r.style.cssFloat,checkOn:!!a.value,optSelected:l.selected,enctype:!!o.createElement("form").enctype,html5Clone:"<:nav></:nav>"!==o.createElement("nav").cloneNode(!0).outerHTML,boxModel:"CSS1Compat"===o.compatMode,deleteExpando:!0,noCloneEvent:!0,inlineBlockNeedsLayout:!1,shrinkWrapBlocks:!1,reliableMarginRight:!0,boxSizingReliable:!0,pixelPosition:!1},a.checked=!0,t.noCloneChecked=a.cloneNode(!0).checked,s.disabled=!0,t.optDisabled=!l.disabled;try{delete d.test}catch(h){t.deleteExpando=!1}a=o.createElement("input"),a.setAttribute("value",""),t.input=""===a.getAttribute("value"),a.value="t",a.setAttribute("type","radio"),t.radioValue="t"===a.value,a.setAttribute("checked","t"),a.setAttribute("name","t"),u=o.createDocumentFragment(),u.appendChild(a),t.appendChecked=a.checked,t.checkClone=u.cloneNode(!0).cloneNode(!0).lastChild.checked,d.attachEvent&&(d.attachEvent("onclick",function(){t.noCloneEvent=!1}),d.cloneNode(!0).click());for(f in{submit:!0,change:!0,focusin:!0})d.setAttribute(c="on"+f,"t"),t[f+"Bubbles"]=c in e||d.attributes[c].expando===!1;return d.style.backgroundClip="content-box",d.cloneNode(!0).style.backgroundClip="",t.clearCloneStyle="content-box"===d.style.backgroundClip,b(function(){var n,r,a,s="padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;",u=o.getElementsByTagName("body")[0];u&&(n=o.createElement("div"),n.style.cssText="border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px",u.appendChild(n).appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",a=d.getElementsByTagName("td"),a[0].style.cssText="padding:0;margin:0;border:0;display:none",p=0===a[0].offsetHeight,a[0].style.display="",a[1].style.display="none",t.reliableHiddenOffsets=p&&0===a[0].offsetHeight,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",t.boxSizing=4===d.offsetWidth,t.doesNotIncludeMarginInBodyOffset=1!==u.offsetTop,e.getComputedStyle&&(t.pixelPosition="1%"!==(e.getComputedStyle(d,null)||{}).top,t.boxSizingReliable="4px"===(e.getComputedStyle(d,null)||{width:"4px"}).width,r=d.appendChild(o.createElement("div")),r.style.cssText=d.style.cssText=s,r.style.marginRight=r.style.width="0",d.style.width="1px",t.reliableMarginRight=!parseFloat((e.getComputedStyle(r,null)||{}).marginRight)),typeof d.style.zoom!==i&&(d.innerHTML="",d.style.cssText=s+"width:1px;padding:1px;display:inline;zoom:1",t.inlineBlockNeedsLayout=3===d.offsetWidth,d.style.display="block",d.innerHTML="<div></div>",d.firstChild.style.width="5px",t.shrinkWrapBlocks=3!==d.offsetWidth,t.inlineBlockNeedsLayout&&(u.style.zoom=1)),u.removeChild(n),n=d=a=r=null)}),n=s=u=l=r=a=null,t}();var O=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,B=/([A-Z])/g;function P(e,n,r,i){if(b.acceptData(e)){var o,a,s=b.expando,u="string"==typeof n,l=e.nodeType,p=l?b.cache:e,f=l?e[s]:e[s]&&s;if(f&&p[f]&&(i||p[