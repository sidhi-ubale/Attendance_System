<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection con = DatabaseConnection.getConnection();
		Statement st = con.createStatement();
		int rejectAttendance = st.executeUpdate("update inquiry set message='We will check and solve or update your issue' where inquiry_id='" + id + "'");
		if (rejectAttendance > 0) {
			response.sendRedirect("students_notification.jsp");
		} else {
			response.sendRedirect("students_notification.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>