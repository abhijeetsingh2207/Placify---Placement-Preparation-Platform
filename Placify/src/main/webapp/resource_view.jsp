 <%@page import="com.univ.db.DBConnection"%>
<%@ page import="java.sql.*, java.util.*" %>
 <%@ page import ="com.univ.dao.StudentRegDAO" %>
 <%@ page import ="com.univ.db.DBConfig" %>
<%@ page session="true" %>
<%
    // Check if the student session is valid
    Integer studentYear = (Integer) session.getAttribute("studentYear");
    if (studentYear == null) {
        response.sendRedirect("student_login.jsp"); // Redirect to login if session is invalid
        return;
    }

   Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish a database connection
       
          conn =  DBConnection.getConn();

        // Query the data for the student's year
        String sql = "SELECT subject, year, teacher_name, file_name, upload_date FROM teacher_resources WHERE year = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, studentYear);
        rs = stmt.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student View Resources</title>
    <style>
       /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to bottom right, #f0f8ff, #e6e9ef);
    color: #333;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    padding: 20px;
}

/* Header Styles */
h1 {
    font-size: 2.5rem;
    color: #2c3e50;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    margin-bottom: 20px;
    text-align: center;
    animation: fadeIn 1s ease-in-out;
}

/* Table Styles */
table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    animation: fadeInUp 1.2s ease-in-out;
}

thead {
    background: linear-gradient(to right, #007BFF, #0056b3);
    color: #fff;
    font-size: 1.1rem;
    text-transform: uppercase;
}

th, td {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    font-weight: bold;
}

td {
    background: #f9f9f9;
    color: #333;
    transition: background-color 0.3s ease;
}

tbody tr:hover td {
    background: #dceefb;
    transition: background-color 0.3s ease-in-out;
}

a.download-link {
    color: #007BFF;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease-in-out;
}

a.download-link:hover {
    color: #0056b3;
    text-decoration: underline;
}

/* Home Button */
.home-button {
    text-align: center;
    margin: 20px;
    animation: fadeInUp 1.5s ease-in-out;
}

.home-button a {
    color: white;
    background: linear-gradient(to right, #007BFF, #0056b3);
    padding: 12px 25px;
    text-decoration: none;
    border-radius: 25px;
    font-size: 1rem;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background 0.3s, transform 0.2s;
}

.home-button a:hover {
    background: linear-gradient(to right, #0056b3, #004080);
    transform: translateY(-3px);
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    h1 {
        font-size: 1.8rem;
    }

    table {
        font-size: 0.9rem;
        width: 100%;
    }

    th, td {
        padding: 10px;
    }

    .home-button a {
        font-size: 0.9rem;
        padding: 10px 20px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 1.5rem;
    }

    table {
        font-size: 0.8rem;
    }

    th, td {
        padding: 8px;
    }

    .home-button a {
        font-size: 0.8rem;
        padding: 8px 15px;
    }
}

    </style>
</head>
<body>
    <h1>Files Available for Download</h1>

    <table>
        <thead>
            <tr>
                <th>Subject</th>
                <th>Year</th>
                <th>Teacher Name</th>
                <th>File Name</th>
                <th>Upload Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (rs != null) {
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getInt("year") %></td>
                <td><%= rs.getString("teacher_name") %></td>
                <td><%= rs.getString("file_name") %></td>
                <td><%= rs.getTimestamp("upload_date") %></td>
                <td><a class="download-link" href="Download_resources?fileName=<%= rs.getString("file_name") %>">Download</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <div class="home-button">
        <a href="student_home_page.jsp">Home</a>
    </div>
</body>
</html>

<%
    // Close resources
  
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (rs != null)   conn.close();
    
   
%>
 