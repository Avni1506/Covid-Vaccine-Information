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
 * Servlet implementation class vaccineDetails
 */
@WebServlet("/vaccineDetails")
public class vaccineDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String PID=request.getParameter("pid");
		String Vname=request.getParameter("vname");
		String Date1=request.getParameter("date1");
		int pincode1=Integer.parseInt(request.getParameter("pin1"));
		String Date2=request.getParameter("date2");
		String Pin=request.getParameter("pin2");
		Integer pincode2 = null;
		if(Pin.isEmpty()){
			Integer pin2=0;
		}
		else{
		 pincode2=Integer.parseInt("Pin");
		}
		try{
			Connection c=DatabaseConnection.getConnection();
			Statement s=c.createStatement();
			if(Date2.isEmpty()){
			int i=s.executeUpdate("insert into vaccine_details(P_ID,Vaccine_Name,Dose1_Date,Dose1_PlaceCode) values('" + PID + "','" +Vname + "','" + Date1+ "','"+pincode1+"')");
			if(i>0)
	            response.sendRedirect("afterAdminLogin.jsp");
			}
			else{
				int j=s.executeUpdate("insert into vaccine_details(P_ID,Vaccine_Name,Dose1_Date,Dose1_PlaceCode,Dose2_Date,Dose2_PlaceCode) values('" + PID + "','" +Vname + "','" + Date1+ "','"+pincode1+"','"+Date2+"','"+pincode2+"')");
				if(j>0)
		            response.sendRedirect("afterAdminLogin.jsp");
			}
		}
		catch(Exception e){
			System.out.println("Exception "+e);
		}
		}

}
