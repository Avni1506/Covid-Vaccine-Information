package com.covid;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class employeeDetails
 */
@WebServlet("/employeeDetails")
public class employeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static boolean isValid(String email)
    {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                            "[a-zA-Z0-9_+&*-]+)*@" +
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                            "A-Z]{2,7}$";
                              
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null)
            return false;
        return pat.matcher(email).matches();
    } 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String eid=request.getParameter("empID");
		String Fname=request.getParameter("fname");
		String Lname=request.getParameter("lname");
		String Gender=request.getParameter("gender");
		String DOB=request.getParameter("dob");
		String mail=request.getParameter("mail");
		String Phone=request.getParameter("phone");
		String Hno=request.getParameter("hno");
		String Street=request.getParameter("street");
		String City=request.getParameter("city");
		String Dist=request.getParameter("dist");
		String State=request.getParameter("state");
		String Pass=request.getParameter("pass");
		int pincode=Integer.parseInt(request.getParameter("pin"));
		long millis=System.currentTimeMillis();  
		java.sql.Date Date=new java.sql.Date(millis);
		String sysdate=Date.toString();
		int a=sysdate.compareTo(DOB);
		boolean y=isValid(mail);
		boolean x=true;
		int z=Boolean.compare(x,y);
		out.println("<html><body>");
		try{
		    Connection c=DatabaseConnection.getConnection();
			Statement s=c.createStatement();
			if(a>=0 && z==0  ){
			int i=s.executeUpdate("insert into employee_details(E_ID,First_Name,Last_Name,Gender,DOB,email,Phone,Hno,Street,City,District,State,Pincode,Password) values('" + eid + "','" + Fname + "','" + Lname+ "','" + Gender + "','" + DOB + "','" + mail + "','"+Phone+"','"+Hno+"','"+Street+"','" +City+"','"+Dist+"','"+State+"','"+pincode+"','"+Pass+"')");
			if(i>0)
	            response.sendRedirect("afterAdminLogin.jsp");
			s.close();
			}
			else if(z!=0){
				out.println("<h3>Data can not be entered,please enter correct email</h3>");
			    out.println("<a href='employee.jsp'>Back</a>");
			}
			else if(a<0){
				out.println("<h3>Data can not be entered,please enter correct date</h3>");
			    out.println("<a href='employee.jsp'>Back</a>");
			    out.println("</body></html>");
			}
		}
		catch(Exception e){
			System.out.println("Exception "+e);
		}
	}

}
