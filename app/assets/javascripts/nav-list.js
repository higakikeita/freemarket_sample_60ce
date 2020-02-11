$(function() {
	$(".header__contents__below__search__category").hover(function() {
    $("ul.level1").toggle();
  });
	$(".header__contents__below__search__category li ul").hide();
	$(".header__contents__below__search__category li").hover(function() {
    $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
		$(">a", this).addClass("active");
	},
	function() {
		$(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
    $(">a", this).removeClass("active");
  });
});