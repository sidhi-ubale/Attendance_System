<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%
	String student_id = request.getParameter("student_id");
	String sname = request.getParameter("sname");
	String cname = request.getParameter("cname");
	String mobile = request.getParameter("mobile");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	if (student_id != null) {
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			int updateStudent = statement.executeUpdate("Update students set stud_name='" + sname+ "',college_name='" + cname + "',mobile='" + mobile + "',address='" + address + "',email='"+ email + "' where student_id=" + student_id);
			if (updateStudent > 0) {
				String message="Record updated successfully";
				session.setAttribute("update-success-message", message);
				response.sendRedirect("students_data.jsp");
			} else {
				out.print("There is a problem in updating Record.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>