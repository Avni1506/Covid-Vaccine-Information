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
 * Servlet implementation class covidDetails
 */
@WebServlet("/covidDetails")
public class covidDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String PID=request.getParameter("pid");
		String Fdate=request.getParameter("fdate");
		String Tdate=request.getParameter("tdate");
		long millis=System.currentTimeMillis();  
		java.sql.Date Date=new java.sql.Date(millis);
		String sysdate=Date.toString();
		int a=sysdate.compareTo(Fdate);
		int b=sysdate.compareTo(Tdate);
		int d=Tdate.compareTo(Fdate);
		try{
			Connection c=DatabaseConnection.getConnection();
			Statement s=c.createStatement();
			if(a>=0&&b>=0&&d>=0){
			int i=s.executeUpdate("insert into covid_details(P_ID,From_Date,To_Date) values('" + PID + "','" +Fdate + "','" + Tdate+ "')");
			if(i>0)
	            response.sendRedirect("afterAdminLogin.jsp");
			s.close();
			}
			else
				out.println("Dates are not correct");
		}
		catch(Exception e){
			System.out.println("Exception "+e);
		}
	}

}
