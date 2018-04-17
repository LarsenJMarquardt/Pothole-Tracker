$(document).ready(function () {
	$("#deleteForm").on("submit", function(event) {
	
		var txt;
		
		if(confirm("Are you sure you want to delete this Pothole?")) {
			txt = "POTHOLE MURDERER!!!!";
		} else {
			event.preventDefault();
			event.stopImmediatePropagation();
			txt = "Pothole not Deleted";
			return false;
		}
		document.getElementById("demo").innerHTML = txt;
	});
});