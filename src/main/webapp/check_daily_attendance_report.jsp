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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="background-color: #F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<%
		ResultSet resultset = DatabaseConnection
					.getResultFromSqlQuery("select count(*) from students where status=1");
			resultset.next();
			int count = resultset.getInt(1);
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5"
					style="text-transform: uppercase">Check Date Wise Attendance</div>
				<%
					String alreadyTaken = (String) session.getAttribute("todays-attendance-already-taken");
						if (alreadyTaken != null) {
							session.removeAttribute("todays-attendance-already-taken");
				%>
				<div class="alert alert-danger" id='danger'>Today's attendance
					already taken.</div>
				<%
					}
				%>
				<%
					String attendanceTaken = (String) session.getAttribute("attendance-taken");
						if (attendanceTaken != null) {
							session.removeAttribute("attendance-taken");
				%>
				<div class="alert alert-success" id='success'>Attendance taken
					succesfully.</div>
				<%
					}
				%>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light"
						style="text-transform: uppercase; font-size: small; font-weight: bold;">
						Check Date Wise Attendance &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;
						<a class="btn btn-success"><span class="badge"><%=count%></span>
							Active Students</a>
					</div>
					<div class="panel-body">
						<form action="check_daily_attendance_report.jsp" method="post">
							<div class="form-row">
								<div class="form-group col-md-3">
									<input type='date' class="form-control" id="sdate" name="date">
								</div>
								<div class="form-group col-md-4">
									<input type="submit" class="btn btn-primary" value="Search">
								</div>
							</div>
							<table id="table"
								class="table table-striped table-hover table-bordered">
								<thead>
									<tr>
										<th>Student Id</th>
										<th>Student Name</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>Present</th>
										<th>Absent</th>
									</tr>
								</thead>
								<tbody>
									<%
											String chooseDate = request.getParameter("date");
											if (chooseDate != null) {
												Connection con = DatabaseConnection.getConnection();
												Statement st = con.createStatement();
												ResultSet rs = st.executeQuery(
														"select * from students natural join student_attendance where status=1 and system_date='"
																+ chooseDate + "'");
												while (rs.next()) {
													int id = rs.getInt(1);
									%>
									<tr>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(6)%></td>
										<td>
											<%
												if (rs.getString(10).equals("present")) {
											%><input type="checkbox" name="<%=rs.getString(10)%>"
											value="<%=rs.getString(10)%>" checked disabled>
										</td>
										<%
											} else {
										%>
										<input type="checkbox" name="<%=rs.getString(10)%>"
											value="<%=rs.getString(10)%>" unchecked>
										<%
											}
										%>
										<td>
											<%
												if (rs.getString(10).equals("absent")) {
											%><input type="checkbox" name="<%=rs.getString(10)%>"
											value="<%=rs.getString(10)%>" checked disabled>
										</td>
									</tr>
									<%
										} else {
									%>
									<input type="checkbox" name="<%=rs.getString(10)%>"
										value="<%=rs.getString(10)%>" unchecked>
									<%
										}

												}
									%>
									<tr>
										<td colspan="4"><strong><%=chooseDate%>&nbsp;Present
												& Absent Students Attendance Details</strong></td>
										<%
											ResultSet presentResultset = DatabaseConnection.getResultFromSqlQuery(
															"select count(*) from student_attendance where attendance='present' and system_date='"
																	+ chooseDate + "'");
													presentResultset.next();
													int presentCount = presentResultset.getInt(1);
										%>
										<td><span class="label label-success"><%=presentCount%>&nbsp;Present</span></td>
										<%
											ResultSet absentResultset = DatabaseConnection.getResultFromSqlQuery(
															"select count(*) from student_attendance where attendance='absent' and system_date='"
																	+ chooseDate + "'");
													absentResultset.next();
													int absentCount = absentResultset.getInt(1);
										%>
										<td><span class="label label-danger"><%=absentCount%>&nbsp;Absent</span></td>
										<%
											}
										%>
									</tr>
								</tbody>
							</table>
						</form>
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
<script type="text/javascript">
	$(function() {
		$('#success').delay(5000).show().fadeOut('slow');
	});

	$(function() {
		$('#danger').delay(5000).show().fadeOut('slow');
	});
</script>
</html>
