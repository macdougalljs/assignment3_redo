<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page
	import="java.sql.Connection, ca.sheridancollege.controller.DBConnect, ca.sheridancollege.model.Student, ca.sheridancollege.controller.DataAccess"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify</title>
<link rel="stylesheet" href="mystyles.css">
</head>
<body>
	<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->

	<!--  get the object from the context here - we're looking for the student object
  -->
	<%@include file="header.html"%>
	<%
		DBConnect conn = (DBConnect) getServletContext().getAttribute("dbConnection");
		DataAccess dao = new DataAccess();

		Student student = (Student) getServletContext().getAttribute("studentObj");
	%>

	<form action="modified.jsp" method="post">

		<div class="container">
		<div class="header"><h1>Modify Student - ${sid}</h1></div>
		<div class="left"><img src="images/sheridan.jpg"></div>
		<div class="right">
		<br>
		<table>  <!--  setup the user info table -->
			<tr>
				<th>Field</th>
				<th>Data</th>
			</tr>

			<tr>
				<td>Student First Name:</td>
				<td><input type="text" name="firstName"
					value="${studentObj.firstName}"></td>
			</tr>

			<tr>
				<td>Student Last Name:</td>
				<td><input type="text" name="lastName"
					value="${studentObj.lastName}"></td>
			</tr>

			<tr>
				<td>Enter Q1:</td>
				<td><input type="number" name="Q1" value="${studentObj.q1}"></td>
			</tr>
			<tr>
				<td>Enter Q2:</td>
				<td><input type="number" name="Q2" value="${studentObj.q2}"></td>
			</tr>
			<tr>
				<td>Enter Q3:</td>
				<td><input type="number" name="Q3" value="${studentObj.q3}"></td>
			</tr>
			<tr>
				<td>Enter Q4:</td>
				<td><input type="number" name="Q4" value="${studentObj.q4}"></td>
			</tr>
			<tr>
				<td>Enter A1:</td>
				<td><input type="number" name="A1" value="${studentObj.a1}"></td>
			</tr>
			<tr>
				<td>Enter A2:</td>
				<td><input type="number" name="A2" value="${studentObj.a2}"></td>
			</tr>
			<tr>
				<td>Enter A3:</td>
				<td><input type="number" name="A3" value="${studentObj.a3}"></td>
			</tr>
			<tr>
				<td>Enter Mid-term Mark:</td>
				<td><input type="number" name="E1"
					value="${studentObj.midTermExam}"></td>
			</tr>
			<tr>
				<td>Enter Final Exam Mark:</td>
				<td><input type="number" name="E2"
					value="${studentObj.finalExam}"></td>
			</tr>

		</table>
		</div>
		<div class="footer"></div>
		</div>

		<input type="submit" value="Submit"><br> <br>
		<a href="index.jsp">Click to go Back</a>

	</form>
<br><br>
	<%@include file="footer.html"%>
</body>
</html>