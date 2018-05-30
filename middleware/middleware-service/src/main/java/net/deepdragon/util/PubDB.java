package net.deepdragon.util;

import org.apache.commons.lang3.ArrayUtils;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

/**
 * <p>  邢双阳
 * Title:  jdbc数据库操作类
 *
 */
public class PubDB {
    public String getVer(){
        return "PubDB V1.4@2010年07月14日";
    }
    private boolean connected = false;
    private Connection conn = null;
    private DatabaseMetaData DBMetaData = null;
    private Statement stmt;
    private static DataSource ds;
    private ResultSet rs[] ={ null, null, null };
    private Statement stmts[] ={ null, null, null };
//    private static String initContextFactory = "";
//    protected static boolean usepool = false;
//    protected static String Source;
    protected static String driverName;
    protected static String DBURL;
    protected static String userName;
    protected static String passWord;
    public static String dbName="";
//    protected static boolean isusepool=true;
    protected String errMsg = "";
    protected static String DatebaseType;
    private boolean isAutoCommit=true;
    private String CONFIG_BUNDLE_NAME = "dbconfig";

    public PubDB(){
        if((ds == null)||(userName == null)||(passWord == null)||userName.equals("")||DBURL==null)
            getParams();
    }
    /**
     * 如配置文件中选用连接池模式，则通过该构造方法，可更改为不用连接池模式
     * @author 邢双阳
     * @date 2010-07-09
     * @param isusepool  =true根据 配置文件中的设置链接数据库，=false 不使用连接池
     */
    public PubDB(boolean isusepool)
    {
//        this.isusepool=isusepool;
        if((ds == null)||(userName == null)||(passWord == null)||userName.equals("")||DBURL==null)
            getParams();
    }
    /**
     * 用于连接第二个数据库时使用
     * filename表示数据库的配置文件，格式同db.DBConfig
     * @date 2010-06-04
     * @param filename
     */
    public PubDB(String filename){
        if(filename!=null&&!filename.trim().equals(""))
            this.CONFIG_BUNDLE_NAME=filename;
        getParams();
    }

    // 获得数据库的配置参数
    private void getParams() {
        PropertyResourceBundle configBundle = (PropertyResourceBundle) PropertyResourceBundle.getBundle(CONFIG_BUNDLE_NAME);
//            initContextFactory = configBundle.getString("java.naming.factory.initial");//
//            Source = configBundle.getString("source");
            driverName = configBundle.getString("driverClassName");
            DBURL = configBundle.getString("url");
            userName = configBundle.getString("username");
            passWord = configBundle.getString("password");
            dbName = configBundle.getString("dbName");

    }

    public boolean isConnected(){
        return connected;
    }

    public Connection getConn(){
        try{
            if (conn != null && conn.isClosed())
                connected = false;
        }catch (SQLException ex){
        }
        if (!dbConnect())
            return null;
        return conn;
    }

    public DatabaseMetaData getDBMetaData(){
        if (!dbConnect())
            return null;
        return DBMetaData;
    }

    public String getErrMsg(){
        String ss;
        ss = errMsg;
        errMsg = "";
        return ss;
    }

    public ResultSet getTables(String tablename) throws SQLException{
        if (!dbConnect())
            return null;
        String[] types ={ "TABLE" };
        return DBMetaData.getTables(null, null, tablename,types);
    }

    public ResultSet getPrimaryKeys(String tablename) throws SQLException{
        if (!dbConnect())
            return null;
        return DBMetaData.getPrimaryKeys(null, null, tablename);
    }

    public ResultSet getPrimaryKeysByUser(String tablename) throws SQLException{
        if (!dbConnect())
            return null;
        return DBMetaData.getPrimaryKeys(null, null,tablename);
    }

    public ResultSet getColumns(String tablename) throws SQLException{
        if (!dbConnect())
            return null;
        return DBMetaData.getColumns(null, null, tablename.toUpperCase(), null);
    }

