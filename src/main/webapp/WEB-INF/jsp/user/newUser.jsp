<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />



<c:url var="pwValidator" value="/js/passwordValidation.js" />
<script src="${pwValidator}"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $("form").validate({

            rules : {
                userNameT : {
                    required : true
                },
                passwordT : {
                    required : true,
                    minlength: 5,
                    maxlength: 128,
                    complexPassword: false //change to true later
                },
                confirmPasswordT : {
                    required : true,
                    equalTo : "#password"
                }
            },
            messages : {
                confirmPasswordT : {
                    equalTo : "Passwords do not match"
                }
            },
            errorClass : "error"
        });
    });
</script>

<c:url var="formAction" value="/user" />
<form method="POST" action="${formAction}">
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
