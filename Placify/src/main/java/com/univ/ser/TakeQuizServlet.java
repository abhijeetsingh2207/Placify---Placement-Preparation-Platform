package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class TakeQuizServlet
 */
@WebServlet("/TakeQuizServlet")
public class TakeQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeQuizServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 int quizId = Integer.parseInt(request.getParameter("quizId"));
	        Quiz quiz = null;
	        List<Question> questions = new ArrayList<>();
	        try (Connection conn = DBConnection.getConn();
	             PreparedStatement quizStmt = conn.prepareStatement("SELECT * FROM quizzes WHERE id = ?");
	             PreparedStatement questionStmt = conn.prepareStatement("SELECT * FROM questions WHERE quiz_id = ?")) {

	            quizStmt.setInt(1, quizId);
	            ResultSet quizRs = quizStmt.executeQuery();
	            if (quizRs.next()) {
	                quiz = new Quiz(
	                        quizRs.getInt("id"),
	                        quizRs.getString("title"),
	                        quizRs.getTimestamp("start_date"),
	                        quizRs.getTimestamp("end_date"),
	                        quizRs.getInt("duration")
	                );
	            }

	            questionStmt.setInt(1, quizId);
	            ResultSet questionRs = questionStmt.executeQuery();
	            while (questionRs.next()) {
	                questions.add(new Question(
	                        questionRs.getInt("id"),
	                        questionRs.getString("question_text"),
	                        questionRs.getString("option_1"),
	                        questionRs.getString("option_2"),
	                        questionRs.getString("option_3"),
	                        questionRs.getString("option_4"),
	                        questionRs.getInt("answer")
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        request.setAttribute("quiz", quiz);
	        request.setAttribute("questions", questions);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("takeQuiz.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 int quizId = Integer.parseInt(request.getParameter("quizId"));
	        String studentId = (String) request.getSession().getAttribute("studentId"); // Assumes a logged-in session
	        String studentName = (String) request.getSession().getAttribute("studentName");
	        int year = (int) request.getSession().getAttribute("year");
	        int score = 0;

	        try (Connection conn = DBConnection.getConn();
	             PreparedStatement stmt = conn.prepareStatement("INSERT INTO results (student_name, enrollment_id, year, quiz_id, score) VALUES (?, ?, ?, ?, ?)")) {

	            String[] answers = request.getParameterValues("answer");
	            for (String answer : answers) {
	                int questionId = Integer.parseInt(answer.split("_")[0]);
	                int chosenOption = Integer.parseInt(answer.split("_")[1]);

	                // Check the answer
	                PreparedStatement questionStmt = conn.prepareStatement("SELECT answer FROM questions WHERE id = ?");
	                questionStmt.setInt(1, questionId);
	                ResultSet rs = questionStmt.executeQuery();
	                if (rs.next() && rs.getInt("answer") == chosenOption) {
	                    score++;
	                }
	            }

	            stmt.setString(1, studentName);
	            stmt.setString(2, studentId);
	            stmt.setInt(3, year);
	            stmt.setInt(4, quizId);
	            stmt.setInt(5, score);
	            stmt.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        response.sendRedirect("quizResult.jsp?score=" + score);
	}

}
