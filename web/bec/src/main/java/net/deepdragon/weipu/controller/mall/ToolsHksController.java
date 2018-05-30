package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.excel.DownloadExcel;
import net.deepdragon.weipu.tools.excel.ExportExcel;
import net.deepdragon.weipu.tools.excel.ReadExcel;
import org.apache.commons.lang3.StringUtils;
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
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.springframework.web.util.HtmlUtils.htmlUnescape;

/**
 * 采购单信息
 */
@Controller(Global.APP_SIGN + Global.MALL + "ToolsHksController")
@RequestMapping(Global.MALL_PATH + "/toolsHks")
public class ToolsHksController extends BaseMallController {
	private static String downloadExcelName = "sales_data_template.xlsx";
	private static String ExportExcelName = "sales_data.xls";
	private static String[] TABLE_TITLE = { "序号", "商品名称", "条码", "品类", "进价", "售价", "销售数量", "区域", "供应商", ""};
	private static String ExcelSheetName = "销售数据";


	@Resource
	private CacheData cacheData;
	@Resource
	private ToolHksService toolHksService;

	/**
	 * Desc:跳转到销售数据上传页面
	 * @param pager
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(Pager pager,Model model,HttpServletRequest request) {
		String info = "跳转到销售数据上传页面";
		setLogInfo(info);
		logger.debug(info);

		try{

			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("role", operatorRole);
			}
            /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
			getAllCatelog(model);
			setPublicDate2Model(model);
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}

		return Global.TEMPLATE_MALL + PATH + "/member/sales_data_list";

	}

	/**
	 * Desc:下载销售数据上传模板
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "downloadExcel")
	public void downloadExcel(HttpServletRequest request,HttpServletResponse response) {
		String info = "下载销售数据上传模板";
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
	Object uploadExcel(HttpServletRequest request) {
		String info = "上传文件";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		//从SESSION中获取登录者的对象

		try{
			//1、解析Excel，并转换为Entity
			result = uploadByFastDFSS(request);

			if("success".equals( result.get("status") ) ) {
				//2、保存Entity
				this.toolHksService.save(getParamMap(), (List<ToolHks>) result.get("data"));

				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "导入销售数据成功!");
			}
		}catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "导入销售数据失败!");
		}
		return result;
	}


	/**
	 * Desc:上传采购单的数据转为对象
	 * @return list 存放商品对象的集合
	 */
	private  Map<String, Object> uploadByFastDFSS(HttpServletRequest request) throws Exception {
		//从SESSION中获取登录者的对象
		Buyer buyer = getCurrentMember(request);
		String buyerUserName = request.getParameter("buyerUserName");

		//获取上传文件的数据
		MultipartHttpServletRequest multipartHttpservletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> multipartFilelist = multipartHttpservletRequest.getFiles("file");

		Map<String, Object> result = new HashMap<String, Object>();
		Pattern pattern = Pattern.compile("[ 0-9 ]*");


		//判断集合是否有值
		if (multipartFilelist != null && multipartFilelist.size() > 0) {
			for (MultipartFile multipartFile : multipartFilelist) {
				/** 获得文件后缀名 **/
				InputStream is = multipartFile.getInputStream();
				String fileName = multipartFile.getOriginalFilename();
				String suffix = fileName.lastIndexOf(".") == -1 ? "" : fileName.substring(fileName.lastIndexOf(".") + 1);

				List<List<Object>> data = ReadExcel.readExcelByOneSheet(is, suffix, 10, 1);

				dataToEntity(result, data, buyer);
			}
		}
		return result;
	}

