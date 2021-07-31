<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.covid.DatabaseConnection" %>
    <%@page import="java.sql.*" %>
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
	<jsp:include page="employeeMenu.jsp"></jsp:include>
	<h1 style="color: black; text-align: center;">Self Details</h1>
	<table id="data" style="margin-left:auto; margin-right:auto;">
	<tr>
	<td>EID</td>
	<td>Relation</td>
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
	<td>Pincode</td>
	<td>State</td>
	</tr>
	<%
	   String id=(String)session.getAttribute("user");
	   Connection c=DatabaseConnection.getConnection();
	   Statement s=c.createStatement();
	   ResultSet r=s.executeQuery("select * from employee_details E inner join dependent_details D where (E.E_ID=D.E_ID) and D.E_ID='"+id+"'");
	   while(r.next()){
	%>
	<tr>
	<td><%=r.getString(2) %></td>
	<td><%=r.getString(18) %></td>
	<td><%=r.getString(19) %></td>
	<td><%=r.getString(20) %></td>
	<td><%=r.getString(21) %></td>
	<td><%=r.getString(22) %></td>
	<td><%=r.getString(7) %></td>
	<td><%=r.getString(8) %></td>
	<td><%=r.getString(9) %></td>
	<td><%=r.getString(10) %></td>
	<td><%=r.getString(11) %></td>
	<td><%=r.getString(12) %></td>
	<td><%=r.getString(14) %></td>
	<td><%=r.getString(13) %></td>
	</tr>
	<%
	   }
	%>
	</table>
	<br><br>
<div align="center" style="margin-top:auto;">
	<form action="employeeSelfReport" method="post">
	  <button type="submit">Generate Report</button>
	</form>
	</div>
</body>
</html>