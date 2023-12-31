<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Group Expense</title>
<h2>Add Expense To Group Of Friend</h2>


<style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        h2, h3 {
            text-align: center;
            color: #3498db;
        }

        form {
            margin: 20px auto;
            max-width: 600px;
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

        input[type="checkbox"] {
            margin-right: 5px;
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
</style>
</head>
<body>
<h3>Select Employees</h3>
<form action="/getGroupData" method="post">
<table>

 <c:forEach var="detBean" items="${employees}">
              <tr><td> <input type="checkbox" name="checkboxgroup"   
                            value="${detBean}">${detBean}</input></td></tr>
            <br/>
 </c:forEach>
 
        <tr><td>Expense Name :   		</td>  
            <td>       <input type="text" name="expenseName"/></td> 
        </tr>
		<tr><td>Amount : </td>  
            <td>       <input type="text" name="amount" /></td> 
        </tr>
		<tr><td>Date : 	</td>  
            <td>       <input type="date" name="createdDate" /></td> 
        </tr>
		<tr><td>Comment :</td>  
            <td>       <input type="text" name="comments" /></td> 
        </tr>
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
</body>
</html>