<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Dependent</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/employeedetails.png" style="padding-top:500px" height="200px" width="200px">
<div class="employee">
  <form action="dependentProcess.jsp" method="post">
     <h1 align="center">NEW DEPENDENT REGISTRATION</h1>
     <h6 align="left" style="color:Red">Required fields are marked with *</h6>
     <%
     try{
         Connection c=DatabaseConnection.getConnection();
         Statement st=c.createStatement();
         ResultSet rs=st.executeQuery("select E_ID from employee_details");
         Statement s=c.createStatement();
         ResultSet r=s.executeQuery("select * from relation_master");
     %>
     <div class="scrollit">
     <table>
     <tr>
     <td>Employee ID* :</td>
	   <td><select name="eid" required>
	   <% 
	   while(rs.next())
	   {
	   String id=rs.getString("E_ID");
	   %>
	   <option value="<%=id %>"><%=id %></option>
       <%
	   }
	   %>
	   </select></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td>Relation*: </td>
     <td><select name="relation" required>
	   <% 
	   while(r.next())
	   {
	   String rel=r.getString("Relation");
	   %>
	   <option value="<%=rel %>"><%=rel %></option>
       <%
	   }
	   %>
	   </select></td>
     </tr>
     <tr>
     <td>First Name* :</td>
     <td><input type="text" name="fname" required></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td><input type="submit" value="submit"></td>
     </tr>
     </table><br><br>
     <table id="data">
     <tr>
    <th>SNo.</th>
    <th>E_ID</th>
    <th>Relation</th>
    <th>First_Name</th>
    <th>Last_Name</th>
    <th>Gender</th>
    <th>DOB</th>
    </tr>
    <%    Connection con=DatabaseConnection.getConnection();
          Statement stmt=con.createStatement();
          ResultSet result=stmt.executeQuery("select * from dependent_details");
          while(result.next()){
    %>
    <tr>
    <td><%=result.getInt(1) %></td>
    <td><%=result.getString(2) %></td>
    <td><%=result.getString(3) %></td>
    <td><%=result.getString(4) %></td>
    <td><%=result.getString(5) %></td>
    <td><%=result.getString(6) %></td>
    <td><%=result.getString(7) %></td>
    </tr>
    <%
          }
    %>
  </table>
   </div>
     <%
     }
     catch(Exception e){
    	 System.out.println("Exception "+e);
     }
     %>
     </form>
     </div>
</body>
</html>