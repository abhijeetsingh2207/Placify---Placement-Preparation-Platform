 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take Quiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>

<style>
    /* General Body Styling */
    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to right, #1f4037, #99f2c8);
        color: #333;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Main Container */
    .container {
        background: #fff;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        max-width: 800px;
        width: 90%;
        animation: fadeIn 1.2s ease-in-out;
    }

    /* Page Header */
    h2 {
        text-align: center;
        font-size: 2.5rem;
        font-weight: bold;
        color: #1f4037;
        margin-bottom: 30px;
        position: relative;
    }

    h2::after {
        content: '';
        width: 100px;
        height: 4px;
        background: #99f2c8;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        bottom: -10px;
        border-radius: 2px;
    }

    /* Question Block Styling */
    h4 {
        font-size: 1.25rem;
        color: #333;
        font-weight: bold;
    }

    .mb-3 {
        margin-bottom: 25px;
    }

    input[type="radio"] {
        margin-right: 10px;
    }

    div input[type="radio"] + span {
        font-size: 1rem;
        color: #555;
        transition: color 0.3s ease-in-out;
    }

    div input[type="radio"]:hover + span {
        color: #1f4037;
    }

    /* Submit Button Styling */
    button {
        display: block;
        width: 100%;
        padding: 12px 20px;
        font-size: 1.2rem;
        font-weight: bold;
        color: #fff;
        background: linear-gradient(to right, #1f4037, #99f2c8);
        border: none;
        border-radius: 8px;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease-in-out;
    }

    button:hover {
        background: linear-gradient(to right, #99f2c8, #1f4037);
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
        transform: translateY(-2px);
    }

    button:active {
        transform: translateY(2px);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        h2 {
            font-size: 2rem;
        }

        button {
            font-size: 1rem;
        }

        .container {
            padding: 20px;
        }
    }

    /* Animation */
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
</style>

<body>
    <div class="container mt-5">
        <h2>Take Quiz</h2>
        <form action="SubmitQuizStudent" method="post">
            <input type="hidden" name="quizId" value="<%= request.getAttribute("quizId") %>">
            <%
                int quizId = (int) request.getAttribute("quizId");
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = com.univ.db.DBConnection.getConn();
                    String query = "SELECT * FROM quiz_questions WHERE quiz_id = ?";
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, quizId);
                    rs = ps.executeQuery();

                    int questionNumber = 1;
                    while (rs.next()) {
                        String question = rs.getString("question");
                        String option1 = rs.getString("option1");
                        String option2 = rs.getString("option2");
                        String option3 = rs.getString("option3");
                        String option4 = rs.getString("option4");
            %>
            <div class="mb-3">
                <h4>Q<%= questionNumber++ %>: <%= question %></h4>
                <div>
                    <input type="radio" name="answer<%= rs.getInt("id") %>" value="<%= option1 %>" required> <%= option1 %>
                </div>
                <div>
                    <input type="radio" name="answer<%= rs.getInt("id") %>" value="<%= option2 %>"> <%= option2 %>
                </div>
                <div>
                    <input type="radio" name="answer<%= rs.getInt("id") %>" value="<%= option3 %>"> <%= option3 %>
                </div>
                <div>
                    <input type="radio" name="answer<%= rs.getInt("id") %>" value="<%= option4 %>"> <%= option4 %>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
            <button type="submit" class="btn btn-primary">Submit Quiz</button>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 