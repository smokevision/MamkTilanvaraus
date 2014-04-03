$(document).ready(function(){
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