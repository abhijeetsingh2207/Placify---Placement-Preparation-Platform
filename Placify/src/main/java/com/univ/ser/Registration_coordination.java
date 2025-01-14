package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.dto.RegistrationGetterSetter;
import com.univ.dao.CoordinatorRegDAO;
/**
 * Servlet implementation class Registration_coordination
 */
@WebServlet("/Registration_coordination")
public class Registration_coordination extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration_coordination() {
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
		RegistrationGetterSetter reg = new RegistrationGetterSetter();
		reg.setName(request.getParameter("name"));
		reg.setCoordinatorId(request.getParameter("coordinatorId"));
        reg.setMobileNo(Integer.parseInt(request.getParameter("phoneNo")));
        reg.setEmail(request.getParameter("email"));
        reg.setPassword(request.getParameter("password"));
        reg.setStatus("PENDING");
        CoordinatorRegDAO cdao= new CoordinatorRegDAO();
        int x = cdao.insert(reg);
        if(x>0) {
        	response.sendRedirect("registration_pending.jsp?status=PENDING");
        }
        else {
        	response.sendRedirect("placement_cor_login.jsp?status=error");
        }
	}

}
