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

</head>
<body style="background-color: #F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5"
					style="text-transform: uppercase">Attendance Reports / Daily
					Attendance Report</div>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light"
						style="text-transform: uppercase; font-size: small; font-weight: bold;">
						Daily Attendance Report&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<form action="check_daily_attendance.jsp" method="post">
							<div class="form-row">
								<div class="form-group col-md-3">
									<input type='date' class="form-control" id="sdate" name="sdate">
								</div>
								<div class="form-group col-md-4">
									<input type="submit" class="btn btn-primary" value="Search">
								</div>
							</div>
							<table id="table" class="table table-bordered">
								<thead>
									<tr>
										<th>Student Id</th>
										<th>Student Name</th>
										<th>Today's Present</th>
										<th>Today's Absent</th>
									</tr>
								</thead>
								<tbody>
									<%
											boolean found = false;
											String sdate = request.getParameter("sdate");
											if (sdate != null) {
												Connection con = DatabaseConnection.getConnection();
												Statement st = con.createStatement();
												ResultSet rs = st.executeQuery(
														"select student_attendance.student_id,students.stud_name,count(case when attendance ='present' then 1 end) as Present_Count,count(case when attendance ='absent' then 1 end) as Absent_Count,count(distinct system_date) as Total_Count from student_attendance,students where student_attendance.student_id=students.student_id and system_date='"
																+ sdate + "' group by student_id");
												while (rs.next()) {
													found = true;
													int id = rs.getInt(1);
													String student_name = rs.getString(2);
													int toadys_present = rs.getInt(3);
													int todays_absent = rs.getInt(4);
									%>
									<tr>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%>
										<td><label style='color: #00ff00;'><%=rs.getInt(3)%></label></td>
										<td><label style='color: #ff0000;'><%=rs.getInt(4)%></label></td>
									</tr>
									<%
										}
												if (!found) {
									%>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>No attendance found this date.</td>
										<td>&nbsp;</td>
									</tr>
									<%
										}
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
</html>
