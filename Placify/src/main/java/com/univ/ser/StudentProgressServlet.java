package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.google.gson.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class StudentProgressServlet
 */
@WebServlet("/StudentProgressServlet")
public class StudentProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentProgressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html; charset=UTF-8");

	        String action = request.getParameter("action");
	        String enrollmentNo = request.getParameter("enrollmentNo");

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
	                    out.println("<html><body>");
	                    out.println("<h2>Progress for Enrollment Number: " + enrollmentNo + "</h2>");
	                    out.println("<table border='1'>");
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
	                    out.println("<a href='check_progress.jsp'>Go Back</a>");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
//		response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        String action = request.getParameter("action");
//        String studentId = request.getParameter("student_id");
//
//        if ("get_progress".equals(action) && studentId != null && !studentId.trim().isEmpty()) {
//            try (Connection conn = DBConnection.getConn()) {
//                String sql = "SELECT title AS test_name, score FROM result WHERE student_id = ? ORDER BY title ASC";
//                try (PreparedStatement ps = conn.prepareStatement(sql)) {
//                    ps.setString(1, studentId);
//                    ResultSet rs = ps.executeQuery();
//
//                    List<Map<String, Object>> progressData = new ArrayList<>();
//                    while (rs.next()) {
//                        Map<String, Object> data = new HashMap<>();
//                        data.put("test_name", rs.getString("test_name"));
//                        data.put("score", rs.getInt("score"));
//                        progressData.add(data);
//                    }
//
//                    if (progressData.isEmpty()) {
//                        response.getWriter().write(new Gson().toJson(Collections.singletonMap("error", "No progress data found for the provided student ID.")));
//                    } else {
//                        response.getWriter().write(new Gson().toJson(progressData));
//                    }
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//                response.getWriter().write(new Gson().toJson(Collections.singletonMap("error", "Database error occurred: " + e.getMessage())));
//            }
//        } else {
//            response.getWriter().write(new Gson().toJson(Collections.singletonMap("error", "Invalid request. Please provide a valid student ID.")));
//        }
	}

}
