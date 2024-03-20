<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.*"%>
<%@ page import="java.sql.*"%>
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
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css " />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Attendance System All
					Reports</div>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase;font-size:small;font-weight: bold;">
						Attendance System All Reports &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]
					</div>
					<div class="panel-body">
						<table id="table" class="table table-bordered">
							<tbody>
								<form action="StudentAttendanceReport">
									<tr>
										<th>Attendance Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-primary"></td>
									</tr>
								</form>
								<form action="AllStudentsRegisterReport">
									<tr>
										<th>All Students Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-info"></td>
									</tr>
								</form>
								<form action="StudentsActiveOrInactive">
									<tr>
										<th>Student Active & Deactive Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-secondary"></td>
									</tr>
								</form>
								<form action="StudentsFeedbackReport">
									<tr>
										<th>Student Feedback Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-warning"></td>
									</tr>
								</form>
								<form action="StudentsLeaveApproved">
									<tr>
										<th>Approved Leave Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-danger"></td>
									</tr>
								</form>
							</tbody>
						</table>
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
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#table").DataTable();
	});
</script>
</html>
