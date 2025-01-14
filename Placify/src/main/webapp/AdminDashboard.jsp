<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.univ.dao.StudentRegDAO, java.util.List, com.univ.dto.RegistrationGetterSetter" %>

<html>
<head>
    <title>Student Approval Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/css_admin/dashboard.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // Function to send AJAX request to approve or reject the registration
        function updateStatus(enrollmentNo, action) {
            $.ajax({
                url: 'AdminReviewServlet',
                type: 'POST',
                data: { enrollmentNo: enrollmentNo, action: action },
                success: function(response) {
                    // On success, update the status on the page
                    if (response === 'success') {
                        $('#row-' + enrollmentNo).remove(); // Remove the row if status is updated
                    } else {
                        alert('Failed to update status. Please try again.');
                    }
                },
                error: function() {
                    alert('Error while updating status.');
                }
            });
        }
    </script>
    <style>
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            text-align: center;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h1>Review Pending Registrations</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Enrollment No.</th>
            <th>Phone No.</th>
            <th>Year</th>
            <th>Action</th>
        </tr>
        <% 
            StudentRegDAO dao = new StudentRegDAO();
            List<RegistrationGetterSetter> pendingRegistrations = dao.getPendingRegistrations();
            for (RegistrationGetterSetter reg : pendingRegistrations) { 
        %>
            <tr id="row-<%= reg.getEnrollmentNo() %>">
                <td><%= reg.getName() %></td>
                <td><%= reg.getEmail() %></td>
                <td><%= reg.getEnrollmentNo() %></td>
                <td><%= reg.getMobileNo() %></td>
                <td><%= reg.getYear() %></td>
                <td>
                    <button onclick="updateStatus('<%= reg.getEnrollmentNo() %>', 'approve')">Approve</button>
                    <button onclick="updateStatus('<%= reg.getEnrollmentNo() %>', 'reject')">Reject</button>
                </td>
            </tr>
        <% } %>
    </table>
    <!-- Back Button -->
    <a href="manage_student.jsp" class="back-button">Back to Manage Students</a>
</body>
</html>
