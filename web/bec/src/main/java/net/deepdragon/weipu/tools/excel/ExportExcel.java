package net.deepdragon.weipu.tools.excel;

import net.deepdragon.entity.weipu.Order;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.entity.weipu.PurchaseOrderDetail;
import net.deepdragon.util.StringUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

/**
 * Desc:导出EXCEL文件
 * @Auth: zhangqiang
 * @Time:2016-02-25 17:35:22
 */
public class ExportExcel {
    /**
     * Desc:组装导出文件的基本信息
     * @Auth: zhangqiang
     * @Time:2016-02-25 17:35:22
     *
     * @param:filename  要导出文件的名称
     * @param:sheetName Excel sheet页名称
     * @param:tableTitle Excel 表头名称
     * @param:list  要导出的数据集合
     */
    public static void exportExcel(String filename,String sheetName,String[] tableTitle, List<PurchaseOrderDetail> list, HttpServletRequest request) {
        String basePath = request.getSession().getServletContext()
                .getRealPath("")
                + File.separator + "exportTemplate" + File.separator + filename;

        exportExcels(sheetName, tableTitle, list, basePath);


    }

    /**
     * Desc:执行导出操作
     * @Auth: zhangqiang
     * @Time:2016-02-25 17:35:22
     *
     * @param:sheetName Excel sheet页名称
     * @param:tableTitle Excel 表头名称
     * @param:dataset  要导出的数据集合
     * @param:exportFilePath 导出文件的路径Path
     */
    public static void exportExcels(String sheetName, String[] tableTitle,
                                    List<PurchaseOrderDetail> dataset, String exportFilePath) {

        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();

        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 30);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
//		HSSFRow row = sheet.createRow((int) 0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);

