package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.excel.DownloadExcel;
import net.deepdragon.weipu.tools.excel.ExportExcel;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 采购单信息
 */
@Controller(Global.APP_SIGN + Global.MALL + "PurchaseOrderController")
@RequestMapping(Global.MALL_PATH + "/purchaseOrder")
public class PurchaseOrderController extends BaseMallController {
	private static String downloadExcelName = "purchase_order_template.xlsx";
	private static String ExportExcelName = "purchaseOrder.xls";
	private static String[] TABLE_TITLE = { "商品条码", "商品名称", "数量", "单价"};
	private static String ExcelSheetName = "非平台采购单";

	private static String[] INPLATFORM_TABLE_TITLE = { "商品条码", "商品名称", "录入单价", "平台单价", "单价差额", "数量", "单品总差额"};
	private static String[] INPLATFORM_COLUMN_TITLE = { "goodsBarcode", "goodsName", "inputPrice", "price", "djc", "quantity", "ct"};
	private static String INPLATFORM_EXCELSHEETNAME = "平台采购单";

	@Resource
	private GoodsService goodsService;
	@Resource
	private CacheData cacheData;
	@Resource
	private PurchaseOrderService purchaseOrderService;
	@Resource
	private PurchaseOrderDetailService purchaseOrderDetailService;
	@Resource
	private CartItemService cartItemService;

