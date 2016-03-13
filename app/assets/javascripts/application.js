//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).on('turbolinks:load', function() {
    $('.grid').masonry({
        // options...
        itemSelector: '.grid-item',
        columnWidth: 300
    });

    //$('.nav-link').click(function(e){
    //    var tabNum = $(this).index();
    //    alert(tabNum);
    //    if (!$(this).hasClass("active")) {
    //        var tabNum = $(this).index();
    //        alert(tabNum);
    //        var nthChild = tabNum+1;
    //        $(".panel.active").removeClass("active");
    //        $(this).addClass("active");
    //        $(".panel.active").removeClass("active");
    //        $(".panel:nth-child("+nthChild+")").addClass("active");
    //    }
    //});
});
