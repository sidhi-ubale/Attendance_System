<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark navbar-fixed-top">
<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		
%>
 <a
		class="navbar-brand" href="after_adminLogin.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp; Staff Dashboard</a>
	<!-- Links -->
	<ul class="navbar-nav justify-content-between">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown">&nbsp; Student Details</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="student_registration.jsp">Registration</a>
				<a class="dropdown-item" href="students_data.jsp">Modify Details</a>
				<a class="dropdown-item" href="manage_students.jsp">Activate/ Deactivate Account</a>
				<a class="dropdown-item" href="remove_students.jsp">Manage Students</a> 
				<a class="dropdown-item" href="students_notification.jsp">Notifications</a>
				<a class="dropdown-item" href="student_feedback_informations.jsp">Feedbacks</a>
				<a class="dropdown-item" href="students_password_change_dynamically.jsp">Password Generation</a> 
				<a class="dropdown-item" href="student_password_generation_individually.jsp">Password Generation Individually</a>
				<a class="dropdown-item" href="send_user_name_and_password_to_student_in_mail.jsp">Send User Name and Password to Students</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown">&nbsp; Attendance </a>
				<div class="dropdown-menu">
				<a class="dropdown-item" href="attendance.jsp">Mark Attendance</a>
				<a class="dropdown-item" href="check_todays_attendance.jsp">View Today's Attendance Report</a>
				<a class="dropdown-item" href="check_daily_attendance_report.jsp">Date Wise Attendance Report</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown">&nbsp;Reports</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="attendance_report.jsp">Attendance Report</a> 
				<a class="dropdown-item" href="check_daily_attendance.jsp">Daily Report</a>
			    
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown">&nbsp;Leave Management</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="manage_student_leaves.jsp">New Leave Request</a>
				<a class="dropdown-item" href="approved_student_leave_request.jsp">Approved Request</a>
				<a class="dropdown-item" href="rejected_student_leave_request.jsp">Rejected Request</a>
			</div>
		</li>
		
		<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="glyphicon glyphicon-user"></span>&nbsp;<%=session.getAttribute("uname")%>
    </a>
    <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="adminProfile.jsp">
            <span class="glyphicon glyphicon-user"></span> My Profile
        </a>
        <a class="dropdown-item" href="admin_change_password.jsp">
            <span class="glyphicon glyphicon-edit"></span> Change Password
        </a>
        <a class="dropdown-item" href="logout.jsp">
            <span class="glyphicon glyphicon-log-out"></span> Logout
        </a>
    </div>
</li>
		
		
	</ul>
</nav><br><br><br>
<%
} else {
	response.sendRedirect("index.jsp");
}
%>