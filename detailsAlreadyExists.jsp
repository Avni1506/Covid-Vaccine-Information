<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.covid.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vaccine Details</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
<img align="right" src="images/vaccinedetails.png" style="padding-top:100px" height="600px" width="400px">
<div class="vaccine">
<form action="" method="post">
   <h1 align="center">VACCINE DETAILS</h1>
   <h6 align="left" style="color:Red">Required fields are marked with *</h6>
   <div class="scrollit">
    <table>
       <%
          String fname="",lname="";
          try{
        	  Connection con=DatabaseConnection.getConnection();
        	  Statement s=con.createStatement();
        	  String id=request.getParameter("ID");
        	  ResultSet r=s.executeQuery("select * from dependent_details where RID='"+id+"'");
        	  while(r.next()){
       %>
       <tr>
          <td>Person ID* :</td>
          <td><input type="text" value="${param.ID }" name="pid" readonly></td>
       </tr>
       <tr>
          <td>Employee ID* :</td>
          <td><input type="text" value="<%= r.getString(2) %>" name="empID" readonly></td>
       </tr>
       <% 
          String eid=r.getString(2);
          Statement stmt=con.createStatement();
          ResultSet result=stmt.executeQuery("select * from employee_details where E_ID='"+eid+"'");
          while(result.next()){
        	   fname=result.getString(3);
        	   lname=result.getString(4);
       %>
       <tr>
       <td>Employee Name*:</td>
       <td><input type="text" value="<%=fname.concat(" "+lname) %>" readonly></td>
       </tr>
       <%
          }
       %>
       <tr>
          <td>Relation* :</td>
          <td><input type="text" value="<%= r.getString(3) %>" name="relation" readonly></td>
       </tr>
       <tr>
          <td>First Name* :</td>
          <td><input type="text" value="<%= r.getString(4) %>" name="fname" readonly></td>
       </tr>
       <tr>
          <td>Last Name* :</td>
          <td><input type="text" value="<%= r.getString(5) %>" name="lname" readonly></td>
       </tr>
       <tr>
          <td>Gender* :</td>
          <td><input type="text" value="<%= r.getString(6) %>" name="gender" readonly></td>
       </tr>
       <tr>
          <td>DOB* :</td>
          <td><input type="text" value="<%= r.getString(7) %>" name="dob" readonly></td>
       </tr>
       <%
        	  }
        	  Statement st=con.createStatement();
        	  ResultSet rs=st.executeQuery("select * from vaccine_details where P_ID='"+id+"'");
        	  while(rs.next()){
       %>
       <tr>
          <td>Vaccine Name* :</td>
          <td><input type="text" name="vname" value="<%=rs.getString(3) %>" readonly></td>
       </tr>
       <tr>
          <td>Dose1 Date* :</td>
          <td><input type="date" name="date1" max="<%=java.time.LocalDate.now()%>" value="<%=rs.getString(4) %>" readonly></td>
       </tr>
       <tr>
          <td>Pincode* :</td>
          <td><input type="text" name="pin1" value="<%=rs.getString(5) %>" readonly></td>
       </tr>
       <tr>
          <td>Dose2 Date :</td>
          <td><input type="date" name="date2" max="<%=java.time.LocalDate.now()%>" value="<%=rs.getString(6) %>" readonly></td>
       </tr>
       <tr>
          <td>Pincode :</td>
          <td><input type="text" name="pin2" value="<%=rs.getString(7) %>" readonly></td>
       </tr>
    </table>
    <%
        	  }
    %>
    <a href="vaccineDetails.jsp"><button type="button">Back</button></a><br><br>
    <table id="data">
     <tr>
    <th>SNo.</th>
    <th>P_ID</th>
    <th>Vaccine Name</th>
    <th>Dose1 Date</th>
    <th>Dose1 Place Code</th>
    <th>Dose2 Date</th>
    <th>Dose2 Place Code</th>
    </tr>
    <%
          Statement stmt=con.createStatement();
          ResultSet result=stmt.executeQuery("select * from vaccine_details");
          while(result.next()){
    %>
    <tr>
    <td><%=result.getInt(1) %></td>
    <td><%=result.getInt(2) %></td>
    <td><%=result.getString(3) %></td>
    <td><%=result.getString(4) %></td>
    <td><%=result.getInt(5) %></td>
    <td><%=result.getString(6) %></td>
    <td><%=result.getInt(7) %></td>
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
</body>
</html>