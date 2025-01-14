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

body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to bottom right, #e3fdfd, #ffffff);
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
    overflow-x: hidden;
}

/* Container Styles */
.container {
    width: 50%;
    padding: 30px;
    border-radius: 15px;
    background: linear-gradient(to bottom right, #ffffff, #f9f9f9);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    animation: fadeIn 1.5s ease-in-out;
}

h1 {
    text-align: center;
    font-size: 2.5rem;
    color: #2c3e50;
    margin-bottom: 20px;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

p {
    text-align: center;
    font-size: 1.2rem;
    color: #555;
    margin-bottom: 30px;
}

/* Button Container */
.button-container {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
}

.button {
    flex: 1;
    max-width: 45%;
    text-align: center;
    padding: 20px 15px;
    font-size: 1.1rem;
    font-weight: bold;
    color: #fff;
    text-decoration: none;
    border-radius: 15px;
    background: linear-gradient(to right, #007bff, #0056b3);
    box-shadow: 0 6px 15px rgba(0, 123, 255, 0.3);
    transition: all 0.3s ease-in-out;
    position: relative;
    overflow: hidden;
}

.button:hover {
    background: linear-gradient(to right, #0056b3, #003f7f);
    box-shadow: 0 10px 20px rgba(0, 123, 255, 0.5);
    transform: scale(1.05);
}

.button::before {
    content: '';
    position: absolute;
    top: -100%;
    left: -100%;
    width: 300%;
    height: 300%;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 10%, transparent 50%);
    animation: pulse 2.5s infinite;
    transition: opacity 0.3s ease;
}

.button:hover::before {
    opacity: 1;
}

/* Back Button */
.back-button {
    text-align: center;
    margin-top: 40px;
}

.back-button a {
    padding: 12px 25px;
    font-size: 1rem;
    font-weight: bold;
    color: #fff;
    text-decoration: none;
    border-radius: 10px;
    background: linear-gradient(to right, #6c757d, #5a6268);
    box-shadow: 0 5px 15px rgba(108, 117, 125, 0.3);
    transition: all 0.3s ease-in-out;
}

.back-button a:hover {
    background: linear-gradient(to right, #5a6268, #495057);
    box-shadow: 0 8px 20px rgba(108, 117, 125, 0.5);
    transform: translateY(-2px);
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes pulse {
    0% {
        top: -100%;
        left: -100%;
        opacity: 0;
    }
    50% {
        top: 50%;
        left: 50%;
        opacity: 0.5;
    }
    100% {
        top: 200%;
        left: 200%;
        opacity: 0;
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        width: 70%;
    }

    h1 {
        font-size: 2rem;
    }

    .button {
        font-size: 1rem;
        max-width: 100%;
    }

    .button-container {
        gap: 10px;
    }

    .back-button a {
        font-size: 0.9rem;
        padding: 10px 20px;
    }
}

@media (max-width: 480px) {
    .container {
        width: 90%;
    }

    h1 {
        font-size: 1.8rem;
    }

    .button {
        font-size: 0.9rem;
    }

    .back-button a {
        font-size: 0.8rem;
        padding: 8px 15px;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Feedback Portal</h1>
        <p>Select a feedback module:</p>
        <div class="button-container">
            <a href="student_academic_feedback.jsp" class="button">Create Academic Feedback</a>
            <a href="webapp_feedback.jsp" class="button">Create Web App Feedback</a>
        </div>

        <!-- Back Button -->
        <div class="back-button">
            <a href="student_home_page.jsp">Back</a>
        </div>
    </div>
</body>
</html>
