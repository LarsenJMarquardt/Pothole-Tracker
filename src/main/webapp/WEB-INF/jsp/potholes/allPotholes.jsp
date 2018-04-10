<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id = "allPotholeList">
ALL POTHOLE LIST

    <c:forEach items="${allPotholes}" var="pothole">
        <div id="potHoleCard">
            <c:out value="${pothole.id}"/>
            <c:out value="${pothole.streetName}"/>
            <c:out value="${pothole.latitude}"/>
            <c:out value="${pothole.longitude}"/>
            <c:out value="${pothole.reportDate}"/>
            <c:out value="${pothole.severity}"/>
            <c:out value="${pothole.statusCode}"/>
            <c:out value="${pothole.statusDate}"/>
        </div>
    </c:forEach>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />