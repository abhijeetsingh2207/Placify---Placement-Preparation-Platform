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
 * Servlet implementation class UploadQuizServlet
 */
@WebServlet("/UploadQuizServlet")
public class UploadQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadQuizServlet() {
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
		String quizTitle = request.getParameter("quizTitle");
        String startDate = request.getParameter("startDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String[] questions = request.getParameterValues("question[]");
        String[] option1 = request.getParameterValues("option1[]");
        String[] option2 = request.getParameterValues("option2[]");
        String[] option3 = request.getParameterValues("option3[]");
        String[] option4 = request.getParameterValues("option4[]");
        String[] answers = request.getParameterValues("answer[]");

        try (Connection conn = DBConnection.getConn()) {
            // Insert quiz metadata
            String insertQuiz = "INSERT INTO quizzes (title, start_date, start_time, end_time) VALUES (?, ?, ?, ?)";
            PreparedStatement psQuiz = conn.prepareStatement(insertQuiz, PreparedStatement.RETURN_GENERATED_KEYS);
            psQuiz.setString(1, quizTitle);
            psQuiz.setString(2, startDate);
            psQuiz.setString(3, startTime);
            psQuiz.setString(4, endTime);
            psQuiz.executeUpdate();

            ResultSet rs = psQuiz.getGeneratedKeys();
            rs.next();
            int quizId = rs.getInt(1);

            // Insert questions
            String insertQuestion = "INSERT INTO quiz_questions (quiz_id, question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement psQuestion = conn.prepareStatement(insertQuestion);

            for (int i = 0; i < questions.length; i++) {
                psQuestion.setInt(1, quizId);
                psQuestion.setString(2, questions[i]);
                psQuestion.setString(3, option1[i]);
                psQuestion.setString(4, option2[i]);
                psQuestion.setString(5, option3[i]);
                psQuestion.setString(6, option4[i]);
                psQuestion.setString(7, answers[i]);
                psQuestion.addBatch();
            }
            psQuestion.executeBatch();

            response.getWriter().println("Quiz uploaded successfully!");
            response.sendRedirect("coordinatore_home_page.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
	}

}
