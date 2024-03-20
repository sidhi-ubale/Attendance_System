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
<script language="javascript">
	function fncSubmit() {

		if (document.ChangePasswordForm.OldPassword.value == "") {
			alert('Please input old password');
			document.ChangePasswordForm.OldPassword.focus();
			return false;
		}

		if (document.ChangePasswordForm.newpassword.value == "") {
			alert('Please input Password');
			document.ChangePasswordForm.newpassword.focus();
			return false;
		}

		if (document.ChangePasswordForm.conpassword.value == "") {
			alert('Please input Confirm Password');
			document.ChangePasswordForm.conpassword.focus();
			return false;
		}

		if (document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value) {
			alert('Confirm Password Not Match');
			document.ChangePasswordForm.conpassword.focus();
			return false;
		}

		document.ChangePasswordForm.submit();
	}
</script>
</head>
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>

	<jsp:include page="student_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Change Student Password</div>
				<%
					String message = (String) session.getAttribute("password-change-success");
						if (message != null) {
							session.removeAttribute("password-change-success");
				%>
				<div class='alert alert-success' id='success'>Password change
					successfully.</div>
				<%
					}
				%>
				<%
					String fail = (String) session.getAttribute("password-change-fail");
						if (fail != null) {
							session.removeAttribute("password-change-fail");
				%>
				<div class="alert alert-danger" id='danger'>Old password does
					not match..</div>
				<%
					}
				%>
				<%
					String passwordConfirm = (String) session.getAttribute("password-not-match");
						if (passwordConfirm != null) {
							session.removeAttribute("password-not-match");
				%>
				<div class="alert alert-danger" id='danger'>New password and
					confirm password does not match.</div>
				<%
					}
				%>
				<div class="panel panel-primary shadow p-3 mb-5">
					<div class="panel-heading bg-info text-white">
						Change Password&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<img src="images/password-reset.jpg" class="rounded"
							alt="Cinque Terre" width="350" height="140"><br> <br>
						<div class="row">
							<div class="col-md-9">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<h4>Change Password</h4>
												<hr>
											</div>
										</div>
										<form name="ChangePasswordForm" action="StudentPasswordChange"
											method="post" OnSubmit="return fncSubmit();">
											<%
												Connection con = DatabaseConnection.getConnection();
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(
															"select password from students where uname='" + session.getAttribute("uname") + "'");
													if (rs.next()) {
											%>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group row">
														<label for="cpassword" class="col-4 col-form-label">Current
															Password </label>
														<div class="col-8">
															<input id="cpassword" name="cpassword" placeholder=""
																class="form-control here" type="password"
																value="<%=rs.getString(1)%>">
														</div>
													</div>
													<%
														}
													%>
													<div class="form-group row">
														<label for="password" class="col-4 col-form-label">Password
														</label>
														<div class="col-8">
															<input id="password" name="password" placeholder=""
																class="form-control here" type="password" value="">
														</div>
													</div>
													<div class="form-group row">
														<label for="confpass" class="col-4 col-form-label">Confirm
															Password</label>
														<div class="col-8">
															<input id="confpass" name="confpass" placeholder=""
																class="form-control here" type="password" value="">
														</div>
													</div>
													<div class="form-group row">
														<label for="message" class="col-4 col-form-label"></label>
														<div class="col-8">
															<input type="submit" value="Change Password"
																class="btn btn-primary"> <input type="reset"
																value="Reset" class="btn btn-danger">
														</div>
													</div>
										</form>
									</div>
								</div>
							</div>
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
<script type="text/javascript">
	$(function() {
		$('#success').delay(5000).show().fadeOut('slow');
	});

	$(function() {
		$('#danger').delay(5000).show().fadeOut('slow');
	});
</script>
</html>