	/**
	 * Desc:获取采购单信息
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Pager pager,Model model,HttpServletRequest request) {
		String info = "获取采购单信息";
		setLogInfo(info);
		logger.debug(info);

		try{
			pager = getData(request,pager,"parent","");

//			Buyer mb = getCurrentMember(request);
//			Criteria criteria = new Criteria();
//			criteria.add(Restrictions.eq("parentBuyerId", mb.getId()));
//			criteria.add(Restrictions.eq("isDelete", 1));
//			criteria.add(Restrictions.order("uploadTime", "DESC"));
//			pager.setPageSize( 20 );
//			pager = purchaseOrderService.getPager(getParamMap(), criteria, pager);

			//采购比价单分组
			List<PurchaseOrder> orderList = (List<PurchaseOrder>)pager.getList();

			Map<String,List<PurchaseOrder>> purchaseOrderMap = new LinkedHashMap<String,List<PurchaseOrder>>();

			for(int i = 0 ; i < orderList.size(); i++){
				String key = orderList.get(i).getChangeTime() + "_" + orderList.get(i).getTitle();
				if(!purchaseOrderMap.containsKey(key)) {
					List<PurchaseOrder> poList = new ArrayList<PurchaseOrder>();
					poList.add(orderList.get(i));
					for (int j = i + 1; j < orderList.size(); j++) {
						String innerKey = orderList.get(j).getChangeTime() + "_" + orderList.get(j).getTitle();
						if (key.equals(innerKey)) {
							poList.add(orderList.get(j));
						}
					}
					purchaseOrderMap.put(key, poList);
				}
			}

			model.addAttribute("purchaseOrderMap", purchaseOrderMap);
//			model.addAttribute("purchaseOrderList",pager.getList());
//			model.addAttribute("pager", pager);
			model.addAttribute("hasNext", !(pager.getList().size() == pager.getTotalCount()));

			String startDate = request.getParameter("startDate");
			if (StringUtil.isNotEmpty(startDate)) {
				model.addAttribute("startDate", startDate);
			}

			String endDate = request.getParameter("endDate");
			if (StringUtil.isNotEmpty(endDate)) {
				model.addAttribute("endDate", endDate);
			}

			String title = request.getParameter("title");
			if (StringUtil.isNotEmpty(title)) {
				model.addAttribute("title", URLDecoder.decode(title,"utf-8"));
			}


			setPublicDate2Model(model);

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
			getAllCatelog(model);

		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

		return Global.TEMPLATE_MALL + PATH + "/member/purchaseOrder";

	}

	/**
	 * Desc:下载采购单模板
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "downloadExcel")
	public void downloadExcel(HttpServletRequest request,HttpServletResponse response) {
		String info = "下载采购单";
		setLogInfo(info);
		logger.debug(info);

		try{
			DownloadExcel.getFilePath(request,response,downloadExcelName);
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

	}

	/**
	 * Desc:上传文件
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "uploadExcel", method = { RequestMethod.POST })
	public @ResponseBody
	Object uploadExcel(String title,HttpServletRequest request) {
		String info = "上传文件";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		List<Goods> inPlatformList = new ArrayList<Goods>();
		List<Goods> noPlatformList = new ArrayList<Goods>();
		StringBuffer sb = new StringBuffer();


		try{
//			List<Goods> goodsList = uploadByFastDFSS(request);
			if( StringUtils.isNotEmpty( title )){
				title = URLDecoder.decode(title, "utf-8");
			}

			Map<String, Object> goodsMap = uploadByFastDFSS(request);

			if(StringUtil.isNotEmpty(goodsMap.get("state")) && "success".equals(goodsMap.get("state"))){
				List<Goods> goodsList = (List<Goods>) goodsMap.get("list");

				if(goodsList.size() > 0){
					for (int i=0;i<goodsList.size();i++) {
						Goods goods = goodsList.get(i);
						if(StringUtil.isNotEmpty(goods)){
							if(StringUtil.isNotEmpty(goods.getBarcode())){
								List<Goods> list = goodsService.findBarcodeGoods(getParamMap(),goods.getBarcode());
								//判断上传文件的数据 是否为平台 或非平台
								if (list.size() > 0) {
									if (StringUtil.isNotEmpty(list.get(0).getId())) {
										Goods goodsIn = list.get(0);
										goodsIn.setName(goods.getName());
										goodsIn.setTotal(goods.getTotal());
										goodsIn.setPrice( goods.getPrice());

										goodsIn = returnGoodsNum(goodsIn);

										if(!goodsIn.getTotal().equals(goods.getTotal())){
											sb.append("第"+(i+1)+"行,");
										}

										inPlatformList.add(goodsIn);
									}else{
										noPlatformList.add(goods);
									}
								}else{
									noPlatformList.add(goods);
								}
							}
						}
					}
				}
			}else{
				if(StringUtil.isNotEmpty(goodsMap.get("msg"))){
					result.put(MESSAGE, goodsMap.get("msg"));
					result.put(STATUS, ERROR);
					return result;
				}
			}

			Date date = new Date();

			String purchaseOrderInPlatformId = "";
			String purchaseOrderNoPlatformId = "";

			//平台数据
			if (inPlatformList.size() > 0) {
				purchaseOrderInPlatformId = saveExcelValue(request,title,inPlatformList,date,1);
			}
            //非平台数据
			if (noPlatformList.size() > 0) {
				purchaseOrderNoPlatformId = saveExcelValue(request,title,noPlatformList,date,0);
				result.put("purchaseOrderOtherId", purchaseOrderNoPlatformId);
			}

			if (StringUtil.isNotEmpty(purchaseOrderInPlatformId)) {
				result.put("purchaseOrderId", purchaseOrderInPlatformId);
				result.put(STATUS, "SUCCESSA");

				if(StringUtil.isNotEmpty(sb.toString())){
					sb.append("商品数量由于起批数量，限购数量，商品包装系数等原因进行了调整!");
					result.put(MESSAGE, sb.toString());
				}
			}else if(StringUtil.isNotEmpty(purchaseOrderNoPlatformId)){
				result.put("purchaseOrderId", purchaseOrderNoPlatformId);
				result.put(STATUS, "SUCCESSB");
				result.put(MESSAGE, "成功");
			}else{
				result.put(STATUS, ERROR);
			}

		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "导入采购单失败!");
		}
		return result;
	}

	/**
	 * Desc:将上传EXCEL文件的数据保存到数据
	 * @param title  标题
	 * @param goodsList Excel文件数据集合
	 * @param date      同一个文件 的上传时间一致
	 * @param request
	 * @param type      上传文件的数据类型  1:平台商品  2:非平台商品 3:平台非认证供应商采购单
	 */
	public String saveExcelValue(HttpServletRequest request, String title, List<Goods> goodsList,Date date,int type){
		String info = "保存上传Excel文件内容";
		setLogInfo(info);
		logger.debug(info);
		String purchaseId = "";

		try{
			//从SESSION中获取登录者的对象
			Buyer buyer = getCurrentMember(request);
			BuyerOperator buyerOperator = null;
			LoginType loginType = getLoginType(request);

			if (LoginType.operator.equals(loginType)) {
				buyerOperator = getCurrentOperator(request);
			}

			PurchaseOrder purchaseOrder = new PurchaseOrder();

			if (goodsList.size() > 0) {
				for (int i=0;i<goodsList.size();i++) {
					if (StringUtil.isNotEmpty(goodsList.get(i))) {
						Goods goods = goodsList.get(i);

						if (i == 0) {
							if (StringUtil.isNotEmpty(buyerOperator)) {
								purchaseOrder.setBuyerId(buyerOperator.getId());
							}else{
								purchaseOrder.setBuyerId(buyer.getId());
							}
							purchaseOrder.setParentBuyerId(buyer.getId());
							purchaseOrder.setUploadTime(date);

							if (type == 1) {
								purchaseOrder.setType(1);
								purchaseOrder.setStatus(1);
							} else{
								purchaseOrder.setType(2);
								purchaseOrder.setStatus(3);
							}

							purchaseOrder.setTitle(title);

							purchaseOrder.setIsDelete(1);
							purchaseOrder.setCreateUser(buyer.getUserName());
							purchaseOrder.setCreateDate(new Date());

							purchaseOrder = purchaseOrderService.save(getParamMap(),purchaseOrder);
						}

						if (StringUtil.isNotEmpty(purchaseOrder.getId())) {
							PurchaseOrderDetail purchaseOrderDetail= new PurchaseOrderDetail();

							purchaseOrderDetail.setPurchaseOrderId(purchaseOrder.getId());

							if (type == 1) {
								purchaseOrderDetail.setMerchantId(goods.getShopId());
								purchaseOrderDetail.setGoodsId(goods.getId());
							}
							purchaseOrderDetail.setGoodsBarcode(goods.getBarcode());

							if(StringUtil.isNotEmpty(goods.getPackageBarCode())) {
								purchaseOrderDetail.setGoodsPackageBarcode(goods.getPackageBarCode());
							}else{
								//采购单明细 的商品外包装条形码 不可为空 所以给默认值 "000000"
								purchaseOrderDetail.setGoodsPackageBarcode("000000");
							}

							purchaseOrderDetail.setGoodsName(goods.getName());
							purchaseOrderDetail.setQuantity(Integer.parseInt(goods.getTotal()));
							purchaseOrderDetail.setInputPrice( goods.getPrice() );

							purchaseOrderDetail.setIsDelete(1);
							purchaseOrderDetail.setCreateUser(buyer.getUserName());
							purchaseOrderDetail.setCreateDate(new Date());

							purchaseOrderDetail = purchaseOrderDetailService.save(getParamMap(),purchaseOrderDetail);
						}

					}
				}

			}

			if (StringUtil.isNotEmpty(purchaseOrder.getId())) {
				purchaseId = purchaseOrder.getId();
			}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
		return purchaseId;
	}

	/**
	 * Desc:上传采购单的数据转为对象
	 * @return list 存放商品对象的集合
	 */
	public Map<String, Object> uploadByFastDFSS(HttpServletRequest request) throws Exception {
		//获取上传文件的数据
		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> multipartFilelist = multipartHttpservletRequest.getFiles("file");

		List<Goods> list = new ArrayList<Goods>();
		Map<String, Object> result = new HashMap<String, Object>();
		Pattern pattern = Pattern.compile("[0-9]*");

		//判断集合是否有值
		if (multipartFilelist != null && multipartFilelist.size() > 0) {
			for (MultipartFile multipartFile : multipartFilelist) {
				/** 获得文件后缀名 **/
				InputStream is = multipartFile.getInputStream();
				String state = "";
				String msg = "";
				try {
					XSSFWorkbook hssfWorkbook = new XSSFWorkbook(is);
					for1:for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {

						XSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
						if (!StringUtil.isNotEmpty(hssfSheet)) {
							break;
						}
						// 循环行Row
						for2:for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
							state = "false";
							XSSFRow hssfRow = hssfSheet.getRow(rowNum);
							if (!StringUtil.isNotEmpty(hssfRow)) {
								msg = "第"+(rowNum+1)+"行没有数据!";
								break for1;
							}

							Goods goods = new Goods();

							XSSFCell xh = hssfRow.getCell(0);
							if(!StringUtil.isNotEmpty(xh)){
								msg = "第"+(rowNum+1)+"行,商品条码不能为空!";
								break for1;
							}

							String barcode = getValue(xh);
							if (!StringUtil.isNotEmpty(barcode)) {
								msg = "第"+(rowNum+1)+"行,商品条码不能为空!";
								break for1;
							}else{
								if(barcode.length() > 32){
									msg = "第"+(rowNum+1)+"行,商品条码长度不能超过32位!";
									break for1;
								}

								if(barcode.indexOf("E") != -1 && (barcode.split("E",-1).length -1) == 1){
									barcode = barcode.replace(".0","");
									//商品条形码长度过长 将科学计数法转为正常数字
									barcode = barcode.substring(0, barcode.indexOf("E")).replace(".", "");
//									BigDecimal bd = new BigDecimal(barcode.replace(".0",""));
//									bd.doubleValue();
//									bd.toEngineeringString();
//									bd.longValue();
//									String ss = bd.toString();
//									BigInteger ss1 = bd.toBigInteger();
//									BigInteger ss2 = bd.toBigIntegerExact();
									goods.setBarcode(barcode);
								}else{
									Matcher isNum = pattern.matcher(barcode.replace(".0",""));

									if(!isNum.matches()){
										msg = "第"+(rowNum+1)+"行,商品条形码只能正整数字!";
										break for1;
									}else{
										goods.setBarcode(barcode.replace(".0",""));
									}
								}

							}

							XSSFCell xm = hssfRow.getCell(1);

							if(!StringUtil.isNotEmpty(xm)){
								msg = "第"+(rowNum+1)+"行,商品名称不能为空!";
								break for1;
							}

							String goodsName = getValue(xm);
							if (!StringUtil.isNotEmpty(goodsName)) {
								msg = "第"+(rowNum+1)+"行,商品名称不能为空!";
								break for1;
							}else{
								if(goodsName.length() > 256){
									msg = "第"+(rowNum+1)+"行,商品名称长度不能超过256位!";
									break for1;
								}
							}
							goods.setName(goodsName);

							XSSFCell yxsmc = hssfRow.getCell(2);

							if(!StringUtil.isNotEmpty(yxsmc)){
								msg = "第"+(rowNum+1)+"行,商品数量不能为空!";
								break for1;
							}

							String goodsNum = getValue(yxsmc);
							if (!StringUtil.isNotEmpty(goodsNum)) {
								msg = "第"+(rowNum+1)+"行,商品数量不能为空!";
								break for1;
							}else{
								Matcher isNum = pattern.matcher(goodsNum.replace(".0",""));

								if(!isNum.matches()){
									msg = "第"+(rowNum+1)+"行,商品数量只能为正整数!";
									break for1;
								}else{
									if(Integer.parseInt(goodsNum.replace(".0","")) <= 0){
										msg = "第"+(rowNum+1)+"行,商品数量只能为正整数!";
										break for1;
									}
								}
							}
							goods.setTotal(goodsNum.replace(".0",""));

							XSSFCell price = hssfRow.getCell(3);

							if(price!=null && !"".equals(price)) {
								try {
									Double goodsPrice = price.getNumericCellValue();
									if (goodsPrice > 10000000) {
										msg = "第" + (rowNum + 1) + "行,商品单价不能大于10000000!";
										break for1;
									}
									goods.setPrice(goodsPrice);
								} catch (Exception e) {
									msg = "第" + (rowNum + 1) + "行,商品单价必须为不大于10000000的数字!";
									break for1;
								}
							}else{
								msg = "第" + (rowNum + 1) + "行,商品单价不能为空!";
								break for1;
							}



//							if(list.size() > 0){
//								for(int i = 0; i < list.size(); i++  ){
//									if( goods.getBarcode().equals( list.get(i).getBarcode() )){
//										msg = "第"+(rowNum+1)+"行与第"+ (i+2) +"行商品条形码重复将被视为同一种商品,请合并后上传!";
//										break for1;
//									}
//								}
//							}


							list.add(goods);
							state = "success";
						}
					}

					result.put("state",state);
					result.put("msg",msg);
					result.put("list",list);

				} catch (Exception e) {
					e.printStackTrace();
					msg = "下载模版填写数据后重新导入!";
					result.put("state","ERROR");
					result.put("msg",msg);
					return result;
				} finally {
					is.close();
				}
			}
		}
		return result;
	}

