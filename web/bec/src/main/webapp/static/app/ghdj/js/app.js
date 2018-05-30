/**
 * 演示程序当前的 “注册/登录” 等操作，是基于 “本地存储” 完成的
 * 当您要参考这个演示程序进行相关 app 的开发时，
 * 请注意将相关方法调整成 “基于服务端Service” 的实现。
 **/
function getRootPath(){
	var curWwwPath=window.document.location.href;
	var pathName=window.document.location.pathname;
	var pos=curWwwPath.indexOf(pathName);
	var localhostPaht=curWwwPath.substring(0,pos);
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	return(localhostPaht+projectName);
}
var base=getRootPath()+'/';

(function($, owner) {
	/**
	 * 用户登录
	 **/
	owner.login = function(basePath, loginInfo, callback) {
		callback = callback || $.noop;
		loginInfo = loginInfo || {};
		loginInfo.account = loginInfo.account || '';
		loginInfo.password = loginInfo.password || '';
		if (loginInfo.account.length < 5) {
			return callback('账号最短为 5 个字符');
		}
		if (loginInfo.password.length < 6) {
			return callback('密码最短为 6 个字符');
		}
		var authed=false;
		mui.post(basePath+"/member/check?whichclient=whichapp",{
				userName:loginInfo.account,
				password:loginInfo.password
			},function(data){
				if(data.status=='error'){
					authed=false;
				}else{
					authed=true;
				}
				if (authed) {
					$.openWindow({
						url: base + data.url,
						id: 'base',
						show: {
							aniShow: 'pop-in'
						},
						styles: {
							popGesture: 'hide'
						},
						waiting: {
							autoShow: false
						}
					});
				} else {
					return callback('用户名或密码错误');
				}
			},'json'
		);
	};

	owner.createState = function(name, callback) {
		var state = owner.getState();
		state.account = name;
		state.token = "token123456789";
		owner.setState(state);
		return callback();
	};

	/**
	 * 新用户注册
	 **/
	owner.reg = function(basePath, regInfo, callback) {
		callback = callback || $.noop;
		regInfo = regInfo || {};
		regInfo.account = regInfo.account || '';
		regInfo.password = regInfo.password || '';

		mui.post(basePath + "/member/username/check?whichclient=whichapp", {
			property: 'userName',
			userName: regInfo.account
		}, function (data) {
			if (data == 'true') {
				mui.post(basePath + "/member/save?whichclient=whichapp", {
						userName: regInfo.account,
						password: regInfo.password,
						repassword: regInfo.password
					}, function (data) {
						if (data.status == 'success') {
							return callback();
						} else {
							return callback(data.message);
						}
					}, 'json'
				);
			} else {
				return callback('用户名已存在!');
			}
		}, 'json');


	};
	(function($, utils) {
		utils.fmoney = function(s, n) {
			if (!$.isNumeric(s)) {
				return "0.00";
			}
			n = n > 0 && n <= 20 ? n : 2;
			s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
			var l = s.split(".")[0].split("").reverse();
			var r = s.split(".")[1];
			t = "";
			for (i = 0; i < l.length; i++) {
				t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
			}
			return "￥" + t.split("").reverse().join("") + "." + r;
		};
	})(jQuery, window.utils = {});
	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem('$state') || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem('$state', JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};

	var checkEmail = function(email) {
		email = email || '';
		return (email.length > 3 && email.indexOf('@') > -1);
	};

	/**
	 * 找回密码
	 **/
	owner.forgetPassword = function(email, callback) {
		callback = callback || $.noop;
		if (!checkEmail(email)) {
			return callback('邮箱地址不合法');
		}
		return callback(null, '新的随机密码已经发送到您的邮箱，请查收邮件。');
	};

	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		localStorage.setItem('$settings', JSON.stringify(settings));
	}

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
		var settingsText = localStorage.getItem('$settings') || "{}";
		return JSON.parse(settingsText);
	}
	/**
	 * 发送密码重置短信
	 * @param phoneInfo {username:'帐号', mobile:'手机号码'}
	 * @param callback
	 */
	owner.sendSMS = function(basePath, phoneInfo, callback){
		mui.post(basePath + "/ajaxCheckUser?whichclient=whichapp", {
			username: phoneInfo.account
		}, function (data) {
			if (data.status == 'success') {
				mui.post(basePath + "/ajaxSendSMS?whichclient=whichapp", {
						username: phoneInfo.account,
						mobile: phoneInfo.mobile
					}, function (data) {
						if (data.status == 'success') {
							return callback();
						} else {
							return callback(data.message);
						}
					}, 'json'
				);
			} else {
				return callback('用户不存在');
			}
		}, 'json');
	}
	utils.leftPad = function(tbl) {
		return function(num, n) {
			return (0 >= (n = n - num.toString().length)) ? num : (tbl[n] || (tbl[n] = Array(n + 1).join(0))) + num;
		}
	}([]);
	/**
	 * 格式化日期
	 * @param now  当前日期
	 * @param type {1：年-月-日 小时:分钟:秒}{2:年-月-日}{3:小时:分钟:秒}{4:XXXX年XX月XX日}
	 */
	utils.dateFormat = function(now, type) {
		type = type || 1;
		var date = new Date(now)
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		if (type == 1) {
			return year + "-" + this.leftPad(month, 2) + "-" + this.leftPad(day, 2) + " " + this.leftPad(hour, 2) + ":" + this.leftPad(minute, 2) + ":" + this.leftPad(second, 2);
		} else if (type == 2) {
			return year + "-" + this.leftPad(month, 2) + "-" + this.leftPad(day, 2);
		} else if (type == 3) {
			return this.leftPad(hour, 2) + ":" + this.leftPad(minute, 2) + ":" + this.leftPad(second, 2);
		} else if (type == 4) {
			return year + "年" + this.leftPad(month, 2) + "月" + this.leftPad(day, 2) + "日";
		}

	}
}(mui, window.app = {}));