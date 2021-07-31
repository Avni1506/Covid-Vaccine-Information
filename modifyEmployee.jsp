<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.covid.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
	<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<jsp:include page="adminMenu.jsp"></jsp:include>
			<div>
			   <h1 align="center">MODIFY EMPLOYEE</h1>
				<table id="data" style="margin-left:auto;margin-right:auto;">
				<tr>
					<td>RID</td>
					<td>EmpId</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Gender</td>
					<td>DOB</td>
					<td>email</td>
					<td>Phone</td>
					<td>HNo</td>
					<td>Street</td>
					<td>City</td>
					<td>District</td>
					<td>State</td>
					<td>Pincode</td>
					<td>Action</td>
				</tr>
					<%
						Connection con = DatabaseConnection.getConnection();
						Statement s = con.createStatement();
						String sql = "select * from employee_details";
						ResultSet r = s.executeQuery(sql);
						while (r.next()) {
					%>
					<tr>
						<td><%=r.getInt(1)%></td>
						<td><%=r.getString(2)%></td>
						<td><%=r.getString(3)%></td>
						<td><%=r.getString(4)%></td>
						<td><%=r.getString(5)%></td>
						<td><%=r.getString(6)%></td>
						<td><%=r.getString(7)%></td>
						<td><%=r.getString(8)%></td>
						<td><%=r.getString(9)%></td>
						<td><%=r.getString(10)%></td>
						<td><%=r.getString(11)%></td>
						<td><%=r.getString(12)%></td>
						<td><%=r.getString(13)%></td>
						<td><%=r.getInt(14)%></td>
						<td><a href="modifyEmployeeProcess.jsp?id=<%=r.getString(2)%>" style="background-color:Red; color:white; padding:2px;text-decoration:none;">Update IT</a></td>
					</tr>

					<%
						}
					%>
				</table>	 
       </div>
</body>
</html>