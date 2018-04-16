<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id = "report">


    <c:url var="reportHref" value="/potholes/report"/>
    
    <form method="POST" action="${reportHref}" >
    		<div class="row">
    			<div class="col-sm-4"></div>
    			<div class="col-sm-4">
    				<div class="form-group">
    					<label for="streetName">Street Name:</label>
    					<input type="text" name="streetName" id="streetName" placeHolder="e.g. Brian St" class="form-control" />
    				</div>
    				<div class="form-group">
    					<label for="latitude">Latitude:</label>
    					<input type="text" name="latitude" id="latitude" placeHolder="Latitude" class="form-control" />
    				</div>
    				<div class="form-group">
    					<label for="longitude">Longitude:</label>
    					<input type="text" name="longitude" id="longitude" placeHolder="Longitude" class="form-control" />
    				</div>
    				<button type="submit" class="btn btn-warning">Report Pothole</button>
    			</div>
    				
    				
    				
    				<div class="col-sm-4"></div>
    			</div>
    </form>
    

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />