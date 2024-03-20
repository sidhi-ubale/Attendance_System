package com.attendance;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int student_id = 0;
		int status=0;
		String sname = request.getParameter("sname");
		String cname = request.getParameter("collegeName");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		HttpSession hs=request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			int i = st.executeUpdate("insert into students(student_id,stud_name,college_name,mobile,address,email,uname,password,status) values('" + student_id + "','" + sname + "','" + cname+ "','" + mobile + "','" + address + "','" + email + "','"+uname+"','"+pass+"','"+status+"')");
			if (i > 0) {
				String message="Student register successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("student_registration.jsp");
			} else {
				String message="Student registration fail";
				hs.setAttribute("fail-message", message);
				response.sendRedirect("student_registration.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
