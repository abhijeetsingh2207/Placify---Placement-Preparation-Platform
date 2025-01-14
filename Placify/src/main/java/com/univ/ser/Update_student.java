package com.univ.ser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.dao.StudentRegDAO;
import com.univ.dto.RegistrationGetterSetter;

/**
 * Servlet implementation class Update_student
 */
@WebServlet("/Update_student")
public class Update_student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_student() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 RegistrationGetterSetter rdto = new RegistrationGetterSetter();
		    rdto.setName(request.getParameter("name"));
		    rdto.setEmail(request.getParameter("email"));
		    rdto.setEnrollmentNo(request.getParameter("enrollmentNo"));
		    rdto.setMobileNo(Integer.parseInt(request.getParameter("phoneNo")));
		    rdto.setYear(Integer.parseInt(request.getParameter("year")));
		    rdto.setPassword(request.getParameter("password"));

		    StudentRegDAO cdao = new StudentRegDAO();
		    int x = cdao.update(rdto);

		    if (x > 0) {
		        response.sendRedirect("student_login.jsp");
		    } else {
		        response.sendRedirect("studentprofile.jsp");
		    }
		
	}
}
