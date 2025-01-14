<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete by CoordinatorID</title>
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
            max-width: 500px;
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
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }
        input[type="text"], button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        /* Style for the message */
        .message {
            color: red;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .back-button {
            margin-top: 20px;
            text-align: center;
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
        <h1>Delete Coordinator by Coordinator ID</h1>
        <form action="DeleteByCoordinatorID" method="post">
            <label for="enrollmentNo">Enter ID of Coordinator:</label>
            <input type="text" id="enrollmentNo" name="coordinatorId" placeholder="Coordinator ID" required>
            <button type="submit">Delete Coordinator</button>
        </form>
        <div class="back-button">
            <a href="manage_coordinator.jsp">Back</a>
        </div>
    </div>
</body>
</html>
