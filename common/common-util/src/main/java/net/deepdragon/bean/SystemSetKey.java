package net.deepdragon.bean;

/**
 * Explain:Shared_system_set 表中的key
 * FileName:
 * Author: TianYu
 * Time: 2016-10-10 8:51
 * Desc:
 * Version: V1.0
 */
public enum SystemSetKey {
    /**  */
    isEnableSeedGoodsEnquiryOrder,
    /** 联系地址 */
    address,
    /** 允许上传其它文件扩展名 */
    allowedUploadFileExtension,
    /** 允许上传图片文件扩展名 */
    allowedUploadImageExtension,
    /** 允许上传媒体文件扩展名 */
    allowedUploadMediaExtension,
    /** 所属地区校验级别 */
    areaType,
    /** 商品图片（大）高度 */
    bigGoodsImageHeight,
    /** 商品图片（大）宽度 */
    bigGoodsImageWidth,
    /** 备案号 */
    certtext,
    /** 货币符号 */
    currencySign,
    /** 货币种类 */
    currencyType,
    /**  */
    currencyUnit,
    /** 货币单位 */
    defaultBigGoodsImage,
    /**  */
    defaultSmallGoodsImage,
    /**  */
    defaultThumbnailGoodsImage,
    /** 电子信箱 */
    email,
    /** 自动锁定账号 */
    isLoginFailureLock,
    /** 开放注册 */
    isRegister,
    /** 连续登录失败最大次数 */
    loginFailureLockCount,
    /** 自动解锁时间 */
    loginFailureLockTime,
    /** 会员分类校验级别 */
    memberCategoryType,
    /** 订单金额精确方式 */
    orderRoundType,
    /** 订单金额精确位数 */
    orderScale,
    /** 服务电话 */
    phone,
    /** 商品价格显示 */
    priceDescription,
    /** 商品价格精确方式 */
    priceRoundType,
    /** 商品价格精确位数 */
    priceScale,
    /** 积分换算比率 */
    scoreScale,
    /** 积分获取方式 */
    scoreType,
    /**  */
    shopLogo,
    /** 网站名称 */
    shopName,
    /** 联系地址 */
    shopUrl,
    /** 商品图片（小） 高度 */
    smallGoodsImageHeight,
    /** 商品图片（小） 宽度 */
    smallGoodsImageWidth,
    /** 商品库存报警数量 */
    storeAlertCount,
    /** 库存预占时间点 */
    storeFreezeTime,
    /** 系统描述 */
    systemDescription,
    /** 系统名称 */
    systemName,
    /** 系统版本 */
    systemVersion,
    /** 商品缩略图 宽度 */
    thumbnailGoodsImageHeight,
    /** 商品缩略图 高度 */
    thumbnailGoodsImageWidth,
    /** 文件上传最大值 */
    uploadLimit,
    /** 水印透明度 */
    watermarkAlpha,
    /**  */
    watermarkImage,
    /** 水印位置 */
    watermarkPosition,
    /** 邮政编码 */
    zipCode,
    /** 图片服务器 */
    imageUrl,
    /** 是启用ERP */
    isEnableERP,
    /** 操作员唯一性 */
    operatorOnly,
    /** 开启订单确认 */
    isEnableConfirm,
    /** 订单确认方 */
    confirmUser,
    /** 商家管理系统地址 */
    mcmUrl,
    /** 毛利率 */
    grossMargin,
    /** Lucene索引库地址 */
    indexBasePath,
    /** BEC网站地址 */
    becShopUrl,
    /** 是否价格审核 */
    isPriceAudit,
    /** 是否开启商品信息唯一性校验 */
    isChecked,
    /**  */
    PhoneSet,
    /**  */
    CpuWarningSet,
    /** 服务器内存大小 */
    ServerRamSet,
    /** JVM内存大小 */
    JvmRamSet,
    /** 短信地址 */
    smsUrl,
    /** 短信用户ID */
    smsUserId,
    /** 短信账号 */
    smsAccount,
    /** 短信密码 */
    smsPassword,
    /** 短信标识 */
    smsSign,
    /** lucene索引根目录 */
    nowIndexBasePath,
    /**  */
    zCShopUrl,
    /** 包邮参数设置 */
    freeShippingNum,
    /** pointMessage */
    pointMessage,
    /** 是否启用手机端商品介绍/文章管理内容 */
    isEnable,
    /**  */
    smsType,
    /**  */
    calcFreightByModuls,
    /** 退款天数限制 */
    refundLimitDay,
    /** 发货延迟天数 */
    delayDay,
    /** 是否开启静态化  true 开启 false 不开启 */
    staticizeHtml,
    /** 单品是否只显示一个商品  true 显示一个 false 全部显示 */
    singleProductUnique,
    /** 众筹订单是否需要商家确认  true 需要 false 不需要 */
    zcOrderShopConfirm
}
