package com.covid;
import java.sql.*;
public class DatabaseConnection {
  static Connection c;
  public static Connection getConnection() throws Exception{
	  Class.forName("com.mysql.jdbc.Driver");
	  return DriverManager.getConnection("jdbc:mysql://localhost:3306/covid_management?user=root&password=2210");
  }
}
