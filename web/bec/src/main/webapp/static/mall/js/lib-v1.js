/*
 Date: 2014-06-26 
 */
function StringBuilder() {
    this.strings = new Array,
    this.length = 0
}
function jdThickBoxclose() {
    $(".thickclose").trigger("click")
}
function getparam() {
    var a = "",
    b = "";
    new Object;
    for (var c = location.search.substring(1), d = c.split("&"), e = 0; e < d.length; e++) {
        var f = d[e].indexOf("="); - 1 != f && (d[e].substring(0, f), "sid" == d[e].substring(0, f) && (a = unescape(d[e].substring(f + 1))), "t" == d[e].substring(0, f) && (b = unescape(d[e].substring(f + 1))))
    }
    return "" != a || "" != b ? "&sid=" + escape(a) + "&t=" + escape(b) : ""
}
function mlazyload(a) {
    var b = {
        defObj: null,
        defHeight: 0,
        fn: null
    };
    b = $.extend(b, a || {});
    var c = (b.defHeight, "object" == typeof b.defObj ? b.defObj: $(b.defObj));
    if (! (c.length < 1)) {
        var d = function() {
            var a = document,
            c = "ipad" == navigator.userAgent.toLowerCase().match(/iPad/i) ? window.pageYOffset: Math.max(a.documentElement.scrollTop, a.body.scrollTop);
            return a.documentElement.clientHeight + c - b.defHeight
        },
        e = function() {
            c.offset().top <= d() && !c.attr("load") && (c.attr("load", "true"), b.fn && b.fn())
        };
        e(),
        $(window).bind("scroll",
        function() {
            e()
        })
    }
} !
function() {
    var a = document.getElementById("nav-dapeigou");
    a && (a.innerHTML = '<a href="http://channel.jd.com/chaoshi.html">\u4eac\u4e1c\u8d85\u5e02</a>')
} (),
"undefined" == typeof pageConfig.FN_getDomain && (pageConfig.FN_getDomain = function() {
    var a = location.hostname;
    return /360buy.com/.test(a) ? "360buy.com": "jd.com"
}),
function() {
    var a = $("#service-2013 a[href='http://en.360buy.com/']");
    a.length && a.attr("href", "http://help.en.360buy.com/help/question-2.html")
} (),
function() {
    var a = $("#footer-2013 a[href='http://about.58.com/fqz/index.html']");
    a.length && a.attr("href", "http://www.bj.cyberpolice.cn/index.do")
} (),
"object" != typeof JSON && (JSON = {}),
function() {
    function f(a) {
        return 10 > a ? "0" + a: a
    }
    function quote(a) {
        return escapable.lastIndex = 0,
        escapable.test(a) ? '"' + a.replace(escapable,
        function(a) {
            var b = meta[a];
            return "string" == typeof b ? b: "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice( - 4)
        }) + '"': '"' + a + '"'
    }
    function str(a, b) {
        var c, d, e, f, g, h = gap,
        i = b[a];
        switch (i && "object" == typeof i && "function" == typeof i.toJSON && (i = i.toJSON(a)), "function" == typeof rep && (i = rep.call(b, a, i)), typeof i) {
        case "string":
            return quote(i);
        case "number":
            return isFinite(i) ? String(i) : "null";
        case "boolean":
        case "null":
            return String(i);
        case "object":
            if (!i) return "null";
            if (gap += indent, g = [], "[object Array]" === Object.prototype.toString.apply(i)) {
                for (f = i.length, c = 0; f > c; c += 1) g[c] = str(c, i) || "null";
                return e = 0 === g.length ? "[]": gap ? "[\n" + gap + g.join(",\n" + gap) + "\n" + h + "]": "[" + g.join(",") + "]",
                gap = h,
                e
            }
            if (rep && "object" == typeof rep) for (f = rep.length, c = 0; f > c; c += 1)"string" == typeof rep[c] && (d = rep[c], e = str(d, i), e && g.push(quote(d) + (gap ? ": ": ":") + e));
            else for (d in i) Object.prototype.hasOwnProperty.call(i, d) && (e = str(d, i), e && g.push(quote(d) + (gap ? ": ": ":") + e));
            return e = 0 === g.length ? "{}": gap ? "{\n" + gap + g.join(",\n" + gap) + "\n" + h + "}": "{" + g.join(",") + "}",
            gap = h,
            e
        }
    }
    "function" != typeof Date.prototype.toJSON && (Date.prototype.toJSON = function() {
        return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + f(this.getUTCMonth() + 1) + "-" + f(this.getUTCDate()) + "T" + f(this.getUTCHours()) + ":" + f(this.getUTCMinutes()) + ":" + f(this.getUTCSeconds()) + "Z": null
    },
    String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function() {
        return this.valueOf()
    });
    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
    escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
    gap, indent, meta = {
        "\b": "\\b",
        "	": "\\t",
        "\n": "\\n",
        "\f": "\\f",
        "\r": "\\r",
        '"': '\\"',
        "\\": "\\\\"
    },
    rep;
    "function" != typeof JSON.stringify && (JSON.stringify = function(a, b, c) {
        var d;
        if (gap = "", indent = "", "number" == typeof c) for (d = 0; c > d; d += 1) indent += " ";
        else "string" == typeof c && (indent = c);
        if (rep = b, b && "function" != typeof b && ("object" != typeof b || "number" != typeof b.length)) throw new Error("JSON.stringify");
        return str("", {
            "": a
        })
    }),
    "function" != typeof JSON.parse && (JSON.parse = function(text, reviver) {
        function walk(a, b) {
            var c, d, e = a[b];
            if (e && "object" == typeof e) for (c in e) Object.prototype.hasOwnProperty.call(e, c) && (d = walk(e, c), void 0 !== d ? e[c] = d: delete e[c]);
            return reviver.call(a, b, e)
        }
        var j;
        if (text = String(text), cx.lastIndex = 0, cx.test(text) && (text = text.replace(cx,
        function(a) {
            return "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice( - 4)
        })), /^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) return j = eval("(" + text + ")"),
        "function" == typeof reviver ? walk({
            "": j
        },
        "") : j;
        throw new SyntaxError("JSON.parse")
    })
} (),
eval(function(a, b, c, d, e, f) {
    if (e = function(a) {
        return (b > a ? "": e(parseInt(a / b))) + ((a %= b) > 35 ? String.fromCharCode(a + 29) : a.toString(36))
    },
    !"".replace(/^/, String)) {
        for (; c--;) f[e(c)] = d[c] || e(c);
        d = [function(a) {
            return f[a]
        }],
        e = function() {
            return "\\w+"
        },
        c = 1
    }
    for (; c--;) d[c] && (a = a.replace(new RegExp("\\b" + e(c) + "\\b", "g"), d[c]));
    return a
} ("(4($){$.R($.7,{3:4(c,b,d){9 e=2,q;5($.O(c))d=b,b=c,c=z;$.h($.3.j,4(i,a){5(e.8==a.8&&e.g==a.g&&c==a.m&&(!b||b.$6==a.7.$6)&&(!d||d.$6==a.o.$6))l(q=a)&&v});q=q||Y $.3(2.8,2.g,c,b,d);q.u=v;$.3.s(q.F);l 2},T:4(c,b,d){9 e=2;5($.O(c))d=b,b=c,c=z;$.h($.3.j,4(i,a){5(e.8==a.8&&e.g==a.g&&(!c||c==a.m)&&(!b||b.$6==a.7.$6)&&(!d||d.$6==a.o.$6)&&!2.u)$.3.y(a.F)});l 2}});$.3=4(e,c,a,b,d){2.8=e;2.g=c||S;2.m=a;2.7=b;2.o=d;2.t=[];2.u=v;2.F=$.3.j.K(2)-1;b.$6=b.$6||$.3.I++;5(d)d.$6=d.$6||$.3.I++;l 2};$.3.p={y:4(){9 b=2;5(2.m)2.t.16(2.m,2.7);E 5(2.o)2.t.h(4(i,a){b.o.x(a)});2.t=[];2.u=Q},s:4(){5(2.u)l;9 b=2;9 c=2.t,w=$(2.8,2.g),H=w.11(c);2.t=w;5(2.m){H.10(2.m,2.7);5(c.C>0)$.h(c,4(i,a){5($.B(a,w)<0)$.Z.P(a,b.m,b.7)})}E{H.h(4(){b.7.x(2)});5(2.o&&c.C>0)$.h(c,4(i,a){5($.B(a,w)<0)b.o.x(a)})}}};$.R($.3,{I:0,j:[],k:[],A:v,D:X,N:4(){5($.3.A&&$.3.k.C){9 a=$.3.k.C;W(a--)$.3.j[$.3.k.V()].s()}},U:4(){$.3.A=v},M:4(){$.3.A=Q;$.3.s()},L:4(){$.h(G,4(i,n){5(!$.7[n])l;9 a=$.7[n];$.7[n]=4(){9 r=a.x(2,G);$.3.s();l r}})},s:4(b){5(b!=z){5($.B(b,$.3.k)<0)$.3.k.K(b)}E $.h($.3.j,4(a){5($.B(a,$.3.k)<0)$.3.k.K(a)});5($.3.D)1j($.3.D);$.3.D=1i($.3.N,1h)},y:4(b){5(b!=z)$.3.j[b].y();E $.h($.3.j,4(a){$.3.j[a].y()})}});$.3.L('1g','1f','1e','1b','1a','19','18','17','1c','15','1d','P');$(4(){$.3.M()});9 f=$.p.J;$.p.J=4(a,c){9 r=f.x(2,G);5(a&&a.8)r.g=a.g,r.8=a.8;5(14 a=='13')r.g=c||S,r.8=a;l r};$.p.J.p=$.p})(12);", 62, 82, "||this|livequery|function|if|lqguid|fn|selector|var|||||||context|each||queries|queue|return|type||fn2|prototype|||run|elements|stopped|false|els|apply|stop|undefined|running|inArray|length|timeout|else|id|arguments|nEls|guid|init|push|registerPlugin|play|checkQueue|isFunction|remove|true|extend|document|expire|pause|shift|while|null|new|event|bind|not|jQuery|string|typeof|toggleClass|unbind|addClass|removeAttr|attr|wrap|before|removeClass|empty|after|prepend|append|20|setTimeout|clearTimeout".split("|"), 0, {})),
new
function(a) {
    var b = a.separator || "&",
    c = a.spaces === !1 ? !1 : !0;
    a.suffix === !1 ? "": "[]";
    var d = a.prefix === !1 ? !1 : !0,
    e = d ? a.hash === !0 ? "#": "?": "",
    f = a.numbers === !1 ? !1 : !0;
    jQuery.query = new
    function() {
        var a = function(a, b) {
            return void 0 != a && null !== a && (b ? a.constructor == b: !0)
        },
        d = function(a) {
            for (var b, c = /\[([^[]*)\]/g,
            d = /^(\S+?)(\[\S*\])?$/.exec(a), e = d[1], f = []; b = c.exec(d[2]);) f.push(b[1]);
            return [e, f]
        },
        g = function(b, c, d) {
            var e = c.shift();
            if ("object" != typeof b && (b = null), "" === e) if (b || (b = []), a(b, Array)) b.push(0 == c.length ? d: g(null, c.slice(0), d));
            else if (a(b, Object)) {
                for (var f = 0; null != b[f++];);
                b[--f] = 0 == c.length ? d: g(b[f], c.slice(0), d)
            } else b = [],
            b.push(0 == c.length ? d: g(null, c.slice(0), d));
            else if (e && e.match(/^\s*[0-9]+\s*$/)) {
                var h = parseInt(e, 10);
                b || (b = []),
                b[h] = 0 == c.length ? d: g(b[h], c.slice(0), d)
            } else {
                if (!e) return d;
                var h = e.replace(/^\s*|\s*$/g, "");
                if (b || (b = {}), a(b, Array)) {
                    for (var i = {},
                    f = 0; f < b.length; ++f) i[f] = b[f];
                    b = i
                }
                b[h] = 0 == c.length ? d: g(b[h], c.slice(0), d)
            }
            return b
        },
        h = function(a) {
            var b = this;
            return b.keys = {},
            a.queryObject ? jQuery.each(a.get(),
            function(a, c) {
                b.SET(a, c)
            }) : jQuery.each(arguments,
            function() {
                var a = "" + this;
                a = a.replace(/^[?#]/, ""),
                a = a.replace(/[;&]$/, ""),
                c && (a = a.replace(/[+]/g, " ")),
                jQuery.each(a.split(/[&;]/),
                function() {
                    try {
                        var a = decodeURIComponent(this.split("=")[0]),
                        c = decodeURIComponent(encodeURIComponent(this.split("=")[1]))
                    } catch(d) {}
                    a && (f && (/^[+-]?[0-9]+\.[0-9]*$/.test(c) ? c = parseFloat(c) : /^[+-]?[0-9]+$/.test(c) && (c = parseInt(c, 10))), c = c || 0 === c ? c: !0, c !== !1 && c !== !0 && "number" != typeof c && (c = c), b.SET(a, c))
                })
            }),
            b
        };
        return h.prototype = {
            queryObject: !0,
            has: function(b, c) {
                var d = this.get(b);
                return a(d, c)
            },
            GET: function(b) {
                if (!a(b)) return this.keys;
                for (var c = d(b), e = c[0], f = c[1], g = this.keys[e]; null != g && 0 != f.length;) g = g[f.shift()];
                return "number" == typeof g ? g: g || ""
            },
            get: function(b) {
                var c = this.GET(b);
                return a(c, Object) ? jQuery.extend(!0, {},
                c) : a(c, Array) ? c.slice(0) : c
            },
            SET: function(b, c) {
                var e = a(c) ? c: null,
                f = d(b),
                h = f[0],
                i = f[1],
                j = this.keys[h];
                return this.keys[h] = g(j, i.slice(0), e),
                this
            },
            set: function(a, b) {
                return this.copy().SET(a, b)
            },
            REMOVE: function(a) {
                return this.SET(a, null).COMPACT()
            },
            remove: function(a) {
                return this.copy().REMOVE(a)
            },
            EMPTY: function() {
                var a = this;
                return jQuery.each(a.keys,
                function(b) {
                    delete a.keys[b]
                }),
                a
            },
            load: function(a) {
                var b = a.replace(/^.*?[#](.+?)(?:\?.+)?$/, "$1"),
                c = a.replace(/^.*?[?](.+?)(?:#.+)?$/, "$1");
                return new h(a.length == c.length ? "": c, a.length == b.length ? "": b)
            },
            empty: function() {
                return this.copy().EMPTY()
            },
            copy: function() {
                return new h(this)
            },
            COMPACT: function() {
                function b(c) {
                    function d(b, c, d) {
                        a(b, Array) ? b.push(d) : b[c] = d
                    }
                    var e = "object" == typeof c ? a(c, Array) ? [] : {}: c;
                    return "object" == typeof c && jQuery.each(c,
                    function(c, f) {
                        return a(f) ? (d(e, c, b(f)), void 0) : !0
                    }),
                    e
                }
                return this.keys = b(this.keys),
                this
            },
            compact: function() {
                return this.copy().COMPACT()
            },
            toString: function() {
                var c = [],
                d = [],
                f = function(b, c, d) {
                    if (a(d) && d !== !1) {
                        var e = [encodeURIComponent(c)];
                        d !== !0 && (e.push("="), e.push(encodeURIComponent(d))),
                        b.push(e.join(""))
                    }
                },
                g = function(a, b) {
                    var c = function(a) {
                        return b && "" != b ? [b, "[", a, "]"].join("") : [a].join("")
                    };
                    jQuery.each(a,
                    function(a, b) {
                        "object" == typeof b ? g(b, c(a)) : f(d, c(a), b)
                    })
                };
                return g(this.keys),
                d.length > 0 && c.push(e),
                c.push(d.join(b)),
                c.join("")
            }
        },
        new h(location.search, location.hash)
    }
} (jQuery.query || {}),
eval(function(a, b, c, d, e, f) {
    if (e = function(a) {
        return (b > a ? "": e(parseInt(a / b))) + ((a %= b) > 35 ? String.fromCharCode(a + 29) : a.toString(36))
    },
    !"".replace(/^/, String)) {
        for (; c--;) f[e(c)] = d[c] || e(c);
        d = [function(a) {
            return f[a]
        }],
        e = function() {
            return "\\w+"
        },
        c = 1
    }
    for (; c--;) d[c] && (a = a.replace(new RegExp("\\b" + e(c) + "\\b", "g"), d[c]));
    return a
} ("n.5=v(a,b,c){4(7 b!='w'){c=c||{};4(b===o){b='';c.3=-1}2 d='';4(c.3&&(7 c.3=='p'||c.3.q)){2 e;4(7 c.3=='p'){e=x y();e.z(e.A()+(c.3*B*r*r*C))}s{e=c.3}d=';3='+e.q()}2 f=c.8?';8='+(c.8):'';2 g=c.9?';9='+(c.9):'';2 h=c.t?';t':'';6.5=[a,'=',D(b),d,f,g,h].E('')}s{2 j=o;4(6.5&&6.5!=''){2 k=6.5.F(';');G(2 i=0;i<k.m;i++){2 l=n.H(k[i]);4(l.u(0,a.m+1)==(a+'=')){j=I(l.u(a.m+1));J}}}K j}};", 47, 47, "||var|expires|if|cookie|document|typeof|path|domain|||||||||||||length|jQuery|null|number|toUTCString|60|else|secure|substring|function|undefined|new|Date|setTime|getTime|24|1000|encodeURIComponent|join|split|for|trim|decodeURIComponent|break|return".split("|"), 0, {})),
Function.prototype.overwrite = function(a) {
    var b = a;
    return b.original || (b.original = this),
    b
},
Date.prototype.toString = Date.prototype.toString.overwrite(function(a) {
    var b = new String;
    return "string" == typeof a && (b = a, b = b.replace(/yyyy|YYYY/, this.getFullYear()), b = b.replace(/yy|YY/, this.getFullYear().toString().substr(2, 2)), b = b.replace(/MM/, this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)), b = b.replace(/M/, this.getMonth()), b = b.replace(/dd|DD/, this.getDate() > 9 ? this.getDate() : "0" + this.getDate()), b = b.replace(/d|D/, this.getDate()), b = b.replace(/hh|HH/, this.getHours() > 9 ? this.getHours() : "0" + this.getHours()), b = b.replace(/h|H/, this.getHours()), b = b.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes()), b = b.replace(/m/, this.getMinutes()), b = b.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds() : "0" + this.getSeconds()), b = b.replace(/s|S/, this.getSeconds())),
    b
}),
String.prototype.format = function() {
    var a = this;
    return arguments.length > 0 && (parameters = $.makeArray(arguments), $.each(parameters,
    function(b, c) {
        a = a.replace(new RegExp("\\{" + b + "\\}", "g"), c)
    })),
    a
},
StringBuilder.prototype.append = function(a) {
    this.strings.push(a),
    this.length += a.length
},
StringBuilder.prototype.toString = function(a, b) {
    return this.strings.join("").substr(a, b)
},
function($) {
    $.jmsajax = function(a) {
        var b = {
            type: "POST",
            dataType: "msjson",
            data: {},
            beforeSend: function(a) {
                a.setRequestHeader("Content-type", "application/json; charset=utf-8")
            },
            contentType: "application/json; charset=utf-8",
            error: function(a) {
                alert("Status: " + (a.statusText ? a.statusText: "Unknown") + "\nMessage: " + msJSON.parse(a.responseText ? a.responseText: "Unknown").Message)
            }
        },
        a = $.extend(b, a);
        if (a.method && (a.url += "/" + a.method), a.data) if ("GET" == a.type) {
            var c = "";
            for (var d in a.data)"" != c && (c += "&"),
            c += d + "=" + msJSON.stringify(a.data[d]);
            a.url += "?" + c,
            c = null,
            a.data = "{}"
        } else "POST" == a.type && (a.data = msJSON.stringify(a.data));
        if (a.success && a.dataType && "msjson" == a.dataType) {
            var e = a.success;
            a.success = function(b, c) {
                var d = dateparse(b);
                a.version ? a.version >= 3.5 && (d = d.d) : 0 == b.indexOf('{"d":') && (d = d.d),
                e(d, c)
            }
        }
        return $.ajax(a)
    },
    dateparse = function(a) {
        try {
            return msJSON.parse(a,
            function(a, b) {
                var c;
                return "string" == typeof b && b.indexOf("Date") >= 0 && (c = /^\/Date\(([0-9]+)\)\/$/.exec(b)) ? new Date(parseInt(c[1], 10)) : b
            })
        } catch(b) {
            return null
        }
    },
    msJSON = function() {
        function f(a) {
            return 10 > a ? "0" + a: a
        }
        function quote(a) {
            return escapeable.lastIndex = 0,
            escapeable.test(a) ? '"' + a.replace(escapeable,
            function(a) {
                var b = meta[a];
                return "string" == typeof b ? b: "\\u" + ("0000" + ( + a.charCodeAt(0)).toString(16)).slice( - 4)
            }) + '"': '"' + a + '"'
        }
        function str(a, b) {
            var c, d, e, f, g, h = gap,
            i = b[a];
            switch (i && "object" == typeof i && "function" == typeof i.toJSON && (i = i.toJSON(a)), "function" == typeof rep && (i = rep.call(b, a, i)), typeof i) {
            case "string":
                return quote(i);
            case "number":
                return isFinite(i) ? String(i) : "null";
            case "boolean":�wg��7q/#a6B�
�{R�����3�� _3��`F9��#"Mt
Y���Ù�y�ޯ���\�l�o�3a-�v�n5�I�0}Ү;�x���d^*5��~6���v�����ۭs�jQ���R�w>ǽ��rm9��yWil����tty�ֽ%�Y��~�'5W�(����(�S����.�~%e� ��m'n�UN�W7%(}�eU��U��'��:"2�	���Bx�G��9�y%��z�$��	r����bZ�� �R���T��N�_};��S��'a����"�ɬ�Q�����	��>�$~��yƱ���Ǡ�� p��0
/V)��������T��(��Tz��>�ʣr�Ck�_�o�>�Jq��%�P�(���"�RJ�~'P&�V%�Z�D@f5ǉ�F���M� �N�����FI��4W*EX���b0�0V�1�F~��D�����A��N��[c�}[J �  ��?�����6���rǟ^���>����  �n�Dq8�	� a�RC��lS�$\jt�+c���ۖ�:5�.�V�(c��j٫;��k��V�/ֲ�;��>(/��>�<�9�v������x�@,h�_I�e}�qd�5��1�!�_
�ҟvA�K�p���<ː��|<;�1��)�f��j��ҁk�B����l�=~��1	C^5jA��O�q�`�5����|���ݛ��g��wᄵݓ��$�W3��wҁ�G�Az���v����?��[���i�h嚳>���.��������tN�I��=\]�q{ ���K�s�%wCE��-���
��p�������;�	�[{J�[A?2�[}���$������-�3����Vu�/�v��1�Ct�oG<��o%�����^Ib(���nD����.Z����i�� m�.�n~��&�rE?��o��<����^{L��~�{�܀lS����Ň���|�
ʿG�ɷ�����g�}k����9x
���FGn��?ge����<W���X7�eW�7b�����겷W�x3"�f\��:�7J'؟�o/d�&���1h���X���r<nUBth�w}ЎJ��
4�rS�����^t��;�[k�:[r�9��x�����V��6�Vuu��u۪:�[���q�ʸbB���yb�3��U�tz�Dp�+d��m�u6ҫ0�YC��e�[���|�M���O���S~����朒���B�X�
�s�Q#d�(���f��gM���n�l�O���{�[W�y`d؁��-�|���bh��{NTWm�!��D�r���c���C��^*��|�h�Fʧ���y�8vB2�V����L���0�m�D�� w���;&cOrs��
9#�?��Z�{"A�����Q�T����������(�mk�� �a��wI,x �[pgp������{�� ��kB� A�s��8�{ΟwoOMMwU����k���Z�[7�ߑ��B{�SңXq�)��o�鹱~[2��Ω���"y.^���&j�h;��@��<?�@H�^�e�9l��'�?��L٣���آ��YI��%ї:$CV�˥p�&�gt'�_�[|@uYCK�

W�TAF�,��r��W&="�XQi�gH��,�{�(��bceA��ks~6�xm��)�a�,��g����}�0��><�
 ����[����'����e?��l�=��+����b(��ƌ^�݌=�H"UT�DL����L-;���_���KI�#�b��{�1�,���U�\�����z�Y�C�T�6
��m���jY����=�4���;�\�
9�ã�UG������,ܫ�0�xY���lǴB����Yff&?�o󑸦�����ԵB��J+���/�)�y��ۖ̈́&�h/is����YN����,�$��� ��h��e��	7;���
�:ְ����ѐB�����Y
#u�����:Wb�	ŀ���'��k�/�	K�,+�r.�Q�E��d�n�*hu86�Dkq����j ��#��i��概4��鶒�������?��V��IMo�a��$T�-m7��Q@F*��Mm���3l��se���Yl?.֛ӫ˲��@�#ju?L�	 �pgKy����F�������ގj��>z�v��7�^�����
튏H�8ŴD[m�/O���ث�~��ȏ7b"���7����^��c�ZHX��K�p
Ō�f�Y�_8'�
�L�n�g.`��+*^tH�d�F����8Fz-i��
2��w�ϝ�3���~{3N�͸��j��O҇��3�e{�)|a��X3��L6�|[A&Ḗm��A�"I�|hY���x����ӏ�n)�n��1T�2_Urw
���$�����ۉ
[;�Kr��N��Q�M2uhO�d�/��!�աP�ݷ)�E.>oG�l�\�k��x�T�4����{&0��^���A9z=�ٵ'����[��(�E��䪟^9�aУ"��v��e��������.M��������'vN��~�Ӹ��:�K3=[%�.��,!�z�P l�7W��[�-�tŇ�H�f� �iwLSW�(��u�Z��������ah3�m&)ܳB��^���o%�n��Q?�<�x�H��U�u�Xڣ ��d���� �[A��r�I����2qN��85�2�8	(��?32YL�'��8ĠAs�����Ptpf��3��E�#[�Y»s����=���}�"�$�HJ�lƆ���[�5���c�6��b�~o�݃�i7C����s��o뜯�/�mg�zm<Iܠ���74���lz��0B����n�s�-���b�\�е9�p����s��T:���r��$oU�b�b�}̉kw��Ρo������c�pvN�SU�!�iGo����LiKR7NA�&��d�-��9Sv�j<�\t�[�
E2���ld�nW�$d֜*�k^������gn�������5��2��g&����b!�K3���yzw��>����4U6�2�;�ވQ]�:/'{Fu�b
7�>�(UE��`�*�E�	��DBD@���_�'>��GF[���������Pv1=4�y��i��tZ��Ƥ�)���S9k
�EZVڀ2�$���j9��#)��Ԯyy�;*C�[����l'mg44aG\c���{i���H�w'O��J"݇���&�D��ǝ���엇�iR�^H]���"?���
�9���*���tz
u�x�d��*|V<�ωk)�Y�f����Z��b,>f<�r�Q��H��E�&,����g�'��ʥ/����i�j����Vn-�9���Y9��sˤ��+�!�)Ctը���7���[���cx0X���w8��`l����N`�n&�S�ruo�}�&�ox
$���«��4ʮ��s)�H�'ҋ������s6�@(jSѤ�����T��@P ����m�fm�$��{����~�B����&��vcr�KVs���摪S��彂-�\Ql/d��G�h]�]��:�:"�%tC�9Y���ğ����x������2s轋�<˫��f[���IZ� �hӧ%gX���<c�����7ؒ �s��\� �F E]�'Q=�Yy`b��)ڎt	�Mva�G�~(�$�$Q�*�y<`*�����.vCWS[��ߙ��w�s4g�7��G2�&�+,�`�?%b���-���D���ƀ�a�O0�v6��6�+�+vK�X��~w���&F��ف������z�tC; �'W8�{�����eZ|֌�e�扠�ev�\K)5q����''���T}O.��(O#az�FU����T�1���v7Qݺ�t�yr��NY�ϭ�B�f���=~����-Q���چ����9�_�(E����8��t����g4�R^�S,�x�����Х��d�R���@*w��iHe::7Y���%୅��L��N���T{����TSp����b,�ղ�N|mN�)��)Y��b?)�����8�ɦ�����y��|ӛ�5OJ*��qՋ�Cf�����0ei|�&c�O���>�X���A�r -JX)��NP�:� ����G��,�e�������C�r�{�g�x����ɺmwQ1DŲ���m�C?��6��5��I�F�c��|��T�)�Ӎ\�2AL��L�B�E?{���KJNA4ߦGIu�W��O�s��n͘a�M0�5�%�ө��5o-`
���L��-2��w��w/}\�i�ӽű��|C�!).=3#��_�|i!d�a�4�+���z�~�Q��F);����r����iQ��Y(���I_?J�E2<�!�y��H7Xw���*W�b?H� �Lͺ���%�cn�q%�;��ܚ��uw��\�G����C¸ߧ���p���^��^�ǉ^�
��*�|[�M��b˔i�DC���� �$`��P�����̅\�i4S����E[��I4��ψ��k1��fS]!���+�����D����-�@(q�=1>n'ͅ�أ��e�ƻ�P��sS޷S��%m��cM���$ �[��?�.�D��>9
�^k��<'��Ò�3�I�Jp��r[���*��clF$��-�?�����c�hgo��6uRqU�a�f��Sz[�z,�,3������؆sDC�C�*�)���F��E�7
�a`��ꗞjpa����<�=��<��^�VU��� ���o|O�O��Ō�E�S����G�G�ߔ:?}�>-�yD�s�oE9O9OK19a<�-�x
{��{��������)ʏ(d����姸����y�����Ϙ�o
��1ן12s��3�R� P |�Є ���yɈ(�HȊ����@�seO]  �;  �.���QR���V�]�Gi���C���)�U�ۢ��3Fo�6\�K�i*$���"���o��	���A4�^M2֩T���w��C��$��^���($U��U���.P�0�od����O L`��<A?�1�����L�c�%)7Cé3� ���~l�\mV7/k
�/�_�+C�WW�w����$��j�������'n�H��W�#OaCn�ik�R���LcR��bi���F�ߧ��Ic����	��j�����hx��ѧ��y�����}'/%���o77a�=c]5��`@�Z�Ѧػr�?�6{��P�`����1�Y�m��V��ո�:�}���vBaٔ��p��a��U�#�сwO-b�� ��m5���iY�}��Ʒ�(jzI�(]]b�мa�`��2���yo`|�iO��G�aKi�ׂ�=)*J�>꒾����|����^�Q��/`$kzu�x����w���pb���������ŧW)S�!�x�'Q�}-���v���E��zBݐ�+��
����G�*�����DF��b�V��)��?W,��%�$a�)�A��~�MJ�T�	�~�܄I|�]d :[�����?�Y�!~�ma��w�d!c�2Ca%���"a�5z��lY\:-�7�����D�Bk�@�68�#��|@v�YS��<fvs��!R1@�ۿ���~-�d�{�
��F�B�x�K�)R"զK�J���u�U���[��-*L��4���XE������_�տ\�jn���*6�Y��L��
E8�'����
U'	['c���7&�Ǐ�Q�`�Q��D�������C	����@0�N�L�,A:Й���$�l���N�x�c6�s�e�ʟ�ݜ�}	�\��w6}��ڍvw��)�!=Yդ�J&��>^����2Z�B�L0��F��rp~FZ�ٞ(]n8��D1�{H�gq1)�f�,��K ATw/�GǙ��lъ���:�ho�~�2��(�2p�k�|(�]j\C}���9�ޥޜ�$�s��[<P�G�6{����iN` �#�rE��dM8jN�����=Z`u�B�p�/�_����R�Z곢3�
�r��g��w*J�U�V
�U�ka�$֭��^���_v�{��z'��6����6����^lu�z�N#�e�`uP��h��50���iCb3�~�ݡƵ�����u�d���ph`4R{C�.-6��	��>�������ĸ\�1�*�|&q��/%�/��d*��'����G<e����	�$�]�~��g��̈́O�QĄ��+=<B�p�fOf����>�\�D��WB*�����b��K���;���,�P+-9r�F��>8W���P�9���=�;��A[�A���2|\�/�	���4UW�O���yS��폮���|����K�=�A!�.Y?g�l�d��uS0&���i�*�5��זȋC�#I3���ʬ�Ҥ��9iW��S� U��,�H#�K�c�y�S��<�f�8~���Y��i��a	�;�
,�G�% Y�kh!�U�K�W6b�~%�9)B4�d�Q���TrH�������MzA>l� 
*Eq����Mb@]G�S�Dی���
w�-�^��-���̝ɹ!���G��{2�<,�%��=��õ��c�mmZ+d�7��ŤmmwZ(ĝv�4N�w� ��q�A�����R��i<lFi�A)Fr��n|��yS��\(�#���#���ܣ��Iy��n*���� �5=u����
�����-��I
�Y�h�KQ�d��X-�*��z�A��e�+�էaI�`[�Q;&�3�&vN�:!/sh�����/z��M8#A�⿶;p��ؓ��^���!p  ��E�Z8YZX[8{��*ZN��(�)4˪��$��,��ҚG���C��v
�Q��Hzm�f�e�ؓ}q%�4���
�\�V~24E��v�ajaU>f5�ާ�P1m+�$��O�n���Z!jά?ef폽c�򖿡��8��pJ�p_�B�9������؎1����;&+y������;��2�d��3Od�RCl{��#f��5�?�t.^}��6���e��q$x���
��(lA�h�k�uÒ����{#�jy��D|ݥ�M�%��1��c�!j�$j3�G�Eȧ,��˵���?�+��9�y�����d6<S� F�G��a@y�� lX���Q��&	���_R*��4�9J2��\�ux����#�5�������Px	��8�^!~��(&,��d�l-�G#+����f_�B�'{)O�y�>|I}�ZfE�}1�j�)�q�������1J�arg�Ȩy�QՎ�E�.Y3?����5��c�a��o
�� ��S���,�n�Y,Wmg�B>`)h��8@�y�U�e*+��s�K#�z4^�Tk]��W
G�߈�^߈�)^4���i�3'Wj-���[�
�/�}ǖM���x,�`�"�	_e�o�K��*������5��F�#�E
�'��{"�k�q��`��%���s��
�0���O������\L?���|�:�rwv��"�v�O!�i�V�8R:SL���n���I�iH?J2
��h/Е�L��sg�v�g}B�O�E���_N�sC��FJ������X����Ϣ��<i�,��N�v]ɖ���O
x3�H�V�O��e.F�p�t%��ڲ*�C�;���no84���T\n>��^?���;�@w���e��x�e�S�G��3V7�*&0{A�vT ��:7���:��-gl/(��K=�s�	�,C�����q��4Cά<�|��H�j灶���˶q�q������˂�Γz�&�:]�*�y>MX��'_"{�ؐ���/���E�������
�����Ƃg�Y�h�oU�E�#U�7��]-�H��-m6�Å��,+�����*�Z�Q�Dqe$S����#N'`�t�^�q�y�h�t[�r.A뀼:�5�uQ�V62.A�IUr���tlg�$'�:\��S�N
4��5�o��?���ˮO8a8������&FdM�,��ϿY�V�Y��M��6psҪk�ڙ���5)�+�N�*g5l\r����1�8
�Z�d�>7�u�|��f]ۮ���Y	J(��C�*����jK=m_:̈́����^AOP	O@%g�$S0�A;&y]R5�_�&1o	�����GO��%H���Im������onTV�#`��(�P/��t$�Vx3�?�8�4�tğVB9a�F6�v9G�̾�xs�3>��jg��YDk@��qq�R2��h��y[�RЙd�6'��R�Ӕ/X��/�Z�|�������kt�S8�O	�h��X#�,1T���O�;��[G\b���|���L������SV����ϔ�P�r�"��>�kq��W� ��
�ba"� ]
7\�Ÿd�������jN�E�Wg��_W3��$A4Q�-b��6
��} �$=Nt�6��^�B~����P�p}�����a����(�*�a�V�/,R�4�'��JM)u"m��)d�@��>�q�X�"��I�c��JU�ѭݥ���#����7?+O��NU�ʴT����-��([}���7r5h���GW��L�~N[ӪE��@�Z]84w�7���a�|^�12��T�Kr ��h�%��������ژm_�15�����8m��G$s���Jv�M��� J��HǐO�%���k_�V���N�P�%)��\h�
���#v��<�Ջԗ�z��~��ʡws�b�2�Ļd?T�/�e��ƣ��!�C�7εm��V�Ŵ�\��Iڍ����J��Q(eњ#é��\�h����[����!�Ai�W��&��G{T��v

FFj�V�}����n `&��l�=()��W䳼��D�/���h��
4>�H�NЀ�Ap�@��zJ���b��a� �i3��ma&�bG�(,Ң{���QG6�茙�H3:0$�Cr�u��_�fd�l�!?ԓ��rw�����GC���bK�/���=�,�7����w,Z��Ǩ������
v�qן�#�.�� Z�ܚDX��[B�pJ鬞��l�|��4w�m-b�K�wb<n,fY����F�0��vޟN�*
�
��W�[�K�e�C�05&�ݥt�Fma�� q�Nң�@X.	��G45�Iz	7�����k�Ix���^���b~���B.��ś��c�xH��vU2����\�N�+m�����|��cF���Ep�0	[�(��Dˌ��Iv��!����̜�p"r�F�0��k��z���e]~_��;q-��z��̎��h�fw�T�Ĩ�Mo%AI�rx�#'�y��� �b)P���2w��_��I���]K����Q�������5��Nfz�6	��
��Q�9��x���x�^|uƒ����W��$����'2O�ne­ں`0C�z<�=�y�������]�b�а<e���ds!�]:6�9R@D���KZ�]d�o�Ղ@P��)��������֧���ٵ��ԘBAT���Ԥh����#�����z^�<�+ȗZ�	M�=̺d������77����T&���������Nzs���������g;/�d  �@Ov�#2��w�,*��R���7l��*Y���w��Y#��-ld�}g��[i�߲�/���u��}B��vP�S&D�io��T��a�'���`��)w����9��I�4����ŇYO�/#ow�΍�=��㤀T.ԡ���ش�ߙ/�Qq�X�a���Ȧ���c8'���}�˟KǴ����i$��5��uk�^�!�������$C���H��:[8{Hؚ��I����,=���'m<X,.)bj�2����$0��G闢f�dv�7+�+�'�0#��(I����k7��G<�.@�pڋ�%���j���{����G�t-d-�1#Lɸ�ϒ}2��G׊X!'e�c�R�Hl�fKO���7����E���0��Cr'��<��~��U������V�
Y�3�qsN'ۡN^�$���J�I���6�᚟ 	|�KUMA
L��Z�\��uz�����з���<P���i�h��5.w��]M��UG��#5k��M$\C#�sb߻��8��f�U���5&�T��n�@
�a��s3s:8$w�d+�q�|�`5[�f�, �P�j���	,�I$+Ֆ�$%�R^�U�^I;#q���iE�^�J��{��Bx�5bL7i��R�v
l��RN$Bs����o])@���Ϩ0�LQ��Gg�<F��6�m�
�(�������2RQ��q�4���
��X�g��;�D��?����2%cXJ���93�{�m�����IO�'=\�yG;{Gg�w����!5z$����)8�h��0`[���3W��:��=u��~U��S��]x��a�׷1��ǫ/�}�<�+�d�2#A�cÂ]�\�
L��\t�,��L�e{ *3kQN�C	"���"�iH���LڄKoVz:K�5Y�c�̲�W��~v�b<��&H�c�o�����ޥ3���SiQ�����
񶾆� -����#�,�mw�Ң��#�֤dޯY�ٲ�$A�X�"_����
�	z�Obq���9�?�U����VΆN�2�R�'���t8������z*X��X(K� �Ƃ��G��NLkz��5�R����`��ͅ�
�T��4�-�l�Q4މֈp:7�W�cZi�X[�5M.8�򾰵e�l�=e��Gd�W��%<�Q� ��$#�ҡ�WPk5Q#F5�����|�z�H��5���U{-��e�3P��C�V����ί3�ɗ�i���8M.ct\�KD�_"6�L�
{�>���e����Vs�I�*����@��]3�K�!��^���������14M�BY��xV8���� �,IW�$�"�R6�^��<~y�~rp�i]8�kl��]�M��������,?����-��5"�k�t�7LilD�P	p��~���u�e��r�p���w��GKd���6���Ë��ն�_o�d���"��"hЌ3��
���i$�
�?�c��HAh�ġ�␞�)���wP���=�g�>f����6<b��pf,[�E�X5�1g{��o�ir��o8�./
��>eł�y+�j�.0��������Z������Q�Pr�)��H�������̢*61.$�{��<#�����k�G(8��>��e3b�և8���-޶�6zt���5�۸�x-�A6H4��ٷ� !��4Yu~�~�#@�ac_l�$|��d��Ҹd�>i%�$� �]Y�R>����S�aa��S~tb�|��0P���[Gv��R&a\�|Ý�J9N�Y� 7P?��w�f�*#�js��q�l����Ϻb86���V���&�_�O#d�"� 
�a,5�u�B	a�qp��X$9�rw�����D&3����Ya����vQh,Ke�B����l}fC
͡� �Ϫ%ϻ�D���u(@�I'S�����$y(�L σ=���y7�|M�;7��72#z<�}���w�q �,�vx���l��N��.cg�]��˾T�b�(�,t#Ύ'AH��Q�"C0x�T���*iuȾ\�y�TMƜ�-{VQ���'�a���ƀ&�c9�H����o���9/P��zI8����5��m��o�������6B��C���mB��|�a
@��ߒIT��Y�R����G�KL�G\N���aG��&�dF�3��C�1�yx'���K�*�=�6�=^]��ɨ����el
+~_�w��#2V<����Z����g�2ܯ�P���e��n;cz6ph���0|(K�ј	�1��)���i_��ч���Ũ$�.�GaM��¹���=_�HX��t�e&�|�^��P���lw�5Q��$�5����;��@�#P��j�s2��C"��s�Տ��9��Hiy�i6��qYm;�e�Z���(�~��,�W�5�N��?���;#��Z����P�<���z�S��F$�5�i��)[A���V�u4�H>4���}���)H@�vs�&ҽ}}����w�������)U��ҽ󴾌�2';��j��p5#��j/�*r�xI�`����Y�Rz�h�g�9�[C��n�:���T%�Y��`x�\���:��(�F��D.)1��Cdסx'���<�=>p�1�m3>�_h\�k�NR6�OKn����7�J�I�.ͮ|�"��g���"�U��l�4�<�gg��ͦ�(��K��^���T�
+y����\~���8+���IOd�c �6*��$VlL��? pf?��O����F��R玜"_�C�����zy��!^�=k��?٢�;��h��gZ��Z���D %/�7f�0��p�È�HS	����(%yJIzN��O
�Z2��HhN�����p���35U��CB��&���+�y��}��bBQ�ɢ0����	�d���E8by}��(�-{Ͳ��$���/���#��Lُ1�n쭯>�o�տk���(E���J>I1isi2њ�0�4&w�y����OY�{�n�!B���G��%����_��^SM]Ysn'��V5��+n�ہ����.e"�ؽo��KŘT�s�-���|\��J	܇��)7ʰW�?��_���q�:�p�%�F��DFz�tYBr��N��������jԉ��@�-J��e
hc�{L�-r�/%H���X�F�Σ�[�
����B�Ծ��sIq�w�ʖ l���WH<�@�-\:�p#�D���e��t��<eΆ�OU�NI��+x#O�M��M��?��r��n�/�k��58N�d������������W�g��F�������ְI!>(b>���:A����n�+���΋hھ��+�#�#t��U�	�3�~�e��rQ��w��7����gzЖ��9�����<�

�\���a#���O��q�� G��aqd�VY�tr"� A>IR^���U�c^L��̖��tӤ�aA��Dh��D萫�������(	�gA��1���ŧ�t�!ݢ%�<�.u󯸘�ug'X�l�|F��^������+�(+B��q��j�f�KS�+>�9�����h\��%W��n<K�h�+�~��ȥ���8�5�貆�ʰ2-	lB��8q>F����Z�x��b�t���I� �d|�������?�������߁�u��`iT�F��<�KHH���b-�cJ�,3�Ϲ=��
}��3ރ�/-� �=��� ^�!@�ǚ�0�r���qsƊ#+���B���Wj<�
C�=�G�xm�Lu��ED����� @��e���42ړ9�I<�B@Q ��%?ǲ�$~a�/���0o��E�P�HF�`�5k�d�7���\*DeY|1�jx�N�
̿���?53�%�B����t� 2|M
���}�ț�}�h���yM�vn1���P�GM�1$���*HI]'�\CW���L�B�����8�kP�̪�̸LΫ��26ĐM�m=�6�W/h��Z��5�Hy�H~��t� �����Hmm4����\
H_��@3�a&���LE���/���vj�8m�F|x�R����U��S7.zoҷm�4Ģ��&��������8��rQBR!.�U����(���Ji1G��:��X�:a��QS��m�9$�P�������=IZ�Կ�������)�A�N���F3�c4�'������y���q�U��ɗԅ�N#R�Q�,0�K�MH���S��?�j����υ��)����a9׸�vS?mA6"S~g��a�e��� p��X�CD(���|yr|R}`fZ3�>��+pdR�#�C��m��$����`�l�鑼������<�Š���m�ݫ�kX�!/p��E�1]����ԚAP;���
��v��+\�2^C�!o!y�����z8Z�a��A�(�	^�6�)j���Q��~`�"
�@H��|ź�G^���x�b�B-
Ӻb5����Q�
��}���=^�S�iIv�R����wk�ś��ʅ5e��z"�thT����Q�T����,N�B�R�-c$��ܒ?�L�$D[!	��T���5y�c��Z���mH&��8�����G�5IztDLۦ��c�nnY�z�����n'"-\w+�A�w���C"Z�7GX������Ȥ�9N��H#�H@0N��Pl�� �D�$��l8R��v�tNyvaA�8��'�QR��M�} [E��MFĘ�E\���/��cT2B�*F=��.�Г�� �)�:wZ/3�>��0����얷\T�����FȫB�[�V��WH�XW�л�P��F7
�JpC�g�Y���_�����O�

e�BM#9��sH4�d��+ �O�U��
(�gy)�4�aq�s��V$ƹK䜠ӄ�}
�k��\	~"|�x�����<U�\��6?]{��~��|.{"%A��IW2�U)�Ôpg��r�f�(��#sJ8#9l��Q��t��|�-��1��R��@~4�T���F���qi�+�Re�q��󉻔�Ja0��-��M�y��A�Pp0��8n���ϊ��;�}/'0� �!>ǅ�Jt�����I�e��۹������Q�ʅ��O7?�u]�w�(����R
�)��cG�����O�׷3EZ�a��h��M�N(��c��</�U���7&v^L1�>�H���u�罊��������4�xԺ)y���i���
;��`��+�SeST/gp���j��؍`�ysk7	���kF���&�: �����U1�B���B�&�B���_gc
�+c��^�ʢ��#��q'q�^����1���c`k������yp�aˊNt<�&�0�"���6J�3�Yr{�h��MOm�|����������#l�� $�C���,�[�Y�����k5��u�u�``)���B��WK�h��є���,It�x2�­rV��`�7��-[��=��r!NعK�ΙQ(�S�!G�|��@��	�#��]�u��h���M��?���D�U��)EU��'�g����@��),�=}�΀X{�o��ab�h�q�xv�پ��ϼ��_����P�6
d�|�
!�&�H��-G�5`��B�@���!�  ���qR7�ŬI�B�b��K��僗�寻���ʗ�?���#"�&�9Y9>[5\a7Aأd��N���}ʤ��`^m�yLr���ə
��z�2�=AR�3HޜW�S�N�������E:�g��#Y�8�Z�q��7����r�e��?C�.�,Ȱ

Io�.��ϐj�z�X�K�G�J�t&���T*�	�/_�E��̱�z��C��yo��Ë�&<��)QX�٘Cь�ْ
��ԣ��|#�,&�D�MU�DҡM�PL2��H@���2�P�1�'��h����
����
�znDu��������=�N(��u`��[i!��5��㝁�����v5R�����݁���O�C�ߥ��mط�@9��y	c,���.�����b+�t
��I��u���#���WX�O���;�S���NL
眱�Ϯ�%7Z_�rt��w4$����I��";}��m�NeG���{��8�h􎑾k&4���eݓ�݇�G������A0O�uR�#*�0�FT}Wp3���4���&K�U�t��W�:���&�F��4�	,�4K���\d]8�A�+$~��ydl��Ѓ�� !�����v�|ͽm"�okYY���ݺ:_��ޥ7�E��Eۋ0i��CYT�k��R����t��#��IX� ̭�����W?��NJh׌���u�:)���:Y�����n�O��jg�|���Ӷ�=��YOe?�xԎ	����bd������Jt|��ǿ�����y* ��с�6�w{�+�@���M��(�g�����pj�IAY��O"[z��o���v����JwJl>��&��ʞF���"��D��$�%I�K%�N�4w8�
'���Px��N7�@B�A�lj���yD!ӽ���`�Zە�̩�>�',	s�8���1�'k�Z���G�?��4��o���X@0���r�`ɮ{S�7*��=
�h�pݞ�{,?�Bv#sD��D���_Ᏽ��[�}e�I�CD��K��Ȑ��N������G�����]�����_Iv��o��m�B�Jt��آ�8`'O��-�u6�t�õ�)��O�1��j� 1e/�I�"'��(a��3�-Q�
N�_N�ӗ�$�}�~KYQUG���
$D&��.�X�C��%�� ߟ1�J�����]�Y�sMH�:�u�M��Vs�����k�p��$�'g�脌����dg
B���J���D��|x�O�!/}b6ec��LY������$�+�}	>x͐��4I&���!{!���G���T���
`k��oY��&�3Z6+b��.ɾ}p#~U$�^&~��Օ%����"����eSv�G@�,a���d�U�A��o?H��Q�{}�p��0��j��}W�R�,5�֥������L��������EF���<&�MԢ�G�o}O��*"�H�I�:�9�� �G-��
��M�{��uz�D-�����_��b��O�"��e��=��"k��{��y�P���ٽnD)Kֲ���A�,d��v��Eo�Y}�PL&-��x�LKK+�]y�m3�6�O໇Rx��ˡ��zȍ�Κ%\q�������H�J��ӑw�zU�Ӑ��$�nK�jo!gJ4��K]�Y?�D�}�����ʫw�H��m甝\��c�gFOqp���F�O���,ae��-��ع�[,�C�J��0I;�Q�?�%T�Gh�ƙ1~�Jm,ڦ�{[�-�f5����&i2c�������zk)&M�v_B��ȴJlP����!>�����3��
�PN$���8Ph�
��M&����(p%s  ��L^)��7>�v8@W�
�@y`V6\~I��9�@
0CN�R�2 L��Į�X�&���J\5u� &����WM�2��Np���Փ��`^�R#�,!  �0*])) f7��������5@�=��������`r��5�ZF@���6�Ɗ�Y�ZW�R���p
��φY��38�ѝ;��5 (�ָ��!2@0>Ϊ4�W�E�``�g��0 ��M^8t��'�|��v%�n~����C�l������������ \\�X�ɖ�_7f��1��?��k]�t
x#G�>�wߏk(����,z�S@���i����PK쮵�a  ˂  PK  �dtJ            "   WEB-INF/lib/jackson-core-2.2.3.jar���nM׮�l�e۶�gٶmk�e۶m۶mk/��������y�鮤*��}eVj�{dVU��4(��h�"@�Ѡ��b*Bt�r ���A��#��go��� B�O����$@LY�^��"k���[|·�kD�b�l�X���������`�M���z��X��d����,Zv8'2��]���
e��R�2�<�{>-4�<���^�ER��FE*m���#��)�υ^K\aU���"\A�w �6��V�.��f�K�3��>��gn��g�.�j>X@_1E�biE��E�y%Gˊ(c@*m�Bz|��Ι��g;J�B.>��Y��
CV�!RH�r�q��d�2f�ix�B�|��?��,2~e����{����3�y�V�(����;��>�<��s��߬�M�D�3&���-.y����b����k��㚧{���x���2Lx@387%ZZ�1⟬P��k�I{�
�5�^�hW���؂_^t�-����N[�ƀ�z����pQDm)�q��o�}���0�� ��;{/T&/_�o,������E�,�۲��w�h�^nk�B��2hHq�,6������=8�ۄS<��.��
����BKw��7Vs)
q
*y�E��
#X�h�0W�T����,uڕ�1��O�p���i�J�L�V��z��6)�Ҡ�Y����k�������]��)�F*䶕2y2ة����M
܈#�mnvO<�yb{cP$O����;h~�8�;�7����#�}����$>�G�{Ꟁo���#��"��XÌ�$G�]XXy$�4~�}K�V�����i��w��$�a�{0S�	�������k���n벧��SD  ��.��W[���5`
uF�"GX_����si�
?bٔ�X�m������ �����}Vt��?��a�L��7O�'���
xWX�:64��1�����EU�E���<�v����E�� �K��B�}����9(w���r�L&����6�9<B�j8�Q��\]7�#z6G�,V����zD0�T8T��/���b�Z�����.�n�Y��pr���zyz�Zlm�+�M�D��e���JE�U�U�Z1��ȓK��4��,�h��A&eVYST
�R�
[�+���������	\�;gk��*�	�S���clD�o0-����ꥒ�-鴔=�<�vP\�B��^��L��&��G+��Ԕ=+.�N)��|��T/8VN6�$�	P8$��68����p���5�a ��x(bES���7"��9o���*��ʽb��Or�X@5�Byh�L���f��{���Sr�"��Jy,}�
�uCySf�ʝ�V%1�gmA��H�JG��b壩%_P(�
<�B�������H��w��[jڇV��c)9�H?}rM�-��SL4��|*���\f�/���ݥY��%�6�UU���~����z��B�w���IT*�6��W�!�'C���9QA���]e�b�q��T�i|�@Ǎ/'��w+�ݒZ��rnԃ_��^,D連��C��
�o?��5&Ɲ��5��,ݯ���sG��|��Y,�Z�i���Tg��I�q���e����^�l�m�Vj�L�Ves�b�m�����p6��嬣<��D���?TH�D�����m��{r�hX����'�A�ĺ���/�[��ܭ�3�C�'����#E��,3#Bז�7*�!1��pC�.�/�b(��du�7��V��;j��+������Z���g���r��ڳy4dC���v�ڔi�N-�;e2��t�b�i8At�}�H/��,'"���ڲ��h��MW��5hpd=�?��Z�[���8�X�d�q<d+/8��U����W��ĳPVa�RM�:�- �D����O'���3n%�?��|�;���d�u��F��3{��{�9塦0Zk���ʃ蒘eک3��������^ߊ�mv�����Q���N���T�/Q�׭֞&"<��!���(^��/gSݯ����.[
�>�s/��֏�z�fM�0�Ք�Z]e�s�>5�*y�֪�ٰ�T�ė��5�>i�f 	������:P� ��'y2:j��BIS���"YA�:W�Vmw2�mtBI)(3���/f����ƍL��5e�8cQN�56�C�+�@�[=5��-M�
L�Z��}�*8X]��m�<�ú޴"+J�R9C0����L�H���xZ�Ql�'��S�UG�*>q�B��:/4Ԗ�h:�%��藝�M-YGT�tLnS�N�ߠ����1<S��2�1o�&�N�.��W��!�>�S�����`��4�*H|��9SJ'����Ԡ���c��^�R0�g�9����n�"Sr@��8BG��[�Qbv����
���@$ۧ��4W7��NQA�L�<��|�>���m�`f�p3�臘�Lj��D�Ms1s�?;bV��GJ��_��y����>ى.�����C�/�>�;"Q.*��(�u��쬌e�7*�z?>�2�O�`�|l�}�63��3j�H�3��q����]j^�x��Q/�﯂M�4�Ah�����֦��w`��)2��(�wG�+oGv+1�73��Y{����--M�͕Z�7b�������L�xcdɘ���T�d�?LS��jG���!��|�<�����>������95=|˜ص�>�{��>DU's�:�`�Alw�˱���
zm֬��l@�H܁kɐ2���O~6D�����9Gw�������[�s�G<�v�s��J��*t~� �k9�}�����a1MS�g���A`l:��k��F˛x�J��D�>C�L�,ʟ:�$Ș-�7�Xp����'Z$l�|LC:�uN�S�;W��]!����5�N�~�7�΄�|K5�F��-��ʂX�� �����N��1x �M��_ٛ����R�}��q�`�g�d�8Db:Қ��&
��I�����pk#�M�����S3DĀ#��ȿE�1���*|x+�X��
��J'�s�<G�Y�-���{�F���K�P������~$����O��������� ~�+x�7z�w���@���:��&NP7�
G��b��I!����[JS��Þ���Z;<I��lD���C�����	.���߻�����M�Q����Ai��W�c���1h�9
_����)< A!��� �3*�
o�S�C6wm�܊R[6�+uq���X�zj�,�I���&���7��AC?aX����C�mX΁G����������S>�I%�W�;Q@h�i;���uS���ǎ�=Z��[��R�u������*��f͟"aw	M����C�/C����q�o�8`.����7��P^���TBI����ݻ���a�69��7��g�ry1g�Ϩ�e�b�T���V*����VIs��X�CG&W|}b@~�p�T.w���q���5@mq�rH"Z���)��D�$'̫tF�d���xING^j�b	c��0��5��v,!&�I!e��Jw�	��DAM97t������{	{.-*k��lڬL;w����}����Q�t�i#�=eʹ; F2�ݭqd�iA�s�����$��q�p�J��n��ؚC���b+����R��*�L\�=x8�����nbU]�PR3`+�(�1��2�T4m�ޕfD=W0�@�j,bA<3?=��Ñ#mr}1���y.���|:���)�0`ј帓���͋�m�{u�$��׷��A	
~э>�=ݣ��oZi��C3X��
`�\%g
[F�GGmOF/]߯��>��F�_r��?�^���f�/�)Z��~�z��#xz��*�{�����G�����S�*8ؗ�`���}o��(~b5��N�٣q,�f��
�i :������P�(H�J�����M����8�n�{yUpUgRs�
�Y�2�jY��<��PaE�Ce7�G�		Y�Ïȧ.�b�L��]�'�Mq��54�zTn����;�%V�q5W��z� �k�"߬ba��ߏ�6�³��RDն��6?��ҾB��Q\��<�2���DS���������'Z6��g�v@l$=��W�G��n�x+� ;��73�u
F�����ќ��F�fh� �Wb�`���E���:'�ꀟ�.5E�1�dWL�%e����09��T����a ���������K"w�::>s`�u��9���?���p��S�n	�R�����aC�3"4���."|�t\')D$/Ƈfry�r�#Ղ���q��_��4��K���\�ќ��\���ݗ��H�^�9�M���W?�3�y�#��#wQQ.
ኀ$rZ�'�B�ڻ�]�v�I�?�Έ�d@
x���
�Ä���	DnC+�fD�	���aY'-3M4D�	6cOi,��Ǥ��kƴ�bF8�B�5#d�^ubr��J2�?��eF��V�c��@Trd���R���J��� /-^�O���K�(�Ɇ)Bd3ɼ���Ȇ:3����jC�D�O����9�p2�(�Y�-������f�
~��4@��%�֐Ef̈<���2>#0��M��|�����L`�A ��"L��2��y������P>��&���V�|��of؈�1����,m*.)�&j��/e��X������iӓō����U׋[��#J��k|ke��!m�"l~������g��W��=�?�0*��ˎ�|�E��5ْ/�Br"��N>��QȪӋ8U�t�B�����x.k`�AR�m�	�~�� UN%ђ�*i"���^��͔�6m��]�j���+_K
ْ��p,L3�(}�8L��	�m~����\��*�*xm�"R����{�n� L�Kcm�r��y���Ϥ����[%9�O}��p���)	����?̨"������	�nD�#r��2��ֻ���:�TX�8��ڇ(�ĳ>؀��U�2�0���8�Z��l�(�:���� V;���#�D��gS�Z�)���� 5��7���Y�~df`}G8�n���'��
�Y`;!.�<�����Bڎ�XX�J|��RQ�,YP���ͣo0�����0op�92*A ��7A�D�j<CL0Cܐ^�
�{�b�b!ٯC����
�J��	*X}&w��N�A
C�3�и�C�6�T���$EHC�,���%GP�H/S�M:������MB1�ߓx�h3�F߼�fĩҔ�����ȌB�N�R<Ĵ� ���U=D����@�I�1��'��,)ض��b�@�c�6
�h�mt���
�01
ͧ�0��54��Ո7E�mæ��J�T�e5�*��+��|U��
�1�ϸ��|UPFu�~�b�d�:�u(��ߜ��@���A<I�u�� �I�L�1햕u&̤�9!_���i]�Y��	����>����tsC]zy����2�#����H�t�P���+Z��I�}%:�$�x�����c��On�<Ds*�>lSj�\'��1v'Q5�*�K�n�b����$�C���[�D�:�Ґe��%�d���U7���D��R��$o�\�<��~/�g�h'VJ�>�c!�b^��	�?��FO�y�UQOO�T;MY
g+7�Ŧ;rm�B|��A�b6����$��&���M麺��A$�$�-S�;�,Kƺ2j�يQ:�ǘxP�mG�[5�Y��Hy"�"�QѴ^�����o����A�#�p!(!3�*^�VP�y�hzg�,B���i�0��#Vb�f#�Y���B��$'��-��M�G�# L�fܨ�Oi� �
#���WO�ǉ����h,���V�g��`YJ�`a�?ڳ�59H)&28uR�^$��[ 6)
9���'�_m+ʨ.Z�_��X ��� �ͪ �S |
��06�����Ώx~K|4 �Q�^2 o�����:�f�A�ѹvU}�|�������o*��T�ր ��q��T�Z�Y������I��(����Tŋ8J���B����A@�=�M���$x�1������X��-
�Ds���{*D���!_��[�V,�ȯ�NyR�J?��g�w݁e�G5�����gX���~���1O10O �9��L�B#���$J�jϖiNW�T�ɶ�E߆T�r�Hv�����^��Y�
���b�5*u��1ak�;PT5��eפy��ѝ���]�S/Q���x��bTuT���ľЕ�nbIUV t\��]��)ח�&�Ӭ��[��d$���K���	K�P��`�n��3��Tˬ/�#�L7[��R<S�i[5o�L��4�ӐҊ�D_h��+E�h���
}��d���Y]y�b
y@�WZ���u+��~ܛ_��l!�բ�ؙ�5%	̦q����'��{()P��ki;u�T�]�@��4�	�%(h�?��C���hu���etfj�M,�v����ҍ2�"�a�Z��`مJ�ǋ�"�?`�|����Nc)��Ӑ��0N(���f9B�o8��?�&���o�q�ntr�����o@�^pΈ�l�E�,�S��c�6��l���m���m}0k��Ӿ�n�X_Q@n�c������H����e9x$鍡���c��S��C�B�=�A�">�v�޼!�G*�r�S⥉�BSĿ�� �V���9���os�xE��D 2w��w$�>ԛ�$���c������qVs�������]�
|�{��@C��n�~��~���	%�u��R �5?�ݺ}u����9�	 ���� ����"`yC!��8�M���d������W�G�,�i�����9%#w��%(���E��9�Z�)�f=��E���#C�J��#�7\�C�K�%d�=Jx@J�y5�!�H�Z�l��yH���"��|����\�kR�p<g��)w�:�֮B�:u�.���!�d��$ɲ��j��$\�V�C �*��������U')M���xɚ�Z�>
H��PS?n3��6���~�sxWvD34��/\/gR%PIrl���r�Y^G�ݸɶ��>��jVR�7��~�]�v��Y:�;��t�Ig�7��Z�5��Hv!
e���0�����@`z�
�Q�C7�3��tdn
Q��JI8��Nc,%^�eQ��R�y����mj�q��a�*կ����$�Y�;�>��1U#ωT3�d��N�E-ٌ�k�ީH(��7OEvJ��;ٯU���w��h�T1l�J!)EOs�	�.1��@L���$-���nv�����7+y���Ȭ:L�ު�ǩ�ZE�'Xr�#<͘!���(c-�^N���S��rZ2d�&�)�f˝���H����l:�
hP��H�n��]ZɌ; `͛e���3%(�"�e�MQ��Y�T�L�d���%���Ы7��U�"]�RY����"�\]y�J���K�C&Z�H�;&1V�
q�`�;�U�'��)��P�v�����.C�Mv�HѠ���l��23v��n(�H8TRR@<�GA����xr�0T����wW�CuHJ��!:RxKmx��d�a�_J�v&�����g>���C���;'��SI�>�B�"�\f:KAuSz�S̭ �*��s�A��Sӊ�DvĒw�:���v@�ؽ���<��8n�t��t���>U�H��ԟ��b�~��Ο�}�D�j��I��py� yb����Ǭ3z�tn�J������DE�9жa�gBH��?�>Pn�������霖��<�M3]
s[���9�~q9�&!�j6�Y�+�4��Ft��0������U�Et������P��!�YN-�s �c1��!�������P'2�F� �E@ѢM�^�~��ڌþM~N�T��*��i�@Fp�p��'!?ⅉ7	� �G4��	]5���E���b����]�ߝ�*W<�d��ԇ�iGI^�ŵ��� �0��`ў�Җ��=��YYjd�h�=SbnqeJ	�7��3�]�_Ա��X#��U�(�-���vk���'�G�K��4��,ϞP��d?���U�%����Z��2<K��(q鳑E۩B;�]m�ȹ��5�&In8q��IPaKk��E�B,+a�I�0���M����H�T�(�N���*A�yC8lS�//B�#�ly�&��b�TA�-�cNvM�X:Ã�_�����}�QK�f��)3��t�:�)�b��f�3�.�F�v��O��`R�hv�)���R����2S���S���g0��Q;��-�i����Jo9��]߂�\�C#{�j!u�FqN���r�S��DQU:���b�x�:�3�W�"p�������&{�j1�c�K/w�\[m*ʹ�IXm�WDKh/��-~��m��TW�Dm�B��Z�B���l��ř��Y�ݩ�� +'2>���Q�B{[sfo�g�~��˛�`�K�n[�X�ON��.��Ζ���C,� *��QP�?��Y��������h$�a��:���Z0kf����_����k��Ь���~�r����\� ��j����(�^	gA���8٤^ k�R�G��Q�&9�
�.�C���U�}�#}��n�<��b��������<�Xx��͆�]��X�{���8Rs�u�'��aqT�<_엄����W�T��N�{�2d�ҟ�,'� )�&R"�����h��!���!_������e�07,xW�L��u�;*����pp��Q�m"���ea3nx��מ�C����]x��|�放
RQ�U26uq|���gg�\R]%�Ue���
m�����؋,-ėd=k��b�E�p2��?/���%�v��	s�(�_�ɾ2��+����pҙ���?�]0������Z	r���SN���p� 5��]������ٛS����`O�c��/�-��d &�h���,��!�ʴ<�`�fyZ���Ҭ�/��d���=�~�>6y0�dj=	d��+H8X�H<�PE�.�R�����n�WC_�4��`T6 
N��OG���~yw?GfݠӏǺ��9���E�B��`C���x��5N��	�p����?D��Eg��aPtL�
p!j�(獆�����]fzO�S0��Q��[���N x�"�]*}v�;u�q	p\�O ++×���������f�� � ���N\��4���������+J4�}PNZ~�6v2&�$����OE��E�N�H,��,��`&�����DE4k�X)ZaWA�I�JQV�j����[�lj]����Z{�{�Г��07m̘\ނ9��>�r�����q����P�Eڏڦ���A����t�G�.��c�b,?��Q D�G���:U9Q���wf>Z����ow�C �Ci�R�g��g��~K�^b�@��l�'~��Fؗ�E��C��S�o��+:�z��C���<��~�+?��>$��<�d�;}�BW��BW�.>D���7�S��* X�^��lel 1�GǆW<X��ϿC�'F�]Ŋ0!��@ӚoB���E(4�:�?(<V��Ʀ5���@
�wDK���P��\a��i/�Y��[t��;��Pݢ��f_G�l�#ZH`o��̜6��R����!Y�վh��$��b���F���T�����	Z�JcM����5
ɷ����U��V�us E�"U~�ƍ�@�Q�!gx�c+Ґ��>۰!��(��XȆr�j!�e]3S��8��A���B�+��o��F&=j��,o*l����,y8gae��Y7C'�q8#c��m�{P7Sl�ٵr)成JK�b3�I5`�5��SwJ�nrP+���_w�>T�a�v���dX�6�/Z��A�w�������>��_�#m��5<kB�ڂ,I�����PJ�ů���
H�kh��jY�J��^�
e-N�ki�$�cҘ��~�$*5Ō�>��u7�AMlx��9�R��?k��6-_U{�R#^�U'l�զ?��0�#L}�tn!J,�֡�qae�xX���DZ^,�36va���It���Յt�Ol��_	Q�7 X���Ų��L��3��6�?�kw�_r��_��(�r���_�y�_��P�}V��7}�����k����!V�mVo�_ma}��P�X��`�c��'2k��b���Ҕ�]>�_�����w1!�t`�7���������r��W�z���|&v�G.�]�����ia���?���(��n���Y����:�||}@i\C�{=b��z���l�a0:ǳ��sO�tl�ƭ��p�Z"��M���Ȼ|B�������tG������J�t�m�R�&jh)��v_{����G+j
M�]���P�gY̢�ݰ.���7)ƀ�S{��<�dwg�gj�j	��Wk�c�s��&���C*8��F����L�,?����$�Ʃ��۠���lF��"��ix�J�
"��8��X��4�ZX�]��ۣ�>��BBTiz����W1�"�{�����,��� ˟w�&AvK��c��+g.��p����y)�yٔR���J��G,u	�&\��Q�/�^�3�k�ٝ��f���.�7��:{����ǎ
�P�V�>(�7bӝ��~w���4�D��m���:'�����@ӑo;4�u��ۖ�td��?��勷_D���	=;�� ���eq�<V�'�D��d��W��ϗ+��Opvd�	�A��:{�H�?J%�|b�)��cf��A"ybP�
����8;�m��T�Nn΋���ƕ��~��B�C;��`����Q?����Id����a�؋҃hlr��O�"7s�L[�D����Osߢ�3�pF�rń�`�z���x|
b����SΕ�1��剼���Wx�5��la��:5��u�^�RϬ4��-k���x`�r4뎬��j�_��?�D}b!�
[z�ۂgL��|2�����s<������)@��A�:'�������k���y�Rz�;w��;A����3��_������_�z��F���;`���-�����/�?$�¾uڈ��<.�S��"%�L
.��͢���B��#Y���&ڬ�HA"�ߢ��K�y���*���J��f+�4S������k��d��H6�&]w^a��E����UO����f��WEC���'R=��=�t�����4�''z��L�� ~�)`!�c���	ޞozZmWm��Q�\�"(Uv�0��P�5Z�(�j�s$���e�d��C�T	
"�`)	MG
e�_Y{�F;�)-e�s��$�`z�jU`�C��J4�?�W��x��R$���
;��qĲrt7���äf�ʢ��(�KW��S�'c��E-y�Qp< ���<p0NQ�B{��Qýq0����]f��8��WP^���	��C��c�5��j���TJl1�Y���tI9P�d�Z��^��]>�d�8��I���a@��X@wnx� ʐ��֙6IK�5��TW[iq��\c�]�s~�^m�����0��xk��H�o���Q��g���Q
�Q5]ْ��Вۣ6�վ<´����ɶ��}�c���
���jW]G]��18n� >{�m�?�*��t��v;���6pW����!\
�@|9(�I��h��b8,�����`����h�#��Oc��.i��f9C
[�%�@��5�%��ٲ�2K$�(y�T�0�bAT�kh�INʂ����ɞtE�j��6l�#��`h������r�"�7� �&~o!&9l���D�D��L\�X1�����:��A(�-�����%9ɬ�G�+�9��o�($�1X ����E ��,-�Z�&5�Y�Sz����� ى&QR,
Q�7�6����ʙL�ݔ�@fNvD�B$(�@��Ȁ���W����}��b��;���o��N�I �q��`���<F(匠����g�rW�}G��6���\k?^���I=\a|����
ɍ|����� ��X��\�Ρv0(���99�t�,= �	[-V��R��:�3S̥b~���w�OIO�6\g�� �Y8�˖p�Mf�:�c�ge�e�٦�QǄ7k����{C#m�%~�OKv���8�g	�s��zF��L{oy�f��3/��ar�+�K@��JՈ���?H���jwk!M��-�X�>�A�YR����y���H��Ҁ}���'�=��Q���V��d��\��e��l�F�5Z�὏�=�k��I`�4�$gH��*]����$�-)�h���\�=g�tӪ�T���V�@N�Y��M�Ģ;(3,f�1P��[e���ԙw@Df��ݛh�/���%��L���5j_/��}�];��u���'o��=X=F_�y�{:���.N,R֨����'pd���}�yp竘���C٦6��Gu���A&_����Z�,|�%��Q�>r�ٷ�\H���t�z,Ox�������::^{�ܩ~�GL{"�լ�ܗT��ʣ#��#uY�*���̠S�V�0,sI?�T����[\·tCP?�qut��O���� �kR��
Kb�����y�Mzͩ3�#�7`N8�R����~�+�+���͉�O���=dnb4?[;iA��l�)�B�W�P��'�J�^��P����=H�D8!��L��
��,�je��R3C��e��W��$y�9�yawA���d3�Au	�R�ȟjÇ�#~��Wb���MҒ��&�~:��j|�����=�J�EK�?F I;WAccSgg{'e��D�Ui{lU��Z^�ᜧDt�L@-��pB@(��aI��SQܠE��	�$��ꌫ�F �u�a���.�
I�PR$�H���ȫ�5�H�Y�׷�[�3G���)� B�d��8��ȶ���an���D���Q#y��:J_�������	�L�!���Ұ*Fd��d����Ǹʎ�n嚉�'�&&*m͚���\�s3�}�ot�ŧ�q�sسfe�y�ʤ���$�4.�1���:F�E�M�23�8^�������R�$.�ų��Ev����k]�����y���&-yi{M7�T��xC1����J� ������ȌY�N�/Ք5�����S5&�2���j%�$��\���测��.=]EsQ��=Q�̀����i�E=s���R���b����<S�)*�����4S/�k�*�+�
c�UEȺ\I�EÜ.cU�p�\z#�@��䌼y�.R����l9�0���65*t�a0�2z:,ә.�Q�ʹ�Fv5:,8�X�z��@�v�qƀ�����
���.ؙH�����B���c>A�~d�H�_2r�q�@�Ϯ�9��˹�m
�?��}?��݈���A���Qi���/ӡM����d�*%A��{]a��3�!�#|���0��ъ��'����/G[��yE���6��
� �������\-_�r������&��_���D��8�#�L�f@δ� �p�9HD���d=0�EN����O/f�;����3H��~�����(��!��'>��x��NyK���D���6��-������>57w[x�V�{���!`�������Go�;��E8^�sH�  ���7���5�
�`�^&���Y�f¬� �Z3m�8�nT^�9�7�)&���D"�@K&�O�0�3S�1��j���gͫ:گ	��r��.lڸ����Z�Pg���"�����GB7N�/��;���f�?V�?������Q�G�������0B
������Px��8�� �����Qg�>Y���GBBp�G�?z���b�F�@��T�y��C�j�I�6V�Ϫ^�*�aR����RV�f��b�̪�Ȧ[[��Ƣ�3�Pi�aiS����0���X�#B v*H�^c}�������pEF��_d�o��,��cA�����X[�X��]���IIHڦP���YՊVv�nWBj��Y��r}ֆ
�cX�<|�ʐ6�
�
��	�����sY��M���$���=��H�ɤ�}we:���nv���(������9���AaoF�k���n3<��zm��c7c����1g���ߗ��{r�ӗ��C�{�x�0Vv{%�Gg��S��$;��9�$?�
�}S��H�#�?~X����G�i#q�Yj4�-��r�Zn�-*6�%���OP+�Q\\}��nB\\�
Ǘ1�: ��1(bt�D���,r���̲��;tJ�I�B��E� X�[l�0t24�gR������_{��J��H�(�K��;J[T#j�-~���YO#�l��M)A���|醘��n�nk}Ry6�q���]Hb�g:��t������T�1@�G)a�'�۝�^�G�aC9�u`�m[��w�$�u���S�����D1#f�a�QV�Z���X�PEjҝF΢[�
}�nr
?���T֙[�#ڟ4��ڳ0r��u#�?���g^��P���t����aDsU�T�1����U#����Ce��Y�j��{�Qo�!?̧X<w>�^s�^�����o,�z���0�%��"�4�lW��⋈Jl�M~�	ܤ�Rܧ7��[U��,*(L�f����+l��sf#Ƣ�����d&�Ƴ��o�NN)��'�9�vCb�pE]Jo&�0R:R|���|t+��5���MѨ�蟔C��v�+��(P�u!0jf�?w�8z��|���@�{I��F��LQ�����N,�dũF����h�`�ǐ�q�	%����%��}�̺�O������58��l���1T)��]�H�[����8�)J� �?����[*��ǩ\Umm��1���j����9�6/6K!���8.���"��.6�,�Z������p���6�4�"�X��b�j$d � �[�B Je���
��EqO8��2;+\�{�|�g=g?�f�~ ̌WhĂS9�{�����Q~�ӎS}0����=�(7�;�Z�T)`Yq
S�9*��9����#���ࠗ��r;��9H��Ҩ9=���u��Jyti5c2V���L��<����~�����U��Ԉ�3%#�i�U��n��� �l}���ͺg��9.�zL��Δ���NL����q-[Z�:�H�nWz)����-˝aGεH�q5u����O����Y��������Dv�e7�N&��q sK	Ӝ ��`K&w��D���1�u�0 4�:
�E�-���RD�̋���<�$bO�����&�҂�tW4�R}")�E>�a��q�k�l��-S�ǝH5��;��i����!L��K����o�nX�T�V���"��R� "ƒ�AJ
c	A8=�l`�#�Zϔ��2�궽�az���Ӡ���*c��+��d�9����$!e�ȝ��ς#��v9��r�ߟ82&N��i�4
���;��t���Z´�=��zG���gԞՁ���G�<�^-0�D�5!.i����)	�NǢD��B^S�M"b�B��{䍶��Jq:�9}�Dz`�^�	~/W
:�w�!��P���U~B$��i�Ѫ�p���,���q�7[��C;�Qr���Or�V����-K�O5a���־��b���C�lOGN$�9R
�P��^�^0=�P\ߣ��}*�G�0=2�ER��<��g�F���څ� ����Sy�s��운}J�Ժb�~�7o�Fo���}�8���7�<Q��ȋ�����#y����(?�!���W����A5Brkh�k����xC���
Cu>]w�`%���<+������˳BG�кk�M�n���K�Gf�^C�y�|�5�� z���սv��]�q�{a����(M
Wo:��ף�?�^K��J���
	��$�V݁��n�5��1��� �F
����Q��es�~s�����,��A��䎤����顠;���#3�����9�#�����s�h����9��������%��+Ь�,M�ss���􆝛��Z�؉.� � ��t��_;�5{ ��þ�����i*�L��S���4%5$�6א��g���xP�ʸ�z8�F�E��[e�5�lR*C��C����$�D��:�?��3}��������>-�F��d����b��w%@����`A��A&��I(?�$��0�CDb��'�X�S�����p%�va������be����

]	Q�w���9+����=�3��n�X%t��Z�C�R���E��Ns�����`�Cf=k0���>�w42���dC���[�nh8*^U)��J�:!S��S�$�JI���O� ���8]��F(q��+�n���r+E����?��F���?���Bh$���\L=����TmdU���-6�,;�bP�|RY��L�v��0imV�?K,����[�^�#������|��*��Ɏ8�G�i�So��>������vIf��`z��/�{�9�}�i�ǋ� �c�p�"��jY�vv��hvv'd�3���0��-ħ���RÌ�@E>l���H���ew�m��)���3!�P9��d6u�q4F��7� �Ijd�ь�����K$'�����9X&7� S��S4��-6�U�v
,%�z��D��̼�ؼ{�I�����,���z!��6w���x>��.A��Z��җ�5��41�g}l����H�Ai6�j��،���>�#�Z�l[��C
���-vz4�Z����R�n���[_�fZ��)��
�� �v�,Vǰ�ca{���_�t�q5��2��9���_M;��l�r�����6�w�bB��H�S���`c��l��֘+XrGK�?jr����%ڊ�n`8��#q+ �_6��.�e1J�P�NR�u���^�o�����s������p�a'o]ͼ�a�b��)x�a��r�6j7�X���]�m+,�w��$]�]����F��({��T���p/��=gpg��6c���@n9S` �7��8*�|x�B�r+X��Q>�����B�+�����O��юS����ׄ�G<0}�����CD�
q�>@%�&���H�uy�B޳�g��3�
°�H�t��x#���HB�.Ŵ�ayɊb�B�G8e����^䌦Ba掭�.�C��D�sg�n�~��s���{��8�_�.�/q.�u�����45t?�9�_�������َ��M�,��u���m
<p(��69���!<��b�à���|�����dN}P���y}hٲr+�ZLΊ=6��&7�D�'g���������������\�>��S�Sޞ#��;~6V�}�
`	�t�$Ċ�
��W:xo߉�J�̽x)���j�n���<�e�<�s����8{���Q�w����|r��������lis�}�]�3H���j�����D���;UE�ւߙ��st�	��9������e��M`�#��iP��׌��i�|Ԑ��T[a�*R�SA�����y�8$�Oޯ�V�a��N�* im�Tci^QS�� ������D�FE�CB�[�c��&*��xO�h-
�����eB����#�[�E��٧���u_A'��q�qњ�6�I�r
��2��D�`^u{?Vô��V�g'2h,�L/*)W�`;P-a�Fs��k�8Wե�XdM͓�ց��㰤n�)���?�jk2QR-��
�э��7u�XRb T̈́�	
C���[��w�/5&-���i�Ū���ܵ������c���6�
�z�*�I!��M���᭡r��0�g�}�y�
��)����K�̙��rE�v[c��m<8�7N��k1DW΁E3�g�q5o�'gRwܪ:??LB�AG"�u�އB-���k/$N@�Po�2 �=
>��0��όL0����t%wT=z��]!4��\��3F:�>��/�W���g���
�� �M�Bs���D�M���P'	z&�]J�EW�Ӯd�����,Y@�B���
w���hM��w���Ww3�!8I�VK�`�E�mC@4�D���`^��Ufz�o�9PElَܲ�ԣ��!H ��u$*�]�	/�Y_ �>��U�X�X��?V���
/{b�'�� kr}�}C�&�����\�[�o����\o��h��O
�4�M|��w��.?7u��]�=�9�f�޸���
bo|��J�.k���Q���PPl-�L�C�倾�n�����P��4v��d;���f�ꥴ+���KlW��:x3F��|5��)Tejj�B9PD�(Y��P��c� &Nf��C陗�2�]��ܩ�I�\�I}�w
�z�J�n���<&�M\j*=0��a��C�t['=��H�K�ɗz(��@7�H� u?I#��q��/��ɸc29��dT�(���d�md�J	͒�D��㳤��w���8L���!��O�i*�e ��"�A���`XE�\�(>7��']����j=��\b�o6Y.�J�chYx�ٶ�Qy��}s�Zt�-�}�6W�܅��-x2 ��Ћ�E/ Hs����^n�L�i���=M(�)_�1tի�Z+��IbC�<�eo���C�(5��0}��XI���:�т.�t�1=��4%�hS}9|�d�.u8�o8-w�J\h= ۼ�
i�4���3�:��н��$*yoj3Ʊ.Y�y�N����v����|�ġ$7�m�ߠ�t�U��D��D�q�WN�θ��
7S~ɕ��(�QL�#�2���Ɨ��1B~�ҡW�i_�v>3�ƕ�d=.�7
T��S�Pp�n�����{����1�ƚ�#������ŜM�{���KΖ1[��k���Fh��di?�S?�CU|��!K�f���_�0	ޠ��DP��K��G3���43��O{��������	�E0�P݀�4��_yA
V��L�êvd�3�od�R1�����s��-
��
�3���g��5��}.�v����
�V��@z�_�E�Y���q����OĖ����Q�� �X9-�����{�on{���Z>� �8�" ���ىU��zl.`�v��@�Rw,�=J<p�!�e����|�޾q�¿���>0-��|#����G��1+s�!�lB���Ԃlc�s`�˜�����8�������4�ė_�}�W��P�$��Q|�K�~A��T�i��2�����؋���~�<�3�8i*)21'���L�g���.�#��#C�@8�m��*�3��,��y��5+i�R&�=���'t'��fV<���<���]���`z��kĈdV�_  1�9~c��z����,A�Ф^�ףv�
wD�a5a�CR^��R���d,`9�EZ^����5�I}i��Aٴ�F�"�$`|Cw41�5#�5͉W�V�^��ɴ��Ϧ��B�u�`v�x[�ś�QϏ"�A�"�+��EVQ�yy*��1�j�LV(�kq�J4�۴Q�
i�Ϥڶn�yL�1o��G<��{���~7�&O*��G��K\�x\m�~�e��fu�'vv��imj��*�N��gOv��q	;����S��w�~��S�=�C`�벟�&���?���+��?��m��?/���������w��}�fe����+���e8"�î�>����n�*��$�Q�:��tΡ���=KsPr���Us	5c!^�H�U̈́N*�T�J2,S /��q���`��Z<��l���o�´x���K�	�G�I������7� 7ٕ��G ���T��Y_����~�O[�%,���S ����$Tȑ�ʠ
�����Yr�lM�9���n�
)߾�V!li
��e;up��e<y!�9���x� ������$l�#K$(�:oW��y�t�K����'�̙p߾hʝ	,�T"5v"56"5��mI�S�M�H�C#)�b� >�ql�a��$�k��rNL����
%i�/?����G�H��n4��$��St6Q$�t������2�ME�5���G)O#X,�˛+�����y�e%����(�t7HT�#��{���-��9�w@����ϧ�� ªC
�趩���M��vD_�E��Yc��nK��������
15z!��^��㳺sU��׭o��-��1�4�b+�4�v�~*�[����W�9"�|�\�9�^1w�?1���s@|�����TZ@ؼjC�l88al�A������D�F��A�|Ǻ�F?I�p#j��I�dH�i"2>;$rG9($rT��P9tu#�Qs�'�HU=�<��2Ъ�ޣ�j�{��}��݃�ݦ���
��� i~�MU�!�y���9w��Ԣa��h3f��rG������f?��%PI�fQ��������$��1Či�\i�D��|�(�S�\7W1�,%�ҹ|�-FC�}t���	�B�2�1t���!`g����:�n���g�l����߼Z������xQ#f�s��1�B�=5��ϲN�����d���u��-b״�0�ƚKE��`���`�S{� ����`ڄ�D��iRW�a<�� �㓤����K,��z��`tX�y�����X�C>��*�p�zd��� ͺSG=�IBӾVm�q�?���Ė���7H�fO�ߎ��G��G�}gԙ�h�>��8��D0�)�x�t�Q�}p�:��b�)����[��T3�)n����\���m���}	m=B��
TI�`>uJ�M̸�*:�c�Q�:�h��dS@0.&�gZf}�:�w����0r�h�mbh��z���|^>H�:��D@k��O�ZӋɔ��
��aMֈvE
���Ug7�7�>��q^I�'�:�By��mqQ���i&��c�
�ڎy�T��s�ǯri�ǩ;�J:��e��)}���ӲѸKa�3K���Pw����Sz�Kt�s�(�B<�L�#��{x8ݨ&��x���������{��^��H��3]Q�a?5�W��(|�7��7�m��K��ِu�4�X�}�o�x����?P+��Dz�����u���	�.�iX 5S��������1Ýsf�B� �w  ����s���#ӍE�	[a zf�x��J=��	�~�f��/��
�6[i���g���!ץ�U��"5xa���ˏ�Ks@��\��������PE$\�eYQ��6�LlwVۇ+���%�j��%�>G�'�#��?E�Ծ���8i�' |%�[ӽ�Uj3��U�a������Vx�ѥv�+�Rm�|n�]�7eE#&/�э����V��gj꿂W-�9nE}G�#��ͬ���^T�jW��r�����������l]�g��)��� ����]�(�ͭ�GH�6iR��G̯/<�[�K >�B.Ԅ��{Z_.�/�����
S��Xn�tp?�.̐�#��%t궷2����޳lh�9����O���ī枀K�x�J��H;��ѵ�[]�i�!�+)N�NL���7�7	�7�7~��������R��~���C���?�EyZ�q�`��{[aP[a!C�PbÔy(�9��ŋ��ۀ�}R�v��j�{2{Cr"l�t���b#��ӗ�A/p���ޘ�|���ӥu:��L��H�}�5���RT���,�q2�Y8
%�Cs���h�$r����lni���d���?N��҆�j�چ�#'\�����џ��!���r����(�.<���|s��UmT�đߗ�'���hO�/��*�9���F?�.�¨���(��3ڿ��ŵ�����p���$<�u�j���;�u�[����r,��jk�հϖ\�=#�~��Ҡ)���V��ǬuO���*Q�}�4Т�f�>��k�22
�i�LX�ik�9�(�0o�kK��Wz2U2Ux�Q�0�C���0��enp����բ �����l	m��>�\������p4o�g��c�v�c�Q6\��ԁ]n��.W���|@T�
`<����fM��=�!'���sJ��u��=��R��
�q@�m�t���`�gJ�b���;N㖬Јc�S��cy��:���W�.kGLrG�fM���/7�:a���D�6�ƽ?t���ٱ�p4{(%	r�T|Gj{D|���&��t�)������<���d�n��Q���<t��E~�7��:�.N�d.pC]R�^)w��Zyh��x5"�2��w�H��~'Jӹ:	�vF��՟"�󅹐�Po6cN~{�&���WJ�=���������������x)0�_!;VR�M�o*��ը��VCR�����96I�[2c��/�<�x _�+�H@}}�1��������
�Ԩ��@K0.l'\���Xw�l�r�M�Hf�jP��`��a<ݰ<G�?�ܚ��`�EE��:����ؗ�)60�w�J6W����.b�,�N�٦����_]q�;B9f=Cv�g|���yӮo�'�)E6�6#�pv �ğ4��x1��w)�j��=ږ#J�%U��ƁP����)��U�A���|naN�^�+~c����T���ױ����E��S�sH�!1��k^�k�|f�Q�/� �@ҋ����|�]��eML�YT�Sd�
�Ys2k���>�$���:�z�6�4jY���oY6�3Y^��Ϝ����ͦ��sQ���-t(��=hH�&��/�H}ac����.�/2}M��a3�d{p;i�Z��qKDE7�y���1�3&������u�{u/�+�̉(y�����IȢ�F3 5Dć C���"���3w��f�A�A燃Y��'��B����ڞm�^�n��7#���핼��|a�Q�Ma����
;~��Vr<�s�kr��
TT��2��gyG-��ku�BpJ�xWrPm���]�)�	x�n26n���`�s�h��e
�L�>�c<����vo��2nF���gfþ��z���0����Ĳg}��
�XQ!���VJd\�ht����*�i��a�����#�F�"*�$�](�6gKI<��9�F�d��յS��'T����d`�W���V������cL�le�*��M7�v�P[��P[��*�`ݨ�Ćt���+��+?9�
Pm&��.���sʡ�M&M�yˇ�n0fZMA�N�Y���L�7:`�E����=9�躆Tكu�<���d����	ˁ!C�l�ʑ���O���*�e+=���P�J�YT�͇�bZa�b�0���ZQ���n�W-r�(om�ݗ�O���tݠ��C^J���O}%s��t8:l��b\fT~������M.nhn�)���QRߎ0�B�6�3FZ Y����}�n79Q�.2�j��%Eh��X��F�-�c�3��蛢�������9
��q�)�c�� 
��?ػ9��K^ެmшUL�L"�Q���Y	#M�@�8-�����:{�g�{�V�p�̛/����Ӂk���5 %k�ptK��C��gct#�|s��]�>�oź�Bc�2Su�����G"��fn���2/�E5�,�X��'˄x�`���A[�����?��A�>�2����#�F�-�w>�
�D�V1���Ԩ��
��m�LO�ݷ܌�浚����a��[����`#L9�0���k2\�x�<���H�*��,Enu��+1����zK��
�Gu}�E�E����iK*�*�3�X�q�W4߁�:ss��3��:
���X@y:U�GI5R���i>Em�Q��-��xO1�;mi�)-�:�����ҩ������B�>���VqBڴ��\�k����xXD5���T�aVB^&:�*�lX�e:?�����!�2W���Z�ݝ�x�%�[�.vn�u����󄪼�)k쪦̉%��2���r�۠�� >���M���0��c��T��Q'�������Al��,s��'�3� ���(z�L,��-��g����u@09LB_�@_�Q%u�B1��Pਖ਼�
o_��r]�t�H��(d
[9���f�x�?� �]<�W��j���6}b������N�ӿ�x������5��6��w�u>b_x��z��^��˽�:���~Dg�z%w(Q>CΞ���yb��l�#F,%�����ۧ6�՞i\A��e�3�-|����������WXnҢ�Z��oF������ԭ�e�����mܸc��g
 ZۊK>1E�"�8D��C����A_*eK��nM�	UA��Ye0檉ϝ���yV2o� �ZiC�r��z]S�=��g���WsQ�Og&$�K���A�����g
~��s�����S�Aok ���P�E�zM�-��*Wu$aq��R�y��R�*��$�/8B/��-�{�&<�V=��|�*�/<�<�jۜI��bVQx�l����jC"�����Q?<ڦy��e��v�|+Y�[K3������0�TPA�'Eܰ|�ߜ����ER ]/��;�d
�A����VW}�/B��Rc͉�>���4Y�"��ra�Y���/�^��/<N>��P�+�bdI�tY��n��Wl�Q�D嚂�7F���H���B<��J�D��!��1��u�5�ppAɘ�=!����P�J�� �r(#*
(����g�d�+J�y,�YV�6�������tg2�t�
�Lj�Ez�)�څ��<�^e���3a���
������I�PR;!�k��`6�,����O��n�6�	�|w�:<lr���C*|��=7�j�l�r�RH�\ɞ|.`+�a,d� VZ��s
�I m�[)7FX�b�t�|�s�Ѯ���_ܰ��<A����G`��~6�s�pO� �S�H&����2�Y���n�8M�u����]S��#�Yp�/c�.0�8��#%�
��&�
�cp+?�i4I��� �"ad����=u�F���m�
C���(�ى�g�'G1�W��i��[7T��nW!w���Q\Ng��˯@�+0������$M�t��l��NQ���:��۪���f���)�mB��9R�J���z�'靴�	��d���)���[y��=9�#�hM��ԕ�i˧�*�<����{���S�T�N
��j�v4hF[5��1�q�\F��*��'Hv
'�d����.
7XA�}���W�4��0��ȴ���^�;�
��	��g�&=�F v�����D�ݢz��
1���a���O�Ņahb�(4�
��.y���/��E!G����T1m��L�<p�lU�mC($7��2����+��e�p�� �.Tj�M���i�lETPݠ������D�_�t����v2�vhzO�[��-�%ʡ��b�z��b�g�{�c;	�!�ɧݼ�\��|k���pI.����������03J]�oWU�,�����������S�ⅶ�E�Ͽ��5
���ƯtN_�3����7q�sr����#����GV�z6��5b�����޻�Ol;^&0�/+dR�!��*5*tҍ3��[	��;�r�1�o���}�4>���#���:�}��1Г9���%F篻D���o�S��S������>'{�[���N�J���ʤ=��q8���fe�j�~4G�j�y��s�־��i�^��D���x���mz�"�88^N�tt(��(� ��~�=R嫦
�qq�Y���H2�E�ުHˤ�E"�*��A�e�s���� ۘ��}��]e���"u��E��t��?��P�l<�z\��Ą�]v*��㖥�5]��/��V�ѣ������f��
$���`Z��%��l�l��hd�/c
a;;g'gGC{{GR��2�k����W;��nZs��Q����2=��W R�h�	��8�?f�����u� ��Y5���U8��PORV��53���α���� �,��Xǘ����X5����Pn�+���&�mF�e��k���u���c�P��#����*��=�>/�"��ӠnȒ\ q����("�B�=���+���"�����e�ȽL�ф(:�,<��
��	ٸ���U"Oy\� ��c��{V
&QvyKB@�3E] Êx�E7���7�$	)��i:�$���ic�w,�c�1l[x���M�n�/���r�x�}�����ŀ�Ƭl��%����b<���f�B7Y]ӄ�߿y�S�T;����	��*��<^�	띴����q���-�fH�D,��"L@t\,	�V�&c�?�gL��N�Q�biUi���B� M[@���1�լ��Qcsm��s�궾�j�-���Ô������d��׍Ƕ����Ѓ8�ʂ1�ʞ-EƝp.�&�K�=?��t�~(�m\d�)�F�xߠ�7�>�m��n�g�ӾT����I�g�w��ϴ��1�>pBu��`lw��Dz��R4���Rݴ�A��Jz�@_pP�$��F�,�Y�1p������0Tq���Z��#\=��L=�=�t�e;�[�o�Z�W3H��7��tN��� ���-&ff �?PH���-fM�6���!���� u�˨�r�<ڧJ�,Q��|Fm$
4��}�~�������6��%4�K�9	v9�6N$W��*�H:�*�SҞ9�H���xc+1�%�.�i�ǩ�[���	�ȁ���ޮ�Y=��怢��`K<���r���H� EmEׄ��K
�V���wt;�dN�;k3���ժ�ev�D_Ӵ�pN;��5�r��Ơ��<g߁�Ɔy������uS:X��q����Fv�[�� �گZb�����Wn�zp�Yoe���	xI���|{gC���i}*����t�:.�n�@�jy�#���\@�v����/���������	��4�'s��,Q�D���Bi�n%4}v}}cc�Z��n�\�2xA�9'VX�`�l�Ҍ�f$w��v�AU������B�v{/
�'b�l
���K�b$qV�ɱ��$�/ ��6��9e/Ap>��:���
������7�kyğ�z��7�n&���@lw�C\�[�4:b?���v��6���8~�"��yr�~�4w�Q��Svk3,�+^�c�|?��֧�������U���&Bן.`�'���j܏��Pe(�/֣���p_�L:�Sj��
��g��pyy��%�^��=�%���ӻKvP=j�^h����y�H���F�4i�P��t�@J���d���(��B�1n(ces�5�ЕHa�|��X���lC}��!�_��w�� ������A�%���W�e��S#p�<���΄�k�?����"���Y�}���:]��8e��{|8�'��4A����Pt�j5���8����&=?d3��h��3�!�q8_���������k;3�¾ij"J)n�M�S\�:4�ך0�R�����z��'�������6\ 7̹[����L���H���g$��A|)X���`.1}����]�q"6<r��N��ζVΐ��t�b�2���g �<ի[훐3����W*1+&�����LKoH[n)k�#8��������0�O+CY��ȩ{!5�O21X�P�1ÜyE��}ܼ�>�+,QW%�}�<c\~^��ՙ馐�=��=�Ĉ!�H����/Q%�Ԃ8f��=>e�D+f�\�t�V��_[%T����z��=f1��'b��3ĺ�|I���2C֪<j���k�2O�M}�ԉw]��3$�z/O� 5\;.11��ރ'�ί�㉶�fL�al�e�?)
��n	.y�z���TL(!ا��	Z�\���s��=�N������2�laWӸ����c�=I�J��N��
����۔�`Nx�'�郍8�{���8g�%�D�?���SH��3���₀W���J�!z��?��V����t���HP�P�KXѝ�����ܲ�<Zf�Z���7{�#3z�X���v�ɇ�Y���C�W�d��o�=��{^����Z �^���c�`�9{wXY6�,�!ӛ��-�8��笨�4"�����md��c��w����q@���\���"� �#`�nLKF��X��тt(.��l��z�6 �4�͸ao$U>���X;��#��{4�>�?��{�x���S߫���ojDB9���k*���[�;�M�]UoKO�]���å��|�p}��q�11C4��5a
����wswч��� C�o��Y.R�.��b�3;yJ}��
���؈6����Nrc6*3;0!��<m�~��䉌�W>�y���Ooo�ٞfs��E���,��� ͺh�N��S'p�%�<R� fM'_*���qzMw�Y\��ғ�֧�.�6�ܺj�}�n�����OZL�v��9�m�0c��noh��� 3*#���)^�ϔz�.����f�m��EW#J����Ӳ�G�.�d$ҢW��Bۃ���s�νuk�P����)�u拍���2��{�=�ߝL���5�C
�ޝËlJ�j��ݺ��#;%��)��Ա}4�f�!�ax��98�P����$%p�!0��'�	�!\ˡ�D-���pӨ2 �'��ɂ#	�[�^�[߸�������AĊ����?��O����!����z-�l�����|C��
m��؞2�njh�턶���?��a��M�E��H�$��YoJ�<�a
�2- g|�̷/�)<1�����[JKD����+����b"��[�����[��ZW� ��R{���0m�zI;��� s(,������W|RS���}��
J�S��m
���6o�nZ���Z�
'�^:s��;����ص,��o���)�@��$�n.'υ;+kݿ+#�pk1�
��Z�tF�+S�9̧
6�Y����5
D�i���ܫm-A�`�4b.W���#sE���#��N�ó�K��/8���<���DrR/lvU1��PQM�:㉔�r�~�o�RXu��f����d8R8�I:�(���|�s�tĢ�C�t= 	J�S��]��������!8֢�2^5lRR!����Z7��9������څw%}ԃ{2)�˻��>:gW\��0�~-y��0,��Q���+�n��Α�`01��d�p�-���I}�����蒻�_ڬ��s��;b�Eꁎ�
�+w��ߣ⢬�1�T��3F'Y�w���9�6?��4���Z�h�<���A5�O���n�	�x��|q�:������P��|�'6y�q��lY�g��o	&��'0_`�k ��'e(
g�@(,��E���f�L���c��ս�Ĭ�ۗYsi���uv1
��&��=%�����,��+���[u?�S�p�2�F��
�k�^�=T�EAߚm���G<�l�
m���
�ߡԜn~�v���f��A�7T�u�D;����6 ��,�JP���S�EI��l���9��5��g<���߸�{;�3��#�==��3��J~���5�}�:�uN�qrT�!Z*t3�VdI�SYF��ꮷ��������jm���`��:����u����.�7���� m��_W(�C������8:Y�����s¤܀ Z���J�h�;�[^}t[PSFcA�Vs�BV;,��$�a�UaD�I�H�d�~��T����_9:,-V�/ LY��ڸ����@��:p���,w�N}���#���Ǫ_���Fz�&���-�&`2���+ľg� o�n�Q��V��%s�})�\5�{#$�۰a��xޱ���k�Z�pZ����@�_]+�ׇ&�T��,B��,
M!o�+^%�1
�|b�/�>i*�漼Tբe��v3�݋o�t��;����(sڽ���=���q����*iR0�g'*��:J@�S�0�bĸ�J�xvL�M���*�O��Y7i��W�ɟ�>hn0L�<�׼C�Gz�D\�K̼��A.����҈~Ua��O
�@����i��?�:pm��_Q�������HԵ[P����_�ʲs�ɷbWh�86h(P��= 0�)GմS�9�d��L	��{��GN� �b4�������z�s}�> �q�>�G�Ք9TJ�D��l���H
H�T���Tɣ�0�c�l�����+���/����Y9�B{E�~N���D��N�y�����N^���9�	Yϸ�u�<�;��%aQ�	��
+'�B�W�y�ͧrW��E��4	
T��5�v�"m=#xyqa���=���
2D�h��Z-���>�W�ț���+r��r<��9�RZ��G������@�0&�m��>���M����%��%�١B{�,�pJ��-�\f�:��m��}NO�Y3�=���6ٜ2�re��-�;o��m�i���L�,���0g�R���E}�ar���1E+���9f���P�C,I@���3�#x��@/ŶC�dd1PMtm
�m
͂:�|2Z�KM;s R�+J����Ai�Y可al��G�ݟ˒���g&#�_�R���xN��\�%�@+OK0�AFz���We�(r6#P�!��ת�ϵ4oh�$��ׇ�]68B�?���@@�(<0��'��dP�0RF���Qw��i].��C�Q,'�0٬�>�=m��l�l^n��U>���}���2o�X=����9�����6Hz�@ <��z��?��c��Н �1��5B'�N�\�O�ւ��8����kƥ���Vk֡�:F"�:M��(Lc�Z�����X:���v�����!g��̆���bs&����mNLs܄�>���"�<z��̶z��4�R5�����V�Vvm������]��b������!�k�j����h[3�<mk���������W��1򝑙nNՉV/kwz]�V��7����}�>޶��/Y�pS�p+"[�i��m�I�Ѽ�q��m�|��,�g�:^���V�N��5|V���o]��{��w(�N/4��ɹ�w���:^�!vk��9���-�<����ǧ��G|�;f��{����5_ё��[�O����� H��}��ϭ}�_����������[�!�~N��쟈߳!�w^��}_

�^b��Y�;18�Z�y�����c^/>��	"��ƭ��$�!�0���(���9Eh9�n���ʻ��|��Βx�	
�"��vpE潂�_���mG|���#��t�
����Ơ�>0�|�� �K
�O���+���vzjF���}X�oh��[t��p)]��� ;g��H��h�
�_�.L�S���7\���C��lM��"�j�϶��󂘭l��`�8�����^A���ۗj�7-{Z'��m�`.��'�p�����KJ�Q��!���a�$���H�zaL�Ę��#8t@�Fu�i}HV:�' :fx�.�SSh?�̈���@5� ��xcXK�jq�3��ݾ��̭0���U� �S:�:�i���3��z��
[ۓW���ww��"C�h�9�G�T�B��%UPbo�c��"FY�ty�s�ux���"��DJ�/2W�3����Q40�F�����A��
�e1������k�_5�2?��[�	���er�g/8Q���d�$j��WP�73��nVJ�}�MT��Any���Y�[��@�[��6NfN��a9c���1�ř������9-N�����P.Ѕ�M򎏶q�쨳£��LP�OSU���#W�>?�I�&��6G�]��kD��K����ȁn�M=����ٹ+zx,vLTLtL��/��}��W��3����N���G���mItsFe�k>�}�qu͐� r�`k���9�ڗ�$�f��u�� �]�ݵĠ���J?���#
79*Ȍ�L�$$i�:�
i1��SK�+V�'jLc�ܹ��>����
��,�/XCSD ���2�����#��feI�ڊma�v�s`5/�VN2 =E�$�*\�ɪ�Bj�ҒҮ,C[W)B�VZ����dEi�(A�c����؛,�X��9�=xmH�����q-|g��/��� %�e�g�>�d9�L���*2C�Sy�꾵Y�^��jl~��궥�m�.��&y\��Q@�Hb����9��f�����(2�!fB� ���.������CT��~Uɼ�p�v�f��xb-R\�"�
u��}uڑn�L���i�ph���QOm��g�`��<"����
s�Y�m=K��1By;iM��~ |
걉�&�!
͆��9�M��21�(p.�^�]���9��؂*��%Nj;0����d��p��5v�����`蕗g?WQ�e��di�hI�d���ֶp���LcƑ�ùO������4K.YI_�_�cech�^"��
%v��k2 �x���[�ҝ��s����q�^�Ŵ&Z�%���OgĞ	 p�x0��#�eG�g��v�*9�gl�7�U4�g[�ɔ��K$�I�B����&��J��_�D)���F¼��]u���-&	�7���	Y��
���}΀G� R� Ӹ�z$F�^�&�P�u�=�����,�a'����T>"�H�a�0�	��Ի�9>r�� ���!��]5�=%�m�tzL�6׏�g
	�������y��"����$�nfj�%EKQ�_��;�0l��ք���,�a��moO7��W����Y�9�:�
[�H
�����F�g$� Yw�'Eݐ$hQI|�oC��b�
.9��T.��������c�ǖKQq/�����c���)�W%
IE]���[����CZ�AܧS��w�)q����\4/�+����Q+��8��(v�n8`Z�M��Tl딮����^�b��`o
]#�\PH+Y ��o{e7(��g�-S1Ш<ܓ�n��:-�a=D�>��p�NO�]x�^o���e��c�d�ygt�+e1m��y�vi��M�5�s&�+Ѳ≷��㳘��)��n-�د:�,l��z]����<�����CcF �!��ǵ]�MwY���>��5�n}
�*�J��gPhf��m��4[Q��V���G����㡶��I��q�n_�a)�`���{?VΝ|q*z�3�מeZq�z�mʡОuXq�z����u�䛻X�;%.�H�������T�3�e�z�Bͳ�'��0_�;ّ<֊)W�hGX(dԔ,&
$#��P���e��}�"�2��*��h��`5ʆ���� n��:��A��o"�}e&�����!��B
y�/��S�)���m����!�t�,�O=S#� �IK��<,r�!�E{��!1�ʖXw��rX�^�
Ez��@o����kn�*�ΌRNN�����,�`;W��u����ӌ��ܡ{I�v5UmƑ���������Q��1��MВp`NH.V�W<�ao�m��
�g�0ȁ� ƚ�pֺ����8ـ�HP�����ȇz�h��+�,�s�$q����ˈ��k����o^�tI��1�.�1?�1?����\�d�&�!�7y��W4�a��GL�f$�?�P�Au�b���[k�}-C+u(�ֳ�?�k'����/�����|�k��k��k߂k�k߿׾e��c���=�jk�}��m{k۶mlm�o�����bk۶m����Mnnr?��d2��i2�9əg�Y�`�ב�8Rу5��
�sF��KR ��@@�H�B�mDKy�ȒK�#6r%K����{ɼBA�	�/�d�,����TEpd�)2�GKi��B�Ijw�G��ǌ�I�@+a���!4Y�A�DqVP�ZPv�i�h��c�3��E(�b�s�L�%)���zg�Sh�#A=d�ի=?j��`��g���!n���'�P�q��_E?�y9�&���!�+f�\^ZX�K�X��ZG��][Ee���1�x���q3��3fg?��-r�hr@�g�N
��%�˸c�4�1����֘5�
�8z]��|���0(l�sO�Xhh>�d�
x7kNrן����D���D��9\:�pRk8��?"a�s��T�=�4k�V����k����S�����S�F;lmc��\�S���>8��f����S/�vp�?��W����
<ּa�'x���C��~o3�� ����K2� �ؔ����6���}�
�QY@�l��5��$�MGO��{w��63w�ψQ@����Jv���y�b{��U�ʕdM���خV�x��XԠPR��X&�f��wąiΗ
�D��!r�">1S��O2&�0�fy<a�q�s5U ����AD�V��U�Z2��
�=���i�}�G��{��D�`thW�v�$��%��j Vu�k�t������N�����3�iܸ	"Г���}2	z\Q���Yy5w0O�疖���0Ԥ{�O��(�A���I�n�a�
h1�CI�!�Ú3ܵ9u����Tߠ���ai�L;꧲^�o���_H�R�I_�w|����9n�7���<�H�Ȧ[�#�Mnln�?Ֆ�����]�\��6)"����KNv*ˎ��tj����+�0�r(��ʏ�
wzE:APE����IE�;Ąi�,X�t0J�zxQ�vJ�u���,�Ռ]2GtN-�ĥ[�|���Ģ�Z���T�_���QZ��P<�zk7���x��-J�uE|�K�7�2��|^����w��w��Bw5A���b�?5E2;��-p�T̈́R��˓t��B5@R!�#��
����ͻ�=���a������pq���8�:~{���*د�LBX�n��"`*�	�C��>����g���_*3�UQ˿�}�߼#�u���#ɭ=�w�w�̪]x�=��I�9�)����l�C�����1� �/�aU='X�}Lڇ(�B�:��6PI������!7؄9鞱i�rFX�����K���fl������	Xv"Hܙ�
��XP�˚�`���^{aY��kV��Jg?2Lg��9x9�c��e;�T�)v'�D&/���}4A8���7�Tj噐�#m��?�C�a����+�
C72�׎󫼗�? ��y�+��t��A�Kߍb8B����˺ډ"��y{+��C���G�U�j�x8��,m�E�\
�{z���ç;��i:�vK�{���D�77vs`������/���0D�|�B�ԯ��qd�iI3a���Pt�xK��M��vj&F�&�)Z ��]	
d��]�A�ꨛ�$�i�ћ����̗�9�.u�]K�{�/���θsڐ%�@5�'Xğ%�P���T�]�2�xܘ��Y҄4�&�����]%v�f�C��Ǖ���@��a�Π�[� �$/Q]��-�e�~�[U�v_=���}��.�#4�r�(�-�i�Y��ק�˧��5	fE|��N�4��I�N�Xw�oe�-��/����TKr�.C�r;S+�^��� �
o���
�x,h�E�఩��3\��p�=���Zuz�j�S���_Hz�z0�4˒�!����!'��/@����;5��e1����4��#��^L]�@.�F2��S5Oa�.�_|�#xO�Rl	��y��y�מ�ג
������X>pu��:�_���>�'K�`��paT8�j�>"ϝ��w5��L(�J���?�4����zI�mT�B��wj�"���%x��\H{f��$�
0��u5xу��s7���t��S+�?��_���������3��*)A��o�����)��m0bU5{1�9�Գ���C��s�#��4��U`�/r�D�ajS�S�
鋵���vb|!h�՛Ѻu�}�����-&��B���b� Uǿ
|�
:�f6�N~�H����791P81�^گ̥F��8l���iZ�*ҕ�A��O-�38\hV已 mLڹ������bT����pB�X8�&r������=5��"�|K�ݗ��\��_ϝ�^ñ�����DJR?N��be��h���l���)��N#o� �r�7if�� ���j�V��'ٝ�5e'_T�3j�5�ז��5e�������2
�q(�#��2qx��Y7Q���0H��Q5��(�0 �w罤�[+�k�/�33ħ0ca�T\k��}�B�NL�l��8yO]"X���%��'YJy@0룻Ƀ.��# r m!��(.|�[�0fG8��w|�_d���c1�g:(1zԳH�u��3ApO��Y�i��,?�N5�����>)Dl�F����nt����)-��+��5m��2��iĳ�K*��=Vآ7�|��^��#�!�߅R#v�b����z�T�F�]���'��H�� L���,�[<#	
 {�XL7�	~�z~��,N���
����#����b7ހ�w� 
d#��b��
:2����y���]���܂���hµls޵��hӬc�h��:���������� 4��8��������o*��K&d�t�i�=F��,\lm���)�c��Iy���M���H�iiOK'�A�Ee�#�"��f_�ay��Ag���I���e�N�J-���h�j7�rX��.�;#���B���%^16��]��k� ɒ3��B�]�2ߠwa\��Ux۩�Ա�'����'��~.gW��]6�4'W�����'�6Q��e���*ܒ���H\˼�r/��{>� *G�Ȭ���ۏI�P������'���{�� ������ScN�Z���St�	W��c(�]8������;�8��|�~l�|��~��{b�Gq����:=���\U����j�l�/���Fr[`ȓ�����|�c��k���I�蝐+�~C��+��/3���}����L��s���_& �p�5Kb��6H�|K;�94y�ѹ����ro���g�}���=��,<�+�|ˉ��?�ѹ�m�2��L���b���ofOT����D�l�%V�KG۶\� 6F�7�	�HE��H*`�T)c+;6E]w�k�]�bAT,%���T����,X;����(P���TW�J�LC���mx]\��WATd����a1G�i�#N>~��kk������gQ2>C�\l�O+�r���M>�L���.��M��������w::p���CK��I����qX���J�s㳅eF�7:�ʳ�M�K�7o�N� \-�D}w����У%�����A"�K��+u��AG�k�W��P�+9g��F�6:K���r4�k��ė���!�E�{g2ot���l� d(�լ�6!q �.D�N0Ԧ
��Ñ�+Hkg��rh�Cf���eʝc
�=w}?sfe
'�¥r�Д�����<�������u���G����d��AN��^Ka��8��L�^�Ӡt�R�s�.������� |g-����0�Y�PqJ�l����>>�i"M�[�M��&6�H�q�t3ӎ��l?N���G-�<�|������\������.��z�>1�µ����kN��>�[u��������m � ��
ĭc(x�&A��-�����^!��i�2��J�T�R��A�Y6���uӐ����߷%����mZ��H��E��y���vu�Ĉ?i��r����VZ�O~��k���q
�=�0�U=���tdcP�j1� �g��-�M����N-�_>�*I|CΔ!��t�KwԖ�ϕa��0��2`�J�#<t���/6��}��h�9���/�EG�vIͮ��	=��Fq<�Ƹ��ʨ=z�1<����*o�P)�_��V�D���}C���F�?��0�<d�h��nԘV,��3����ɥ��ʹ�R�ѥ�Ѧ�
���8<� e?4�KUHD+3���:�	ݒz��W_Ƒ����ݚ@�p3�騐��8�ɺ�����D0%M�=r4=6+�F*s.QP©䋘u�w2ֱ�͚��&��^|�媋U7i 7�t�tӜ�t��h����I���V��tE�~����K��*S�l4�� %��r.�h8Py4���@��/:��M'0-�F>Y��+�R���X�%��b+h��5�� ���z��Z5$YRǩ��Z`�H+-č�oc�P����ᛚ�8s�sfG�&~Z��p8�/S�NP��9}�e�L��{�����C��QX=k�P'� ݛ�N��)� 6G���xt���^���nR
�L(�v�P�D�]��4�sD�����+D�$%l�3f���' �>&[
�c/|Ϊ�Ӂ�weyF�M!X�m]�`��)��H�L�~Cb���X'�,D�ͽ/�3�lj��<HJF�6��^:��6�j08#�u���@����[��rOg��)c:X�+D\�O[L3]�nt�H�5�}	�p�L{E��D��D��E1Tt.ԊZ�q���MiM���*�����Z	P�9}�@�C������uhi��F]�	�"��e(��;�Ӓƶ�fGj�i���c����1֮?\�V�]'^�VI&���߇�hut ���Rp�ڌ~be@����ّ�PG��[��?�f&_�c�~��'�XO��H�55֣�ᨴK�����ލ��4ig���R?	K��\�/7�p��X�����^DW����SS�����)����2
��&�����y.$�)m(�.���2]�V��{ \ޖ�~���n�(�h'�8f�+���D����W���X��H�4�62P�U��Ĺ��y�g�5o�*0�Z����^;��fs
5\�9�V~�U-z��(��z�����5=�z��U�y�9@��/y{�[�k�aO��qx�sM];�P������Fȅ2���F?����w�����1��``4�
#x3���Tq_��g�/*
 * Copyright (c) 2011.
 * All Rights Reversed by WanXiang Corp.
 */

Ext.ns('wxerp.report.purchaseReturnSummaryReport');
wxerp.report.purchaseReturnSummaryReport.constants = {

    this_tab_panel_id : "tab-purchaseReturnSummaryReport",
    this_grid_id : "purchaseReturnSummaryReport-grid",
    button_select_text:"查找",
    button_select_id :"searchpurchaseReturnSummaryReport",
    search_value_id: "searchValuepurchaseReturnSummaryReport",
    search_Button_id: "searchButtonpurchaseReturnSummaryReport"
};
wxerp.report.purchaseReturnSummaryReport.constants.this_tab_panel = Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.this_tab_panel_id);

Ext.onReady(function() {
    var searchValue = {};
    var count = 0;

    var thisStore = getPurchaseReturnSummaryListReportStore();            //getWarehouseListViewStore
    var sumColor = function(obj, colNum, record) {
        if (record.get('specDescription') == "合计：") {
            return '<span style="color:orange;">' + obj + '</span>';
        }
        return obj;
    };
    var cm = [
        new Ext.grid.RowNumberer({header:"",menuDisabled:true,width:20}),
        {header: '供应商名称', dataIndex: 'buzName',width:150},
        {header: '商品编码', dataIndex: 'productCode',width:100},
        {header: '商品名称', dataIndex: 'productName',renderer : grid_render_href,width:150},
        {header: '规格型号', dataIndex: 'specDescription',width:80},
        {header: '计量单位', dataIndex: 'packingUnitItemName',width:80},
        {header: '采购数量', dataIndex: 'purchaseCount',width:80,align:'right'},
        {header: '采购含税均价', dataIndex: 'purchaseIncPrice',width:100,align:'right'},
        {header: '采购税额', dataIndex: 'taxPrice',width:100,align:'right'},
        {header: '采购总金额', dataIndex: 'sumPurchaseIncPrice',width:100,align:'right'},
        {header: '退货数量', dataIndex: 'returnCount',width:80,align:'right'},
        {header: '退货含税均价', dataIndex: 'returnIncPrice',width:100,align:'right'},
        {header: '退货税额', dataIndex: 'returnTaxPrice',width:100,align:'right'},
        {header: '退货总金额', dataIndex: 'returnSumInPrice',width:100,align:'right'},
        {header: '应付金额', dataIndex: 'paymentAmount',width:100,align:'right'},
        /* {header: '现结金额', dataIndex: 'settleMoney',width:90},
         {header: '已结金额', dataIndex: 'hasSettledMoney',width:90},
         {header: '应结金额', dataIndex: 'money',width:90},*/
        {header: '退货率(%)', dataIndex: 'returnRate',width:100,align:'right'}


    ];
    var thisGrid = new Ext.grid.GridPanel({
        xtype: 'grid',
        id: wxerp.report.purchaseReturnSummaryReport.constants.this_grid_id,
        anchor: '140% 100%',
        store: thisStore,
//        width:1520,
        autoExpandColumn:'buzName',
        stripeRows: true,
        height:document.body.clientHeight - 135,
//        autoHeight: true,
        autoScroll: true,
        border: false,
//        colModel: cm,
        colModel: new Ext.grid.ColumnModel({
            defaults: {
                sortable: true
            },
            columns: cm
        }),
        viewConfig: {
            forceFit: true
        },
        keys:[
            {
                key: Ext.EventObject.Q,
                alt: true,
                fn: function() {
                    //  新增
                    search_purchaseReturnSummaryReport();
                },
                scope:this
            }


        ],
        sm: new Ext.grid.RowSelectionModel({singleSelect:true})
    });
    //查找
    var search_purchaseReturnSummaryReport = function() {
        var newWindow = Ext.getCmp("search-purchaseReturnSummaryReport-window");

        if (!newWindow) {
            newWindow = new wxerp.report.purchaseReturnSummaryReport.searchwindow(count, searchValue, function(sOrder, searchM) {
                searchValue = sOrder;
                Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_value_id).setValue(searchM);
                if (searchM != "") {
                    Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_Button_id).setVisible(false); // 不显示删除图标,可能修改回来
                } else {
                    Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_Button_id).setVisible(false);
                }
                count = 1;
                var maS = wxerp.util.form.subOpen("tab-purchaseReturnSummaryReport", wxerp_loadmask_query_text);
                thisStore.baseParams = {
                    'summaryBO.productId':sOrder.productId,
                    'summaryBO.buzId':sOrder.buzId,
                    'summaryBO.employeeId':sOrder.employeeId,
                    'summaryBO.entIds':sOrder.entIds,
                    'summaryBO.warehouseIds':sOrder.warehouseIds,
                    'summaryBO.productGroupId':sOrder.productGroupCombo,
                    'summaryBO.dateUp':sOrder.dateUp,
                    'summaryBO.dateDown':sOrder.dateDown
                };
                thisStore.load({
                    callback:function(reads, option, success) {
                        var storeResponse = Ext.decode(thisStore.reader.responseText);
                        if (storeResponse.success) {
                            wxerp.util.form.close(maS);
                            thisGrid.getSelectionModel().selectFirstRow();
                            thisGrid.getView().focusRow(0);
                            if (thisGrid.store.getCount() > 0) {
                                Ext.getCmp('purchaseReturnSummaryReport_exportCSV').setDisabled(false);
                            } else {
                                Ext.getCmp('purchaseReturnSummaryReport_exportCSV').setDisabled(true);
                            }
                        } else {
                            wxerp.util.message.common(storeResponse);
                        }

                    }
                })
            });
        }
        newWindow.setTitle("查询采购退货统计");
        newWindow.show();
        newWindow.openEdit(searchValue, Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_value_id).getValue());
        wxerp.util.baseCommonFunction.initShortCuts(newWindow);
    };
    var gridR_purchaseReturnSummaryReport = function() {
        count = 0;
        searchValue = "";
        Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_value_id).setValue("");
        Ext.getCmp(wxerp.report.purchaseReturnSummaryReport.constants.search_Button_id).setVisible(false);
        thisStore.baseParams = {};
        //不选条件  清除grid
        thisStore.removeAll();

//        thisStore.reload({
////            params:{"searchOrder":""},
//            callback:function() {
//                thisGrid.getSelectionModel().selectFirstRow();
//                thisGrid.getView().focusRow(0);
//            }
//        })
    };

    var mappings = {
        'purchaseReturnSummaryReport-search':wxerp.report.purchaseReturnSummaryReport.constants.button_select_id ,
        'purchaseReturnSummaryReport-ExportCSV':'purchaseReturnSummaryReport_exportCSV'
    };
    var availableButtons = [
        {
            text: wxerp.report.purcha