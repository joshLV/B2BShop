package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.weipu.Member;
import net.deepdragon.util.DateUtil;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.tools.db.ERPDBUtil;

import java.util.Vector;

/**
 * Explain: O2O平台会员注册后与方象ERP对接 会员相关信息同步 业务层
 * FileName:
 * Author: zhnagqiang
 * Time: 2015-11-04 11:40
 * Desc: 当O2O注册会员成功后往ERP平台中录入注册的会员信息
 * Version: V1.0
 */
public class ErpMemberInfo {
    /**
     * 组装往ERP平台中录入注册的会员信息SQL
     * @Return member
     * @Return sign
     */
    public static String saveERPMember(Member member,String sign){
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT into tVipInfo(VipCode,VipName,VipGrade,Gender,Birthday,PhoneNo,IDCode,RegDate,LuruUser,LuruDate,Email,HomePage,Income)");
        sb.append(" VALUES(1?*,2?*,3?*,4?*,5?*,6?*,7?*,10?,11?,12?,13?,14?,15?); ");
        String sql = sb.toString();
        try{
            if(StringUtil.isNotEmpty(member.getNickName())){
                sql = sql.replace("2?*","'"+member.getNickName()+"'");
            }else{
                sql = sql.replace("2?*","''");
            }
            if(StringUtil.isNotEmpty(member.getSex())){
                sql = sql.replace("4?*","'"+member.getSex()+"'");
            }else{
                sql = sql.replace("4?*","'1'");
            }
            if(StringUtil.isNotEmpty(member.getBirthday())){
                sql = sql.replace("5?*","'"+member.getBirthday()+"'");
            }else{
                sql = sql.replace("5?*","''");
            }
            if(StringUtil.isNotEmpty(member.getMobile())){
                sql = sql.replace("6?*","'"+member.getMobile()+"'");
            }else{
                sql = sql.replace("6?*","''");
            }
            if(StringUtil.isNotEmpty(member.getIDCode())){
                sql = sql.replace("7?*","'"+member.getIDCode()+"'");
            }else{
                sql = sql.replace("7?*","''");
            }

            String date = DateUtil.getTime();
            date = date.substring(0,10);
            sql = sql.replace("10?","'"+date+"'");
            sql = sql.replace("11?","'管理员'");
            sql = sql.replace("12?","'"+date+"'");

            if(StringUtil.isNotEmpty(member.getEmail())){
                sql = sql.replace("13?","'"+member.getEmail()+"'");
            }else{
                sql = sql.replace("13?","''");
            }
            if(StringUtil.isNotEmpty(member.getId())){
                sql = sql.replace("14?","'"+member.getId()+"'");
            }else{
                sql = sql.replace("14?","''");
            }
            sql = sql.replace("15?","'O2O'");
        }catch (Exception e){
            e.printStackTrace();
            return "";
        }
        return saveERPData(sql,sign);
    }

    /**
     * 查出ERPID并保存来自O2O的会员数据
     * @param sql
     * @param sign
     * @return
     */
    public static String saveERPData(String sql,String sign){
        ERPDBUtil erpdbUtil = new ERPDBUtil();
        String findIdSql = " select MAX(VipCode) erpCode from tVipInfo ";
        String findSign = " select g.GradeCode from tVipGradeDef g WHERE g.GradeEName =? ";
        String erpVipCode = "";
        try{
            Vector<String[]> vector = erpdbUtil.getVector(findIdSql);
            String[] erpCodes = vector.get(0);
            erpVipCode = Long.parseLong(erpCodes[0])+1+"";
            sql = sql.replace("1?*","'"+erpVipCode+"'");

            findSign = findSign.replace("?","'"+sign+"'");
            Vector<String[]> vectorRank = erpdbUtil.getVector(findSign);
            String[] erpRank = vectorRank.get(0);
            sql = sql.replace("3?*","'"+erpRank[0]+"'");

            erpdbUtil.update(sql);
        }catch (Exception e){
            return "";
        }finally {
            erpdbUtil.close();
        }
        return erpVipCode;
    }
}
