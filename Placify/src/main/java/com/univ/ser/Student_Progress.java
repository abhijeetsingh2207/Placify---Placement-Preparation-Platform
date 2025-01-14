package com.univ.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Student_Progress
 */
@WebServlet("/Student_Progress")
public class Student_Progress extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_Progress() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve the existing session
        if (session == null || session.getAttribute("enrollmentNo") == null) {
            response.sendRedirect("student_login.jsp"); // Redirect to login if session is invalid
            return;
        }

        String enrollmentNo = (String) session.getAttribute("enrollmentNo");

        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("get_progress".equals(action) && enrollmentNo != null && !enrollmentNo.trim().isEmpty()) {
            try (Connection conn = DBConnection.getConn()) {
                // Query to join results with quizzes to get titles
                String sql = "SELECT q.title AS quiz_title, r.score " +
                             "FROM results r " +
                             "JOIN quizzes q ON r.quiz_id = q.id " +
                             "WHERE r.enrollmentNo = ? " +
                             "ORDER BY q.title ASC";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, enrollmentNo);
                    ResultSet rs = ps.executeQuery();

                    PrintWriter out = response.getWriter();
                    out.println("<html><head>");
                    // Inline CSS for styling
                    out.println("<style>");
                    out.println("/* General Reset */");
                    out.println("* { margin: 0; padding: 0; box-sizing: border-box; }");
                    out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(to right, #f8f9fa, #e0f7fa); color: #333; min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; }");
                    out.println(".progress-container { background: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1); width: 100%; max-width: 900px; text-align: center; animation: fadeIn 1s ease-in-out; }");
                    out.println("h2 { font-size: 2rem; color: #00796b; margin-bottom: 20px; font-weight: bold; }");
                    out.println("table { width: 100%; border-collapse: collapse; margin: 20px 0; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); animation: fadeInUp 1s ease-in-out; }");
                    out.println("thead { background-color: #00796b; color: #ffffff; text-transform: uppercase; }");
                    out.println("th, td { padding: 12px; text-align: left; font-size: 1rem; }");
                    out.println("th { background-color: #004d40; font-weight: bold; }");
                    out.println("td { background-color: #e0f7fa; color: #00796b; border-bottom: 1px solid #00796b; }");
                    out.println("tbody tr:hover td { background-color: #c8e6c9; transition: background-color 0.3s ease-in-out; }");
                    out.println("a { display: inline-block; background-color: #00796b; color: #ffffff; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-top: 20px; font-weight: bold; transition: background-color 0.3s; }");
                    out.println("a:hover { background-color: #004d40; text-decoration: none; }");
                    out.println("p { color: #757575; font-size: 1.2rem; margin-top: 20px; }");
                    out.println("@keyframes fadeIn { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }");
                    out.println("@keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }");
                    out.println("@media (max-width: 768px) { .progress-container { padding: 20px; } h2 { font-size: 1.5rem; } table { font-size: 0.9rem; } th, td { padding: 8px; } a { padding: 8px 15px; font-size: 1rem; } }");
                    out.println("</style>");
                    out.println("</head><body>");

                    out.println("<div class='progress-container'>");
                    out.println("<h2>Progress for Enrollment Number: " + enrollmentNo + "</h2>");
                    out.println("<table>");
                    out.println("<tr><th>Quiz Title</th><th>Score</th></tr>");

                    boolean found = false;
                    while (rs.next()) {
                        found = true;
                        String quizTitle = rs.getString("quiz_title");
                        int score = rs.getInt("score");
                        out.println("<tr><td>" + quizTitle + "</td><td>" + score + "</td></tr>");
                    }

                    if (!found) {
                        out.println("<tr><td colspan='2'>No progress data found for this enrollment number.</td></tr>");
                    }

                    out.println("</table>");
                    out.println("<a href='student_home_page.jsp'>Go Back</a>");
                    out.println("</div>");
                    out.println("</body></html>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("<html><body><p>Error occurred: " + e.getMessage() + "</p></body></html>");
            }
        } else {
            response.getWriter().write("<html><body><p>Invalid request. Please provide a valid enrollment number.</p></body></html>");
        }
    }
}
