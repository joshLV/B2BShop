package net.deepdragon.weipu.tools;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import net.deepdragon.entity.weipu.GoodsCategory;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @version V1.0
 * @Project: weipu
 * @Title:
 * @Package net.deepdragon.weipu.tools
 * @Description:
 * @Author xiaolei-0228@163.com
 * @Date 14-7-15 上午11:00
 * @Copyright: 2014 ihome.com
 */
public class ExcelUtil {
    public static  Connection getConnection(){
        String Driver="com.mysql.jdbc.Driver";
        String username="root";
        String userpwd="root";
        String url="jdbc:mysql://192.168.0.10:3306/weipu?useUnicode=true&amp;characterEncoding=UTF-8&amp;autoReconnect=true&amp;failOverReadOnly=false";
        try {
            Class.forName(Driver);
            return DriverManager.getConnection(url,username,userpwd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void  main(String args[]) throws SQLException, IOException, BiffException {
        try {
            InputStream is = new FileInputStream("E:\\深龙商城商品类目 (1).xls");
            Workbook rwb = Workbook.getWorkbook(is);
            List<GoodsCategory> list = new ArrayList<GoodsCategory>();
            //获取商品类别Sheet表
            Sheet rs = rwb.getSheet(1);
            Connection con = getConnection();
            // 建立SQL陈述式对象（Statement Object）
            Statement stmt = con.createStatement();
            Cell[] cell0 = rs.getColumn(0);
            Cell[] cell1 = rs.getColumn(1);
            Cell[] cell2 = rs.getColumn(2);
            Cell[] cell3 = rs.getColumn(3);
            Cell[] cell4 = rs.getColumn(4);
            Cell[] cell5 = rs.getColumn(5);
        //    System.out.println(cell2.length);
            for (int i = 2; i < cell3.length; i++) {
                String id = cell2[i].getContents();
               String name = cell3[i].getContents();
                if(id.equals("206")||id.equals("207")||id.equals("208")||id.equals("209")){
       //            System.out.println("id="+id+"---"+"name="+name);
       //             String upd = "insert into wp_goods_category (id,tenantId,parentId,name,sign,orderNo,enabled,createUser,createDate)" +
        //                   "values("+id+",37100,2,"+"'"+name+"'"+","+id+",0,1,'admin','2014-07-30 17:27:42')";
         //           int n =stmt.executeUpdate(upd);
                }
            }
            for (int i = 15; i < cell3.length; i++) {
                String id = cell2[i].getContents();
           //     System.out.println(id);
//                String name = cell3[i].getContents();
           //     System.out.println(name);
                if(!id.equals("")){
        //            String upd = "insert into wp_goods_category (id,tenantId,parentId,name,sign,orderNo,enabled,createUser,createDate)" +
        //                    "values("+id+",37100,8,"+"'"+name+"'"+","+id+",0,1,'admin','2014-07-15 11:56:42')";
       //             int n =stmt.executeUpdate(upd);
                }
            }
            for (int i = 2; i < cell5.length; i++) {
                String id = cell4[i].getContents();
                String  name = cell5[i].getContents();
                if(id.contains("206")||id.contains("207")||id.contains("208")||id.contains("209")){
                    System.out.println("id="+id+"---"+"name="+name);
                    String parentId =id.substring(0,3);
                   String upd = "insert into wp_goods_category (id,tenantId,parentId,name,sign,orderNo,enabled,createUser,createDate)" +
                           "values("+id+",37100,"+parentId+","+"'"+name+"'"+","+id+",0,1,'admin','2014-07-15 11:56:42')";
                    int n =stmt.executeUpdate(upd);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
