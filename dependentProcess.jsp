<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Dependent</title>
</head>
<body>
<%
   String eid=request.getParameter("eid");
   String Relation=request.getParameter("relation");
   String name=request.getParameter("fname");
   String a="";
   String b="";
   String d="";
   try{
	   Connection c=DatabaseConnection.getConnection();
	   Statement s=c.createStatement();
	   ResultSet r=s.executeQuery("select * from dependent_details where E_ID='"+eid+"' and First_Name='"+name+"' ");
	   while(r.next()){
		   a=r.getString(2);
		   d=r.getString(3);
		   b=r.getString(4);
	   }
	   if(a.equalsIgnoreCase(eid)&& d.equalsIgnoreCase(Relation)&& b.equalsIgnoreCase(name)){
	   %>
	   <jsp:include page="dependentAlreadyExists.jsp">
	   <jsp:param name="ID" value="<%=request.getParameter(\"eid\") %>"></jsp:param>
	   <jsp:param name="Rel" value="<%=request.getParameter(\"relation\") %>"></jsp:param>
	   <jsp:param name="fname" value="<%=request.getParameter(\"fname\") %>"></jsp:param>
	   </jsp:include>
	   <% 
	   }
	   else if(Relation.equalsIgnoreCase("self")){   
		   
	   %>
	   <jsp:include page="selfDependent.jsp">
	   <jsp:param name="ID" value="<%=request.getParameter(\"eid\") %>"></jsp:param>
	   <jsp:param name="Rel" value="<%=request.getParameter(\"relation\") %>"></jsp:param>
	   <jsp:param name="fname" value="<%=request.getParameter(\"fname\") %>"></jsp:param>
	   </jsp:include>
	   <%
	   }
	   else{
	   %>
	   <jsp:include page="dependent.jsp">
	   <jsp:param name="ID" value="<%=request.getParameter(\"eid\") %>"></jsp:param>
	   <jsp:param name="Rel" value="<%=request.getParameter(\"relation\") %>"></jsp:param>
	   <jsp:param name="fname" value="<%=request.getParameter(\"fname\") %>"></jsp:param>
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