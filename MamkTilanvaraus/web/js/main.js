$(document).ready(function(){
    $("#loginlink").on("click",function(){
        $("#kirjautuminen").show();
        return false;
    });
    $(document).click(function() {
        $("#kirjautuminen").hide();
    });
    $("#kirjautuminen").click(function(e) {
        e.stopPropagation();
    });
});