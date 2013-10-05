function selectDates(tours) {
	$('input.destination').on('click', function (event) {
		$(".sign_up_link").addClass("hidden");
		$("#step2").empty();
		$("#step3").empty();
		$("#step2").append("<h3>Select one of the dates available</h3>");
		var chosenDestination = $(event.target).data('destination');
		populateDates(tours, chosenDestination);
		$('input.date').on('click', function (event) {
			var chosenID = $(event.target).data('id');
			var chosenTour = _(tours).filter(function (tour) { return tour.id == chosenID })[0];
			showEntrepreneurs(chosenTour);
			showSignUpLink();
		})
	})
}

function populateDates(tours, destination) {
	var availableTours = _(tours).filter(function (tour) { return tour.location == destination; });
	_(availableTours).each(function (tour) {
		$("#step2").append("<label for='" + tour.date + "'>\
			 " + tour.date + "</label>\
				<input type='radio' class='date' data-id='" + tour.id + "'\
				value='" + tour.id + "'\
				id='" + tour.date + "'\
				name='" + "tour_id" + "'>");
	});
}

function showEntrepreneurs (chosenTour) {
	$("#step3").empty();
	$("#step3").append("<h3>Featured Entrepreneurs for this date</h3>");
	$("#step3").append("<ul class='entrepreneurs'></ul>");
	_(chosenTour.entrepreneurs).each(function (entrepreneur) {
		var fullName = entrepreneur.first_name + " " + entrepreneur.last_name;
		$('ul.entrepreneurs').append("<li><a href='/entrepreneurs/" + entrepreneur.slug + "'\
		target='_new'>" + fullName + "</a></li>")
	})
}

function showSignUpLink() {
	$(".sign_up_link").removeClass("hidden");
}
