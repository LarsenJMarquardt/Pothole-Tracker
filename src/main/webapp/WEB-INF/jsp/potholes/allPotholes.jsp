<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<div id="allPotholeList">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <h1>ALL POTHOLE LIST</h1>
            </div>
        </div>
    </div>
    <c:forEach items="${allPotholes}" var="pothole">
        <div class="container">
            <section id="pothole">
                <div class="row">
                    <div class="col-md-4">
                            <%--<c:out value="${pothole.id}"/>--%>
                        <c:out value="Report Date: ${pothole.reportDate}"/>
                    </div>
                    <div class="col-md-4">
                        <c:out value="Street Name: ${pothole.streetName}"/>
                    </div>
                    <div class="col-md-4">
                        <c:out value="Coords: ${pothole.longitude}x" /> <c:out value="${pothole.latitude}y"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <c:out value="Status Date: ${pothole.statusDate}"/>
                    </div>

                    <div class="col-md-4">
                        <c:out value="Status Code: ${pothole.statusCode}"/>
                    </div>
                    <div class="col-md-4">
                        <c:out value="Severity: ${pothole.severity}"/>
                    </div>
                </div>
                <hr>
            </section>
        </div>

    </c:forEach>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>