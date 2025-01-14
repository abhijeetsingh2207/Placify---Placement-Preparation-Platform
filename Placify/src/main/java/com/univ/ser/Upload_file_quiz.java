package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Upload_file_quiz
 */
@WebServlet("/Upload_file_quiz")
public class Upload_file_quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload_file_quiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 String quizId = request.getParameter("quizId");
	        Part filePart = request.getPart("quizFile");

	        // Validate the input
	        if (quizId == null || quizId.isEmpty() || filePart == null || filePart.getSize() == 0) {
	            response.getWriter().write("Quiz ID and file are required.");
	            return;
	        }

	        try (Connection conn = DBConnection.getConn()) {
	            // SQL query to insert the file into the database
	            String sql = "INSERT INTO quizzes (quiz_id, quiz_file, file_name, file_type) VALUES (?, ?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);

	            // Set parameters
	            stmt.setString(1, quizId);
	            stmt.setBinaryStream(2, filePart.getInputStream(), filePart.getSize());
	            stmt.setString(3, filePart.getSubmittedFileName());
	            stmt.setString(4, filePart.getContentType());

	            // Execute update
	            int rowsInserted = stmt.executeUpdate();
	            if (rowsInserted > 0) {
	                response.getWriter().write("Quiz uploaded successfully.");
	            } else {
	                response.getWriter().write("Failed to upload quiz.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().write("Database error: " + e.getMessage());
	        }
	}

}
