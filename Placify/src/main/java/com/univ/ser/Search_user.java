package com.univ.ser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.univ.dao.StudentRegDAO;

/**
 * Servlet implementation class Search_user
 */
@WebServlet("/Search_user")
public class Search_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_user() {
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
//		 String id =request.getParameter("id");
//		 String password = request.getParameter("password");
		
		  HttpSession session = request.getSession();
	        String enrollmentNo = (String) session.getAttribute("enrollmentNo");
		//String enrollmentNo = (String)request.getParameter("enrollmentNo");

		 StudentRegDAO reg=new StudentRegDAO();
		 
//		List<Object> lt=reg.searchUser(id,password);
//		if(lt!=null) {
//			//ServletContext ctx=getServletContext();
//			request.setAttribute("list",lt);
//		RequestDispatcher rd=request.getRequestDispatcher("/studentprofile.jsp");
//			
//			rd.forward(request, response);
//		}
//		else {
//			response.sendRedirect("Search.jsp");
//		}
			
		 List<Object> lt = reg.searchUser(enrollmentNo);
		 if (lt != null) {
		     request.setAttribute("list", lt); // Set the list in the request
		     RequestDispatcher rd = request.getRequestDispatcher("/studentprofile.jsp");
		     rd.forward(request, response);
		 } else {
		     response.sendRedirect("Search.jsp"); // Redirect if user is not found
		 }
	
		}
		
	}


