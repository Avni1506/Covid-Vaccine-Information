<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vaccine Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<jsp:include page="adminMenu.jsp"></jsp:include>
	<div>
	   <h1 align="center">VACCINE DETAILS</h1>
	   <table id="data" style="margin-left:auto;margin-right:auto;">
	     <tr>
	        <td>RID</td>
	        <td>E_ID</td>
	        <td>Relation</td>
	        <td>First Name</td>
	        <td>Last Name</td>
	        <td>Gender</td>
	        <td>DOB</td>
	        <td>Action</td>
	     </tr>
	     <%
	        Connection c=DatabaseConnection.getConnection();
	        Statement s=c.createStatement();
	        ResultSet r=s.executeQuery("select * from dependent_details");
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
	         <td><a href="vaccineProcess.jsp?id=<%=r.getInt(1)%>" style="background-color:Red; color:white; padding:2px;text-decoration:none;">Vaccine Details</a></td>
	     </tr>
	     <%
	        }
	     %>
	   </table>
	</div>
</body>
</html>