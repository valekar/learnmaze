$.ajaxSetup({
    'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
})


$(function(){
    $('#new_registration').submit(function(){
        $.post($(this).attr("action"),$(this).serialize(),null,"script");
        return false;
    })
})


$("#follow").text("hello wolrd")