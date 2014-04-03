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
});