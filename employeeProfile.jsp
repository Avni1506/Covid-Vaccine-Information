<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Profile</title>
<link rel="stylesheet" href="css/style6.css">
</head>
<body >
<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
<jsp:include page="employeeMenu.jsp"></jsp:include>
<%if(session.getAttribute("user")!=null){
	 %>
     <table id="profile">
     <caption style="font-weight:bold;">Your Profile</caption>
     <% 
       try{
    	   Connection c=DatabaseConnection.getConnection();
    	   Statement s=c.createStatement();
    	   ResultSet r=s.executeQuery("select * from employee_details where E_ID='"+session.getAttribute("user")+"'");
    	   while(r.next()){
     %>
     <tr>
        <th>R_ID</th>
        <td><%=r.getInt(1) %></td>
     </tr>
     <tr>
        <th>E_ID</th>
        <td><%=r.getString(2) %></td>
     </tr>
     <tr>
        <th>First_Name</th>
        <td><%=r.getString(3) %></td>
     </tr>
     <tr>
        <th>Last_Name</th>
        <td><%=r.getString(4) %></td>
     </tr>
     <tr>
        <th>Gender</th>
        <td><%=r.getString(5) %></td>
     </tr>
     <tr>
        <th>DOB</th>
        <td><%=r.getString(6) %></td>
     </tr>
     <tr>
        <th>Email</th>
        <td><%=r.getString(7) %></td>
     </tr>
     <tr>
        <th>Phone</th>
        <td><%=r.getString(8) %></td>
     </tr>
     <tr>
        <th>HNo</th>
        <td><%=r.getString(9) %></td>
     </tr>
     <tr>
        <th>Street</th>
        <td><%=r.getString(10) %></td>
     </tr>
     <tr>
        <th>City</th>
        <td><%=r.getString(11) %></td>
     </tr>
     <tr>
        <th>District</th>
        <td><%=r.getString(12) %></td>
     </tr>
     <tr>
        <th>State</th>
        <td><%=r.getString(13) %></td>
     </tr>
     <tr>
        <th>Pincode</th>
        <td><%=r.getInt(14) %></td>
     </tr>
     <tr>
        <th>Password</th>
        <td><%=r.getString(15) %></td>
     </tr>
     </table>
     <%} %>
     <table id="profile">
     <caption style="font-weight:bold;">Dependents</caption>
     <tr>
     <th>RID</th>
     <th>Relation</th>
     <th>First Name</th>
     <th>Last Name</th>
     <th>Gender</th>
     <th>DOB</th>
     </tr>
     <%
       Statement st=c.createStatement();
       ResultSet rs=st.executeQuery("select * from dependent_details where E_ID='"+session.getAttribute("user")+"'order by RID");
       while(rs.next()){
     %>
     <tr>
     <td><%=rs.getInt(1) %></td>
     <td><%=rs.getString(3) %></td>
     <td><%=rs.getString(4) %></td>
     <td><%=rs.getString(5) %></td>
     <td><%=rs.getString(6) %></td>
     <td><%=rs.getString(7) %></td>
     </tr>
     
     <%
    	   }
       %>
       </table>
       <%
       }
       catch(Exception e){
    	   System.out.println("Exception "+e);
       }
}
     %>
     
</body>
</html>