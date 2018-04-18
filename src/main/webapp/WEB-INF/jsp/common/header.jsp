<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width"/>
    <title>Pave Pal</title>

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
    <script src="${jsHref}/script.js"></script>
    <script src="${jsHref}/passwordValidation.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
</head>

<body>
<c:url value="/" var="homePageHref"/>
<c:url value="/potholes/allPotholes" var="allPotholesHref"/>
<c:url value="/potholes/report" var="reportHref"/>
<c:url value="/user/login" var="loginHref"/>
<c:url value="/user/new" var="registerHref"/>
<c:url value="/user/logout" var="logoutHref"/>
<c:url var="logoImgLink" value="/img/logo.png"/>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">

                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand"> <li>
                ${currentUser}
            </li></div>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-left">
                <li class="active">
                    <a href="${homePageHref}">Home</a>
                </li>
                <li>
                    <a href="${allPotholesHref}">Pothole List</a>
                </li>
                <li>
                    <a href="${reportHref}">Report Pothole</a>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right">


                <c:choose>
                    <c:when test="${currentUser != null}">
                        <li>
                            <a href="${logoutHref}">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#registerModal" data-toggle="modal" data-target="#registerModal">Register</a>
                        </li>
                        <li>
                            <a href="#loginModal" data-toggle="modal" data-target="#loginModal">Login</a>
                        </li>

                    </c:otherwise>

                </c:choose>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="container">
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="loginModal" role="dialog">
        <c:url var="formAction" value="/user/login"/>
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding:0px 0px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                </div>
                <div class="modal-body" style="padding:40px 50px;">
                    <form method="POST" action="${formAction}">
                        <div class="form-group">
                            <label for="loginUserName"><span class="glyphicon glyphicon-user"></span> Username</label>
                            <input type="text" id="loginUserName" name="userName" placeHolder="User Name"
                                   class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="loginPassword"><span class="glyphicon glyphicon-eye-open"></span>
                                Password</label>
                            <input type="password" id="loginPassword" name="password" placeHolder="Password"
                                   class="form-control"/>
                        </div>
                        <%--<div class="checkbox">--%>
                        <%--<label><input type="checkbox" value="" checked>Remember me</label>--%>
                        <%--</div>--%>
                        <button type="submit" class="btn btn-warning btn-block"><span
                                class="glyphicon glyphicon-off"></span> Login
                        </button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span
                            class="glyphicon glyphicon-remove"></span> Cancel
                    </button>
                    <p id="registerText">Not a member?
                        <button type="submit" class="btn btn-success btn-default pull-right" data-dismiss="modal"
                                data-toggle="modal" data-target="#registerModal"> Register
                        </button>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="registerModal" role="dialog">
    <c:url var="registerFormAction" value="/user"/>
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4><span class="glyphicon glyphicon-lock"></span> Register</h4>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
                <form method="POST" action="${registerFormAction}" id="form">
                    <div class="form-group">
                        <label for="userName"><span class="glyphicon glyphicon-user"></span> Username</label>
                        <input type="text" id="UserName" name="userName" placeHolder="User Name"
                               class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>

                        <input type="password" id="password" name="password" placeHolder="Password"
                               class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Confirm
                            Password</label>

                        <input type="password" id="confirmPassword" name="confirmPassword"
                               placeHolder="Re-Type Password" class="form-control"/>
                    </div>

                    <%--<div class="checkbox">--%>
                    <%--<label><input type="checkbox" value="" checked>Remember me</label>--%>
                    <%--</div>--%>
                    <button type="submit" class="btn btn-warning btn-block"><span
                            class="glyphicon glyphicon-off"></span> Create User
                    </button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span
                        class="glyphicon glyphicon-remove"></span> Cancel
                </button>
                <%--<p>Not a member? <a href="#">Sign Up</a></p>--%>
                <%--<p>Forgot <a href="#">Password?</a></p>--%>
            </div>
        </div>

    </div>
</div>

