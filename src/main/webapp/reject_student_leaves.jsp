<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection con = DatabaseConnection.getConnection();
		Statement st = con.createStatement();
		int rejectAttendance = st.executeUpdate("update student_leave set leave_status='Leave Rejected' where id='" + id + "'");
		if (rejectAttendance > 0) {
			String message = "Leave Rejected ";
			session.setAttribute("message-error", message);
			response.sendRedirect("manage_student_leaves.jsp");
		} else {
			response.sendRedirect("manage_student_leaves.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>