<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dependent Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/dependentdetails.png" style="padding-top:50px" height="500px" width="400px">
<div class="dependent">
<form action="dependentDetails" method="post">
<table>
<tr>
<td>Employee ID :</td>
<td><input type="text" value="${param.ID }" readonly></td>></tr>
<tr>
<td>Relation :</td>
<td><input type="text"  value="${param.Rel }" readonly></td></tr>
<tr>
<td><a href="newDependent.jsp"><button type="button">Back</button></a></td></tr>
</table>

  <h1 align="center">DEPENDENT DETAILS</h1>
  <h6 align="left" style="color:Red">Required fields are marked with *</h6>
  <%
    try{
	   Connection con = DatabaseConnection.getConnection();
	   Statement s= con.createStatement();
	   String id=request.getParameter("ID");
	   String Relation=request.getParameter("Rel");
	   ResultSet r=s.executeQuery("select * from employee_details where E_ID='"+id+"'");
	   while(r.next()){
	   %>
	   <div class="scrollit">
	   <table>
	   <tr>
	   <td>Employee ID :</td>
	   <td><input type="text" name="eid" value="${param.ID }" readonly></td>
	   </tr>
	   <tr></tr><tr></tr>
	   <tr>
	   	<td>   Relation* :</td>
	   <td><input type="text" name="relation" value="${param.Rel }" readonly></td>
	   </tr>
	   <tr></tr><tr></tr>
  <tr>
  <td>First Name* : </td>
  <td><input type="text" size="30" name="fname" max="20" value="<%=r.getString(3)%>"readonly></td>
  </tr>
  <tr></tr><tr></tr>
  <tr>
  <td>Last Name : </td>
  <td><input type="text" size="30" name="lname" max="20" value="<%=r.getString(4)%>"readonly></td>
  </tr>
  <tr></tr><tr></tr>
  <tr>
  <td>Gender : </td>
  <td><input type="text" name="gender" value="<%=r.getString(5)%>"readonly></td>
          </tr>
          <tr></tr><tr></tr>
          <tr>
      <td> Date of Birth : </td>
      <td><input type="date" size="12" name="dob" max="<%=java.time.LocalDate.now()%>" value="<%=r.getString(6)%>"readonly></td>
      </tr>
   </table>
   <br><br>
   <div style="text-align:center">
       <input type="submit" value="submit">
      </div><br><br>
      <%} %>
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
    <%
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
      }
      catch(Exception e){
    	  System.out.println("Exception "+e);
      }
    %>
  </table>
   </div>
</form>
</div>
</body>
</html>