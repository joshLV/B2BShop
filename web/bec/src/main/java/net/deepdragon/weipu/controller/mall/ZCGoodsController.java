����   2 �
 3 j
 k l
 m n
 o p W q r s
 t u
 v w
 x y
 z { |	 2 }
 ~  �	 2 �
 �  � �
  j �
  �
  � �
  � � � �
 z � � �
 z � � � �
 # �
 ~ � �
 # � C
 � � G H I J L �
 m � � � � articleService 9Lcom/thinkgem/jeesite/modules/cms/service/ArticleService; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; guestbookService ;Lcom/thinkgem/jeesite/modules/cms/service/GuestbookService; <init> ()V Code LineNumberTable LocalVariableTable this BLcom/thinkgem/jeesite/modules/cms/web/front/FrontSearchController; search(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/springframework/ui/Model;)Ljava/lang/String; page .Lcom/thinkgem/jeesite/common/persistence/Page; qStr Ljava/lang/String; t q qand qnot a cid bd ed request 'Ljavax/servlet/http/HttpServletRequest; response (Ljavax/servlet/http/HttpServletResponse; model Lorg/springframework/ui/Model; start J site .Lcom/thinkgem/jeesite/modules/cms/entity/Site; LocalVariableTypeTable aLcom/thinkgem/jeesite/common/persistence/Page<Lcom/thinkgem/jeesite/modules/cms/entity/Article;>; cLcom/thinkgem/jeesite/common/persistence/Page<Lcom/thinkgem/jeesite/modules/cms/entity/Guestbook;>; StackMapTable � � 8Lorg/springframework/web/bind/annotation/RequestMapping; value   "RuntimeVisibleParameterAnnotations 6Lorg/springframework/web/bind/annotation/RequestParam; required     
