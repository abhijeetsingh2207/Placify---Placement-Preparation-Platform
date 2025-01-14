<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta   
 name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher   
 Quiz Management</title>
    <link rel="stylesheet" href="css/css_quiz/teacher.css">
</head>
<body>
    <div class="container">
        <h1>Upload a Quiz</h1>
        <form id="quiz-form" method="POST" action="Coordinator_UploadQuiz">
            <div>
                <label for="title">Quiz Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div>
                <label for="start_date">Start Date & Time:</label>
                <input type="datetime-local" id="start_date" name="start_date" required>
            </div>
            <div>
                <label for="end_date">End Date & Time:</label>
                <input type="datetime-local" id="end_date" name="end_date" required>
            </div>
            <div>
                <label for="duration">Duration (in minutes):</label>
                <input type="number" id="duration" name="duration" required>
            </div>
            <div id="questions-section">
                <h3>Questions</h3>
                <div class="question">
                    <input type="text" name="questions[0][text]" placeholder="Question Text" required>
                    <input type="text" name="questions[0][option_1]" placeholder="Option 1" required>
                    <input type="text" name="questions[0][option_2]" placeholder="Option 2" required>
                    <input type="text" name="questions[0][option_3]" placeholder="Option 3" required>
                    <input type="text" name="questions[0][option_4]" placeholder="Option 4" required>
                    <select name="questions[0][answer]" required>
                        <option value="">Select Correct Option</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                        <option value="4">Option 4</option>
                    </select>
                </div>   

            </div>
            <button type="button" id="add-question">Add Question</button>
            <button type="submit">Upload Quiz</button>
        </form>
    </div>

    <script>
        const addQuestionBtn = document.getElementById('add-question');
        const questionsSection = document.getElementById('questions-section');
        let questionIndex = 1;

        addQuestionBtn.addEventListener('click', () => {
            const questionDiv = document.createElement('div');
            questionDiv.classList.add('question');
            questionDiv.innerHTML = `
                <input type="text" name="questions[${questionIndex}][text]" placeholder="Question Text" required>
                <input type="text" name="questions[${questionIndex}][option_1]" placeholder="Option 1" required>
                <input type="text" name="questions[${questionIndex}][option_2]" placeholder="Option 2" required>
                <input type="text" name="questions[${questionIndex}][option_3]" placeholder="Option 3" required>
                <input type="text" name="questions[${questionIndex}][option_4]" placeholder="Option 4" required>
                <select name="questions[${questionIndex}][answer]" required>
                    <option value="">Select Correct Option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                    <option value="4">Option 4</option>
                </select>
            `;
            questionsSection.appendChild(questionDiv);
            questionIndex++;
        });
    </script>
</body>
</html>