package com.univ.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.univ.db.DBConnection;
/**
 * Servlet implementation class StudentInformation
 */
@WebServlet("/StudentInformation")
public class StudentInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
        Integer studentYear = (Integer) session.getAttribute("studentYear");

        if (studentYear == null) {
            response.sendRedirect("Login_student.jsp");
            return;
        }

        String tableName;
        switch (studentYear) {
            case 1:
                tableName = "firstyearinformation";
                break;
            case 2:
                tableName = "secondyearinformation";
                break;
            case 3:
                tableName = "thirdyearinformation";
                break;
            case 4:
                tableName = "fourthyearinformation";
                break;
            default:
                response.getWriter().write("Year information is invalid.");
                return;
        }

        ArrayList<String> messages = new ArrayList<>();
        try (Connection conn = DBConnection.getConn()) {
            String sql = "SELECT message FROM " + tableName;
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                messages.add(rs.getString("message"));
            }
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("student_information.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while retrieving the information.");
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
