package com.univ.ser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univ.dao.CoordinatorRegDAO;
import com.univ.dao.StudentRegDAO;

/**
 * Servlet implementation class Search_coordinator
 */
@WebServlet("/Search_coordinator")
public class Search_coordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_coordinator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

		  HttpSession session = request.getSession();
	      String coordinatorId = (String) session.getAttribute("coordinatorId");

		 CoordinatorRegDAO reg=new CoordinatorRegDAO();

		 List<Object> lt = reg.searchUser(coordinatorId);
		 if (lt != null) {
		     request.setAttribute("list", lt); // Set the list in the request
		     RequestDispatcher rd = request.getRequestDispatcher("/coordinator_profile.jsp");
		     rd.forward(request, response);
		 } else {
		     response.sendRedirect("Search.jsp"); // Redirect if user is not found
		 }
	
		}
	}


