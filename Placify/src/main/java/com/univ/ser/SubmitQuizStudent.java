package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class SubmitQuizStudent
 */
@WebServlet("/SubmitQuizStudent")
public class SubmitQuizStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitQuizStudent() {
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
//		 int quizId = Integer.parseInt(request.getParameter("quizId"));
//	        int score = 0;
//
//	        try (Connection conn = com.univ.db.DBConnection.getConn()) {
//	            String query = "SELECT id, answer FROM quiz_questions WHERE quiz_id = ?";
//	            PreparedStatement ps = conn.prepareStatement(query);
//	            ps.setInt(1, quizId);
//	            ResultSet rs = ps.executeQuery();
//
//	            while (rs.next()) {
//	                int questionId = rs.getInt("id");
//	                String correctAnswer = rs.getString("answer");
//	                String studentAnswer = request.getParameter("answer" + questionId);
//
//	                if (studentAnswer != null && studentAnswer.equals(correctAnswer)) {
//	                    score++;
//	                }
//	            }
//
//	            request.setAttribute("score", score);
//	            request.getRequestDispatcher("quiz_result.jsp").forward(request, response);
//
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	            response.getWriter().println("Error: " + e.getMessage());
//	        }
		
		 int quizId = Integer.parseInt(request.getParameter("quizId"));
	        String enrollmentNo = (String) request.getSession().getAttribute("enrollmentNo");
	        int score = 0;

	        try (Connection conn = com.univ.db.DBConnection.getConn()) {
	            // Retrieve correct answers for the quiz
	            String query = "SELECT id, answer FROM quiz_questions WHERE quiz_id = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, quizId);
	            ResultSet rs = ps.executeQuery();

	            // Calculate score
	            while (rs.next()) {
	                int questionId = rs.getInt("id");
	                String correctAnswer = rs.getString("answer");

	                // Retrieve the student's answer for the question
	                String studentAnswer = request.getParameter("answer" + questionId);

	                if (studentAnswer != null && studentAnswer.equals(correctAnswer)) {
	                    score++;
	                }
	            }

	            // Store the result in the database
	            String insertResult = "INSERT INTO results (enrollmentNo, quiz_id, score) VALUES (?, ?, ?)";
	            PreparedStatement psResult = conn.prepareStatement(insertResult);
	            psResult.setString(1, enrollmentNo);
	            psResult.setInt(2, quizId);
	            psResult.setInt(3, score);
	            psResult.executeUpdate();

	            // Record the attempt
	            String insertAttempt = "INSERT INTO student_quiz_attempts (enrollmentNo, quiz_id) VALUES (?, ?)";
	            PreparedStatement psAttempt = conn.prepareStatement(insertAttempt);
	            psAttempt.setString(1, enrollmentNo);
	            psAttempt.setInt(2, quizId);
	            psAttempt.executeUpdate();

	            // Forward to a success page with the score
	            request.setAttribute("score", score);
	            request.getRequestDispatcher("quiz_result.jsp").forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	}

}
