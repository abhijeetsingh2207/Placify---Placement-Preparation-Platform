<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Take Quiz: ${quiz.title}</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>${quiz.title}</h1>
    <form action="takeQuiz" method="POST">
        <c:forEach var="question" items="${questions}" varStatus="status">
            <div class="question">
                <h3>Q${status.index + 1}: ${question.questionText}</h3>
                <div class="options">
                    <label><input type="radio" name="answer" value="${question.id}_1"> ${question.option1}</label><br>
                    <label><input type="radio" name="answer" value="${question.id}_2"> ${question.option2}</label><br>
                    <label><input type="radio" name="answer" value="${question.id}_3"> ${question.option3}</label><br>
                    <label><input type="radio" name="answer" value="${question.id}_4"> ${question.option4}</label>
                </div>
            </div>
        </c:forEach>
        <button type="submit">Submit Quiz</button>
    </form>
</body>
</html>
