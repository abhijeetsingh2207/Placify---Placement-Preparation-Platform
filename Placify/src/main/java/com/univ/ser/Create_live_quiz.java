package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Create_live_quiz
 */
@WebServlet("/Create_live_quiz")
public class Create_live_quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_live_quiz() {
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
		 String quizId = request.getParameter("quizId");
		    String[] questions = request.getParameterValues("question");
		    String[] options1 = request.getParameterValues("option1");
		    String[] options2 = request.getParameterValues("option2");
		    String[] options3 = request.getParameterValues("option3");
		    String[] options4 = request.getParameterValues("option4");
		    String[] answers = request.getParameterValues("answer");

		    // Validate input lengths
		    if (questions == null || options1 == null || options2 == null || options3 == null || options4 == null || answers == null ||
		        questions.length != options1.length || questions.length != options2.length || questions.length != options3.length || 
		        questions.length != options4.length || questions.length != answers.length) {
		        response.getWriter().write("Error: Mismatched input data. Please ensure all fields are filled.");
		        return;
		    }

		    try (Connection conn = DBConnection.getConn()) {
		        conn.setAutoCommit(false);
		        String sql = "INSERT INTO live_quizzes (quiz_id, question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)";
		        PreparedStatement stmt = conn.prepareStatement(sql);

		        for (int i = 0; i < questions.length; i++) {
		            stmt.setString(1, quizId);
		            stmt.setString(2, questions[i]);
		            stmt.setString(3, options1[i]);
		            stmt.setString(4, options2[i]);
		            stmt.setString(5, options3[i]);
		            stmt.setString(6, options4[i]);
		            stmt.setString(7, answers[i]);
		            stmt.addBatch();
		        }

		        stmt.executeBatch();
		        conn.commit();
		        response.sendRedirect("Coordinator_upload_quiz.jsp");
		    } catch (SQLException e) {
		        e.printStackTrace();
		        response.getWriter().write("Error creating live quiz.");
	}
	}
}
