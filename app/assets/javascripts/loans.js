function drawLenders() {
	var $resultsEl = $('ul#results');
	$resultsEl.on('search', function (e) {
		
		$resultsEl.html("");
		var searchResults = $resultsEl.data();
		$resultsEl.removeData();
		
		_(searchResults).each(function(user) {
			var fullName = user.first_name + " " + user.last_name
			var label = "<label for='" + fullName + "'>" + fullName + "</label>";
			var radio = "<input type='radio' name=loan[lender_id] id='" + fullName + "' value='" + user.id + "'>";
			
			$resultsEl.append("<li>" + label + radio + "</li>");
		})
	});
}


function recordLoan(event) {
	event.preventDefault();
	
	if ($("#principal").val() == "") {
		$("#principal").effect("highlight", {}, 1000);
		return;
	}
	
	var $radios = $("input[type='radio']");
	
	var userSelected = _($radios).some(function (radio) {
		return $(radio).is(':checked');
	});
	
	if (!userSelected) {
		$("#lender").effect("highlight", {}, 1000);
		return;
	}
	
	var loanAttrs = $('form').serializeJSON();
	$.ajax({
		url: "/loans.json",
		method: 'POST',
		data: loanAttrs,
		success: function (data) {
			window.location.href="#"
			location.reload();
		},
		error: function (jqXHR, description, exception) {
			$('div.errors').html("Something went wrong. Refresh and try again.");
		}
	})
}