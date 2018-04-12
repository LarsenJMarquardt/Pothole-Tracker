$(document).ready(function() {
	
	$.validator.addMethod("complexPassword", function(value) {
		
		var rulesPassed = 0;
		
		if ( /[A-Z]/.test(value) ) {
			rulesPassed++;

		}
		if ( /[a-z]/.test(value) ) {
			rulesPassed++;
		}
		if ( /[0-9]/.test(value) ) {
			rulesPassed++;
		}

		if ( /[^A-Za-z0-9]/.test(value) ) {
			rulesPassed++;
		}
		
		return rulesPassed >= 3;
		
		
	}, "Password is not complex enough.");
	

});