<%@page import="java.sql.*" %>
<%@page import="com.covid.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Covid Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<jsp:include page="adminMenu.jsp"></jsp:include>
	<h1 style="color: black; text-align: center;">Covid Details</h1>
<table id="data" style="margin-left:auto; margin-right:auto;">
<tr>
<td>RID</td>
<td>EID</td>
<td>PID</td>
<td>Relation</td>
<td>First Name</td>
<td>Last Name</td>
<td>Gender</td>
<td>DOB</td>
<td>From Date</td>
<td>To Date</td>
</tr>
<%
   Connection c=DatabaseConnection.getConnection();
   Statement s=c.createStatement();
   ResultSet r=s.executeQuery("select * from dependent_details D join covid_details C where D.RID=C.P_ID");
   while(r.next()){
%>
<tr>
<td><%=r.getInt(8) %></td>
<td><%=r.getString(2) %></td>
<td><%=r.getInt(9) %></td>
<td><%=r.getString(3) %></td>
<td><%=r.getString(4) %></td>
<td><%=r.getString(5) %></td>
<td><%=r.getString(6) %></td>
<td><%=r.getString(7) %></td>
<td><%=r.getString(10) %></td>
<td><%=r.getString(11) %></td>
</tr>
<%
   }
%>
</table>
<br><br>
<div align="center" style="margin-top:auto;">
<form action="CovidReports" method="post">
     <button type="submit">Generate Report</button>
</form>
</div>
</body>
</html>