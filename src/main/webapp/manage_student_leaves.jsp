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
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<%
					ResultSet resultset = DatabaseConnection
								.getResultFromSqlQuery("select count(*) from student_leave where leave_status='Pending'");
						resultset.next();
						int count = resultset.getInt(1);
				%>
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Leave Management / New Leave
					Request</div>
				<%
					String approvedMessage = (String) session.getAttribute("message-success");
						if (approvedMessage != null) {
							session.removeAttribute("message-success");
				%>
				<div class="alert alert-success" id="success">Approved leave
					successfully.</div>
				<%
					}
				%>
				<%
					String rejectedLeave = (String) session.getAttribute("message-error");
						if (rejectedLeave != null) {
							session.removeAttribute("message-error");
				%>
				<div class="alert alert-danger" id="danger">Leave rejected
					successfully.</div>
				<%
					}
				%>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase;font-size:small;font-weight: bold;">
						New Students Leave Request &nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
						<a class="btn btn-success"><span class="badge"><%=count%></span>
							Pendings Request</a>
					</div>
					<div class="panel-body">
						<table id="table" class="table table-bordered">
							<thead>
								<tr>
									<th>Leave Id</th>
									<th>Student Name</th>
									<th>Leave Reasons</th>
									<th>No of Days</th>
									<th>Apply Date</th>
									<th>Leave Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									ResultSet rs = DatabaseConnection
												.getResultFromSqlQuery("select * from student_leave where leave_status='Pending'");
										while (rs.next()) {
								%>
								<form action="" method="post">
									<tr>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><label style='color: #33b5e5;'><%=rs.getString(3)%></label></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(6)%></td>
										<td><span class="label label-danger"><%=rs.getString(5)%></span></td>
										<td><a href="ManageLeaves?id=<%=rs.getInt(1)%>"
											class="btn btn-primary">Approve Leave</a>&nbsp;<a
											href="reject_student_leaves.jsp?id=<%=rs.getInt(1)%>"
											class="btn btn-danger">Reject</a></td>
									</tr>
								</form>
								<%
									}
								%>
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

	$(function() {
		$('#danger').delay(5000).show().fadeOut('slow');
	});
</script>
</html>
