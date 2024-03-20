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
 * Servlet implementation class StudentAttendance
 */
@WebServlet("/StudentAttendance")
public class StudentAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session=request.getSession();
			int attendance_insert = 0;
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			Statement alreadyTakenAttendance = con.createStatement();
			ResultSet resultSet = alreadyTakenAttendance.executeQuery("select student_id from student_attendance where system_date=CURDATE() ");
			if (resultSet.next()) {
				String message="Today's attendance already taken.";
				session.setAttribute("todays-attendance-already-taken", message);
				response.sendRedirect("attendance.jsp");
			} else {
				ResultSet rs = st.executeQuery("select * from students where status=1");
				while (rs.next()) {
					Statement statement = con.createStatement();
					attendance_insert = statement.executeUpdate("insert into student_attendance values('"+ rs.getString(1) + "','" + request.getParameter(rs.getString(1)) + "',SYSDATE())");
					statement.close();
				}
				if (attendance_insert > 0) {
					String message="Attendance taken succesfully";
					session.setAttribute("attendance-taken", message);
					response.sendRedirect("attendance.jsp");
				} else {
					response.sendRedirect("attendance.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
