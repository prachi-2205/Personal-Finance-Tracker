<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><center>Add Member</center></title>
<h2><center>Add New Member</center></h2>

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

        table,
        th,
        td {
            border: 1px solid #3498db;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        input[type="text"] {
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
</style>
</head>

<body>
<form:errors path="employee.*" />
<form action="/addEmployee" method="post">
<table>
		<tr><td>Full Name :  </td>  
            <td><input type="text" name="firstName"/></td> 
        </tr>
		
		<tr><td>Phone Number : 	</td>  
            <td><input type="text" name="phoneNumber" /></td> 
        </tr>
		<tr><td>Email ID : </td>  
            <td><input type="text" name="emailId" /></td> 
        </tr>
		<tr><td><input type="submit" value="Add member" /></td></tr>
	</table>
	</form>
</body>
</html>