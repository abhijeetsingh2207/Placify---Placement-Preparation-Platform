<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Coordinator Feedback</title>
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
    background: linear-gradient(135deg, #e6f7ff, #ffffff);
    background-repeat: no-repeat;
    background-attachment: fixed;
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
    background: linear-gradient(to bottom, #ffffff, #f7f9fc);
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

/* Feedback Message Styling */
p {
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #e74c3c;
}

/* Textarea Styling */
textarea {
    width: 100%;
    height: 150px;
    padding: 15px;
    font-size: 16px;
    color: #555;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    resize: none;
    outline: none;
}

textarea:focus {
    border-color: #007bff;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

/* Button Container Styling */
.button-container {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    margin-top: 20px;
}

/* Button Styling */
button {
    padding: 12px 20px;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to right, #28a745, #218838);
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
}

button.home {
    background: linear-gradient(to right, #007bff, #0056b3);
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
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

    textarea {
        height: 120px;
    }

    button {
        font-size: 14px;
        padding: 10px 15px;
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
        <form action="Feedback_coordinator" method="post">
            <textarea name="feedback" placeholder="Write your feedback here..." required></textarea>
            <div class="button-container">
             <button type="button" class="home" onclick="window.location.href='coordinatore_home_page.jsp'">Home</button>
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
