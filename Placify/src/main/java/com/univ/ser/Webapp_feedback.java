package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Webapp_feedback
 */
@WebServlet("/Webapp_feedback")
public class Webapp_feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Webapp_feedback() {
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
		 String feedback = request.getParameter("feedback");
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("enrollmentNo") == null) {
	        	request.setAttribute("feedbackMessage", "You must log in to submit feedback.");
             request.getRequestDispatcher("webapp_feedback.jsp").forward(request, response);
	           
	            return;
	        }

	        String studentId = (String) session.getAttribute("enrollmentNo");
	        String studentName = (String) session.getAttribute("name");
	        int studentYear = (int) session.getAttribute("studentYear");

	        try(Connection conn = DBConnection.getConn()) {
	            String sql = "INSERT INTO webapp_feedback (id,name, year, feedback) VALUES (?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, studentId);
	            statement.setString(2, studentName);
	            statement.setInt(3, studentYear);
	            statement.setString(4, feedback);

	            int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {
	                request.setAttribute("feedbackMessage", "Thank you for your feedback!");
	                request.getRequestDispatcher("webapp_feedback.jsp").forward(request, response);
	            } else {
	            	request.setAttribute("feedbackMessage", "An error occurred. Please try again.");
	                request.getRequestDispatcher("webapp_feedback.jsp").forward(request, response);
	                
	            }

	            // Close the connection
	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	}

}
