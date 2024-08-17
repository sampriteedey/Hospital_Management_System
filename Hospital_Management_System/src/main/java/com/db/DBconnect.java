package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBconnect {
	private static Connection conn;
	public static Connection getConn()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_management","root","sam12345");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
