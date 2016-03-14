//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require tether
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function () {
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
$(document).ready(function () {
    // Configure/customize these variables.
    var showChar = 0;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Details >";
    var lesstext = "Hide details";

    $(".morelink").click(function () {
        if ($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            var food_id = $(this).attr("id").substr($(this).attr("id").indexOf("-")+1, $(this).attr("id").length -1);
            var current_view_no = $("#view-" + food_id).html();
            var new_no = parseInt(current_view_no) + 1;
            $("#view-" + food_id).html(new_no);
            $(this).addClass("less");
            $(this).html(lesstext);
        }

        $(this).parent().prev().toggle();
        $(this).prev().toggle();
    });
})
