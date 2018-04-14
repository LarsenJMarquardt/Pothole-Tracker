$(function() {
    $('li').click(function() {
        $(".nav").find(".active").removeClass("active");
        $(this).addClass("active");
    });
});