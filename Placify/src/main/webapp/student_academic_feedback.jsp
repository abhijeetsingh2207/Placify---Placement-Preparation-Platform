<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Feedback</title>
    <style>
       /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to bottom right, #e6f7ff, #ffffff);
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
    width: 60%;
    max-width: 800px;
    padding: 30px;
    border-radius: 15px;
    background: linear-gradient(to bottom, #ffffff, #f4f4f4);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    animation: fadeIn 1.2s ease-in-out;
}

h1 {
    text-align: center;
    font-size: 2.5rem;
    color: #004085;
    margin-bottom: 20px;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
}

textarea {
    width: 100%;
    height: 180px;
    padding: 15px;
    font-size: 1rem;
    border: 1px solid #ced4da;
    border-radius: 10px;
    resize: none;
    box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.05);
    transition: border-color 0.3s, box-shadow 0.3s;
    background: #f8f9fa;
}

textarea:focus {
    outline: none;
    border-color: #80bdff;
    box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
}

textarea::placeholder {
    color: #999;
    font-style: italic;
}

p {
    text-align: center;
    font-size: 1rem;
    color: #dc3545;
    margin-bottom: 15px;
}

/* Button Container */
.button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    gap: 15px;
}

button {
    flex: 1;
    padding: 12px 20px;
    font-size: 1rem;
    font-weight: bold;
    color: #fff;
    text-transform: uppercase;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    background: linear-gradient(to right, #28a745, #218838);
    box-shadow: 0 4px 10px rgba(40, 167, 69, 0.2);
}

button.home {
    background: linear-gradient(to right, #007bff, #0056b3);
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

button:active {
    transform: translateY(1px);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

/* Animations */
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
        width: 90%;
        padding: 20px;
    }

    h1 {
        font-size: 2rem;
    }

    button {
        font-size: 0.9rem;
        padding: 10px 15px;
    }

    textarea {
        height: 150px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 1.8rem;
    }

    button {
        font-size: 0.8rem;
        padding: 8px 12px;
    }

    textarea {
        height: 120px;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Feedback</h1>
         <% if (request.getAttribute("feedbackMessage") != null) { %>
                            <p style="color: red;"><%= request.getAttribute("feedbackMessage") %></p>
                        <% } %>
        <form action="Feedback_student" method="post">
            <textarea name="feedback" placeholder="Write your feedback here..." required></textarea>
            <div class="button-container">
             <button type="button" class="home" onclick="window.location.href='student_home_page.jsp'">Home</button>
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
