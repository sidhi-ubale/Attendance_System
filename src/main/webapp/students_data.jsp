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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
					<div class="alert alert-info shadow p-3 mb-5 " style="text-transform: uppercase">Students Activity / Students
						Information</div>
					<%
						String successUpdate = (String) session.getAttribute("update-success-message");
							if (successUpdate != null) {
								session.removeAttribute("update-success-message");
					%>
					<div class="alert alert-success" id='success'>Record updated
						successfully.</div>
					<%
						}
					%>
					<div class="panel panel-muted shadow p-3 mb-5">
						<div class="panel-heading bg-light" style="text-transform: uppercase">
							<strong>Students Information &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;</strong>
						</div>
						<div class="panel-body">
							<form action="" method="post">
								<table id="table"
									class="table table-striped table-hover table-bordered">
									<thead>
										<tr>
											<th>Student Id</th>
											<th>Student Name</th>
											<th>College Name</th>
											<th>Mobile</th>
											<th>Address</th>
											<th>Email</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
											String tokens = UUID.randomUUID().toString();
												ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from students");
												while (rs.next()) {
										%>
										<tr>
											<td><%=rs.getInt(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td><%=rs.getString(5)%></td>
											<td><%=rs.getString(6)%></td>
											<td><a class="btn btn-warning"
												href="students_update_data.jsp?_tokens=<%=tokens%>&student_id=<%=rs.getInt("student_id")%>"><i
													class="glyphicon glyphicon-edit"></i> Edit</a></td>
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
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table').DataTable();
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(5000).show().fadeOut('slow');
	});
</script>
</html>
