<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Quizzes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Available Quizzes</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Start Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        // Connect to database
                        conn = com.univ.db.DBConnection.getConn();

                        // Query available quizzes
                        String query = "SELECT * FROM quizzes";
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();

                        // Current date and time
                        LocalDate currentDate = LocalDate.now();
                        LocalTime currentTime = LocalTime.now();

                        while (rs.next()) {
                            int quizId = rs.getInt("id");
                            String title = rs.getString("title");
                            Date startDate = rs.getDate("start_date");
                            Time startTime = rs.getTime("start_time");
                            Time endTime = rs.getTime("end_time");

                            boolean isAccessible = 
                                currentDate.equals(startDate.toLocalDate()) &&
                                currentTime.isAfter(startTime.toLocalTime()) &&
                                currentTime.isBefore(endTime.toLocalTime());

                            %>
                            <tr>
                                <td><%= title %></td>
                                <td><%= startDate %></td>
                                <td><%= startTime %></td>
                                <td><%= endTime %></td>
                                <td>
                                    <% if (isAccessible) { %>
                                        <form action="TakeQuizStudent" method="post" style="display:inline;">
                                            <input type="hidden" name="quizId" value="<%= quizId %>">
                                            <button type="submit" class="btn btn-primary">Take Quiz</button>
                                        </form>
                                    <% } else { %>
                                        <span class="text-danger">Not Accessible</span>
                                    <% } %>
                                </td>
                            </tr>
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
            </tbody>
        </table>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
