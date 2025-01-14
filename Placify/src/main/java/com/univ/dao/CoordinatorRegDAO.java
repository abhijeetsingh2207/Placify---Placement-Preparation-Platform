package com.univ.dao;
//import com.mysql.cj.xdevapi.Statement;
import com.univ.db.DBConnection;
import com.univ.dto.RegistrationGetterSetter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CoordinatorRegDAO {
	public int insert(RegistrationGetterSetter dto) {
		int x=0;
		try {
			Connection con = DBConnection.getConn();
			PreparedStatement ps = con.prepareStatement("insert into coordinator(name,coordinatorId,mobileNo,email,password,status) values(?,?,?,?,?,?)");
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getCoordinatorId());
			ps.setInt(3, dto.getMobileNo());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getPassword());
			ps.setString(6,dto.getStatus());
            x= ps.executeUpdate();
            con.close();
		}
		catch(Exception e){
			System.out.print(e);
		}
		return x;
	}
	
//	public boolean checkDetails(String coordinatorId, String password) {
//		boolean b = false;
//		try {
//			Connection con = DBConnection.getConn();
//			PreparedStatement ps = con.prepareStatement("select coordinatorId,password from coordinator where coordinatorId=? AND password=? ");
//			ps.setString(1, coordinatorId);
//			ps.setString(2, password);
//			ResultSet rs = ps.executeQuery();
//			b =rs.next();
//			con.close();
//		}
//		catch(Exception e) {
//			System.out.println(e);
//		}
//		return b;
//	}
	
	 public List<RegistrationGetterSetter> getPendingTeachers() {
	        List<RegistrationGetterSetter> teachers = new ArrayList<>();
	        String query = "SELECT * FROM coordinator WHERE status = 'PENDING'";
	        try (Connection conn = DBConnection.getConn();  // Use your DB connection method
		             PreparedStatement stmt = conn.prepareStatement(query);
		             ResultSet rs = stmt.executeQuery()) {

		            while (rs.next()) {
		                RegistrationGetterSetter reg = new RegistrationGetterSetter();
		                reg.setName(rs.getString("name"));
		                reg.setCoordinatorId(rs.getString("coordinatorId"));
		                reg.setMobileNo(rs.getInt("mobileNo"));
		                reg.setEmail(rs.getString("email"));
		                reg.setPassword(rs.getString("password"));
		                reg.setStatus(rs.getString("status"));
		                teachers.add(reg);
		                
		            }
		            conn.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

		        return teachers;
	    }

	    public boolean updateTeacherStatus(String coordinatorId, String status) {
	    	boolean result = false;
	        String query = "UPDATE coordinator SET status = ? WHERE coordinatorId = ?";
	        try (Connection conn = DBConnection.getConn(); PreparedStatement stmt = conn.prepareStatement(query)) {
	            stmt.setString(1, status);
	            stmt.setString(2, coordinatorId);
	            result = stmt.executeUpdate() > 0;
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	        }
	        return result;
	    }
	    
	    public String checkTeacherStatus(String coordinatorId, String password) {
	        String status = null;
	        String query = "SELECT status FROM coordinator WHERE coordinatorId = ? AND password = ?";
	        try (Connection con = DBConnection.getConn();
	             PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, coordinatorId);
	            ps.setString(2, password);
	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    status = rs.getString("status");
	                }
	            }
	            con.close();
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	    
	    public String getCoordinatorName(String coordinatorId) {
	        String name = null;
	        try (Connection con = DBConnection.getConn();
	             PreparedStatement ps = con.prepareStatement("SELECT name FROM coordinator WHERE coordinatorId= ?")) {
	            
	            ps.setString(1, coordinatorId);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                name = rs.getString("name");
	            }
	            con.close();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return name;
	    }
	    
	    public List<Object> searchUser(String coordinatorId ) {
	        List<Object> lt = new ArrayList<>();
	        try {
	            Connection con = DBConnection.getConn();
	            String query = "SELECT * FROM coordinator WHERE coordinatorId = ? ";
	            PreparedStatement ps = con.prepareStatement(query);
//	            ps.setString(1, id);
//	            ps.setString(2, password);
	            ps.setString(1, coordinatorId);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                      // Adjust column names based on actual table schema
	            	
	            	lt.add(rs.getString("name"));
	                lt.add(rs.getString("coordinatorId"));
	                lt.add(rs.getInt("mobileNo"));                // Replace with actual column names and types
	                lt.add(rs.getString("email"));
	                lt.add(rs.getString("password"));
	               
	            } else {
	                lt = null; // Return null if no user is found
	            }
	            
	            rs.close();
	            ps.close();
	            con.close();
	            
	        } catch (Exception e) {
	            System.out.println("Error: " + e.getMessage());
	            e.printStackTrace();
	        }
	        return lt;
	    }
	    
	    public int update(RegistrationGetterSetter dto) {
	        int x = 0;
	        try {
	            Connection con = DBConnection.getConn();
	            PreparedStatement ps = con.prepareStatement(
	                "UPDATE coordinator SET name=?,  mobileNo=?,email=?, password=? WHERE coordinatorId=?"
	            );
	            ps.setString(1, dto.getName());
	            ps.setInt(2, dto.getMobileNo());
	            ps.setString(3, dto.getEmail());
	            ps.setString(4, dto.getPassword());
	            ps.setString(5, dto.getCoordinatorId()); // Corrected to set enrollmentNo for WHERE clause

	            x = ps.executeUpdate();
	            con.close();

	        } catch (Exception ee) {
	            System.out.println("Error updating student record: " + ee);
	        }
	        return x;
	    }
	    

}
