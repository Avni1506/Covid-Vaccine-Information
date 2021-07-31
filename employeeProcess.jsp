<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Employee</title>
</head>
<body>
<%
   String eid=request.getParameter("empID");
   String a="";
   try{
	   Connection c=DatabaseConnection.getConnection();
	   Statement s=c.createStatement();
	   ResultSet r=s.executeQuery("select * from employee_details where E_ID='"+eid+"'");
	   while(r.next()){
		   a=r.getString(2);
	   }
	   if(a.equalsIgnoreCase(eid)){   
	   %>
	   <jsp:include page="employeeAlreadyExists.jsp">
	   <jsp:param name="ID" value="<%=request.getParameter(\"empID\") %>"></jsp:param>
	   </jsp:include>
	   <%
	   }
	   else{
	   %>
	   <jsp:include page="employee.jsp">
	   <jsp:param name="ID" value="<%=request.getParameter(\"empID\") %>"></jsp:param>
	   </jsp:include>
<%
	   }
   }
   catch(Exception e){
	   System.out.println("Exception "+e);
   }
%>
</body>
</html>