<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Attendance System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="background-color:#F0F0F0";>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<img src="images/logo.png" width="200px" height="50px" /> <a
			class="navbar-brand" href="index.jsp">Student Attendance System</a> <a
			class="navbar-brand" href="student_login.jsp">Student Login</a> <a
			class="navbar-brand" href="index.jsp">Admin Login</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a><a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href=""><%=(new java.util.Date()).toLocaleString()%></a>

		<!-- Links -->
	</nav>
	<div class="container">
		<img src="images/logo.png" " class="rounded" alt="Cinque Terre"
			width="400" height="106">
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<div class="panel-title" style="text-transform: uppercase">Forget Password</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">
					<%
						String success = (String) session.getAttribute("mail-success");
						if (success != null) {
							session.removeAttribute("mail-success");
					%>
					<div class="alert alert-success" id="success">Your login user name & password send successfully in your email.</div>
					<%
						}
					%>
					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<form id="loginform" class="form-horizontal" role="form"
						action="ForgetAdminPassword" method="post">
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i> </span> <input id="login-email"
								type="email" class="form-control" name="email" value=""
								placeholder="Enter your email id" style="height: 30px;">
						</div>
						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="col-sm-12 controls">
								<button type="submit" value="" class="btn btn-success">
									<span class="glyphicon glyphicon-log-in"></span> Submit
								</button>
								<button type="reset" value="" class="btn btn-danger">Reset</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
