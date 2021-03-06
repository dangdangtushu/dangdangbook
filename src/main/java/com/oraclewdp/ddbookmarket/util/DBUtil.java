package com.oraclewdp.ddbookmarket.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;



public class DBUtil {

	private static Properties pro;
	static {
		pro = new Properties();
		try {
			pro.load(DBUtil.class.getResourceAsStream("db.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//因为类加载只调用一次，所以用static静态代码块
	static {
		try {
			Class.forName(pro.getProperty("driverClass"));
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
	}
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(pro.getProperty("url"), pro.getProperty("user"), pro.getProperty("pwd"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void free(ResultSet rs, Statement stmt, Connection conn) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null) {
			try {
				//无论交流通否，都要进行关闭连接，所以放在finally语句中
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void free(Statement stmt, Connection conn) {
		if(stmt!=null) {
			try {
				//无论交流通否，都要进行关闭连接，所以放在finally语句中
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
