package net.deepdragon.weipu.tools.db;

import org.apache.commons.dbcp.BasicDataSource;

import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

//import net.deepdragon.util.SunLog;


/**
 * @author  xingsy
 *
 * 本类进行方象ERP  sqlserver数据库操作的jdbc工具类
 * **/

public class ERPDBUtil {

	public String getVer(){
		return "ERPDBUtil V1.0@2015-10-23 10:58:21";
	}
	private boolean connected = false;
	private   Connection conn = null;
	private DatabaseMetaData DBMetaData = null;
	private Statement stmt;

	private static BasicDataSource  ds;

	private ResultSet rs[] ={ null, null, null };
	private Statement stmts[] ={ null, null, null };

	protected   String driverName;
	protected   String DBURL;
	protected   String userName;
	protected   String passWord;
	protected String maxActive;
	protected String maxIdle;
	protected String maxWait;
	protected String initialSize;
	protected String errMsg = "";
	public  static  String tenantId ; //租户Id
	public  static String shopId;    //商家Id
	private static Map<String,String> kg;
	private boolean isAutoCommit=true;
	protected static String  dbType="sqlserver";
	private static String CONFIG_BUNDLE_NAME = "fxerp.properties";
//	private String CONFIG_BUNDLE_NAME = "resources/jeecg/jeecg_database.properties";

	public ERPDBUtil(){
		if((ds == null))
			initDS();
	}
	// 为了兼容  留下此方法
	public ERPDBUtil(boolean b){
		if((ds == null))
			initDS();
	}

	/**
	 * 用于连接第二个数据库时使用
	 * filename表示数据库的配置文件，格式同db.properties

	 */
	public ERPDBUtil(String filename){
		if(filename!=null&&!filename.trim().equals(""))
			this.CONFIG_BUNDLE_NAME=filename;
		initDS();
	}

	public static Map<String,String> getMapCG(){
		if((kg == null)){
			initCG();
		}
		return kg;
	}

	/**
	 * 初始化配置文件里面设置的开关值
	 */
	private static void initCG(){
		Map<String,String> configBundle = PropertiesUtil.getAll(CONFIG_BUNDLE_NAME);
		kg = new HashMap<String,String>();
		kg.put("tenantId",configBundle.get("tenantId"));
		kg.put("shopId",configBundle.get("shopId"));
		kg.put("synMemberInfoToERP",configBundle.get("synMemberInfoToERP"));
	}
	private void initDS(){
		//SunLog.i("DBCommonV1.0","DB connection pool init...............");
		Map<String,String> configBundle = PropertiesUtil.getAll(CONFIG_BUNDLE_NAME);



//		driverName = configBundle.get("diver_name");
		driverName = configBundle.get("jdbc.driverClassName.oracle");
		DBURL = configBundle.get("jdbc.url.jeecg");
		userName = configBundle.get("jdbc.username.jeecg");
		passWord = configBundle.get("jdbc.password.jeecg");
		maxActive = configBundle.get("maxActive");
		maxIdle = configBundle.get("maxIdle");
		dbType  = configBundle.get("jdbc.dbType");
		maxActive=maxActive==null?"50":maxActive;
		maxIdle=maxIdle==null?"40":maxIdle;
		maxWait=configBundle.get("maxWait");
		maxWait=maxWait==null?"1000":maxWait;
		initialSize=configBundle.get("initialSize");
		initialSize=initialSize==null?"30":initialSize;

		//获取配置文件里的租户Id和商家Id
		tenantId=configBundle.get("tenantId");
		shopId=configBundle.get("shopId");

		String minIdle=configBundle.get("initialSize");
		minIdle=minIdle==null?"30":minIdle;

		ds=new BasicDataSource();
		ds.setDriverClassName(driverName);
		ds.setPassword(passWord);
		ds.setUsername(userName);
		ds.setUrl(DBURL);
		ds.setMaxActive(Tools.parseInt(maxActive)); //最大活跃连接
		ds.setMaxIdle(Tools.parseInt(maxIdle));   //最大空闲连接连接
		ds.setMinIdle(Tools.parseInt(minIdle)); //最小空闲连接连接
		ds.setInitialSize(Tools.parseInt(initialSize)); //连接池初始化大小,初始化10个数据库连接
		ds.setMaxWait(Tools.parseLong(maxWait)); //3秒超时
		ds.setTestOnBorrow(true);
		ds.setTestOnReturn(true);
		ds.setValidationQuery("select 1  ");
		ds.setTestWhileIdle(true);
		//SunLog.i(getVer(), "DBtype:" + dbType + ";DBURL:" + DBURL + ";username:" + userName + ";pw:acdefg" + passWord + "lidkasl;maxActive:" + ds.getMaxActive() + ";minIdle:" + ds.getMinIdle() + ";maxIdle:" + ds.getMaxIdle() + ";maxWait:" + ds.getMaxWait() + ";InitialSize:" + ds.getInitialSize() + ";defaultAutoCommit:" + ds.getDefaultAutoCommit() + ";removeAbandoned:" + ds.getRemoveAbandoned() + ";removeAbandonedTimeout:" + ds.getRemoveAbandonedTimeout());
	}




