<%@page import="java.sql.*" %>
<%@page import="com.covid.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<jsp:include page="adminMenu.jsp"></jsp:include>
	<h1 style="color: black; text-align: center;">Employee Details</h1>
<table id="data" style="margin-left:auto; margin-right:auto;">
<tr>
<td>RID</td>
<td>EID</td>
<td>First Name</td>
<td>Last Name</td>
<td>Gender</td>
<td>DOB</td>
<td>e-mail</td>
<td>Phone</td>
<td>HNo</td>
<td>Street</td>
<td>City</td>
<td>District</td>
<td>State</td>
<td>Pincode</td>
</tr>
<%
   Connection c=DatabaseConnection.getConnection();
   Statement s=c.createStatement();
   ResultSet r=s.executeQuery("select * from employee_details");
   while(r.next()){
%>
<tr>
<td><%=r.getInt(1) %></td>
<td><%=r.getString(2) %></td>
<td><%=r.getString(3) %></td>
<td><%=r.getString(4) %></td>
<td><%=r.getString(5) %></td>
<td><%=r.getString(6) %></td>
<td><%=r.getString(7) %></td>
<td><%=r.getString(8) %></td>
<td><%=r.getString(9) %></td>
<td><%=r.getString(10) %></td>
<td><%=r.getString(11) %></td>
<td><%=r.getString(12) %></td>
<td><%=r.getString(13) %></td>
<td><%=r.getInt(14) %></td>
</tr>
<%
   }
%>
</table>
<br><br>
<div align="center" style="margin-top:auto;">
<form action="employeeReports" method="post">
     <button type="submit">Generate Report</button>
</form>
</div>
</body>
</html>