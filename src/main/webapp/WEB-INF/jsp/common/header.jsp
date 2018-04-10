<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width"/>
    <title>Pothole Tracker</title>

    <c:url value="/css/style.css" var="cssHref"/>
    <link rel="stylesheet" href="${cssHref}">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">

    <script src="https://use.fontawesome.com/b6042e8b1f.js"></script>

    <c:url value="/js" var="jsHref"/>
    <script src="${jsHref}/jquery.min.js"></script>

    <script src="${jsHref}/jquery.validate.min.js"></script>
    <script src="/additional-methods.min.js"></script>
    <!-- BOOTSTRAPPER -->
    <script src="${jsHref}/bootstrap.min.js"></script>


</head>

<body>
<header>
    <c:url value="/" var="homePageHref" />
    <c:url value="/img/placeholder.png" var="logoSrc" />
    <a href="${homePageHref}">
        <img src="${logoSrc}" alt="Pothole Tracker" />
    </a>
    <h1>Pothole Tracker</h1>
</header>
<nav>
    <ul>
        <c:url value="/usPresidents" var="usPresidentsHref" />

        <c:url value="/user/login" var="loginHref" />
        <c:url value="/user/register" var="registerHref" />
        <c:url value="/user/logout" var="logoutHref" />

        <li><a href="${homePageHref}">Home</a></li>
        <%--<c:choose>--%>
            <%--<c:when test="${empty sessionScope.email}">--%>
                <li class="right-aligned"><a href="${loginHref}">Login</a></li>
                <li class="right-aligned"><a href="${registerHref}">Register</a></li>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<li><a href="${chatHref}">Chat</a></li>--%>
                <%--<li class="right-aligned"><a href="${logoutHref}">Logout</a></li>--%>
          <%----%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
    </ul>
</nav>
</body>
</html>
