function animateProgressBar($span) {	
	if ($span.data("origWidth")) {
		$span
			.width(0)
			.animate({
				width: $span.data("origWidth")
			}, 1000);
	} else {
		$span
			.data("origWidth", $span.width())
			.width(0)
			.animate({
				width: $span.data("origWidth")
			}, 1000);
	}
}
