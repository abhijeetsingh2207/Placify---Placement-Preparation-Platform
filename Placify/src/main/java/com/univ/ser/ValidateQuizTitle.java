package com.univ.ser;

import java.io.IOException;
//import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class ValidateQuizTitle
 */
@WebServlet("/ValidateQuizTitle")
public class ValidateQuizTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateQuizTitle() {
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
		 String quizTitle = request.getParameter("quizTitle").trim();
	        String enrollmentNo = (String) request.getSession().getAttribute("enrollmentNo"); // Assuming the session stores enrollmentNo

	        try (Connection conn = com.univ.db.DBConnection.getConn()) {
	            // Check if the quiz title exists
	            String quizQuery = "SELECT id FROM quizzes WHERE title = ?";
	            PreparedStatement quizStmt = conn.prepareStatement(quizQuery);
	            quizStmt.setString(1, quizTitle);
	            ResultSet quizRs = quizStmt.executeQuery();

	            if (quizRs.next()) {
	                int quizId = quizRs.getInt("id");

	                // Check if the student has already attempted the quiz
	                String attemptQuery = "SELECT id FROM student_quiz_attempts WHERE enrollmentNo = ? AND quiz_id = ?";
	                PreparedStatement attemptStmt = conn.prepareStatement(attemptQuery);
	                attemptStmt.setString(1, enrollmentNo);
	                attemptStmt.setInt(2, quizId);
	                ResultSet attemptRs = attemptStmt.executeQuery();

	                if (attemptRs.next()) {
	                    // Student has already attempted the quiz
	                    request.setAttribute("errorMessage", "You have already attempted this quiz.");
	                    request.getRequestDispatcher("quiz_input.jsp").forward(request, response);
	                } else {
	                    // Student can take the quiz
	                    request.setAttribute("quizId", quizId);
	                    request.getRequestDispatcher("take_quiz.jsp").forward(request, response);
	                }
	            } else {
	                // Quiz title does not exist
	                request.setAttribute("errorMessage", "Invalid quiz title. Please try again.");
	                request.getRequestDispatcher("quiz_input.jsp").forward(request, response);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	}
}
