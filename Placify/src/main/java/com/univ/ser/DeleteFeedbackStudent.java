package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class DeleteFeedbackStudent
 */
@WebServlet("/DeleteFeedbackStudent")
public class DeleteFeedbackStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedbackStudent() {
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
		 String feedbackId = request.getParameter("feedbackId");

	        try (Connection conn = DBConnection.getConn()) {
	            // Delete query
	            String sql = "DELETE FROM webapp_feedback WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, feedbackId);

	            int rowsAffected = stmt.executeUpdate();
	            stmt.close();

	            if (rowsAffected > 0) {
	                request.setAttribute("message", "Feedback deleted successfully.");
	            } else {
	                request.setAttribute("message", "Failed to delete feedback. Feedback ID not found.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("message", "Error occurred: " + e.getMessage());
	        }

	        // Redirect back to student_academic_feedback.jsp
	        request.getRequestDispatcher("student_UIReview_feedback.jsp").forward(request, response);
	    
	}

}
