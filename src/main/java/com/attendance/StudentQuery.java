package com.attendance;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentQuery
 */
@WebServlet("/StudentQuery")
public class StudentQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int inquiry_id = 0;
			HttpSession session=request.getSession();
			String uname=(String)session.getAttribute("uname");
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String message = request.getParameter("message");
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			int inquiry = st.executeUpdate("insert into inquiry(inquiry_id,name,mobile,email,message,uname) values('"+ inquiry_id + "','" + name + "','" + mobile + "','" + email + "','" + message + "','"+uname+"')");
			if (inquiry > 0) {
				String inquiryMessage="Inquiry or query submitted successfully";
				session.setAttribute("inquiry-message", inquiryMessage);
				response.sendRedirect("student_inquiry.jsp");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
	}

}
