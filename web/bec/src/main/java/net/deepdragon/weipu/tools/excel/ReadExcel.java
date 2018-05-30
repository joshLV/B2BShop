package net.deepdragon.weipu.tools.excel;

import java.io.*;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;

/**
 * Excel读取解析工具类
 * @author TianYu
 * @Date 2013-6-18
 */

public class ReadExcel {


	/**
	 * 对外提供读取单个Sheet excel 的方法
	 * @param inputStream 要读取的Excel文件
	 * @param suffix 文件后缀，xls 和 xlsx
	 * @param column 总共多少列
	 * @param checkColCountStart 从第几行开始读,从0开始
	 * @return
	 * @throws IOException
	 */
	public synchronized static List<List<Object>> readExcelByOneSheet(InputStream inputStream,String suffix,Integer column,Integer checkColCountStart) throws IOException {
		if ("xls".equalsIgnoreCase(suffix)) {
			return read2003Excel(inputStream,column,checkColCountStart);
		} else if ("xlsx".equalsIgnoreCase(suffix)) {
			return read2007Excel(inputStream,column,checkColCountStart);
		} else {
			throw new IOException("不支持的文件类型");
		}
	}

	/**
	 * 对外提供读取单个Sheet excel 的方法
	 * @param file 要读取的Excel文件
	 * @param column 总共多少列
	 * @param checkColCountStart 从第几行开始读,从0开始
	 * @return
	 * @throws IOException
	 */
	public synchronized static List<List<Object>> readExcelByOneSheet(File file,Integer column,Integer checkColCountStart) throws IOException {
		String fileName = file.getName();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName.substring(fileName.lastIndexOf(".") + 1);
		InputStream inputStream = new FileInputStream(file);
		return readExcelByOneSheet(inputStream,extension,column,checkColCountStart);
	}

	/**
	 * 对外提供读取多个Sheet excel 的方法
	 */
	public synchronized static Map<String,List<List<Object>>> readExcelByMoreSheet(InputStream inputStream,String suffix,Integer[] columns) throws IOException {
		if ("xls".equals(suffix)) {
			return read2003Excel(inputStream,columns);
		} else if ("xlsx".equals(suffix)) {
			return read2007Excel(inputStream,columns);
		} else {
			throw new IOException("不支持的文件类型");
		}
	}
	/**
	 * 对外提供读取多个Sheet excel 的方法
	 */
	public synchronized static Map<String,List<List<Object>>> readExcelByMoreSheet(File file, Integer[] columns) throws IOException {
		String fileName = file.getName();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName
				.substring(fileName.lastIndexOf(".") + 1);
		InputStream inputStream = new FileInputStream(file);
		return readExcelByMoreSheet(inputStream, extension, columns);
	}

	/**
	 * 读取 office 2003 excel 多 Sheet
	 * 
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private synchronized static Map<String,List<List<Object>>> read2003Excel(InputStream file,Integer[] columns) throws IOException {
		Map<String,List<List<Object>>> map = new HashMap<String,List<List<Object>>>();
		
		HSSFWorkbook hwb = new HSSFWorkbook( file );
		HSSFSheet sheet = null;
		for( int j = 0;j < columns.length; j++){//循环Sheet Start
			List<List<Object>> list = new LinkedList<List<Object>>();
			
			sheet = hwb.getSheetAt(j);
			
			HSSFRow row = null;
			for (int i = sheet.getFirstRowNum(); i <= sheet.getPhysicalNumberOfRows(); i++) {//循环Row Start
				row = sheet.getRow(i);
				if (row == null) {
					continue;
				}
				int cols = row.getLastCellNum();
				if(  i == 0 &&  columns != null && cols != columns[j]){
					map.put("sheet" + (j + 1), null);
					return map;
				}
				
				List<Object> linked = read2003ExcelRow(row, columns[j]);
				if( columns != null ){
					linked = deleteNullRow(linked,columns[j]);
				}
				if( linked  != null){
					list.add(linked);
				}
			}//循环Row End
			map.put("sheet" + (j + 1), list);
		}//循环Sheet End
		
		return map;
	}
	/**
	 * 读取 office 2007 excel 多 Sheet
	 * 
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private synchronized static Map<String,List<List<Object>>> read2007Excel(InputStream file,Integer[] columns) throws IOException {
		Map<String,List<List<Object>>> map = new HashMap<String,List<List<Object>>>();
		
		XSSFWorkbook xwb = new XSSFWorkbook(file);
		// 读取第一章表格内容
		for( int j = 0;j < columns.length; j++){//循环Sheet Start
			List<List<Object>> list = new LinkedList<List<Object>>();
			
			XSSFSheet sheet = xwb.getSheetAt(j);
			XSSFRow row = null;
			for (int i = sheet.getFirstRowNum(); i <= sheet.getPhysicalNumberOfRows(); i++) {//循环Row Start
				row = sheet.getRow(i);
				if (row == null) {
					continue;
				}
				int cols = row.getLastCellNum();
				if(  i == 0 &&  columns != null && cols != columns[j]){
					map.put("sheet" + (j + 1), null);;
					return map;
				}
				
				List<Object> linked = read2007ExcelRow(row, columns[j]);
				linked = deleteNullRow(linked,columns[j]);
				if( linked  != null){
					list.add(linked);
				}
			}//循环Row End
			map.put("sheet" + (j + 1), list);
		}//循环Sheet End
		
		return map;
	}
	
	/**
	 * 读取 office 2003 excel
	 * 
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private synchronized static List<List<Object>> read2003Excel(InputStream file,Integer column,Integer checkColCountStart) throws IOException {
		List<List<Object>> list = new LinkedList<List<Object>>();
		
		HSSFWorkbook hwb = new HSSFWorkbook( file );
		HSSFSheet sheet = hwb.getSheetAt(0);
		HSSFRow row = null;
		for (int i = sheet.getFirstRowNum(); i <= sheet.getPhysicalNumberOfRows(); i++) {
			row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			/*int cols = row.getLastCellNum();
			if(  i == checkColCountStart && column != null  && cols != column){
				return null;
			}*/
			
