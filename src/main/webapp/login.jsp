<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Log in with your account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <style>
       body {
        font-family: 'Open Sans', sans-serif;
        background-color: #33FF3F;
        background-image: linear-gradient(135deg, #34db4d, #8e44ad);
        background-size: cover;
        background-position: center;
        height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

        .container {
        max-width: 400px;
        width: 100%;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

        .form-signin {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-signin-heading {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-control {
            width: 100%;
            height: 45px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #4CAF50;
            outline: 0;
        }

        .btn-primary {
            background-color: #4CAF50;
            border: 1px solid #4CAF50;
            color: #fff;
            border-radius: 8px;
            height: 45px;
            transition: background-color 0.3s;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background-color: #45a049;
            border-color: #45a049;
        }

        .error-message {
            color: #d9534f;
            margin-top: 5px;
        }

        .create-account-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        .create-account-link a {
            color: #4CAF50;
            font-weight: bold;
            text-decoration: none;
        }

        .create-account-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-signin-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username" autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
            <div class="create-account-link">
                <span>Don't have an account? </span>
                <a href="${contextPath}/registration">Create one</a>
            </div>
        </div>

    </form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
 