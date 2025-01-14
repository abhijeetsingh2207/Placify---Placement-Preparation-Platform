package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.Part;

import com.univ.db.DBConnection;
/**
 * Servlet implementation class UploadInformation
 */
@WebServlet("/UploadInformation")
public class UploadInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		  String year = request.getParameter("year");
	        String message = request.getParameter("message");

	        if (year == null || year.isEmpty() || message == null || message.isEmpty()) {
	            response.getWriter().write("Year and message fields cannot be empty.");
	            return;
	        }

	        String tableName;
	        switch (year) {
	            case "1st Year": tableName = "firstyearinformation"; break;
	            case "2nd Year": tableName = "secondyearinformation"; break;
	            case "3rd Year": tableName = "thirdyearinformation"; break;
	            case "4th Year": tableName = "fourthyearinformation"; break;
	            default: 
	                response.getWriter().write("Invalid year");
	                return;
	        }

	        try (Connection conn = DBConnection.getConn()) {
	            String sql = "INSERT INTO " + tableName + " (message) VALUES (?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, message);
	            stmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().write("An error occurred while uploading the message.");
	            return;
	        }
	        
	        response.sendRedirect("pc_information.jsp");
	}

}
