/***Jlazyload**/
(function(a) {
	a.fn.Jlazyload = function(b, c) {
		var curWwwPath=window.document.location.href;
		var pathName=window.document.location.pathname;
		var pos=curWwwPath.indexOf(pathName);
		var localhostPaht=curWwwPath.substring(0,pos);
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		var base=localhostPaht+projectName+'/';
		
        if (this.length) {
            var d, e, f = a.extend({
                type: null,
                offsetParent: null,
                source: "data-lazyload",
                placeholderImage: base+"static/mall/img/error-img.gif",
                placeholderClass: "loading-style2",
                threshold: 200
            },
            b || {}),
            g = this,
            h = function(a) {
                for (var b = a.scrollLeft,
                c = a.scrollTop,
                d = a.offsetWidth,
                e = a.offsetHeight; a.offsetParent;) b += a.offsetLeft,
                c += a.offsetTop,
                a = a.offsetParent;
                return {
                    left: b,
                    top: c,
                    width: d,
                    height: e
                }
            },
            i = function() {
                var a = document.documentElement,
                b = document.body,
                c = window.pageXOffset ? window.pageXOffset: a.scrollLeft || b.scrollLeft,
                d = window.pageYOffset ? window.pageYOffset: a.scrollTop || b.scrollTop,
                e = a.clientWidth,
                f = a.clientHeight;
                return {
                    left: c,
                    top: d,
                    width: e,
                    height: f
                }
            },
            j = function(a, b) {
                var c, d, e, g, h, i, j = f.threshold ? parseInt(f.threshold) : 0;
                return c = a.left + a.width / 2,
                d = b.left + b.width / 2,
                e = a.top + a.height / 2,
                g = b.top + b.height / 2,
                h = (a.width + b.width) / 2,
                i = (a.height + b.height) / 2,
                Math.abs(c - d) < h + j && Math.abs(e - g) < i + j
            },
            k = function(a, b, d) {
                f.placeholderImage && f.placeholderClass && d.attr("src", f.placeholderImage).addClass(f.placeholderClass),
                a && (d.attr("src", b).removeAttr(f.source), c && c(b, d))
            },
            l = function(b, d, e) {
                if (b) {
                    var g = a("#" + d);
                    g.html(e.val()).removeAttr(f.source),
                    e.remove(),
                    c && c(d, e)
                }
            },
            m = function(a, b, d) {
                a && (d.removeAttr(f.source), c && c(b, d))
            },
            n = function() {
                e = i(),
                g = g.filter(function() {
                    return a(this).attr(f.source)
                }),
                a.each(g,
                function() {
                    var b = a(this).attr(f.source);
                    if (b) {
                        var c = f.offsetParent ? h(a(f.offsetParent).get(0)) : e,
                        d = h(this),
                        g = j(c, d);
                        switch (f.type) {
                        case "image":
                            k(g, b, a(this));
                            break;
                        case "textarea":
                            l(g, b, a(this));
                            break;
                        case "module":
                            m(g, b, a(this))
                        }
                    }
                })
            },
            o = function() {
                g.length > 0 && (clearTimeout(d), d = setTimeout(function() {
                    n()
                },
                10))
            };
            n(),
            f.offsetParent ? a(f.offsetParent).bind("scroll",
            function() {
                o()
            }) : a(window).bind("scroll",
            function() {
                o()
            }).bind("reset",
            function() {
                o()
            })
        }
    }
})(jQuery);
