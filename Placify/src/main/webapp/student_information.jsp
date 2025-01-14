<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Information for Your Year</title>
    <style>
/* General Reset */
body, h1, p, ul, li {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    line-height: 1.6;
    background: linear-gradient(135deg, #eef2f3, #8e9eab);
    color: #333;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

/* Container Styling */
.container {
    max-width: 900px;
    width: 100%;
    background: #ffffff;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    animation: fadeIn 1.5s ease-in-out;
    transform: scale(1);
    transition: transform 0.5s;
}

.container:hover {
    transform: scale(1.01);
}

/* Heading */
h1 {
    text-align: center;
    font-size: 2.8rem;
    color: #0073e6;
    margin-bottom: 25px;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
    position: relative;
}

h1::after {
    content: '';
    display: block;
    width: 100px;
    height: 4px;
    background: #0073e6;
    margin: 10px auto 0;
    border-radius: 2px;
}

/* List Styling */
.info-list {
    list-style: none;
    padding: 0;
    margin: 20px 0;
}

.info-list li {
    background: #e3f2fd;
    color: #01579b;
    padding: 18px 20px;
    margin: 12px 0;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease-in-out;
    transform: translateY(0);
}

.info-list li:hover {
    background: #bbdefb;
    color: #002f6c;
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.info-list li::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 5px;
    height: 100%;
    background: linear-gradient(45deg, #42a5f5, #1e88e5);
    transition: left 0.3s ease-in-out;
}

.info-list li:hover::before {
    left: 0;
}

/* No Information Message */
.no-info {
    text-align: center;
    font-size: 1.3rem;
    color: #757575;
    margin-top: 20px;
    animation: fadeIn 1.2s ease;
}

/* Back Button */
.back-button {
    display: flex;
    justify-content: center;
    margin-top: 30px;
}

.back-button a {
    text-decoration: none;
    padding: 12px 25px;
    background: linear-gradient(90deg, #2196f3, #64b5f6);
    color: white;
    border-radius: 25px;
    font-size: 1rem;
    font-weight: 600;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease-in-out;
}

.back-button a:hover {
    background: linear-gradient(90deg, #1e88e5, #42a5f5);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
    transform: scale(1.1);
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

@media (max-width: 768px) {
    body {
        padding: 10px;
    }

    .container {
        padding: 20px 25px;
    }

    h1 {
        font-size: 2rem;
    }

    .info-list li {
        font-size: 0.9rem;
        padding: 12px 15px;
    }

    .back-button a {
        padding: 10px 20px;
        font-size: 0.9rem;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Information for Your Year</h1>
        <%
            // Retrieve the messages attribute from the request
            java.util.List<String> messages = (java.util.List<String>) request.getAttribute("messages");

            // Check if there are messages to display
            if (messages != null && !messages.isEmpty()) {
        %>
        <ul class="info-list">
            <%
                // Loop through each message in the list
                for (String message : messages) {
            %>
            <li><%= message %></li>
            <%
                }
            %>
        </ul>
        <%
            } else {
        %>
        <p class="no-info">No information available for your year.</p>
        <%
            }
        %>

        <!-- Back Button -->
        <div class="back-button">
            <a href="student_home_page.jsp">Back</a>
        </div>
    </div>
</body>
</html>
