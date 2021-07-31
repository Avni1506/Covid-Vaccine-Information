<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Covid Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/coviddetails.png" style="padding-top:50px" height="400px" width="400px">
<div class="covid">
<form action="covidDetails" method="post">
    <h1 align="center">COVID DETAILS</h1>
    <h6 align="left" style="color:Red">Required fields are marked with *</h6>
     <%
    try{
	   Connection con = DatabaseConnection.getConnection();
	   Statement s= con.createStatement();
	   String sql="select * from dependent_details";
	   ResultSet rs= s.executeQuery(sql);
	   %>
	   <div class="scrollit">
	   <table>
	   <tr>
	   <td>Person ID*:</td>
	   <td><select name="pid" required>
	   <% 
	   while(rs.next())
	   {
	    int id=rs.getInt("RID");
	   %>
	   <option value="<%=id %>"><%=id %></option>
       <%
	   }
	   %>
	   </select></td>
	   </tr><tr></tr><tr></tr>
  <tr>
  <td>First Name*:</td>
  <td> <input type="text" name="fname" size="30" max="20"  required></td>
  <td>Last Name*: </td>
  <td><input type="text" name="lname" size="30" max="20"  required></td>
  </tr>
  <tr></tr><tr></tr>
  <tr>
  <td>From Date*:</td>
  <td> <input type="date" name="fdate" max="<%=java.time.LocalDate.now()%>" required></td>
  <td>To Date*: </td>
  <td><input type="date" name="tdate" max="<%=java.time.LocalDate.now()%>" required></td>
  </tr><tr></tr><tr></tr>
  </table>
  <br><br>
  <div style="text-align:center">
       <input type="submit" value="submit">
      </div>
      <br><br>
  <table id="data">
     <tr>
    <th>SNo.</th>
    <th>P_ID</th>
    <th>From_Date</th>
    <th>To_Date</th>
    </tr>
    <%
          Statement st=con.createStatement();
          ResultSet r=st.executeQuery("select * from covid_details");
          while(r.next()){
    %>
    <tr>
    <td><%=r.getInt(1) %></td>
    <td><%=r.getInt(2) %></td>
    <td><%=r.getString(3) %></td>
    <td><%=r.getString(4) %></td>
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