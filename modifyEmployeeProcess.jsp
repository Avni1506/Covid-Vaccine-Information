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
<link rel="stylesheet" href="css/style4.css">
</head>
<body>
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="employee">
		<form action="modifyEmployeeUpdate.jsp" method="post">
		<h1 align="center">MODIFY EMPLOYEE</h1>
    <div class="scrollit">
	<table>

		<%
			try {
				Connection con = DatabaseConnection.getConnection();
				Statement s = con.createStatement();
				String id = request.getParameter("id");
				String sql = "select * from employee_details where E_ID='" + id + "'";
				ResultSet r = s.executeQuery(sql);
				while (r.next()) {
		%>
		
		<tr>
			<td>EmployeeID*:</td>
			<td><input type="text" value="<%=r.getString(2)%>" name="empID" readonly></td>
		</tr>
        <tr>
			<td>First Name*:</td>
			<td><input type="text" value="<%=r.getString(3)%>" name="fname" required></td>
		</tr>
		<tr>
			<td>Last Name*:</td>
			<td><input type="text" value="<%=r.getString(4)%>" name="lname" required></td>
		</tr>
		<tr>
			<td>Gender* :</td>
			<td><select name="gender" required
				value=' <%=r.getString("Gender")%>'>
					<option disabeled selected hidden>-Select-</option>
					<option>Male</option>
					<option>Female</option>
					<option>Other</option>
			</select></td>
			<td>Date of Birth* :</td>
			<td><input type="date" size="12" name="dob"
				value=' <%=r.getString("DOB")%>' required max="<%=java.time.LocalDate.now()%>"></td>
		</tr>

		<tr>
			<td>e-mail* :</td>
			<td><input type="text" size="50" name="email"
				value=' <%=r.getString("email")%>' pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required></td>
			<td>Phone* :</td>
			<td><input type="text" size="15" name="phone"
				value=' <%=r.getString("Phone")%>' required></td>
		</tr>

		<tr>
			<td><label>Address:</label></td>
		</tr>
		<tr>
			<td>HNo.* :</td>
			<td><input type="text" size="10" name="hno"
				value=' <%=r.getString("Hno")%>' required></td>
			<td>Street* :</td>
			<td><input type="text" size="20" name="street"
				value=' <%=r.getString("Street")%>' required></td>
		</tr>

		<tr>
			<td>City* :</td>
			<td><input type="text" size="20" name="city"
				value=' <%=r.getString("City")%>' required></td>
			<td>District* :</td>
			<td><input type="text" size="20" name="dist"
				value=' <%=r.getString("District")%>' required></td>
		</tr>

		<tr>
			<td>Pincode* :</td>
			<td><input type="text" size="10" name="pin"
				value='<%=r.getInt("Pincode")%>' required></td>
			<td>State* :</td>
			<td><select name="state" value=' <%=r.getString("State")%>'
				required>
					<option disabeled selected hidden>-Select-</option>
					<option>Andhra Pradesh</option>
					<option>Arunachal Pradesh</option>
					<option>Assam</option>
					<option>Bihar</option>
					<option>Chhattisgarh</option>
					<option>Goa</option>
					<option>Gujarat</option>
					<option>Haryana</option>
					<option>Himachal Pradesh</option>
					<option>Jammu & Kashmir</option>
					<option>Jharkhand</option>
					<option>Karnataka</option>
					<option>Kerala</option>
					<option>Madhya Pradesh</option>
					<option>Maharashtra</option>
					<option>Manipur</option>
					<option>Meghalaya</option>
					<option>Mizoram</option>
					<option>Nagaland</option>
					<option>Odisha</option>
					<option>Punjab</option>
					<option>Rajasthan</option>
					<option>Sikkim</option>
					<option>Tamil Nadu</option>
					<option>Telangana</option>
					<option>Tripura</option>
					<option>Uttar Pradesh</option>
					<option>Uttarakhand</option>
					<option>West Bengal</option>
			</select></td>
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