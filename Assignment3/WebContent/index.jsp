<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--  Assignment 3 - Jeremiah MacDougall & Tavlin Sekhon -->
<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter a student number</title>
<link rel="stylesheet" href="mystyles.css">
</head>

<body>
	<%@ include file="header.html"%>
	<div class="container">
		<div class="header">
			<h1>Welcome To Student Grades!</h1>
		</div>
		<div class="left">
			<img src="images/sheridan.jpg">
		</div>
		<div class="right">
			<form action="intro.jsp" method="post">
				<br>Enter a Student Number: <input type="number"
					name="studentid"><br> <br> <input type="submit"
					value="Submit"> <br>
			</form>
		</div>
		<div class="footer"></div>
	</div>
	<br>
	<br>
	<%@include file="footer.html"%>
</body>
</html>
