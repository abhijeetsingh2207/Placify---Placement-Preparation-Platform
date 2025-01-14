<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Quiz</title>
    <link rel="stylesheet" href="css/css_quiz/styles.css">
</head>
<body>
    <h1>Upload Quiz</h1>
    
    <!-- Form to upload file with unique ID -->
    <form action="Upload_file_quiz" method="post" enctype="multipart/form-data">
        <h2>Insert Quiz Details</h2>
        <label for="quizId">Unique Quiz ID:</label>
        <input type="text" id="quizId" name="quizId" placeholder="Enter Unique Quiz ID" required><br><br>

        <label for="quizFile">Upload File (any format):</label>
        <input type="file" id="quizFile" name="quizFile" accept="*/*" required><br><br>
        
        <input type="submit" value="Upload Quiz">
    </form>
</body>
</html>

