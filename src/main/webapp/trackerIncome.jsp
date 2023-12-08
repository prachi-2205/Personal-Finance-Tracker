<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
   body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: #f8f8f8;
    margin: 0;
    padding: 0;
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
.sansserif {
    font-family: Arial, Helvetica, sans-serif;
}
/* Add this style for better alignment of "From Date" input */
form tr td:first-child {
    white-space: nowrap;
    text-align: right;
    padding-right: 10px;
}

/* Adjust the width and margin for the date inputs */
input[type="date"] {
    width: calc(100% - 16px); /* Adjusted width */
    margin: 5px 0;
}

/* Add some space between the label and the input in the date-related forms */
form tr td:first-child {
    white-space: nowrap;
    text-align: right;
    padding-right: 10px;
}
.container {
    margin: 20px auto;
    max-width: 800px;
    padding: 20px;
    border: 1px solid #ddd;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
}

td {
    padding: 10px;
}

input[type="date"],
select {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

img {
    margin-left: 20px;
}
</style>
    <link href="<c:url value="/form.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tracker</title>

<h2><center>Expense tracker</center></h2>
</head>

<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>

</div>
<!-- /container -->
<div class="container">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<img src="/pieChart" title = "PieChart" class="center" height="315" width="430"/>
</div>


<div class="container">
<h3 class="sansserif">Track based on Date</h3>
<form action="/dateTracker" method="post">
<tr><td>From Date : 					</td>  <td>       <input type="date" name="fromDate" />   </td> </tr>
<tr><td>Till Date : 					</td>  <td>       <input type="date" name="tillDate" />   </td> </tr>
<input type="submit" value="Track" />
</form>
</div>

<div class="container">
<h3 class="sansserif">Track based on Category</h3> 

<form action="/categoryTracker" method="post">
<tr><td>Select Category :</td>  
<td>      <select name="trackCategory">
 	     <c:forEach items="${categories}" var="databaseValue">
		  <option value="${databaseValue}">
						   ${databaseValue}
			  </option>
 		</c:forEach>
	    </select><input type="submit" value="Track" />     </td> </tr>
</form>
</div>
<div class="container">

<h3 class="sansserif">Track based on Date and Category</h3>
<form action="/dateAndCategoryTracker" method="post">
<tr><td>From Date : 					</td>  <td>       <input type="date" name="fromDate" />   </td> </tr>
<tr><td>Till Date : 					</td>  <td>       <input type="date" name="tillDate" />   </td> </tr>
<tr><td>Select Category :    	    	
	</td>  <td>      <select name="trackCategory">
			 <c:forEach items="${categories}" var="databaseValue">
					  <option value="${databaseValue}">
									   ${databaseValue}
						  </option>
			 </c:forEach>
	</select><input type="submit" value="Track" />     </td> </tr>
</div>
</form>
</body>
</html>