	/**
	 * Desc:将EXCEL单元格的值按类型转换
	 */
	public static String getValue(XSSFCell hssfCell) {
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
			// 返回布尔类型的值
			return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			// 返回数值类型的值
			return String.valueOf(hssfCell.getNumericCellValue());
		} else {
			// 返回字符串类型的值
			return String.valueOf(hssfCell.getStringCellValue());
		}

	}


	/**
	 * Desc:查看采购单明细
	 * @param pager
	 * @param model
	 * @param request
	 * @param purchaseId 采购单ID
	 * @param type       采购单类型  1:平台商品  2:非平台商品 3:平台非认证供应商采购单
	 * @param othserId   上传文件成功后 存放 非平台商品采购单入库 ID
	 * @return 采购单明细页面
	 */
	@RequestMapping(value = "getPurchaseOrder")
	public String getPurchaseOrder(Pager pager,Model model,HttpServletRequest request,String purchaseId,String type,String othserId) {
		String info = "查看采购单明细";
		setLogInfo(info);
		logger.debug(info);
		String retURL = "/member/purchaseOrderDetailInPlatform";

		try{
			//判断采购单ID是否存在
			if(StringUtil.isNotEmpty(purchaseId)){
				PurchaseOrder purchaseOrder = this.purchaseOrderService.get(getParamMap(), purchaseId);
				model.addAttribute("title", purchaseOrder.getTitle());
				//判断采购单的类型
				if (StringUtil.isNotEmpty(type)) {
					//平台采购单
					if ("1".equals(type)) {

						if(StringUtil.isNotEmpty(othserId)){
							//页面"查看非平台采购单" 按钮判断使用
							model.addAttribute("type", "inPlatformGoods");
						}

						pager = getData(request,pager,"0",purchaseId);

						List<Goods> goodsList = (List<Goods>)pager.getList();

						if (goodsList != null && goodsList.size() > 0) {
							Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
							for (Goods goods : goodsList) {
								goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
							}
							model.addAttribute("goodsSpList", goodsSpList);

							model.addAttribute("goodsList", goodsPriceList(goodsList));
							model.addAttribute("purchaseId", othserId);
							model.addAttribute("otherPurchaseId", purchaseId);
						}

					}else if("2".equals(type)){//非平台采购单
						if(StringUtil.isNotEmpty(othserId)){
							//页面"查看平台采购单" 按钮判断使用
							model.addAttribute("type", "noPlatformGoods");
						}

						pager = getData(request,pager,"1",purchaseId);

						List<PurchaseOrderDetail> purchaseOrderNoPlatformDetailList = (List<PurchaseOrderDetail>)pager.getList();

						if (purchaseOrderNoPlatformDetailList.size() > 0) {
							model.addAttribute("purchaseOrderNoPlatformDetailList", purchaseOrderNoPlatformDetailList);
							model.addAttribute("purchaseId", othserId);
							model.addAttribute("otherPurchaseId", purchaseId);
						}

						retURL = "/member/purchaseOrderDetailNoPlatform";
					}

					model.addAttribute("pager", pager);

				}

			}

			setPublicDate2Model(model);

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

			getAllCatelog(model);

		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

		return Global.TEMPLATE_MALL + PATH + retURL;
	}

	/**
	 * aJax获取下一页数据
	 * @param pager
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "ajaxPurchaseOrderData")
	@ResponseBody
	public Map<String, Object> ajaxPurchaseOrderData(Pager pager,HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			String info = "商品列表页";
			setLogInfo(info);
			logger.error(info);

			String platform = request.getParameter("platform");
			String othserId = request.getParameter("othserId");
			String purchaseId = request.getParameter("purchaseId");

			if(StringUtil.isNotEmpty(platform)){
				pager = getData(request,pager,platform,purchaseId);

				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "成功");
				result.put("pager", pager);
				result.put("total", pager.getTotalCount());

				if("1".equals(platform)){//非平台数据
					result.put("goodslist", pager.getList());
				}else if("parent".equals(platform)){// 采购单

					//采购比价单分组
					List<PurchaseOrder> orderList = (List<PurchaseOrder>)pager.getList();

					Map<String,List<PurchaseOrder>> purchaseOrderMap = new LinkedHashMap<String,List<PurchaseOrder>>();

					for(int i = 0 ; i < orderList.size(); i++){
						String key = DateUtils.dateToString(orderList.get(i).getUploadTime(),"yyyyMMddHHmmss") + "_" + orderList.get(i).getTitle();
						if(!purchaseOrderMap.containsKey(key)) {
							List<PurchaseOrder> poList = new ArrayList<PurchaseOrder>();
							poList.add(orderList.get(i));
							for (int j = i + 1; j < orderList.size(); j++) {
								String innerKey = DateUtils.dateToString(orderList.get(j).getUploadTime(),"yyyyMMddHHmmss") + "_" + orderList.get(j).getTitle();
								if (key.equals(innerKey)) {
									poList.add(orderList.get(j));
								}
							}
							purchaseOrderMap.put(key, poList);
						}
					}

					result.put("goodslist", purchaseOrderMap);
				}else{//平台数据
					List<Goods> goodsList = (List<Goods>)pager.getList();
					if(goodsList != null && goodsList.size() > 0) {
						Map<String,Map<String, List<Map<String, Object>>>> goodsSpList = new HashMap<String,Map<String, List<Map<String, Object>>>>();
						for (Goods goods : goodsList) {
							goodsSpList.put(goods.getId(), goodsService.getGoodsSpInfo(getParamMap(), goods.getId()));
						}
						result.put("goodsSpList", goodsSpList);
						result.put("goodslist", goodsPriceList(goodsList));
					}

				}

				if(StringUtil.isNotEmpty(othserId)){
					result.put("type", "noPlatformGoods");
					result.put("purchaseId", othserId);
					result.put("otherPurchaseId", purchaseId);
				}
			}

		}catch (Exception e){
			logger.error("获取所有商品时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取所有商品时，发生异常");
		}

		return result;
	}

	/**
	 * Desc:根据条件查询采购单数据
	 * @param pager
	 * @param platform 平台类型  1 非平台商品  0 平台商品
	 * @param purchaseId 采购单ID
	 * @return
	 */
	private Pager getData(HttpServletRequest request,Pager pager,String platform,String purchaseId) {
		try {
			Criteria criteria = new Criteria();
			//设置页面默认为6条数据
			pager.setPageSize(20);

			if (StringUtil.isNotEmpty(platform)) {
				if("1".equals(platform)){
					criteria.add(Restrictions.eq("tenantId", getTenantId()));
					criteria.add(Restrictions.eq("isDelete", 1));
					criteria.add(Restrictions.eq("purchaseOrderId", purchaseId));

					pager = purchaseOrderDetailService.getPurchaseOrderNoPlatformDetailList(getParamMap(), criteria, pager);
				}else if("parent".equals(platform)){
					Buyer mb = getCurrentMember(request);
					if (StringUtil.isNotEmpty(mb)) {
						criteria.add(Restrictions.eq("o.parentBuyerId", mb.getId()));
						criteria.add(Restrictions.eq("o.isDelete", 1));
						String startDate = request.getParameter("startDate");
						if (StringUtil.isNotEmpty(startDate)) {
							criteria.add(Restrictions.ge("DATE_FORMAT(o.uploadTime, '%Y-%m-%d')",startDate));
						}

						String endDate = request.getParameter("endDate");
						if (StringUtil.isNotEmpty(endDate)) {
							criteria.add(Restrictions.le("DATE_FORMAT(o.uploadTime, '%Y-%m-%d')", endDate));
						}

						String title = request.getParameter("title");
						if (StringUtil.isNotEmpty(title)) {
							criteria.add(Restrictions.like("title", "%"+ URLDecoder.decode(title, "utf-8") +"%"));
						}

						criteria.add(Restrictions.order("o.uploadTime", "DESC"));

						pager = purchaseOrderService.getPager(getParamMap(), criteria, pager);
					}
				}else{
					criteria.add(Restrictions.eq("o.productId", purchaseId));
					criteria.add(Restrictions.eq("o.tenantId", getTenantId()));
					criteria.add(Restrictions.ge("o.platform", 2));
//					criteria.add(Restrictions.order("o.createDate","ASC"));

					pager = purchaseOrderDetailService.getPurchaseOrderDetailList(getParamMap(), criteria, pager);
				}
			}
		}catch (Exception e){
			logger.error("获取所有商品时，发生异常", e);
			e.printStackTrace();
		}

		return pager;
	}


	/**
	 * Desc:根据商品ID与数量获取商品阶梯价
	 * @param goodsList
	 * @return
	 */
	public List<Goods> goodsPriceList(List<Goods> goodsList) {
		String info = "根据商品ID与数量获取商品阶梯价";
		setLogInfo(info);
		logger.debug(info);
		List<Goods> goodsPriceLists = new ArrayList<Goods>();
		try{
			for(int i=0;i<goodsList.size();i++){
				Goods goods = goodsList.get(i);
				Integer batchNum = 0;
				Integer goodsNum = 0;
				if(StringUtil.isNotEmpty(goods.getStartBatchNum())){
					batchNum = goods.getStartBatchNum();
				}

				if(StringUtil.isNotEmpty(goods.getHits())){
					goodsNum = goods.getHits();
				}

				if(goodsNum <= 0){
					goods.setHits(batchNum);
				}else{
					if(goodsNum < batchNum){
						goods.setHits(batchNum);
					}
				}

				if (goods != null && goods.getEnableBatchPrice() == 1) {
					if (StringUtil.isNotEmpty(goods.getId()) && StringUtil.isNotEmpty(goods.getId())) {
						List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), goods.getId(), goods.getHits());

						if (batchPrice != null && batchPrice.size() > 0) {
							goods.setKeywords(batchPrice.get(batchPrice.size() - 1).getBatchPrice());
						}else{
							//超出阶梯价范围，取最便宜的价格
							batchPrice = cartItemService.getGoodsTradePrice(getParamMap(), goods.getId(), null);
							if (batchPrice != null && batchPrice.size() > 0) {
								goods.setKeywords(batchPrice.get(batchPrice.size() - 1).getBatchPrice());
							}else{
								goods.setKeywords(goods.getPrice()+"");
							}
						}
					}
				}

				goodsPriceLists.add(goods);
			}


		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

		return goodsPriceLists;
	}

