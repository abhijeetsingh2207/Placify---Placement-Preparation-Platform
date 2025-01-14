 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import = " com.univ.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Quizzes</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/css_quiz/student_quiz.css">
</head>
<body>
    <div class="quiz-container">
        <h1 class="page-title">Available Quizzes</h1>

        <%
            // Database connection
          
            PreparedStatement stmt = null;
            ResultSet rs = null;
            List<Map<String, String>> quizzes = new ArrayList<>();

            try {
            	Connection conn = DBConnection.getConn();
                String sql = "SELECT * FROM quizzes WHERE start_date <= NOW() AND end_date >= NOW()";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                // Store quizzes in a list
                while (rs.next()) {
                    Map<String, String> quiz = new HashMap<>();
                    quiz.put("id", rs.getString("id"));
                    quiz.put("title", rs.getString("title"));
                    quiz.put("start_date", rs.getString("start_date"));
                    quiz.put("end_date", rs.getString("end_date"));
                    quizzes.add(quiz);
                    rs.close();
                    stmt.close();
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            } 
        %>

        <% if (!quizzes.isEmpty()) { %>
            <div class="quiz-cards-container">
                <% for (Map<String, String> quiz : quizzes) { %>
                    <div class="quiz-card">
                        <div class="card-header">
                            <h3 class="quiz-title"><%= quiz.get("title") %></h3>
                            <p class="quiz-dates">Start: <%= quiz.get("start_date") %> | End: <%= quiz.get("end_date") %></p>
                        </div>
                        <div class="card-footer">
                            <a class="start-btn" href="takeQuiz.jsp?quizId=<%= quiz.get("id") %>">Start Quiz</a>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <p class="no-quiz-msg">No quizzes available at the moment.</p>
        <% } %>
    </div>
</body>
</html>
 