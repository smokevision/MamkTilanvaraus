$(document).ready(function(){
    //loginruutu
    $("#loginlink").on("click",function(){
        $("#kirjautuminen").fadeIn();
        return false;
    });
    $(document).click(function() {
        $("#kirjautuminen").fadeOut();
    });
    $("#kirjautuminen").click(function(e) {
        e.stopPropagation();
    });
    $("#loginsulje").on("click",function(){
        $("#kirjautuminen").fadeOut();
    })
    
    //datepicker
    $("#datepicker1, #datepicker2").datepicker({
		dateFormat: "dd.mm.yy",
		firstDay: 1,
		dayNamesMin: ["Su", "Ma", "Ti", "Ke", "To", "Pe", "La"],
		monthNames: ["Tammikuu", "Helmikuu", "Maaliskuu", "Huhtikuu", "Toukokuu", "Kesäkuu", "Heinäkuu", "Elokuu", "Syyskuu", "Lokakuu", "Marraskuu", "Joulukuu"]
    });
    
    //tilanavigaatio
    var $frame = $('#valikko_container');
    var $wrap  = $frame.parent();
    $frame.sly({
            horizontal: 1,
            itemNav: 'forceCentered',
            smart: 1,
            activateMiddle: 1,
            activateOn: 'click',
            mouseDragging: 1,
            touchDragging: 1,
            releaseSwing: 1,
            startAt: 3,
            scrollBar: $wrap.find('.scrollbar'),
            scrollBy: 1,
            speed: 300,
            elasticBounds: 1,
            easing: 'swing',
            dragHandle: 1,
            dynamicHandle: 1,
            clickBar: 1
    });
});
$.get("includes/banneri.jsp").done(function(data) {
    if(data.length > 0){
        var url = "url(kuvat/ulkoasu/banneri/"+data+".jpg)";
        $("#banneri").css('background-image', url);  
    }
});