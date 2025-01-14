package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class DeleteByYearStudent
 */
@WebServlet("/DeleteByYearStudent")
public class DeleteByYearStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteByYearStudent() {
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
		int year = Integer.parseInt(request.getParameter("year"));
		try{
			Connection conn = DBConnection.getConn();
			String sql = "DELETE FROM student WHERE year = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1,year);
			  int rows = stmt.executeUpdate();

	            stmt.close();
	            conn.close();

	            // Redirect to manage_student.jsp with a success message
	            if (rows > 0) {
	                request.setAttribute("message", rows + " records deleted successfully.");
	            } else {
	                request.setAttribute("message", "No records found for the given year.");
	            }
	            request.getRequestDispatcher("manage_student.jsp").forward(request, response);

	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("message", "An error occurred: " + e.getMessage());
	            request.getRequestDispatcher("manage_student.jsp").forward(request, response);
	        }
	}

}