	/**
	 * 转化Excel数据为实体
	 * @param result
	 * @param data
     * @return
     */
	private Map<String, Object> dataToEntity(Map<String, Object> result, List<List<Object>> data, Buyer buyer) {
		result.put("data_error", false);
		if(data.isEmpty()){
			result.put(STATUS, ERROR);
			result.put(MESSAGE,"上传文件无合法数据,请重新上传！");
			return result;
		}

		int rowNum = 2;
		String colName = "";
		List<String> msg = new ArrayList<String>();
		try {
			Date date = new Date();
			List<ToolHks> toolHkses = new ArrayList<ToolHks>();
			for(List<Object> os : data  ){
				ToolHks toolHks = new ToolHks();

				String sn = StringUtil.formatExcelData(os.get(0));//序号
				colName = "序号";
				if( StringUtil.isNotEmpty(sn) ) {
					if (sn != null && sn.indexOf(".00") != -1) {        //格式化数字
						sn = sn.substring(0, sn.lastIndexOf("."));
					}
					toolHks.setSn(sn);
				}

				String barcode = StringUtil.formatExcelData(os.get(1));//商品条码
				colName = "商品条码";
				if( StringUtil.isNotEmpty(barcode) ) {
					if (barcode != null && barcode.indexOf(".00") != -1) {        //格式化数字
						barcode = barcode.substring(0, barcode.lastIndexOf("."));
					}
					try {
						Long.parseLong(barcode);
						toolHks.setBarcode(barcode);
					}catch (Exception e){
						msg.add("第[ " +  rowNum + " ]行的[ 商品条形码 ]必须为纯数字且大于0,位数不超过16位");
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}

				colName = "商品名称";
				if( StringUtil.isNotEmpty(os.get(2)) ) {
					if( (os.get(2)+"").length() > 60 ){
						msg.add("第[ "+ rowNum +" ]行的[ 商品名称 ]长度应为1~60位");
					}else {
						toolHks.setName(StringUtil.formatExcelData(os.get(2)));//商品|名称
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}

				colName = "品类名称";
				if( StringUtil.isNotEmpty(os.get(3)) ) {
					if( (os.get(3)+"").length() > 60 ){
						msg.add("第[ "+ rowNum +" ]行的[ 品类名称 ]长度应为1~60位");
					}else {
						toolHks.setCategory(StringUtil.formatExcelData(os.get(3)));//品类|名称
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}

				colName = "最后进价";
				if( StringUtil.isNotEmpty(os.get(4)) ){//最后进价
					try{
						if( (os.get(4)+"").length() <= 22){
							toolHks.setInprice( Double.parseDouble( os.get(4).toString() ));
						}else{
							msg.add("第[ "+ rowNum +" ]行的[ 最后进价 ]应为1~22位数字");
						}
					}catch (Exception e){
						msg.add("第[ "+ rowNum +" ]行的[ 最后进价 ]应为1~22位数字");
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}


				colName = "当前售价";
				if( StringUtil.isNotEmpty(os.get(5)) ){//当前售价
					try{
						if( (os.get(5)+"").length() <= 22){
							toolHks.setSaleprice( Double.parseDouble( os.get(5).toString() ));
						}else{
							msg.add("第[ "+ rowNum +" ]行的[ 当前售价 ]应为1~22位数字");
						}
					}catch (Exception e){
						msg.add("第[ "+ rowNum +" ]行的[ 当前售价 ]应为1~22位数字");
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}


				colName = "销售数量";
				if( StringUtil.isNotEmpty(os.get(6)) ){//销售数量
					try{
						Double salenumD = Double.parseDouble( os.get(6).toString() );
						Integer saleNUm = salenumD.intValue();
						toolHks.setSalenum( saleNUm );
					}catch (Exception e){
						msg.add("第[ "+ rowNum +" ]行的[ 销售数量 ]应为大于0小于100000的正整数");
					}
				}else{
					msg.add("第[ "+ rowNum +" ]行的[ "+colName+" ]不能为空");
				}

				colName = "地区";
				String areas = StringUtil.formatExcelData(os.get(7));
				if(StringUtil.isNotEmpty( areas ) && areas.length() > 120){
					areas = areas.substring(0, 120)+"...";
				}
				toolHks.setAreas( areas );

				colName = "供应商名称";
				String supplier = StringUtil.formatExcelData(os.get(8));
				if(StringUtil.isNotEmpty( supplier ) && supplier.length() > 120){
					supplier = supplier.substring(0, 120)+"...";
				}
				toolHks.setSupplier( supplier );

				toolHks.setTenantId( getTenantId() );
				toolHks.setCreateUser( buyer.getUserName() );
				toolHks.setCreateDate( date );

				toolHkses.add(toolHks);
				rowNum++;
			}

			if( msg.size() > 0){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, msg);
				result.put("data_error", true);
			}else{
				result.put("data", toolHkses);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "上传成功！");
			}
		}catch (Exception e){
			logger.error("解析销售数据出错，请重新上传或联系管理员。" + e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE,"文件解析出错，第[ "+rowNum+" ]行的[ "+colName+" ]存在问题，请重新上传或联系管理员");
			return result;
		}

		return result;
	}

}

