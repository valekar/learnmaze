
$(function(){
    $('#delete_post').click(function(){
        $.post($(this).attr("href"),$(this).serialize(),null,"script");
    })
})