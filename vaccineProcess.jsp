<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.covid.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%
    int pid=Integer.parseInt(request.getParameter("id"));
    Connection c=DatabaseConnection.getConnection();
    Statement s=c.createStatement();
    int a=0;
    ResultSet r=s.executeQuery("select * from vaccine_details where P_ID='"+pid+"'");
    while(r.next()){
    	a=r.getInt(2);
    }
    if(a==pid){
%>
<jsp:include page="detailsAlreadyExists.jsp">
<jsp:param value="<%=request.getParameter(\"id\") %>" name="ID"/>
</jsp:include>
<%
    }
    else{
%>
<jsp:include page="vaccine.jsp">
<jsp:param value="<%=request.getParameter(\"id\") %>" name="ID"/>
</jsp:include>
<%
   }
 %>