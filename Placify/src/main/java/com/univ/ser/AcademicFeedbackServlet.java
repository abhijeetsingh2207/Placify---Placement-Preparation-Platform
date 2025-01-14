package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class AcademicFeedbackServlet
 */
@WebServlet("/AcademicFeedbackServlet")
public class AcademicFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcademicFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 String year = request.getParameter("year");
	        ArrayList<String[]> feedbackData = new ArrayList<>();

	        try {
	            // Database connection
	           
	            Connection conn = DBConnection.getConn();

	            // Query to get feedback for the selected year
	            String query = "SELECT id, name, year, feedback FROM feedback_student WHERE year = ?";
	            PreparedStatement stmt = conn.prepareStatement(query);
	            stmt.setInt(1, Integer.parseInt(year));
	            ResultSet rs = stmt.executeQuery();

	            // Add data to the list
	            while (rs.next()) {
	                String[] row = new String[4];
	                row[0] = rs.getString("id");
	                row[1] = rs.getString("name");
	                row[2] = String.valueOf(rs.getInt("year"));
	                row[3] = rs.getString("feedback");
	                
	                feedbackData.add(row);
	            }

	            rs.close();
	            stmt.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        // Set feedback data as a request attribute and forward to JSP
	        request.setAttribute("feedbackData", feedbackData);
	        request.getRequestDispatcher("academic_feedback_results.jsp").forward(request, response);
	    
	}

}
