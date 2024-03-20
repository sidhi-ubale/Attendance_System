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

</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="student_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Attendance Report</div>
				<div class="panel panel-primary shadow p-3 mb-5">
					<div class="panel-heading bg-info text-white">
						My Attendance &nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<div class="well col-lg-12">
							<table id="table" class="table table-bordered">
								<thead>
									<tr>
										<th>Student Id</th>
										<th>Total Present Days</th>
										<th>Total Absent Days</th>
										<th>Total Days</th>
									</tr>
								</thead>
								<tbody bgcolor="white">
									<%
										Connection con = DatabaseConnection.getConnection();
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(
													"select student_id,count(case when attendance ='present' then 1 end) as Present_Count,count(case when attendance ='absent' then 1 end) as Absent_Count,count(distinct system_date) as Total_Count from student_attendance where student_id='"
															+ session.getAttribute("student_id") + "' group by student_id");
											while (rs.next()) {
												int id = rs.getInt(1);
												int present_count = rs.getInt(2);
												int absent_count = rs.getInt(3);
												int total_days = rs.getInt(4);
									%>
									<tr>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getInt(2)%></td>
										<td><%=rs.getInt(3)%></td>
										<td><%=rs.getInt(4)%></td>
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
	</div>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>
