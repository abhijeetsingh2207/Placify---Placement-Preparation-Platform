  <!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard</title>
    <link rel="stylesheet" href="css/css_progress/style.css">
     <style>
           .home-button {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="leaderboard-container">
        <h1 class="title">Leaderboard</h1>

        <!-- Title Selection Dropdown -->
        <label for="titleSelect">Select Title:</label>
        <form action="LeaderboardServlet" method="GET" id="titleForm">
            <select id="titleSelect" name="quizId" onchange="document.getElementById('titleForm').submit()">
                <option value="">--Select a Title--</option>
                <% 
                   // Dynamically populate titles from request attribute
                   List<Map<String, String>> quizzes = (List<Map<String, String>>) request.getAttribute("quizzes");
                   if (quizzes != null && !quizzes.isEmpty()) {
                       for (Map<String, String> quiz : quizzes) {
                           String quizId = quiz.get("id");
                           String title = quiz.get("title");
                           String selected = quizId.equals(request.getParameter("quizId")) ? "selected" : "";
                         //  out.println("<option value='" + quizId + "' " + selected + "'>" + title + "</option>");
                           out.println("<option value='" + quizId + "' " + selected + ">" + title + "</option>");
                       }
                   } else {
                       out.println("<option value=''>click to view the quiz </option>");
                   }
                %>
            </select>
        </form>

        <!-- Floating Download Button 
        <a id="downloadBtn" class="floating-download-button" href="<%= request.getAttribute("downloadLink") %>" style="<%= request.getAttribute("downloadLink") == null ? "display: none;" : "" %>">
            &#8681;
        </a>
-->
        <!-- Leaderboard -->
        <div id="leaderboard">
            <% 
                List<Map<String, String>> leaderboard = (List<Map<String, String>>) request.getAttribute("leaderboard");
            String selectedQuizId = request.getParameter("quizId");

            // Show leaderboard or fallback message
            if (selectedQuizId == null || selectedQuizId.isEmpty()) {
                out.println("<p>Please select a quiz to view the leaderboard.</p>");
            }
            else if (leaderboard != null && !leaderboard.isEmpty()) {
                    for (int i = 0; i < leaderboard.size(); i++) {
                        Map<String, String> entry = leaderboard.get(i);
                        out.println("<div class='leaderboard-item'>");
                        out.println("<span># " + (i + 1) + "</span>");
                        out.println("<span>Student ID: " + entry.get("enrollmentNo") + "</span>");
                        out.println("<span>Score: " + entry.get("score") + "</span>");
                        out.println("</div>");
                    }
                } else {
                    out.println("<p>No data available for the selected title.</p>");
                }
            %>
        </div>
         <a href="student_home_page.jsp" class="home-button">Home</a>
    </div>
   
</body>
</html>
 