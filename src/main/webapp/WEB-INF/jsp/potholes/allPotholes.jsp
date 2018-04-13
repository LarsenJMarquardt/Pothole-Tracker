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

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                Order by
                <a href="${orderBySeverityLink}">Severity</a> | <a href="${orderByStreetNameLink}">Street Name</a> | <a
                    href="${orderByReportDateLink}">Report Date</a> | <a href="${orderByStatusCodeLink}">Status Code</a>
            </div>
        </div>
    </div>
    
    <div class="allPotholes hidden-xs hidden-sm">
    		<div class="container">
    			<section id="pothole">
    				<div class="row">
    					<div class="col-md-2">
    						<b>Street Name</b>
    					</div>
    					<div class="col-md-10">
    						<div class="row">
	                        	<div class="col-md-2">
	                        		Reported
	                        	</div>
	                        	<div class="col-md-2">
	                        		
	                        	</div>
	                        	<div class="col-md-2">
	                        		Status Code
	                        	</div>
	                        	<div class="col-md-2">
	                        		Status Date
	                        	</div>
	                        	<div class="col-md-2">
	                        		Severity
	                        	</div>
	                     </div>
    					</div>
    				</div>
    			</section>
    		</div>
    </div>
    
    
    <div class="allPotholes">
        <c:forEach items="${allPotholes}" var="pothole">
            <div class="container">
                <section id="pothole" class="hidden-xs hidden-sm">
                    <div class="row">
                    		<div class="col-md-2">
	                        		<p style="font-size: 15px"><b><c:out value="${pothole.streetName}"/></b></p>
	                     </div>
	                        
	                     <div class="col-md-10">
	                        <div class="row">
	                        		<div class="col-md-2">
	                                <%--<c:out value="${pothole.id}"/>--%>
	                            		<p><c:out value="${pothole.reportDate}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                           
		                        </div>
		                        <div class="col-md-2">
		                        		<p><c:out value="${pothole.statusCode}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            <p><c:out value="${pothole.statusDate}"/></p>
		                        </div>
		                        <div class="col-md-2" style="display:flex;justify-content: center">
		                            <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png" />
                            			<img class="severity-img" src="${severityImgLink}" alt="Severity"></p>
		                        </div>
                        		</div>
                        </div>
                    </div>
                    <hr>
                  </section>
                  
                  <section id="pothole" class="hidden-md hidden-s hidden-lg">
                  	<div class="row">
                    		<div class="col-md-2">
	                        		<p style="font-size: 20px"><b><c:out value="${pothole.streetName}"/></b></p>
	                     </div>
	                        
	                     <div class="col-md-10">
	                        <div class="row">
	                        		<div class="col-md-2">
	                                <%--<c:out value="${pothole.id}"/>--%>
	                            		<p><b>Reported: </b><c:out value="${pothole.reportDate}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            
		                        </div>
		                        <div class="col-md-2">
		                        		<p> <b>Status Code: </b><c:out value="${pothole.statusCode}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            <p><b>Status Date: </b> <c:out value="${pothole.statusDate}"/></p>
		                        </div>
		                        <div class="col-md-2" style="display:flex;justify-content: center">
		                            <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png" />
                            			<img class="severity-img" src="${severityImgLink}" alt="Severity"></p>
		                        </div>
                        		</div>
                        </div>
                    </div>
                    <hr>
                  </section>
                   
            </div>

        </c:forEach>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>