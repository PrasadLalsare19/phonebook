package com.Servlet;

import java.io.IOException;



import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.Connection.DbConnect;
import com.DAO.ContactDAO;
import com.Entity.Contact;

@WebServlet("/update")
public class EditContact extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	int cid=Integer.parseInt(req.getParameter("cid"));
 		String name=req.getParameter("name");
 		String email=req.getParameter("email");
 		String phno=req.getParameter("phno");
 		String about=req.getParameter("about");
 		
 		Contact c=new Contact();
 		c.setId(cid);
 		c.setName(name);
 		c.setEmail(email);
 		c.setPhno(phno);
 		c.setAbout(about);
 		
 		ContactDAO dao=new ContactDAO(DbConnect.getConn());
 		
        HttpSession session =req.getSession();
		
	    boolean f=dao.updateContact(c);
		
		if(f)
		{
			session.setAttribute("succMsg", "Your Contact Updated");
			resp.sendRedirect("viewContact.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something Went Wrong on Server");
			resp.sendRedirect("editcontact.jsp?cid="+cid);
		}
    }
}
