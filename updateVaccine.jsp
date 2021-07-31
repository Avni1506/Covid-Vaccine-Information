<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.covid.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vaccine</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<jsp:include page="adminMenu.jsp"></jsp:include>
			<div>
			   <h1 align="center">UPDATE VACCINE DETAILS</h1>
				<table id="data" style="margin-left:auto;margin-right:auto;">
				<tr>
					<td>RID</td>
					<td>PId</td>
					<td>Vaccine Name</td>
					<td>Dose1 Date</td>
					<td>Dose1 Place Code</td>
					<td>Dose2 Date</td>
					<td>Dose2 Place Code</td>
					<td>Action</td>
				</tr>
					<%
						Connection con = DatabaseConnection.getConnection();
						Statement s = con.createStatement();
						String sql = "select * from vaccine_details";
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
						<td><a href="updateVaccineProcess.jsp?id=<%=r.getString(2)%>" style="background-color:Red; color:white; padding:2px;text-decoration:none;">Update IT</a></td>
					</tr>

					<%
						}
					%>
				</table>	 
       </div>
</body>
</html>