	public DataSource getDataSource(){
		if(ds==null) initDS();
		return ds;
	}

	public boolean isConnected(){
		return connected;
	}

	public Connection getConn(){
		try{
			if (conn != null && conn.isClosed())
				connected = false;
		}catch (SQLException ex){
			//SunLog.e("DB连接异常", ex.toString());
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



	/*
	 * protected void finalize() { closedbConnect(); }
	 */

	// 获得一个Connection 对象--获得数据库连接。
	public boolean dbConnect(){
		try {
			if (!connected||conn==null||conn.isClosed())
				try{
					if(ds==null) initDS();
					conn=ds.getConnection();
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
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		stmt.executeUpdate(sql);
		stmt.close();
	}
	/**
	 * 一条SQL语句的更新
	 */
	public String update(String sqlStr){
		if (!connected) dbConnect();
		//	return "数据库连接失败！！";
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
			//SunLog.e("update error sql ：", sqlStr);
			e.printStackTrace();
			errMsg = "更新异常：" + e.getMessage();
			return errMsg;
		}
		return "";
	}
	public String getErrMsg(){
		String ss;
		ss = errMsg;
		errMsg = "";
		return ss;
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

			//SunLog.e("  error sql ：", sqlStrs[i]);
			try{
				conn.rollback();
				conn.setAutoCommit(true);
				e.printStackTrace();
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
	public ResultSet getTables(String tablename) throws SQLException{
		if (!dbConnect())
			return null;
		String[] types ={ "TABLE" };
		return DBMetaData.getTables(null, null, tablename, types);
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
		if(conn==null){
			dbConnect();
		}
		return conn.prepareStatement(sql);
	}
	/**
	 * 多条更新语句的执行
	 * @param sql
	 * @return
	 */
	public String update(List<String>  sql){
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
			//SunLog.e(errMsg, sqlStr);
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
			//SunLog.e("  error sql ：", sql);
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
	public Vector<Map<String,String>> getVectorMap(String oldsql,boolean lowcase,Velfengye vfy){
		long beginTime=System.currentTimeMillis();
		boolean isfy=false;  //默认不分页
		if(vfy!=null&&vfy.getPagesize()>0) isfy=true;
		if (!dbConnect())
			return null;
		Vector<Map<String,String>> one=new Vector<Map<String,String>>();
		try{
			if(dbType.equals("oracle")){
				String sql="";
				int begin=0;
				if(isfy){

					int rowcount=0;
					if(vfy.getRowscount()<1){
						rowcount=Tools.parseInt(getValue("SELECT COUNT(*) FROM ("+oldsql+")"));
						vfy.setRowscount(rowcount);
					}else
						rowcount=vfy.getRowscount();
					if(rowcount>=vfy.getPagesize()){
						begin=(vfy.getCurrentpage()-1)*vfy.getPagesize()<0?0:(vfy.getCurrentpage()-1)*vfy.getPagesize();
						int end = (vfy.getCurrentpage())*vfy.getPagesize()>vfy.getRowscount()?vfy.getRowscount():(vfy.getCurrentpage())*vfy.getPagesize();
						sql="SELECT * FROM (SELECT SUNTABLE.*,ROWNUM  ROM_NUM FROM ("+oldsql+")" +
								"  SUNTABLE WHERE ROWNUM<="+end+" )  WHERE ROM_NUM >"+begin+"";
					}
					else
						sql=oldsql;
				}else
					sql=oldsql;


				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

				ResultSet rs=stmt.executeQuery(sql);
				ResultSetMetaData md=rs.getMetaData();
				int cols=md.getColumnCount();

				int ii=0;
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				while(rs.next()  ){
					Map<String,String> ht=new Hashtable<String,String>();
					for(int i=0;i<cols;i++){
						String tem="";
						if(md.getColumnTypeName(i+1).equals("CLOB"))
						{
							Clob clob= rs.getClob(i+1);
							tem=this.clobToString(clob);
						}
						else if(md.getColumnTypeName(i+1).equals("DATE"))
						{
							if(rs.getString(i+1)==null)
								tem=null;
							else
							{
								//tem=sdf.format(new Date(rs.getString(i+1)));
								tem=sdf.format(rs.getTimestamp(i+1));
								// tem=DateFormat.getInstance().parseObject(rs.getString(i+1)).toString();
								//tem=sdf.format(DateFormat.getInstance().parse(rs.getString(i+1)));
								tem=tem.replaceAll(" 00:00:00", "");
							}
						}
						else
							tem=rs.getString(i+1);
						if(tem==null)
							tem="";
						if(lowcase){
							ht.put(md.getColumnName(i+1).toLowerCase(),tem.trim());
						}else{
							ht.put(md.getColumnName(i+1),tem.trim());
						}
					}
					if(isfy)
						ht.put("_sysrownum",begin+rs.getRow()+"");
					else
						ht.put("_sysrownum",new Integer(rs.getRow()).toString());
					one.addElement(ht);
					ii++;
				}
				rs.close();
			}else{

				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				ResultSet rs=stmt.executeQuery(oldsql);
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
					Map ht=new Hashtable();
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
					ht.put("_sysrownum",new Integer(rs.getRow()));
					one.addElement(ht);
					ii++;
				}
				rs.close();
			}

			stmt.close();

			if(System.currentTimeMillis()-beginTime>2000){
				//SunLog.i("sql 执行时长:"+(System.currentTimeMillis()-beginTime)+" ms", oldsql);
			}
		}catch(Exception e){
			//SunLog.e(e.toString(), oldsql);
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
		if(value==null||"null".equals(value))
			value="";
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
	 * 关闭DBCommon实例中所有对象，包括所有ResultSet、Connection。
	 */
	public void close(){
		int setTag;
		for (setTag = 1; setTag <= 3; setTag++){
			closeResultset(setTag);
			closeStmts(setTag);
		}
		closedbConnect();
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
			//SunLog.e("error sql ", sSQL);
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

			//SunLog.e("  error  ：",e.getMessage());
			int i = 0;
			return i;
		}
		return rowCount;
	}

	/*
	 * 新增IsEmpty函数，用来判断当前结果集是否为空 @author 熊建峰
	 */
	public boolean isEmpty(int SetTag){
		return !(getRowCount(SetTag) > 0);//
	}



	// 将clob 转化为string
	public String clobToString(Clob clob)  {

		String reString = "";
		if(clob==null)
			return "";

		Reader is = null;
		try {
			is = clob.getCharacterStream();// 得到流
			BufferedReader br = new BufferedReader(is);
			String s = br.readLine();
			StringBuffer sb = new StringBuffer();
			while (s != null) {// 执行循环将字符串全部取出付值给StringBuffer由StringBuffer转成STRING
				sb.append(s);
				s = br.readLine();
			}
			reString = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if( is !=null ){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return reString;
	}

	/**
	 获得拼装的外键关联查询条件   包括模糊查询   in查询  和 不包含查询

	 例子：  sql： select id from hr_company
	 val: 中兴   或 *中兴  或 中兴,华为 或  ！中兴
	 **/
	public static String getStringQuerySql(String sql,String fieldName,String val){
		StringBuffer resql = new StringBuffer();
		resql.append(sql);
		if(Tools.isNullStr(val))
		{
			resql.append(" where 1=2 ");
			return resql.toString();
		}
		resql.append(" where 1=1  and "+fieldName+" ");
		if( val.indexOf("*") >= 0 || val.indexOf("×") >= 0){
			val = val.replace("*", "");
			val = val.replace("×", "");
			resql.append(" like '%").append( val ).append("%' ");
		}else if(val.indexOf(",") >= 0 || val.indexOf("，") >= 0){
			val = val.replace(",", "','");
			val = val.replace("，", "','");
			resql.append(" in ('").append( val ).append("') ");
		}else if(val.indexOf("!") >= 0 || val.indexOf("！") >= 0){
			val = val.replace("!", "");
			val = val.replace("！", "");
			resql.append(" <> '").append( val ).append("' ");
		}else{
			resql.append(" = '").append( val ).append("' ");
		}
		return resql.toString();
	}

	public static void main(String[] args) {
		ERPDBUtil db = new ERPDBUtil();
		System.out.println(db.getVectorMapLowcase("select * from product"));
		db.close();
	}
}
