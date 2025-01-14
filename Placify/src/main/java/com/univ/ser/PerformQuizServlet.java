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
 * Servlet implementation class PerformQuizServlet
 */
@WebServlet("/PerformQuizServlet")
public class PerformQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerformQuizServlet() {
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
		 int quizId = Integer.parseInt(request.getParameter("quiz_id"));
	        int studentId = 1; // Replace with session-based ID retrieval
	        int score = 0;

	        try (Connection conn = DBConnection.getConn()) {
	            String sql = "SELECT * FROM questions WHERE quiz_id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, quizId);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                int questionId = rs.getInt("id");
	                int correctAnswer = rs.getInt("answer");
	                int studentAnswer = Integer.parseInt(request.getParameter("answer_" + questionId));

	                if (correctAnswer == studentAnswer) {
	                    score++;
	                }
	            }

	            // Save the result
	            sql = "INSERT INTO results (student_id, quiz_id, score) VALUES (?, ?, ?)";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, studentId);
	            stmt.setInt(2, quizId);
	            stmt.setInt(3, score);
	            stmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        response.getWriter().write("Your score: " + score);
	}

}
