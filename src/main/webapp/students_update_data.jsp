<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
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
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Students Activity / Students
					Data</div>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase""><strong>Student Information For Update</strong></div>
					<div class="panel-body">
						<%
							String student_id = request.getParameter("student_id");
								Connection con = DatabaseConnection.getConnection();
								Statement statement = con.createStatement();
								String sql = "select * from students where student_id=" + student_id;
								ResultSet resultSet = statement.executeQuery(sql);
								while (resultSet.next()) {
						%>
						<form action="students_update_process.jsp" method="post">
							<div class="form-group">
								<label for="student_id">Student Id:</label> <input type="text"
									class="form-control" id="student_id" name="student_id"
									value="<%=resultSet.getInt(1)%>" readonly>
							</div>
							<div class="form-group">
								<label for="sname">Student Name:</label> <input type="text"
									class="form-control" id="sname" name="sname"
									value="<%=resultSet.getString(2)%>">
							</div>
							<div class="form-group">
								<label for="cname">College Name:</label> <input type="text"
									class="form-control" id="cname" name="cname"
									value="<%=resultSet.getString(3)%>">
							</div>
							<div class="form-group">
								<label for="mobile">Mobile:</label> <input type="text"
									class="form-control" id="mobile" name="mobile"
									value="<%=resultSet.getString(4)%>">
							</div>
							<div class="form-group">
								<label for="address">Address:</label> <input type="text"
									class="form-control" id="address" name="address"
									value="<%=resultSet.getString(5)%>">
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									class="form-control" id="email" name="email"
									value="<%=resultSet.getString(6)%>">
							</div>
							<input type="submit" class="btn btn-primary"
								value="Update Information">
						</form>
						<%
							}
						%>
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
