package com.covid;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uname");
		System.out.println("User Name "+username);
		String password = request.getParameter("pass");
		System.out.println("Password "+password);
		if (username.equals("admin") && password.equals("admin")) {
			response.sendRedirect("afterAdminLogin.jsp");
		} else {
			response.sendRedirect("adminLogin.jsp");
		}
	}

}
