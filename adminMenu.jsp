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
    <li><a href="afterAdminLogin.jsp">Home</a></li>
    <li><a href="#">Employee Management</a>
      <ul class="drop">
        <li><a href="newEmployee.jsp">New Employee</a></li>
        <li><a href="modifyEmployee.jsp">Edit Employee</a></li>  
      </ul>
     </li>
     <li><a href="newDependent.jsp">Dependent</a></li>
     <li><a href="covid.jsp">Covid Details</a></li>
     <li><a href="#">Vaccine</a>
     <ul class="drop">
     <li><a href="vaccineDetails.jsp">Vaccine Details</a></li>
     <li><a href="updateVaccine.jsp">Update Vaccine Details</a></li>
     </ul>
     </li>
     <li><a href="#">Reports</a>
      <ul class="drop">
       <li><a href="EmployeeDetails.jsp">Employee</a></li>
       <li><a href="CovidDetails.jsp">Covid</a></li>
       <li><a href="VaccineReports.jsp">Vaccine</a></li>
      </ul>
     </li>
     <li><a href="addrelation.jsp">Relation</a></li>
     <li><a href="logout.jsp">Logout</a></li>
  </ul>
</nav>
</body>
</html>