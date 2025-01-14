package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.univ.dao.StudentRegDAO;

@WebServlet("/AdminReviewServlet")
public class AdminReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminReviewServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String enrollmentNo = request.getParameter("enrollmentNo");
        
        StudentRegDAO dao = new StudentRegDAO();
 
        String status = "approve".equalsIgnoreCase(action) ? "APPROVED" : "REJECTED";
        boolean success = dao.updateStatus(enrollmentNo, status);

        if (success) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failure");
        }
  
    }
}