    public ResultSet getColumnsByUser(String tablename) throws SQLException{
        if (!dbConnect())
            return null;
        return DBMetaData.getColumns(null, null, tablename.toUpperCase(), null);
    }

    public PreparedStatement getprepareStatement(String sql)throws SQLException{
        return conn.prepareStatement(sql);
    }

//    // 使用pool，获得数据源
//    private boolean getDS(){
//        // String DB_URL;//= "DBURL=jdbc:oracle:thin:@10.0.0.9:1521:BANKDB";
//        // String driverName;// = "oracle.jdbc.driver.OracleDriver";
//        // 创建参数列表以访问命名系统
//        Source="java:comp/env/jdbc/pooledDS";
//        Hashtable parms = new Hashtable();
//        parms.put(Context.INITIAL_CONTEXT_FACTORY, initContextFactory);
//        Context ctx = null;
//        try{
//            // 访问命名系统
//            if ((initContextFactory == null) || (initContextFactory.equals("")))
//                ctx = new InitialContext();
//            else
//                ctx = new InitialContext(parms);
//            // 从命名系统中获取 DataSource 工厂对象
//            ds = (DataSource) ctx.lookup(Source); // "jdbc/publicec"
//        }catch (Exception e){
//            errMsg = "连接getds：" + e.getMessage();
//            e.printStackTrace();
//            return false;
//        }
//
//        return true;
//    }
	/*
	 * protected void finalize() { closedbConnect(); }
	 */

