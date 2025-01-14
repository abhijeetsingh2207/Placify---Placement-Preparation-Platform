package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.dao.StudentRegDAO;
import com.univ.dao.QuestionsDAO;
import com.univ.dto.QuestionsDTO;
import com.univ.dto.RegistrationDTO;

/**
 * Servlet implementation class questions
 */
@WebServlet("/Questions")
public class Questions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Questions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionsDTO ques=new QuestionsDTO();
		ques.setQue(request.getParameter("quest"));
		ques.setOpt1(request.getParameter("op1"));
		ques.setOpt2(request.getParameter("op2"));
		ques.setOpt3(request.getParameter("op3"));
		ques.setOpt4(request.getParameter("op4"));
		ques.setAns(request.getParameter("answ"));
		QuestionsDAO qdao=new QuestionsDAO();
		int x=qdao.insert(ques);
		if(x>0) {
			response.sendRedirect("create_quiz.jsp");
		}
		else {
			response.sendRedirect("quiz.jsp");
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
