package com.attendance;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.email.EmailUtility;

/**
 * Servlet implementation class ForgetAdminPassword
 */
@WebServlet("/ForgetAdminPassword")
public class ForgetAdminPassword extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	public void init() {
		 
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String uname = "";
		String password = "";
		String uname_password = "";
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select uname,password from admin where email='" + email + "'");
			while (resultset.next()) {
				uname=resultset.getString(1);
				password = resultset.getString(2); 
				uname_password="Hi "+uname+","+System.lineSeparator()+System.lineSeparator()+ "Your Admin Login Portal"+System.lineSeparator()+"User Name: "+uname + System.lineSeparator()+"Password: "+ password +System.lineSeparator()+System.lineSeparator()+"Thank you."+System.lineSeparator()+"Student Attendance Team.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String message = "Student Attendance System.";
		// String content = request.getParameter("content");
		String resultMessage = "";
		
	
		response.getWriter();
		try {
			
			EmailUtility.sendEmail(host, port, "attendancesystem33@gmail.com", "java@1992", email, message,uname_password);
			HttpSession session=request.getSession();
			resultMessage = "Your login user name & password send successfully in your email.";
			session.setAttribute("mail-success", resultMessage);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			//request.setAttribute("Message", resultMessage);
			response.sendRedirect("forgetPassword.jsp");
		}
	}

}
