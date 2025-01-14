 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Student Progress</title>
    <link rel="stylesheet" href="css/css_progress/co-orcheckprogress.css">
</head>
<body>
    <div class="progress-container">
        <h1 class="title">Check Student Progress</h1>
        <form action="StudentProgressServlet" method="GET">
            <label for="enrollmentNo">Enter Student Enrollment Number:</label>
            <input type="text" id="enrollmentNo" name="enrollmentNo" placeholder="Enter Enrollment Number" required>
            <input type="hidden" name="action" value="get_progress">
            <button type="submit">View Progress</button>
        </form>

        <!-- Home Button -->
        <div style="margin-top: 20px;">
            <button onclick="redirectToHome()" style="padding: 10px 20px; font-size: 16px; background-color: #FF6F61; color: white; border: none; border-radius: 5px; cursor: pointer;">
                Home
            </button>
        </div>
    </div>

    <script>
        function redirectToHome() {
            // Redirect to the home page
            window.location.href = "coordinatore_home_page.jsp"; // Change 'home.jsp' to the actual home page path
        }
    </script>
</body>
</html>
 