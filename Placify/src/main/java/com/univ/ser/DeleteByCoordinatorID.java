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
 * Servlet implementation class DeleteByCoordinatorID
 */
@WebServlet("/DeleteByCoordinatorID")
public class DeleteByCoordinatorID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteByCoordinatorID() {
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
		 String coordinatorId = request.getParameter("coordinatorId");

	        try (Connection conn = DBConnection.getConn()) {
	            // Prepare the DELETE query
	            String sql = "DELETE FROM coordinator WHERE coordinatorId = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, coordinatorId);

	            int rows = stmt.executeUpdate();
	            stmt.close();

	            if (rows > 0) {
	                request.setAttribute("message", "Coordinator with coordinator ID " + coordinatorId + " has been successfully deleted.");
	            } else {
	                request.setAttribute("message", "No coordinator found with coordinator ID " + coordinatorId + ".");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("message", "An error occurred: " + e.getMessage());
	        }

	        // Redirect to manage_year.jsp with the message
	        request.getRequestDispatcher("delete_by_coordinatorID.jsp").forward(request, response);
	   
	}

}
