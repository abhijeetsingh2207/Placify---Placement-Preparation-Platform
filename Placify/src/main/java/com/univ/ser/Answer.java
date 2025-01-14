package com.univ.ser;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univ.dao.StudentRegDAO;
import com.univ.dao.QuestionsDAO;
import com.univ.db.DBConnection;
import javax.swing.*;
/**
 * Servlet implementation class Answer
 */
@WebServlet("/Answer")
public class Answer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Answer() {
        super();
        
        // TODO Auto-generated constructor stub
    JFrame frame = new JFrame("Answer");
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
//			boolean b=qdao.getAns(Options);
//			if(b) { 
//				PrintWriter pw=response.getWriter();
//				pw.print("Correct Answer");
//	            response.sendRedirect("check_answer.jsp");	
//			}
//			else {
//				PrintWriter pw=response.getWriter();
//				pw.print("Incorrect Answer");
//	            response.sendRedirect("perform_quiz.jsp");	
//			/* } */
		
		    String Option=request.getParameter("Options");
			QuestionsDAO qdao=new QuestionsDAO();
			boolean b=qdao.getAns(Option);
			if(b) {
				
				response.sendRedirect("check_answer.jsp");
			}
			else {
				response.sendRedirect("perform_quiz.jsp");
			}
	}
	
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
		
	



