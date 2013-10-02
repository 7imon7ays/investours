function alignNavBarDropDown () {
	var parentPosition = $(".dropdown-toggle").position().left;
	$('.dropdown').css("left", parentPosition);
};