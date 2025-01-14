<%@ page import="java.io.PrintWriter, com.univ.dto.RegistrationGetterSetter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Status</title>
    <link rel="stylesheet" href="css/status.css"> <!-- Link to a CSS file for styling if needed -->
    <style>
        /* Additional inline CSS for the "Home" button */
        .home-button {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="status-container">
        <h1>Registration Status</h1>
        
        <%
            // Retrieve the status from the request
            String status = request.getParameter("status");
            
            if (status == null) {
                out.println("<p>Error: Unable to retrieve registration status.</p>");
            } else {
                // Display message based on the status
                switch (status) {
                    case "PENDING":
                        out.println("<p>Your registration is still under review by the admin. Please check back later for updates.</p>");
                        break;
                    case "APPROVED":
                        out.println("<p>Congratulations! Your registration has been approved. You can now log in.</p>");
                        out.println("<a href='student_login.jsp'>Go to Login</a>");
                        break;
                    case "REJECTED":
                        out.println("<p>We regret to inform you that your registration has been rejected. Please contact support for assistance.</p>");
                        out.println("<a href='contact.jsp'>Contact Support</a>");
                        break;
                    default:
                        out.println("<p>Invalid status. Please try again later.</p>");
                        break;
                }
            }
        %>

        <!-- Home button -->
        <a href="index.jsp" class="home-button">Home</a>
    </div>
</body>
</html>
