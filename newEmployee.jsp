<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Employee</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/employeedetails.png" style="padding-top:500px" height="200px" width="200px">
<div class="employee">
  <form action="employeeProcess.jsp" method="post">
     <h1 align="center">NEW EMPLOYEE REGISTRATION</h1>
     <h6 align="left" style="color:Red">Required fields are marked with *</h6>
     <table>
     <tr>
     <td>EmployeeID*: </td>
     <td><input type="text" size="15" name="empID" maxlength="10" required></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td><input type="submit" value="submit"></td>
     </tr>
     </table>
     
     </form>
     </div>
</body>
</html>