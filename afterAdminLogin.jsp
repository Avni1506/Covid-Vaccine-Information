<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.covid.DatabaseConnection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Covid Management System</title>
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
  <%
     Connection c=DatabaseConnection.getConnection();
     Statement s=c.createStatement();
     ResultSet r=s.executeQuery("select count(*) from employee_details");
     r.next();
     int employee=r.getInt(1);
  %>
  <div class="counter">
     <h4>Total Employees</h4>
     <h3><%= employee %></h3>
  </div>
  <%
     Statement st=c.createStatement();
     ResultSet rs=st.executeQuery("select count(*) from dependent_details");
     rs.next();
     int dependent=rs.getInt(1);
  %>
  <div class="counter">
     <h4>Total Dependents</h4>
     <h3><%= dependent %></h3>
  </div>
  <%
     Statement stmt=c.createStatement();
     ResultSet result=stmt.executeQuery("select count(*) from covid_details");
     result.next();
     int covid=result.getInt(1);
  %>
  <div class="counter">
     <h4>Total Covid Suffered</h4>
     <h3><%= covid %></h3>
  </div>
  <%
     Statement stmnt=c.createStatement();
     ResultSet resultset=stmnt.executeQuery("select count(*) from vaccine_details");
     resultset.next();
     int vaccine=resultset.getInt(1);
  %>
  <div class="counter">
     <h4>Total Vaccinated</h4>
     <h3><%= vaccine %></h3>
  </div>
</body>
</html>