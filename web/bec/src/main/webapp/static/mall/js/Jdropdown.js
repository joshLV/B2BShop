/***Jdropdown**/
(function(a) {
	a.fn.Jdropdown = function(b, c) {
        if (this.length) {
            "function" == typeof b && (c = b, b = {});
            var d = a.extend({
                event: "mouseover",
                current: "hover",
                delay: 0
            },
            b || {}),
            e = "mouseover" == d.event ? "mouseout": "mouseleave";
            a.each(this,
            function() {
                var b = null,
                f = null,
                g = !1;
                a(this).bind(d.event,
                function() {
                    if (g) clearTimeout(f);
                    else {
                        var e = a(this);
                        b = setTimeout(function() {
                            e.addClass(d.current),
                            g = !0,
                            c && c(e)
                        },
                        d.delay)
                    }
                }).bind(e,
                function() {
                    if (g) {
                        var c = a(this);
                        f = setTimeout(function() {
                            c.removeClass(d.current),
                            g = !1
                        },
                        d.delay)
                    } else clearTimeout(b)
                })
            })
        }
    }
})(jQuery);
