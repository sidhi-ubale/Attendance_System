package com.attendance;

import java.security.SecureRandom;
import java.sql.*;
import java.util.Random;

public class DatabaseConnection {
	static Connection con;
		public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/student_attendance?useSSL=false", "enter_username", "enter_your_pass");
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			con = getConnection();
			rs = con.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static void insertUpdateFromSqlQuery(String SqlQueryString) {
		try {
			if (con == null) {
				getConnection();
			}
			con.createStatement().executeUpdate(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static String randompasswordgeneration() {
		Random RANDOM = new SecureRandom();
		final int PASSWORD_LENGTH = 10;
		String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
		String password = "";
		for (int i = 0; i < PASSWORD_LENGTH; i++) {
			int index = (int) (RANDOM.nextDouble() * letters.length());
			password += letters.substring(index, index + 1);
		}
		return password;
	}
}