			List<Object> linked = read2003ExcelRow(row, column);
			if(  i >= checkColCountStart && column != null){
				linked = deleteNullRow(linked,column);
			}
			if(i >= checkColCountStart && linked  != null){
				list.add(linked);
			}
			
		}
		return list;
	}

	/**
	 * 读取Office 2007 excel
	 */
	private synchronized static List<List<Object>> read2007Excel(InputStream file,Integer column,Integer checkColCountStart)
			throws IOException {
		List<List<Object>> list = new LinkedList<List<Object>>();
		// 构造 XSSFWorkbook 对象，strPath 传入文件路径
		XSSFWorkbook xwb = new XSSFWorkbook(file);
		// 读取第一章表格内容
		XSSFSheet sheet = xwb.getSheetAt(0);
		XSSFRow row = null;
		for (int i = sheet.getFirstRowNum(); i <= sheet.getPhysicalNumberOfRows(); i++) {
			row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			/*int col = row.getLastCellNum();
			if(  i == checkColCountStart && column != null && col != column){
				return null;
			}*/
			List<Object> linked = read2007ExcelRow(row,column);
			if(   i >= checkColCountStart && column != null ){
				linked = deleteNullRow(linked,column);
			}
			if( i >= checkColCountStart && linked  != null){
				list.add(linked);
			}
			
		}
		return list;
	}
	
	/**
	 * excel2003列解析
	 */
	private synchronized static List<Object> read2003ExcelRow(HSSFRow row,Integer column) throws IOException {
		List<Object> linked = new LinkedList<Object>();
		Object value = null;
		HSSFCell cell = null;
		
		boolean flag = true;
		for (int j = row.getFirstCellNum(); j <= row.getLastCellNum(); j++) {
			if(flag && j > 0 ){
				for( int i= 0; i < j; i++ ){
					linked.add("");
				}
			}
			
			flag = false;
			
			if( j < 0 || j > column-1){
				break;
			}
			cell = row.getCell(j);
			if (cell == null) {
				linked.add("");
				continue;
			}
//			DecimalFormat df = new DecimalFormat("0");// 格式化 number String 字符
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");// 格式化日期字符串
//			DecimalFormat nf = new DecimalFormat("0.00");// 格式化数字
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue().toString();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					value = cell.getDateCellValue();
					value = sdf.format((Date)value).toString();
				} else {
					value = new BigDecimal(cell.getNumericCellValue()).toString();
				}
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				value = cell.getBooleanCellValue();
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				value = "";
				break;
			default:
				value = cell.toString();
			}
			linked.add(value);
		}
		return linked;
	}
	
	/**
	 * excel2007列解析
	 */
	private synchronized static List<Object> read2007ExcelRow(XSSFRow row,Integer column) throws IOException {
		List<Object> linked = new LinkedList<Object>();
		Object value = null;
		XSSFCell cell = null;
		boolean flag = true;
		for (int j = row.getFirstCellNum(); j <= row.getLastCellNum(); j++) {
			
			if(flag && j > 0 ){
				for( int i= 0; i < j; i++ ){
					linked.add("");
				}
			}
			
			flag = false;
			
			if( j < 0 || j > column-1){
				break;
			}
			cell = row.getCell(j);
			if (cell == null) {
				linked.add("");
				continue;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 格式化日期字符串
			DecimalFormat nf = new DecimalFormat("0.00");// 格式化数字
			switch (cell.getCellType()) {
			case XSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue();
				break;
			case XSSFCell.CELL_TYPE_NUMERIC:
				if( HSSFDateUtil.isCellDateFormatted(cell) ){
					value = sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()));
				} else {
					value = nf.format(cell.getNumericCellValue());
				}
				break;
			case XSSFCell.CELL_TYPE_BOOLEAN:
				value = cell.getBooleanCellValue();
				break;
			case XSSFCell.CELL_TYPE_BLANK:
				value = "";
				break;
			default:
				value = cell.toString();
			}
			
			linked.add(value);
		}
		return linked;
	}
	
	/**
	 * 删除空行
	 * @return
	 */
	private synchronized static List<Object> deleteNullRow(List<Object> linked,int column){
		//排除后列无数据时造成的空指针异常
		int tem = column - linked.size();
		if(  tem > 0){
			for(int k = 0 ; k < tem; k++ ){
				linked.add("");
			}
		}
		
		int count = 0;
		for(Object o : linked){
			if( o == null || "".equals(o) ){
				count++;
			}
		}
		//过滤空行
		if( count == linked.size()){
			return null;
		}
		return linked;
	}
	
}
