package com.attendance;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.util.UUID;
/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("password");
		try {
			String tokens = UUID.randomUUID().toString();
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet resultset = st.executeQuery("select * from admin where uname='" + uname + "' AND password='" + pass + "'");
			if (resultset.next()) {
				hs.setAttribute("uname", uname);
				response.sendRedirect("after_adminLogin.jsp?_tokens='"+tokens+"'");
			} else {
				String message="You have enter wrong credentials";
				hs.setAttribute("credential", message);
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
