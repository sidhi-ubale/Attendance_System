package com.attendance;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
/**
 * Servlet implementation class ManageLeaves
 */
@WebServlet("/ManageLeaves")
public class ManageLeaves extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		try{
			HttpSession hs=request.getSession();
			Connection connection=DatabaseConnection.getConnection();
			Statement statement=connection.createStatement();
			int manageLeave=statement.executeUpdate("update student_leave set leave_status='Approved' where id='"+id+"'");
			if(manageLeave>0){
				String message = "Approved leave successfully";
				hs.setAttribute("message-success", message);
				response.sendRedirect("manage_student_leaves.jsp");
			}else{
				response.sendRedirect("manage_student_leaves.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
