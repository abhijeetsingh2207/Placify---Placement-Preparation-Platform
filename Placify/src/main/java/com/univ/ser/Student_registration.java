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
 * Servlet implementation class Registration_student
 */
@WebServlet("/Student_registration")
public class Student_registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public   Student_registration() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RegistrationGetterSetter reg = new RegistrationGetterSetter();
        reg.setName(request.getParameter("name"));
        reg.setEmail(request.getParameter("email"));
        reg.setEnrollmentNo(request.getParameter("enrollmentNo"));
        reg.setMobileNo(Integer.parseInt(request.getParameter("phoneNo")));
        reg.setYear(Integer.parseInt(request.getParameter("year")));
        reg.setPassword(request.getParameter("password"));
        // Set status to 'PENDING' as default
        reg.setStatus("PENDING");
        
        StudentRegDAO dao = new StudentRegDAO();
        int result = dao.insertdata(reg);
        
        if (result > 0) {
            response.sendRedirect("registration_pending.jsp?status=PENDING");
        } else {
            response.sendRedirect("student_login.jsp?status=error");
        }
    }
}
