package net.deepdragon.weipu.tools;

public enum SystemConfig {
	/**
	 * 基本设置
	 */
	systemName,//系统名称
	systemVersion,//系统版本
	systemDescription,//系统描述
	shopName,//网站名称
	shopUrl,//网站地址
	shopLogo,//网站Logo
	address,//联系地址
	phone,//服务电话
	zipCode,//邮政编码
	email,//电子信箱
	certtext,//备案号
	isEnableERP,//启用ERP
	operatorOnly,//启用ERP
	/**
	 * 显示设置
	 * 
	 */
	imageUrl,//图片服务器地址
	bigGoodsImageWidth,//商品图片（大）:宽度
	bigGoodsImageHeight,//商品图片（大）:高度
	smallGoodsImageWidth,//商品图片（小）:宽度
	smallGoodsImageHeight,//商品图片（小）:高度
	thumbnailGoodsImageWidth,//商品缩略图:宽度
	thumbnailGoodsImageHeight,//商品缩略图:高度
	defaultBigGoodsImage,//默认商品图片
	defaultSmallGoodsImage,//默认商品图片
	defaultThumbnailGoodsImage,//默认缩略图
	watermarkImage,//水印图片
	watermarkPosition,//水印位置
	watermarkAlpha,//水印透明度
	
	/**
	 * 安全设置
	 */
	isRegister,//是否开放注册
	isLoginFailureLock,//是否自动锁定账号
	loginFailureLockCount,//连续登录失败最大次数
	loginFailureLockTime,//自动解锁时间
	allowedUploadImageExtension,//允许上传图片文件扩展名
	allowedUploadMediaExtension,//允许上传媒体文件扩展名
	allowedUploadFileExtension,//允许上传其它文件扩展名
	uploadLimit,//文件上传最大值
	/**
	 * 其它设置
	 */
	currencyType,//货币种类
	currencySign,//货币符号
	currencyUnit,//货币单位
	priceDescription,//商品价格显示
	priceScale,//商品价格精确位数
	priceRoundType,//商品价格精确方式
	orderScale,//订单金额精确位数
	orderRoundType,//订单金额精确方式
	storeAlertCount,//商品库存报警数量
	storeFreezeTime,//库存预占时间点
	scoreType,//积分获取方式
	scoreScale,//积分换算比率
	areaType,//所属地区校验级别
	memberCategoryType,//会员分类校验级别
}
