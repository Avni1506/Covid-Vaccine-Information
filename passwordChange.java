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
 * Servlet implementation class passwordChange
 */
@WebServlet("/passwordChange")
public class passwordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    PrintWriter out=response.getWriter();
		    response.setContentType("text/html");
			String current=request.getParameter("pass");
			String newpass=request.getParameter("npass");
			String confirm=request.getParameter("cpass");
			try{
				out.println("<html><body>");	
		    Connection c=DatabaseConnection.getConnection();
		    Statement s=c.createStatement();
		    String sql="select * from employee_details where password='"+current+"'";
		    ResultSet r=s.executeQuery(sql);
		    while(r.next()){
		    	    String id=r.getString(2);
		    	    if(newpass.equals(confirm)){
		    	    int i=s.executeUpdate("update employee_details set Password='"+newpass+"' where E_ID='"+id+"'");
		    	    if(i>0)
		              response.sendRedirect("afterEmployeeLogin.jsp");
		    	    }
		    	    else{
		    		  out.println("<h3>Passwords mismatch</h3>");
				      out.println("<a href='changePassword.jsp'>Back</a>");
		    	    }
		    	out.println("</body></html>");
		    }
		}
		catch(Exception e){
			
		}
	}

}
