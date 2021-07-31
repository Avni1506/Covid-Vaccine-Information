<%@ page language="java" import="java.sql.*"%>
<%@ page import="com.covid.DatabaseConnection"%>
<%
  int x=0;
  String id=request.getParameter("empID");
  String password=request.getParameter("pass");
  try{
	  Connection c=DatabaseConnection.getConnection();
	  Statement st=c.createStatement();
	  String sql="select * from employee_details where E_ID='"+id+"'";
	  ResultSet r=st.executeQuery(sql);
	  while(r.next()){
		  if(r.getString("Password").equals(password)){
			   x=1;
		  }
		  else{
			  x=2;
		  }
	  }
	  if(x==1){
	  %>
	  <jsp:include page="employeeMenu.jsp"></jsp:include>

<%                session.setAttribute("user", id);
                  response.sendRedirect("afterEmployeeLogin.jsp");
} else {

    out.println("<center>" + "<b>Either You Enter Wrong UserName or Password</b>");

%>

<jsp:include page="employeeLogin.jsp"/>

<%}
    } catch (Exception ex) {

        out.println(ex);

    } 
%>