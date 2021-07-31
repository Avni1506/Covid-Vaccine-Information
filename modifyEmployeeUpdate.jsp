<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.covid.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%  
    
	try {
		String q = request.getParameter("empID");
		System.out.println(q);
		String a = request.getParameter("fname");
		String b = request.getParameter("lname");
		String d = request.getParameter("gender");
		String e = request.getParameter("dob");
		String f = request.getParameter("email");
		String g = request.getParameter("phone");
		String h = request.getParameter("hno");
		String i = request.getParameter("street");
		String j = request.getParameter("city");
		String k = request.getParameter("dist");
		String l = request.getParameter("pin");
		String m = request.getParameter("state");
		long millis=System.currentTimeMillis();  
		java.sql.Date Date=new java.sql.Date(millis);
		String sysdate=Date.toString();
		int z=sysdate.compareTo(e);
		if (q != null && z>0 ) {
	Connection con = DatabaseConnection.getConnection();
	String query = "update employee_details set First_Name=?,Last_Name=?,Gender=?,DOB=?,email=?,Phone=?,Hno=?,Street=?,City=?,District=?,State=?,Pincode=? where E_ID='"
	+ q + "'";
	PreparedStatement p = con.prepareStatement(query);
	p.setString(1, a);
	p.setString(2, b);
	p.setString(3, d);
	p.setString(4, e);
	p.setString(5, f);
	p.setString(6, g);
	p.setString(7, h);
	p.setString(8, i);
	p.setString(9, j);
	p.setString(10, k);
	p.setString(11, m);
	p.setInt(12, Integer.parseInt(l));
	p.executeUpdate();
	response.sendRedirect("modifyEmployee.jsp");
		}
		else{
			out.println("You have entered wrong dates");
		%>
		<jsp:include page="modifyEmployee.jsp"/>
		<%
		}
	} catch (Exception e) {
		System.out.println("Exception " + e);
	}
%>
