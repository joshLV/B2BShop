����   2&
 ; �
 � � �
  �
  �
 : �
 � �
  �
 � �
 � �	 : �
 � �
 � �	 : �
 � � ����
  � �
  �
  �
  � �
 � � �
 � � �
  �
 : �
 � �
 � �
 ; � �
  �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
  �
 ! �
 ! � � � BoundSqlSqlSource InnerClasses serialVersionUID J ConstantValue        <init> ()V Code LineNumberTable LocalVariableTable this KLcom/thinkgem/jeesite/common/persistence/interceptor/PaginationInterceptor; 	intercept 9(Lorg/apache/ibatis/plugin/Invocation;)Ljava/lang/Object; mo )Lorg/apache/ibatis/reflection/MetaObject; originalSql Ljava/lang/String; pageSql newBoundSql $Lorg/apache/ibatis/mapping/BoundSql; newMs +Lorg/apache/ibatis/mapping/MappedStatement; 
invocation %Lorg/apache/ibatis/plugin/Invocation; mappedStatement 	parameter Ljava/lang/Object; boundSql parameterObject page .Lcom/thinkgem/jeesite/common/persistence/Page; LocalVariableTypeTable BLcom/thinkgem/jeesite/common/persistence/Page<Ljava/lang/Object;>; StackMapTable � � � � � � � 
Exceptions � plugin &(Ljava/lang/Object;)Ljava/lang/Object; target setProperties (Ljava/util/Properties;)V 
properties Ljava/util/Properties; copyFromMappedStatement }(Lorg/apache/ibatis/mapping/MappedStatement;Lorg/apache/ibatis/mapping/SqlSource;)Lorg/apache/ibatis/mapping/MappedStatement; keyProperty ms newSqlSource %Lorg/apache/ibatis/mapping/SqlSource; builder Builder 3Lorg/apache/ibatis/mapping/MappedStatement$Builder; � � � 
SourceFile PaginationInterceptor.java RuntimeVisibleAnnotations %Lorg/apache/ibatis/plugin/Intercepts; value $Lorg/apache/ibatis/plugin/Signature; type %Lorg/apache/ibatis/executor/Executor; method query args %Lorg/apache/ibatis/session/RowBounds; )Lorg/apache/ibatis/session/ResultHandler; C D � � � )org/apache/ibatis/mapping/MappedStatement � � � � � � � � � � � � � � � � � � � � � � � � � � � � #org/apache/ibatis/session/RowBounds C � "org/apache/ibatis/mapping/BoundSql � � � � C � metaParameters � � � 'org/apache/ibatis/reflection/MetaObject � � [com/thinkgem/jeesite/common/persistence/interceptor/PaginationInterceptor$BoundSqlSqlSource C � q r � � � � � � n 1org/apache/ibatis/mapping/MappedStatement$Builder � � �  C �	
 s � !"#$% Icom/thinkgem/jeesite/common/persistence/interceptor/PaginationInterceptor Ccom/thinkgem/jeesite/common/persistence/interceptor/BaseInterceptor #org/apache/ibatis/plugin/Invocation java/lang/Object ,com/thinkgem/jeesite/common/persistence/Page java/lang/String java/lang/Throwable #org/apache/ibatis/mapping/SqlSource [Ljava/lang/String; getArgs ()[Ljava/lang/Object; getBoundSql 8(Ljava/lang/Object;)Lorg/apache/ibatis/mapping/BoundSql; getParameterObject ()Ljava/lang/Object; convertParameter p(Ljava/lang/Object;Lcom/thinkgem/jeesite/common/persistence/Page;)Lcom/thinkgem/jeesite/common/persistence/Page; getPageSize ()I getSql ()Ljava/lang/String; -com/thinkgem/jeesite/common/utils/StringUtils isBlank (Ljava/lang/CharSequence;)Z trim log Lorg/apache/ibatis/logging/Log; =com/thinkgem/jeesite/common/persistence/interceptor/SQLHelper getCount �(Ljava/lang/String;Ljava/sql/Connection;Lorg/apache/ibatis/mapping/MappedStatement;Ljava/lang/Object;Lorg/apache/ibatis/mapping/BoundSql;Lorg/apache/ibatis/logging/Log;)I setCount (J)V DIALECT 9Lcom/thinkgem/jeesite/common/persistence/dialect/Dialect; generatePageSql �(Ljava/lang/String;Lcom/thinkgem/jeesite/common/persistence/Page;Lcom/thinkgem/jeesite/common/persistence/dialect/Dialect;)Ljava/lang/String; (II)V getConfiguration +()Lorg/apache/ibatis/session/Configuration; getParameterMappings ()Ljava/util/List; `(Lorg/apache/ibatis/session/Configuration;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V -com/thinkgem/jeesite/common/utils/Reflections getFieldValue 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; setFieldValue 9(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V '(Lorg/apache/ibatis/mapping/BoundSql;)V proceed org/apache/ibatis/plugin/Plugin wrap L(Ljava/lang/Object;Lorg/apache/ibatis/plugin/Interceptor;)Ljava/lang/Object; initProperties getId getSqlCommandType ,()Lorg/apache/ibatis/mapping/SqlCommandType; �(Lorg/apache/ibatis/session/Configuration;Ljava/lang/String;Lorg/apache/ibatis/mapping/SqlSource;Lorg/apache/ibatis/mapping/SqlCommandType;)V getResource resource G(Ljava/lang/String;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getFetchSize ()Ljava/lang/Integer; 	fetchSize H(Ljava/lang/Integer;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getStatementType +()Lorg/apache/ibatis/mapping/StatementType; statementType ^(Lorg/apache/ibatis/mapping/StatementType;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getKeyGenerator 2()Lorg/apache/ibatis/executor/keygen/KeyGenerator; keyGenerator e(Lorg/apache/ibatis/executor/keygen/KeyGenerator;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getKeyProperties ()[Ljava/lang/String; 
getTimeout timeout getParameterMap *()Lorg/apache/ibatis/mapping/ParameterMap; parameterMap ](Lorg/apache/ibatis/mapping/ParameterMap;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getResultMaps 
resultMaps E(Ljava/util/List;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; getCache !()Lorg/apache/ibatis/cache/Cache; cache T(Lorg/apache/ibatis/cache/Cache;)Lorg/apache/ibatis/mapping/MappedStatement$Builder; 
isUseCache ()Z useCache 6(Z)Lorg/apache/ibatis/mapping/MappedStatement$Builder; build -()Lorg/apache/ibatis/mapping/MappedStatement; ! : ;     > ?  @    A   C D  E   /     *� �    F        G        H I    J K  E  
     �+� 2� M+� 2N,-� :� ::� � :� �� � �� � 	� �� � 
:,*� � �� *� � :+� � Y� S� Y,� � � � :	� � � � :
	
� *,� Y	� � :
+� 
S+� �    F   V    & 
 +  ,  -  0 " 1 ' 2 0 6 > 8 I 9 K ; U > j A w E � F � H � I � J � M � O � R G   z  � 	 L M 
 U � N O  w ` P O  � 7 Q R 	 �  S T 
   � H I     � U V  
 � W T   � X Y   � Z R   � [ Y  " � \ ]  ^     " � \ _  `   . � 0  a b c d e d f  � s g g e�  h     i  j k  E   :     +*� �    F       X G        H I      l Y   m n  E   >     *+�  �    F   
    ]  ^ G        H I      o p   q r  E  L     �� !Y+� +� ",+� #� $N-+� %� &W-+� '� (W-+� )� *W-+� +� ,W+� -� ,+� -:�66� 2:-� .W����-+� /� 0W-+� 1� 2W-+� 3� 4W-+� 5� 6W-+� 7� 8W-� 9�    F   B    b 	 c  d  e ' f 0 g 9 h @ i \ j c i i m r n { o � p � q � r G   4  \  s O    � H I     � t T    � u v   � w y  `    � N  a c z { |  �   }    ~    +  �  �[ @ �  �c � �s � �[ c Tc Yc �c � =      : < 	 !  x 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
			model.addAttribute("unpaidAmountTotal", order.getTotalAmount() - paidAmountTotal);//剩余应支付总额

			//2、计算订单使用红包支付的累计金额
			Double RPaidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), orderSn , "红包支付");
			model.addAttribute("RunpaidAmountTotal", order.getGoodsTotalPrice() - RPaidAmountTotal);//剩余红包可支付总额

		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		model.addAttribute("orderSn", orderSn);
		model.addAttribute("total", net.deepdragon.util.StringUtil.isNotEmpty(total)? Double.parseDouble(total):order.getTotalAmount());

		model.addAttribute("payAmountType", request.getParameter("payAmountType"));// 支付金额类型  deposit 支付定金  TianYu 2016-12-06 14:58:31

		if(Global.HYBRIDAPP.equals(request.getParameter(Global.WHICHCLIENT))){
			model.addAttribute("payTypeList", payTypeListForHybridApp);
		}else if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			model.addAttribute("payTypeList", payTypeListForWechat);
		}else{
			model.addAttribute("payTypeList", payTypeList);
		}

		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/pay";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/payment_list";
		}
	}

	/**
	 * 在线支付点击“下一步”后调用方法
	 * 进入支付页面
	 * @param orderSn
	 * @param payType
	 * @param onlinePayAmount 第三方支付通道支付金额
	 * @param mpr 接收账户、红包、授信参数
	 * @return
	 *
	 * version 2 TianYu 2016-2-25 16:24:18 添加多方支付和多次支付
	 * 1、新增参数 onlinePayAmount  account  credits  redenvelopaccounts
	 * 2、添加多方支付支付信息保存和对应流水保存
	 * 3、进行支付金额校验，
	 * 		如果 支付总金额 = 订单金额  修改订单状态为 等待卖家发货， 支付状态为 已支付， 跳转到订单详情页
	 * 		如果 支付总金额 < 订单金额	  跳转到支付方式确认页
	 */
	@RequestMapping(value = "show", method ={RequestMethod.POST})
	public String show(String orderSn, String payType, Double onlinePayAmount,MultiPayRecord mpr,Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付，暂不保存用户的选择，进入确认支付页面，展示用户的选择";
		setLogInfo(info);
		logger.debug(info);

		try {

			if (StringUtils.isNotBlank(orderSn)) {
				orderSn = Arrays.asList(orderSn.split(",")).get(0);
			}

			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))
					|| Global.HYBRIDAPP.equals(request.getParameter(Global.WHICHCLIENT))) {
				model.addAttribute("order", order);
			}

			/**-------------------去除多订单同时支付，原本的只是个幌子，未实现合单支付功能  TianYu 2016-2-26 13:55:00 Old Start--------------------------*/
			/*List<String> orderSns = null;
			if (StringUtils.isNotBlank(orderSn)) {
				orderSns = Arrays.asList(orderSn.split(","));
			}
			List<Order> orders = orderService.findListByOrderSns(getParamMap(), orderSns);
			model.addAttribute("orders", orders);*/
			/**-------------------去除多订单同时支付，原本的只是个幌子，未实现合单支付功能  TianYu 2016-2-26 13:55:00 Old End--------------------------*/

			/** Version 2 Tianyu 2016年2月25日17:10:03 Start----------------------------*/
			//1、查询订单累计已支付金额
			Double paidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), orderSn, null);

			//2、计算已支付总额，并组装 账户、授信、红包的使用流水 和支付数据
			//1.1、账户更新、账户使用流水、支付日志 Account wp_account_log OrderPayLog
			//1.2、授信更新、授信使用流水、支付日志 List<ghj_credit_reply> List<ghj_credit_used_log> List<OrderPayLog>
			//1.3、红包更新、红包使用流水、支付日志 List<ghj_redenvelop_accesslog> List<OrderPayLog>
			String userName = "operator".equals(getLoginType(request)) ? getCurrentOperator(request).getUserName() : getCurrentMember(request).getUserName();
			MultiPayRecord multiPayRecord = this.installPayRecord(order, userName, getCurrentMember(request).getId(), mpr.getAccount(), mpr.getCreditReplyList(), mpr.getRedenvelopaccounts() );

			//存在支付金额时，执行保存操作
			if(multiPayRecord.getPayAmountTotal() != null && multiPayRecord.getPayAmountTotal() > 0){
				//3、保存账户、授信、红包的使用流水和支付数据
				this.orderPaylogService.saveMultiPayData(getParamMap(), multiPayRecord);

				//4、判断支付情况
				if(multiPayRecord.getPayAmountTotal() < order.getTotalAmount() - paidAmountTotal){
					//未支付完成
					//计算已支付总金额
					paidAmountTotal += multiPayRecord.getPayAmountTotal();
				}else if(multiPayRecord.getPayAmountTotal().equals( order.getTotalAmount() - paidAmountTotal ) ){
					//支付完成
					//更新订单的 订单状态和支付状态
					order.setOrderStatus(Order.OrderStatus.wait_seller_send_goods);
					order.setPaymentStatus( Order.PaymentStatus.paid);

					orderService.update(getParamMap(), order);

					//给商家发短信 TianYu 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());


					if (1 == order.getOrderType()) {
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("tenantId", getTenantId());
						params.put("userId", order.getMemberId());
						params.put("platform", getPlatform());
						Account acct = accountService.findAccountByUser(params);

						params = new HashMap<String, Object>();
						params.put("tenantId", getTenantId());
						params.put("platform", getPlatform());
						params.put("userId", order.getMemberId());
						params.put("accountId", acct.getId());
						params.put("orderSn", order.getOrderSn());
						params.put("payMethod", 1);//交易类型(0:充值 1:冻结 2：解冻 3：提现)

						AccountLog acctLog = accountLogService.getByOrderSn(params, false);
						Account account = new Account();
						account.setId(acct.getId());
						account.setAccountTotal(0.0);
						account.setAccountBlock(acctLog.getAccount() * (-1));


						AccountLog accountLog = new AccountLog();
						accountLog.setUserId(acctLog.getUserId());
						accountLog.setAccountId(acctLog.getAccountId());
						accountLog.setBuyUsername(acctLog.getBuyUsername());
						accountLog.setBuyRealname(acctLog.getBuyRealname());
						accountLog.setOrderSn(order.getOrderSn());
						accountLog.setPayMethod(2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
						accountLog.setSellerId(acctLog.getSellerId());
						accountLog.setSellerUsername(acctLog.getSellerUsername());
						accountLog.setAccount(acctLog.getAccount() * (-1));
						accountLog.setFeeAccount(0.0);//手续费
						accountLog.setOldAccountTotal(acct.getAccountTotal());
						accountLog.setOldAccountBlock(acct.getAccountBlock());
						accountLog.setStatus(1);
						accountLog.setCreateUser("unionpay");
						accountLog.setCreateDate(DateUtil.getCalendar().getTime());
						accountService.unblock(getParamMap(), account, accountLog, false);
					}




					//保存订单日志
					OrderLog orderLog = new OrderLog();
					orderLog.setTenantId(getTenantId());
					orderLog.setOrderSn(order.getOrderSn());
					orderLog.setType(order.getOrderStatus().toString());
					orderLog.setOperator(getCurrentMember(request).getUserName());
					orderLog.setInfo("确认订单");
					orderLog.setCreateUser(order.getCreateUser());
					orderLog.setOldType("cartItem");
					orderLog.setStatusType(OrderLog.StatusType.order.toString());
					orderLogService.save(getParamMap(), orderLog);
					//跳转到订单详情页
					return "redirect:/order/view/" + order.getId() + "?hasSuccesTip=true";
				}
			}
			/** Version 2 Tianyu 2016年2月25日17:10:03 End------------------------------------------------------------*/
			//第三方支付平台支付为0时 跳转到 订单详情页
			if( onlinePayAmount <= 0  ){
				//如果未支付完成，跳转到支付页面
				if( multiPayRecord.getPayAmountTotal() < order.getTotalAmount() - paidAmountTotal ){
					return "redirect:/payment?orderSn="+order.getOrderSn()+"&total="+order.getTotalAmount()+"&key="+order.getId();
				}
				return "redirect:/order/view/" + order.getId()+ "?hasSuccesTip=true";
			}

			model.addAttribute("orderIds", order.getId());
			model.addAttribute("total", order.getTotalAmount());//支付总额
			model.addAttribute("paidAmountTotal", paidAmountTotal);//已支付总额
			model.addAttribute("unpaidAmountTotal", order.getTotalAmount() - paidAmountTotal);//剩余应支付总额
			model.addAttribute("onlinePayAmount", onlinePayAmount);//本次第三方支付金额
			model.addAttribute("isPayOver", order.getTotalAmount() - (paidAmountTotal==null?0:paidAmountTotal) - (onlinePayAmount==null?0:onlinePayAmount) == 0 ? true : false );//本次支付后是否支付完， true  支付完， false 未支付完
			model.addAttribute("remainingUnpaid", order.getTotalAmount() - paidAmountTotal -onlinePayAmount );//剩余未支付金额
			model.addAttribute("order", order);
			/**-------------------去除多订单同时支付，原本的只是个幌子，未实现合单支付功能  TianYu 2016-2-26 13:55:00 Old Start--------------------------*/
			/*StringBuilder ids = new StringBuilder();
			double total = 0.00;
			int i = 0;
			for(Order o : orders){
				if(i > 0){
					ids.append(",");
				}
				i++;
				ids.append(o.getId());
				total += o.getTotalAmount();
			}
			model.addAttribute("orderIds", ids);
			model.addAttribute("total", total);*/
			/**-------------------去除多订单同时支付，原本的只是个幌子，未实现合单支付功能 TianYu 2016-2-26 13:55:00 Old  End--------------------------*/

		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		Map<String, Object> payTypeMap = null;
		for (Map<String, Object> tempPayTypeMap : payTypeAllList) {
			if (StringUtils.equalsIgnoreCase(payType, tempPayTypeMap.get("sign").toString())) {
				payTypeMap = tempPayTypeMap;
			}
		}

		model.addAttribute("orderSn", orderSn);
		model.addAttribute("payAmountType", request.getParameter("payAmountType"));
		model.addAttribute("payType", payTypeMap);

		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			if("unionpay".equals(payType)){
				return Global.TEMPLATE_APP + PATH + "/payment_show_unionpay";
			}
			if("wxpay".equals(payType)){
				return Global.TEMPLATE_APP + PATH + "/payment_show_wxpay";
			}
			return Global.TEMPLATE_APP + PATH + "/payment_show";
		}else if("wxpay".equals(payType)){
			return Global.TEMPLATE_MALL + PATH + "/member/payment_show_wxpay";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/payment_show";
		}

	}

	@RequestMapping(value = "confirm")
	public String confirm(String orderSn, String payType, Double payAmount, Model model, HttpServletRequest request, HttpServletResponse response) {
		String info = "订单[" + orderSn + "]支付，保存订单选择的在线支付方式，根据不同的方式组织参数跳转到不同的网关";
		setLogInfo(info);
		logger.debug(info);
		String tenantId = getTenantId();
//		Order order = null;
		List<Order> orders = null;
		try {
			List<String> orderSns = null;
			if (StringUtils.isNotBlank(orderSn)) {
				orderSns = Arrays.asList(orderSn.split(","));
			}
			orders = orderService.findListByOrderSns(getParamMap(), orderSns);

//			order=orderService.find(tenantId, "orderSn", orderSn);
			for(Order order : orders) {
				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType(payType);
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);

				Buyer member = getCurrentMember(request);
				OrderItem orderItem = null;
				List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
				if (orderItemList != null && orderItemList.size() > 0) {
					for(OrderItem item : orderItemList){
						if( item.getQuantity() != 0 ){
							orderItem = item;
							break;
						}
					}
				}

				OrderPaylog paylog = null;
				if (StringUtils.equalsIgnoreCase("allinpay", payType)) {
					logger.error("allinpay  通联支付");
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "allinpay", "通联支付" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4allinpay(paylog, order, member, orderItem, model);

				} else if (StringUtils.equalsIgnoreCase("chinaumspay", payType)) {
					logger.error("chinaumspay  全民付");
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "chinaumspay", "全民付" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4chinaumspay(paylog, order, member, orderItem, model);

				} else if (StringUtils.equalsIgnoreCase("alipay", payType)) {
					logger.error("alipay  支付宝");
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "alipay", "支付宝" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4alipay(paylog, order, member, orderItem, model,request,response);

				} else if (StringUtils.equalsIgnoreCase("unionpay", payType)) {
					logger.error("unionpay  银联支付");
					String type = request.getParameter(Global.WHICHCLIENT);
					if(Global.WHICH_APP.equals(type)){
						model.addAttribute(Global.WHICHCLIENT, Global.WHICH_APP);
					}

					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "unionpay", "银联支付" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4unionpay(paylog, order, member, orderItem, model);

				} else if (StringUtils.equalsIgnoreCase("icbcb2c", payType)) {
					logger.error("icbcpay  工行B2C支付");
					String type = request.getParameter(Global.WHICHCLIENT);
					if(Global.WHICH_APP.equals(type)){
						model.addAttribute(Global.WHICHCLIENT, Global.WHICH_APP);
					}

					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "icbcb2bpay", "工行B2C支付" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4icbcB2CPay(paylog, order, member, orderItem, model, getIpAddr(request));

				}  else if (StringUtils.equalsIgnoreCase("icbcb2b", payType)) {
					logger.error("icbcpay  工行B2B支付");
					String type = request.getParameter(Global.WHICHCLIENT);
					if(Global.WHICH_APP.equals(type)){
						model.addAttribute(Global.WHICHCLIENT, Global.WHICH_APP);
					}

					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
					paylog = savePaylog(member,order,payAmount, "icbcb2cpay", "工行B2B支付" );
					/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4icbcB2BPay(paylog, order, member, orderItem, model);

				} else {
					payType = "type_error";
					logger.error("系统不支持所选支付类型[" + payType + "]");
				}
				/*-------------------由于银联支付测试服务期不稳定，以下注视代码为测试使用，提交SVN要注意----------------------*/
				/*
				//更新订单状态
				updateOrderStatusAndRedirect(order.getOrderSn(), request, response);
				//解冻金额
				if(1 == order.getOrderType()){
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("tenantId", getTenantId());
					params.put("userId", order.getMemberId());
					params.put("platform", getPlatform());
					Account acct = accountService.findAccountByUser(params);

					params = new HashMap<String, Object>();
					params.put("tenantId", getTenantId());
					params.put("platform", getPlatform());
					params.put("userId", order.getMemberId());
					params.put("accountId", acct.getId());
					params.put("orderSn", order.getOrderSn());
					params.put("payMethod", 2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)

					AccountLog acctLog = accountLogService.getByOrderSn(params, false);
					Account account = new Account();
					account.setId(acct.getId());
					account.setAccountTotal(0.0);
					account.setAccountBlock(acctLog.getAccount() * (-1));


					AccountLog accountLog = new AccountLog();
					accountLog.setUserId(acctLog.getUserId());
					accountLog.setAccountId(acctLog.getAccountId());
					accountLog.setBuyUsername(acctLog.getBuyUsername());
					accountLog.setBuyRealname(acctLog.getBuyRealname());
					accountLog.setOrderSn(order.getOrderSn());
					accountLog.setPayMethod(2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
					accountLog.setSellerId(acctLog.getSellerId());
					accountLog.setSellerUsername(acctLog.getSellerUsername());
					accountLog.setAccount(acctLog.getAccount() * (-1));
					accountLog.setFeeAccount(0.0);//手续费
					accountLog.setOldAccountTotal(acct.getAccountTotal());
					accountLog.setOldAccountBlock(acct.getAccountBlock());
					accountLog.setStatus(1);
					accountLog.setCreateUser("unionpay");
					accountLog.setCreateDate(DateUtil.getCalendar().getTime());
					accountService.unblock(getParamMap(), account, accountLog, false);
				}*/
				/*-------------------由于银联支付测试服务期不稳定，以下注视代码为测试使用，提交SVN要注意----------------------*/

				/***屏蔽多个订单支付，此功能没实现 TIanYu 2016-2-26 16:53:33 Start**/
				break;
				/***屏蔽多个订单支付，此功能没实现 TIanYu 2016-2-26 16:53:33 end **/
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))
				&& StringUtils.equalsIgnoreCase("unionpay", payType)){
			return Global.TEMPLATE_APP + PATH + "/payment_" + payType;
		}
		return Global.TEMPLATE_MALL + PATH + "/member/payment_" + payType;


		/**屏蔽在线支付问题  暂时不通过支付方式，直接就默认支付成功  xsy 2015-05-26 11:54:10    begin---------------------**/

