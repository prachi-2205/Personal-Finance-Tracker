<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%ResultSet resultset =null;%>
<html>
<head>

<style>
body {
	font-family: 'Arial', 'Helvetica', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

h1.sansserif, h2.sansserif, h3.sansserif, h4.sansserif {
	text-align: center;
}

.container {
	text-align: center;
	padding: 20px;
}

h2 {
	color: #3498db;
}

h3 {
	color: #3498db;
	margin-top: 20px;
}

table {
	width: 50%;
	margin: 20px auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #3498db;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #3498db;
	color: #fff;
}

.navbar {
    background-color: #3498db;
    overflow: hidden;
    text-align: center;
}

.navbar a {
    float: left;
    display: block;
    color: #fff;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.navbar a:hover {
    background-color: #00004B;
    color: #fff;
}

.navbar a.active {
    background-color: #28a745;
    color: #fff;
}

/* Optional: Add some shadow to the navbar */
.navbar {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

input[type="text"], input[type="date"], input[type="file"], select {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #3498db;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #2980b9;
}

a {
	color: #3498db;
	text-decoration: none;
	font-weight: bold;
}

a:hover {
	color: #2980b9;
}
</style>

<link href="<c:url value="/form.css" />" rel="stylesheet">
<link href="bootstrap.css" type="text/css" rel="stylesheet">
<h1 class="sansserif">
	
</h1>
<h2 class="sansserif">
	<center>Income tracker</center>
</h2>
</head>
<body>
	<form:errors path="expense.*" />
	<div class="container">

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<h2>
				Welcome ${pageContext.request.userPrincipal.name} | <a
					onclick="document.forms['logoutForm'].submit()">Logout</a>
			</h2>

		</c:if>

	</div>
<div class="navbar">
    
    <a href="${empaddress}">  Income TRACKER </a>
    
		</div>
 	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


	<h3 class="sansserif">Add New Income</h3>
	<form action="/incomeSubmission" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>Income Name :</td>
				<td><input type="text" name="incomeName" /></td>
			</tr>
			<tr>
				<td>Amount :</td>
				<td><input type="text" name="amount" /></td>
			</tr>
			<tr>
				<td>Date :</td>
				<td><input type="date" name="createdDate" /></td>
			</tr>
			<tr>
				<td>Comment :</td>
				<td><input type="text" name="comments" /></td>
			</tr>



			<tr>
				<td>Category : <select name="category">
						<c:forEach items="${categories}" var="databaseValue">
							<option value="${databaseValue}">${databaseValue}</option>
						</c:forEach>
				</select>
			<!-- <tr>
				<td>Upload Receipt(Optional) :</td>
				<td><input type="file" name="image" /></td>
			</tr> -->


			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>