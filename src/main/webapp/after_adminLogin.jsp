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
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
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
<link rel="author" href="https://plus.google.com/113101541449927918834" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
	jQuery(document).ready(function($) {
		$('.counter').counterUp({
			delay : 10,
			time : 2000
		});
	});
</script>
</head>
<body style="background-color: #F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div style="text-transform: uppercase">
					<strong>Admin Management</strong><br>
				</div>
				<br>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-users fa-5x"></i>
						<%
							Connection con = DatabaseConnection.getConnection();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select count(*) from students");
								rs.next();
								int students = rs.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=students%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="students_data.jsp" class="text-dark" target="_blank">Registered
								Students</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-user fa-5x"></i>
						<%
							Statement statement = con.createStatement();
								ResultSet resultSet = statement.executeQuery(
										"select count(attendance) from student_attendance where attendance='present' and system_date=CURDATE()");
								resultSet.next();
								int presentStudents = resultSet.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=presentStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="check_todays_attendance.jsp" class="text-dark"
							target="_blank">Today's Present Students</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-recycle fa-5x"></i>
						<%
							Statement stmt = con.createStatement();
								ResultSet result = stmt.executeQuery(
										"select count(attendance) from student_attendance where attendance='absent' and system_date=CURDATE()");
								result.next();
								int absentStudents = result.getInt(1);
						%>

						<h3>
							<font color="#FF9933"><span class="counter"><%=absentStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="check_todays_attendance.jsp" class="text-dark"
							target="_blank">Today's Absent Students</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-bars fa-5x"></i>
						<%
							Statement stmtfeedback = con.createStatement();
								ResultSet resultFeedback = stmtfeedback.executeQuery("select count(*) from student_feedback");
								resultFeedback.next();
								int feedbackStudents = resultFeedback.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=feedbackStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="student_feedback_informations.jsp" class="text-dark"
							target="_blank">Students Feedback</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-bars fa-5x"></i>
						<%
							Statement stmtactive = con.createStatement();
								ResultSet resultActive = stmtactive.executeQuery("select count(*) from students where status=1");
								resultActive.next();
								int activeStudents = resultActive.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=activeStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="manage_students.jsp" class="text-dark" target="_blank">Active
								Students</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-bars fa-5x"></i>
						<%
							Statement stmtInactive = con.createStatement();
								ResultSet resultInactive = stmtInactive.executeQuery("select count(*) from students where status=0");
								resultInactive.next();
								int inactiveStudents = resultInactive.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=inactiveStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="manage_students.jsp" class="text-dark" target="_blank">Inactive
								Students</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-bars fa-5x"></i>
						<%
							Statement stmtApprovedLeaves = con.createStatement();
								ResultSet resultApprovedLeaves = stmtApprovedLeaves
										.executeQuery("select count(*) from student_leave where leave_status='Approved' ");
								resultApprovedLeaves.next();
								int approvedLeaveStudents = resultApprovedLeaves.getInt(1);
						%>
						<h3>
							<font color="#FF9933"><span class="counter"><%=approvedLeaveStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="approved_student_leave_request.jsp" class="text-dark"
							target="_blank">Approved Leave Request</a></strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-recycle fa-5x"></i>
						<%
							Statement stmtPendingLeaves = con.createStatement();
								ResultSet resultPendingLeaves = stmtPendingLeaves
										.executeQuery("select count(*) from student_leave where leave_status='Pending'");
								resultPendingLeaves.next();
								int pedingLeaveStudents = resultPendingLeaves.getInt(1);
						%>

						<h3>
							<font color="#FF9933"><span class="counter"><%=pedingLeaveStudents%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="manage_student_leaves.jsp" class="text-dark"
							target="_blank">Leave Request Pending</a></strong>
					</div>
				</div>
				<div style="text-transform: uppercase">
					<strong>Attendance System All Reports &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]
					</strong>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<table id="table" class="table table-bordered shadow p-3 mb-5">
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
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<table id="table" class="table table-bordered shadow p-3 mb-5">
							<tbody>
								<form action="StudentsFeedbackReport">
									<tr>
										<th>Student Feedback Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-warning"></td>
									</tr>
								</form>
								<form action="StudentsLeavePending">
									<tr>
										<th>Pending Leave Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-danger"></td>
									</tr>
								</form>
								<form action="StudentsLeaveApproved">
									<tr>
										<th>Approved Leave Report</th>
										<td><input type="submit" value="Generate Reports"
											class="btn btn-success"></td>
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
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
</body>
</html>
