package com.attendance;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class PasswordGeneration
 */
@WebServlet("/PasswordGeneration")
public class PasswordGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from students");
		try {
			HttpSession hs=request.getSession();
			while (resultset.next()) {
				String password = DatabaseConnection.randompasswordgeneration();
				DatabaseConnection.insertUpdateFromSqlQuery("update students set password='" + password+ "' where student_id='" + resultset.getInt(1) + "' ");
				String message = "System generated all students password successfully.";
				hs.setAttribute("message-success", message);
			}
			response.sendRedirect("students_password_change_dynamically.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
