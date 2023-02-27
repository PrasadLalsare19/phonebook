<%@page import="com.Connection.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wellcome Page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.back-img{
background:url("img/phone1.jpg");
width: 100%;
height: 86vh;
background-repeat:no-repeat;
background-size: cover;
}

</style>

</head>
<body>

<%@include file="component/navbar.jsp"%>


<%--<% Connection conn=DbConnect.getConn();
out.print(conn);

Checking for Connection
--%>


<div class="container-fluid back-img text-center text-dark black">
<h1>Welcome to PhoneBook App</h1>

</div>
<%@include file="component/footer.jsp" %>

</body>
</html>