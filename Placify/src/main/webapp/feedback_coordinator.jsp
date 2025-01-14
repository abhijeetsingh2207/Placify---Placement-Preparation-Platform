<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Portal</title>
    <style>
       /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(to bottom right, #f8f9fa, #e3e6f0, #ffffff);
    color: #343a40;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 20px;
}

/* Container Styling */
.container {
    width: 90%;
    max-width: 600px;
    background: linear-gradient(to bottom, #ffffff, #f4f6fc);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.7s ease-out;
    text-align: center;
}

/* Heading Styling */
h1 {
    font-size: 28px;
    font-weight: bold;
    color: #007bff;
    background: linear-gradient(to right, #0056b3, #007bff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 20px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

/* Paragraph Styling */
p {
    font-size: 16px;
    margin-bottom: 20px;
    color: #555;
}

/* Button Container Styling */
.button-container {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 20px;
}

/* Button Styling */
.button {
    flex: 1;
    max-width: 250px;
    display: inline-block;
    padding: 15px;
    font-size: 16px;
    text-align: center;
    color: #fff;
    background: linear-gradient(to right, #007bff, #0056b3);
    border: none;
    border-radius: 50px;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
    position: relative;
}

.button:hover {
    background: linear-gradient(to right, #0056b3, #003d80);
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
}

/* Back Button Styling */
.back-button {
    margin-top: 30px;
    text-align: center;
}

.back-button a {
    text-decoration: none;
    padding: 12px 25px;
    background: linear-gradient(to right, #6c757d, #5a6268);
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 50px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
}

.back-button a:hover {
    background: linear-gradient(to right, #5a6268, #495057);
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
}

/* Animation Effects */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 20px;
    }

    h1 {
        font-size: 24px;
    }

    .button {
        padding: 12px;
        font-size: 14px;
    }

    .back-button a {
        font-size: 14px;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Feedback Portal</h1>
        <p>Select a feedback module:</p>
        <div class="button-container">
            <a href="academic_feedback_review.jsp" class="button">View Academic Feedback</a>
            <a href="webapp_feedback_coordinator.jsp" class="button">Create Web App Feedback</a>
        </div>
        <!-- Back Button -->
        <div class="back-button">
            <a href="coordinatore_home_page.jsp">Back</a>
        </div>
    </div>
</body>
</html>
