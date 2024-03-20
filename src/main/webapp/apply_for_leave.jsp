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
<body style="background-color:#F0F0F0";>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="student_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Leave Section / Apply For Leave</div>
				<%
					String leave = (String) session.getAttribute("leave-apply");
						if (leave != null) {
							session.removeAttribute("leave-apply");
				%>
				<div class='alert alert-success' id='success'>Leave apply
					submitted.</div>
				<%
					}
				%>
				<div class="panel panel-primary shadow p-3 mb-5">
					<div class="panel-heading bg-info text-white">
						Apply For Leave&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-9">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<h4>Apply For Leave</h4>
												<hr>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<form action="StudentLeave" method="post">
													<div class="form-group row">
														<label for="message" class="col-4 col-form-label">Leave
															Reasone</label>
														<div class="col-8">
															<textarea id="message" name="message" placeholder=""
																class="form-control here" type="textarea" value=""
																rows="4" cols="30"></textarea>
														</div>
													</div>
													<div class="form-group row">
														<label for="days" class="col-4 col-form-label">No
															of Days</label>
														<div class="col-8">
															<select id="days" name="days" class="form-control here"
																value="">
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
																<option>5</option>
															</select>
														</div>
													</div>
													<div class="form-group row">
														<label for="message" class="col-4 col-form-label"></label>
														<div class="col-8">
															<input type="submit" value="Apply Leave"
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
</script>
</html>
