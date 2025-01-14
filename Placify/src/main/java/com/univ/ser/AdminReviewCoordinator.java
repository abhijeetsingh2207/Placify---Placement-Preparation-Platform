package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.dao.CoordinatorRegDAO;

/**
 * Servlet implementation class AdminReviewCoordinator
 */
@WebServlet("/AdminReviewCoordinator")
public class AdminReviewCoordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewCoordinator() {
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
		 String coordinatorId = request.getParameter("coordinatorId");
	        String action = request.getParameter("action");
	        CoordinatorRegDAO dao = new CoordinatorRegDAO();
	        
	        String status = "approve".equalsIgnoreCase(action) ? "APPROVED" : "REJECTED";

	        
	        boolean success = dao.updateTeacherStatus(coordinatorId, status);

	        if (success) {
	            response.getWriter().write("success");
	        } else {
	            response.getWriter().write("failure");
	        }
	}

}
