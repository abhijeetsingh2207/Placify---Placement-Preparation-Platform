 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Quiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
    
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(to bottom right, #eef2f3, #ffffff);
    color: #333;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

/* Container Styles */
.container {
    max-width: 600px;
    width: 100%;
    background-color: #ffffff;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
}

.container:hover {
    transform: translateY(-10px);
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.2);
}

/* Heading Styles */
h1 {
    font-size: 26px;
    color: #007bff;
    margin-bottom: 25px;
    position: relative;
}

h1::after {
    content: '';
    width: 50px;
    height: 3px;
    background-color: #007bff;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: -5px;
    border-radius: 2px;
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    gap: 15px;
}

/* Label Styles */
label {
    font-size: 16px;
    color: #555;
    text-align: left;
    font-weight: bold;
}

/* Input and Select Styles */
select,
textarea {
    font-size: 16px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #f9f9f9;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    width: 100%;
    box-sizing: border-box;
}

select:focus,
textarea:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.3);
    outline: none;
}

/* Button Styles */
button {
    font-size: 18px;
    font-weight: bold;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(to right, #007bff, #0056b3);
    color: white;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

button:hover {
    background: linear-gradient(to right, #0056b3, #004080);
    transform: scale(1.05);
}

/* Back Button Styles */
.back-button {
    margin-top: 20px;
}

.back-button a {
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 20px;
    color: white;
    border-radius: 8px;
    background: linear-gradient(to right, #6c757d, #495057);
    transition: background 0.3s ease, transform 0.2s ease;
    display: inline-block;
}

.back-button a:hover {
    background: linear-gradient(to right, #495057, #343a40);
    transform: scale(1.05);
}

/* Footer */
footer {
    margin-top: 20px;
    font-size: 14px;
    color: #888;
    text-align: center;
}
    
    </style>
    <script>
        function addQuestion() {
            const container = document.getElementById('questions-container');
            const questionBlock = `
                <div class="mb-3 question-block">
                    <label class="form-label">Question:</label>
                    <input type="text" name="question[]" class="form-control" required>
                    <div class="mt-2">
                        <label>Options:</label>
                        <div>
                            <input type="text" name="option1[]" class="form-control mt-1" placeholder="Option 1" required>
                            <input type="text" name="option2[]" class="form-control mt-1" placeholder="Option 2" required>
                            <input type="text" name="option3[]" class="form-control mt-1" placeholder="Option 3" required>
                            <input type="text" name="option4[]" class="form-control mt-1" placeholder="Option 4" required>
                        </div>
                    </div>
                    <div class="mt-2">
                        <label>Answer:</label>
                        <input type="text" name="answer[]" class="form-control" placeholder="Correct Answer" required>
                    </div>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', questionBlock);
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2>Upload Quiz</h2>
        <form action="UploadQuizServlet" method="post">
            <div class="mb-3">
                <label for="quizTitle" class="form-label">Quiz Title:</label>
                <input type="text" id="quizTitle" name="quizTitle" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date:</label>
                <input type="date" id="startDate" name="startDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="startTime" class="form-label">Start Time:</label>
                <input type="time" id="startTime" name="startTime" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="endTime" class="form-label">End Time:</label>
                <input type="time" id="endTime" name="endTime" class="form-control" required>
            </div>
            <div id="questions-container" class="mb-3">
                <h4>Questions</h4>
            </div>
            <button type="button" class="btn btn-secondary mb-3" onclick="addQuestion()">Add Question</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 