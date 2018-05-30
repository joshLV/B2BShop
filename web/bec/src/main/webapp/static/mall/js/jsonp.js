/***JSONP 扩展**/
(function($) {
	$.extend({
        _jsonp: {
            scripts: {},
            counter: 1,
            charset: "gb2312",
            head: document.getElementsByTagName("head")[0],
            name: function(callback) {
                var name = "_jsonp_" + (new Date).getTime() + "_" + this.counter;
                this.counter++;
                var cb = function(json) {
                    eval("delete " + name),
                    callback(json),
                    $._jsonp.head.removeChild($._jsonp.scripts[name]),
                    delete $._jsonp.scripts[name]
                };
                return eval(name + " = cb"),
                name
            },
            load: function(a, b) {
                var c = document.createElement("script");
                c.type = "text/javascript",
                c.charset = this.charset,
                c.src = a,
                this.head.appendChild(c),
                this.scripts[b] = c
            }
        },
        getJSONP: function(a, b) {
            var c = $._jsonp.name(b),
            a = a.replace(/{callback};/, c);
            return $._jsonp.load(a, c),
            this
        }
    })
})(jQuery);

