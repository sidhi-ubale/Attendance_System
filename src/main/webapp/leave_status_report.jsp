<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.util.Random"%>
<%@page import="java.util.UUID"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Student Attendance System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="student_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Leave Section / Leave Status
					Report</div>
				<div class="panel panel-primary shadow p-3 mb-5">
					<div class="panel-heading bg-info text-white">
						My Leave Status Report&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<div class="well col-lg-12">
							<form action="" method="post">
								<table id="table" class="table table-bordered">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>Leave Reasone</th>
											<th>No of Days</th>
											<th>Leave Status</th>
										</tr>
									</thead>
									<tbody bgcolor="white">
										<%
											ResultSet rs = DatabaseConnection.getResultFromSqlQuery(
														"select * from student_leave where name='" + session.getAttribute("StudentName") + "'");
												while (rs.next()) {
										%>
										<tr>
											<td><%=rs.getInt(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(3)%></td>
											<td><%=rs.getInt(4)%></td>
											<%
												if (rs.getString(5).equals("Approved")) {
											%>
											<td><span class="label label-success"><%=rs.getString(5)%></span></td>
											<%
												} else if (rs.getString(5).equals("Pending")) {
											%>
											<td><span class="label label-warning"><%=rs.getString(5)%></span></td>
											<%
												} else {
											%>
											<td><span class="label label-danger"><%=rs.getString(5)%></span></td>
											<%
												}
											%>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>
