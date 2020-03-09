package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCTools {
private static DataSource dataSource;
static {
	dataSource=new ComboPooledDataSource("testc3p0");
}
public static Connection getConnection() {
	Connection connection=null;
	try {
		connection=dataSource.getConnection();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return connection;
	}
public static void main(String[] args) {
	try {
		Connection conn=JDBCTools.getConnection();
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
