$.ajaxSetup({
    'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
})


$(function(){
    $('#new_micropost').submit(function(){
        $.post($(this).attr("action"),$(this).serialize(),null,"script");
        return false;
    })
})



/*$(function(){
    $('.delete_post').click(function(){
        $.ajax({
            url: "/micropost/",
            type: 'DELETE',
            success: function(result) {
                // Do something with the result
            }
        });
    })
})*/

