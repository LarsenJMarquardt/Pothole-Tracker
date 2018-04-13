<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />


<h1><c:out value="${errorMsg}"/></h1>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />