package com.attendance;

import java.io.IOException;
import java.sql.Connection;

import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentsRemoval")
public class StudentsRemoval extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id[] = request.getParameterValues("record");
			int deleteRecord = 0;
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			for (String s : id) {
				deleteRecord = st.executeUpdate("delete students,student_attendance from students INNER JOIN student_attendance ON students.student_id=student_attendance.student_id where students.student_id='"+ s + "'");	
			}
			response.sendRedirect("remove_students.jsp");
			if (deleteRecord > 0) {
				String messageSuccess = "Record deleted successfully";
				hs.setAttribute("message-success", messageSuccess);
			} else {
				String messageError = "Unable to delete data because you can't fill the attendance";
				hs.setAttribute("message-failure", messageError);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
