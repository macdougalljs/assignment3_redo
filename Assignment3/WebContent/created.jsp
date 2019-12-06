<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page
	import="javax.servlet.ServletContext, java.sql.Connection, ca.sheridancollege.controller.DBConnect, ca.sheridancollege.model.Student, ca.sheridancollege.controller.DataAccess"%>
<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Created</title>
<link rel="stylesheet" href="mystyles.css">
</head>
<body>

	<%
		ServletContext context = getServletContext();
		//Student student = (Student) context.getAttribute("studentObj");
		Student student = new Student();

		student.setStudentID((Integer) context.getAttribute("sid"));

		student.setFirstName(request.getParameter("firstName"));
		student.setLastName(request.getParameter("lastName"));

		// pass the attribute to the context for the listener to manage

		context.setAttribute("createStudentObj", student);

		context.setAttribute("studentObj", student); // we can probably delete this
	%>
	<div>
		<h1>The Student ${studentObj.firstName} ${studentObj.lastName}
			Student Number: ${studentObj.studentID} has been Created</h1>

		<a href="index.jsp">Click to go Back Home</a>
	</div>
</body>
</html>