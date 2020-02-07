package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBHelper {

	private static final String driver="com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/perfume?useUnicode=true&characterEncoding=UTF8";
	//private static final String url="jdbc:mysql://106.14.209.83:3306/perfume";
	private static final String username="root";
	//private static final String username="perfume_reader";
	private static final String password="994498";
	//private static final String password="perfume@123";
	private static Connection conn=null;
	static {
		try {
			Class.forName(driver);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public static Connection getConnection() throws Exception {
		if(conn==null) {
			conn=DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;
	}
	public static void main(String[] args) {
		try {
			Connection conn=DBHelper.getConnection();
			if(conn!=null) {
				System.out.println("数据库连接正常！");
			}
			else {
				System.out.println("数据库连接异常！");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}