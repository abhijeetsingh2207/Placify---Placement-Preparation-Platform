package com.univ.ser;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Upload_Resources
 */
@WebServlet("/Upload_Resources")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1024)
public class Upload_Resources extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload_Resources() {
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
		// doGet(request, response);
		 String subject = request.getParameter("subject");
	        int year = Integer.parseInt(request.getParameter("year"));
	        String teacherName = request.getParameter("teacher_name");
	        Part filePart = request.getPart("file");

	        if (filePart != null && subject != null && teacherName != null) {
	            String fileName = extractFileName(filePart);
	            String fileType = filePart.getContentType();

	            try (InputStream fileContent = filePart.getInputStream();
	                 Connection conn = DBConnection.getConn()) {

	                String sql = "INSERT INTO teacher_resources (subject, year, teacher_name, file_name, file_data, file_type, upload_date) VALUES (?, ?, ?, ?, ?, ?, NOW())";
	                PreparedStatement stmt = conn.prepareStatement(sql);
	                stmt.setString(1, subject);
	                stmt.setInt(2, year);
	                stmt.setString(3, teacherName);
	                stmt.setString(4, fileName);
	                stmt.setBlob(5, fileContent);
	                stmt.setString(6, fileType);

	                int rows = stmt.executeUpdate();

	                if (rows > 0) {
	                    response.sendRedirect("upload_resources.jsp?message=File uploaded successfully!");
	                } else {
	                    response.sendRedirect("upload_resources.jsp?message=Failed to upload file.");
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	                response.sendRedirect("upload_resources.jsp?message=Database error: " + e.getMessage());
	            }
	        } else {
	            response.sendRedirect("upload_resources.jsp?message=Invalid input. Please fill in all fields.");
	        }
	    }

	    private String extractFileName(Part part) {
	        for (String content : part.getHeader("content-disposition").split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf("=") + 2, content.length() - 1);
	            }
	        }
	        return "unknown";
	}

}