/*
		String redirectURL = "";//"redirect:/order/view/" + order.getId() + ".html";
		if (orders == null || orders.isEmpty() ) {
			redirectURL = "redirect:/order/error/" + orderSn;
		}else if( orders.size() == 1 ){
			redirectURL = "redirect:/order/view/" + orders.get(0).getId() + ".html";
		}else{
			redirectURL = "redirect:/order/list";
		}
		return redirectURL;
*/
		/***屏蔽在线支付问题  暂时不通过支付方式，直接就默认支付成功  xsy 2015-05-26 11:54:10    end---------------------  **/


	}

	/**
	 * 保存支付日志
	 * @param member
	 * @param order
	 * @param payAmount
	 * @param payType
	 * @param payTypeName
	 * @return
	 * @throws Exception
	 */
	private OrderPaylog savePaylog( Buyer member, Order order, Double payAmount,String payType,String payTypeName) throws Exception{
		/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 Start ---------------------**/
		OrderPaylog paylog = new OrderPaylog();
		paylog.setTenantId(getTenantId());
		paylog.setMemberId(member.getId());
		paylog.setOrderSn(order.getOrderSn());
		paylog.setSign(payType);
		paylog.setName(payType);
		paylog.setAmount(payAmount);
		paylog.setPayDate(DateUtils.getCurrDatetime());
		paylog.setStatus("false");
		paylog.setInfo(payTypeName+"支付");
		paylog.setCreateUser(member.getUserName());
		paylog.setCreateDate(new Date());

		paylog = this.orderPaylogService.save(getParamMap(), paylog);

		return paylog;
		/**----------- 实现多次支付，先保存支付日志，支付时 使用支付日志主键作为交易订单号使用 支付日志ID TianYu 2016-04-25 09:54:28 End ---------------------**/
	}

	/**
	 * 弹出层,等待支付
	 */
	@RequestMapping(value = "popupconfirm")
	public String popupConfirm(Model model) {
		String info = "弹出层,等待支付完成...";
		setLogInfo(info);
		model.addAttribute("1", "1");
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/member/payment_confirm_popup";
	}

	@RequestMapping(value = "allinpayQuery")
	public String query(String orderSn, Model model) {
		String info = "订单[" + orderSn + "]查询";
		setLogInfo(info);
		logger.debug(info);
		String tenantId = getTenantId();
		try {
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);

			String serverUrl = "http://ceshi.allinpay.com/gateway/index.do";
			String merchantId = "100020091218001";
			String version = "v1.5";
			int signType = 1;
			String orderDatetime = DateUtils.format(order.getCreateDate(), DateUtils.DATETIME_FORMAT);
			String queryDatetime = DateUtils.getCurrDatetime();

			// 组装签名字符串
			StringBuffer bufSignSrc = new StringBuffer();
			StringUtil.appendSignPara(bufSignSrc, "merchantId", merchantId);
			StringUtil.appendSignPara(bufSignSrc, "version", version);
			StringUtil.appendSignPara(bufSignSrc, "signType", signType + "");
			StringUtil.appendSignPara(bufSignSrc, "orderNo", orderSn);
			StringUtil.appendSignPara(bufSignSrc, "orderDatetime", orderDatetime);
			StringUtil.appendSignPara(bufSignSrc, "queryDatetime", queryDatetime);
			StringUtil.appendLastSignPara(bufSignSrc, "key", "1234567890");
			String signMsg = SecurityUtil.MD5Encode(bufSignSrc.toString());

			model.addAttribute("serverUrl", serverUrl);
			model.addAttribute("merchantId", merchantId);
			model.addAttribute("version", version);
			model.addAttribute("signType", signType);
			model.addAttribute("orderNo", orderSn);
			model.addAttribute("orderDatetime", orderDatetime);
			model.addAttribute("queryDatetime", queryDatetime);
			model.addAttribute("signMsg", signMsg);
			model.addAttribute("key", 1234567890);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return "redirect:allinpayOrderQuery.jsp";
	}

	@RequestMapping("tlreceive")
	@ResponseBody
	public String tlReceive(HttpServletRequest request, HttpServletResponse response) {

		return this.receive(request, response);
	}

	/**
	 * 通联支付 支付成功之后-->后台通知处理，异步通知
	 */
	@RequestMapping("receive")
	@ResponseBody
	public String receive(HttpServletRequest request, HttpServletResponse response) {
		String info = "通联支付，支付成功之后。异步通知，处理支付网管返回的支付结果";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		try {
			// 异步通知，接收通联网管返回的支付结果
			String merchantId = request.getParameter("merchantId");
			String version = request.getParameter("version");
			String language = request.getParameter("language");
			String signType = request.getParameter("signType");
			String payType = request.getParameter("payType");
			String issuerId = request.getParameter("issuerId");
			String paymentOrderId = request.getParameter("paymentOrderId");
			String orderNo = request.getParameter("orderNo");
			String orderDatetime = request.getParameter("orderDatetime");
			String orderAmount = request.getParameter("orderAmount");
			String payDatetime = request.getParameter("payDatetime");
			String payAmount = request.getParameter("payAmount");
			String ext1 = request.getParameter("ext1");
			String ext2 = request.getParameter("ext2");
			String payResult = request.getParameter("payResult");
			String errorCode = request.getParameter("errorCode");
			String returnDatetime = request.getParameter("returnDatetime");
			String signMsg = request.getParameter("signMsg");

			// 验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			// 构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);
			// signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg);
			// signType为"1"时，必须设置证书路径。
			paymentResult.setCertPath(request.getServletContext().getRealPath("WEB-INF/cert/TLCert-test.cer"));
			paymentResult.setKey("1234567890");

			// 验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();

			logger.error("B2B支付成功：＝＝＝＝＝＝＝＝＝＝" + JSON.toJSONString(paymentResult));

			logger.error(info + "  验证签名:" + verifyResult);

			// 验签成功，还需要判断订单状态，为"1"表示支付成功。
			paySuccess = verifyResult && payResult.equals("1");
			if (paySuccess) {

				/*** 添加合并支付，合并支付时更具mergeOrderSn更新一批订单  TianYu 2016-06-17 14:00:04 Start **/
				if("merge".equals( ext1 )){
					mergeOrderUpdateOrderAndPaylog(orderNo, paymentOrderId,"通联支付", request, response);
				}
				/*** 添加合并支付，合并支付时更具mergeOrderSn更新一批订单  TianYu 2016-06-17 14:00:04 End **/

				else {
					// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
					// 配送状态：unshipped）
					OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), orderNo);

					if ( paylog == null  ){
						paySuccess = false;
						logger.error(info + "时，发生异常:查询不到支付日志");
					}else {
						if (!"true".equals(paylog.getStatus())) {

							Order order = orderService.find(getParamMap(), "orderSn", paylog.getOrderSn());
//							updateOrderStatusAndRedirect(paylog.getOrderSn(), request, response);

							paylog.setName("通联支付");
							paylog.setStatus("true");
							paylog.setInfo("支付成功");
							paylog.setPayDate(DateUtil.dateToString(new Date(), "yyyyMMddHHmmss"));
							paylog.setModifyUser("system");
							paylog.setModifyDate(new Date());
							paylog.setUniqueno(paymentOrderId);
							paylog.setInfo("通联支付成功");
							this.orderPaylogService.update(getParamMap(), paylog);

							//3、获取累计支付金额
							Double paidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), paylog.getOrderSn(),null);

							/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 Start*/
							if( paidAmountTotal.equals(order.getDepositMoney()) && 1 == order.getOrderType() && Order.OrderStatus.wait_buyer_pay_deposit.equals(order.getOrderStatus()) ){
								//处理众筹订单定金支付 TianYu 2016-12-06 17:32:25
								updateOrderFromWaitPayDeposit(order);
							}
							/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 End*/

							//4、如果 支付总金额 == 订单总额，更新订单的状态
							else if (paidAmountTotal.equals(order.getTotalAmount())) {
								if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {

									order = updateOrderStatusAndRedirect(paylog.getOrderSn(), request, response);

									//给商家发短信 TianYu 2016-04-27 08:43:46
									sendSMS(order.getOrderSn(), order.getShopId());
								}
							}

							setLogInfo("订单【" + order.getOrderSn() + "】支付成功");
							logger.error("订单【" + order.getOrderSn() + "】支付成功");

							/*if (order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus()) && !Order.PaymentStatus.paid.equals(order.getPaymentStatus())) {
								//给商家发短信 TianYu 2016-04-27 08:43:46
								sendSMS(order.getOrderSn(), order.getShopId());
							}*/
						}
					}
				}
			}
		} catch (Exception e) {
			paySuccess = false;
			logger.error(info + "时，发生异常", e);
		}

		return ajaxText("" + paySuccess, response);
	}

	/**
	 * 通联支付 - 同步通知
	 */
	@RequestMapping("allinpayPickup")
	public String allinpayPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "通联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		String orderId = null;
		String orderSn = null;
		Order order = null;
		try {

			String merchantId = request.getParameter("merchantId");
			String version = request.getParameter("version");
			String language = request.getParameter("language");
			String signType = request.getParameter("signType");
			String payType = request.getParameter("payType");
			String issuerId = request.getParameter("issuerId");
			String paymentOrderId = request.getParameter("paymentOrderId");
			String orderNo = request.getParameter("orderNo");
			String orderDatetime = request.getParameter("orderDatetime");
			String orderAmount = request.getParameter("orderAmount");
			String payDatetime = request.getParameter("payDatetime");
			String payAmount = request.getParameter("payAmount");
			String ext1 = request.getParameter("ext1");
			String ext2 = request.getParameter("ext2");
			String payResult = request.getParameter("payResult");
			String errorCode = request.getParameter("errorCode");
			String returnDatetime = request.getParameter("returnDatetime");
			String signMsg = request.getParameter("signMsg");

			// 验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			// 构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);
			paymentResult.setKey("1234567890");
			// signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg);
			// signType为"1"时，必须设置证书路径。
			//paymentResult.setCertPath(request.getServletContext().getRealPath("WEB-INF/cert/TLCert-test.cer"));

			// 验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();

			// 验签成功，还需要判断订单状态，为"1"表示支付成功。
			paySuccess = verifyResult && payResult.equals("1");
			logger.error("B2B支付成功：＝＝＝＝＝＝＝＝＝＝" + JSON.toJSONString(paymentResult));


			if (paySuccess) {
				/*** 添加合并支付，合并支付时更具mergeOrderSn更新一批订单  TianYu 2016-06-17 14:00:04 Start **/
				if("merge".equals( ext1 )){

					mergeOrderUpdateOrderAndPaylog(orderNo, paymentOrderId," 通联支付", request, response);

				}
				/*** 添加合并支付，合并支付时更具mergeOrderSn更新一批订单  TianYu 2016-06-17 14:00:04 End **/
				else {

					OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), orderNo);

					if( paylog != null && !"true".equals(paylog.getStatus())) {
						orderSn = paylog.getOrderSn();
						order = orderService.find(getParamMap(), "orderSn", orderSn);

//						updateOrderStatusAndRedirect(paylog.getOrderSn(), request, response);

						paylog.setName("通联支付");
						paylog.setStatus("true");
						paylog.setInfo("支付成功");
						paylog.setPayDate(DateUtil.dateToString(new Date(), "yyyyMMddHHmmss"));
						paylog.setModifyUser("system");
						paylog.setModifyDate(new Date());
						paylog.setUniqueno(paymentOrderId);
						paylog.setInfo("通联支付成功");
						this.orderPaylogService.update(getParamMap(), paylog);

						//3、获取累计支付金额
						Double paidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), paylog.getOrderSn(),null);

						/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 Start*/
						if( paidAmountTotal.equals(order.getDepositMoney()) && 1 == order.getOrderType() && Order.OrderStatus.wait_buyer_pay_deposit.equals(order.getOrderStatus()) ){
							//处理众筹订单定金支付 TianYu 2016-12-06 17:32:25
							updateOrderFromWaitPayDeposit(order);
						}
						/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 End*/

						//4、如果 支付总金额 == 订单总额，更新订单的状态
						else if (paidAmountTotal.equals(order.getTotalAmount())) {
							if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {

								order = updateOrderStatusAndRedirect(paylog.getOrderSn(), request, response);

								//给商家发短信 TianYu 2016-04-27 08:43:46
								sendSMS(order.getOrderSn(), order.getShopId());
							}
						}

						setLogInfo("订单【" + order.getOrderSn() + "】支付成功");
						logger.error("订单【" + order.getOrderSn() + "】支付成功");

					}
				}
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		String redirectURL = "redirect:/order/view/" + orderId + ".html";
		if (StringUtils.isEmpty(orderId)) {
			redirectURL = "redirect:/order/list.html?orderType_=0";
		}
		return redirectURL;
	}

	/**
	 * 合并订单批量更新订单的主状态和支付状态，更新支付日志表的 支付成功 状态
	 * @param orderSn
	 * @param paymentOrderId
	 * @param request
	 * @param response
     */
	private void mergeOrderUpdateOrderAndPaylog(String orderSn, String paymentOrderId,String payType ,HttpServletRequest request, HttpServletResponse response) throws  Exception{
		List<OrderPaylog> orderPaylogList = this.orderPaylogService.findList(getParamMap(), "mergeOrderSn", orderSn);
		if(orderPaylogList != null && orderPaylogList.size() > 0){
			for(OrderPaylog paylog : orderPaylogList){
				Order order = this.orderService.find(getParamMap(),"orderSn", paylog.getOrderSn());
				//更新订单状态
				updateOrderStatusAndRedirect(order.getOrderSn(), request, response);

//				paylog.setName(payType);
				paylog.setStatus("true");
				paylog.setInfo("支付成功");
				paylog.setModifyUser("system");
				paylog.setModifyDate(new Date());
				paylog.setUniqueno(paymentOrderId);
				this.orderPaylogService.update(getParamMap(), paylog);
				if (order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus()) && !Order.PaymentStatus.paid.equals(order.getPaymentStatus())) {
					//给商家发短信 TianYu 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());
				}
			}
		}
	}


	/**
	 * 更新订单状态并重定向到订单详细页
	 */
	private Order updateOrderStatusAndRedirect(String orderNo, HttpServletRequest request, HttpServletResponse response) {
		Order order = null;
		Order newOrder = null;
		try {
			// 1、先查看该订单状态是否已经更新成了wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped
			order = orderService.find(getParamMap(), "orderSn", orderNo);

			//处理众筹订单定金支付 TianYu 2016-12-06 17:32:25
//			updateOrderFromWaitPayDeposit(order);

			if (order != null && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) {
				// 更新订单各种状态（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）
				newOrder = orderService.orderPaidSuccess(getParamMap(), orderNo);

				/*
				 * 20160607 dzz
				 * 众筹订单, 解冻众筹订单冻结金额
				 * 计算公式:
				 * 可用金额 = 账户可用金额 + 解冻金额
				 * 冻结金额 = 冻结金额 - 需解冻金额
				 */
				/*if(order.getOrderType()!=null && !"".equals(order.getOrderType())) {
					if("1".equals(order.getOrderType())) { //众筹订单
						unlockAccountOfZhongChou(orderNo, order, request, response);
					}
				}*/
			}
		} catch (Exception e) {
			logger.error("更新订单:" + orderNo + "失败!");
		}

		return newOrder;
	}

	/**
	 * 银联支付
	 * 
	 * @param payLog 支付日志
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            商品清单(只取了订单中的第一个商品)
	 * @param model
	 * 
	 *            注：测试商户号: 777290058118694 测试MD5 key: 1234567890
	 *            <p/>
	 *            商户可以到测试商户服务平台查询交易: 访问地址:
	 *            https://101.231.204.80:5000/gateway/api/frontTransReq.do
	 *            商户号:
	 *            777290058118694 操作员ID: admin 密码: 1111111!
	 *            <p/>
	 * @throws Exception
	 *
	 * Version 2 TianYu 2016-2-26 17:04:44
	 * 实现多次支付功能，使用支付日志的ID作为和银行交互的订单号
	 */
	private void getPayData4unionpay(OrderPaylog payLog, Order order, Buyer member, OrderItem orderItem, Model model) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://192.168.0.28:8080/bec/";


		String frontUrl = becShopUrl + "payment/unionpayFront";// 页面通知地址
		String backUrl = becShopUrl + "payment/unionpayBack";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
			backUrl += "?whichclient=whichapp";// 后台通知地址
			/*if (1 == order.getOrderType()){
				frontUrl += "&orderTpye=1";// 页面通知地址
				backUrl += "&orderTpye=1";// 后台通知地址
			}*/

		}

		// 构造订单请求对象，生成signMsg。
		/*com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
		requestOrder.setFrontUrl(frontUrl);
		requestOrder.setBackUrl(backUrl);
		requestOrder.setOrderId(order.getOrderSn());
		requestOrder.setTxnAmt( Math.round(order.getTotalAmount() * 100)+"" );
		requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));

		model.addAttribute("requestOrder", UnionpayUtil.signData(requestOrder));*/
		UnionpayUtil.pay(payLog.getId(), Math.round(payLog.getAmount() * 100) + "", frontUrl, backUrl, model);
	}

	/**
	 * 工行B2B支付
	 * yanchao 2016-6-16 14:13:35
	 */
	private void getPayData4icbcB2BPay(OrderPaylog payLog, Order order, Buyer member, OrderItem orderItem, Model model) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://www.ghj168.com/";
		String frontUrl = becShopUrl + "payment/unionpayFront";// 页面通知地址
		String backUrl = becShopUrl + "payment/icbcb2bPickup";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
		}

		model.addAttribute("APIName", "B2B");//固定值“B2B”
		model.addAttribute("APIVersion","001.001.001.001");//
		model.addAttribute("Shop_code",ICBCConst.b2b_shopCode);//商户的代码
		model.addAttribute("MerchantURL",backUrl);//通知接口
		model.addAttribute("ContractNo", payLog.getId());//订单编号
		model.addAttribute("ContractAmt", order.getTotalAmount());//订单总额
		model.addAttribute("Account_cur", "001");//货币单位
		model.addAttribute("JoinFlag", "2");
		model.addAttribute("Mer_Icbc20_signstr","");
		model.addAttribute("Cert","");
		model.addAttribute("SendType",1);
