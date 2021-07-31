package com.covid;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dependentDetails
 */
@WebServlet("/dependentDetails")
public class dependentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String eid=request.getParameter("eid");
		String rel=request.getParameter("relation");
		String Fname=request.getParameter("fname");
		String Lname=request.getParameter("lname");
		String Gender=request.getParameter("gender");
		String DOB=request.getParameter("dob");
		long millis=System.currentTimeMillis();  
		java.sql.Date Date=new java.sql.Date(millis);
		String sysdate=Date.toString();
		int a=sysdate.compareTo(DOB);
		try{
			Connection c=DatabaseConnection.getConnection();
			Statement s=c.createStatement();
			if(a>=0){
			int i=s.executeUpdate("insert into dependent_details(E_ID,Relation,First_Name,Last_Name,Gender,DOB) values('" + eid + "','" + rel + "','" + Fname+ "','" + Lname + "','" + Gender + "','" + DOB + "')");
			if(i>0)
	            response.sendRedirect("afterAdminLogin.jsp");
			s.close();
			}
			else{
				out.println("<html><body>");
				out.println("<h3>Data can not be entered as date is not correct</h3>");
			    out.println("<a href='dependent.jsp'>Back</a>");
			    out.println("</body></html>");
			}
		}
		catch(Exception e){
			System.out.println("Exception "+e);
		}
	}

}
