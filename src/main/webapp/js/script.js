
    $(document).ready(function () {

        $("#form").validate({

            rules : {
                userName : {
                    required : true
                },
                password : {
                    required : true,
                    minlength: 10,
                    maxlength: 128,
                    complexPassword: true //change to true later
                },
                confirmPassword : {
                    required : true,
                    equalTo : "#password"
                }
            },
            messages : {
                confirmPassword : {
                    equalTo : "Passwords do not match"
                }
            },
            errorClass : "error"
        });
    });