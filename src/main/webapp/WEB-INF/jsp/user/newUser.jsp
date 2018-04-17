<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />




<c:url var="formAction" value="/user" />
<form method="POST" action="${formAction}" id ="form">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="userNameT">User Name: </label>
                <input type="text" id="userNameT" name="userNameT" placeHolder="User Name" class="form-control" />
            </div>
            <div class="form-group">
                <label for="passwordT">Password: </label>
                <input type="password" id="passwordT" name="passwordT" placeHolder="Password" class="form-control" />
            </div>
            <div class="form-group">
                <label for="confirmPasswordT">Confirm Password: </label>
                <input type="password" id="confirmPasswordT" name="confirmPasswordT" placeHolder="Re-Type Password" class="form-control" />
            </div>
            <button type="submit" class="btn btn-primary">Create User</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