//		Calendar cal = Calendar.getInstance();
		//调整与工行接口服务器的时间差
		//cal.add(Calendar.DATE,10);
		model.addAttribute("TranTime",DateUtils.dateToString(new Date(),"yyyyMMddHHmmss"));
		model.addAttribute("Shop_acc_num", ICBCConst.b2b_shopCode);
		model.addAttribute("PayeeAcct", ICBCConst.b2b_account);
		model.addAttribute("GoodsCode", orderItem.getGoodsId());
		model.addAttribute("GoodsName", orderItem.getGoodsName());
		model.addAttribute("Amount", orderItem.getQuantity());
		model.addAttribute("TransFee", orderItem.getFreight());
		model.addAttribute("ShopRemark", "");//商城提示
		model.addAttribute("ShopRem", "");//商城备注字段
		model.addAttribute("PayeeName","");//收款人名称

		CBCPayOnline.mer_Icbc20_signstr(model);

		model.addAttribute("serverUrl", ICBCConst.b2b_serverUrl);

	}

	/**
	 * 工行B2C支付
	 * yanchao 2016-6-16 14:13:35
	 */
	private void getPayData4icbcB2CPay(OrderPaylog payLog, Order order, Buyer member, OrderItem orderItem, Model model, String ip) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://www.ghj168.com/";
		String frontUrl = becShopUrl + "payment/icbcb2cPickup";// 页面通知地址
		String backUrl = becShopUrl + "payment/icbcpayPickup";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
		}

		TranData tranData = new TranData();
		OrderInfo orderInfo = tranData.getOrderInfo();
		//商户ID
		orderInfo.setMerID(ICBCConst.b2c_shopCode);
//		Calendar cal = Calendar.getInstance();
		//调整与工行接口服务器的时间差
//		cal.add(Calendar.MINUTE,-2);
//		orderInfo.setOrderDate(DateUtils.dateToString(cal.getTime(),"yyyyMMddHHmmss"));
		orderInfo.setOrderDate(DateUtils.dateToString(new Date(),"yyyyMMddHHmmss"));

		SubOrderInfo subInfo = new SubOrderInfo();
		subInfo.setOrderid(payLog.getId());
		subInfo.setAmount( Math.round(payLog.getAmount() * 100) + "");
		subInfo.setGoodsName(orderItem.getGoodsName());
		subInfo.setGoodsNum(orderItem.getQuantity() + "");
		subInfo.setGoodsID(orderItem.getGoodsId());
		subInfo.setMerAcct(ICBCConst.b2c_account);
		subInfo.setCarriageAmt("100");

		orderInfo.addSubOrderInfo(subInfo);

		Message message = tranData.getMessage();
//		message.setMerReference("*.yanchao.ngrok.cc");
		message.setMerReference(becShopUrl);
		//message.setMerCustomIp("222.90.72.81");
		message.setMerCustomID(member.getUserName());
		//message.setMerReference();
		message.setMerURL(frontUrl);

		ICBC icbc = CBCPayOnline.getBase64ICBC(tranData);
		model.addAllAttributes(JSON.parseObject(JSON.toJSONString(icbc)));
		model.addAttribute("serverUrl", ICBCConst.b2c_serverUrl);
	}

	/**
	 * 工行B2C支付回调接口
	 * yanchao 2016-6-16 14:13:35
	 */
	@RequestMapping("icbcb2cPickup")
	public String icbcb2cPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "工行B2C支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);
		String orderId = null;
		String orderSn = null;
		Order order = null;
		try {
			String base64 = request.getParameter("notifyData").trim();
			String merVAR = request.getParameter("merVAR");
			String signMsg = request.getParameter("signMsg").trim();

			//验证签名：返回true代表验签成功；否则验签失败。
			if (!CBCPayOnline.verifyNotify(base64, signMsg)) {
				NotifyData notifyData = CBCPayOnline.getNotifyData(base64);
				if ("1".equals(notifyData.getBank().getTranStat())) {
					logger.info("ICBC_B2C支付成功：＝＝＝＝＝＝＝＝＝＝" + base64);
					SubOrderInfo subOrderInfo = (SubOrderInfo) notifyData.getOrderInfo().getSubOrderInfoList().get(0);
					orderId = subOrderInfo.getOrderid();
					if("merge".equals(merVAR)){

						mergeOrderUpdateOrderAndPaylog(orderId, notifyData.getBank().getTranBatchNo(), "工行B2C支付", request, response);

					} else {

						OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), orderId);
						orderSn = paylog.getOrderSn();
						order = orderService.find(getParamMap(), "orderSn", orderSn);
						orderId = order.getId();

						updateOrderStatusAndRedirect(orderId, request, response);

						paylog.setName("ICBC_B2C支付");
						paylog.setStatus("true");
						paylog.setInfo("支付成功");
						paylog.setCreateUser("system");
						paylog.setCreateDate(new Date());
						paylog.setUniqueno(notifyData.getBank().getTranBatchNo());
						this.orderPaylogService.update(getParamMap(), paylog);
						if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {
							//给商家发短信 TianYu 2016-04-27 08:43:46
							sendSMS(order.getOrderSn(), order.getShopId());
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return "";
	}

	/**
	 * 工行B2B支付回调接口
	 * yanchao 2016-6-16 14:13:35
	 */
	@RequestMapping("icbcb2bPickup")
	public String icbcb2bPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "工行支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);
		try {
			//交易成功标识
			//验证签名：返回true代表验签成功；否则验签失败。
			if ("0".equals(request.getParameter("PayStatusZHCN")) && CBCPayOnline.verifyB2BNotify(request)) {

				String shopRem =  request.getParameter("shopRem");
				String orderId = request.getParameter("ContractNo");

				logger.info("ICBC_B2C支付成功：＝＝＝＝＝＝＝＝＝＝" );
				if("merge".equals( shopRem )){
					mergeOrderUpdateOrderAndPaylog(orderId, "", "工行B2C支付", request, response);
				} else {
					OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), orderId);
					String orderSn = paylog.getOrderSn();
					Order order = orderService.find(getParamMap(), "orderSn", orderSn);

					updateOrderStatusAndRedirect(orderSn, request, response);

					paylog.setName("ICBC_B2C支付");
					paylog.setStatus("true");
					paylog.setInfo("支付成功");
					paylog.setCreateUser("system");
					paylog.setCreateDate(new Date());
					paylog.setUniqueno("");
					this.orderPaylogService.update(getParamMap(), paylog);
					if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {
						//给商家发短信 TianYu 2016-04-27 08:43:46
						sendSMS(order.getOrderSn(), order.getShopId());
					}
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return "";
	}


	@RequestMapping(value = "/app/unionpay")
	public
	@ResponseBody
	Object appUnionpay(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String info = "银联APP支付";
		setLogInfo(info);

		Map map = new HashMap();
		try {

			String orderSn = request.getParameter("orderSn");
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if( order == null ){
				map.put(SUCCESS,Boolean.FALSE);
				map.put(DATA,"订单不存在");
                return map;
			}
			String total_fee = request.getParameter("total");//付款金额

			double totalAmount = Double.valueOf(total_fee);
            Buyer member = getCurrentMember(request);
            OrderPaylog paylog = this.savePaylog(member, order, totalAmount, "unionpay", "银联支付" );

			String shopUrl = getShopUrl();
			String frontUrl = shopUrl + "/html/paysuccess.html";// 页面通知地址
			String backUrl = shopUrl + "payment/unionpayBack?whichclient=whichapp";// 后台通知地址
			// 构造订单请求对象，生成signMsg。
			com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
			requestOrder.setFrontUrl(frontUrl);
			requestOrder.setBackUrl(backUrl);
			requestOrder.setOrderId(paylog.getId());//采用PayLog.ID
			requestOrder.setTxnAmt( Math.round(totalAmount * 100) + "" );
			requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));
			Map signedMap = UnionpayUtil.signData(requestOrder);
			logger.info(signedMap.toString());

			String actionUrl = requestOrder.getRequestUrl();

			Map params = net.deepdragon.util.StringUtil.beanToMap(requestOrder);
			params.remove("requestUrl");
			String html = UnionpayUtil.createHtml(actionUrl, params);

			logger.info(html);

			map.put(SUCCESS,Boolean.TRUE);
			map.put("html",html);

		} catch (Exception e) {
			map.put(SUCCESS,Boolean.FALSE);
			map.put(DATA,e);
			logger.error(info + "时，发生异常", e);
		}
		return map;

	}

	private String getShopUrl() throws Exception {
		String shopUrl = null;
		try {
            shopUrl = systemSetService.find(getParamMap(), "setkey", "becShopUrl").getSetvalue();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (StringUtils.isEmpty(shopUrl)) {
                throw new Exception("获取系统配置[becShopUrl]失败，请检查系统配置项！");
            }
        }
		return shopUrl;
	}
	/**
	 * 银联支付
	 * 后台通知地址
	 * version 2 TianYu 2016-2-26 17:12:26
	 * 1、实现多次支付，与银行交互的订单号为支付日志ID
	 * 2、更新支付日志的支付状态 status = true
	 * 3、比较支付总额和订单总额，如果相等，更新订单状态；如果不相等，不对订单做处理
	 */
	@RequestMapping("unionpayBack")
	@ResponseBody
	public String unionpayBack(HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，支付成功之后。异步通知，处理支付网管返回的支付结果";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		try {
			Map<String, String> respData = UnionpayUtil.resp2Map(request);
			paySuccess = UnionpayUtil.validateResposon(respData);
			if (paySuccess) {
				// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）valideData.get("queryId"),
				//1、查询支付日志
				OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), respData.get("orderId"));

				if( paylog != null && !"true".equals(paylog.getStatus())){

					//2、更新支付日志状态
					paylog.setAmount(Double.parseDouble(respData.get("txnAmt"))/100);
					paylog.setNo(respData.get("accNo"));
					paylog.setUniqueno(respData.get("queryId"));
					paylog.setStatus("true");
					paylog.setPayDate(respData.get("txnTime"));
					paylog.setModifyDate(new Date());
					paylog.setModifyUser("unionpay");
					paylog.setInfo("unionpay支付成功");
					this.orderPaylogService.update(getParamMap(), paylog);


					//3、获取累计支付金额
					Double paidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), paylog.getOrderSn(), null);

					Order order = orderService.find(getParamMap(), "orderSn", paylog.getOrderSn());

					/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 Start*/
					if( paidAmountTotal.equals(order.getDepositMoney()) && 1 == order.getOrderType() && Order.OrderStatus.wait_buyer_pay_deposit.equals(order.getOrderStatus()) ){
						//处理众筹订单定金支付 TianYu 2016-12-06 17:32:25
						updateOrderFromWaitPayDeposit(order);
					}
					/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 End*/

					//4、如果 支付总金额 == 订单总额，更新订单的状态
					else if( paidAmountTotal.equals( order.getTotalAmount() ) ){
						if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {
							order = updateOrderStatusAndRedirect( paylog.getOrderSn(), request, response);

							//给商家发短信 TianYu 2016-04-27 08:43:46
							sendSMS(order.getOrderSn(), order.getShopId());
						}
					}

					//组装订单支付记录
					/*OrderPaylog paylog = new OrderPaylog(order, respData, OrderPaylog.SIGN_PAY, "订单支付", "支付成功");
					paylog.setCreateUser("system");
					paylog.setCreateDate( new Date() );
					//保存订单支付记录
					this.orderPaylogService.save(getParamMap(), paylog);*/
					setLogInfo("订单【" + respData.get("orderId") + "】支付成功");
					logger.error("订单【" + respData.get("orderId") + "】支付成功");

                    /*if(1 == order.getOrderType()){
                        Map<String, Object> params = new HashMap<String, Object>();
                        params.put("tenantId", getTenantId());
                        params.put("userId", order.getMemberId());
                        params.put("platform", getPlatform());
                        Account acct = accountService.findAccountByUser(params);

                        params = new HashMap<String, Object>();
                        params.put("tenantId", getTenantId());
                        params.put("platform", getPlatform());
                        params.put("userId", order.getMemberId());
                        params.put("accountId", acct.getId());
                        params.put("orderSn", order.getOrderSn());
                        params.put("payMethod", 1);//交易类型(0:充值 1:冻结 2：解冻 3：提现)

                        AccountLog acctLog = accountLogService.getByOrderSn(params, false);
                        Account account = new Account();
                        account.setId(acct.getId());
                        account.setAccountTotal(0.0);
                        account.setAccountBlock(acctLog.getAccount() * (-1));


                        AccountLog accountLog = new AccountLog();
                        accountLog.setUserId(acctLog.getUserId());
                        accountLog.setAccountId(acctLog.getAccountId());
                        accountLog.setBuyUsername(acctLog.getBuyUsername());
                        accountLog.setBuyRealname(acctLog.getBuyRealname());
                        accountLog.setOrderSn(order.getOrderSn());
						accountLog.setPayMethod(2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
						accountLog.setSellerId(acctLog.getSellerId());
                        accountLog.setSellerUsername(acctLog.getSellerUsername());
                        accountLog.setAccount(acctLog.getAccount() * (-1));
                        accountLog.setFeeAccount(0.0);//手续费
                        accountLog.setOldAccountTotal(acct.getAccountTotal());
                        accountLog.setOldAccountBlock(acct.getAccountBlock());
                        accountLog.setStatus(1);
                        accountLog.setCreateUser("unionpay");
                        accountLog.setCreateDate(DateUtil.getCalendar().getTime());
                        accountService.unblock(getParamMap(), account, accountLog, false);
                    }*/
                }
			}
		} catch (Exception e) {
			paySuccess = false;
			logger.error(info + "时，发生异常", e);
			response.setStatus(250);//仅当POST返回码为200时，才认为商户已经成功收到并且能正确解析后台通知
		}
		response.setStatus(200);

		return ajaxText("" + paySuccess, response);
	}

	/**
	 * 银联支付 - 页面通知地址
	 */
	@RequestMapping("unionpayFront")
	public String unionpayFront(HttpServletRequest request, HttpServletResponse response) {
		String info = "通联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderId") + "]";
		setLogInfo(info);
		logger.error(info);

		String orderId = null;
		String orderSn = null;
		Order order = null;
		String type = request.getParameter(Global.WHICHCLIENT);
		try {

			Map<String, String> valideData = UnionpayUtil.resp2Map(request);
			if (!UnionpayUtil.validateResposon(valideData)) {
				LogUtil.writeLog("验证签名结果[失败].");
			} else {
				//验证成功

				//1、查询支付日志
				OrderPaylog paylog = this.orderPaylogService.get(getParamMap(), valideData.get("orderId"));

				if (paylog != null && !"true".equals(paylog.getStatus())) {
					orderSn = paylog.getOrderSn();

					order = orderService.find(getParamMap(), "orderSn", orderSn);

					logger.error("orderSn:" + orderSn + ",order:" + order);
					if (order != null) {
						orderId = order.getId();
					}

					//2、更新支付日志状态
					paylog.setAmount(Double.parseDouble(valideData.get("txnAmt"))/100);
					paylog.setNo(valideData.get("accNo"));
					paylog.setUniqueno(valideData.get("queryId"));
					paylog.setStatus("true");
					paylog.setPayDate(valideData.get("txnTime"));
					paylog.setModifyDate(new Date());
					paylog.setModifyUser("unionpay");
					paylog.setInfo("unionpay支付成功");
					this.orderPaylogService.update(getParamMap(), paylog);

					//3、获取累计支付金额
					Double paidAmountTotal = this.orderPaylogService.getPaidAmountTotalByOrderSn(getParamMap(), paylog.getOrderSn(),null);

					/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 Start*/
					if( paidAmountTotal.equals(order.getDepositMoney()) && 1 == order.getOrderType() && Order.OrderStatus.wait_buyer_pay_deposit.equals(order.getOrderStatus()) ){
						//处理众筹订单定金支付 TianYu 2016-12-06 17:32:25
						updateOrderFromWaitPayDeposit(order);
					}
					/** 累计支付等于定金金额 且 为众筹订单 且 订单状态为“等待买家支付定金”  TianYu 2016-12-06 17:43:49 End*/

					//4、如果 支付总金额 == 订单总额，更新订单的状态
					else if (paidAmountTotal.equals(order.getTotalAmount())) {
						if(order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )) {

							order = updateOrderStatusAndRedirect(paylog.getOrderSn(), request, response);

							//给商家发短信 TianYu 2016-04-27 08:43:46
							sendSMS(order.getOrderSn(), order.getShopId());
						}
					}

					/*//组装订单支付记录
					OrderPaylog paylog = new OrderPaylog(order, valideData, OrderPaylog.SIGN_PAY, "订单支付", "支付成功");

					paylog.setCreateUser("system");
					paylog.setCreateDate( new Date() );

					//保存订单支付记录
					this.orderPaylogService.save(getParamMap(), paylog);*/
					setLogInfo("订单【" + valideData.get("orderId") + "】支付成功");
					logger.error("订单【" + valideData.get("orderId") + "】支付成功");

					/*if (1 == order.getOrderType()) {
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("tenantId", getTenantId());
						params.put("userId", order.getMemberId());
						params.put("platform", getPlatform());
						Account acct = accountService.findAccountByUser(params);

						params = new HashMap<String, Object>();
						params.put("tenantId", getTenantId());
						params.put("platform", getPlatform());
						params.put("userId", order.getMemberId());
						params.put("accountId", acct.getId());
						params.put("orderSn", order.getOrderSn());
						params.put("payMethod", 1);//交易类型(0:充值 1:冻结 2：解冻 3：提现)

						AccountLog acctLog = accountLogService.getByOrderSn(params, false);
						Account account = new Account();
						account.setId(acct.getId());
						account.setAccountTotal(0.0);
						account.setAccountBlock(acctLog.getAccount() * (-1));


						AccountLog accountLog = new AccountLog();
						accountLog.setUserId(acctLog.getUserId());
						accountLog.setAccountId(acctLog.getAccountId());
						accountLog.setBuyUsername(acctLog.getBuyUsername());
						accountLog.setBuyRealname(acctLog.getBuyRealname());
						accountLog.setOrderSn(order.getOrderSn());
						accountLog.setPayMethod(2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
						accountLog.setSellerId(acctLog.getSellerId());
						accountLog.setSellerUsername(acctLog.getSellerUsername());
						accountLog.setAccount(acctLog.getAccount() * (-1));
						accountLog.setFeeAccount(0.0);//手续费
						accountLog.setOldAccountTotal(acct.getAccountTotal());
						accountLog.setOldAccountBlock(acct.getAccountBlock());
						accountLog.setStatus(1);
						accountLog.setCreateUser("unionpay");
						accountLog.setCreateDate(DateUtil.getCalendar().getTime());
						accountService.unblock(getParamMap(), account, accountLog, false);
					}*/

					//如果未支付完成，跳转到支付页面
					/*if( 1 != order.getOrderType() && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods)){
						return "redirect:/payment?orderSn="+order.getOrderSn()+"&total="+order.getTotalAmount()+"&key="+order.getId();
					}*/
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		String redirectURL = "redirect:/order/view/" + orderId + ".html";
		if (StringUtils.isEmpty(orderId)) {
			redirectURL = "redirect:/order/error/" + orderSn;
		}
		if (Global.WHICH_APP.equals(type)) {
			redirectURL += "?" + Global.WHICHCLIENT + "=" + Global.WHICH_APP;
		}
		return redirectURL;
	}

	/**
	 * 银联支付
	 * 后台通知地址
	 */
	@RequestMapping("unionpayQuery")
	@ResponseBody
	public Object unionpayQuery(String orderSn, HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，通过支付订单的订单号查询订单支付情况";
		setLogInfo(info);
		logger.error(info);

		Map<String, String> result = new HashMap<String,String>();
		result.put(STATUS,SUCCESS);
		result.put(MESSAGE,"查询成功");

		boolean paySuccess = false;
		try {
			// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped）valideData.get("queryId"),
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if( order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )){
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("orderSn",orderSn));
				criteria.add(Restrictions.or(Restrictions.eq("name", "unionpay"),Restrictions.eq("sign", "unionpay")));
				criteria.add(Restrictions.order("createDate", "desc"));
				List<OrderPaylog> paylogs = orderPaylogService.getList(getParamMap(), criteria);

				if( paylogs != null && paylogs.size() > 0 && !"true".equals(paylogs.get(0).getStatus())){
					OrderPaylog paylog = paylogs.get(0);
					Map<String,String> respData = UnionpayUtil.queryOrder(paylog.getId(), DateUtils.dateToString(paylog.getCreateDate(),"yyyyMMdd010000" ), null);
					paySuccess = UnionpayUtil.validateResposon( respData );
					//respCode="00"且origRespCode="00"表示被查询交易成功。
					if (paySuccess && "00".equals( respData.get("origRespCode") ) && !"true".equals(paylog.getStatus())) {
						updateOrderStatusAndRedirect(orderSn, request, response);

						//给商家发短信 TianYu 2016-04-27 08:43:46
						sendSMS(order.getOrderSn(), order.getShopId());

						//2、更新支付日志状态
						paylog.setAmount(Double.parseDouble(respData.get("txnAmt"))/100);
						paylog.setUniqueno(respData.get("queryId"));
						paylog.setStatus("true");
						paylog.setPayDate(respData.get("txnTime"));
						paylog.setModifyDate(new Date());
						paylog.setModifyUser("system");
						paylog.setInfo("unionpay支付成功");
						this.orderPaylogService.update(getParamMap(), paylog);

						setLogInfo("order[" + respData.get("orderId") + "] query pay status success,save pay log");
						logger.error("order[" + respData.get("orderId") + "] query pay status success,save pay log");

						result.put(MESSAGE,"查询成功，交易成功");
					}

				}


			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			response.setStatus(250);//仅当POST返回码为200时，才认为商户已经成功收到并且能正确解析后台通知
			result.put(STATUS,ERROR);
			result.put(MESSAGE,info + "时，发生异常");

			return  result;
		}
		response.setStatus(200);

		return result;
	}

	/**
	 * 全民付
	 * 
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            订单项(只取了订单中的第一个商品)
	 * @param model
	 *  * Version 2 TianYu 2016-2-26 17:04:44
	 * 实现多次支付功能，使用支付日志的ID作为和银行交互的订单号
	 */
	private void getPayData4chinaumspay(OrderPaylog paylog,Order order, Buyer member, OrderItem orderItem, Model model) {
//		String orderDesc = "订单号：" + order.getId();
		// ChinaumsUtil.createOrder(order.getOrderSn(), order.getTotalAmount(),
		// "" + order);
	}
	
	/**
	 * 支付宝
	 * 
	 * @param paylog 支付日志
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            订单项(只取了订单中的第一个商品)
	 * @param model
	 *
	 *  * Version 2 TianYu 2016-2-26 17:04:44
	 * 实现多次支付功能，使用支付日志的ID作为和银行交互的订单号
	 */
	private void getPayData4alipay(OrderPaylog paylog, Order order, Buyer member, OrderItem orderItem, Model model, HttpServletRequest request,HttpServletResponse response)throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		String shopUrl = getShopUrl();
		String whichclient=request.getParameter("whichclient")==null?"":request.getParameter("whichclient");
		String service="create_direct_pay_by_user";//PC端支付地址
		//String show_url=shopUrl+"item/"+orderItem.getId()+".html";

		PrintWriter writer = response.getWriter();

		String orderNo = order.getOrderSn();						//订单编号
		//支付宝支付开始
		////////////////////////////////////请求参数//////////////////////////////////////
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", service);							//服务地址
		sParaTemp.put("partner", AlipayConfig.partner);				// 合作身份者ID，以2088开头由16位纯数字组成的字符串
		sParaTemp.put("seller_email", AlipayConfig.seller_id);	//商家支付宝账号
		sParaTemp.put("_input_charset", "utf-8");					// 字符编码格式 目前支持 gbk 或 utf-8
		sParaTemp.put("payment_type", "1");							// 支付类型
		sParaTemp.put("notify_url", shopUrl+"payment/alipayAsynchronous");// 服务器异步通知页面路径
		sParaTemp.put("return_url", shopUrl+"payment/alipay");		// 页面跳转同步通知页面路径
		sParaTemp.put("anti_phishing_key", "");						// 防钓鱼时间戳
		sParaTemp.put("exter_invoke_ip",request.getRemoteAddr());	// 客户端的IP地址
		sParaTemp.put("out_trade_no",  paylog.getId());						//订单编号
		sParaTemp.put("subject", orderItem.getGoodsName()+"订单");						// 订单名称
		sParaTemp.put("total_fee", paylog.getAmount()+"");		//付款金额
		sParaTemp.put("body", orderItem.getGoodsName()+"订单");		// 订单描述
		sParaTemp.put("whichclient",whichclient);					//用于区分是移动端支付还是PC端支付
		sParaTemp.put("sign_type",AlipayConfig.sign_type);			//签名方式 pc 使用MD5签名
		//sParaTemp.put("show_url", show_url);						// 商品展示地址(强烈建议必传，该参数影响支付过程中左上角的“返回”按钮的出现。)
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
		System.out.println("支付post数据开始-----------------------------------------------------------");
		System.out.println(sHtmlText);
		System.out.println("支付post数据结束-----------------------------------------------------------");
		writer.println(sHtmlText);//输出到页面自动提交
		//////////////////////////////////////////////////////////////////////////////////
	}

	//获取支付宝返回的参数
	public Map<String, String> getParamsReback(Map requestParams)
			throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		// Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {

			String name = (String) iter.next();

			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";

			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}

			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			 //valueStr = new String(valueStr.getBytes("ISO-8859&7Q�U}�e7c ���\��#桯��L!b��6>�}ČfM�!i#��b>&���a���k&Ȁ�΂�X�c��P��T�Uj?�_�8���n|�UDsߙeD�����S��T�S�|���x�Yln󗶔�]�W�a�"Y���d���TwөލJu����w���Q�����8�bǡ�:�p�XĔ+��kb��c	�K���%�[x�4٧M�S���\V:~����z����q,���z��F��Y_>�����L#�tX[�PX+�?�f0o�0�¼.��1�$���S��41?C�g���8f�����y�of7L�\�i~��zp�1,�J�MP\guUXڮ��2���ۄv�+d�Êj��pq��� v�c�҅:ʹ��2B�Y����/��}�E�V/��2��W0����ܮ^��5ܫ��C�8��S��xN��!�nRx܌t�������c���<Vg-��ry���#�J`��w;K�W���jLv�y?��PK
    ]N#8�Ӫ�.  �	  8   org/apache/batik/dom/AbstractProcessingInstruction.class�UMsE}#����v��C���eɒ�	�`Hd�"c0I��j"o"�V+c�+p�8@�UP@N�Qݫ�$ˋ*P����~���g��߿� #�Y�D�k,^gq5B�k�1��ȫX��QD�&k�,�b�6���b�(�d���x��,�,6U��bK@��.0]���険n�2e�1�ZV`�i��@8�Ȧ9�*NLK�Z��lꕺdg���[�c��_T��)p�`;���Ѝ���y/S�w3W+M����c��$�u�VZ�k�Q��I�Dt%}��b�Š�m4�dY@�׶�z���}C6���=�n�>?�˩F���J��^���C-���&hgS�9�r��R��~�vH)ƽ�?�`x�2cvx!Vm��K ������QXxDd�nPE�R6�~�c��8X�\[�|@ȁ�h���E�v�1�ɇ>?�\�\kO�)��9)i$5<�3����#��m�Җ�n��ڨܕE=�[�dM:��<#���,���m�#��kax�Շ��P���,,����p	�^�eY\������j�Ku��ځ���6��nS�r;�I:�yï�w3��J|�[{ڠ���x��E�Y,�@C�cPc��1���蜘t����yǔ���wC.\��<z�y��OZnU\G�#t�=��x�>�{�Y�t�@�O�,C��q$q�#)!<Cr�[<K��`�4
