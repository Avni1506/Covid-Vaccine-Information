<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/employeedetails.png" style="padding-top:500px" height="200px" width="200px">
<div class="employee">
  <form action="employeeDetails" method="post">
  <table>
  <tr>
   <td>EmployeeID :</td>
   <td><input type="text" size="15"  maxlength="10" value="${param.ID }" readonly></td></tr>
   <tr><td><a href="newEmployee.jsp"><button type="button">Back</button></a></td></tr>
   </table>
     <h1 align="center">EMPLOYEE DETAILS</h1>
     <h6 align="left" style="color:Red">Required fields are marked with *</h6>
     <div class="scrollit">
     <table>
     <tr>
     <td>EmployeeID*: </td>
     <td><input type="text" size="15" name="empID" maxlength="10" value="${param.ID }" readonly></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td>First Name* : </td>
     <td><input type="text" size="30" name="fname" maxlength="20" required></td>
     <td id="message"></td>
     <td>Last Name*: </td>
     <td><input type="text" size="30" name="lname" maxlength="20" required></td>
     </tr>
     <tr></tr><tr></tr>
     <tr>
     <td>Gender* : </td>
     <td><select name="gender" required>
            <option disabeled selected hidden>-Select-</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
          </select></td>
      <td>Date of Birth*: </td>
      <td><input type="date" size="12" name="dob" max="<%=java.time.LocalDate.now()%>" required></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>e-mail*:</td>
      <td> <input type="email" size="50"  name="mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></td>
      <td>Phone*:</td>
      <td> <input type="text" size="15" name="phone" maxlength="10" required></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td><label>Address:</label></td></tr>
      <tr>
      <td>HNo.*: </td>
      <td><input type="text" size="10" name="hno" required></td>
      <td>Street*: </td>
      <td><input type="text" size="20" name="street" required></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>City*: </td>
      <td><input type="text" size="20" name="city" required></td>
      <td>District*: </td>
      <td><input type="text" size="20" name="dist" required></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
      <td>Pincode* :</td>
      <td> <input type="text" size="10" name="pin" required></td>
      <td>State* : </td>
      <td><select name="state" required>
        <option disabeled selected hidden>-Select-</option>
        <option>Andhra Pradesh</option>
        <option>Arunachal Pradesh</option>
        <option>Assam</option>
        <option>Bihar</option>
        <option>Chhattisgarh</option>
        <option>Goa</option>
        <option>Gujarat</option>
        <option>Haryana</option>
        <option>Himachal Pradesh</option>
        <option>Jammu & Kashmir</option>
        <option>Jharkhand</option>
        <option>Karnataka</option>
        <option>Kerala</option>
        <option>Madhya Pradesh</option>
        <option>Maharashtra</option>
        <option>Manipur</option>
        <option>Meghalaya</option>
        <option>Mizoram</option>
        <option>Nagaland</option>
        <option>Odisha</option>
        <option>Punjab</option>
        <option>Rajasthan</option>
        <option>Sikkim</option>
        <option>Tamil Nadu</option>
        <option>Telangana</option>
        <option>Tripura</option>
        <option>Uttar Pradesh</option>
        <option>Uttarakhand</option>
        <option>West Bengal</option>
      </select></td>
      </tr>
      <tr></tr><tr></tr>
      <tr>
     <td>Password* : </td>
     <td><input type="text" size="30" name="pass" maxlength="20" required></td>
     </tr> 
      </table>
      <div style="text-align:center">
       <input type="submit" value="submit">
      </div><br><br>
     <table id="data">
     <tr>
    <th>SNo.</th>
    <th>E_ID</th>
    <th>First_Name</th>
    <th>Last_Name</th>
    <th>Gender</th>
    <th>DOB</th>
    <th>Email</th>
    <th>Phone</th>
    <th>HNo</th>
    <th>Street</th>
    <th>City</th>
    <th>District</th>
    <th>State</th>
    <th>Pincode</th>
    </tr>
    <%
      try{
    	  Connection c=DatabaseConnection.getConnection();
          Statement s=c.createStatement();
          ResultSet r=s.executeQuery("select * from employee_details");
          while(r.next()){
    %>
    <tr>
    <td><%=r.getInt(1) %></td>
    <td><%=r.getString(2) %></td>
    <td><%=r.getString(3) %></td>
    <td><%=r.getString(4) %></td>
    <td><%=r.getString(5) %></td>
    <td><%=r.getString(6) %></td>
    <td><%=r.getString(7) %></td>
    <td><%=r.getString(8) %></td>
    <td><%=r.getString(9) %></td>
    <td><%=r.getString(10) %></td>
    <td><%=r.getString(11) %></td>
    <td><%=r.getString(12) %></td>
    <td><%=r.getString(13) %></td>
    <td><%=r.getInt(14) %></td>
    </tr>
    <%
          }
      }
      catch(Exception e){
    	  System.out.println("Exception "+e);
      }
    %>
  </table>
      </div><br><br>
      
  </form>
  
  </div> 
</body>
</html>