package com.univ.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import com.univ.db.DBConnection;


public class AdminRegDAO {
    public boolean checkDetails(String adminId, String password) {
    	boolean x = false;
    	try {
    		Connection con = DBConnection.getConn();
    		PreparedStatement ps = con.prepareStatement("select adminId,password from admin where adminId=? AND password = ?");
    		ps.setString(1, adminId);
    		ps.setString(2, password);
    		ResultSet rs = ps.executeQuery();
    		x = rs.next();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	return x;
    }
	
}