�c�m�~pN:S���)�9<�~?��R�k��JMIV���Aޕ �8}
�,җ@҇Y�1�~�dJ/����'�5�t���bm�*)�����F�+%��;�K�e6�-�%&�iu�7�m�Ed�V��8Q�VH��m���,�D�g�[b��	�;�'�yx��6�z��c��迀¾E̷q���+Б��_��"<ۉ��r�k�j��Б������$��3�;W�T�1�H.b�b��D��zX^hM:%�hy���_7�%u���Ej�YG�2�2åa<5��SB��?�����۴�h3��!Naq�'\$��z�KL᫾������&D4�`�ǆ��'����G��,���?PK
    YN#8���  C  3   org/apache/batik/dom/AbstractStylableDocument.class�Vmo�H~�	qk�rm���	/G��{J9hS(
E��J��s�%]p�`;���� ��J �@�G��u7I]^Ti�ޙy�gƛ~���#��XU1�y�\��K
.⊊$���kr����b*n`Q�M)���6��d�,]�g�����g�^s�&�y���细x�L�+�uas�S���4��W_<�ɪ���/U*mG�J-[���\~�!���(~�LֵV��݇Fբ�t�1k�p�|�������$����ܒ�ˎ�jpۧ���z:��ϛ��kyp�Ѵ���c%ˁ��pdob&(�a�'`���H�B���4��E��|.���P�T�W68�=�>��ؓF/0�;�e��a�r��닎���*m����lS�J��W"}����&w]Q�-��ގ�����cc��-îW��b/E)A �ܴ��2�-j�x,*{�㭚S�>��IԊ�rM�"$��F��0�q�LiH�����[�/��e�$�0��f��5�ψ�J�&��4�A˘e8��"k(aE�w1�p淾(��?�����c
�:�{z:�����bJ_�)�a�t���hb��|W?�#v�I�U�+6��bPj�k:Of�� F0J�K�'��_�n�>Hw2M &�m�vF���6�kz�!ZUځ��z��Ik;aGh� S!�*�(�����XD
7�L�-��OG1�*��,yӽ�l�H�2>U�{�D?j����m�5�cT���8N�XzT�$^EP��Si�?���D[��H��޷�ԧ>��.5B8�\��/!H�Ӕ^��1�?c�\�+�������Zi���T�R�L�Q����9�|�j:JU��Y	T&����Un�_u	9A���n�hMJ󴫖�(�N�	���[�]�V���8C�$��q.�y>���?PK
    ]N#8�?�P  X  '   org/apache/batik/dom/AbstractText.class�W�W[g���&�p���@�`m'��8;�IY+��aI�A��&\�mC�&7��sn����ܬ�V-ݦ��N6kZ�}���t~ۙ��3����������{I(���<�����>��|�o�w�{� mxӋ-�z�i��0�����ŽpaB�tA�
�ϋ&˰ML�eH�yZL���@� 9��k�tZ�� qA
bn�σC^l@TL����B�˂< �_��rN*������x�u<Z�����<�E+bB�.ȓ�<%�<]�����!�ݡ'uc�gsː�+5�I��ӓZ87�2�j4����TLM�]��E٘г6��2�VcZ0����Xj2��5fj��V	��tB7'j�{[L�[b�^{�;5>�ոA����8v�:�j2�=�.)iڳD<L��p7�k,���I��힎iiCO%�<+aS\3��hSz*��K�u�L�۫ƴ�il�t��+�k)e��&�����8���'���C�+�2<��_M�in)ۑ�JX���#7>�eȯ׳�	m���RI���	�в�f�w���BMt&4:�:��d/9�@W]2T5y��/��~�$D!i�ƅXFS��o$��Ĵ]d����&,R�ܬ�9얰��c�d�`[��.��ݫŨ~uq��'Ƶ��o���-�ƀ��1��<8��;����ᄄ�����Y!T0��
����p���+�v	ޜ��G
~�
~"�)�bm�)�)^V�y!�/��0��a˫�T�s���
�8#ᚥ>����Y8'�,�ѲZfJSp�Ih�j�.�|CX?(���IY	���=]��h����2��	�tig�P�����$�.ʄvL[�aa�*����DV�\�jGsde���[��Ry���V�s��D����Y6qc´�j�hf�X),
�DO(�愻Lf�+Qܕv���ф��z�"ڧ'sc�6��pzk����T��Nkɱ�	=1�tm�-m����!��z�S������S��}�pU��)��	���R�]�m�.�_�S]Q��H-F�<Y��1�;+׺J���d"xw�o����ҵ���\�X�Un��uS�2�QHGr�tJ��\�m�<�v��@!pk�sj"�,
�iM*2�djJ���حݜ�M�����o���_�R�[8��^ ���W8p�VR����%U�h�V��с۸��R�y���/�6��=5N��G�����<����H�or�5GE�?������5�\�h��}��QE~��|��oȣ�]��qV������:��Թ���qbx
g�Ɓa��I�5y�ֹ��v��4@���B���-�t� �q4J��؎I|9t�%D����8�;L��aa��"F�(%Q�%;y�킓�n�N�������O��\75�	�������\��X+!��:	a��������3�g�6��,k�ܥ��/`�q�*����Q�%�[���Z�}嵲g.��TtQ;*I�$��шݸ�pZ0L���(��o�/r�=\�T�3]s�ex�5��������A�{2]3�p��8��%��T��W ��1�	�R�&���!x��s4� ��&�����O���%�{��*9N~{�c��\����V'm�����uL�<	�>�A�`�k]�^or���<6���%}e���ţ��q��1lēD�k�0�=M�ϘH|�ˋ:�~w��G��F�_>����Ua��k���Nc��yۆ�P'���|7��y�a�4w���CVT�Y���O�Es8PӒ��<�d�)��2���T�w-��:�7���	`�M�$��b! ^40�SCe�	Q88T�э�����V�$g�nt��	@��������p �Z��=���8H�z���
!��J�L%�k�9a�?+�M���X���o��&�ev�5>&Gu��- �����b�$�3�m����˷k^�Z>Z;���f���y�|���<�Y<�_��(�bD.0
����b��i������������.>������q�T�D��������,��*�E��^���Pa�W݋���>�Ɉa��L�b˕�B�uڷa]���kn�7V�%��⿲�ߧ�,����dY�Z0��{M)�PK
    ]N#8I�g;�   Z  '   org/apache/batik/dom/DomExtension.classm��J�@ƿ�5���
�����=y�B�b��&ҭ�n�lE_̓�C�	��9�o������`�Y�i�S¤dwg��ʽ�xE��r��Σ8��)*�K�qV�rA8�+���ݲ(,�-!����0�A�mnU�фc˥j�Yz�e�[
��|�"�N=�����ձnUVq������k�#����0ޘ��y�*�$����w+.�m�WH��^��v���@��`�_�!�y���aϣ���cL|����N�PK
    YN#8��&0  �  '   org/apache/batik/dom/ExtendedNode.classmQ�N1=t����c�n�	�p�V\0�q���\��0%3��_s��Q�ۊB�i�Ӟ��{n������3�:N�
T3ʇ:����@�L�Rz�L"��S�D��G����I�:�_�nw�}q˕ܱ�5��Jot��Q����F��*�B=�~�m��w2孉`��jium�Ki��"��$�X����/QcS�����׋4�[�s���)	)4�=ӣ���%�2x&o"s�b��
���s�&S
���߈��:ђˬ�o�2�(�(�(��R.	�a`tP�x���*j�hX<�`s�-�c�6�}PK
    ]N#8>#��   d  E   org/apache/batik/dom/ExtensibleDOMImplementation$ElementFactory.class���NAƿ��G��A/��G��;6������j| �8&��6_��~}|�,E7�)!�^8��j��V�m�����͝/��V��Rc�7��0�>�'F�*![���2-M�Lނغ̍��j�[�P:;l@)��8����<Ξw��^�⦬����c�?�V��ẖ�p�j��D���	��B�!�щ]'ۜ �5C�����~ PK
    ]N#8 j���  �  6   org/apache/batik/dom/ExtensibleDOMImplementation.class�X	|���Mf�HX�&@ȵ ��\F�����j����f7�n�zik�ն�VZk�����HQ��Z�V������Z�Vmk[����$�d����/3o��]��>�Νw��eA܁]��"{��ao��3�S�O=~T����w�z�c��"����{�1
��A��q3�b���D=V��x4���x<� �x"���S�����,�'�"~����"�_����� f���	�Y�	� ~�����������x
��x��_��� ��� ��W��W�M}�V�Ex��߃X�7��7�� ����3��mu�+��)�����w���8lC����\��ڭdvU4�M��
��d�J/OD3+#(�uf��vg�V�ʆT�5��ڬpK4k_��ډ��TgKbk}2nm��gD[�b�h�|C4�i5F��V+M%D7E�;�%�81ҖJgۢ�x/rẕ�5��-_�:��h�5ɦ�d+IG,O%3�h2��)��E�6�B����=���-J���c�ڒ���|�c��$/w��5yy<�^�"վ�U0*G;m@�*�lMf۬�,��vv��W1g���<���v�j�lo���j�J�Ѵ��]`�1�T#��e��m6?���$�k��;�sۡ��VZ0&�C��D�}u�����Q���\/j�bu,I��)w�ĭ��c*�x�+帄�ݘJ�G��V&�x�P10���i���e��
߅�M��:�=����[bV��EƐ|�Ĵ�� eB���,m�x@���r�Y�d��ʐ��~]=�����0f��n}��gQ�I}��<��^����Bb�L�J�2�Ûr8�D����]0w���i��_"�E��d�Vj���P�ʘ��Y��Ԙ��=�P�_֒ɦi�HvkBE��T�S��#0r�1[����|DG*%��{���F�Dc��tF�,�rz�*ՔʮJu&�=���/R�S]m/�"%Vk4�,c��"�6�3��3|��٬�b����(6�����|��ox��!],�Ep����u�`ȳ�jo��
'#�V��3i+ә��g��R��
��h>l��+=F8Y���6,8u�F�ӓ=
MIqy���[2�Ⱦ�(�{m?�>�W�+E��.󾘵Q��,=C�S6�rQ'[�Fۊ;���8wh`j�����T�K��#Б�9�e�`d�;a�"�9gH(p&�L��8�cF��2O=�RҒX���Tg:f���0��V14����h�M0��)��VX�t:�6% �&Ε 8�DR=����b�CF�R,%���R����d���1&��Y&�`�H�}�b�)=M�Z�V��RD-K��Q���2���XS��x��D
&�`���A�vS&�1&N�:�i�NN^hŕ�M�(�LD�ΐɦL��d�2�X��`ɍk:0�%ĭuJK�����e�,��xֻ%��F7��:�hm��{aTo2ݔ�0�^�3e����=�2g�R\o�lS*d�!��T)N3<�k��k�s��)�N��RkJX�2O���BS�+^�8��i�(-�h�:g�'?o���͸Ő�MY$'�R'�MY"'�T��I����k�p���>r Ay��? Gw�Y�|U/�"m��{AX��8Ǩ�$k�3V�unb�hq�����Tک�AV�R�ͪ�ݧ̫sٷ���n%g>�i	9�t ���E3M���lյ�G_}z.Zf�\FT�Ǝ��鲪���=FWx�����h\բ�@4g���G���"+ᾎά�0�o(O����x?gu�ӤU�5��Ɔ�Yaebi�C;�L=q���u�%��N�Y���Ș7�)��t��C׿�+����� �r�M�������+@Ͱ9�XF���vVy�1�"��K���cM���6.l��i���p�H�dx�+�i\Ϸ�տ���?�8��u������	)>=�Q�b�6mm����NϾ�(�����{�ҽ�l�{���Ӓ���"b�7�*�;ҩMv\��8�b@�����wO��Aξf"g�L04�Џ��$�7�9��d�:3�i8���T�����c�~G�{"��z6p��R�9cr��/�Ձ��~��b�8���~}�>�Õ�QP�c{Q(h�ڋ����E�� ���ʽ���_�U�:���Td�'� Y�BЂr�P�_�T�('^ayJ��q'c#Z�����UiqVa�YՅ�^aA��NAI�x���S�p�f���ew����.����V��Y��tp\N~5���ˑ���*�aTsi)�4�cv�lF�Wm�`[�2������)��2yP���c��tI�����q�v�Z��!EV�*���&lvN�W�!�q�0�z�oލ�.�S���.L8�W�R�}�s%ן�$|V˯t��ȟ��9�'c+Wyz�����î������?Ƒ?��'��1
�p������\���qn����ڙ�BeM�#k��"�ʺ��S�M���>�e]�Ѳ�2� ]Y�S�j�@�0� ���w����}��\R\YZ�ߏ�;�Hf���{w��S�o'�߃�|�~�o?j�
v`��ދZ�8_��:÷02�t*(\�i[�q�y�<�U��pXMqY�|)V���P���QVxi�(�f֬��C����х�u��P��B��t�%MC�w*�{5��1}���]B@�^b�������� �F�]�v]tǝ,��0w1��2܃�q/�>:�~܎����x��Q<���"�;xRL<%�xZ�� ��P���I�-�x\�O1��zuW�zu%W���4ÿ�Ҧ3Z$�`
���Xp�j|��g�� �:��*(�C��/�N�j;���!����!�;\]�x�ki�|~_��}+<C!��W� ��Y.�*O�
ɍ���ϒ���s��d9�:�Kc�!����ff����8n�J���d�.��ꐿ�����P�A���ws�·��������KzkS��~��"��x���U��k���Q�7P�7q�b�z[)���4f�z���vkE�R�'���7�M]S���%O����U�~mq�*���(�߆��s�����۰��KOڃ��o��( d��V��y��-Lu��	V��^,�R�+��QÝ��m�%h�F����|�C�j��=x;?����J���Q %(�ǃ2c52e<N�L�Z��f���e2b2I��m2��\.�Z�h�-���,P�a���d4��)̓�̢�Q�Z����&s�M7R��x�vM�[K+Y�v6샯��Կ�wk��)!/��P��bX��C�袹��;?��ݽq��În�U�g/�ds�6��TEu-���~���PK
    ]N#8o��a  �  &   org/apache/batik/dom/GenericAttr.class�R]OA=C�������G�l�aQ_ڐ�&��Ly�n'e��%�)���&jM��(��fi�Q�ٙ;w�=�ܳ��׷ �Q��AQ/ydqg�����C��}�\,x;
���1�]��T���d����`X��P4���_�V�2K�(��&��>���:�}��zw|~ʃ᷸�o�v��P�2�S*�0T��~��.;���eةL��k�U�U��AO��b���gd�A��ԉa�?��O��T�(�;ؤ�����d�\_���k��	Űa\Z�J��p'0�tV�E�8Ϥ�hqm��Esz���C�E��9�P��p	fmRN��A:f2��0>�L��&�tM�H4��EQ�"L�N;�3�-��>Q0�K��iMc��y���,2���zQ�z0�Ly�+2�<���#�xL-��B�s�h	W��e�P�*�e�һ�kc�~*�3�i�$�Se^���x��z$�����A���fVT*��rM�w��\	���#�z��-/&��R-���PK
    ]N#8+n��     (   org/apache/batik/dom/GenericAttrNS.class�R]OA=C��RZPD��.�&�XC�T����j�$>L��2������A��&� ��δ.����w��9s�g���/� lb=yV2Hbu��u7�&oc�!��U�-�gHݖJF��B��`��-�0S�JT{ݦ��f�*����ޏ�Vt C�Պ�]~Ƚ�6y$_�-���J�ۉ��Z/1T�������n=
�j��T�r�4�(�^T��^W����&U���@k���_+�%�I�O2����!s��'#��F��2�Ş�M��T(��U��r���D�j,�+M���g�&������1�7�6�Yd0���,�p�Hc�!�o�V�:�/��IQ�G{�é�̪1n~��*6�L/ɦ�Fckm�%)#�T��n�V��� �%�Q��
�Ȃ�iʲCfpƐ����/cњs�7n0�l|F�h	�wH�.�ˆ�^��l�L��(�0�<��y�-:[��.�T��ꏰ���R��p��%\]�&�n�r�>�:=�c�S3CT,3��d�6�
���nF�IE�� ����<;�%k�fP�?PK
    ]N#8g���  �  .   org/apache/batik/dom/GenericCDATASection.class�SmO�P=w�t�����֍U^|bD�`d����խ%]����@����2>�-e���a���s�=���_���P�3	�!$��h($� 6E�Q����8��F�c9���͵�e6��Cl�0g�!���0D6�:gH��ouZ5nW�Z�*鲥k��6��/F�}�͠�-��j���՚�Ժ�R_r�ۆ���^]�p�1,�İ�-��5�����؆�(Ư�ڎ��Φ�wZ�tJB`�Pkv\=�П��0IB�d�;[t�-�E�c�� ����w��0HF{;0�Jde�͝�Z$�'��C��<wx�ti�x�s5-�T�[��7���
��D����ձu���d_��AJ�L�x�G$lV�k�����d���O�x*��U��e�e����U�&�n��a7��l������ ���Q
�u/2�gRW�c������z��R���}f��/"��/4A+2�*��[���U����"�+4J4yj- M+�k�U��L1a�'إ�0�)A�NR�_P��X�q	Ct�V\�i�S����Ǥ��$��c�?f��NG>�1�T�R��MZ���>�F2 oᶏTs�"�~5Иi���Q�01�L� �o��l�^W�Cw('��,��\�}��r�X��!���,�%q�55�9��dK���~ �{��~�w]K˺]�?PK
    ]N#8(#RZ�  �  )   org/apache/batik/dom/GenericComment.class�R]OA=C��eY������V�&��$�F_�4���vRF��f�m��A�D�?�xg�.����Ν;��{�������:\Vf�ǪMaMeO,��ˊ��B,x7
