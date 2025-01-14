package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;
import com.univ.db.DBConnection;

/**
 * Servlet implementation class Coordinator_UploadQuiz
 */
@WebServlet("/Coordinator_UploadQuiz")
public class Coordinator_UploadQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Coordinator_UploadQuiz() {
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
		// response.setContentType("text/html;charset=UTF-8");
		String title = request.getParameter("title");
	    String startDate = request.getParameter("start_date");
	    String endDate = request.getParameter("end_date");
	    int duration = Integer.parseInt(request.getParameter("duration"));

	    // Retrieve questions and options
	    String[] questionTexts = request.getParameterValues("questions[][text]");
	    String[] option1s = request.getParameterValues("questions[][option_1]");
	    String[] option2s = request.getParameterValues("questions[][option_2]");
	    String[] option3s = request.getParameterValues("questions[][option_3]");
	    String[] option4s = request.getParameterValues("questions[][option_4]");
	    String[] answers = request.getParameterValues("questions[][answer]");

	    if (questionTexts == null || option1s == null || option2s == null || option3s == null || option4s == null || answers == null) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid question data");
	        return;
	    }

	    List<Question> questions = new ArrayList<>();
	    try {
	        for (int i = 0; i < questionTexts.length; i++) {
	            Question question = new Question();
	            question.setQuestionText(questionTexts[i]);
	            question.setOption1(option1s[i]);
	            question.setOption2(option2s[i]);
	            question.setOption3(option3s[i]);
	            question.setOption4(option4s[i]);
	            question.setAnswer(Integer.parseInt(answers[i]));
	            questions.add(question);
	        }
	    } catch (Exception e) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid question data format");
	        return;
	    }

	    try (Connection conn = DBConnection.getConn()) {
	        

	        // Insert quiz
	        String insertQuizSql = "INSERT INTO quizzes (title, start_date, end_date, duration) VALUES (?, ?, ?, ?)";
	        try (PreparedStatement stmt = conn.prepareStatement(insertQuizSql, PreparedStatement.RETURN_GENERATED_KEYS )) {
	            stmt.setString(1, title);
	            stmt.setString(2, startDate);
	            stmt.setString(3, endDate);
	            stmt.setInt(4, duration);
	            stmt.executeUpdate();

	            // Retrieve generated quiz ID
	            int quizId;
	            try (ResultSet rs = stmt.getGeneratedKeys()) {
	                if (rs.next()) {
	                    quizId = rs.getInt(1);
	                } else {
	                    throw new SQLException("Failed to retrieve quiz ID");
	                }
	            }

	            // Insert questions
	            String insertQuestionSql = "INSERT INTO questions (quiz_id, question_text, option_1, option_2, option_3, option_4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)";
	            try (PreparedStatement questionStmt = conn.prepareStatement(insertQuestionSql)) {
	                for (Question question : questions) {
	                    questionStmt.setInt(1, quizId);
	                    questionStmt.setString(2, question.getQuestionText());
	                    questionStmt.setString(3, question.getOption1());
	                    questionStmt.setString(4, question.getOption2());
	                    questionStmt.setString(5, question.getOption3());
	                    questionStmt.setString(6, question.getOption4());
	                    questionStmt.setInt(7, question.getAnswer());
	                    questionStmt.executeUpdate();
	                }
	            }
	        }

	        conn.close(); // Commit transaction
	        response.sendRedirect("coordinator_home_page.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error uploading quiz: " + e.getMessage());
	   
	    }
}
	 private static class Question {
		 private String questionText;
	        private String option1;
	        private String option2;
	        private String option3;
	        private String option4;
	        private int answer;
	        public String getQuestionText() {
			return questionText;
		}
		public void setQuestionText(String questionText) {
			this.questionText = questionText;
		}
		public String getOption1() {
			return option1;
		}
		public void setOption1(String option1) {
			this.option1 = option1;
		}
		public String getOption2() {
			return option2;
		}
		public void setOption2(String option2) {
			this.option2 = option2;
		}
		public String getOption3() {
			return option3;
		}
		public void setOption3(String option3) {
			this.option3 = option3;
		}
		public String getOption4() {
			return option4;
		}
		public void setOption4(String option4) {
			this.option4 = option4;
		}
		public int getAnswer() {
			return answer;
		}
		public void setAnswer(int answer) {
			this.answer = answer;
		}
		private Question() {
			super();
		}
    private Question(String questionText, String option1, String option2, String option3, String option4,int answer) {
    	super();
    	this.questionText = questionText;
    	this.option1 = option1;
    	this.option2 = option2;
    	this.option3 = option3 ;
    	this.option4 = option4;
    	this.answer = answer;
    	
    	
    }
	    }
}
