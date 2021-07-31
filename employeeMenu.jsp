<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style2.css">
</head>
<body>
<nav class="menu">
<font color="white"><%=(new java.util.Date()).toLocaleString()%></font>
  <ul>
     <li><a href="afterEmployeeLogin.jsp">Home</a></li>
     <li><a href="#">Reports</a>
      <ul class="drop">
       <li><a href="employeeSelfReport.jsp">Employee</a></li>
       <li><a href="employeeCovidReport.jsp">Covid</a></li>
       <li><a href="employeeVaccineReport.jsp">Vaccine</a></li>
      </ul>
     </li>
     <li><a href="changePassword.jsp">Change Password</a></li>
     <li><a href="employeeProfile.jsp">Profile</a></li>
     <li><a href="logout.jsp">Logout</a></li>
  </ul>
</nav>
</body>
</html>