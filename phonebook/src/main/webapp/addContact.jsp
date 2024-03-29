// Arya Kiran Malode
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
					String sucssMsg=(String)session.getAttribute("succMsg");
					String errorMsg=(String)session.getAttribute("failedMsg");
					
					if(sucssMsg!=null){
						%>
						   <p class="text-success text-center"><%=sucssMsg %></p>
					    <%	
					    session.removeAttribute("succMsg");
					}
					if(errorMsg!=null){			
						%>
						   <p class="text-danger  text-center "><%=errorMsg %></p>
					    <%	
					    session.removeAttribute("failedMsg");
					}	
					 %>
						
						<form action="addContact" method="post">
                        <% 
                        if(user!=null){%>
                        <input type="hidden" value="<%=user.getId()%>" name="userid">                      	
                       <% }          
                        %>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone no</label> <input
									name="phno" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">About</label> <input
									name="about" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Save
									Contact</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 165px">
<%@include file="component/footer.jsp" %>
</div>

</body>
</html>
