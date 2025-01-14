<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Available Quizzes</title>
    <link rel="stylesheet" href="css/css_quiz/student_quiz.css">
</head>
<body>
    <h1>Available Quizzes</h1>
    <%
        ArrayList<String[]> quizzes = (ArrayList<String[]>) request.getAttribute("quizzes");
        if (quizzes != null && quizzes.size() > 0) {
    %>
    <div class="quiz-container">
        <% for (String[] quiz : quizzes) { %>
            <div class="quiz-card">
                <h3><%= quiz[1] %></h3>
                <p>Start: <%= quiz[2] %> | End: <%= quiz[3] %></p>
                <a href="takeQuiz.jsp?quiz_id=<%= quiz[0] %>">Take Quiz</a>
            </div>
        <% } %>
    </div>
    <% } else { %>
        <p>No quizzes available.</p>
    <% } %>
</body>
</html>
