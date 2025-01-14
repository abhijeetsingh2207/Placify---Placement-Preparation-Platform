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

import com.univ.dao.StudentRegDAO;
import com.univ.dao.QuestionsDAO;

/**
 * Servlet implementation class SearchQuiz
 */
@WebServlet("/SearchQuiz")
public class SearchQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id1=Integer.parseInt(request.getParameter("id"));
		 QuestionsDAO qdao=new QuestionsDAO();
		List lt=qdao.srchQues(id1);
		if(lt!=null) {
			ServletContext ctx=getServletContext();
			RequestDispatcher rd=ctx.getRequestDispatcher("/perform_quiz.jsp");
			request.setAttribute("list",lt);
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("search_quiz.jsp");
		}
			
			
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
