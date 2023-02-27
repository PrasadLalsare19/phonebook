package com.Servlet;

import java.io.IOException;



import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		
		session.removeAttribute("user");
		
		HttpSession session2=req.getSession();
		session.setAttribute("logMsg","Logout Sucessfully..");
		
		resp.sendRedirect("login.jsp");
		
	}

}
