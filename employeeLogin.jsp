<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Login</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<img align="left" src="images/employeelogin.png" height="400px" width="400px">
<div class="login">
<form action="employeeLoginProcess.jsp" method="post">
  <table>
   <tr>
    <td>EmployeeID </td>
    <td><input type="text" size="20" name="empID"></td>
   </tr>
   <tr></tr><tr></tr>
   
   <tr></tr><tr></tr>
   <tr>
    <td>Password</td>
    <td><input type="password" size="20" name="pass"></td>
   </tr>
  </table>
  <input type="submit" value="Login">
</form>
</div>
</body>
</html>