$.ajaxSetup({
    'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
}) ;



$(document).ready(function(){
    $("#new_relationship").submit(function(){
        $.post($(this).attr("href"),$(this).serialize(),null,"script");
    })
});