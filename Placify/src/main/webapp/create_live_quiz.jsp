 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Live Quiz</title>
    <link rel="stylesheet" href="css/css_quiz/styles.css">
    <script>
        // JavaScript to dynamically add question, options, and answer fields
        function addQuestion() {
    const questionBlock = document.createElement("div");
    questionBlock.classList.add("question-block");

    questionBlock.innerHTML = `
        <label>Question:</label>
        <input type="text" name="question" required>

        <label>Option 1:</label>
        <input type="text" name="option1" required>

        <label>Option 2:</label>
        <input type="text" name="option2" required>

        <label>Option 3:</label>
        <input type="text" name="option3" required>

        <label>Option 4:</label>
        <input type="text" name="option4" required>

        <label>Correct Answer:</label>
        <input type="text" name="answer" required>
    `;

    document.getElementById("questionsContainer").appendChild(questionBlock);
}

    </script>
</head>
<body>
    <h1>Create Live Quiz</h1>
    
    <!-- Form to create a live quiz with questions, options, and answers -->
   <form action="Create_live_quiz" method="post">
    <label for="quizId">Quiz ID:</label>
    <input type="text" name="quizId" required><br><br>

    <div id="questionsContainer">
        <!-- Initial question, options, and answer fields -->
        <div class="question-block">
            <label>Question:</label>
            <input type="text" name="question" required>

            <label>Option 1:</label>
            <input type="text" name="option1" required>

            <label>Option 2:</label>
            <input type="text" name="option2" required>

            <label>Option 3:</label>
            <input type="text" name="option3" required>

            <label>Option 4:</label>
            <input type="text" name="option4" required>

            <label>Correct Answer:</label>
            <input type="text" name="answer" required>
        </div>
    </div>

    <button type="button" onclick="addQuestion()">Add Another Question</button><br><br>

    <input type="submit" value="Create Quiz">
</form>

</body>
</html>
 