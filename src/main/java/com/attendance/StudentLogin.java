package com.attendance;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet resultset = st.executeQuery("select student_id,uname,password,status,stud_name from students where uname='"+ uname + "' and password='" + pass + "'");
			if (resultset.next()) {
				if (resultset.getInt(4) == 1) {
					hs.setAttribute("uname", uname);
					hs.setAttribute("StudentName", resultset.getString(5));
					hs.setAttribute("student_id", resultset.getInt(1));
					response.sendRedirect("after_studentLogin.jsp");
				} else {
					String message="Account not activated please inform admin to activate account.";
					hs.setAttribute("account-activation", message);
					response.sendRedirect("student_login.jsp");
				}
			} else {
				String message="You have enter wrong credentials";
				hs.setAttribute("credential", message);
				response.sendRedirect("student_login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
