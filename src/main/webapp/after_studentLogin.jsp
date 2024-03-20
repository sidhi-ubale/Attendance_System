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
<body style="background-color: #F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="student_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5"
			style="height: 450px;">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5"
					style="text-transform: uppercase">Welcome To Student Portal</div>
				<div class="well col-lg-12 shadow p-3 mb-5">
					<img src="images/logo.png" /><br /> <br /> <br />
				</div>
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
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-users fa-5x"></i>

						<h3>
							<font color="#FF9933"><span class="counter"><%=id%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;">My Id</strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-users fa-5x"></i>

						<h3>
							<font color="#FF9933"><span class="counter"><%=present_count%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;">Total
								Present Days</strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-users fa-5x"></i>

						<h3>
							<font color="#FF9933"><span class="counter"><%=absent_count%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;">Total
								Absent Days</strong>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<i class="fa fa-users fa-5x"></i>

						<h3>
							<font color="#FF9933"><span class="counter"><%=total_days%></span></font>
						</h3>
						<strong style="text-transform: uppercase; font-size: 12px;">Total
								Days</strong>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
