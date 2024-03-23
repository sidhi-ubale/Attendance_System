package com.attendance;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class PasswordGenerationIndividually
 */
@WebServlet("/PasswordGenerationIndividually")
public class PasswordGenerationIndividually extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studId=request.getParameter("studId");
		HttpSession hs=request.getSession();
		ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from students where student_id='"+studId+"'");
		try {
			while (resultset.next()) {
				String password = DatabaseConnection.randompasswordgeneration();
				DatabaseConnection.insertUpdateFromSqlQuery("update students set password='" + password+ "' where student_id='" + studId + "' ");
				String message = "System generated password successfully.";
				hs.setAttribute("message-success", message);
			}
			response.sendRedirect("student_password_generation_individually.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
