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
<link rel="stylesheet" href="css/style4.css">
</head>
<body>
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="employee">
		<form action="vaccineUpdate.jsp" method="post">
		<h1 align="center">UPDATE VACCINE INFORMATION</h1>
    <div class="scrollit">
	<table>

		<%
			try {
				Connection con = DatabaseConnection.getConnection();
				Statement s = con.createStatement();
				String id = request.getParameter("id");
				String sql = "select * from dependent_details where RID='"+id+"'";
				ResultSet r = s.executeQuery(sql);
				while (r.next()) {
		%>
		
		<tr>
			<td>EmployeeID:</td>
			<td><input type="text" value="<%=r.getString(2)%>" name="empID" readonly></td>
		</tr>
		<tr>
			<td>PID:</td>
			<td><input type="text" value="<%=id%>" name="pid" readonly></td>
		</tr>
        <tr>
			<td>First Name:</td>
			<td><input type="text" size="20" name="fname"
				value=' <%=r.getString(4)%>' readonly></td>
		</tr>

		<tr>
			<td>Last Name :</td>
			<td><input type="text" size="20" name="lname"
				value=' <%=r.getString(5)%>' readonly></td>
				<%
				}
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from vaccine_details where P_ID='"+id+"'");
				while(rs.next()){
				%>
			<td>Vaccine Name* :</td>
			<td><input type="text" size="15" name="vname"
				value=' <%=rs.getString(3)%>' required></td>
		</tr>
		<tr>
			<td>Dose1* :</td>
			<td><input type="date" size="12" name="date1"
				value=' <%=rs.getString(4)%>' max="<%=java.time.LocalDate.now()%>" required ></td>
			<td>Pincode*:</td>
			<td><input type="text" size="12" name="pin1"
				value=' <%=rs.getString(5)%>'  required></td>
		</tr>

		<tr>
			<td>Dose2*:</td>
			<td><input type="date" size="12" name="date2"
				value=' <%=rs.getString(6)%>' max="<%=java.time.LocalDate.now()%>" required></td>
			<td>Pincode*:</td>
			<td><input type="text" size="12" name="pin2"
				value=' <%=rs.getString(7)%>' required></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" value="Update It"></td>
		</tr>
		</form>
       </div>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	</div>
</body>
</html>