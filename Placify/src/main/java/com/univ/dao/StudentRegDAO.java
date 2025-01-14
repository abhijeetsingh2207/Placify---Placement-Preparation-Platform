package com.univ.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.univ.db.DBConnection;
//import com.univ.DTO.StudentRegDTO;
import com.univ.db.DBConfig;

import com.univ.dto.RegistrationGetterSetter;

public class StudentRegDAO {
	
	

		//Insert method 
		public int insert(RegistrationGetterSetter dto) {
			int x=0;
			try{
				Connection con= DBConnection.getConn();
//				PreparedStatement ps=con.prepareStatement("insert into student(name,email,enrollmentNo,mobileNo,password,confirmPassword)value(?,?,?,?,?,?)");
				PreparedStatement ps=con.prepareStatement("insert into student(name,email,enrollmentNo,mobileNo,year,password) values(?,?,?,?,?,?)");
				ps.setString(1,dto.getName());
				ps.setString(2, dto.getEmail());
				ps.setString(3,dto.getEnrollmentNo());
				ps.setInt(4,dto.getMobileNo());
				ps.setInt(5, dto.getYear());
				ps.setString(6,dto.getPassword());
				//ps.setString(6,dto.getConfirmPassword());
				x=ps.executeUpdate();
				con.close();
				
			}
			catch(Exception ee) 
			{
				System.out.println(ee);
				}
			return x;
		}
		
		//Insert method close
	
		//get password method
		public boolean checkDetails(String enrollmentNo,String password)
		 {
			 boolean b1=false;
			 try {
			 Connection con=DBConnection.getConn();
				PreparedStatement ps= con.prepareStatement("select enrollmentNo,password from student where enrollmentNo=? AND password=? "); 
			   ps.setString(1, enrollmentNo);
			   ps.setString(2, password);
			 ResultSet rs=ps.executeQuery();
			 b1=rs.next();
			 con.close();
			 }
			 catch(Exception tt)
			 {
				 System.out.println(tt);
				 }
			 return b1;
		 }
		//get password method close
		
		
		//get  search method
//		 public List searchUser(String id,String password)
//		 {
//			 List lt=new ArrayList();
//			 try {
//				 Connection con=DBConnection.getConn();
//				 Statement stm=con.createStatement();
//				 ResultSet rs= stm.executeQuery("select * from student where enrollmentNo,password="+id,password);
//				 if(rs.next())
//				 {
//			      lt.add(rs.getInt(1));
//			      lt.add(rs.getString(2));
//			      lt.add(rs.getString(3));
//			      lt.add(rs.getInt(4));
//			      lt.add(rs.getString(5));
//			      lt.add(rs.getString(6));
//			      lt.add(rs.getString(7));
//			    }else {
//			    	lt=null;
//			    }
//				 
//			 }catch(Exception tt)
//			 {System.out.println(tt);}
//		   return lt;
//		 }
			//get search method close
 
		//update method 
//		public int update(RegistrationGetterSetter dto) {
//		    int x = 0;
//		    
//		    try {
//		        Connection con = DBConnection.getConn();
//		        String enrollNo = dto.getEnrollmentNo();
//		        PreparedStatement ps = con.prepareStatement( "UPDATE student SET name=?, email=?, phoneNo=?, year=?, password=? WHERE enrollmentNo="+enrollNo);
//		        ps.setString(1, dto.getName());
//		        ps.setString(2, dto.getEmail());
//		        ps.setInt(3, dto.getMobileNo());
//		        ps.setInt(4, dto.getYear());
//		        ps.setString(5, dto.getPassword());
//		        ps.setString(6, dto.getEnrollmentNo());  // specifying enrollmentNo as the identifier
//
//		        x = ps.executeUpdate();
//		        con.close();
//
//		    } catch (Exception ee) {
//		        System.out.println("Error updating student record: " + ee);
//		    }
//		    return x;
//		}
//			
			//update  method close
			
			

