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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<%
		Connection con = DatabaseConnection.getConnection();
	%>

	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Students Activity / Remove
					Student Or Multiple Students</div>
				<%
					String message = (String) session.getAttribute("message-success");
						if (message != null) {
							session.removeAttribute("message-success");
				%>
				<div class="alert alert-success" id='success'>Record deleted
					successfully</div>
				<%
					}
				%>
				<%
					String messagefailure = (String) session.getAttribute("message-failure");
						if (messagefailure != null) {
							session.removeAttribute("message-failure");
				%>
				<div class="alert alert-danger" id='danger'>Unable to delete
					data because you can't fill the attendance</div>
				<%
					}
				%>
				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase"">
						<strong>Remove Multiple Students &nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;</strong>
					</div>
					<div class="panel-body">
						<form action="StudentsRemoval" method="post">
							<input type="submit" value="Delete Student / Multiple Students"
								class="btn btn-danger"> <br> <br>
							<table id="table"
								class="table table-striped table-hover table-bordered">
								<thead>
									<tr>
										<th><input type="checkbox" id="select_all">&nbsp;#</th>
										<th>Student Id</th>
										<th>Student Name</th>
										<th>College No</th>
										<th>Mobile No</th>
										<th>Email Id</th>
									</tr>
								</thead>
								<tbody>
									<%
										Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("Select * from students");
											while (rs.next()) {
									%>
									<tr>
										<td><input type="checkbox" name="record" class="checkbox"
											value="<%=rs.getInt(1)%>"></td>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(6)%></td>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#select_all').on('click', function() {
			if (this.checked) {
				$('.checkbox').each(function() {
					this.checked = true;
				});
			} else {
				$('.checkbox').each(function() {
					this.checked = false;
				});
			}
		});
		$('.checkbox').on('click', function() {
			if ($('.checkbox:checked').length == $('.checkbox').length) {
				$('#select_all').prop('checked', true);
			} else {
				$('#select_all').prop('checked', false);
			}
		});
	});
</script>
</html>
