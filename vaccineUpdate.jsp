<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.covid.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%
	try {
		String q = request.getParameter("pid");
		System.out.println(q);
		String a = request.getParameter("fname");
		String b = request.getParameter("lname");
		String d = request.getParameter("vname");
		String e = request.getParameter("date1");
		String f = request.getParameter("pin1");
		String g = request.getParameter("date2");
		String h = request.getParameter("pin2");
		if (q != null) {
	Connection con = DatabaseConnection.getConnection();
	String query = "update vaccine_details set Vaccine_Name=?,Dose1_Date=?,Dose1_PlaceCode=?,Dose2_Date=?,Dose2_PlaceCode=? where P_ID='"+ q + "'";
	PreparedStatement p = con.prepareStatement(query);
	p.setString(1, d);
	p.setString(2, e);
	p.setString(3, f);
	p.setString(4, g);
	p.setString(5, h);
	p.executeUpdate();
	response.sendRedirect("updateVaccine.jsp");
		}
		else{
			out.println("You have entered wrong Dates");
	%>
	<jsp:include page="updateVaccine.jsp"></jsp:include>
	<% 
		}
	} catch (Exception e) {
		System.out.println("Exception " + e);
	}
%>
