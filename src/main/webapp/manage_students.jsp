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
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css " />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<%
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from students where status=1");
			resultset.next();
			int count = resultset.getInt(1);
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Students Activity / Student
					Activation & Deactivation</div>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase"">
						<strong>Students Activation & Deactivation &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
						<a class="btn btn-success"><span class="badge"><%=count%></span>
							Active Students</strong></a>
					</div>
					<div class="panel-body">
						<table id="table"
							class="table table-striped table-hover table-bordered">
							<thead>
								<tr>
									<th>Student Id</th>
									<th>Student Name</th>
									<th>Mobile</th>
									<th>Email</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									Connection con = DatabaseConnection.getConnection();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from students");
										while (rs.next()) {
											int id = rs.getInt(1);
								%>
								<tr>
									<td><%=rs.getInt(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(6)%></td>
									<%
										if (rs.getInt(9) == 1) {
									%>
									<td><span class="label label-success">Active</span></td>
									<%
										} else {
									%>
									<td><span class="label label-danger">Blocked</span></td>
									<%
										}
									%>
									<%
										if (rs.getInt(9) == 1) {
									%>
									<td><a href="ManageStudents?id=<%=rs.getInt(1)%>"><button
												class="btn btn-danger"
												onClick="return confirm('Are you sure, you want to Block Account?');">Inactive</button></a></td>
									<%
										} else {
									%>
									<td><a href="ManageStudents?id=<%=rs.getInt(1)%>"><button
												class="btn btn-primary"
												onClick="return confirm('Are you sure, you want to Active Account?');">Active</button></a></td>
									<%
										}
									%>
								</tr>
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
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#table").DataTable();
	});
</script>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table').DataTable();
	})
</script>
</html>