����l�P&{9��f0�QW0[2�~G�G�P�Ԋ|�y,�=-ɩ0l������?^�'�׍���X�ͨ�a���p[���{{�a˰�;}t�3Hb�'�"�����CM�z�ƴ��rC@[�fV�z2cn �˚ឨ�l�`�b|��Yt�z�x�������a��RٲpUy]�u`c��&���⠀Y��ǰ�_IYۼ���B��(z�m�)�W�X��a��!��eyʉ,E�n;t2U�]�}�d�m:AJTp�2g҄"nk0wR�c���YT ��s�Ԟ}E��D ��m�_'8OC�N�RH�������2M3,�n���x��������b*�{���Q��c֖�a\W٠��aiҕQ2�(+��0�z�����_��|�K�/.���#���7PK
    ]N#8\�^�  O  3   org/apache/batik/dom/GenericDOMImplementation.class�TkS�P=�-}��a�Al�"���U;��Њ�''M�%�&1MU������(ǽi�#�Nf��l��9wwo~���@Y	2�HH�0Ƽ?BHK"�=,��~K��!,3�6�6��7_r��by���*2��]�|YR3U��!D�n��Gq4�Xef5Cs�1�����Y�����f����R��+����(�&�=g����E�u�g*���K�����N��5��3L%��
��6W�a�M�.�[$d;Q��|V2�b�2%�֌��U<g���IL�������x������g[͊���*��������;-�a�j���,��e��5����v�!T5U�-��EGڼ��I�p��R��-Qsjp8��ޘH%�i���&��[���h2�1 �}#g����0�ђ<i��d�iY���~�0s�dyr�a�d<�+ ��5����Jñ�Ӭ'J扮P6ѽ�L��L7�5Q��XbX��H�/��U,���=M�y�=��H?�3��S�&�aB�����ʹ^��%ڙ����!F�D;�B s�N��aC�G0�^�	��߁K$⃮w���z�2e�\'��Db�#��j3�"��l��c����2��d�$�O�[��G0�S\��w�D���(=s���q��oGm�>J �DyJ��%_n�h��1��]>ך�m��j3D{G��P~�1ۮ�'�v������z���PK
    ]N#8U~`  �  *   org/apache/batik/dom/GenericDocument.class���SUƟ!�P>Z������@�H�G5�J��(-�h�Z7�C�6��fӂZ�z��7^x��8�3�N�wu�r|��͒l��N�9�{��{��~�]���џ ��!\?�u����hǇb�Td�+Ȋ��hǒ����*:��M]b���G�y�QP`���EX��*�IK�a1�T�y]�͠L�Rs7S�37��Z,���ؼmf.��9Y4K�f�Z���-�e�f~��-2��a�gh�/0&�Y2�1L�,2�Ji�<좮�4���À�l�N��\L[��e�h�q+�-b���-C�*��7m�r."-�ѥAe&����3����<��+�q!�%K�=�3����h�j��8��)����"��%�-��D���V��m[q�.`ʐ���R�u���/:��#�)�Y��Z��rI�@h���W��2C�C��}��r~(2�mt*D��M�5;)u�j(I؊�f5[�4Y,4�%ה��ک���<�Ŏ���2�P�XE��Jd����..����mQ�)hkV��&��"�F�l76���a�[	�m��s|�[����x㊨]�Ը���g�?���*-,$��}���ex���%�g����m^8<�݀(&���_����7�eK�ӆ8b�N�1�$�SxV�<�	�Tp;�;X��Ȇ��5��1>axf���Aw�&p�2�6s�U�I����n�5�{��z)��UM׌�f�m=��7+R��5f���=|�p��0��9�Ȼ0:�Lv�9��k��ew��2�NS�n}RsQ�'k�A��6/֐0��u���oA��T�o�����Mʡ|s��)ߋ������{q$��dS��`0�͜�,_�	��!�@j��c8*}y׆�hU��+j_�����m#�~���������F�*�!�Q�h}�@+�������ĤD9f.B\�!&�
��8Y3��z6����4(&���^t�'k�<82�Z���К����Xy��x�B$���.k�eD"��m��mtd�e��>2�U�>�W��)�->AV��hOG����ۭV���p�xM��<]h|���A�JZ[�ڎM����FU;�^�\UB�(S7љ�a���Z%K�d����.b���%Y�~�z�%��F���#Y�~ֽ]Y��J�-��������tt���د��8�aCx[bŕp�R�`���WIt����;$:Y�|���.2��ow�G=�*�\�]7��c�I�Sߠ��D�F�(��J�n�܌�`p�u?��(*��~���~��駪�<)1̻1�!U�kXhBT_ET?�:\-�i���$����D�A��ڳ� ޡ>wj��<���MI?�Q����v����j�PK
    ]N#8�g���  z  2   org/apache/batik/dom/GenericDocumentFragment.class�QMO�@}C'1ڔ~PRh{� �
� �.���m�`ib#�!��H �V��G!f7�A$z�?�y������? U|v`�T�����a��Z��#!I���O5	��
T�IȔ��Vؖ���
�n�ےѾhu)6B_tD��wZ����0:�ĩ�������î�#);��]��H�Z#TʏO|m��H���HM[ʆ�!,>s���^�sq��G�Unje:#�9�5���Kf�`�7��b��~�˺ҁKOd���3� ��']�'���Y���7�O�������p<���,wl��q�Z�J�\�ι�˯�X`�"&�s�$Lbʈ�"�3Ss-PY���He~WXe�'�F�͐�(��%���+L'�^j��_��m��G�f���fbȮ�^"�0R�g6��S#6��}���a&����'�����x�v�K>��ްfoPK
    ]N#8^��ؗ    .   org/apache/batik/dom/GenericDocumentType.class���n�@��u܆�.=J9S%q����@E(�T"DJ%���^���C�w�JT�@�x(��Ƙ�X"7{��o��럿�� ��[%Q��l5,��VD�D�JN7�>��/�I�5xG0�m�矸���4�H�Ǻ��/�����^,:j9�P2^cX����n3�OB�d�7e �NKD[��k#���mI�O�f�+{�f����pZ<�/�8�E "�>�~G��~W��ɶ�$2�_�Rͻ�$�0*�&CI�^	��C;���ߘY�QW0����iQ�*�ܳ ��d�i*�{�]�S�xJ���c�F��˴�j�L[>K�� Q��f�EnH5{��rV��T����+֥��BN�VTC,Lᦅ	�,L��B��2j�~�a)7�q�G܍��J�x]6:\H�z��H����L办�����ҳE�J�4�|t��#0{��];D���<����.`S�2U�]�	�Yf�(��J�2�Rʆ^)�E�8�(;4��1�+�/�Ը�ѥ�ABR���S	\O��L�s�7�Rt������%��FJ��ل���;Ȁ�����'��Z�Bz�T�eo�(W�".��\�%G ����OT�¯s?ѕ\���os�#��x6qK	�F������7�i)���Ƴ��P�r��Ϊ�PK
    ]N#8�w�  W  )   org/apache/batik/dom/GenericElement.class�SYOQ�.�1�R@7d+m�(�� J �j�N�7e��4�a{Q��3>h"i����e<�v2 �1M�z��9���o? d�0����Na��=���`R���0%��8ݍG��!j��ӷ9C�⦾�k%�*j+�cZ�)�w�^���[gO����0��ë���M��v���y��K��6�Ҫ�b�*�YaX�����uc�ky�5�����=�wLc�ķ���t��P0t6_q�p�mcG��7Kf�l�/�P�P��¾�ˮi[�(Ֆ
ws~�:\	9�K����᠊��ʲ_S*�zM��LI��0�/ێ˰������X4\�z$9���	�(04�y��yy���v������N%TA0��"���N5	����;����MwBV�P�y\�E*ΩhE��A1�5�M*2R1��
Y��3����{���wz��лk�"�J�hn���vc43��SU�/��1N3ȔB�:h�ւЉ.��H�"�2B���T:SES*}��O��� 3��K��x�K��� ��K�L�i��
���gu�n���	���G�nV�wբ|�0�K~Fʽ�����>UX>L�&��ʧ���~�e�s�d�	�vjmġ���6������o~���pnD�DJ��.�� ���L'���H�оF��λ�N|	�|�i't2��F��k��&1m�f�?t�Ux�kt#z'�JW%ѥL�h��\İC]�{���`��y2�h�2�3e��{��а�-��dFi/r�~Gx����6�x���~'�ʨ�?PK
    ]N#8~��  C  +   org/apache/batik/dom/GenericElementNS.class��[OQ����n��*/x(��J��FDTh(	$&n�MYmw�vQ�7���H�hb|�C�nl�����:���������O ��� �<��!�*����(n��&n�aZ��|31�.�f0[|�o�ZU�*ڊ�Ve��C/�Vu���3�3�e�w©�Ui���M�(l֊��D/V��]ҫ��c�w(�f�a|�v*�^�K�V�]�V�k�C�2�4_5j��V^Hu�p(7[l��^r�ۥM.8��X����%2�����Q�C�a��b�q�"��~�dj"����X��K%]o�Τ�:���u�q�R"��|ID��οӓ"�Ŀ
�(3�*�R6��������΂��c�"T.0��E-c� ���$�^Y�7�����-3�����*��(��Pѣ�}*F1�0z��R����,r*��es`}?���I�sA�dZINs�V������h���`_�C?�
� ����R[F� ͌g�	<#��t&�k"���"�'ԋ0�w�,��b閃'�W'�cbu���X���2��u�n������h���[��-+__�Y��pÞ�����/��,�<�����6�@��ؑ��.��,����5�>Ґx�xZe��e���D��B�'D���%��"l����$}�$Ƒ1'1A���BV����B�H���+�r��H��膫��3M����|�8�Rk��ᖛ���qß�d0&~ �=I| ��Cc4\�0S��9�~@^kBio�O��'�w�ea5�PK
    ]N#8���>  N  (   org/apache/batik/dom/GenericEntity.class�R�NQ]���A����.���5$xC��1֐ȓ3ӓr��!3S���A>h"%�����E�Q^��g�>k�������;�5�g�A1���˰$CIb�*�PL�`H��jzn����G��6C�\�gH<�a�&\^�vl�6!�5ϱ���/�9�k��2�#�9�m����:�.w�/�gn(�~��m���:�̶��F��U�2�}�B�r§���p7�*���Qb�"aHu��&����HC��Y��G~�}ϱD�@�`�)�����\��&�6E,QI��ß��^�I�:tL�XF^�
Vuzf
�YL0,��s��?W;�TN�-:\J��+3g�<��Rv���m�H7��B��kb������KU�*ڇ�+tڤ�$j��}�"�)�Y����p�*}؄k�Vd:�G�3I� 	�|�1cy���2@�X y�Z�F�$�u�����HB[j�֐)�"�f��f����UqUݤ�	�^�\�������`M�Ǯr�����-Gh��	��f�НǊav�5���9+��{���9�oH�9E��-/~Ӓi�W]� PK
    ]N#83�  �  1   org/apache/batik/dom/GenericEntityReference.class��_kA��m6��6Z�����V��i��[B���m)ط�fLG�Y�L��|PP
~ ?�xg���(3w.g~�������7 u��c�.w��a-�z��j���R*E'ѽs������
��c��$�H�bKi�?�ez$�=�,��X�E��9kz�T;�$�F❈Oe�F��:I?z!�LU�Le��k�J��Ym�g"�	ݍM�t�1�=0����$��6�Q��s��PLF<���<B�y"g�0��Wϫ�ةtF�������n�h7v`۵��d����TfP��˘Gh�Ke(��#B��_�nJ�u��>��.vWE�� w���;�nm���ʼ���Y��\�'"\Ģ����~����=��4b���bm"����%�pˬ&\�J��r_�Px�C}�|8��5\�.���k��(L[j�#�LT�%78"�MT2�g(}��j��)/��Rʽ�r��?PK
    ]N#8	�\�>  V  *   org/apache/batik/dom/GenericNotation.class�R�n�@=��s�K�����J�\܋K�'�*�R!�*�'��*5$ve;���� M%�� >
1�1	
������3g��׷ ���E+�����&CQ����)T�a%�!����v���0hO�	����1C��s5��n��n�	��y6osߑ�L��N�P�y~��g�>��C���:�K�
߱�^H��Vޕk��97��m���w�V�J�T�+}n��=��nXU�����C<�ZGM�A?P��B����N�zd9F�"c��T��R��Օ��rEM��ڊX����u}[�p���	���~:fu�#�c�:=5S�,fV��;�����*?��;\Mj�+K�<��Uv��Zmǖ��S���s��2�u�C�)��$U�!��K�IԸ�BEs���"��p�*}؄�Wd:nF�3I� 	�|�1c}���1@�� 9f-@�h�6MxD�r$!�=5eo�M�Ujr�T�Tu����n��}/`)Rc���
��h����SW�����}�#4c�ڤt�bXv�dj�G�J���AĵC=rN�;Ro/��<���/-鑖e���7PK
    ]N#8]�UB    7   org/apache/batik/dom/GenericProcessingInstruction.class�TYOQ=�tg �p�҅�(��F4��ZFۙ:��D}U��#>h"4����2~�vlM�a��}��-����� �F3�Bb<LÄ&�vJ��v&���xVl�aN��l,��~[�2�fh]}��ɬjd�붥�i���մid�6��n�24D6�f�3���Os;��Pw�\`����T-]�C���FWM+�T�˓;��?O��\r��ҵ���B��W��m5[7����r�
=�CH�f/�Z1�{ZjO����3��������n���)5G�:�K��=��^xX	El��\=�F��m���d�=2���P�j��/�E����?�I�Bԩ#pܓ42s.i����4��%�=�����6�\��2(`��0�~J��x��}x�,Z�����W"�"h
�Ю`]
�ѭ`QgѪ�gD0�0�����j�I)��H�H�14�r��� �u�
�Ԑ���x�VZy�p�Zѳ@�F�Q�;h	�t�1L��%xI�y�$�pifp��J
�] D��DcGh�Ə��u�/0F��a��MƔĎ��l���\u��#W�х:��n�y�nĝ_�j�#�y��Q�����#�p��JV����(�<\v�5\?&���Z!)���VIL��"���F�#W!�n9��V�c�yR7"^Q�V��]�k,^B���D�!
u�������Đ��자�(bN>�EY���[�0xc�.c�^����r����h��F"\�;��Z�WT�����H�[���!94�%��i��4o	�Ѽ?5͈laA3B{���7�Jh���UO�R=7�խ�PK
    ]N#8q��  `  &   org/apache/batik/dom/GenericText.class��kO�@����^h�+ �.
��R.�C4��b�l��e�Tw[���'?h"5����g���u�~�̜���s������;���PQ�C�J��<��a^4�X�aI�9,3�}n�{n��1d��	6ҥr�Ay��s�B�qy�ӪsǪ7)R�x�լY�#�QP	�6�d���uh�ܬ[�����Z��r߱w��`�a�TykYf�r�v�;nc��n��|��yv���`M�9��Y�.��;��f�ӐAk�J�V���ʽl/�vN��͠:��1@
B�̓˘R���#��X\ �J��=�e��+�,5���2�\~*E��<�<u���6�i&�/�{t�c@�
Fu���4%|uh�u<ģ�����&�0�W�aN��g������?�$�[�+G�N�n�W��C<���# )�i�VFk�8�D���
�)����a��*��1�Rf�ւ00�N�2fϐ��*�	�S��>,����r<�E�b7�yM�0Jj��]3ՙ.*c��&*L���f$�����.�fB����p;R�1���t�_�s��
��- f��Sd��n��t	�bY��.�E�`��$�Ҍ3dg� �B7�Z�L��4ܕP��td�,�҇���s�u;�I4����Y�_PK
    ]N#8�!�d�     ,   org/apache/batik/dom/StyleSheetFactory.classm��A���8T*� 4�P^/
�8�bnorw,+w�ܫ)<��V#������M���� L�����v��H��8�f��e�.S�R�WK�J�V��:��+vo��
��\�kN�D㯽�#+���z�=�Zf���c�X;[֓-��0�{�'�����C�V�V�k����D�'�^���PK
    ]N#8��nU  �	  :   org/apache/batik/dom/StyleSheetProcessingInstruction.class�U�SU�.	lX������������B�B)K!-�����6l����Mu|r�>����3jg|���w�M�@�t2s��{��������?���7��*^�L+2���0+V��0��1ϋ�6|���sQ�-m�Ia)�e�̧p;�;�tE�*�
�Yk�sF�=�R7��c�2��f��o��J��13Wt�9?ص�<�s+b�"֓�#�\������2�M�+��DzV��BKr���y��N�g*���]	,;7o���F����r�r�`�!�XcH^s���c�r�R�\��4dH/��a��%���d�iQ�K'e��\����?�*f`�/fO��m8%2��`�h����Y׬��cV_I�h��P���n;�c�o0.5��j�w�.S��m>�{�솈̞�KT�%�L%�AYX��x�jx%!����Q���p%��hHN]䓯G�~�<J~VVO��c�-�8_�:�8|{I���P2b�\���|�J�;A#����xO��4Lb\�����&N3����*Kg𖆏0��3�うw�.ùhQ�;��c�nr\_�!I�̋1M��a ��/5(0����F_��c���X��OdH�7jmf�oŽa8%��^I*�]zDLz�^=ax��olC�iP���
E�\{%���I׻ng�~�8r2��]�����l�_�-��z���0�5k��j��#�����B�4'�v�7ɒf�vH�d}���hf47�`�Ѣ	}Ҩ��O��*��J�p�4�2�� l�L��- ��=4��H��{HV�z��A��h��鿭7%��G�bE���1�!�I7��D�vG��"���G�/q��y�ȴ����y��p�~f͇��'�u��Z�ɵ`��+�a<��@z��~ak XA�Q�c�x)���$�-�)�0I�L>���5O�g�T�2:�I]�G�O�&�ETQ�	p��%�|U����k��Ȣ���E�9����A;�S��}tܓ���k�:-��@����O#��`i|M�B|Ke��&��8zx�3�v�S< �1A��Z��3����с�j���3�y3>�q���%k�C�92Ĳ�p/~��3�yUZM�PK
     ]N#8               org/apache/batik/dom/events/PK
    ZN#8Tt���  (  /   org/apache/batik/dom/events/AbstractEvent.class�V[sSU�v�K���ih��j�iR�����C���
