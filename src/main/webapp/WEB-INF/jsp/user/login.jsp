<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>


<script type="text/javascript">
    $(document).ready(function () {

        $("#loginForm").validate({

            rules: {
                userName: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                confirmPassword: {
                    equalTo: "Passwords do not match"
                }
            },
            errorClass: "error"
        });
    });
</script>




<div class="updatePothole" style="text-align: center">


	<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<p style="color: red">Please login.</p>
				</div>
			</div>
			
				<div class="col-md-12">

				<c:url var="formAction" value="/user/login" />
				<form id="loginForm" method="POST" action="${formAction}">
					<div class="form-group">
						<label for="userName">User Name: </label> <input type="text"
							id="userName" name="userName" placeHolder="User Name"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Password: </label> <input type="password"
							id="password" name="password" placeHolder="Password"
							class="form-control" />
					</div>
					<button type="submit" class="btn btn-warning">Login</button>
				</form>
			</div>
			
		</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
