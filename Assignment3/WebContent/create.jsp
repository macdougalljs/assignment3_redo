<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create A Student</title>
<link rel="stylesheet" href="mystyles.css">
</head>
<body>

	<%@ include file="header.html"%>
	<div class="container">
		<div class="header"><h1>Create Record</h1></div>
		<div class="left"><img src="images/sheridan.jpg"></div>
		<div class="right">
			<form action="created.jsp" method="post">

				<h1>Enter information for ${sid}:<br></h1>
				<br>
				<table>  <!--  setup the user table form  -->
					<tr>
						<th>Field</th>
						<th>Data</th>
					</tr>

					<tr>
						<td>Student First Name:</td>
						<td><input type="text" name="firstName"></td>
					</tr>

					<tr>
						<td>Student Last Name:</td>
						<td><input type="text" name="lastName"></td>
					</tr>

				</table>
				<br> <input type="submit" value="Submit"><br> <br>
				<a href="index.jsp">Click to go Back</a>

			</form>
		</div>
	</div>
	<%@ include file="footer.html"%>
	
</body>
</html>