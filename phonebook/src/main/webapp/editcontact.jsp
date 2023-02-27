
<%@page import="com.Entity.Contact"%>
<%@page import="com.Connection.DbConnect"%>
<%@page import="com.DAO.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>

   <%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please..");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Page</h4>
						
						<%
					
					String errorMsg=(String)session.getAttribute("failedMsg");
					
					
					if(errorMsg!=null){			
						%>
						   <p class="text-danger  text-center "><%=errorMsg %></p>
					    <%	
					    session.removeAttribute("failedMsg");
					}	
					 %>
						
						<form action="update" method="post">
                        <% 
                       int cid=Integer.parseInt(request.getParameter("cid")); 
                        ContactDAO dao=new ContactDAO(DbConnect.getConn());
                        Contact c=dao.getContactByID(cid);
                        
                        
                        %>
                   <input type="hidden" value="<%=cid%>" name="cid">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input value="<%=c.getName() %>"
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input value="<%=c.getEmail() %>"
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone no</label> <input value="<%=c.getPhno() %>"
									name="phno" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">About</label> <input value="<%=c.getAbout() %>"
									name="about" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Update
									Contact</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 170px">
<%@include file="component/footer.jsp" %>
</div>
</body>
</html>