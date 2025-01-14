package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class AvailableQuizzesServlet
 */
@WebServlet("/AvailableQuizzesServlet")
public class AvailableQuizzesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AvailableQuizzesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 List<Quiz> quizzes = new ArrayList<>();
	        try (Connection conn = DBConnection.getConn();
	             PreparedStatement stmt = conn.prepareStatement(
	                     "SELECT * FROM quizzes WHERE start_date <= NOW() AND end_date >= NOW()"
	             )) {
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                quizzes.add(new Quiz(
	                        rs.getInt("id"),
	                        rs.getString("title"),
	                        rs.getTimestamp("start_date"),
	                        rs.getTimestamp("end_date"),
	                        rs.getInt("duration")
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        request.setAttribute("quizzes", quizzes);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("availableQuizzes.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
