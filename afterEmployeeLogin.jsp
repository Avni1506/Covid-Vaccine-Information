<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee</title>
</head>
<body >
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
<jsp:include page="employeeMenu.jsp" ></jsp:include>
<% 
   String uid=(String)session.getAttribute("user");
   if(uid==null){
 %>
	   <jsp:forward page="employeeLogin.jsp"/>
<%
   }
   else{
	   try{
	   Connection c=DatabaseConnection.getConnection();
	   Statement s=c.createStatement();
	   ResultSet r=s.executeQuery("Select First_Name from employee_details where E_ID='"+uid+"'");
	   r.next();
	   String name=r.getString(1); 
	   out.println("Welcome "+name);
	   }
	   catch(Exception e){
		   System.out.println("Exception "+e);
	   }
   }
%>
</body>
</html>