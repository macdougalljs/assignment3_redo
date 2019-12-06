<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="javax.servlet.ServletContext, java.sql.Connection, ca.sheridancollege.controller.DBConnect, ca.sheridancollege.model.Student, ca.sheridancollege.controller.DataAccess"%>
	<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyles.css">
<meta charset="ISO-8859-1">
<title>Update Complete</title>
</head>
<body>
	<!--    get all the information from the form in modify.jsp ). The form should redirect to another 
  JSP that performs the update, issues a report on exactly what was updated and offers the user a 
  link back to index.html. -->
	<%
  
//get the context

		 ServletContext context =  getServletContext();
  		Student student = (Student) context.getAttribute("studentObj");
  	
  		// store the values from the form into the object
  		
  		student.setFirstName(request.getParameter("firstName"));
  		student.setLastName(request.getParameter("lastName"));
  		student.setQ1(Integer.parseInt(request.getParameter("Q1")));
  		student.setQ2(Integer.parseInt(request.getParameter("Q2")));
  		student.setQ3(Integer.parseInt(request.getParameter("Q3")));
  		student.setQ4(Integer.parseInt(request.getParameter("Q4")));
  		student.setA1(Integer.parseInt(request.getParameter("A1")));
  		student.setA2(Integer.parseInt(request.getParameter("A2")));
  		student.setA3(Integer.parseInt(request.getParameter("A3")));
  		student.setMidTermExam(Integer.parseInt(request.getParameter("E1")));
  		student.setFinalExam(Integer.parseInt(request.getParameter("E2")));
  		
    	
  		// pass the attribute to the context for the listener to manage
  		context.setAttribute("writeStudentObj",student);
  				
  		context.setAttribute("studentObj",student);		// we can probably delete this
  				     
  %>
	<div>
		<h1>
			Database update status:
			
		</h1>

		<br> ${studentObj} <br> <br> <a href="index.jsp">Back
			to main page </a>
	</div>
</body>
</html>