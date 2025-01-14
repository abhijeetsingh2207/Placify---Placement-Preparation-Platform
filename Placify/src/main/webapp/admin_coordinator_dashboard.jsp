<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.univ.dao.CoordinatorRegDAO, java.util.List, com.univ.dto.RegistrationGetterSetter" %>

<html>
<head>
    <title>Coordinator Approval Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/css_admin/dashboard.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // Function to send AJAX request to approve or reject the registration
        function updateTeacherStatus(coordinatorId, action) {
            $.ajax({
                url: 'AdminReviewCoordinator',
                type: 'POST',
                data: { coordinatorId: coordinatorId, action: action },
                success: function(response) {
                    // On success, update the status on the page
                    if (response === 'success') {
                        $('#row-' + coordinatorId).remove(); // Remove the row if status is updated
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
            margin-top: 20px;
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
    <h1>Review Pending Registrations</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Coordinator ID</th>
            <th>Phone No.</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        <% 
        CoordinatorRegDAO dao = new CoordinatorRegDAO();
        List<RegistrationGetterSetter> pendingRegistrations = dao.getPendingTeachers();
        for (RegistrationGetterSetter reg : pendingRegistrations) { 
        %>
        <tr id="row-<%= reg.getCoordinatorId() %>">
            <td><%= reg.getName() %></td>
            <td><%= reg.getCoordinatorId() %></td>
            <td><%= reg.getMobileNo() %></td>
            <td><%= reg.getEmail() %></td>
            <td>
                <button onclick="updateTeacherStatus('<%= reg.getCoordinatorId() %>', 'approve')">Approve</button>
                <button onclick="updateTeacherStatus('<%= reg.getCoordinatorId() %>', 'reject')">Reject</button>
            </td>
        </tr>
        <% } %>
    </table>
    <div class="back-button">
        <a href="manage_coordinator.jsp">Back to manage coordinator</a>
    </div>
</body>
</html>
