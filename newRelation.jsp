<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.covid.DatabaseConnection" %>
    <%@ page import="java.sql.*" %>
    <% 
      String rel=request.getParameter("relation");
		try{
			Connection c=DatabaseConnection.getConnection();
            Statement s=c.createStatement();
            int i=s.executeUpdate("insert into relation_master(Relation) values ('"+rel+"')");
            if(i>0)
        %>
        <jsp:include page="afterAdminLogin.jsp"></jsp:include>
        <%
		}
		catch(Exception e){
			System.out.println("Exception "+e);
		}
		%>