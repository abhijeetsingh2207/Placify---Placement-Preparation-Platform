package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univ.dao.CoordinatorRegDAO;

@WebServlet("/Login_coordinator")
public class Login_coordinator extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login_coordinator() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String coordinatorId = request.getParameter("coordinatorId");
        String password = request.getParameter("password");

        CoordinatorRegDAO cdao = new CoordinatorRegDAO();
        String status = cdao.checkTeacherStatus(coordinatorId, password);

        if ("Approved".equalsIgnoreCase(status)) {
        	String name = cdao.getCoordinatorName(coordinatorId);
    		HttpSession session = request.getSession(true);
    		session.setAttribute("coordinatorId", coordinatorId);
    		session.setAttribute("name",name );
            response.sendRedirect("coordinatore_home_page.jsp");
        } else if ("Pending".equalsIgnoreCase(status)) {
            request.setAttribute("loginMessage", "Verification in progress. You cannot log in at this time.");
            request.getRequestDispatcher("placement_cor_login.jsp").forward(request, response);
        } else if ("Rejected".equalsIgnoreCase(status)) {
            request.setAttribute("loginMessage", "Your account was rejected. Please contact support.");
            request.getRequestDispatcher("placement_cor_login.jsp").forward(request, response);
        } else {
            request.setAttribute("loginMessage", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("placement_cor_login.jsp").forward(request, response);
        }
    }
}








//package com.univ.ser;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.univ.dao.CoordinatorRegDAO;
//import com.univ.dao.StudentRegDAO;
//
///**
// * Servlet implementation class Login_coordinator
// */
//@WebServlet("/Login_coordinator")
//public class Login_coordinator extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public Login_coordinator() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//	
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String coordinatorId=request.getParameter("coordinatorId");
//		String password=request.getParameter("password");
//		//HttpSession hs=null;
//		CoordinatorRegDAO cdao=new CoordinatorRegDAO();
////		boolean b=cdao.checkDetails(coordinatorId,password);
////		if(b) {
//////			hs=request.getSession(false);
//////			if(hs!=null) {
//////				hs.invalidate();
//////				hs=null;
//////			}
//////			hs=request.getSession(true);
//////			hs.setAttribute("unm",unm);
////			response.sendRedirect("coordinatore_home_page.jsp");
////		}
////		else {
////			response.sendRedirect("placement_cor_login.jsp");
////		}	
//		
//		String status = cdao.checkTeacherStatus(coordinatorId, password);
//
//        if ("Approved".equals(status)) {
//            // Redirect to the teacher home page if login is successful and approved
//            response.sendRedirect("coordinatore_home_page.jsp");
//        } else if ("Pending".equals(status) || "Rejected".equals(status)) {
//            // Redirect back to login with a message if the account is pending or rejected
//            request.setAttribute("loginMessage", "Verification in progress.");
//            request.getRequestDispatcher("placement_cor_login.jsp").forward(request, response);
//        } else {
//            // Redirect back to login with a message for invalid credentials
//            request.setAttribute("loginMessage", "Invalid credentials.");
//            request.getRequestDispatcher("placement_cor_login.jsp").forward(request, response);
//        }
//	}
//
//}
