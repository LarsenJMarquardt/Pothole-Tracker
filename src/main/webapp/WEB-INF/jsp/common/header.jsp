<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width"/>
    <title>Pothole Tracker</title>

    <c:url value="/css/style.css" var="cssHref"/>
    <link rel="stylesheet" href="${cssHref}">

    <c:url value="/css/bootstrap.min.css" var="bootstrapCSSHref"/>
    <link rel="stylesheet" href="${bootstrapCSSHref}">

    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">

    <script src="https://use.fontawesome.com/b6042e8b1f.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
            integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
            crossorigin="anonymous"></script>

    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
            integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
            crossorigin="anonymous"></script>

    <c:url value="/js" var="jsHref"/>
    <script src="${jsHref}/jquery.min.js"></script>

    <script src="${jsHref}/jquery.validate.min.js"></script>
    <script src="${jsHref}/additional-methods.min.js"></script>
    <!-- BOOTSTRAPPER -->
    <script src="${jsHref}/bootstrap.min.js"></script>
    <script src="${jsHref}/modal.js"></script>


</head>

<body>
<c:url value="/" var="homePageHref"/>
<c:url value="/potholes/allPotholes" var="allPotholesHref"/>
<c:url value="/potholes/report" var="reportHref"/>
<c:url value="/user/login" var="loginHref"/>
<c:url value="/user/new" var="registerHref"/>
<c:url value="/user/logout" var="logoutHref"/>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${homePageHref}">
                <img src="/img/placeholder.png" alt="Pothole Tracker" width="120">
            </a>
        </div>


        <!-- Collect the nav links, forms, and other content for toggling -->

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

                <li class="active">
                    <a href="${homePageHref}">Home</a>
                </li>
                <li>
                    <a href="${allPotholesHref}">Pothole List</a>
                </li>
                <li>
                    <a href="${reportHref}">Report Pothole</a>
                </li>
                <li>
                    <a id="login" href="${loginHref}">Login</a>
                </li>
                <li>
                    <a href="${registerHref}">Register</a>
                </li>
                <li>
                    <a href="${logoutHref}">Logout</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
</body>
</html>
