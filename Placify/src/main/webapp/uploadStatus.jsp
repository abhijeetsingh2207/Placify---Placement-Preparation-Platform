 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Status</title>
</head>
<body>
    <h1>Upload Status</h1>
    <%
        String status = request.getParameter("status");
        if ("success".equals(status)) {
    %>
        <p style="color: green;">File uploaded successfully!</p>
    <% } else if ("failure".equals(status)) { %>
        <p style="color: red;">Failed to upload the file. Please try again.</p>
    <% } else if ("error".equals(status)) { %>
        <p style="color: red;">An error occurred. Please check the logs.</p>
    <% } else { %>
        <p style="color: orange;">Invalid input. Please fill out the form correctly.</p>
    <% } %>
    <a href="upload_syllabus.jsp">Go Back</a>
</body>
</html>
 