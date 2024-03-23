<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark navbar-fixed-top">
<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		
%>
	<!-- Brand -->
	
	<a class="navbar-brand" href="after_studentLogin.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp; Student Dashboard</a>
	<!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="student_profile.jsp">Profile</a></li>
		<li class="nav-item"><a class="nav-link" href="change_student_password.jsp">Change Password</a></li>
		<li class="nav-item"><a class="nav-link" href="check_own_attendance.jsp">Attendance Report</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Enquiry/Complaint</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="student_inquiry.jsp">Send enquiry/complaint</a>
				<a class="dropdown-item" href="complaint_issue_result.jsp">Complaint/Enquiry Response</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown">Leave Section</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="apply_for_leave.jsp">Apply For Leave</a> 
				<a class="dropdown-item" href="leave_status_report.jsp">Leave Status Report</a>
			</div>
		</li>
		<li class="nav-item"><a class="nav-link"
			href="student_feedback.jsp">Feedback</a></li>
		
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("uname")%></a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="logout.jsp">Logout</a>
			</div></li>
		<!-- Dropdown -->
	</ul>
</nav><br><br><br><%
} else {
	response.sendRedirect("student_login.jsp");
}
%>