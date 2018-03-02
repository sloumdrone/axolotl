//--->>
//--->>
$(document).ready(function () {
    retrieveProfilePosts();
    applyClickHandlers();
    addScrollHandler();
});
//---**
//---**
function applyClickHandlers(){
    let $postBtn = $('#sitelogo');
    let $post = $('section.make-post');

    $postBtn.click(() => {
        $post.toggleClass('show');
    });

    $('.textAreaContainer textarea').on('keyup',function(){
        let length = $(this).val().length
        if (length > 200){
            $(this).val($(this).val().substring(0,200));
            length = 200;
        }
        $('#textCounter').text(`${length}/200`);
    });
}
//---**
//---**
function retrieveProfilePosts(){
    $.ajax({
        url: '/get_profile_posts/'+$('#postsToGrab').text(),
        dataType: 'json',
        method: 'POST',
        data: {
            offset: last_post,
            qty: 10
        },
        success: function(result){
            if (Object.keys(result).length == 0){
                endoffeed = true;
            } else {
                for (let row in result){
                    buildPost(result[row]);
                }
            }

        },
        error: function(result){
            let $container = $('<div>',{class: 'post-container',text: 'An error has occurred'}).css('color','red');
            $('.thread-container').append($container);
        }
    })
}
//---XX
//---XX
