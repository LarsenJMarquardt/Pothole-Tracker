<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<div id="allPotholeList">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">

                <h1>Pothole List</h1>
            </div>
        </div>
    </div>

    <c:url var="orderBySeverityLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="severity"/>
    </c:url>
    <c:url var="orderByStreetNameLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="street_name"/>
    </c:url>
    <c:url var="orderByReportDateLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="report_date"/>
    </c:url>
    <c:url var="orderByStatusCodeLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="status_code"/>
    </c:url>

    <c:url var="orderByStatusCodeLink" value="/potholes/allPotholes">
        <c:param name="orderdirection" value="status_code"/>
    </c:url>

    <c:url var="orderByStatusCodeLink" value="/potholes/allPotholes">
        <c:param name="ascending" value="status_code"/>
    </c:url>

    <div class="container ">
        <div class="row">
            <div class="col-md-12">

                Order by
                <a href="${orderBySeverityLink}">Severity</a> | <a href="${orderByStreetNameLink}">Street Name</a> | <a
                    href="${orderByReportDateLink}">Report Date</a> | <a href="${orderByStatusCodeLink}">Status Code</a>
            </div>
        </div>
    </div>
    <div id="allPotholes">
        <c:forEach items="${allPotholes}" var="pothole">
            <div class="container">
                <section id="pothole">
                    <div class="row">
                        <div class="col-md-4">
                                <%--<c:out value="${pothole.id}"/>--%>
                            <p><b>Report Date: </b><c:out value="${pothole.reportDate}"/></p>
                        </div>
                        <div class="col-md-4">
                            <p><b>Street Name: </b> <c:out value="${pothole.streetName}"/></p>
                        </div>
                        <div class="col-md-4">
                            <p><b>Coords: </b><c:out value="${pothole.longitude}x"/> <c:out value="${pothole.latitude}y"/></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <p><b>Status Date: </b> <c:out value="${pothole.statusDate}"/></p>
                        </div>

                        <div class="col-md-4">
                            <p> <b>Status Code: </b><c:out value="${pothole.statusCode}"/></p>
                        </div>
                        <div class="col-md-4">
                            <p><b>Severity: </b> <c:out value=" ${pothole.severity}"/></p>
                        </div>
                    </div>
                    <hr>
                </section>
            </div>

        </c:forEach>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>