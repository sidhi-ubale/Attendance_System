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
<body style="background-image:url(images/banner-student-home.jpg);background-size:1480px;">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<img src="images/logo.png" width="200px" height="40px" /> <a
			class="navbar-brand " href="student_login.jsp"><strong><span class="glyphicon glyphicon-user"></span>&nbsp;Student Login</strong></a> <a
			class="navbar-brand" href="index.jsp"><strong><span class="glyphicon glyphicon-user"></span>&nbsp;Admin Login</strong></a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a><a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href=""><strong><%=(new java.util.Date()).toLocaleString()%></strong></a>

		<!-- Links -->
	</nav>
	<div class="container">
		<img src="images/logo.png" " class="rounded float-right" alt="Cinque Terre"
			width="400" height="106"> 
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6  col-sm-6 col-sm-offset-7">
			<div class="panel panel-danger shadow p-3 mb-5">
				<!-- <div class="panel-heading">
					<div class="panel-title" style="text-transform: uppercase">Student Login</div>
				</div> -->
				<div style="padding-top: 30px" class="panel-body">
				<h5>Please login to your account</h5><br>
					<%
						String credential = (String) session.getAttribute("credential");
						if (credential != null) {
							session.removeAttribute("credential");
					%>
					<div class="alert alert-danger" id="danger">You have enter
						wrong credentials.</div>
					<%
						}
					%>
					<%
						String activation = (String) session.getAttribute("account-activation");
						if (activation != null) {
							session.removeAttribute("account-activation");
					%>
					<div class="alert alert-warning" id="warning">Account not activated please inform admin to activate account.</div>
					<%
						}
					%>
					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<form id="loginform" class="form-horizontal" role="form"
						action="StudentLogin" method="post">
						<label>User Name</label>
						<div style="margin-bottom: 15px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="login-username"
								type="text" class="form-control" name="uname" value=""
								placeholder="username" style="height: 30px;">
						</div>
						<label>Password</label>
						<div style="margin-bottom: 15px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
								type="password" class="form-control" name="password"
								placeholder="password" style="height: 30px;">
						</div>
						<div style="margin-top: 15px" class="form-group">
							<div class="col-sm-12 controls">
								<button type="submit" value="" class="btn btn-success">
									<span class="glyphicon glyphicon-log-in"></span> Login
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
		$('#danger').delay(3000).show().fadeOut('slow');
	});
	
	$(function() {
		$('#warning').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
