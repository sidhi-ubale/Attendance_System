package com.attendance;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

@WebServlet("/StudentPasswordChange")
public class StudentPasswordChange extends HttpServlet {
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select password from students where password='" + cpassword+ "' and uname='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					int i = statement.executeUpdate("update students set password='" + password + "' where uname='"+ session.getAttribute("uname") + "' ");
					String message = "Password change successfully.";
					session.setAttribute("password-change-success", message);
					response.sendRedirect("change_student_password.jsp");
					statement.close();
					con.close();
				} else {
					String message = "Old password does not match.";
					session.setAttribute("password-change-fail", message);
					response.sendRedirect("change_student_password.jsp");
				}
			} else {
				String message = "New password and confirm password does not match.";
				session.setAttribute("password-not-match", message);
				response.sendRedirect("change_student_password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