SourceFile FrontSearchController.java +Lorg/springframework/stereotype/Controller; ${frontPath}/search : ; � � � � � � � � � � � � cmd:reindex � � � � � � � � � � � � article 4 5 � � ; 	guestbook 8 9 � message java/lang/StringBuilder 重建索引成功，共耗时  � � � � 	毫秒。 � � 你没有执行权限。 ，   � � ,  1 � �  +  - ,com/thinkgem/jeesite/common/persistence/Page : � A � 匹配结果，共耗时  � � A � modules/cms/front/themes/ � � /frontSearch @com/thinkgem/jeesite/modules/cms/web/front/FrontSearchController .com/thinkgem/jeesite/common/web/BaseController ,com/thinkgem/jeesite/modules/cms/entity/Site java/lang/String java/lang/System currentTimeMillis ()J defaultSiteId ()Ljava/lang/String; /com/thinkgem/jeesite/modules/cms/utils/CmsUtils getSite B(Ljava/lang/String;)Lcom/thinkgem/jeesite/modules/cms/entity/Site; org/springframework/ui/Model addAttribute D(Ljava/lang/String;Ljava/lang/Object;)Lorg/springframework/ui/Model; equals (Ljava/lang/Object;)Z 0com/thinkgem/jeesite/modules/sys/utils/UserUtils getUser 0()Lcom/thinkgem/jeesite/modules/sys/entity/User; ,com/thinkgem/jeesite/modules/sys/entity/User isAdmin ()Z -com/thinkgem/jeesite/common/utils/StringUtils isBlank (Ljava/lang/CharSequence;)Z 7com/thinkgem/jeesite/modules/cms/service/ArticleService createIndex 9com/thinkgem/jeesite/modules/cms/service/GuestbookService append -(Ljava/lang/String;)Ljava/lang/StringBuilder; (J)Ljava/lang/StringBuilder; toString replace J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; 
isNotBlank R(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V �(Lcom/thinkgem/jeesite/common/persistence/Page;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/thinkgem/jeesite/common/persistence/Page; 
setMessage (Ljava/lang/String;)V �(Lcom/thinkgem/jeesite/common/persistence/Page;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/thinkgem/jeesite/common/persistence/Page; getTheme ! 2 3     4 5  6     7    8 9  6     7     : ;  <   /     *� �    =       " >        ? @    A B  <  �    � 7� � :�  W,� � o� 	� 
� W+� � +� � *� � � +� � 
*� � � Y� � � e� � � �  W�I�  W�:,� � :� � q-�  � 2� Y� � !� -� � !� � � :�  � 3� Y� � "� � � "� � � :+� � +� � P*� � #Y	
� $� %:� Y� &� � e� � � � '(�  W� T+� � K*� � #Y	
� $� ):� Y� &� � e� � � � '(�  W*+�  W+,�  W,-�  W-�  W.�  W� Y� /� � 0� 1� � �    =   �     0  1  2  5 " 6 + 8 ; 9 E < N = U ?  A � F � H � I � J � L � M Q' RC Se Tq Ut W} X� Y� Z� ^� _� `� a� b� c >   � C . C D � . C D  �& E F    ? @     G F    H F    I F    J F    K F    L F    M F    N F    O P 	   Q R 
   S T   U V   W X  Y    C . C Z � . C [  \    
� ; ]	)� P ^7� L� P 6     _  `[ s a b   V    c  dZ e  c  dZ e  c  dZ e  c  dZ e  c  dZ e  c  dZ e  c  dZ e        f    g 6     h   _  `[ s i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           getId()));//当前用户id
                }
                /*quC.add(Restrictions.ge("wgz.startTime", goods.getZcStartTime()));
                quC.add(Restrictions.le("wgz.endTime", goods.getZcEndTime()));*/
                List<Map<String, Object>> quantityMap = orderService.getZCQuantitySum(getParamMap(), quC);
                model.addAttribute("quantityMap", quantityMap);
                logger.info(quantityMap.size()+"=======================");
                model.addAttribute("zhongChouSumQuantity", quantityMap.get(0).get("zhongChouSumQuantity"));

            }
            if(goods.getZcEndTime().before(new Date())){
                status="3";
            }
            addToHistory(id,request);
            Map<String,Object> map = processZCOrder(goods);
            model.addAttribute("goods", goods);
            model.addAttribute("zcrs", map.get("zcrs"));
            model.addAttribute("status", status);
            model.addAttribute("zcbfb", map.get("zcbfb"));//众筹百分比
            model.addAttribute("syts", map.get("syts"));//剩余天数
            model.addAttribute("sysj", map.get("sysj"));//剩余时间
            model.addAttribute("ycje", map.get("ycje"));//已筹金额/万元
            model.addAttribute("ycjeY", map.get("ycjeY"));//已筹金额/元
            model.addAttribute("qdje", map.get("qdje"));
            model.addAttribute("mbje", goods.getThresholdType()==2?goods.getThreshold() * .0001:(goods.getSuccessPrice()*goods.getThreshold())*.0001);//目标金额
            model.addAttribute("orderList", orderList);
            model.addAttribute("goodsImagesList", goodsImagesList);


            /*
             * 20160518 dzz
             * 查询最新众筹中的众筹项目(按实际排序ASE的前六个)
             */
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("o.tenantId", getTenantId())); //租户信息
            criteria.add(Restrictions.gt("o.platform", 1));             //所属平台(1、B2C，2、B2B&B2C，3、B2B)
            criteria.add(Restrictions.eq("o.type", 1));                 //众筹
            criteria.add(Restrictions.eq("o.status", 5));               //状态(0-待提审,1-商家待审核,2-商家审核不通过,3-商城待审核,4-商场审核不通过,5-已审核)
            criteria.add(Restrictions.eq("o.zhongChouStatus", 2)); //扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废
            criteria.add(Restrictions.sql(" (o.zcStartTime <= now() ) "));
            criteria.add(Restrictions.notEq("o.id", id)); //查询众筹资商品非自身商品
            pager.setPageSize(6);
            pager.setOrderBy("zcStartTime");
            pager.setOrderType("asc");
            Pager zhongChouPager = new Pager();
            zhongChouPager = goodsService.queryListZhongChouGoods(getParamMap(), criteria, pager);

            List<Goods> listGoods = (List<Goods>) zhongChouPager.getList();
            for(int i=0; i<listGoods.size(); i++) {
                Map<String, Object> validateZcOrderNanParamMap = new HashMap<String, Object>();
                validateZcOrderNanParamMap.put("memberId", getCurrentMember(request).getId());
                validateZcOrderNanParamMap.put("id", listGoods.get(i).getId());
                Goods validateGoods = (Goods) goodsService.validateZcOrderNan(validateZcOrderNanParamMap, null, null);

                listGoods.get(i).setIsNaNOrder(validateGoods.getIsNaNOrder());
            }

            List<Map<String, Object>> zhongChouList = calcZhongChou(listGoods, df);;
            model.addAttribute("zhongChouList", zhongChouList);

        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }

        if(whichclient!=null && !"".equals(whichclient)) {
            if(request.getParameter("whichclient").equals(Global.WHICH_PC)) { //返回pc端众筹商品详情页
                model.addAttribute("isEnable", "NO");
                return Global.TEMPLATE_MALL + PATH + "/zhongchou_detail";
            }
        }
        return Global.TEMPLATE_APP + PATH + "/zcgoods_detail";
    }
    //众筹订单统计
    private Map<String, Object> processZCOrder(Goods goods) throws Exception{
        DecimalFormat df = new DecimalFormat("####0.00");

        Map<String,Object> map=goodsService.getZhongchouOrderCount(getParamMap(), goods.getId());

        Integer zcrs=0;     //支持人数
        String zcbfb="0";  //众筹百分比
        long syts=0;        //剩余天数
        Double ycje=0.00;   //已筹金额
        String qdje="0";   //起定金额
        Double mbje= goods.getThresholdType()==2?goods.getThreshold():(goods.getSuccessPrice()*goods.getThreshold());//目标金额
        String sysj = "";//剩余时间

        if(map!=null){
            zcrs=Integer.parseInt(map.get("count1")+"");
            ycje+=Double.parseDouble(map.get("count2")+"");
        }
        //众筹成功比例
        zcbfb=df.format((ycje/mbje)*100);
        qdje =df.format(goods.getBuyMinNum()*goods.getSuccessPrice());
        long yi= goods.getZcEndTime().getTime();
        Calendar now = DateUtil.getCalendar();
        long er = now.getTime().getTime();
        long cha=yi-er;
        if(cha<0){
            syts=0;
        }else{
            syts=(cha+(1000*24*60*60))/(1000*24*60*60);
        }
        if( syts == 1){
            DecimalFormat df1 = new DecimalFormat("#0");
            cha /= 1000;

            if(cha / 3600 != 0) {
                sysj += df1.format(cha / 3600);
                sysj += "时";
            }

            if((cha % 3600) / 60 != 0) {
                sysj += df1.format((cha % 3600) / 60);
                sysj += "分";
            }
        }

        Map<String, Object> orderInfo = new HashMap<String, Object>();
        orderInfo.put("zcrs", zcrs);
        orderInfo.put("zcbfb", zcbfb);
        orderInfo.put("syts", syts);
        orderInfo.put("sysj", sysj);
        orderInfo.put("ycje", df.format(ycje * .0001));
        orderInfo.put("ycjeY", df.format(ycje));
        orderInfo.put("qdje", qdje);

        return orderInfo;
    }

    @RequestMapping("moreSupporters")
    public String moreSupporters(Model model,HttpServletRequest request) {
        String info = "众筹商品订单查询";
        setLogInfo(info);
        logger.debug(info);
        Goods goods = null;
        String id=request.getParameter("id");
        try {
            List<Order> orderList=goodsService.getZhongchouOrder(getParamMap(), id);
            model.addAttribute("orderList", orderList);
            model.addAttribute("id", id);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
        return Global.TEMPLATE_APP + PATH + "/zcgoods_more_supporters";
    }



    // 轮播图片
    private List<CarouselAdvertising> getAdslides(String sign) {
        List<CarouselAdvertising> adslideImages = null;
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq(Constant.TENANTID_KEY,getTenantId()));
            criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
            criteria.add(Restrictions.eq("enabled",0));
            criteria.add(Restrictions.order("orderNo","asc"));
            adslideImages = carouselAdvertisingService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("获取首页中间轮播图片时发生异常", e);
            e.printStackTrace();
        }
        return adslideImages;
    }

    // 加入到浏览历史表中
    public void addToHistory(String goodsId, HttpServletRequest request) {
        try {
            Goods goods = goodsService.get(getParamMap(), goodsId);
            if (goods != null) {
                Buyer mb = getCurrentMember(request);
                if (mb != null && mb.getId() != null) {
                    try {
                        b2BBuyerHistoryService.saveHistoryValues(getParamMap(), mb.getId(), goodsId);
                        logger.debug("加入到浏览历史成功");
                    } catch (Exception e) {
                        logger.error("加入到浏览历史失败", e);
                    }
                }
            }
        } catch (Exception e1) {
            logger.error("根据商品ID查询商品失败", e1);
        }
    }


    /**
     * 20160516 dzz
     * 查询众筹商品列表信息
     * @param pager
     * @param model
     * @param request
     * @param mid           商家id
     * @param mn            众筹商家名称
     * @param sn            众筹商品简称
     * @param cl            众筹商品分类
     * @param bc            众筹商品条码
     * @param zhongChouStatus            众筹商品状态
     * @param ZCStartDate   众筹商品开始时间
     * @param ZCEndDate     众筹商品截止时间
     * @return
     */
    @RequestMapping("listZc")
    public String listZhongChou(Pager pager, Model model,HttpServletRequest request, String mid,String mn,String sn,String cl,String bc, String ZCStartDate, String ZCEndDate, String zhongChouStatus) {
        String info = "众筹商品列表页";
        setLogInfo(info);
        logger.error(info);
        getAllCatelog(model);
        setPublicDate2Model(model);
        DecimalFormat df = new DecimalFormat("####0.00");
        try {
            if (net.deepdragon.util.StringUtil.isNotEmpty(mn)) {
                mn = URLDecoder.decode(mn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(sn)) {
                sn = URLDecoder.decode(sn, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(cl)) {
                cl = URLDecoder.decode(cl, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(bc)) {
                bc = URLDecoder.decode(bc, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(zhongChouStatus)) {
                zhongChouStatus = URLDecoder.decode(zhongChouStatus, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(ZCStartDate)) {
                ZCStartDate = URLDecoder.decode(ZCStartDate, "UTF-8");
            }
            if (net.deepdragon.util.StringUtil.isNotEmpty(ZCEndDate)) {
                ZCEndDate = URLDecoder.decode(ZCEndDate, "UTF-8");
            }

            if(!StringUtils.isNotEmpty(zhongChouStatus)){
                //zhongChouStatus = "1,2,3,4"; //original 20160620 dzz 注销
                zhongChouStatus = "1,2,3";//20160620 dzz bug:0003992: 众筹商品列表页--建议默认的众筹状态中去掉‘众筹失败’状态。
            }

            pager = getData(mid, mn, sn, cl, bc, zhongChouStatus, ZCStartDate, ZCEndDate, pager);

            List<Goods> goodsList = (List<Goods>)pager.getList();
            List<Map<String, Object>> zcgoodsList = new ArrayList<Map<String, Object>>();

            zcgoodsList = calcZhongChou(goodsList, df);

            model.addAttribute("zcgoodsList", zcgoodsList);
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotalCount());
            model.addAttribute("sn", sn);
            model.addAttribute("zhongChouStatus", zhongChouStatus);
            model.addAttribute("ZCStartDate", ZCStartDate);
            model.addAttribute("ZCEndDate", ZCEndDate);

            model.addAttribute("adslides", getAdslides("index"));
            model.addAttribute("now", DateUtil.getCalendar().getTime());
            model.addAttribute("cls", "zcgoods_list");

        } catch (Exception e) {
            logger.error("获取所有众筹商品列表时", e);
            e.printStackTrace();
        }
        return Global.TEMPLATE_MALL + PATH + "/zhongchou_list";
    }


    /**
     * 20160516 dzz
     * 查询所有众筹商品
     * @param merchantId            商家Id
     * @param merchantName          商家名称
     * @param goodsShortName        商品简称
     * @param catelog                商品分类
     * @param barCode                商品条码
     * @param zhongChouStatus            众筹商品状态
     * @param ZCStartDate   众筹商品开始时间
     * @param ZCEndDate     众筹商品截止时间
     * @param pager
     * @return
     */
    private Pager getData(String merchantId,String merchantName, String goodsShortName, String catelog, String barCode, String zhongChouStatus, String ZCStartDate, String ZCEndDate, Pager pager) {
        try {
            //备注: 此处仅为添加排序字段, 判断无其他任何含义
            pager.setOrderBy("zcStartTime");
            pager.setOrderType("asc");

            Criteria criteria = new Criteria(); // 查询条件组装实例化对象
            if( StringUtils.isNotEmpty(merchantId) ){//商家Id
                criteria.add(Restrictions.eq("o.shopId", merchantId));
            }
            if( StringUtils.isNotEmpty(merchantName) ) {//商家名称
                criteria.add(Restrictions.like("o.shopName", "%" + merchantName + "%"));
            }
            if( StringUtils.isNotEmpty(goodsShortName) ) {//众筹商品简称
                criteria.add(Restrictions.or(Restrictions.like("o.shortName", "%" + goodsShortName + "%"), Restrictions.like("o.name", "%" + goodsShortName + "%")));
            }
            if( StringUtils.isNotEmpty(catelog) ) {//众筹商品分类
                criteria.add(Restrictions.like("o.clName", "%" + catelog + "%"));
            }
            if( StringUtils.isNotEmpty(barCode) ) {//众筹商品条码
                criteria.add(Restrictions.or(Restrictions.like("o.barcode", "%" + barCode + "%"),Restrictions.like("o.packageBarCode", "%" + barCode + "%")));
            }
            if( StringUtils.isNotEmpty(zhongChouStatus) ) {//众筹商品状态
                /*String[] zhongChouStatusArr = zhongChouStatus.split(",");
                criteria.add(Restrictions.in("o.zhongChouStatus", Arrays.asList(zhongChouStatusArr) ));*/
                // 扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废
                StringBuffer sqlZC = new StringBuffer("1=1 and (");
                if(zhongChouStatus.contains("1")) { // 查询众筹成功实践为 today+3
                    sqlZC.append(" or (o.zhongChouStatus = 2 and o.zcStartTime <= DATE_ADD(NOW(), interval 3 day)) ");

                }
                if(zhongChouStatus.contains("2")) {
                    sqlZC.append(" or ( o.zhongChouStatus = 2 and o.zcStartTime <= now() and o.zcEndTime>now()) ");
                }
                if(zhongChouStatus.contains("3")) { // 查询众筹成功实践为 today-1
//                    sqlZC.append(" or (o.zcEndTime >= DATE_SUB(CONCAT(DATE_FORMAT(NOW(), '%Y-%c-%d '), ' ', '23:59:59'), interval 1 day) and o.zcEndTime<=now() and o.zhongChouStatus='3') ");
                    sqlZC.append(" or (o.zcEndTime >= DATE_SUB(NOW(), interval 1 day) and o.zhongChouStatus='3') ");
                }
                if(zhongChouStatus.contains("4")) { // 查询众筹成功实践为 today-1
//                    sqlZC.append(" or (o.zcEndTime>= DATE_SUB(CONCAT(DATE_FORMAT(NOW(), '%Y-%c-%d '), ' ', '23:59:59'), interval 1 day) and o.zcEndTime<now() and  o.zhongChouStatus='4') ");
                    sqlZC.append(" or (o.zcEndTime>= DATE_SUB(NOW(), interval 1 day) and  o.zhongChouStatus='4') ");
                }
                sqlZC.append(")");
                String sql = sqlZC.toString().replaceFirst("or", "");
                criteria.add(Restrictions.sql(sql));

            } else {
                criteria.add(Restrictions.sql(" (o.zcStartTime <= now() and o.zcEndTime>now())  "));
            }
            if( StringUtils.isNotEmpty(ZCStartDate) ) {//众筹开始时间
                criteria.add(Restrictions.ge("o.zcStartTime", ZCStartDate +" 00:00:00 "));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
            }
            if( StringUtils.isNotEmpty(ZCEndDate) ) {//众筹截止时间
                criteria.add(Restrictions.le("o.zcEndTime", ZCEndDate+" 23:59:59"));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
            }


            criteria.add(Restrictions.eq("o.tenantId", getTenantId())); //租户信息
            criteria.add(Restrictions.gt("o.platform", 1));             //所属平台(1、B2C，2、B2B&B2C，3、B2B)
            criteria.add(Restrictions.eq("o.type", 1));                 //众筹
            criteria.add(Restrictions.eq("o.status", 5));               //状态(0-待提审,1-商家待审核,2-商家审核不通过,3-商城待审核,4-商场审核不通过,5-已审核)
//            criteria.add(Restrictions.notEq("o.zhongChouStatus", 5) ); //扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废

            /** 众筹订单必须过滤掉 1_待发布 和 5_作废  TianYu 2016-06-13 10:09:50 new Start */
            criteria.add(Restrictions.gt("o.zhongChouStatus", 1) ); //扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废
            criteria.add(Restrictions.lt("o.zhongChouStatus", 5) ); //扩展状态：1_待发布，2_进行中，3_成功，4失败，5_作废
            /** 众筹订单必须过滤掉 1_待发布 和 5_作废  TianYu 2016-06-13 10:09:50 new End */

            /** 众筹订单必须过滤掉 1_待发布 和 5_作废  TianYu 2016-06-13 10:09:50 OLD Start */
            /*criteria.add(Restrictions.notEq("o.zhongChouStatus", 1));*/
            /** 众筹订单必须过滤掉 1_待发布 和 5_作废  TianYu 2016-06-13 10:09:50 OLD End */

            criteria.add(Restrictions.or(Restrictions.eq("o.orderNo", 1), Restrictions.isNull("o.orderNo")));
            if (StringUtils.isNotEmpty(pager.getOrderBy())
                    && StringUtils.isNotEmpty(pager.getOrderType())) {
                criteria.add(Restrictions.order("price".equals(pager.getOrderBy()) ? "o.minBatchPrice" : pager.getOrderBy(), pager.getOrderType().toUpperCase()));
            }
            pager.setPageSize(20);
            pager = goodsService.queryListZhongChouGoods(getParamMap(), criteria, pager);

        }catch (Exception e){
            logger.error("获取所有商品时，发生异常", e);
            e.printStackTrace();
        }

        return pager;
    }


    /**
     * 20160518 dzz
     * 计算众筹等相关信息公用方法
     * @return
     */
    public List<Map<String, Object>> calcZhongChou(List<Goods> obj, DecimalFormat df) throws Exception {
        List<Map<String, Object>> zcgoodsList = new ArrayList<Map<String, Object>>();
        for(Goods goods : obj){
            Map<String, Object> orderInfo = new HashMap<String, Object>();
            //订单统计
            Map<String,Object> map = processZCOrder(goods);
            double threshold = 0.0;

            if( 1 == goods.getThresholdType()){//数量
                threshold = goods.getSuccessPrice() * goods.getThreshold();
            }else if( 2 == goods.getThresholdType()){//金额
                threshold = goods.getThreshold();
            }

            Goods g = new Goods();
            MyBeanUtils.copyBean2Bean(g, goods);
            orderInfo.put("goods", g);

            String status="1";//-1_活动未开始，2_进行中，3_已结束
            if(goods.getZcStartTime().after(new Date())){
                status="1";
            }
            if(goods.getZcStartTime().before(new Date()) && goods.getZcEndTime().after(new Date())){
                status="2";
            }
            if(goods.getZcEndTime().before(new Date())){
                status="3";
            }
            orderInfo.put("status", status);

            orderInfo.put("price", goods.getSuccessPrice());
            orderInfo.put("zcrs", map.get("zcrs"));
            orderInfo.put("zcbfb", map.get("zcbfb"));
            orderInfo.put("zcbfb_progress", Double.valueOf(map.get("zcbfb").toString()));
            orderInfo.put("syts", map.get("syts"));
            orderInfo.put("sysj", map.get("sysj"));
            orderInfo.put("ycje", map.get("ycje"));//已筹金额/万元
            orderInfo.put("ycjeY",map.get("ycjeY"));//已筹金额/元
            orderInfo.put("qdje", map.get("qdje"));
            //orderInfo.put("mbje", df.format(goods.getThreshold() * .0001));
            orderInfo.put("mbje", goods.getThresholdType() == 2 ? goods.getThreshold() * .0001 : (goods.getSuccessPrice() * goods.getThreshold()) * .0001);//目标金额
            zcgoodsList.add(orderInfo);
        }
        return zcgoodsList;
    }

}
