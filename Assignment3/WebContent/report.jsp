<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="javax.servlet.ServletContext, java.sql.Connection, ca.sheridancollege.controller.DBConnect, ca.sheridancollege.model.Student, ca.sheridancollege.controller.DataAccess"%>
	<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Report</title>
<link rel="stylesheet" href="mystyles.css">
</head>
<body>
	<%
		ServletContext context = getServletContext();
		Student student = (Student) getServletContext().getAttribute("studentObj");
		context.setAttribute("studentObj", student);
	%>

	<%@include file="header.html"%>

	<div class="container">
		<div class="header"><h1>Report for ${studentObj.firstName}
			${studentObj.lastName} - #${studentObj.studentID}</h1></div>

		<div class="left">
			<img src="images/sheridan.jpg">
		</div>
		<div class="right">
		<table>
				<tr>
					<th>Field</th>
					<th>Data</th>
				</tr>

				<tr>
					<td>Student First Name:</td>
					<td>${studentObj.firstName}</td>
				</tr>

				<tr>
					<td>Student Last Name:</td>
					<td>${studentObj.lastName}</td>
				</tr>

				<tr>
					<td>Q1:</td>
					<td>${studentObj.q1}</td>
				</tr>
				<tr>
					<td>Q2:</td>
					<td>${studentObj.q2}</td>
				</tr>
				<tr>
					<td>Q3:</td>
					<td>${studentObj.q3}</td>
				</tr>
				<tr>
					<td>Q4:</td>
					<td>${studentObj.q4}</td>
				</tr>
				<tr>
					<td>A1:</td>
					<td>${studentObj.a1}</td>
				</tr>
				<tr>
					<td>A2:</td>
					<td>${studentObj.a2}</td>
				</tr>
				<tr>
					<td>A3:</td>
					<td>${studentObj.a3}</td>
				</tr>
				<tr>
					<td>Mid-term Mark:</td>
					<td>${studentObj.midTermExam}</td>
				</tr>
				<tr>
					<td>Final Exam Mark:</td>
					<td>${studentObj.finalExam}</td>
				</tr>
				<tr>
					<td><b>Final Grade:</b></td>
					<td><b><%=student.getFinalGrade()%></b></td>
				</tr>

			</table>
		</div>
		<div class="footer"></div>
	</div>
	<br><br>
	<%@include file="footer.html"%><br>
	<br>
	<a href="index.jsp">Back to main page </a>

</body>
</html>