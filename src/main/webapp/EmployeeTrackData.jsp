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

        .container {
            margin: 20px;
        }

        h1, h2 {
            text-align: center;
            color: #3498db;
        }

        h3.sansserif {
            font-family: Arial, Helvetica, sans-serif;
            color: #3498db;
            margin-top: 20px;
        }

        form {
            margin-top: 20px;
        }

        select, input[type="file"], input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


<h3 class="sansserif">Track based on Employee</h3>

<form action="/EmployTracker" method="post">
<tr><td>Select Employee :    	    	
										</td>  <td>      <select name="trackEmployee">
 											 <c:forEach items="${employees}" var="databaseValue">
  												  <option value="${databaseValue}">
     													   ${databaseValue}
    											  </option>
 											 </c:forEach>
										</select><input type="submit" value="Track" />     </td> </tr>
</form>

</br>
</br>
</br>

<h2>Please upload the excel sheet</h2>
<form method="POST" action="/uploadFile" enctype="multipart/form-data">

		<tr><td>Select Employee :    	    	
										</td>  <td>      <select name="trackEmployee">
 											 <c:forEach items="${employees}" var="databaseValue">
  												  <option value="${databaseValue}">
     													   ${databaseValue}
    											  </option>
 											 </c:forEach>
										</select>

		File(Excel sheet only): <input type="file" name="file">
 
 		</br>
 		</br>
		Name: <input type="text" name="name">
		</br>
 		</br>
 
		<input type="submit" value="Upload"> Press here to upload the file!
	</form>	


</body>
</html>