$(".nav > li").on("click", function(){
    $(".nav > li").find(".active").removeClass("active");
    $(this).addClass("active");
});