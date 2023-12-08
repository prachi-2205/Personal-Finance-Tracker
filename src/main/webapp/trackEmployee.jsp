<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%ResultSet resultset =null;%>
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
    
    h1, h2, h3, h4 {
        font-family: Arial, Helvetica, sans-serif;
        text-align: center;
    }

    .sansserif {
        font-family: Arial, Helvetica, sans-serif;
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

    input[type="text"],
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

    a {
        color: #3498db;
        text-decoration: none;
    }

    a:hover {
        color: #2c3e50;
    }
</style>
<link href="<c:url value="/form.css" />" rel="stylesheet">
<link href="bootstrap.css" type="text/css" rel="stylesheet">

<h2 class="sansserif"><center>Expense tracker</center></h2>
</head>
	<title>Track Member Expense</title>
</head>
<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>
</div>
<div class="navbar">
    <a href="${viewPage}"> TRACK MEMBER EXPENSE </a>
	<a href="${group}"> ADD EXPENSE TO GROUP OF EMPLOYEES </a>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<h2>Track Member Expense</h2>
<div class="container">
<form action="/employeeExpenseSubmission" method="post">
<table>
		<tr><td>Expense Name : <input type="text" name="expenseName"/></td> </tr>
		<tr><td>Amount :  	    <input type="text" name="amount" /> 	 </td> </tr>
		<tr><td>Date : 			<input type="date" name="createdDate" /></td> </tr>
		<tr><td>Comment :    	<input type="text" name="comments" />  </td> </tr>
		
		<tr><td>Member : <select name="employee">
                                <c:forEach items="${employees}" var="databaseValue">
                                    <option value="${databaseValue}">
                                            ${databaseValue}
                                    </option>
                                </c:forEach>
                        </select>
		
		<tr><td>Category :<select name="category">
                                <c:forEach items="${categories}" var="databaseValue">
                                    <option value="${databaseValue}">
                                            ${databaseValue}
                                    </option>
                                </c:forEach>
                        </select>
		<tr><td><input type="submit" value="Submit" /></td></tr>
	</table>
	</form>
</div>
<div class="container">

	<form action="/deleteEmployee" method="post">
    <tr><td><h3 class="sansserif">Delete Employee : </h3></td>  
        <td> <select name="deleteEmployee">
                    <c:forEach items="${employees}" var="databaseValue">
                        <option value="${databaseValue}">
                                ${databaseValue}
                        </option>
                    </c:forEach>
            </select>
			<input type="submit" value="Delete Employee" />     </td> </tr>
</form>
<a href="${address}"> Add New Employee </a>
</div>	

<div class="container">
<form action="/addCategories" method="post">
<tr><td><h3 class="sansserif">Add Category : </h3>   	    	</td>  <td>       <input type="text" name="addcategory" /> <input type="submit" value="Add Category" />     </td> </tr>
</form>
</div>
<div class="container">
    <form action="/deleteCategories" method="post">
            <tr><td><h3 class="sansserif">Delete Category : </h3>	    	
            </td>  <td>      <select name="deleteCategory">
                    <c:forEach items="${categories}" var="databaseValue">
                        <option value="${databaseValue}">
                                ${databaseValue}
                        </option>
                    </c:forEach>
            </select><input type="submit" value="Delete Category" />     </td> </tr>
    </form>
</div>
</body>

</html>