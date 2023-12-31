<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/form.css" />" rel="stylesheet">
<style>
        body {
            font-family: 'Arial', 'Helvetica', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            color: #333;
        }

        .container {
            text-align: center;
            padding: 20px;
        }

        h2,
        h3 {
            text-align: center;
            color: #3498db;
            margin-top: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
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
            background-color: #4CAF50;
            color: white;
        }

        .pic {
            height: 40px;
            width: 40px;
            cursor: pointer;
            transition: 0.3s;
        }

        .pic:hover {
            opacity: 0.7;
        }

        .picbig {
            position: absolute;
            width: 0;
            transition: width 0.3s linear 0s;
            -webkit-transition: width 0.3s linear 0s;
            -moz-transition: width 0.3s linear;
            z-index: 10;
        }

        .pic:hover+.picbig,
        .pic:active+.picbig {
            left: 600px;
            width: 500px;
            height: 400px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.9);
        }

        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        .modal-content,
        #caption {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
        }

        @-webkit-keyframes zoom {
            from {
                -webkit-transform: scale(0)
            }

            to {
                -webkit-transform: scale(1)
            }
        }

        @keyframes zoom {
            from {
                transform: scale(0)
            }

            to {
                transform: scale(1)
            }
        }

        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }

        @media only screen and (max-width: 700px) {
            .modal-content {
                width: 100%;
            }
        }

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td,
        #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #customers tr:hover {
            background-color: #ddd;
        }

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EXPENSES</title>
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2> ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<h3 class="sansserif">Based on Category : ${category}</h3>
<form action="/deleteExpenseFromCategory" method="POST">
<TABLE id="customers" BORDER="1">
		<TR>
			<TH>Expense Name</TH>
			<TH>Comments</TH>
			<TH>Date</TH>
			<TH>Amount</TH>
			<TH>Category</TH>
			<th>Receipt</th>
			<TH>Delete</TH>
			<th>Edit</th>
		</TR>

		<c:forEach items="${expense}" var="element">


			<TR>
				<TD>${element[0]}</td>
				<TD>${element[3]}</TD>
				<TD><fmt:formatDate value="${element[2]}"
						pattern="yy-MMM-dd" /></TD>
				<TD>${element[1]}</TD>
				<TD>${element[5]}</TD>
				<td><img class="pic" src="/imageDisplay?id=${element[4]}" height="40"
						width="40"/><img class="picbig" src="/imageDisplay?id=${element[4]}" /></td>
				 <td align="center">  
                        <input type="checkbox" name="checkboxgroup"   
                            value="${element[4]}"/></td>
                            
                 <td> <a href = "<c:url value="/edit/${element[4]}" />" >EDIT</a></td>
			</TR>
		</c:forEach>
	</TABLE>
     <input type="submit" value="Delete Expenses" />
  <h3 class="sansserif">Total Expenditure :$ ${total}</h3>
</form>
<div align="center">
        <h1>Download Excel Format</h1>
        <h3><a href="/downloadExcel">Download Excel Document</a></h3>
    </div>
    
    <h2>Send as Email</h2>
 <form action="/sendEmail" method="post">
 <tr><td>Email ID :   		</td>  <td>       <input type="text" name="email"/>    </td> </tr>
 <tr><td><input type="submit" value="Send Email" /></td></tr>
 </form>
</body>
</html>