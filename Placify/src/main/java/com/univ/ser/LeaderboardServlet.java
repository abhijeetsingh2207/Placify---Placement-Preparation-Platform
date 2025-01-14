package com.univ.ser;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class LeaderboardServlet
 */
@WebServlet("/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaderboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath()); 
    	// Connection connection = null;
         PreparedStatement statement = null;
         ResultSet resultSet = null;

         try {
             // Connect to the database
             Connection connection = DBConnection.getConn();

             // Fetch all quiz titles and IDs
             String getQuizzesQuery = "SELECT id, title FROM quizzes";
             statement = connection.prepareStatement(getQuizzesQuery);
             resultSet = statement.executeQuery();
             List<Map<String, String>> quizzes = new ArrayList<>();

             while (resultSet.next()) {
                 Map<String, String> quiz = new HashMap<>();
                 quiz.put("id", resultSet.getString("id"));
                 quiz.put("title", resultSet.getString("title"));
                 quizzes.add(quiz);
             }

             // Debug: Log if the quizzes list is empty
             if (quizzes.isEmpty()) {
                 System.out.println("No quizzes found in the database.");
             }

             // Set quizzes list in the request attribute
             request.setAttribute("quizzes", quizzes);

             // Fetch leaderboard data if a quiz is selected
             String quizId = request.getParameter("quizId");
             if (quizId != null && !quizId.isEmpty()) {
                 String getResultsQuery = "SELECT enrollmentNo, score FROM results WHERE quiz_id = ? ORDER BY score DESC";
                 statement = connection.prepareStatement(getResultsQuery);
                 statement.setInt(1, Integer.parseInt(quizId));
                 resultSet = statement.executeQuery();

                 List<Map<String, String>> leaderboard = new ArrayList<>();
                 while (resultSet.next()) {
                     Map<String, String> entry = new HashMap<>();
                     entry.put("enrollmentNo", resultSet.getString("enrollmentNo"));
                     entry.put("score", resultSet.getString("score"));
                     leaderboard.add(entry);
                 }
                 request.setAttribute("leaderboard", leaderboard);

                 // Optionally generate a CSV for download
                 String csvFilePath = generateCSV(leaderboard);
                 request.setAttribute("downloadLink", csvFilePath);
             }

             // Forward to JSP
             RequestDispatcher dispatcher = request.getRequestDispatcher("leaderboard_student.jsp");
             dispatcher.forward(request, response);
             connection.close();
         } catch (SQLException e) {
             e.printStackTrace();
         } finally {
             try {
            	 if (resultSet != null) resultSet.close();
                 if (statement != null) statement.close();
              
             } catch (SQLException ex) {
                 ex.printStackTrace();
             }
         }
     }

     private String generateCSV(List<Map<String, String>> leaderboard) throws IOException {
         String filePath = "leaderboard.csv";
         try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
             writer.println("Rank,Student ID,Score");
             for (int i = 0; i < leaderboard.size(); i++) {
                 Map<String, String> entry = leaderboard.get(i);
                 writer.println((i + 1) + "," + entry.get("enrollmentNo") + "," + entry.get("score"));
             }
         }
         return filePath;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