�'�!=�''@��]���>��30c uF}�G������3�k�r9���9{��[k�o�}��_}`>`	J��Չ���l*lγ���"�96O�y��3l�e���ټ�ǥ zQ�x)���
{xՏ��L��~���e?���-�=W23�y=���xҶ�Bv�@�,瘝R9z34��i#��r�NW,�(�Ӻ�5l��D���/lJ�3�|�8OK�����"���ހ\>8���H$:m3o$m=_���=e�X:hKzV��bA�.�ٗ�S����`ɒ|���z%G�ZA�咞6�G�-3k���F`邑R��L�e,��e�P-5���f��t�8-F�̛D'ȅ�A�`�;�##G(�����'a��J>eXӵ��Ŵ�;�[&�;�{�$G1�Na����ls|c��m�i�V�~J�Ԯ/2�R/D�[%ZE;o+R';�n�MR��H� ���0�rj��q��84&iHJ�XT��lQ�c�jg���H�-"������FF��1[�-|+-�ʅ�L�e���HS�U
>�vV�k�ӧ�@�bɝ�[H	ff�D�A�Rc��F-T˝|�nt�|�sNR�G���i�y���$�m�̙TwRw�UoO$)�9"]x�6(��y��:r��b��r����\�0�z�Rg�4�Q0.8�L\L%GՀ�9+�Z�Ӟ�om��q�,��J�T�����"�W���T�T���k���g��@�X���S�z���U�&l��m�`B�:D4�`HC�M�ͽبa5��j�l�`���yu%�Q^]�⸇:�Q�c���q�����W4|�3t����8Y�w�&��vtS/T	�|e S���X��^k�&gɹ�m��o}��9`�r|�[۞�����/4��B�<g���g%}3��K����������Jg$��8쌤�Ic9�8���s�Q����#I*G�!�d��Go�(A�P�D�&ڪh��W�a�e�c�F{ڰ��R���#��$BH��h��ҊV���x�F�m������k���Z'��ɋM`o� R�;��KJ�%8�_V�w�a��3��<�]
����+��n�J�nL��mup��.�5%x�R��;a7��T��=n�J�H� 7;a����F�h~"��M�:CL��s3�B�*�)��s��7���Q8�>��Jp��#G9���~���7�"�3�/��Gg
�~���']#I�����O���AE�9�s�7���2G�Ð��C�X��Uh�Ut7�¼.�+����3Z���ᐼ� ��!A���W�aq<~D+^G�&�G��������*�*�f��Y���{Z����B��X��21�!�k�Z��:��=�Qu"�1�ɧ����8F>�1e�x\�#�
��J��ޠ����A�ۤ�˪�r)*6�
����Wg���
��ऊ�݃bqm]��qʈ�+�ܕ&����p��\��;�k�m�N�y\T7�n�]�5� ���I5W�͵���.�5,����5�:�� ��A���X��k\%���t�Ij��&�^���Hӓ�6�/?������N��N���u,�N�U�Į&�Uy� zQ�6�M!�����3��B��ʍ�A�U�"D���l�[W��3�����;���"������Y�qn���o;.HL�?PK
    ]N#8�@�;�  �  0   org/apache/batik/dom/events/DOMCustomEvent.class�R]OA=�n��,�|�ZŤ��}@�jH��ĤBb�}��N���.�N!�+MT��(�颭%�����;�ܹ�d~���	`ϋȡR���"�'6�ml�xʐ�
�e�0�<��y��ޙ�U�n_�H�]�l��f��`(5e$�=O$�
M�}�y"u�&-u*�[�8	\~��S�z\�On7��BD���?�U�{�cz�u�δP��5լj�u�bhTG*[*�QИ�t:���b���D�F'��%��)��VW��\;>���iB�a���/B~�+�5�؊�/�J�������!�x��6���a�?�iٚ.���Go��Lia�HZ����66�W�@������o�%LK����%�����`_d��͛d�d�afP"�P���+2��!W�$�a>%+��ɗ�/�*��wd뫹o��b�fvhڗ�~e��9i?��h�(c�PƠe�n��,���Z�G����PK
    ]N#8����   J  *   org/apache/batik/dom/events/DOMEvent.class�O�N�@}��Z�x�db�x`?@cbPOU�Ӳ�U���y2���Q��W�L�2�͛�������m�$��SIh��f�hb���M��׫B�)KQs[�r��4�G���Ԅ�ܺ'ů\.�*؛5�+�7��~��i�sB�h׮Է���6�ϼ�:���l"���]�w\���Z�o$)Gca*p�s�z���D0�]�lg��0�\�7PK
    ]N#8?=Y  �   -   org/apache/batik/dom/events/DOMKeyEvent.class��w|���I���6p0`L�Xئ�1���V�Zw��;��q�YX��t�1�6���{�ABB:%H'�P���h!�7se~>��!�co�oڛ�7�7+?�ѓO)���#��Q�hPr�~ܥw��=�q�~�׈��u�@�<(j�P��S�����ܰ(�DM��2C����l�R���~4�ӝ>��<O�<��5Ϸ�@��k>��!��|��C-��0�5/��H�"ˎf�(r(�Ɠڸ��Ƣ1֖բ���Nǋ�>+��h�D�!'��N�M��G�P��w9�T���k�F������b-����w�N'{4�	L��_-j��=�ĸ�nm�FTCѬǭRv���A���EvB��)?�ꊧ�*'�=PǔWĝ��Qo]k`��f)�Qm��.Sq��ż��}�xs@���!'�HG��YَvԐ�Rю��\����K(�:�n�,jǒ�O�Ƒn�xq,�ݴ��t��@~��\%l�FM���`mq�7j&[c��7�������3D5���t�lD��;/۷ev<l�v�p�i�{ܰo<�ơ��X��<�.8_�	�n)�h�SqVYE�	��P�ې�W�a/1o�Q;mSś��(s0�9n�&<}P�9�vަ�O�c'�n�W��F���6TL��'�+�����*�fY����\^���5	7����N������̑�	G��څ+�;^l� 솼�cbcȆ�'��Md�z����d��u�WU� 
