package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.univ.dao.StudentRegDAO;

/**
 * Servlet implementation class Login_student
 */
@WebServlet("/Login_student")
public class Login_student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_student() {
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
		String enrollmentNo=request.getParameter("enrollmentNo");
		String password=request.getParameter("password");
		
		StudentRegDAO cdao=new StudentRegDAO();

		String status = cdao.getStudentStatus(enrollmentNo, password);
		
        if ("APPROVED".equalsIgnoreCase(status)) {
        	String name = cdao.getStudentName(enrollmentNo);
        	int studentYear = cdao.getStudentYear(enrollmentNo);
    		HttpSession session = request.getSession(true);
    		session.setAttribute("enrollmentNo", enrollmentNo);
    		session.setAttribute("name",name );
    		session.setAttribute("studentYear", studentYear);
            response.sendRedirect("student_home_page.jsp");
        } else if ("PENDING".equalsIgnoreCase(status))  {
            request.setAttribute("loginMessage", "Verification in progress. You cannot log in at this time.");
            request.getRequestDispatcher("student_login.jsp").forward(request, response);
        }
        else if("REJECTED".equalsIgnoreCase(status)) {
        	request.setAttribute("loginMessage", "Your account was rejected. Please contact support");
            request.getRequestDispatcher("student_login.jsp").forward(request, response);
        }
        	else {
            request.setAttribute("loginMessage", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("student_login.jsp").forward(request, response);
        }
	}
	}