    // 获得一个Connection 对象--获得数据库连接。
    public boolean dbConnect(){
        try {
            if (!connected||conn==null||conn.isClosed())
                try{
                    getParams();
//                    if (usepool){
//                        if (ds == null && !getDS())
//                            return false;
//                        conn = ds.getConnection();
//                    }else{
                        Class.forName(driverName);
                        conn = DriverManager.getConnection(DBURL, userName,passWord);
                        isAutoCommit=conn.getAutoCommit();
//                    }
                    DBMetaData = conn.getMetaData();
                }catch (Exception e){
                    errMsg = "连接conn1：" + e.getMessage();
                    e.printStackTrace();
                    connected=false;
                    return false;
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        connected = true;
        return true;
    }

    // --释放数据库连接,关闭Connection对象
    public void closedbConnect(){
        if (connected)
            try{
                errMsg = "";
                conn.close();
            }catch (Exception e){
                errMsg = "连接关闭异常：" + e.getMessage();
            }
        connected = false;
    }
    //开始事务
    public void beginTransaction(){
        if(!connected)
            dbConnect();
        if(isAutoCommit){
            try {
                conn.setAutoCommit(false);
                isAutoCommit=false;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //提交事务
    public void commitTransaction(){
        try {
            conn.commit();
            conn.setAutoCommit(true);
            isAutoCommit=true;
            conn.close();
            connected=false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //事务回滚
    public void rollback(){
        try {
            conn.rollback();
            conn.close();
            connected=false;
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //手动事务处理
    public void executeUpate(String sql) throws SQLException{
        dbConnect();
        stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        stmt.executeUpdate(sql);
        stmt.close();
    }
    /**
     * 一条SQL语句的更新
     */
    public String update(String sqlStr){
         dbConnect();
        errMsg = "";
        beginTransaction();
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

                stmt.executeUpdate(sqlStr);

            commitTransaction();
            stmt.close();
        }catch (Exception e){
            rollback();
            close();
            System.out.println(sqlStr);
            e.printStackTrace();
            errMsg = "更新异常：" + e.getMessage();
            return errMsg;
        }
        return "";
    }

    /**
     * 多条SQL语句的更新
     * @param sqlStrs
     * @return
     */
    public String update(String[] sqlStrs){
        int i = 0;
        dbConnect();
        errMsg = "";
        try{
            conn.setAutoCommit(false);
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

                for (i = 0; i < sqlStrs.length; i++){
                    stmt.executeUpdate(sqlStrs[i]);
                }

            conn.commit();
            stmt.close();
        }catch (Exception e){
            try{
                conn.rollback();
                conn.setAutoCommit(true);
                e.printStackTrace();
                for (i = 0; i < sqlStrs.length; i++){
                    System.out.println(sqlStrs[i]);
                }
            }catch (Exception ee){
                errMsg = "public String update(String[] sqlStrs):事务回滚异常："+ee.getMessage();
            }
            closedbConnect();
            errMsg = "更新异常：" + e.getMessage();
            return errMsg;
        }
        try{
            conn.setAutoCommit(true);
        }catch (Exception e){
            errMsg = "conn.setAutoCommit(true):异常：" + e.getMessage();
        }
        //closedbConnect();
        return errMsg;
    }

    /**
     * 多条更新语句的执行
     * @param sql
     * @return
     */
    public String update(AbstractList sql){
        String[] sqls;
        if (sql == null){
            return "输入参数为空值";
        }
        sqls = new String[sql.size()];
        for (int i = 0; i < sql.size(); i++){
            sqls[i] = sql.get(i).toString();
        }
        return update(sqls);
    }

    /**
     * 获得结果集
     */
    public String getQuery(String sqlStr, int setTag){
        if (!dbConnect())
            return "数据库连接失败！" + errMsg;
        errMsg = "";
        try{
            stmts[setTag - 1] = conn.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
                rs[setTag - 1] = stmts[setTag - 1].executeQuery(sqlStr);

        }catch (Exception e){
            errMsg = "执行查询异常：" + e.getMessage();
            System.out.println(sqlStr);
            e.printStackTrace();
            return errMsg;

        }
        return "";
    }

    /**得到Vector-String[]封装
     * 不能使用在包含binnay和image类型的列上
     * @param sql
     * @return
     */
    public Vector<String[]> getVector(String sql){
        if (!dbConnect())
            return null;
        Vector<String[]> one=new Vector<String[]>();
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=stmt.executeQuery(sql);
            int cols=rs.getMetaData().getColumnCount();
            while(rs.next()){
                String[] tem=new String[cols];
                for(int i=0;i<cols;i++)
                    tem[i]=rs.getString(i+1);
                one.addElement(tem);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ee){
            ee.printStackTrace();
            System.out.println(sql);
            return one;
        }
        return one;
    }

    /**得到Vector-Map封装
     * 这里目前只支持字符串参数
     * @param sql, paras
     * @return
     */
    public Vector<Map<String, String>> getPreparedStatementVector(String sql, String[] paras) {
        if (!dbConnect())
            return null;
        Vector<Map<String, String>> one = new Vector<Map<String, String>>();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < paras.length; i++) {
                stmt.setString(i + 1, paras[i]);
            }
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int cols = rsmd.getColumnCount();
            while (rs.next()) {
                Map<String, String> tem = new HashMap<String, String>();
                for (int i = 0; i < cols; i++)
                    tem.put(rsmd.getColumnName(i + 1), rs.getString(i + 1));
                one.addElement(tem);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ee) {
            ee.printStackTrace();
            System.out.println(sql);
            return one;
        }
        return one;
    }

    /**
     * 得到Vector-map封装,返回的名字是传递进来的sql列名
     */
    public Vector<Map<String,String>> getVectorMap(String sql){
        return this.getVectorMap(sql, false);
    }
    /**
     * 得到Vector-map封装,返回map的key是列名的小写
     */
    public Vector<Map<String,String>> getVectorMapLowcase(String sql){
        return this.getVectorMap(sql,true);
    }

    /**
     * 得到Vector-map封装,返回map的key是列名的小写
     */
    public Vector<Map<String,String>> getVectorMap(String sql,boolean lowcase){
        return this.getVectorMap(sql,lowcase,null);
    }
    /**
     * 得到Vector-map封装,返回map的key是列名的小写，传进来的是分页bean
     */
    public Vector<Map<String,String>> getVectorMapLowcase(String sql,Velfengye vfy){
        return this.getVectorMap(sql,true,vfy);
    }
    /**
     * 得到Vector-map封装, 传进来的是分页bean  author：sun 20091022
     * 如果分页每页个数为0 表示不分页
     * lowcase true:表示将字段名称改为小写
     * lowcase false:表示字段名称不做处理
     */
    public Vector<Map<String,String>> getVectorMap(String sql,boolean lowcase,Velfengye vfy){
        boolean isfy=false;  //默认不分页
        if(vfy!=null&&vfy.getPagesize()>0) isfy=true;
        if (!dbConnect())
            return null;
        Vector<Map<String,String>> one=new Vector<Map<String,String>>();
        try{
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=stmt.executeQuery(sql);
            ResultSetMetaData md=rs.getMetaData();
            int cols=md.getColumnCount();
            if(isfy){
                rs.last();
                vfy.setRowscount(rs.getRow());  //得到记录数
                if(vfy.getCurrentpage()==1)
                    rs.beforeFirst();
                else{
                    rs.absolute((vfy.getCurrentpage()-1)*vfy.getPagesize()-vfy.getDecrow());
                }
            }else{
                if(vfy!=null){
                    rs.last();
                    vfy.setRowscount(rs.getRow());  //得到记录数
                    rs.beforeFirst();
                }
            }
            int ii=0;
            while(rs.next() && (isfy?(ii<vfy.getPagesize()):true)  ){
                Map<String,String> ht=new Hashtable<String,String>();
                for(int i=0;i<cols;i++){
                    String tem=rs.getString(i+1);
                    if(tem==null)
                        tem="";
                    if(lowcase){
                        ht.put(md.getColumnName(i+1).toLowerCase(),tem);
                    }else{
                        ht.put(md.getColumnName(i+1),tem);
                    }
                }
                ht.put("inhopesysrownum",new Integer(rs.getRow())+"");
                one.addElement(ht);
                ii++;
            }
            rs.close();
            stmt.close();
        }catch(SQLException e){
            System.out.println(sql);
            e.printStackTrace();
            return one;
        }
        return one;
    }

    /**
     * 取得结果集的列数和
     */
    public String getColsCount(int SetTag){
        int value = -1;
        try{
            ResultSetMetaData rsmd = rs[SetTag - 1].getMetaData();
            value = rsmd.getColumnCount();
        }catch (Exception e){
            errMsg = "取列数异常：" + e.getMessage();
            return errMsg;
        }
        return String.valueOf(value);
    }

    // 取得指定列号的列名
    public String getColName(int cols, int SetTag){
        String value = "";
        try{
            ResultSetMetaData rsmd = rs[SetTag - 1].getMetaData();
            value = rsmd.getColumnName(cols);
        }catch (Exception e){
            errMsg = "取列名异常：" + e.getMessage();
            return errMsg;
        }
        return value;
    }

    // 取得指定列的数据类型
    public String getColType(int cols, int SetTag){
        String value = "";
        try{
            ResultSetMetaData rsmd = rs[SetTag - 1].getMetaData();
            value = rsmd.getColumnTypeName(cols);
        }catch (Exception e){
            errMsg = "取列值类型异常：" + e.getMessage();
            return errMsg;
        }
        return value;
    }

    // 取得指定列的列长
    public int getColSize(int cols, int SetTag){
        int value = -1;
        try{
            ResultSetMetaData rsmd = rs[SetTag - 1].getMetaData();
            value = rsmd.getColumnDisplaySize(cols);
        }catch (Exception e){
            errMsg = "取列值长度异常：" + e.getMessage();
        }
        return value;
    }

    // 当指定的字段数据类型为字符类型时，以字符串返回指定ResultSet中指定字段值
    public String getString(String FiledName, int SetTag){
        String value = "";
        try{
            value = rs[SetTag - 1].getString(FiledName);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return "";
        }
        return value;
    }

    public String getString(int FiledIndex, int SetTag){
        String value = "";
        try{
            value = rs[SetTag - 1].getString(FiledIndex);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return "";
        }
        return value;
    }

    // 当指定的字段数据类型为整型时，以int型返回指定ResultSet中指定字段值
    public int getInt(String FiledName, int SetTag){
        int value = 0;
        try{
            value = rs[SetTag - 1].getInt(FiledName);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return value;
        }
        return value;
    }
    /**
     * 2006年8月28日增加
     *
     */
    public int getInt(int FiledIndex, int SetTag){
        int value = 0;
        try{
            value = rs[SetTag - 1].getInt(FiledIndex);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return value;
        }
        return value;
    }

    // 当指定的字段数据类型为实型时，以float型返回指定ResultSet中指定字段值
    public float getFloat(String FiledName, int SetTag){
        float value = 0;
        try{
            value = rs[SetTag - 1].getFloat(FiledName);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            value = 0;
        }
        return value;
    }
    /**
     * 2006年8月28日增加
     *
     */
    public float getFloat(int FiledIndex, int SetTag){
        float value = 0;
        try{
            value = rs[SetTag - 1].getFloat(FiledIndex);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return 0;
        }
        return value;
    }

    // 当指定的字段数据类型为双精度型时，以double型返回指定ResultSet中指定字段值
    public double getDouble(String FiledName, int SetTag){
        double value = 0;
        try{
            value = rs[SetTag - 1].getDouble(FiledName);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
            return 0;
        }
        return value;
    }

    // 当指定的字段数据类型为日期型时，以Date型返回指定ResultSet中指定字段值
    public java.util.Date getDate(String FiledName, int SetTag){
        java.util.Date value = null;
        try{
            value = rs[SetTag - 1].getDate(FiledName);
        }catch (Exception e){
            errMsg = "取值异常：" + e.getMessage();
        }
        return value;
    }

    // 将游标移至指定ResultSet第一行。
    public boolean first(int SetTag){
        boolean value = false;
        try{
            value = rs[SetTag - 1].first();
        }catch (Exception e){
            errMsg = "流动异常：" + e.getMessage();
        }
        return value;
    }

    // 将游标移至指定ResultSet最后一行。
    public boolean last(int SetTag){
        boolean value = false;
        try{
            value = rs[SetTag - 1].last();
        }catch (Exception e){
            errMsg = "流动异常：" + e.getMessage();
        }
        return value;
    }

    // 将游标移至指定ResultSet下一行。
    public boolean next(int SetTag){
        boolean value = false;
        try{
            value = rs[SetTag - 1].next();
        }catch (Exception e){
            errMsg = "流动异常：" + e.getMessage();
            return false;
        }
        return value;
    }

    // 将游标移至指定ResultSet上一行。
    public boolean previous(int SetTag){
        boolean value = false;
        try{
            value = rs[SetTag - 1].previous();
        }catch (Exception e){
            errMsg = "流动异常：" + e.getMessage();
            return false;
        }
        return value;
    }

    // 释放ResultSet资源
    public boolean closeResultset(int SetTag){
        boolean isClose = true;
        if (rs[SetTag - 1] == null)
            return isClose;
        try{
            rs[SetTag - 1].close();
        }catch (Exception ex){
            errMsg = "关闭Resultset异常：" + ex.getMessage();
            isClose = false;
        }
        return isClose;
    }
    public boolean closeStmts(int SetTag){
        boolean isClose = true;
        if (stmts[SetTag - 1] == null)
            return isClose;
        errMsg="";
        try{
            stmts[SetTag - 1].close();
        }catch (Exception ex){
            errMsg = "关闭Resultset异常：" + ex.getMessage();
            isClose = false;
        }
        return isClose;
    }

    /**
     * 关闭PubDB实例中所有对象，包括所有ResultSet、Connection。
     */
    public void close(){
        int setTag;
        for (setTag = 1; setTag <= 3; setTag++){
            closeResultset(setTag);
            closeStmts(setTag);
        }
        closedbConnect();
    }
    // 取结果集的第一条记录的第一个字段
    public String getMaxID(String sSQL){
        if (!dbConnect())
            return "";
        errMsg = "";
        try{
            stmt = conn.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs1=stmt.executeQuery(sSQL);
            String rr="";
            if (rs1.next())
                rr = rs1.getString(1);
            rs1.close();
            stmt.close();
            return rr;
        }catch (Exception e){
            System.out.println(sSQL);
            e.printStackTrace();
            return "";
        }
    }
    /**
     * 取结果集的第一条记录的第一个字段
     */
    public String getValue(String sSQL){
        if (!dbConnect())
            return "";
        errMsg = "";
        try{
            stmt = conn.createStatement(
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs1=stmt.executeQuery(sSQL);
            String rr="";
            if (rs1.next())
                rr = rs1.getString(1);
            rs1.close();
            stmt.close();
            return rr;
        }catch (Exception e){
            System.out.println(sSQL);
            e.printStackTrace();
            return "";
        }
    }

    // 返回记录数
    public int getRowCount(int SetTag){
        int rowCount = 0;
        int curRow = 0;
        try{
            curRow = rs[SetTag - 1].getRow();
            rs[SetTag - 1].last();
            rowCount = rs[SetTag - 1].getRow();
            if (curRow == 0)
                rs[SetTag - 1].beforeFirst();
            else
                rs[SetTag - 1].absolute(curRow);

        }catch (Exception e){
            //System.out.println(e.getMessage());
            int i = 0;
            return i;
        }
        return rowCount;
    }

    // 得到某一个表的列名，字段类型 以及长度
    public static Vector getTableColumnDesc(String tablename){
        Vector vt=new Vector();
        PubDB pdb=new PubDB();
        String[] excludeColumns = new String[]{"id",tablename.substring(tablename.lastIndexOf("_") + 1) + "id" ,"tenantid", "merchantid","createuser","createdate","modifyuser","modifydate"};
        try
        {
            ResultSet rs = pdb.getConn().createStatement().executeQuery(" SHOW FULL FIELDS FROM "+tablename);
            Map map=null;
            while(rs.next()) {
                String columnName = rs.getString("field");
                if (ArrayUtils.indexOf(excludeColumns, columnName.toLowerCase()) != -1) {
                    continue;
                }
                map=new HashMap();
                map.put("columnname",columnName);
                map.put("origntype",rs.getString("type"));
                map.put("dbz", rs.getString("comment"));
                map.put("isShow","是");
                map.put("isSearchField","是");
                map.put("isDefaultNull","是");
                map.put("ddefault","");
                map.put("colWidth","6");
                map.put("note","");
                vt.add(map);
            }

        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            pdb.close();
        }
        return vt;
    }


/*    private static String getMiniColumnType(String type){
        if(type==null) return "String";
        type=type.trim().toLowerCase();
        if(type.indexOf("int")!=-1||type.indexOf("double")!=-1||type.indexOf("float")!=-1||type.indexOf("decimal")!=-1) {
            return "Integer";
        } else if(type.indexOf("datetime")!=-1||type.indexOf("timestamp")!=-1){
            return "Time";
        } else if(type.indexOf("date")!=-1){
            return "Date";
        } else if(type.indexOf("text")!=-1 || type.indexOf("blob")!=-1){
            return "Text";
        }
        return "String";

    }*/


    /*
     * 新增IsEmpty函数，用来判断当前结果集是否为空
     */
    public boolean IsEmpty(int SetTag){
        return !(getRowCount(SetTag) > 0);//
    }


    public static void main(String[] args){
        PubDB db = new PubDB();
        try {

           // System.out.println(db.getVectorMapLowcase("select table_name from information_schema.tables where table_schema='"+PubDB.dbName+"' and table_type='base table'"));

            System.out.println(db.getVectorMapLowcase("select * from test_wkly"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        db.close();
    }

}
