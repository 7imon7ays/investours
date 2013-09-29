function animateProgressBar($span) {
	$span
		.data("origWidth", $span.width())
		.width(0)
		.animate({
			width: $span.data("origWidth")
		}, 1200);
}