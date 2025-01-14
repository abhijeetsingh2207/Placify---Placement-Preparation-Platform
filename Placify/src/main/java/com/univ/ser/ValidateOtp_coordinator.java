package com.univ.ser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp_coordinator
 */
@WebServlet("/ValidateOtp_coordinator")
public class ValidateOtp_coordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateOtp_coordinator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   	{
   		int value=Integer.parseInt(request.getParameter("otp"));
   		HttpSession session=request.getSession();
   		int otp=(int)session.getAttribute("otp");
   	
   		RequestDispatcher dispatcher=null;
   		
   		
   		if (value==otp) 
   		{
   			
   				request.setAttribute("email", request.getParameter("email"));
   				request.setAttribute("status", "success");
   			  dispatcher=request.getRequestDispatcher("new_password_coordinator.jsp");
   			dispatcher.forward(request, response);
   			
   		}
   		else
   		{
   			request.setAttribute("message","wrong otp");
   			
   		   dispatcher=request.getRequestDispatcher("Enter_otp_coordinator.jsp");
   			dispatcher.forward(request, response);
   		
   		}
   		
   	}
}
