<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... your existing head content ... -->
</head>

<body style="background-color: #F0F0F0">
    <% 
        ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from students where status=1");
        resultset.next();
        int count = resultset.getInt(1);
        
        if (session.getAttribute("uname") != null && !"".equals(session.getAttribute("uname"))) { 
    %>
        <!-- ... your existing body content ... -->

        <div class="panel-heading bg-light"
            style="text-transform: uppercase; font-size: small; font-weight: bold;">
            &nbsp;
            <a class="btn btn-success">
                <span class="badge"><%=count%></span> Active Students
            </a>
        </div>

        <!-- ... your existing body content ... -->

    <% } else {
        response.sendRedirect("index.jsp");
    } %>
</body>

<!-- ... your existing script content ... -->

</html>
