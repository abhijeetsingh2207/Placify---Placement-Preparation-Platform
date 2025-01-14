<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Student Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #444;
        }
        .options {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 30px;
        }
        .options a {
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .options a:hover {
            background-color: #0056b3;
        }
        .message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin: 20px 0;
            padding: 10px;
            background-color: #e7f9e7;
            border: 1px solid #c7e7c7;
            border-radius: 5px;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            text-align: center;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message">
                <%= message %>
            </div>
        <% 
            } 
        %>
        <h1>Admin - Student Dashboard</h1>
        <p>Select an option:</p>
        <div class="options">
            <a href="AdminDashboard.jsp">Verify Students</a>
            <a href="manage_year.jsp">Delete Year/Student</a>
            <a href="student_UIReview_feedback.jsp">Student UI Feedback</a>
        </div>
        <!-- Back Button -->
        <a href="admin_home.jsp" class="back-button">Back to Admin Home</a>
    </div>
</body>
</html>
