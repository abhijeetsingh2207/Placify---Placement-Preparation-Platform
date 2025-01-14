package com.univ.db;
import java.sql.*;

public class DBConnection implements DBConfig {

public static Connection getConn() {
	Connection con=null;
	try{
		Class.forName(Driver);
		con=DriverManager.getConnection(Conn,Unm,Pw);
	}
	catch(Exception e) {
		System.out.println(e);
	}
	return con;
}
	
}
