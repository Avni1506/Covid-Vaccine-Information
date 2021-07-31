<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.covid.DatabaseConnection" %>
    <%@ page import="java.sql.*" %>
<%
   String Relation=request.getParameter("relation");
   String relation="";
   Connection c=DatabaseConnection.getConnection();
   Statement s=c.createStatement();
   ResultSet r=s.executeQuery("select * from relation_master");
   while(r.next()){
   relation=r.getString(2);
   if(Relation.equalsIgnoreCase(relation)){
	   out.println("<html><body>");
	   out.println("<h2>Relation Already Exists</h2>");
	  
%>
<jsp:include page="addrelation.jsp"></jsp:include>
<% 
   out.println("</body></html>");
   }
   else{
%>
<jsp:include page="newRelation.jsp"></jsp:include>
<%
   }
   }
%>