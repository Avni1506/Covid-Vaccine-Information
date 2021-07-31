<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.covid.DatabaseConnection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Relations</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style4.css">
<link rel="stylesheet" href="css/style5.css">
</head>
<body>
<h1 style="color:black; text-align:center;">Covid / Vaccine Information</h1>
<jsp:include page="adminMenu.jsp"></jsp:include>
 <div class="relation">
  <form action="relationdetails.jsp" method="post">
    <div class="scrollit">
      <table>
        <tr>
     <td> Add New Relation : </td>
     <td><input type="text" size="30" name="relation" max="20" required></td>
     </tr>
     <tr></tr><tr></tr>
      </table><br><br>
      <div style="text-align:center">
        <input type="submit" value="submit"><br><br>
            <table id="data">
     <tr>
    <th>Relation</th>
    </tr>
    <%    try{
    	  Connection con=DatabaseConnection.getConnection();
          Statement st=con.createStatement();
          ResultSet result=st.executeQuery("select * from relation_master");
          while(result.next()){
    %>
    <tr>
    <td><%=result.getString(2) %></td>
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
    </div>
  </form>
 </div>
</body>
</html>