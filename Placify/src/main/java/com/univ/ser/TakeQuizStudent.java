package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TakeQuizStudent
 */
@WebServlet("/TakeQuizStudent")
public class TakeQuizStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeQuizStudent() {
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
		 int quizId = Integer.parseInt(request.getParameter("quizId"));

	        try (Connection conn = com.univ.db.DBConnection.getConn()) {
	            // Query quiz questions
	            String query = "SELECT question, option1, option2, option3, option4 FROM quiz_questions WHERE quiz_id = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, quizId);
	            ResultSet rs = ps.executeQuery();

	            // Store questions in a list
	            ArrayList<HashMap<String, String>> questions = new ArrayList<>();
	            while (rs.next()) {
	                HashMap<String, String> question = new HashMap<>();
	                question.put("question", rs.getString("question"));
	                question.put("option1", rs.getString("option1"));
	                question.put("option2", rs.getString("option2"));
	                question.put("option3", rs.getString("option3"));
	                question.put("option4", rs.getString("option4"));
	                questions.add(question);
	            }

	            // Forward to JSP
	            request.setAttribute("questions", questions);
	            request.setAttribute("quizId", quizId);
	            request.getRequestDispatcher("take_quiz.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	}

}
