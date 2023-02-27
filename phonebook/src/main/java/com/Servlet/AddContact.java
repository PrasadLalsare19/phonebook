package com.Servlet;

import java.io.IOException;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.Connection.DbConnect;
import com.DAO.ContactDAO;
import com.Entity.Contact;

@jakarta.servlet.annotation.WebServlet("/addContact")
public class AddContact extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId=Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String about=req.getParameter("about");
		
		Contact c=new Contact(name,email,phno,about,userId);
		
		ContactDAO dao=new ContactDAO(DbConnect.getConn());
		
		HttpSession session =req.getSession();
		
		boolean f=dao.saveContact(c);
		
		if(f)
		{
			session.setAttribute("succMsg", "Your Contact Saved");
			resp.sendRedirect("addContact.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something Went Wrong on Server");
			resp.sendRedirect("addContact.jsp");
		}
		
		
	}

}
