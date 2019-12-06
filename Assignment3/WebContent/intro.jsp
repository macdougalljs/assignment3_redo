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
<title>Intro</title>
<link rel="stylesheet" href="mystyles.css">
</head>
<body>
	<%@include file="header.html"%>


	<%
		//  get the context - initial data access,  all others handled by Listener
		// my intention was to move most of the code below to listener too, but I ran out of time.
		// set the studentid attribute into the context

		int sid = Integer.parseInt(request.getParameter("studentid"));
		ServletContext context = getServletContext();
		context.setAttribute("sid", sid);

		// get the DBconnection info from the context
		DBConnect conn = (DBConnect) getServletContext().getAttribute("dbConnection");
		// create new dataaccess object
		DataAccess dao = new DataAccess();
		// get the student from the database 
		Student student = dao.getRow(conn.getConnect(), sid);
		// set the studentobj object into the context
		context.setAttribute("studentObj", student);
	%>
	<!--  RedX Photo. (n.d.). Retrieved from https://www.driversupport.com/knowledge-article/red-x-on-network-icon/ -->
	<div class="container">
		<div class="header">
			<h1>Search Results - ${sid}</h1>
		</div>
		<div class="left">
			<%
				if (student == null) {
			%>
			<img src="images/redx.png">
			<%
				} else {
			%>
			<img src="images/checkmark.png">
			<%
				}
			%>
		</div>
		<div class="right">
			<!--  take actions if the student already exists -->
			<%
				if (student == null) {
					System.out.println("The student does not exist!");
			%><a href="create.jsp">Click here to create a new Student</a> <br>
			<a href="index.jsp">Click to go Back</a>
			<%
				} else {

					System.out.println("Student record was located in the database. ");
					System.out.println(student.getFirstName());
			%><a href="modify.jsp">Click here to modify a Student</a><br> <a
				href="report.jsp">Print Report </a>
			<%
				}
			%>

		</div>
		<div class="footer"></div>
	</div>

	<br>

	<%@include file="footer.html"%>
</body>
</html>
