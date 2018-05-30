/***Slider 滑块**/
(function($) {
	$.fn.Slider = function(options) {
		var config = {
			auto : true,
			speed : 5000,
			cur : 0
		}, ops = $.extend(config, options), _this = this, timer = null, len = _this
				.find(".slide-items .slide-item").length, _h = _this.find(
				".slide-items .slide-item").height(), cur = ops.cur, tmp = '<div class="slide-nav-bg"></div><ol class="slide-nav">';
		for ( var i = 0; i < len; i++) {
			tmp += '<li>' + (i + 1) + '</li>';
		}
		tmp += '</ol>';
		$(tmp).appendTo(_this);

		chg(cur);
		if (ops.auto) {
			timer = setInterval(function() {
				chg()
			}, ops.speed);
		}

		_this.find(".slide-nav li").mouseover(function() {
			var index = $(this).index();
			chg(index);
		});

		_this.hover(function() {
			if (timer) {
				clearInterval(timer);
			}
		}, function() {
			if (ops.auto) {
				timer = setInterval(function() {
					chg()
				}, ops.speed);
			}
		});
		function chg(index) {
			if (index == null) {
				index = (cur + 1) % len;
			}
			_this.find(".cur").removeClass("cur");
			_this.find(".slide-nav li").eq(index).addClass("cur");
			_this.find(".slide-items-wrap").animate({
				'top' : index * -1 * _h
			}, {
				queue : false
			});
			cur = index;
		}
	};
})(jQuery);
