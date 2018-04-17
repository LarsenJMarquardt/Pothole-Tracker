<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" isErrorPage="true" %>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%> --%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid">
	<h1><c:out value="${errorMsg}"/></h1>
		<div class="row">
			<div class="col-md-12" style="display: flex; justify-content: center">
				<c:url var="ImgLink" value="/img/404.png" />
				<img src="${ImgLink}" alt="Dino Eating Phil" style="max-height: 200px">
			</div>
		</div>
	
	
</div>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />