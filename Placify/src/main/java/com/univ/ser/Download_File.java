package com.univ.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class Download_File
 */
@WebServlet("/Download_File")

public class Download_File extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download_File() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		 String fileName = request.getParameter("fileName");

	        if (fileName != null) {
	            try (Connection conn = DBConnection.getConn()) {
	                String sql = "SELECT file_name, file_data, file_type FROM teacher_uploads WHERE file_name = ?";
	                PreparedStatement stmt = conn.prepareStatement(sql);
	                stmt.setString(1, fileName);
	                ResultSet rs = stmt.executeQuery();

	                if (rs.next()) {
	                    String mimeType = rs.getString("file_type");
	                    byte[] fileData = rs.getBytes("file_data");

	                    // Set response headers
	                    response.setContentType(mimeType);
	                    response.setHeader("Content-Disposition", "attachment; filename=\"" + rs.getString("file_name") + "\"");

	                    // Write file data to the response output stream
	                    try (OutputStream out = response.getOutputStream()) {
	                        out.write(fileData);
	                    }
	                } else {
	                    response.getWriter().println("File not found!");
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	                response.getWriter().println("Error: " + e.getMessage());
	            }
	        } else {
	            response.getWriter().println("Invalid file name.");
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
