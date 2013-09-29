function createLoan(event) {
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