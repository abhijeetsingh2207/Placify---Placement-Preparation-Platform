<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Year for Feedback</title>
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
    background: linear-gradient(to bottom right, #eef2f3, #d9e2ec, #ffffff);
    color: #333;
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
    padding: 30px;
    background: linear-gradient(to bottom, #ffffff, #f4f8fc);
    border-radius: 15px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
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

/* Form Label Styling */
label {
    font-size: 16px;
    font-weight: bold;
    color: #555;
}

/* Select Dropdown Styling */
select {
    width: 70%;
    padding: 12px;
    margin: 15px 0;
    font-size: 16px;
    color: #555;
    border: 1px solid #ccc;
    border-radius: 50px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    outline: none;
}

select:hover, select:focus {
    border-color: #007bff;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

/* Button Styling */
button {
    padding: 12px 30px;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to right, #007bff, #0056b3);
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
}

button:hover {
    background: linear-gradient(to right, #0056b3, #003d80);
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
}

/* Back Button Styling */
.back-button {
    margin-top: 20px;
}

.back-button a {
    display: inline-block;
    padding: 12px 30px;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to right, #6c757d, #5a6268);
    text-decoration: none;
    border-radius: 50px;
    font-weight: bold;
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

    select {
        width: 90%;
    }

    button, .back-button a {
        font-size: 14px;
        padding: 10px 20px;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Select Year</h1>
        <form action="AcademicFeedbackServlet" method="post">
            <label for="year">Choose a year to view feedback:</label><br>
            <select name="year" id="year" required>
                <option value="" disabled selected>-- Select Year --</option>
                <option value="1">1st year</option>
                <option value="2">2nd year</option>
                <option value="3">3rd year</option>
                <option value="4">4th year</option>
            </select><br>
            <button type="submit">View Feedback</button>
        </form>

        <!-- Back Button -->
        <div class="back-button">
            <a href="feedback_coordinator.jsp">Back</a>
        </div>
    </div>
</body>
</html>