����fې1�\Tnޓ�l<�1�m�lGw����ٓ#Ș�A4��j_��
�t��4���n��<q�N��cx�~�U��[z���:�"��~v�3���-���l1�q
[�r�+�h��h��b�֏�j�h�a�֐�Il�*2^K�0�HM��E�ױE/b��-��x[�"�b�DS�!���Q2�̑���:2�\O#��`t�$+��|��b�6R/�Sё�.��I#��m7y�Ӟ���u
�w�mezu�ẜH��};u��kӍV�� �3��]j�GM��mg�4{6��X���o5�dԹg�R<�����~K��_�ĝ��!��B}��t���69��?��%txL�궋+�W-v�`Zb8ݾ�J�c��;^��oc-��4D<]R�7i�x:e6�5�	��u�8�>6GhS:��@]���	�����F5Gm�����7Y_�^,e�h(
}ǝ5�ib`��h*������;�y1�?��H�w��q�+]L.��s���b�}���;a�ڎ+����)����[n5ǿ��jr��r�I�r��Ǘ[MJ�/������j�À}k�f������Ѷ�	��U���関p����󡵧�⸾���"�R���v�'�d�7r7׆L<b£
	wzф����ޮ�����
�L��5^O�~\7�]�R�f�mS�Z�j�����\k��Lخ�ö�M�V~l��2#�?ќr�9�)'�ڰ,\%JQ|��}�)^��b�c�b���&����B���Cي3��$����g�+J�ړz	�����Ƥc�gl���������ʞjm!?��T5YgP�cy�y�����Nң���2��,���r�&�ey�����r#��Y�sT���]5p|�X�&���K��C�+q���VeF�����rG���=����G���ukz�#�L� ,�"�}����Ȁ悱&�j w�9������Lߪl[o&7��m�����Pn�czW���?�}Ɯ�	�D���SX�n-��������=C��4��u���	������P["720Կx���y�������Fۜ���H�/�Z�_E]n�ڬ3ү����0[_f�}]/ރi3ؗ����1��b�Mŭ�7+�N
�oW�#Cu�IS��I�c��𺑾lǀޣ)����u4˙rV��&�7�f�ؤ[����,[��!yX�~�綊��Z��B�&�G%ZXq�>i�ޜ��jP�8O��I5�XNV��ہ�'��J<�����;��N�)Ю�3���ރx&xO�Y཈��C�/x?���9ĭ��� H<�F|x�|����
>�x!x����A|$�3ğ;���q�w�;����p7q%��}�8x)q N'�)��2��ࣈW��&>|,���i����^p�Jp��xp?�*� �	��ă�5�C�a���G���9�:����'�7�>��T�iħ�7oo!>���L�Y�g��!>|����/_D|1��K��_���J�U�W��!�|����o�D|3��[������N�]�w��!�|����?D�0��σ%���ď�ǈ?A�%𗉟�����|�u��� �&�[�������?~��9�����@����/�_&�!�G�?��������
�/��$���į�C��u�7�o��;�߃�"�������/���6�8��w�����������'���&�����',���W���k���k�u����F0�4�'C���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/�������@���_��B�/�!�运��_H��/����9U��/	�k�w���\��R��W���j~��<��)���JMj}Bɣf�s�5�=�\<���<9_鿫\ ~��c�����oU�|Q����߮��⊝k�;X��%;O*댚J�/��*t�-�\_���;וw�Z��re��+hפi��n��W��-5c���eҘ�im�Sխ-uc��~Lն�4��:�����
�h
2�N�<3�qf!��F��+��k��\Х��j�V�\���2�kQ��e�:�jL�z�&��(՚ҍ(ՙ���՛��(5��-r+�#En3^��?PK
    ]N#8T���  �*  2   org/apache/batik/dom/events/DOMKeyboardEvent.class��t���o�m	RŒ)�.q�$J Rr�8�G�	��d'�	<��@�@�^�{�K�8��زc'Nw��ޛS���������_����{z�8�-����3=��#���ɼ�g�b���O��=�jƞ��3��쳜}��ϋ�/��}�|It~YH_�W��������Mf���Od�N؎g��c���*����v��Tw�Z���`ƲP�X����[��8�3|b�
��g�fF��!ˉs����N��x�	[;��wՊV49lų1;�8�3Zj�������������)���h�d�����Tb<m�&��(g?bFm�Xc��#��13VҕH�[�0g?Y�i8�9���);���0�gj�#m[���@M:�Hr�����LOD��_*�����S�X.1�'�x2���m��X2��5��7�3�DTkH��(g����S��[�P"������CB��TW81'�^u�q��J+�����,�SVڞ�������P����l��<Ìf��^����>���e?g�r���k9��?����?�<�ٿ����kyg�*�#�=�=W��|��i���MV� 7�:��P�~n6�a��Mu����:l�f���n�:�r�U�N��t�
������5��6���<B�ٮ�N�`�2�V5w93VԼ�Z1+�$��\��l�&p�Ju���y�RND��c�*��bI;�ƣ��ju�,\0\��0�Ό�E[Ԏd&�V
7a�N;inv�w�r��t�aF�T�Ƶqң�<Bْ�f�����X��f��G)�"Y��ḍ��r/�0�I �|���)G|�q��+�{�q�'*G{�q�'+�z�q��֭�
/�U�혣�֩���NOdʸ�^��֬Ŧ�T(Jو})5j�r�֬����Fu��7OS6�E����ҭ�7{����U"��O�n��8�̀ᾠn�+q��J�imV"��%Ƹy�a�JLp�L%��R�Vn��D\�s�'�X�؛��,7�8�͐ǹV�6n�J��͈wps�G�ofnN��x^6���V�43����'���B�X$jc�QՖ���DB����,��0��H#�2���Q��넬(����֖WC��Q�Q[<٭�FGFm;|��N���g3�ĝ���"��Ò���(}�t�E�2N4�ic���wĬPJ�0�h�`�&lS�1�Nd&�����Ό5:;U�;�����<�G-T���z��-�'dIC_����B7_�hw��D�ƽ�Py|��Id0�e*z��n���7�@�D:��s��*�¡=�z@d��b�WD�]�*E�8�L,!bJ-�6(��#D`w���j��ݶ[]5����V��>0>b����v�wF�a'��-�}u�(̒��N<-J
sV�x�JZq����v�ZkTv�ՉջR��5�PTQ�d���g,���95M#�j۫,�_e�V6�bOQ<#$��/؉:���:c��(x�r�x�ܼPQ��X��c�\�D�ޖ�Ȉ��͋�IF-�H+��ͼX�xՃ��$�i=���Zo-�]�l���c�����x"��<�r��ҵ�ҼBy0iٵ
ϼR�l�)�W������W�Q�{M=u[�ת�\7�^�s�:�0�x�����mc���r�D���7h�(1�7*����/W~�".6� ab�+���b�0�|�f�f�J-_���j]:;���Jͫ�Q�V�൪/�u��c�(~�(����Ƙ�?oP�U�B�գ�/�MJ�D��8���d~W�+�zp�W�~]�U��a�2�������3��r$���rn5_d�d�g��*�lú��֍��$�Ɋh����fvz医���_o�Vs�y����:��ڛ���T�;�榽�P��{�4�����p"w���-Z`�oʫ�������mhJO�wUe[+�*�d18�U]	+�����u��e��6r~�Xǩ)�)ϥ�n��X�x�0i�!γʈ��	g�f����;�K��s�{�޾J���R-�����s�%���0��YOОs��s;�}�f.CS�+���E�&������r�2}�*�|�k�3�عK9z�"��QF������V���;�eS�܊/]�+�H^\Վ��p�����dw�X��vv�����r��n�ż	����J�����V��ی�vv;��ݼټ�ݼ���n�f��n�a��n�iB�����`Ʃ�ex�Q���S�t�g�y}�Q24[��7��&k���U,�
��[��O�-��ۭ��[����y�;*�����ي�S�b^�`�����
���"��R9/-�M��>�3?c�4��w��]e���TC�s˹����j	���\T��*`n�UNqv�*�if�T�Do��j'��+WeH�a&$6�K�D,�����.VE�v٭xv	�S����͉��d�H���_|��~����_8�����>���o@~���/��Y~��>9�s��zzz6ka�zuK�Ĕ��g��i������0���O/�gi��DHa-�Z�(����k3���6ï������k{����ǯ��k{����ǯ��k{ڞ��'��	h{ڞ��'��	h{ڞ��'��	h{ڞ��'��	h{�ڞ��'��	j{�ڞ��'��	j{�ڞ��'��	j{�ڞ��'��	j{��=zր�5�g������ӣ�zK��Zh�_ZجK�ZP�������W���c���{�lт%ߋ|e}򕉫���BL�1��'E�\�0���"����]J�#�̩��(�vռa� ��p��N�EW�Ȱ��+2��A�.zo~H�iԭ�{d�rݔ*͸���[G���Q�QkCܝ�7�髢�\17��[��rt�R�p���s�Y�QOd��1o2�ƽ��LYF�ZC��H�s"X��5�����\E�j�����&���0�/s:���:��c�t��ZXmb�nEQ�P�XyV/U�8��I��j:W�<hhI�K9�RS�%�o�R��i,�B��[Di ˑfL*
B�
^c�j�� ���5f���g�X���V�VAL�{^1�a\$���~�r츊LYYP'&v��J�NlP='o�_���(a�r���T��B�ڥ
�%k�w�|1D�`#�G5�3N03V���'�N�p���0L��;��(�G��!|,�E��O��O |"�$�'�O!|*x-�u�����o�Fx��p��p�O8 ���B�t����E�	|6�s�/&l�	��a�68Bx<L��G	��q�	p��Vp�p�!��o#��������R���v�;	����=�.�S�i�y�n�{��3�"�x����2�
�Jx���>�~���|����|���W�|����|���7��r¯ �����&��k	��z�o ����o&��M�o�B�V�m�o�A�N�]�������o'|���	~�w��%��{	�|����'���$��a�?B�Q���Ꮐ?J�c������?~���O��I����_ �E���_����� �M��������? �C�����?������ �K�S��5�߀K�i����������������;���I�_�~���Nf�3c`�p��0�k&��[�>�m�v����	� �$|x��`��Yxa���� #� C=�H=�P0R0�������O�L��ׂ�^�"����i�M���=�{�}��� � ��� x3�-��	�>��Y`���?#��!�3���?#��!�3���?#��!�3���?#��!�3���?#��!�3���?#��!�3���?#��!�3���?#��!�3���?��_�_����O�=»�S���y»�{�3����Y�����
�*x��^�>���_ ���E��	_���e��	_���U�	_���u��	� ���W�R0���� #� C=�H=�P0R0���� #� C=�H=�n6��Bn��*�����_������{7�l�sce�C�z�0�?d4<h4�/��U�7�=�h4�fo��^�����_���ީtS���0W54��ki�=����w�����X����ږ�p�hh]B��%5���Wi�F��k��}&E&7�'��ݷ�䶅+���������`�8�Va��%L_/��R
��yu{�=�T=�>�wm8���Ɔ�F{WgӃpKG�F�X࠱�����t���������X#z:yGk�Ac��U��矚�L�"��>ܕ�kh�E�=��,��i�.���8�ĵm�������Bz�}P�&��� �Gهp]�$��$�CK��DY؂�Ǳ����1ccW�~=m��ڰ�؎��&�{eWg��w�7�nm��u�:[��n�����[jߓF;�*�# �C�\��؇�x���|��YXХ�-N R�w�}B�;"=`J�a���@�����$<�,%�)	p���y�{����S�PK
    ]N#8�����  �  /   org/apache/batik/dom/events/DOMMouseEvent.class�V�sU��6��IJ1@-���	^BE��
�E(�7ɶY�&5��O߂o���gld����[�ר�x��M���:��p���{ι���9'��ߟ]��XM�!/*�y��|��a�Y>���
��wCw��c|8�׏�qT�8�Ǽ�ƃ=���xD£|�1.�����I��GOr�GOKxF³�c��d^U�},V��	%3��5����\�1��eI����W3����)�!�`h��凢GV'���HT=L&zt+�L���H.�jj~�:�3��8�V�c����P�t�Pr�hY���P�����hϥT�`��U��Fj~����JuG.�dz���ek�a�5��(�J2�F����ewggnLWEpt����.�@��J��M���ƴP�1����`�q˴6h�5I�s�N�P�m�dH|V��ޙ�.nj��Tn�i��m�9C��d6�d���F^�m�U�����g�MZ,q���7Q06�z�a�5;mc��j���F�%3Լb��V�?��K0(6q̠దѣ�	��+I����1��_�ld�|���QU\]N*ٶ��䧥$�AaM��	�0[��)z\-#ԽVU�
��`�U�P�13IEd��>��'Sm��!SͬH��f��4��.J��6�0�2n�����2��T����1����M�L�ej���۝�'�m��3Jz9W��
�9״�c��۰D�R>4�	K��sY#���x�����>�����ڕь����8�0̳�}/`��E/�e	��x�ѣ���8��e�����x1o�m����w���B��`h�Ͻ�a�,��c�b��C�:r'�E��e�ew␚4Dw�4}�ȨA�͡k�x3n���vkV�U�R�
��]%��z�(o<ց�?������2�nw��$��K8�mj�=��+�>/�"U�o�Kq**��/q�Kr��U��g2�*D�S�hm�;6E���+��VH��@�A�.�B��h�M�Le f����h�=��+IڄJB@U�"X�2*�/�r�O��*�	�DY�&$��X�;�Kk-�Y��4�=g�S8?.:p��u%�΢�z[cW��f[�;m��r㘭�[cw��^[�h��א6�󒱣�3o���ޢ�����g�!a�a�u<�6�m=�}~����h�!1Pn|�6��/���5ނ���]��3��c�؄~F8�g*Y8چ����!��K��4஦Pu��9.���\�[�N_�/%S
uF�]�<��1
zI�a8��HU�n{��\���R�?/�w�鯣��91Aᝣ�����zp^�`�e_O��(�FZ�@�x�.�6���t�*�˄#�j!��C�I�7$M��'!�C�I�C޳�r��7�+������ ��&�'��m��/��W���1ߠ�R��:����#��O�9?���{���w��T�I�����y��eHs�x��P]V�M�R�}��!P�?�@��\���'�h��G���+н�|�GH� !�@q���;�B�i�������Ȳ����rM���S0���^�=�	�d��L��p�ڰ!P�6
��L`ߩ	���8�'����_��^˃">�̅�L��s��y�#ɋ�a%���������G�A6�Hn;j)y��5(�"�q$-���
��X4���8�N�z,��pI�>�� �#'�+'�''R(E�Q���*�f�!q��?PK
    ]N#8�#D�  �  2   org/apache/batik/dom/events/DOMMutationEvent.class�TMS�`޷M���T��
��A���8ա����%�hI�4-�/���x���O��Q��nӂm�����g���gw�?}� )X�Bf#�K�\�0W��Es]�2��0/�M1�,q��̔7M��e�h�����!��Dv���*%<�5n��]4��c�ELPls��]��d�6¨��[���2�[��.0j�i�>ٳj�f���7�<_j4Q�w,{���eU��A��[�����:5k��V��{kkU_��m�uMw���A-�'Rż�:E���feZbE�n���dT�����?�b�X묽���Ug�Q^�b����c��"
+p{���!R�6�S|*�L�o݇n��im��Xs����b���L�@��N��Q��g�cc�<���]j.�-W��y�o���(�� �UP�K�n�Q�W�>a�a@�XT��L��%2H�-=���/�^���1x)m�"b��'1�X+Kl!y�-$s0�Q�������@��z���8�
������@�Ї�/�>Q��0=��q�j#p=��0�A���m�_�������9_�)_��N^�%���C��U_�8��!�?�����3p�#	70�O�샬'�:�D�A=���'�:֎+u�cd�.�*{����q {0/諏���
4�{g�&�VHC$��J!�B���	M#�	�ǯ��I�t��fG�k���H\��HA���tD|t��N_a��x�o���x�a_�IǓF�.x:4R 4���H�DH(
�=)�		E
!�(�/R_3�PK
    ]N#8�A'�  u  6   org/apache/batik/dom/events/DOMMutationNameEvent.class�T�NQ]��v�
G�W��b5>�oDc���D��I-3�0��~����h��G�>;�	>t�uV�e��w���o��p=�s���0��l�|��Q�Qձ 0�����+���#7֞��}���^�j��뵗��oK���v=7\H��7��@��zr��ے����H��;vg�\�G��{7�~жl��#���o�mג�������^H��q�G̒�"׍�!�(�Uom�
oo:*1�_�{��H�u彠M�;�w��"��*�F�rd�>�F��r�+(�/,01���5�a3���jS�eB�'۶���
m>�-�dy>iE��G[�k����+.O�L�h��00b�j��3p���E��]�����玿U䕐u��P"��	�\�i�<&bey����Rp�>:����c�o�Ɠ�3C<���(�,:������'�U�Y��5�G�Nj�Q�{J��y�R-͚�"����9@�bf���X �-*|�2,��]��q?C��Q�d
��0MьNJ+d�OSh��2
��S�gIq_�b��,U��E����e�*Ҧ'h{Jx��oP�M�m���H[	�"m%�2��T���Tj
�ʌB3J#V�C9O�|��Hx���11Xv�/)��_PK
    ]N#8IBAB@    .   org/apache/batik/dom/events/DOMTextEvent.class�T]oA=ˮ�K����E[?*,M�����4A��k"-�4,�
K�T�G������G�+��Ԙ>p��pϽ�����7 ��H������p]�nZX�p��hr�*����m�ܪ����`>�_n3���>�6C��b��i���7�B��o�x�{�h�#���T�a����;n�K����v\1��;ϟ�7�QC�%�ֳ�/LS�R�F�r~2�^�-On{���'=���ɐ{�F��I�ϒo�E)l1��4���:5�'O���7K��h��n��<���?��W^N���fJ�#zd�8|Q�
��n?��_�h~��MU�F�6�a�F���!��)���(qe|����:�ʩQ����sYY�+��;#é8���d�LC�F?9�0yHѦ�K'�3�|�@ �ES?^�E{��4��IK���#b��"��3X��}�3�w�+������M|B췊9�)�!�w�~O����
-�XL�e\ �B	�5�����e�Z,r��wd�Eg�)n䖌l�DN֜"�D��4���;��DdȪ�����h9��r����FJ�r���PK
    ]N#8�'�|  _  .   org/apache/batik/dom/events/DOMTimeEvent.class�S�RA=�]#1��\�[�	�
򂅢hXe �M�Vs�v(���2Z��GYvO�!�/ӗ�ӧ����?~�ǣ��#�,v��y�b����ᾀy�#��b˫9GUg��p8�;�?�d5(S�,�U�t��@�c��+F&[�.�[�J Yt�j�QQޖ��)�*���^���q�4�=��5�ܗ�=�Td�~���P5�Y{���6���=VSz��L��a�T��K#���<p���R��^J�.�5�xn��|^��>�U��˝�@׌���`�O�þYxՏ��&J6eC����~[�t��4���>	�Y�x@�R'%��ցWU/]~��^��y�������ࡅ,Z��;��>�@��ҿ���+����4����?�G��^t�[�Jg/�4#q���A"0ys��L^�l��$��)r�
��w�/�D0SH�iu
pi��;����`�/xW���O'�K}��0���:&ٔ�3�o0�|{��x���xBR<�N��{���dؕ�븡�R�$�"ڛ"��Nc&��h��i;�g�{�IG�>��I�"u� �Mͺ��vY��Hִ�h���1�I������E��6�ǌ	�ݦ�e�4��h�)ʟ������PK
    ]N#8�z[\  �  ,   org/apache/batik/dom/events/DOMUIEvent.class�U�SU�ݰ�%ˆ便-���&�c�*�T��b� 
���d	!��(}s:>8���9����� vt|���?C<�fHV�q2��ܓ�9�w>�����+�^l��1A+��˰J�_F���qSE���[�P0��C|��/�:La�/3
>��m�
��Q0� m��6��d�����F��ip�k�\�1�����v��M�ᆝ��A��X|���2CC��[ӥ͔��1S9�4'i3�`:6?�J�[�]���i���e�L����-+�������M.Sl%k	�c��S�|�gK�o���c�%��-�ș��1�9v>;���<�<S��)Z�N��V�AK���R����%U�ʙ�t
w-�H��B�� 8=�0@��nț��K���g'D��[��T�ka�+A��4}GBn��lb���j9G�e&CcR�윑�]�EfS;rV�A�+���5n�qh8nu/��p4��Y�8�a��b������;�1�/kXA���pO�}�C[0G&R��(�4�"�a���4^��u
X��/6���>땏=w��>��Q���/�	�`��#������11,2u(뭑�^3�a��u�RU"7s�ݩ�<���l�:��.)���q��8] �,�|��<��}pj�BE�������E�dfȭ~2ǙԺ��x\ɵY��ĬЃ[	@�p��X4Bч&���F�e�Ӏ��A'�vF{8�����䃀+x�V��Er�/�*����qo��t�|wʸ/��*��ƟB"$К��Q��h�� ���OPs�E3���_����
��[�/�b��X�H�����MR��z����z��aBx�g����]��T�|�Â���"����:.�*�G\��ϥM�
	)�si�$!qVa!qV2i_��
+6Jh�w�)���}(S5}RW�}a]��ߢХK�K��H���?A݅�w��S�-�C����2��lo5������4������;��[|���?~��}�F�_�t��~C��LRi@ϘJ�X�^��S:4'9Jq�
]@?��'�Cmt����6iw��������ޤ��c���-Q�ݣ"Y�Wx��(�� ŕ(�c�����`9�7PK
    ZN#8�m]\g  �  I   org/apache/batik/dom/events/DocumentEventSupport$CustomEventFactory.class�R�N�@=S�(>Q6�5���AHLP��2�"tH;��W�"��𣌷��1!qs�}�3�N�����

)İ�c#-�-�:��3۱�C�Xj3D��#��7���-7��5��m��A<MFU���V�=%���pT�[J���+�nu�=OPO�!ݮ�G��	��ʾ7:rh�������-4��:��zʐ�\����b)�}8�f��*5�Z�w-Q��a�=R��1�@G������yt�2T�a#��`c����4�¢�������Ѣr�C�΅��nG#����$E!#��'`�a9E6$�>��g���� V��c�j�WhwD����3�Ĕ�!�5,��q6�D�8�N<�	PK
    YN#89�?&�   ;  C   org/apache/batik/dom/events/DocumentEventSupport$EventFactory.class�N���@�H �t-%4,%��@:�+��X�B6�l@��} u"�
�hpa{<����_ #tB4B�-m��,Β8Bo0�6v�.�6�ď3U�SB�2�ղ��B�~��
�dWy��F>s�6a�u8e��f�?>�:�`��{%����$;�9�$#|xs�U?������P����]�2����h�PK
    YN#8�܌�h  �  F   org/apache/batik/dom/events/DocumentEventSupport$KeyEventFactory.class�RKKQ��3:Z�=-7A��p��=�,!�\A�;�E����Ὺ�P���i��L"�6���}��y�xzPFAE�
�TH!�(XU�g�L��b��C��4C�f��*��½�E�\�1�u�]3�G���6=�������*7|�0d�m[��{������4��F[h:��;��t5r<��1�.�"�F��9��9!�ϐ6\�}E
�R$z�g�kEY*VN��j�c��P��>�@A�a������(Xg8��.sao��vK��a�>�S�N��OwgZ9l N'BA�"ћ>��y!#Ll���JV��oH��|f	iȀȻT�ϐn��=L�����_B.��%�E�,c��2᚜�PK
    ZN#8�rj  �  K   org/apache/batik/dom/events/DocumentEventSupport$KeyboardEventFactory.class�R�N�@=ë�(��@٘� c�ѥ��1�,0$.�e��!C��tE���Go+0Ą��=s�̽3�k��	��|Qd5l%�qGî�C��r,��!\(6"e����g���"��4������i0�v�C�N��U�2�[�+Ո!u�8B�m>���I��y���ܵ��������kiz=:�ߗ�=\�{ΰb*�]D�b��rf�
Y*N6��LQ���s��)u����!�p�g�����4�3T�e*�u���N[�]a�d�KK���y�dY9 BkCKB;�3=y	�tBF=���$�X�`�l꧀0MHbcJ>�j?�@�i���<��g��)?�L`7�F�	���*ec�{��7PK
    YN#8=Mi  �  H   org/apache/batik/dom/events/DocumentEventSupport$MouseEventFactory.class�R�NA}=,æ�(��1zt9���0${��4��_�D?���?k�	�R�ky��:������|��XO@�qSŖ�C�ĴL��!T(��e��i�+o����}�dk����Mߟ�n�t2u�9�b$,��W���K�v��GPI�&�Ƈ��
M�y���@>��*���
$��p(mw��1CҰw'Q�|����jA��M�ن������z�z|�SPc(�9`��5������ð������h�'��taݹ��,*�]��T�0�nz��'O#d���1�c�N���7$ɦ&�iBZ�)����\�����9��?6�+�v˄�`�,Q6J��PK
    YN#8��^l  �  K   org/apache/batik/dom/events/DocumentEventSupport$MutationEventFactory.class�R�N�@=S�(�ec���F�>6�d�!q9-(�)-ƿ��&~�7��� BLH��3�q��;s?�_���O �����U��1D�M�t/B�b�!\�m���������p�nQ$S��Z�1}�]sȐ�{.wMiWF�v��p��Đ��m�->
���I���7�Bө�Ak˾&|�P���קS ����t���#�+�(C�P�O�i� Kŉ��CTM��ܢkJ=>�)��1��c�>ӑ�=�ʿLŰ�w�Y��h�'��bi��u����>´6�$�C
��ȋ��2����%H'�F��'�dS��iB��	U�����1B�s��)~l�W�	�V	3A;[X�l�p7�PK
    YN#87�)�p  �  O   org/apache/batik/dom/events/DocumentEventSupport$MutationNameEventFactory.class�R�NA}=,æ(n�\L<����傒Y�=Ca�3�JO$��~���X3p@D/��������>�_��!�M[1(�H��0��L�t.�|�!X�-�������}]�7\�Q$U��5�mz�4t:�!]u�Ҫ�	�)qÑ�C�lY�.��p(��"�����M'Ν֒}Mx��v)�O'_���v~�>e����$ʐ��}��cV��Rq�!]�%�k<��B��x*"GK��Wt�b���o�1�y�h=n����Mx�g�����.�q���5����R�LOE^�<����`O~:F6��'��&	i@�O��T��"/Pn�<��?f��)_AʷX%L��lc��a��p�PK
    YN#8}y]f  �  I   org/apache/batik/dom/events/DocumentEventSupport$SimpleEventFactory.class�RKKQ���-˞�����p��=6�X.���c�bF��VBA�6A?*:3�0� hs�{�wι���� u���.cCA"�-�2J҉a�C�Z�1�N_0چ-�BK�5�L�ێ����ȟS���)�5,�ͱ���ǻg�_ض�&�}A5Ͷ�T�r}(T�ƭ�w,UD_=w�ТW,�]���w�c���	L��j-ֽ;����,+]'�t�2�aK?5�����!#�P�u��e̓�����]V�ު����FB�}N�,���_݃��a)::����c�˒�2����1N+d�8�������@HbuF>��(�yF�f����m����(�v˄�x�M,QV"ܑ��PK
    ZN#84f�f  �  G   org/apache/batik/dom/events/DocumentEventSupport$TextEventFactory.class�RKKQ���-��2�-��7j��˅"��3^tl��yX��Z	��~Ttf�0� ��＾�s8o�ϯ j(kH`]ņ%�M[*��c�6�S�X��e�ם�d�5M[^#]��[�7CX]ᚡ?����1�t�1������Kۖn��'���t�>ca$ׅo��3�2�x��1�Y�D;���]�<b������J5R�;4�Ţ,km'p�0�F�?}Q���BE���k���nT���=--��[���>�Mt�gم�w��*���L�(�f�i5��ㄌ0�7{����0�
Ȑ��, �ҀX���:̥^��L{\�����_A>zװL���)`��I��d�PK
    ZN#8n6dnd  �  E   org/apache/batik/dom/events/DocumentEventSupport$UIEventFactory.class�R�N�P=�@A�11\P�K_1(		�%qy)7P,-��_�D?��2Nk@�	qsϼΙ����z� PAQEk
�UHn*�RP`�O���b�r�!^���!�0,q�;¹��"���s��#�`��.C��~=�W�g;���e	�jr���l�NO�#������u��&��]ٺ?$+�h����x{��'i��a��X*��O���T��b�e��.jF0d���$����y͢`��⟛0,�5�[=����9[Xt�g��E尋8�݊D6}y)�4BF�8����i�^92i�3?�9BZ+����\�����9~n�����Ị,a>gK��	���7PK
    ZN#8�X�T  �  6   org/apache/batik/dom/events/DocumentEventSupport.class�WmSU~.P6ل !�R[���DB[�����E�M��7X�K�ݸ�᥵��V���G��3~�:JG�Qg�����P����KvC'�{��ܽ眜{���� z�� �������!'b��9��ȼL��(���W�
"���
�DD�Z�6��{�j
(����%�}X�aU�u����"ঀW����׸��o���� ��Mo	x�!�(�VH.ɪ9$�LM_e���'�a�CSV^1�O�Ƈ�DdD^��$}�M7�f�SZɐ�ܞTɔLESǤ¶��搛g�B1��٠�ɉ�Xv*;y)IF�%)����x��u���!���)�愔/�-��lv8=6场�f��SI�PS*=�qS��.�2��H�_t����լ�iN�g����2L�NT�R1�����9HU%����?2���q�(����õ��V��L%�(Yi&/S"��*�b�g��uN0�%�YJg㨢�c��[�U�rR~B��7�:sA!_'�}Y!�A-W*�f-q�T,j�I�9]��r0��*W��2�|2�f=O��ή)�y�ᩪ�8�,�>^u+9��+��SD��Ôuwef=�|@�<�]�����!���kv �1�:��"1��.ˆ�;A�������ܸA���h�v:C�j�ޭ����0��ve���@��+�a����$��X�h�T�U[��������_���%�8�vRV^�X�i�\�AD`+�����v�k�[�F�� ���hgS�w60��v�ah��FJss�NӀ4�\DM�ng�A|����w���$�q|��[mhdy�ezfQι�r�`SՖ�B2�Eb�^�om�D�O;�a�d_%�YI��y��0��x�T,��,C��9�K��3�����xL�޻/��[�qz[��p�	�`�,�w���D8������pҁ��7���?��_t�(�a>H�>Bxā�����G�	�/�:�d��>X�:j&���u}���5ԯC ʷ��-.@\��,.D\��5Y\3qa�k��q�m���ڈ�cs�����ln���'�a�;�_�#��������w,���=K�ZO��AF#�~�����Bt܁�ϱ�o���p�&��-��۬��e�,�d	1�������jI��<Bq���8����u�&�������4�ͯ5<z=�t��8÷v�a
�������+*�-�Ѳ��\�b�G#}h\�$�~�X^1������֚��۝�!ܣ��O����õ-?5xɚ=��$/�&��%g/��H��|�d��$;H�"�L�4��'IH�!)��#y���z��PK
    ZN#8�3ߢA  ,  9   org/apache/batik/dom/events/EventListenerList$Entry.class�S�nA}m�xˀC�5��=�=��(�(�HV�0���=iٓ�=�L;���G�@�B��pd=q��? �ۖ%/�KUMw�W��z>�~�@wr��fi�Ҧ�MYW��4*iT2� VB��a�FM�����O
�boS�� ��#yG��Oo1����!��\6���٤��݃��G�=�+��:<�g`�(�Ⅲ�M��#�ޒTc���X�w�N�Z�kp��U��E�BR��������I�*���~ ���tL��qrh��:Q����F�+�@��n�!�'��z���;<
������b�i�!C�T����!�����	1e�y��y0���'������ia����8� ��9,8�"�`��S8���Ӡ���`h����%=�ʱ�D?V�~�,-�"Kk4�d�Ǭ�����sʨ��E�z�1��w`�J	w���[��rV�[�{H���.�]4����g��g�ؾ�*��ݬ��p���Q����ބ��⤉�f�DZ�M�W����#������C	)s�Ôs�	�r�h����q�ϩ�e\�������({�j�њVi��PK
    ZN#8�*�N�  ,  3   org/apache/batik/dom/events/EventListenerList.class�U[SSW�vrB n��F�ZD��[�(m�� �%
��cr4$1	T{�>ة�v�N�M�t:�`;�3�S:��	f�П�Ǿ�/�~{��F�������}k��?����v\�`�����U��n�x�*,z�p�U���:$��n�p>*�E�cr8.OJߐ��r9�F�����Sn�v㌀�;��^�{R)3ە4r93' R��h	ӈ	��Kg�a#cDfx��[ñ�h�7S�\�[N}V.o2���T�6��hz�;�J�[�pO*�I��_����ȮS����d "��	70r����ڭ���p6o$�t���R���舙U����Fr��Zrm;�|�"���K�F,���i�`�ᤑ��#�����=�94r�����%o�D�M����Q3G8��=�#�Y �lz,���}�@y������
Tg������hw)F�¯e��@]��/�H��4o[mmK���Ut$	ȥ�\�6a�l��$��wLUlL�'��F�}����G.�.#�x�L���H�hؼ��ױ[u<�M:^��n�����؉]:lhY�.눎(b:�Q�f4�0q^G\�ZѦ#!�	��pA ��{����u���4�ڼ4f�-Ƀ]�*)�2��Լ��}z/��WZt�;�V*�R���B
l-��T�;c&�9�l3cy�d%�.'���?3�_F�٧��
S3+S�,5��8�!dus���8i�� ���1� �)h4]4˦����9�a0���aa��=��!D���_l��7�	��U�i�h	̢&���b�����U�9Tɹ2t�=i������R5��2�TO����F͐�>j�sS���)�����"f?<;Q�.�����Dz1��B���J���
�%wPD�6c���V1͠���b�*	wcO��8̵�<#�Α��g�N�ui/0�#�c���yL�T')hg�B�PՁ�B�j��RA�r��A�O����C�j101?��H���Ջ=A�^�d�1�'���8�Wk �p�ڽ�>�cs�oͧ�]���.�{�p��ޥB�����-�;�Hu��ҋ���3E�g�:�(u����u�眜�mݬ*��I�W���"	g��?8������H���'��Q���I	�LrWX��b-���>�����-�nD�-��׆�㺝_����~�4���r�4���u���z����3����&\b����ծ�4�r�R�nuy���h�\�L߀�jW5�sE�OouM��\$ԉZ�S�k��'�2'>|����O�l�/��+v�u����a6��1���8n*�$���B��lscٹ��Lc:���k��h!%����;_g�G��H9je�n��M@s�� B�Q�Q�2|��n�?(L��(E$�6A�]�]a��c(�YW��wz�\v�Tc76p��[[�PK
    ZN#8ˣ�p-  �#  .   org/apache/batik/dom/events/EventSupport.class�X	x\�u��fӌ�v��X�l�m,i,0�	/�l� c�8�d$=K�1٘%��mS���!6i���"�&�� N Ӑ�Ihӆ6mHmY��,4��ϝ��h4�%��O����g?���>���&�J<��x,��q��p, Oz���;����Nh�+��I�=��Ӻp҇��k><���P��8����:��6/h�m�Fw����·oP�����N[�/j��:��|G�Q{�T���"�3�E����Eh�����د�)���(ƿk�?��C��[~�s�j�5�Ӈ�
��]�ux]�xCzS{o�܏}����4���|xۇ�������W
��+������x_Gt(e���`IG"������MݑT�����@�p*k�"2Կ=��[����ݱ�g��D�-X���{(����:�� �K��hj�`ih��_K�v_��۝��v�CF:=�ص�dT�Τ;�%M����=v<5ԴI?]Ã��d�4I\P��5�c�	�C7F�D�b�x_SWJ%�j`�^�3	m�X�.Csjߠ�p��0��ἳ�	�Cv�QeQsI��ܐ��s!?����7�=)�l\�V<2`Q���m���dbxp"��I
B�	�ή�1
�˃�I{ ���QIu�Y����+�׊IW����5�E)�'��W��{�U����0�N��Vovn�$��ԙIn]NK����?U�M�����v�o�~Z]Ô��y��	$�c�*��ϐ�b�{/W�"@eZ��@�ev��쮉;�n�S�D����p|��;2K��8s+��D6T�B�Ue�Ѷ�x܉�UYdmN���U�浺���e�pl�bw4�cX>����)�J�cm�s�=R�c�`*�cnj�Lr�ņ��<��3��Ĳ|� �+��%���I;һю��[u��~=q9����s�T�3;����ߤ�k���Cu�K����3�n�L�)�rƊ��ФйlZ�S��ˎ��Y���`�Z>�_�C�H�9�8��P�d����3��/q�&z������D��@:�e�f6��ǔ%B�n��n�\V��lG)��g�ff4�R�[���H_$-����g2�t�(���7J�L ,L��N�e�#w���d��㎙l���3$��d����9��KEH���h_4�9�tuh��8UR�%�Is_�+1��/�j�X���W�-t�7:�����}6�J���(�-\�+-�����3��
K
�e�����c�W|�*��i�ǝ�c����se��i� Y◀O�,^�K�{���c-|V�-�j�ym>�{,<,�<1)�YxHO�XR&�TP�R)U�T����ÒY2�'s,	�\��XR����jr�d�B,��%�<KI�%���D��d�%!YnI��4�t�Tч�&�j��cIX�X!M��'�����Zr��d-4���BY哋,Y-�5��#Xx�8fI�\B۔�	Ld��ʥ��tKV���g�B�.��KC�Br�X�N弮��i�4�&�<u�>k�����������<����FBZp�qx(���mXZ��uX�;��1;ާ����.+�C�'h�DQ/eզy;ʪM���m�b��==1;Bn�ؠ|-?I9�*9�����o������b��쒷d�+�S-fM8�UEWL���:�[R�{��L�u�g$����^���H�tV�SrZ�#�����=�x*U��8;n�CgN+YO�g�C��H�7f;az�T��Z�!]g��.�Rs�LX*�q:�s�v;-�����F�6�kIs�,U虫rM�[#Z&�J��&bri[�[��6�r]x�_�Gԫ�f<���vVUX�;�dA������%yn�[��q�Y��[պ!ib�S;��b!�@% �Z����*�|Y��[aEs5ۭ]����c����Q�G��m	Q�6�� ?ڱ��Y����v��v��
��N�ZxyF1��q���5�0绉�c���;��ރ눣�]�޹������_�;���
��[�>�����~%�'����í3-�԰㛰�әo��8�����P}~�8�6}�(��5=�QX�ԯF1�<���1CX�a,���-hƭ��m����9� ���pzy�G.�Omx��Ͻ�8<��LO�w��r�6�n�yxK���N}���wg促{t���Ź��s��3Y��gH�g��ψߟ?KQ犗8��q��-#l�/T�z����~$�0e}
�����,	zGQz�\�s��(b�i���T��Q�ŗ�����p�%�z7�o##E�L=�V�i�ȴ-#Ӷ�L��V!�]�Z#I/�Dq�����iPiV������8�	_#IϠ��ў#�ܦ&C^nbO�&���m�<@Ӯk|בƯ�������'Q9���O���R�nqݧPt�b�!�ֻ*f��	7�bN�5��6s����\m�'���N���>��;��VV=O=�����pe�?�bA}�v��ӟ�vj�h����f�C4�mA}Cؕo)]|��T�<�{����ܒ�����#�_$ƒC(��w���d�� BlH5�BɽJ�|��~����&�-���t���!�0�K��ïH~Ck~�n|��J���� ������#|k?� �"��b|]J�-)�w�?�c�5�ěR�w��)��|6�K��勣�ϙyF��2T�E�:�/a� �����h��9j�Fػ��bzI�+���H1ܸ�߯�Y�����^�^�1��,�E޺�z�	�B�����A~�V���e[O!�x!���q,.�a�^pjh��(9�ʸ�ש��bxd	��e�A	a�,�
i4l�������n:DY��x_S��;JL=~�B*�N����$�tk<a��x]�}վ0M��p�o�(V�O�ZCLY�P�K�!0�������S��n5�aSz~%9�� ]Evg�-�lT�A-�V$�G�<�k���Ok3�K������j��=�����>�k�7-��k��p��`��ղu�+e=.�X+��"�K6!"�a�\��l��w�U���-�8 ;p�\C���Wj�v|�x����S;�����p�I!~�KE����A
���c�J�	c��gTt�ب��*���ޏ�U6�6=�8��!|��y�*8�r:���Q����8�lMg^f
�\��V��S������T^�af͸�՛�W�Q"��U�G�E�Hn�	�A�X�v����Ӝ�9�O���7�O�Ï�:|�ᧄw�	Q|��\�,
��������Ǩ�4��K�k�\+�p�i��>�fع�����'����1�]����jwC�~�i������G'�F��쥿�B�هR��r;�X* �w�|� ��]��$���$g)kU���.#�u�0��l>���u&�h���04j<X�i�������X�f���$�͏L�9�f�ב5�M�>L~�壘/������*���>��P&�T�I�*�N�HS������������8<9<̯=�ʔ�K�NF�U
��q�W�v9��6B{�䡬�i~�����i����RSVh~���&��T�ZE�����$6��O��������m�1l:��4j�`ְ0�lE_�%ǩ�'h�'2��x���w�Q8)���2��2�O�����S���0T~�s���+*Vo�7'�r�g(�g͝һ2�^'�kO�
�0�rj-h.�D��YQG�l�x0?��\�o��i�~>?jM.�w��ҴQ�/����'��Ӗ��8���y��?"�gE����!��,�Ө����z֛t����²�y����魆q7���y�W��b�1��'t���x;su1�:���3�+�r�(@��/��������PK
    YN#8˻J8<  �  1   org/apache/batik/dom/events/NodeEventTarget.class�R�N�@}�@EA�h��a{���񲴛R���.�y��(��B@bL<�N�ޛ7����������cU5B�W�=S�q�qiC�j4;�����;Tb M�"�h"�\��U�M����Ԍu#O����/Nk	lV�$���0ᬑ�^���>��~sUl�(L,�X8%T�祂N�*�uύ�HΤ����A��? �j-���JRo0R.��D�i5�fj�����)8�T��6+Bumv��+���&��C8���"�b�`���������>;���,!��1+���c��l�u�8`��Ô+��8��*�PK
     ]N#8               org/apache/batik/dom/traversal/PK
    ]N#8��(6  ;  4   org/apache/batik/dom/traversal/DOMNodeIterator.class�V[p[W]ǾzX�v?��M��$�s%�i���.!�E�,��qHb �ҵ-G�2��)���i� :��0P3C��)Ж���Y~`�����<~(��թY�YVR<�s��g�������� t�b;1\���ˣr�˨\���~���q*��t�ę(�b"��C����8'y�\&咑KV.NS!L�0#J��c�ޔ���+���z�v~ѩe<P"㽩d�$���S�#�����{�:]K:[�,�9�'p U(Nw��vf�隴����la��wr�+����0����%�.d�E.���Xat�p�A&�S���ڷ���S\��JqP�P}��<o����yG�)��g����s��x�B��Ń97�8��1�y��ѝ98N�}��T�uҋs�Nq̞�;*;?ns����7�c������xH:Jҍ�d"jY�viCfT�Ɲ"��aM�oD����`�"�S�TYj;�u����W�x�r�Re�&�Q�$�:˞.�9_t�r���*Y�#`%��ms�+�pF���h�1v)),Z�Rڔ᪭q���D~���M��-�#���bFb!�\���Y{�6�~L�c��}�o�n0с�&,�L$$/�V������Bș��y�` ���9�!L��#&R�p&<��X�˒\.�e�m����e�]y۝���u2LS��k�����	�7St���w`9��{���D�hj��W̹�=gS���lm�r�����,0;K��.�;�E8��nՑ,���f���D;��Z[�p��4|��������6��ԫwS\��fry�m���7���3�'��+1M2S����8�wr:�B�qZy�]�d�Azw��Ի��;I���w��˳!�V��[��u���U;{W�	%��Ntq=Dj����;�oCX�5�X�5�Z{�`X��VK`A��j�����õa�S�;�:̠94�-��<��c,.��1m�qD~�x:ʸ�:�ǈj��~�תӻ��N0� %���G+���ͥR(A���;S���{�(_�P�hU�cxo�@��WU>��*��J�OTU>Q��CfC�=F���T
�-�'3����KP�f{��N\A�E����d]AT�" .I�����ɡ�]����$�u4�M_���X���R/El!��Iv�'I�������y�x��_3_��r��J��J�~�z���~�VT�2T�OW�ۛ [��v���]a��%�����/��ϑ��2`����c�v��]�e�8k��gӠ�������R�����A<����Q+@��2M�
��2��:����
Z�g\E}�9lZ��#o���-�`6��^AD6��h&c�@:��:+!_6�[鄲y:����vw{BIu��:M�	����%xXE/�4I#W� �HT8o!����i���H�n��]���	5�~��KN����_s����N�W8�~�Iq�3�|f�a�i����L���o�Eop�x���������_x
�Ƨ�|oa�������"�o� �!� ���h�+b��&�&ZT�F�i6��Z��b�����g�*��+ƪyϲ�5��+;ב$��"zX�>C�p��$-�tS�ZWdn��r��,TLfM�o�b�~�u����S����䤗�{Uo3�i�q�;�m�-�q��K�C�؏C�B��ᘈ�O$�/�AR܋	qq��(��>̋�(�U�,�}ҹ�ND�I��%?;���֐�����������ޮ�ak�M�U�4��]�"{M1�wC��S�o�\��w�2ǉ���hu������a�C8 �8"�qT�bP��Qq
��,Ί	������%ױM����O56�^yK�PK
    ]N#8��/  �  2   org/apache/batik/dom/traversal/DOMTreeWalker.class�WYlU=/�ĉ3I��KRZ�t!�1]Xڴ�M��i�tK7&�$q�ڑ�) � ��"�h�G%�����HQ�ʚH��E|b�?����5������7��s�yg�<���+o h��C!9t�!,���^�;��`�����[{䰷��_�e8��rvH>P��r8"�;=0=�� *���ɴ@U(���X�&���^�Y�{b�Lw%#��C��/O[)�����)�6��q����\kt�L��'ұ��]V���Qk���ʢ#)��҃����t��چ�&�qm���=,�MŚ�%��ȱ+�e��-U\Ԍ�1S1��7��@��4�����=f:v4e��ή�e�5�GUU"A_I�@A�O��U
x���.�dMC���4؛CgaC#	-����ey�ӰZK��i�ePR[A��\v+��6渰,��9g���G���K��b�^f7�����u<���z�D?O5a����~�y&�&]J����Xᖐ��Ʒ��Mw��ZC3��Q$9��Jƥv�:��A�c)zu�a���P�"\�c1����%����3���ؕ��x��~���a�O�Z��h��z9l@���{Яc A1zpT�l��;�䐐CA�?��lYR0n&��;{�(	^�.�\/*�z���,3m1b���5�����	ecF�)j��@(&�rc�f�L��=G�e\�Y��!K%�6���	�%G�:ס���$J����*K�S��"��I!��kR�rP�T���W�kh��8.��a��7^�0|�(0�G��f���Qd/�`�/Ъ +8.b��]�V�b*Ёjlg!"u�>]���4jf]��������Y���7!hg&�}��s���fD��D�F�tq.<�����
�]��|d��ynrq.�Gpu�ٵ��|䤫�-��v�&���:�$�%io�3���D\@�%y�9GXE[�8���<�{T���α������dm�U�TF�xC�	�( �X���(ǃ\?��Pc#���l��i�f@x�1%�c\?~���"�3 <���p��'����A�GaK��
A��π��F%�a�s9(�m����Q*f@y�q�'���x���KD��;��e��$`��g�?�@�?l���ԯF`��9h���\q������~���Jɽ��:{�%���n�6��;|����qR%ndRro����I��k6rV��MN1l���"���	x�LV�4^���N��J;��(c�?k5���W�/������#�~�^�	k��/�g������KU��LFv-^��L-+�[U-�� ���Jڷ�dge:�N�E����Ը3�����{OM}%[�*��+���e6��1�5J���|Ϟ��/?�9�DV&���d��4�V�I��d��l��l߳ųۧ�)9]���*틨�&Mz��UU^P�N~�$�B��(SGE�)��lMT.�%�;�B}	~�E!6�"�
���D)¢ܑ�6v��J$L�)i�]R�R���[R�?,I�-�<�$1�b�E-K�cIX�B�t=KZ�Y�R�tÿ(���LI�=`��?k�1G ��r�R�̱$�y(����3\��M}h�3e���(}�VK�jc��S�v6'�y%<b5*���&Ԋ�Q/n�2���w�f��F܆.�	{D�����D��v��q�J�h��T��L6��Ƞ�7I6Zfbc���F��lt1�n���l�#��F7�8@6���d��0�F/��#d#F6�F�l$����r����V|ٶ���~B�k��ħ����g�dQ�2����.�)�+�}9�'�窱M�w�	PK
    YN#8x}�  6	  5   org/apache/batik/dom/traversal/TraversalSupport.class�UmSU~nޖl���A�Zj[B6%���}�P��`I
B����B�lv���G�_�/��h�h����S��7i^ ���q2����s���s�s��?��$�R��>|��n*ȪaZ�-܎��(��"��1�Ì��0�91<^����
�|��|����rόm#S�-;��j~�!2m9��!��Xf�w˜�d�rx�^-q�h�lZ��\Ӱ����Ő_��Z��62ƖaVx�d��f��V3�gls�fؙ�[�P��r=�w��������aor�����8�J5�2�Y׬W��g��Δ)��pv�k��X�|`�T����?��)�`�5�{$B�\ח�9H�Aݩ~�-T�6O�^�T.O�a�2X��%��=�|nw�pj����lP��7O������$��<^��T�����s�&��ik5���z_tg���ۼ̐H&,��(�`��;Pc^#://s���]��d/E"���=S���<)hH`��ͩ���������������B[�g�a���N�"��1H��rg��E�+x�a	E<V��a_jXŚF�NF�2�����e2�p62��gܤ��΢���2\�I�-uw�$�v���Y�F�I� �l�L;1H7��RO�'<��ۋR�w��t#�F�&�}VK�Cɉ�!~x�A��<����O@!G>��L$;Z���������&�tO�;�4E3��=��`�F�f�}������(�Q���&@��_a�G�78������^"������!�}�A�	��w%�p��{���k&�x_�E\�����q�gHb��	
�@�p'M�
�U=}v$��A�I���7�O�Dtu�O�+#�}�X��i��p�&O4�s��?�U��ij@A�a#e�"�`�HKl (-�������=�t�^�Vņ�П��Y�� "uA�7\�>4���>N0|��d�3�FD�����G���dM�E�οD$MJ�.��'�Sd]��$��t:�1��):��Y�^�ȯ�c�JuP&6b�J졆oQ�,�D�H�|�7PK
     bN#8               org/apache/batik/dom/util/PK
    ]N#8����   �   :   org/apache/batik/dom/util/CSSStyleDeclarationFactory.classm�1�@D�#�Z�ZY�[hg��2���u��ʚe�p5ࡌ`,�b2�̼���a"1"̤U��.I�h�WR�e����X��fⱖ�d�BV��n	���V�8׊0���,��MT�	���7�g%Ҷ����u��%L���\f�J��@�Љ|� ~�0l�C�PK
    ]N#8W��K�  M2  ,   org/apache/batik/dom/util/DOMUtilities.class�Z	|T��?�f�7K <��� *K&!���I2lQ�d#ag&BԺ�K[�UA��**��ԥ�b[�+���ں�jk�_ݵ|�sߛ�$J��9�s�=��s�v��?=BD��/��A��Q^����I|��#��1<V^�	(�q9W��J���Q>�3x�<��<Q(G|���>Nގ6x���\e����j�4�Op���tѢ��3D�H���Y^�A�g�s� !�����}������F��	j��&��n^�c9(ڇ^��E<�Kx��,��R��^f�r�O1x�L�*:�&;X)���W�FW�x/7s����WA��5b>>�������8��:�|��'EX�͝^Z�'{�L^/�� �K����eǣ���o�2*p�����|gy �
�H�Fr��K\*'z��/7�
/��J����^�����u|��7���o���k������d�����[���-o����|��w|���������{�n��g���0��d���������]�6�����c�O~��G~���D����s7?�䯟W;����u���L��ן93R���V�S�X�u
SAüu��f.�%tU���4����39j�[�L�c�hc�U���Ȫ6`����H��H"&�6ґZK2��oO�VF:"�k���"���ʖ�u���X[�y����b�$4�_����3ڛ;�E�)�q����4�%�)�����%B��"��GD�,�F(�y-��LŹ9a�z�?C&���юT�=�-x�^�z�G�=PHN}"���I��3��y"xg֗]d]�Ex6D:D��(�� !g�+Y7CX�89Ւ��(�Å]bgG�*Y�j���6�3�α�q9yG70evX7/cL��a������k�jp�)�k�]�h��z ���ի���C��5����x��5&�a�/X��,� �#�оU��  �7w&��֢7���C��cIq���dM�K5��h2՞�����6�v��D"ҥ�sH]1{%���d2c�~l�?q�~�+�-�>{��[{!�9o��m���|m&��,f�y�#����c�^\ �93Z�1XN�f�1�nxK/����C�k���0ʝx�5KӜgE�a�.8g��ᵍ47����#m���km�+MI>��9+*
�&ꀉ@�x|K�T������,�3���:11W"�:�A|a`�=#�ODp��mQٌ���������P�/��Z��a��Ur�;]�P�=�%��mk�g����>�yu�:,�m�q�ێ�F|�z&��%����KfLX�U���	�%6bIr��2gQ�T*^�h͢�0��=m02Vz��XJ���p��-^Y݌H
U��`1����D�kt��e�k��v�i9��E�t���|�!1BE���-�ձh")	�ol]]��iko^��%?�K/��V7���7�ޙh�Ί�����xa觻�7���O�^?=D{��$F�K��\��_��)~�Ͽ�g��,?����7���}�[?�Ŀ����-��SG��e��g�Y�F��Tu%@%F���kg�,�Y��[���Ծ� N �Q=���xz�B��V��1�va���A?�����W��n���_�g`�ܕ:�/�^_W����!iT��Q�������7��l���9*2,������a��`
z���2?�N/�4�Z?�I�0������0)h���w�o���6p�[u�������}Fg{J"��)"�]?�'��^����n~�����rF������X?�N��]z�O��n�?}��v�G~��?q�~�L��s����O�~)v����݂h�%�p���_�_�R~��~�T���&a�r�3ne�
�_y�Ϗ5�~5@�����B�*�a �د�����c^C��-I��[�q�PB#i�
al`*�&7�k�HJRHJRJ�V�j�(U�W�j�[�� C��F:�H)k�}ѐ[�{�t���mH��A�� �Y>�/"�Ԙ�Gt0(=̚.��2��QY�3si���d�?�<�Lf��������j�1w-:U"Uۣ�=�h�J���#��i�93�5M�W#]�0���8#gP�[����s@z��+Ȧ�h������FI^c���l>"�JqT�6?3a	��=MUt�r��$'>cCQ�WO3�5MS���wX.tz͠>��&C���9YY�Ft�Z���ąF�E�i���J4�Y4����uÙK$���±9�� kD���j��-� 0g�!\�q{��Z��׵�44�{�X����Q���D�R]c�:S��Zf靍-��wߋ�Ѓ�YS}4ޚZ�y�Y��:Ѻ.�-���v[.�˼��h�רC���4A�~��BxQ?��nqp�e���8��:�bF�R�!]�3�[#��<�pW��%cs4^�e���d�Om����h���m����u5��$jR�{�0���r���~�˷}1�oլqa.|�����B�d�,���h�>��;e�\|�i�̺u��A��1��%���w1�@,j\�Q�dq��
��|㰱9	�,<�����!~��H����7�t�[���/L�}��JDZ-���DG�B���l�'l?���aY���Y�`��ܟ�r,(������� ��K���?,�d5ZA2+�Y���Uo܁(�2OF����r�}��e��ƚ���ͪ[^xZ휚5�g.@׻��粰ł�0�@�{"��w4��#�<��UI;	�J;��(ea9YW+�xl8wIq��+��p�D��LiSD�i�V�Ý��4��;�HQ����J��s9�VJL��v����l�z���^<�&��X�#�ED��<=� �� �g�%e=����