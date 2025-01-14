package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.dao.CoordinatorRegDAO;
import com.univ.dao.StudentRegDAO;
import com.univ.dto.RegistrationGetterSetter;

/**
 * Servlet implementation class Update_coordinator
 */
@WebServlet("/Update_coordinator")
public class Update_coordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_coordinator() {
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
		 RegistrationGetterSetter rdto = new RegistrationGetterSetter();
		    rdto.setName(request.getParameter("name"));
		    rdto.setCoordinatorId(request.getParameter("coordinatorId"));
		    rdto.setMobileNo(Integer.parseInt(request.getParameter("phoneNo")));
		    rdto.setEmail(request.getParameter("email"));
		    rdto.setPassword(request.getParameter("password"));

		    CoordinatorRegDAO cdao = new CoordinatorRegDAO();
		    int x = cdao.update(rdto);

		    if (x > 0) {
		        response.sendRedirect("placement_cor_login.jsp");
		    } else {
		        response.sendRedirect("coordinator_profile.jsp");
		    }
		
	}

}
