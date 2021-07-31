<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Exists</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<%
   try{
	   Connection c=DatabaseConnection.getConnection();
	   Statement s=c.createStatement();
	   String id=request.getParameter("ID");
	   System.out.println(id);
	   ResultSet r=s.executeQuery("select * from employee_details where E_ID='"+id+"'");
	   while(r.next()){
%>
<div class="employee">
  <form action="" method="post">
     <h1 align="center">EMPLOYEE DETAILS</h1>
     <div class="scrollit">
     <table>
     <tr>
     <td>EmployeeID*: </td>
     <td><input type="text" size="15" name="empID" maxlength="10" value="<%=r.getString(2) %>" readonly></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td>First Name* : </td>
     <td><input type="text" size="30" name="fname" maxlength="20" value="<%=r.getString(3) %>" readonly></td>
     <td id="message"></td>
     <td>Last Name*: </td>
     <td><input type="text" size="30" name="lname" maxlength="20" value="<%=r.getString(4) %>" readonly></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td>Gender* : </td>
     <td><input type="text" name="gender" value="<%=r.getString(5) %>" readonly></td>
      <td>Date of Birth*: </td>
      <td><input type="date" size="12" name="dob"  value="<%=r.getString(6) %>" readonly></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>e-mail*:</td>
      <td> <input type="email" size="50"  name="mail" value="<%=r.getString(7) %>" readonly ></td>
      <td>Phone*:</td>
      <td> <input type="text" size="15" name="phone" maxlength="10" value="<%=r.getString(8) %>" readonly></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td><label>Address:</label></td></tr>
      <tr>
      <td>HNo.*: </td>
      <td><input type="text" size="10" name="hno" value="<%=r.getString(9) %>" readonly></td>
      <td>Street*: </td>
      <td><input type="text" size="20" name="street" value="<%=r.getString(10) %>" readonly></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>City*: </td>
      <td><input type="text" size="20" name="city" value="<%=r.getString(11) %>" readonly></td>
      <td>District*: </td>
      <td><input type="text" size="20" name="dist" value="<%=r.getString(12) %>" readonly></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>Pincode* :</td>
      <td> <input type="text" size="10" name="pin" value="<%=r.getInt(14) %>" readonly></td>
      <td>State* : </td>
      <td><input type="text" name="state" value="<%=r.getString(13) %>" readonly></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
     <td>Password* : </td>
     <td><input type="text" size="30" name="pass" maxlength="20" value="<%=r.getString(15) %>" readonly></td>
     </tr> 
     
      </table>
      <a href="newEmployee.jsp"><button type="button">Back</button></a>
</div>

</form>

</div>
<%
	   }
   }
catch(Exception e){
	System.out.println("Exception "+e);
}
%>
</body>
</html>