package com.univ.dao;

import java.sql.Connection;
import javax.sql.*;
import java.sql.*;
import javax.naming.*;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.univ.db.DBConnection;
//import com.univ.DTO.StudentRegDTO;
import com.univ.db.DBConfig;
import com.univ.dto.QuestionsDTO;
import com.univ.dto.RegistrationDTO;

public class QuestionsDAO {
	
	

		//Insert method 
		public int insert(QuestionsDTO dto) {
			int x=0;
			try{
				Connection con= DBConnection.getConn();
				PreparedStatement ps=con.prepareStatement("insert into question(que,opt1,opt2,opt3,opt4,ans)value(?,?,?,?,?,?)");
				ps.setString(1,dto.getQue());
				ps.setString(2,dto.getOpt1());
				ps.setString(3,dto.getOpt2());
				ps.setString(4,dto.getOpt3());
				ps.setString(5,dto.getOpt4());
				ps.setString(6,dto.getAns());
				x=ps.executeUpdate();
				con.close();
				
			}catch(Exception ee) 
			{
				System.out.println(ee);
				}
			return x;
		}
		
		//Insert method close
	
		//get password method
		public boolean getAns(String Option)
		 {
			
			 boolean b=false;
			 try {
			 Connection con=DBConnection.getConn();
				PreparedStatement ps= con.prepareStatement("select ans from question where ans=? "); 
			   ps.setString(1, Option);
			 ResultSet rs=ps.executeQuery();
			 
			 b=rs.next();
			 
			 con.close();
			 }
			 catch(Exception e)
			 {
				 e.printStackTrace();
				 }
			 return b;
		 }
		//get password method close
		
		
		//get  search method
		 public List srchQues(int id)
		 {
			 List lt=new ArrayList();
			 try {
				 Connection con=DBConnection.getConn();
				 Statement stm=con.createStatement();
				 ResultSet rs= stm.executeQuery("select * from question where qid="+id);
				 if(rs.next())
				 {
			      lt.add(rs.getInt(1));
			      lt.add(rs.getString(2));
			      lt.add(rs.getString(3));
			      lt.add(rs.getString(4));
			      lt.add(rs.getString(5));
			      lt.add(rs.getString(6));
			   
			    }else {
			    	lt=null;
			    }
				 
			 }catch(Exception tt)
			 {System.out.println(tt);}
		   return lt;
		 }
			//get search method close

	}