			    public void rejectRegistration(String enrollNo) {
			        String updateQuery = "UPDATE PendingRegistrations SET status = 'REJECTED' WHERE enrollNo = ?";
			        try (Connection con = DBConnection.getConn();
			             PreparedStatement ps = con.prepareStatement(updateQuery)) {
			            ps.setString(1, enrollNo);
			            ps.executeUpdate();
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			    }
			
			    // Method to retrieve pending registrations
			    public List<RegistrationGetterSetter> getPendingRegistrations() {
			        List<RegistrationGetterSetter> pendingRegistrations = new ArrayList<>();
			        String query = "SELECT * FROM student WHERE status = 'PENDING'";

			        try (Connection conn = DBConnection.getConn();  // Use your DB connection method
			             PreparedStatement stmt = conn.prepareStatement(query);
			             ResultSet rs = stmt.executeQuery()) {

			            while (rs.next()) {
			                RegistrationGetterSetter reg = new RegistrationGetterSetter();
			                reg.setName(rs.getString("name"));
			                reg.setEmail(rs.getString("email"));
			                reg.setEnrollmentNo(rs.getString("enrollmentNo"));
			                reg.setMobileNo(rs.getInt("phoneNo"));
			                reg.setYear(rs.getInt("year"));
			                reg.setPassword(rs.getString("password"));
			                reg.setStatus(rs.getString("status"));
			                pendingRegistrations.add(reg);
			            }
			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			        return pendingRegistrations;
			    }
			    
			    public boolean updateStatus(String enrollmentNo, String status) {
			        boolean result = false;
			        try (Connection conn = DBConnection.getConn();
			             PreparedStatement pstmt = conn.prepareStatement("UPDATE student SET status = ? WHERE enrollmentNo = ?")) {
			            pstmt.setString(1, status);
			            pstmt.setString(2, enrollmentNo);
			            result = pstmt.executeUpdate() > 0;
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			        return result;
			    }
			    
			    
			    public int insertdata(RegistrationGetterSetter reg) {
			    	int x =0;
			        try (Connection conn = DBConnection.getConn();
			             PreparedStatement pstmt = conn.prepareStatement(
			                     "INSERT INTO student (name, email, enrollmentNo, phoneNo, year, password, status) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
			            pstmt.setString(1, reg.getName());
			            pstmt.setString(2, reg.getEmail());
			            pstmt.setString(3, reg.getEnrollmentNo());
			            pstmt.setInt(4, reg.getMobileNo());
			            pstmt.setInt(5, reg.getYear());
			            pstmt.setString(6, reg.getPassword());
			            pstmt.setString(7, reg.getStatus());
			           
			            x = pstmt.executeUpdate();
			            conn.close();
			            
			        } catch (SQLException e) {
			            e.printStackTrace();
			            return 0;
			        }
			        return x;
			    }
			    
			    public String getStudentStatus(String enrollmentNo, String password) {
			        String status = null;
			        try (Connection con = DBConnection.getConn();
			             PreparedStatement ps = con.prepareStatement(
			                 "SELECT status FROM student WHERE enrollmentNo = ? AND password = ?")) {
			            
			            ps.setString(1, enrollmentNo);
			            ps.setString(2, password);
			            ResultSet rs = ps.executeQuery();
			            
			            if (rs.next()) {
			                status = rs.getString("status");
			            }
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			        return status;
			    }
			    
			    
			    public List<Object> searchUser(String enrollmentNo) {
			        List<Object> lt = new ArrayList<>();
			        try {
			            Connection con = DBConnection.getConn();
			            String query = "SELECT * FROM student WHERE enrollmentNo = ? ";
			            PreparedStatement ps = con.prepareStatement(query);
//			            ps.setString(1, id);
//			            ps.setString(2, password);
			            ps.setString(1, enrollmentNo);
			            ResultSet rs = ps.executeQuery();
			            if (rs.next()) {
			                      // Adjust column names based on actual table schema
			            	
			            	lt.add(rs.getString("name"));
			                lt.add(rs.getString("email"));
			                lt.add(rs.getString("enrollmentNo"));
			                lt.add(rs.getInt("phoneNo"));                // Replace with actual column names and types
			                lt.add(rs.getInt("year"));
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
			                "UPDATE student SET name=?, email=?, phoneNo=?, year=?, password=? WHERE enrollmentNo=?"
			            );
			            ps.setString(1, dto.getName());
			            ps.setString(2, dto.getEmail());
			            ps.setInt(3, dto.getMobileNo());
			            ps.setInt(4, dto.getYear());
			            ps.setString(5, dto.getPassword());
			            ps.setString(6, dto.getEnrollmentNo()); // Corrected to set enrollmentNo for WHERE clause

			            x = ps.executeUpdate();
			            con.close();

			        } catch (Exception ee) {
			            System.out.println("Error updating student record: " + ee);
			        }
			        return x;
			    }
			    
			    
			    public String getStudentName(String enrollmentNo) {
			        String name = null;
			        try (Connection con = DBConnection.getConn();
			             PreparedStatement ps = con.prepareStatement("SELECT name FROM student WHERE enrollmentNo = ?")) {
			            
			            ps.setString(1, enrollmentNo);
			            ResultSet rs = ps.executeQuery();
			            
			            if (rs.next()) {
			                name = rs.getString("name");
			            }
			            
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			        return name;
			    }
			  
			    public int getStudentYear(String enrollmentNo) {
			        int year = 0;
			        try (Connection con = DBConnection.getConn();
			             PreparedStatement ps = con.prepareStatement("SELECT year FROM student WHERE enrollmentNo = ?")) {
			            
			            ps.setString(1, enrollmentNo);
			            ResultSet rs = ps.executeQuery();
			            
			            if (rs.next()) {
			                year = rs.getInt("year");
			            }
			            
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			        return year;
			    }

}