//	@RequestMapping(value = "ajaxExportPurchaseOrder", method = { RequestMethod.POST })
//	public @ResponseBody
//	Map<String, Object> ajaxExportPurchaseOrder(HttpServletRequest request,HttpServletResponse response,String goodsIds) {
//		String info = "ajax修改采购单明细数量";
//		setLogInfo(info);
//		logger.debug(info);
//
//		Map<String, Object> result = new HashMap<String, Object>();
//		List<PurchaseOrderDetail> purchaseOrderList = new ArrayList<PurchaseOrderDetail>();
//
//		try{
//			//拆分采购单明细表的ID与数量字符串(先 按 "--"截取  然后在按"_"截取 ID在前，数量在后)
//			if (StringUtil.isNotEmpty(goodsIds)) {
//				String[] goodsIdsNums = goodsIds.split("--");
//
//				if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
//					for (int i = 0; i < goodsIdsNums.length; i++) {
//						String[] goodsIdNum = goodsIdsNums[i].split("_");
//						if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
//							if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {
//								//通过采购单明细ID查出对应的采购单明细信息
//								PurchaseOrderDetail purchaseOrderDetail  = purchaseOrderDetailService.get(getParamMap(), goodsIdNum[0]);
//
//								if (StringUtil.isNotEmpty(purchaseOrderDetail)) {
//									//将采购单的数量设为页面编辑后的数量
//									purchaseOrderDetail.setQuantity(Integer.parseInt(goodsIdNum[1]));
//									//将采购单明细对象添加到 采购单明细List中供后续导出使用
//									purchaseOrderList.add(purchaseOrderDetail);
//								}
//							}
//						}
//					}
//				}
//			}
//
//			//判断要导出的采购单明细数据list是否有值
//			if(purchaseOrderList.size() > 0){
//				//执行 将数据在服务器上生成Excel文件
//				ExportExcel.exportExcel(ExportExcelName,ExcelSheetName,TABLE_TITLE,purchaseOrderList,request);
//				//执行 导出Excel文件
//				DownloadExcel.getFilePath(request,response,ExportExcelName);
//
//				result.put(STATUS, SUCCESS);
//				result.put(MESSAGE, "导出非平台采购单商品成功!");
//			}else{
//				result.put(STATUS, ERROR);
//				result.put(MESSAGE, "导出非平台采购单商品失败!");
//			}
//		}catch (Exception ex) {
//			logger.error(info + "时，发生异常", ex);
//			result.put(STATUS, ERROR);
//			result.put(MESSAGE, "导出非平台采购单商品失败!");
//		}
//		return result;
//	}

	/**
	 * Desc:导出非平台采购单
	 * @param purchaseIdNum 采购单明细表的ID与数量
	 * @return
	 */
	@RequestMapping(value = "exportPurchaseOrder")
	public void exportPurchaseOrder(String type,HttpServletRequest request,HttpServletResponse response,String purchaseIdNum) {
		String info = "导出非平台采购单";
		setLogInfo(info);
		logger.debug(info);
		List<PurchaseOrderDetail> purchaseOrderList = new ArrayList<PurchaseOrderDetail>();
		List<Map<String,String>> purchaseInList = null;

		try{
			//拆分采购单明细表的ID与数量字符串(先 按 "--"截取  然后在按"_"截取 ID在前，数量在后)
			if("1".equals(type)){// 平台采购单
				if (StringUtil.isNotEmpty(purchaseIdNum)) {
					String[] goodsIdsNums = purchaseIdNum.split("--");
					List<String> ids = new ArrayList<String>();
					for(String id : goodsIdsNums){
						ids.add( id );
					}

					purchaseInList = this.purchaseOrderDetailService.getInPlatformExportData(getParamMap(), null, ids);

				} else {
					purchaseInList = this.purchaseOrderDetailService.getInPlatformExportData(getParamMap(), request.getParameter("purchasOrdereId"), null);
				}
			}else {
				if (StringUtil.isNotEmpty(purchaseIdNum)) {
					String[] goodsIdsNums = purchaseIdNum.split("--");

					if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
						for (int i = 0; i < goodsIdsNums.length; i++) {
							String[] goodsIdNum = goodsIdsNums[i].split("_");
							if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
								if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {
									//通过采购单明细ID查出对应的采购单明细信息
									PurchaseOrderDetail purchaseOrderDetail = purchaseOrderDetailService.get(getParamMap(), goodsIdNum[0]);

									if (StringUtil.isNotEmpty(purchaseOrderDetail)) {
										//将采购单的数量设为页面编辑后的数量
										purchaseOrderDetail.setQuantity(Integer.parseInt(goodsIdNum[1]));
										//将采购单明细对象添加到 采购单明细List中供后续导出使用
										purchaseOrderList.add(purchaseOrderDetail);
									}
								}
							}
						}
					}
				} else {
					purchaseOrderList = this.purchaseOrderDetailService.findList(getParamMap(), "purchaseOrderId", request.getParameter("purchasOrdereId"));
				}
			}
			String fileName = "";
			//判断要导出的采购单明细数据list是否有值
			if(purchaseOrderList.size() > 0 || (purchaseInList != null && purchaseInList.size() > 0)){
				if("1".equals(type)){//平台采购单
					//执行 将数据在服务器上生成Excel文件
					fileName = "purchaseOrder" + "_" + DateUtils.dateToString(new Date(),"yyyyMMddHHmm")+".xls";
					ExportExcel.exportExcel(fileName,INPLATFORM_EXCELSHEETNAME,INPLATFORM_TABLE_TITLE,INPLATFORM_COLUMN_TITLE,purchaseInList,request);
				}else{//非平台采购单
					//执行 将数据在服务器上生成Excel文件
					fileName = "purchaseOrder" + "_" + DateUtils.dateToString(new Date(),"yyyyMMddHHmm")+".xls";
					ExportExcel.exportExcel(fileName,ExcelSheetName,TABLE_TITLE,purchaseOrderList,request);
				}
				//执行 导出Excel文件
				DownloadExcel.getFilePath(request,response,fileName);
			}

		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

	}

	/**
	 * Desc:ajax将采购单的商品保存到采购单明细表中(针对数量和规格)
	 * @param request
	 * @param goodsIds 商品 id 数量 规格 字符串
	 * @param oid      采购单明细ID
	 * @return
	 */
	@RequestMapping(value = "ajaxUpdatePurchaseOrderDetails", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxUpdatePurchaseOrderDetails(HttpServletRequest request,String goodsIds,String oid) {
		String info = "ajax修改采购单明细数量";
		setLogInfo(info);
		logger.debug(info);

		Map<String, Object> result = new HashMap<String, Object>();

		try{
			if (StringUtil.isNotEmpty(goodsIds) && StringUtil.isNotEmpty(oid)) {
				String[] goodsIdsNums = goodsIds.split("--");
				String[] purchaseOrderIds = oid.split(",");
				if (StringUtil.isNotEmpty(goodsIdsNums) && goodsIdsNums.length > 0) {
					for (int i = 0; i < goodsIdsNums.length; i++) {
						String[] goodsIdNum = goodsIdsNums[i].split("_");
						//规格值
						String sp = null;
						if (StringUtil.isNotEmpty(goodsIdNum) && goodsIdNum.length > 0) {
							if (StringUtil.isNotEmpty(goodsIdNum[0]) && Integer.parseInt(goodsIdNum[1]) > 0) {

								//获取规格值,如果页面已组装，保存页面的，如果页面未组装，取默认值
								sp = goodsIdNum.length == 3 ? goodsIdNum[2] : getGoodsSp(goodsIdNum[0]);

								Goods goods = goodsService.get(getParamMap(), goodsIdNum[0]);
								if (goods != null) {
									Buyer mb = getCurrentMember(request);
									//用户登录时
									if (mb != null && mb.getId() != null) {
										PurchaseOrderDetail PurchaseOrderDetail = new PurchaseOrderDetail();

										PurchaseOrderDetail.setId(purchaseOrderIds[i]);
										PurchaseOrderDetail.setQuantity(Integer.parseInt(goodsIdNum[1]));
										PurchaseOrderDetail.setSpecification(sp);

										purchaseOrderDetailService.update(getParamMap(),PurchaseOrderDetail);

										result.put(STATUS, "SUCCESS");
										result.put(MESSAGE, "成功");
									}
								}else{
									result.put(STATUS, ERROR);
									result.put(MESSAGE, "立即购买失败!");
								}

							}
						}
					}
				}
			}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "立即购买失败!");
		}
		return result;
	}

	/**
	 * Desc:ajax更新数量)
	 * @param request
	 * @param goodsIds 商品 id 数量 规格 字符串
	 * @param oid      采购单明细ID
	 * @return
	 */
	@RequestMapping(value = "ajaxUpdatePdQuantityByPdId", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxUpdatePdQuantityByPdId(HttpServletRequest request,String pdId,Integer quantity,double inputPrice) {
		String info = "ajax修改采购单明细数量";
		setLogInfo(info);
		logger.debug(info);

		Map<String, Object> result = new HashMap<String, Object>();

		try{
			if (StringUtil.isNotEmpty(pdId) && StringUtil.isNotEmpty(quantity)&&StringUtil.isNotEmpty(inputPrice)) {

				PurchaseOrderDetail PurchaseOrderDetail = new PurchaseOrderDetail();

				PurchaseOrderDetail.setId(pdId);
				PurchaseOrderDetail.setQuantity(quantity);
				PurchaseOrderDetail.setInputPrice(inputPrice);
				purchaseOrderDetailService.update(getParamMap(),PurchaseOrderDetail);

				result.put(STATUS, "SUCCESS");
				result.put(MESSAGE, "成功");
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "修改数量或者录入价格失败!");
				}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "修改数量失败!");
		}
		return result;
	}

	/**
	 * Desc:获取商品的默认规格
	 * Auth:zhangqiang
	 * Time:2016-01-27 11:25:33
	 *
	 * @param goodsId
	 * @return
	 */
	public String getGoodsSp(String goodsId) {
		String info = "获取商品默认规格";
		setLogInfo(info);
		String goodsSpStr = "";
		try {
			if (StringUtil.isNotEmpty(goodsId)) {
				Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
				List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
				List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
				StringBuilder sb = new StringBuilder();
				if (goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0) {
					int i = 0;
					for (Map<String, Object> spm : goodsSpList) {
						for (Map<String, Object> spi : goodsSpItemList) {
							if (StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId"))) {
								if (i > 0) {
									sb.append(",");
								}
								i++;
								sb.append(spm.get("name")).append(":").append(spi.get("name"));
								break;
							}
						}
					}
				}
				goodsSpStr = sb.toString();
			}

		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
		return goodsSpStr;
	}


	/**
	 * Desc:比较商品数量 商品起批数量 商品限购数量 商品包装最小系数
	 * Auth:zhangqiang
	 * Time:2016-03-21 14:33:33
	 *
	 * @param goods 商品对象
	 * @return
	 */
	private Goods returnGoodsNum(Goods goods){
		String info = "比较商品数量";
		setLogInfo(info);
		Integer newQuantity = 0;

		try {
			if (StringUtil.isNotEmpty(goods)) {
				String total = goods.getTotal();
				newQuantity = Integer.parseInt(total);

				if( newQuantity < goods.getStartNum()  ){
					newQuantity = goods.getStartNum();
				}

                //如果存在限购数量，数量必须小于等于限购数量
				if( goods.getLimitNum() != 0 && newQuantity > goods.getLimitNum()){
					newQuantity = goods.getLimitNum();
				}

                //如果数量不是包装系数的整数倍，修改为最接近的较小整数倍
				if( newQuantity % goods.getPackageModulus() != 0 ){
					if(newQuantity / goods.getPackageModulus() *  goods.getPackageModulus() < goods.getStartNum() ){
						newQuantity = (newQuantity / goods.getPackageModulus() + 1) * goods.getPackageModulus();
					}else {
						newQuantity = newQuantity / goods.getPackageModulus() * goods.getPackageModulus();
					}
				}

				if (newQuantity != 0) {
					goods.setTotal(newQuantity+"");
				}
			}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			return goods;
		}

		return goods;
	}

}