        // 生成并设置另一个样式
        HSSFCellStyle style2 = wb.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = wb.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < tableTitle.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(tableTitle[i]);
            cell.setCellValue(text);
        }


        for (int i = 0; i < dataset.size(); i++) {
            row = sheet.createRow((int) i + 1);

            PurchaseOrderDetail stu = (PurchaseOrderDetail) dataset.get(i);
            // 第四步，创建单元格，并设置值
            row.createCell((short) 0).setCellValue(stu.getGoodsBarcode());
            row.createCell((short) 1).setCellValue(stu.getGoodsName());
            row.createCell((short) 2).setCellValue(stu.getQuantity());
            row.createCell((short) 3).setCellValue(stu.getInputPrice());
        }

        // 第六步，将文件存到指定位置
        try {
            FileOutputStream fout = new FileOutputStream(exportFilePath);
            wb.write(fout);
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * Desc:组装导出文件的基本信息
     * @Auth: TianYu
     * @Time:2016-07-07 09:50:26
     *
     * @param:filename  要导出文件的名称
     * @param:sheetName Excel sheet页名称
     * @param:tableTitle Excel 表头名称
     * @param:columnTitle 数据中的字段名
     * @param:list  要导出的数据集合
     */
    public static void exportExcel(String filename, String sheetName, String[] tableTitle, String[] columnTitle, List<Map<String,String>> list, HttpServletRequest request) {
        String basePath = request.getSession().getServletContext()
                .getRealPath("")
                + File.separator + "exportTemplate" + File.separator + filename;

        exportExcels(sheetName, tableTitle, columnTitle, list, basePath);
    }

    /**
     * Desc:执行导出操作
     * @Auth: TianYu
     * @Time:2016-07-07 09:50:17
     *
     * @param:sheetName Excel sheet页名称
     * @param:tableTitle Excel 表头名称
     * @param:columnTitle 数据中的字段名
     * @param:dataset  要导出的数据集合
     * @param:exportFilePath 导出文件的路径Path
     */
    public static void exportExcels(String sheetName, String[] tableTitle,String[] columnTitle, List<Map<String,String>> dataset, String exportFilePath) {

        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();

        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 30);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
//		HSSFRow row = sheet.createRow((int) 0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);

        // 生成并设置另一个样式
        HSSFCellStyle style2 = wb.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = wb.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < tableTitle.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(tableTitle[i]);
            cell.setCellValue(text);
        }


        for (int i = 0; i < dataset.size(); i++) {
            row = sheet.createRow((int) i + 1);

            Map<String,String> data = dataset.get(i);
            for(int j = 0; j < columnTitle.length; j++){
                // 第四步，创建单元格，并设置值
                row.createCell((short) j).setCellValue(data.get( columnTitle[j] ));
            }
        }

        // 第六步，将文件存到指定位置
        try {
            FileOutputStream fout = new FileOutputStream(exportFilePath);
            wb.write(fout);
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 20160527 dzz
     * 组装导出文件的基本信息
     * @param filename          要导出文件的名称
     * @param sheetName         Excel sheet页名称
     * @param tableTitle        Excel 表头名称
     * @param list              要导出的数据集合
     * @param request
     */
    public static void exportExcelNew(String filename,String sheetName,String[] tableTitle, List<Order> list, HttpServletRequest request) {
        String basePath = request.getSession().getServletContext()
                .getRealPath("")
                + File.separator + "exportTemplate" + File.separator + filename;
        exportExcelsNew(sheetName, tableTitle, list, basePath);
    }

    /**
     * 20160527 dzz
     * 执行导出操作
     * @param sheetName             Excel sheet页名称
     * @param tableTitle            Excel 表头名称
     * @param dataset               要导出的数据集合
     * @param exportFilePath        导出文件的路径Path
     */
    public static void exportExcelsNew(String sheetName, String[] tableTitle,List<Order> dataset, String exportFilePath) {
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();

        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 30);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
//		HSSFRow row = sheet.createRow((int) 0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);

        // 生成并设置另一个样式
        HSSFCellStyle style2 = wb.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = wb.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < tableTitle.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(tableTitle[i]);
            cell.setCellValue(text);
        }



        for(int i=0; i<dataset.size(); i++) {
            row = sheet.createRow(i+1);
            Order o = dataset.get(i);
            // 第四步，创建单元格，并设置值
            row.createCell((short) 0).setCellValue(o.getGoodsName());
            row.createCell((short) 1).setCellValue(o.getBarcode());
            row.createCell((short) 2).setCellValue(o.getQuantityAbnormal());
        }

        // 第六步，将文件存到指定位置
        try {
            FileOutputStream fout = new FileOutputStream(exportFilePath);
            wb.write(fout);
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static void exportExcelComm(String filename,String sheetName,String[] tableTitle, List<Object> list, Class clazz, List<Map<String,Object>> resultMap,HttpServletRequest request) {
        String basePath = request.getSession().getServletContext().getRealPath("")+ File.separator + "exportTemplate" + File.separator + filename;
        exportExcelsComm(sheetName, tableTitle, list, basePath, clazz, resultMap);
    }


    public static void exportExcelsComm(String sheetName, String[] tableTitle,List<Object> dataset, String exportFilePath, Class clazz, List<Map<String,Object>> resultMap) {
        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();

        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 30);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
//		HSSFRow row = sheet.createRow((int) 0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);

        // 生成并设置另一个样式
        HSSFCellStyle style2 = wb.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = wb.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("leno");

        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < tableTitle.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(tableTitle[i]);
            cell.setCellValue(text);
        }





        for(int i=0; i<dataset.size(); i++) {
            row = sheet.createRow(i+1);
            String className = clazz.getName(); //获取当前Class反射名称
            Object o = dataset.get(i);
            if(OrderItem.class.getName().equals(className)) {//判断映射是否一致, 之后进行数据处理
                OrderItem item = (OrderItem) o;

                // 第四步，创建单元格，并设置值
                // {"商品名称","商品条码","购买价格", "购买数量"};
                row.createCell((short) 0).setCellValue(item.getGoodsName());
                row.createCell((short) 1).setCellValue(item.getBarcode());
                row.createCell((short) 2).setCellValue(item.getGoodsPrice());
                row.createCell((short) 3).setCellValue(item.getQuantity());
                row.createCell((short) 4).setCellValue(item.getGoodsPriceCount());
//                row.createCell((short) 5).setCellValue(item.getFreight());

            }

        }
        if(StringUtil.isNotEmpty(resultMap)) { //添加空格, 汇总信息
            Map<String,Object> maps = resultMap.get(0);
            sheet.createRow(dataset.size()+1);
            sheet.createRow(dataset.size()+2);
            row = sheet.createRow(dataset.size()+3);
            row.createCell((short) 3).setCellValue("总商品金额:");
            row.createCell((short) 4).setCellValue((double)maps.get("goodsTotalPrice"));

            row = sheet.createRow(dataset.size()+4);
            row.createCell((short) 3).setCellValue("- 优惠:");
            row.createCell((short) 4).setCellValue((double)maps.get("discount"));

            row = sheet.createRow(dataset.size()+5);
            row.createCell((short) 3).setCellValue("+ 保价费:");
            row.createCell((short) 4).setCellValue((double)maps.get("insuranceFee"));

            row = sheet.createRow(dataset.size()+6);
            row.createCell((short) 3).setCellValue("+ 运费:");
            row.createCell((short) 4).setCellValue((double)maps.get("deliveryFee"));

            sheet.createRow(dataset.size()+7);
            row = sheet.createRow(dataset.size()+8);
            row.createCell((short) 3).setCellValue("应付总额:");
            row.createCell((short) 4).setCellValue((double)maps.get("totalAmount"));
        }

        // 第六步，将文件存到指定位置
        try {
            FileOutputStream fout = new FileOutputStream(exportFilePath);
            wb.write(fout);
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void datasetAssemble() {

    }



}
