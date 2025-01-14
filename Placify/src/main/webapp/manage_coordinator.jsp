<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Coordinator Dashboard</title>
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
        .back-button {
            text-align: center;
            margin-top: 20px;
        }
        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .back-button a:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin - Coordinator Dashboard</h1>
        <p>Select an option:</p>
        <div class="options">
            <a href="admin_coordinator_dashboard.jsp">Verify Coordinator</a>
            <a href="delete_by_coordinatorID.jsp">Delete Coordinator</a>
            <a href="coordinator_UIReview_feedback.jsp">Coordinator UI Feedback</a>
        </div>
        <div class="back-button">
            <a href="admin_home.jsp">Back to Admin Home </a>
        </div>
    </div>
</body>
</html>
