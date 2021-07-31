<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" href="css/style3.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="employeeMenu.jsp"></jsp:include>
<img align="right" src="images/forgetpassword.png" style="padding-bottom:500px" height="300px" width="400px">
<div class="change">
  <form action="passwordChange" method="post">
     <h1 align="center">CHANGE PASSWORD</h1>
     <h6 align="left" style="color:Red">Required fields are marked with *</h6>
    <table>
   <tr>
    <td>Current Password*</td>
    <td><input type="text" size="20" name="pass" required></td>
   </tr>
   <tr></tr><tr></tr>
   <tr>
    <td>New Password*</td>
    <td><input type="password" size="20" name="npass" required></td>
   </tr>
   <tr>
    <td>Confirm Password*</td>
    <td><input type="password" size="20" name="cpass" required></td>
   </tr>
  </table>
  <div style="text-align:left">
  <input type="submit" value="Submit">
 </div>
  </form>
</div>
</body>
</html>