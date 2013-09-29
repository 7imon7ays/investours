function recordPayment(event) {
	event.preventDefault();
	
	if ($("#amount").val() == "") {
		$("#amount").effect("highlight", {}, 1000);
		return;
	}
	
	var paymentAttrs = $('form').serializeJSON();
	$.ajax({
		url: "/payments.json",
		method: 'POST',
		data: paymentAttrs,
		success: function (data) {
			window.location.href="#"
			location.reload();
		},
		error: function (jqXHR, description, exception) {
			$('div.errors').html("Something went wrong. Refresh and try again.");
		}
	})
}