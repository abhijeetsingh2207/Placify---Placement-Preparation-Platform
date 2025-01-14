package com.univ.ser;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univ.db.DBConnection;

/**
 * Servlet implementation class DownloadFileServlet
 */
@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFileServlet() {
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
		 String year = request.getParameter("year");
	        String filename = request.getParameter("filename");

	        String tableName;
	        switch (year) {
	            case "1":
	                tableName = "firstyearinformation";
	                break;
	            case "2":
	                tableName = "secondyearinformation";
	                break;
	            case "3":
	                tableName = "thirdyearinformation";
	                break;
	            case "4":
	                tableName = "fourthyearinformation";
	                break;
	            default:
	                response.getWriter().write("Invalid year");
	                return;
	        }

	        try (Connection conn = DBConnection.getConn()) {
	            String sql = "SELECT file FROM " + tableName + " WHERE filename=?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, filename);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                InputStream inputStream = rs.getBinaryStream("file");
	                response.setContentType(getServletContext().getMimeType(filename));
	                response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

	                OutputStream outputStream = response.getOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead;
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);
	                }
	                outputStream.flush();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
