<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student UI Feedback</title>
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
            max-width: 900px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions form {
            display: inline;
        }
        .btn {
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
            text-decoration: none;
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student UI Feedback</h1>
        <table>
            <thead>
                <tr>
                    <th>Enrollment ID</th>
                    <th>Student Name</th>
                    <th>Year</th>
                    <th>Feedback</th>
                    <th>Submitted On</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    java.sql.Connection conn = com.univ.db.DBConnection.getConn();
                    String query = "SELECT * FROM webapp_feedback";
                    java.sql.Statement stmt = conn.createStatement();
                    java.sql.ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>  <!-- Using getString for id -->
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getInt("year") %></td>
                    <td><%= rs.getString("feedback") %></td>
                    <td><%= rs.getTimestamp("submitted_at") %></td>
                    <td>
                        <div class="actions">
                            <form action="DeleteFeedbackStudent" method="post">
                                <input type="hidden" name="feedbackId" value="<%= rs.getString("id") %>"> <!-- Sending id as string -->
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } 
                    rs.close(); 
                    stmt.close(); 
                    conn.close();
                %>
            </tbody>
        </table>
        <a href="manage_student.jsp" class="btn-back">Back</a>
    </div>
</body>
</html>
