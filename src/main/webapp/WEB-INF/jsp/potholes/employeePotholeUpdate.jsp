<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>
<c:url value="/js" var="jsHref"/>
<script src="${jsHref}/delete.js"></script>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h1>Employee Dashboard</h1>
        </div>
    </div>

    <div class="updatePothole">
        <div class="container innerUpdate">

            <c:url var="potholeUpdateLink" value="/potholes/employeePotholeUpdate"/>

            <div class="row">
                <div class="col-xs-4">
                    <b>Pothole Id: </b>
                </div>
                <div class="col-xs-8">
                    <c:out value="${pothole.id}"/>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <b>Street Name: </b>
                </div>
                <div class="col-xs-8">
                    <c:out value="${pothole.streetName}"/>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <b>Reported: </b>
                </div>
                <div class="col-xs-8">
                    <c:out value="${pothole.reportDate}"/>
                </div>
            </div>

            <form method="POST" action="${potholeUpdateLink}">
                <input type="hidden" name="potholeId" value="${pothole.id}">
                <div class="row">
                    <div class="col-xs-4">
                        <label for="severity">Pothole Severity:</label>
                    </div>
                    <div class="col-xs-8">
                        <select name="severity">
                            <option value="${pothole.severity}">current: <c:out value="${pothole.severity}"/></option>
                            <option value=1>1</option>
                            <option value=2>2</option>
                            <option value=3>3</option>
                            <option value=4>4</option>
                            <option value=5>5</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        <label for="statusCode">Status Code:</label>
                    </div>
                    <div class="col-xs-8">
                        <select name="statusCode">
                            <option value="${pothole.statusCode}">current: <c:out
                                    value="${pothole.statusCode}"/></option>
                            <option value="reported">Reported</option>
                            <option value="inspected">Inspected</option>
                            <option value="repaired">Repaired</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        <label for="statusDate">Status Date:</label>
                    </div>
                    <div class="col-xs-8">
                        <input id="date" type="date" name="statusDate" value="${pothole.statusDate}">
                    </div>
                </div>
                <br>
                <button type="submit" class="btn btn-warning">Update Pothole</button>
            </form>

            <c:url var="potholeDeleteLink" value="/potholes/deletePothole"/>
            <form id="deleteForm" method="POST" action="${potholeDeleteLink}">
                <input type="hidden" name="potholeId" value="${pothole.id}">
                <button id="deletePothole" type="submit" class="btn btn-danger">Delete Pothole</button>
                <p id="demo"></p>
            </form>

        </div>
    </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>